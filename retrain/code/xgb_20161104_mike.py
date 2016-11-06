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
    params['scale_pos_weight'] = 2
    params['eval_metric'] = "auc"
    params['verbose'] = 10
    params['silent'] = True
    params['seed'] = 2016


    tr_feather_set1 = pd.read_csv('../input/train_eng.csv')
    te_feather_set1 = pd.read_csv('../input/test_eng.csv')
    extra_feature = pd.read_csv('../input/lead_lag_data.csv')
    extra_columns = np.setdiff1d(extra_feature.columns,tr_feather_set1.columns )
    extra_columns = extra_columns.tolist() + ['Id']
    tr_feather_set1 = tr_feather_set1.merge(extra_feature[extra_columns],on = 'Id')
    te_feather_set1 = te_feather_set1.merge(extra_feature[extra_columns], on='Id')

    #train_numeric = feather.read_dataframe('../input/train_numeric_sparse.feather')
    #test_numeric = feather.read_dataframe('../input/test_numeric_sparse.feather')
    #train_numeric.drop('Response',axis = 1,inplace = True)
    #test_numeric.drop('Response',axis = 1, inplace=True)
    #train_numeric.drop('Id',axis = 1, inplace = True)
    #test_numeric.drop('Id', axis = 1,inplace=True)
    #train_date = feather.read_dataframe('../input/train_date_sparse.feather')
    #test_date = feather.read_dataframe('../input/test_date_sparse.feather')
    #train = pd.concat([tr_feather_set1,],axis = 1)
    #test = pd.concat([te_feather_set1], axis=1)
    import gc
    gc.collect()

    train = tr_feather_set1
    test = te_feather_set1




    features = list(train.columns)
    #features.remove("Y")
    features.remove("Id")
    features.remove("Response")
    features.remove("cluster_n500")
    features.remove("unique_path")

    train.rename(columns = {'Response':'Y'},inplace = True)
    # features.remove("Id")
    # features.remove("Id")
    # features.remove("Response")
    # features.remove("V6")
    # features.remove("V5")

    train = train[features]
    test = test[features]
    feather.write_dataframe(train,'../input/tr_mike.feather')
    feather.write_dataframe(test, '../input/te_mike.feather')


    xgb_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    xgb_result_set1.columns = ['actual', 'pred']
    xgb_result_set1_test = pd.DataFrame(np.zeros((test.shape[0], 1)))

    rf_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    rf_result_set1.columns = ['actual','pred']
    rf_result_set1_test = pd.DataFrame(np.zeros((test.shape[0], 1)))


    final_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    final_result_set1.columns = ['actual','pred']

    feature_importance = pd.DataFrame()

    threshold1 = 0
    threshold2 = 0
    threshold3 = 0
    batch_size = 128

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
        clf_xgb = xgb.train(params, dtr, num_boost_round=500, evals=watchlist, verbose_eval=10,
                            early_stopping_rounds=50)
        xgb_pred = clf_xgb.predict(dvalid)
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values, xgb_pred, True)
        print('xgb mcc:', best_mcc)
        print("the auc is", (roc_auc_score(y_valid, xgb_pred)))
        calc_accuracy(xgb_pred, y_valid, best_proba)
        print("the best threshold is {},and the total predicted positive is {},the total number of positives are {}".format(best_proba, sum(y_pred),sum(y_valid)))
        threshold1 += best_proba

        xgb_result_set1.ix[te_index['x'], 'pred'] = xgb_pred
        xgb_result_set1.ix[te_index['x'], 'actual'] = y_valid.values
        xgb_result_set1_test.ix[:, 0] += clf_xgb.predict(dtest)

        X_train.fillna(-9999,inplace = True)
        X_valid.fillna(-9999, inplace=True)
        clf_rf = RandomForestClassifier(max_depth=10, n_estimators=200, random_state=2015, n_jobs=-1)
        clf_rf.fit(X_train, y_train)
        rf_pred = clf_rf.predict_proba(X_valid)[:,1]
        print("the auc is",(roc_auc_score(y_valid,rf_pred)))
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,rf_pred,True)
        print('rf mcc:', best_mcc)
        print("the best threshold is",best_proba)
        threshold2 += best_proba
        rf_result_set1_test.ix[:, 0] += clf_rf.predict_proba(test[features])[:,1]

        final = rf_pred * 0.5 + xgb_pred*0.5
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,final,True)
        print('final mcc:', best_mcc)
        print("the auc is", (roc_auc_score(y_valid, final)))
        print("the best threshold is",best_proba)

        #final2 = rf_pred * 0.25 + xgb_pred*0.25 + nn_pred*0.5
        #best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,final2,True)
        #print('final xgb nn rf mcc:', best_mcc)
        #print("the best threshold is",best_proba)

        threshold3 += best_proba
        rf_result_set1.ix[te_index['x'], 'pred'] = rf_pred
        rf_result_set1.ix[te_index['x'], 'actual'] = y_valid.values

        final_result_set1.ix[te_index['x'], 'pred'] = final
        final_result_set1.ix[te_index['x'], 'actual'] = final
        #final_result_set2.ix[te_index['x'], 'pred'] = final2
        #final_result_set2.ix[te_index['x'], 'actual'] = final2
        imp = get_importance(clf_xgb, features)
        df = pd.DataFrame.from_records(imp)
        feature_importance = feature_importance.append(df)


    threshold3 = threshold3 / 5
    threshold1 = threshold1 / 5
    threshold2 = threshold2 / 5

    xgb_result_set1_test = xgb_result_set1_test/float(5)
    rf_result_set1_test = rf_result_set1_test/float(5)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, xgb_result_set1['pred'], True)
    print("the xgb:",best_mcc)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, rf_result_set1['pred'], True)
    print("the rf:",best_mcc)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, final_result_set1['pred'], True)
    print("the xgb,rf:",best_mcc)

    xgb_result_set1.to_csv('../pushing/level1_train_20161104_feature_set4.csv',index = False)
    xgb_result_set1_test.to_csv('../pushing/level1_test_20161104_feature_set4.csv', index=False)
    feature_importance.columns = ['feature','score']
    a = feature_importance.groupby('feature')['score'].sum()
    a.sort(ascending = False)
    a= a.reset_index()
    a.to_csv('../log/mike_xgb_20161104_importance.csv',index =False)

    #the xgb: 0.454820517003
    #the rf: 0.418200785656
    #the xgb, rf: 0.455850191208
    for i in range(1, 6):
        print("this is fold", str(i))
        te_index = pd.read_csv('../input/folds0' + str(i) + '.csv')
        te_index['x'] = te_index['x'].values - 1
        print(xgb_result_set1.ix[te_index['x'].values,'pred'].mean())
        #print(rf_result_set1.ix[te_index['x'].values, 'pred'].mean())




    clf_xgb = xgb.train(params, dtrain, num_boost_round=40)
    test_xgb = clf_xgb.predict(dtest)

    clf_rf = RandomForestClassifier(max_depth=10, n_estimators=230, random_state=2015, n_jobs=-1)
    train.fillna(-9999, inplace=True)
    test.fillna(-9999, inplace=True)
    clf_rf.fit(train[features], train.Y)
    test_rf = clf_rf.predict_proba(test[features])[:, 1]

    xgb_result_set1_test.columns = ['pred']
    xgb_result_set1_test['pred'] = test_xgb
    xgb_result_set1_test.to_csv('../stacking_new/level1_test_20161029_feature_set7.csv',index = False)
    rf_result_set1_test.columns = ['pred']
    rf_result_set1_test['pred'] = test_rf
    rf_result_set1_test.to_csv('../stacking_new/level1_test_20161029_feature_set8.csv',index = False)





