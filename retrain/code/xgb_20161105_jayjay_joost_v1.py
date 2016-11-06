import gc
import numpy as np
import pandas as pd
import xgboost as xgb
from sklearn.cross_validation import StratifiedKFold
from sklearn.metrics import matthews_corrcoef
from operator import itemgetter
import feather
from keras.preprocessing import sequence
from keras.callbacks import ModelCheckpoint, Callback
from keras import backend as K
from keras.layers import Input, Embedding, LSTM, Dense, Flatten, Dropout, merge, Convolution1D, MaxPooling1D, Lambda, \
    AveragePooling1D
from keras.layers.normalization import BatchNormalization
from keras.optimizers import SGD
from keras.layers.advanced_activations import PReLU, LeakyReLU, ELU, SReLU
from keras.models import Model
from keras.preprocessing import sequence
from keras.callbacks import ModelCheckpoint, EarlyStopping
from keras import backend as K
from keras.layers import Input, Embedding, LSTM, Dense, Flatten, Dropout, merge, Convolution1D, MaxPooling1D, Lambda
from keras.layers.normalization import BatchNormalization
from keras.optimizers import SGD, Nadam
from keras.layers.advanced_activations import PReLU, LeakyReLU, ELU, SReLU
from keras.optimizers import Adagrad, SGD, Adadelta
from keras.models import Model
from sklearn.ensemble import RandomForestClassifier, ExtraTreesClassifier
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation
from keras.wrappers.scikit_learn import KerasClassifier
from keras.utils import np_utils
from sklearn.metrics import log_loss, roc_auc_score

pd.set_option('display.max_columns', 500)
pd.set_option('display.max_rows', 400)
pd.set_option('display.width', 200)

class AucCallback(Callback):  # inherits from Callback

    def __init__(self, validation_data=(), patience=25, is_regression=True, best_model_name='best_keras.mdl',
                 feval='roc_auc_score', batch_size=1024 * 8):
        super(Callback, self).__init__()

        self.patience = patience
        self.X_val, self.y_val = validation_data  # tuple of validation X and y
        self.best = -np.inf
        self.wait = 0  # counter for patience
        self.best_model = None
        self.best_model_name = best_model_name
        self.is_regression = is_regression
        self.y_val = self.y_val  # .astype(np.int)
        self.feval = feval
        self.batch_size = batch_size

    def on_epoch_end(self, epoch, logs={}):
        p = self.model.predict_proba(self.X_val, batch_size=self.batch_size, verbose=0).ravel()
        if self.feval == 'roc_auc_score':
            current = roc_auc_score(self.y_val, p)
            print('Epoch %d Auc: %f\n' % (epoch, current))
            best_proba, best_mcc, y_pred = eval_mcc(self.y_val,p,True)
            print('Epoch %d Mcc: %f\n' % (epoch, best_mcc))




def mcc(tp, tn, fp, fn):
    sup = tp * tn - fp * fn
    inf = (tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)
    if inf == 0:
        return 0
    else:
        return sup / np.sqrt(inf)


def eval_mcc(y_true, y_prob, show=False):
    idx = np.argsort(y_prob)
    y_true_sort = y_true[idx]
    n = y_true.shape[0]
    nump = 1.0 * np.sum(y_true)  # number of positive
    numn = n - nump  # number of negative
    tp = nump
    tn = 0.0
    fp = numn
    fn = 0.0
    best_mcc = 0.0
    best_id = -1
    mccs = np.zeros(n)
    for i in range(n):
        if y_true_sort[i] == 1:
            tp -= 1.0
            fn += 1.0
        else:
            fp -= 1.0
            tn += 1.0
        new_mcc = mcc(tp, tn, fp, fn)
        mccs[i] = new_mcc
        if new_mcc >= best_mcc:
            best_mcc = new_mcc
            best_id = i
    if show:
        best_proba = y_prob[idx[best_id]]
        y_pred = (y_prob > best_proba).astype(int)
        return best_proba, best_mcc, y_pred
    else:
        return best_mcc


def mcc_eval(y_prob, dtrain):
    y_true = dtrain.get_label()
    best_mcc = eval_mcc(y_true, y_prob)
    return 'MCC', best_mcc


def create_feature_map(features):
    outfile = open('xgb.fmap', 'w')
    for i, feat in enumerate(features):
        outfile.write('{0}\t{1}\tq\n'.format(i, feat))
    outfile.close()


def get_importance(gbm, features):
    create_feature_map(features)
    importance = gbm.get_fscore(fmap='xgb.fmap')
    importance = sorted(importance.items(), key=itemgetter(1), reverse=True)
    return importance

def nn_baseline_model1(X_train):
    # create model
    nadam = Nadam(lr=1e-4)
    model = Sequential()
    model.add(Dense(100, input_dim=X_train.shape[1], init='glorot_normal'))
    model.add(PReLU())
    #model.add(Dropout(0.5))
    #model.add(Dense(100, init='normal'))
    #model.add(PReLU())
    model.add(Dropout(0.5))
    model.add(Dense(1, init='normal', activation='sigmoid'))
    # Compile model
    model.compile(loss='binary_crossentropy', optimizer=nadam)  #logloss
    #model.compile(loss='binary_crossentropy', optimizer=nadam)  # logloss
    return model

def calc_accuracy(pred,actual,threshold):
    temp = (pred>threshold).astype(int)
    tp = sum(actual[temp==1])
    fp =sum(temp) - tp
    print("the true positive is ",tp)
    print("the false positive is ", fp)
    print("the accuracy rate is ", tp/(tp+fp))
    print("the mcc is",matthews_corrcoef(actual,temp))

if __name__ == "__main__":

    params = {}
    params['objective'] = "binary:logistic"
    params['eta'] = 0.021
    params['max_depth'] = 7
    params['colsample_bytree'] = 0.82
    params['min_child_weight'] = 3
    params['base_score'] = 0.005
    params['scale_pos_weight'] = 1
    params['eval_metric'] = "auc"
    params['verbose'] = 10
    params['silent'] = True
    params['seed'] = 2016


    train = feather.read_dataframe('../input/joost_jay/train_joost.feather')
    test = feather.read_dataframe('../input/joost_jay/test_joost.feather')
    Y = feather.read_dataframe('../input/Y.feather')
    train['Y'] = Y

    import gc
    gc.collect()

    features = list(train.columns)
    features.remove("Y")
    features.remove("tdeltadevrel_block1a")

    xgb_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    xgb_result_set1.columns = ['actual', 'pred']
    xgb_result_set1_test = pd.DataFrame(np.zeros((test.shape[0], 1)))

    rf_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    rf_result_set1.columns = ['actual','pred']
    rf_result_set1_test = pd.DataFrame(np.zeros((test.shape[0], 1)))


    final_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    final_result_set1.columns = ['actual','pred']

    threshold1 = 0
    threshold2 = 0
    threshold3 = 0
    batch_size = 128

    feature_importance = pd.DataFrame()

    dtrain = xgb.DMatrix(train[features], train.Y, silent=True)
    dtest = xgb.DMatrix(test[features], silent=True)
    test.fillna(-9999,inplace = True)

    for i in range(1, 6):
        print("this is fold", str(i))
        te_index = pd.read_csv('../input/folds0' + str(i) + '.csv')
        te_index['x'] = te_index['x'].values - 1
        X_train = train.ix[~train.index.isin(te_index['x'].values), features].reset_index(drop=True)
        y_train = train.Y[~train.index.isin(te_index['x'].values)].reset_index(drop=True)
        X_valid = train.ix[te_index['x'].values, features].reset_index(drop=True)
        y_valid = train.Y[te_index['x'].values].reset_index(drop=True)

        dtr = xgb.DMatrix(X_train, label=y_train)
        dvalid = xgb.DMatrix(X_valid, label=y_valid)
        watchlist = [(dtr, 'train'), (dvalid, 'val')]
        clf_xgb = xgb.train(params, dtr, num_boost_round=800, evals=watchlist, verbose_eval=10,
                            early_stopping_rounds=100)
        xgb_pred = clf_xgb.predict(dvalid,ntree_limit=clf_xgb.best_ntree_limit)
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values, xgb_pred, True)
        print("the auc is", (roc_auc_score(y_valid, xgb_pred)))
        print('xgb mcc:', best_mcc)
        print("the best threshold is {},and the total positive is {}".format(best_proba, sum(y_pred)))
        calc_accuracy(xgb_pred, y_valid, best_proba)
        threshold1 += best_proba
        imp = get_importance(clf_xgb, features)
        df = pd.DataFrame.from_records(imp)
        feature_importance = feature_importance.append(df)

        xgb_result_set1.ix[te_index['x'], 'pred'] = xgb_pred
        xgb_result_set1.ix[te_index['x'], 'actual'] = y_valid.values
        xgb_result_set1_test.ix[:, 0] += clf_xgb.predict(dtest,ntree_limit=(clf_xgb.best_ntree_limit+50))

        X_train.fillna(-9999,inplace = True)
        X_valid.fillna(-9999, inplace=True)
        clf_rf = RandomForestClassifier(max_depth=10, n_estimators=200, random_state=2015, n_jobs=-1)
        clf_rf.fit(X_train, y_train)
        rf_pred = clf_rf.predict_proba(X_valid)[:,1]
        print("the auc is",(roc_auc_score(y_valid,rf_pred)))
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,rf_pred,True)
        print('rf mcc:', best_mcc)
        print("the best threshold is {},and the total positive is {}".format(best_proba,sum(y_pred)))
        calc_accuracy(rf_pred, y_valid, best_proba)
        threshold2 += best_proba
        y_rf = y_pred
        rf_result_set1_test.ix[:, 0] += clf_rf.predict_proba(test[features])[:,1]

        final = rf_pred * 0.3 + xgb_pred*0.7
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,final,True)
        print('final mcc:', best_mcc)
        print("the auc is", (roc_auc_score(y_valid, final)))
        calc_accuracy(final, y_valid, best_proba)
        print("the best threshold is {},and the total positive is {}".format(best_proba, sum(y_pred)))
        threshold3 += best_proba
        rf_result_set1.ix[te_index['x'], 'pred'] = rf_pred
        rf_result_set1.ix[te_index['x'], 'actual'] = y_valid.values

        final_result_set1.ix[te_index['x'], 'pred'] = final
        final_result_set1.ix[te_index['x'], 'actual'] = final
        #final_result_set2.ix[te_index['x'], 'pred'] = final2
        #final_result_set2.ix[te_index['x'], 'actual'] = final2
        imp = get_importance(clf_xgb, features)
        print(imp[1:50])
        break

        df = pd.DataFrame()
        df['xgb_pred'] = xgb_pred
        df['rf_pred'] = rf_pred
        df['rf_y'] = y_rf
        df['xgb_y'] = y_xgb
        df['actual'] = y_valid
        df.sort('xgb_pred', inplace=True, ascending=False)
        df['y'] = df['xgb_y'].values

        a = df.ix[df['y'] == 0,]
        df.ix[df['y'] == 0, 'y'] = df.ix[df['y'] == 0, 'rf_y']
        matthews_corrcoef(df['actual'].values, df['y'].values)
        sum(df['y'])

    feature_importance.columns = ['feature', 'score']
    a = feature_importance.groupby('feature')['score'].sum()
    a.sort(ascending=False)
    a = a.reset_index()
    a.to_csv('../log/joost_jay_v1_xgb_20161105_importance.csv', index=False)

    threshold3 = threshold3 / 5
    threshold1 = threshold1 / 5
    threshold2 = threshold2 / 5

    xgb_result_set1_test = xgb_result_set1_test/float(5)
    rf_result_set1_test = rf_result_set1_test/float(5)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, xgb_result_set1['pred'], True)
    print("the xgb:",best_mcc,sum(y_pred))
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, rf_result_set1['pred'], True)
    print("the rf:",best_mcc,sum(y_pred))
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, final_result_set1['pred'], True)
    print("the xgb,rf:",best_mcc,sum(y_pred))



    xgb_result_set1.to_csv('../pushing/level1_train_20161105_feature_set8.csv',index = False)
    xgb_result_set1_test.to_csv('../pushing/level1_test_20161105_feature_set8.csv',index = False)

    #rf_result_set1.to_csv('../stacking_new/level1_train_20161029_feature_set1.csv',index = False)

    #the xgb: 0.454820517003
    #the rf: 0.418200785656
    #the xgb, rf: 0.455850191208

    dtrain = xgb.DMatrix(train[features], train.Y, silent=True)
    dtest = xgb.DMatrix(test[features], silent=True)


    clf_xgb = xgb.train(params, dtrain, num_boost_round=80)
    test_xgb = clf_xgb.predict(dtest)

    test.fillna(-9999,inplace = True)
    clf_rf = RandomForestClassifier(max_depth=10, n_estimators=230, random_state=2015, n_jobs=-1)
    train.fillna(-9999, inplace=True)
    test.fillna(-9999, inplace=True)
    clf_rf.fit(train[features], train.Y)
    test_rf = clf_rf.predict_proba(test[features])[:, 1]

    xgb_result_set1_test.columns = ['pred']
    xgb_result_set1_test['pred'] = test_xgb
    xgb_result_set1_test.to_csv('../pushing/level1_test_20161105_feature_set8.csv',index = False)
    rf_result_set1_test.columns = ['pred']
    rf_result_set1_test['pred'] = test_rf
    rf_result_set1_test.to_csv('../stacking_new/level1_test_20161029_feature_set10.csv',index = False)





