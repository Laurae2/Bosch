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





if __name__ == "__main__":

    params = {}
    params['objective'] = "binary:logistic"
    params['eta'] = 0.05
    params['max_depth'] = 10
    params['colsample_bytree'] = 0.7
    # params['min_child_weight'] = 3
    params['subsample'] = 0.8
    params['base_score'] = 0.005
    params['eval_metric'] = "auc"
    params['verbose'] = 10
    params['silent'] = True
    params['seed'] = 2016

    train_stack = feather.read_dataframe('../input/tr_stack.feather')
    test_stack = feather.read_dataframe('../input/te_stack.feather')
    tr_feather_set1 = pd.read_csv('../input/train_eng.csv')
    te_feather_set1 = pd.read_csv('../input/test_eng.csv')


    train_numeric = feather.read_dataframe('../input/train_numeric_sparse.feather')
    test_numeric = feather.read_dataframe('../input/test_numeric_sparse.feather')
    train_date = feather.read_dataframe('../input/train_date_sparse.feather')
    test_date = feather.read_dataframe('../input/test_date_sparse.feather')
    train = pd.concat([train_stack,train_numeric,train_date],axis = 1)
    test = pd.concat([test_stack, test_numeric,test_date], axis=1)
    del train_date,test_date,train_numeric,test_numeric
    import gc
    gc.collect()



    features = list(train.columns)
    features.remove("Y")
    features.remove("Id")
    features.remove("Id")
    features.remove("Response")
    # features.remove("StartTime")
    # features.remove("EndTime")

    dtrain = xgb.DMatrix(train[features], train.Y, silent=True)
    dtest = xgb.DMatrix(test[features], silent=True)
    # features.remove("Id")
    # features.remove("Id")
    # features.remove("Response")
    # features.remove("V6")
    # features.remove("V5")

    xgb_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    xgb_result_set1.columns = ['actual', 'pred']
    xgb_result_set1_test = pd.DataFrame(np.zeros((test.shape[0], 1)))

    # train.ix[train['prev_path']>0,'prev_path'] = 1
    # train.ix[train['prev_path']!=0,'prev_path'] = 1
    # train.ix[train['prev_path'] < 0, 'prev_path'] = -1

    # train.ix[train['next_path'] >0, 'next_path'] = 1
    # train.ix[train['next_path']!=0,'next_path'] = 0
    # train.ix[train['next_path'] < -0, 'next_path'] = -1

    rf_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    rf_result_set1.columns = ['actual','pred']

    final_result_set1 = pd.DataFrame(np.zeros((train.shape[0], 2)))
    final_result_set1.columns = ['actual','pred']
    threshold = 0

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
        clf_xgb = xgb.train(params, dtr, num_boost_round=200, evals=watchlist, verbose_eval=10,
                            early_stopping_rounds=10)
        xgb_pred = clf_xgb.predict(dvalid)
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values, xgb_pred, True)
        print('xgb mcc:', best_mcc)
        print("the best threshold is", best_proba)
        xgb_result_set1.ix[te_index['x'], 'pred'] = xgb_pred
        xgb_result_set1.ix[te_index['x'], 'actual'] = y_valid.values
        #xgb_result_set1_test.ix[:, 0] += clf_xgb.predict(dtest)
        X_train.fillna(-9999,inplace = True)
        X_valid.fillna(-9999, inplace=True)
        clf_rf = RandomForestClassifier(max_depth=10, n_estimators=200, random_state=2015, n_jobs=-1)
        clf_rf.fit(X_train, y_train)
        rf_pred = clf_rf.predict_proba(X_valid)[:,1]
        print("the auc is",(roc_auc_score(y_valid,rf_pred)))
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,rf_pred,True)
        print('rf mcc:', best_mcc)
        print("the best threshold is",best_proba)
        final = rf_pred * 0.5 + xgb_pred*0.5
        best_proba, best_mcc, y_pred = eval_mcc(y_valid.values,final,True)
        print('final mcc:', best_mcc)
        print("the best threshold is",best_proba)
        threshold += best_proba
        rf_result_set1.ix[te_index['x'], 'pred'] = rf_pred
        rf_result_set1.ix[te_index['x'], 'actual'] = y_valid.values
        final_result_set1.ix[te_index['x'], 'pred'] = final
        final_result_set1.ix[te_index['x'], 'actual'] = final
        imp = get_importance(clf_xgb, features)
        print(imp[1:20])


    threshold = threshold / 5
    xgb_result_set1_test = xgb_result_set1_test / 5

    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, xgb_result_set1['pred'], True)
    print(best_mcc)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, rf_result_set1['pred'], True)
    print(best_mcc)
    best_proba, best_mcc, y_pred = eval_mcc(train.Y.values, final_result_set1['pred'], True)
    print(best_mcc)

    #xgb_result_set1.to_csv('../stacking/level1_train_20161016_feature_set7.csv', index=False)
    #xgb_result_set1.to_csv('../stacking/level1_train_20161016_feature_set7.csv', index=False)

    dtrain = xgb.DMatrix(train[features], train.Y, silent=True)
    dtest = xgb.DMatrix(test[features], silent=True)
    clf_xgb = xgb.train(params, dtrain, num_boost_round=40)
    test_xgb = clf_xgb.predict(dtest)

    clf_rf = RandomForestClassifier(max_depth=10, n_estimators=230, random_state=2015, n_jobs=-1)
    train.fillna(-9999, inplace=True)
    test.fillna(-9999, inplace=True)
    clf_rf.fit(train[features], train.Y)
    test_rf = clf_rf.predict_proba(test[features])[:, 1]

    y_pred_final = (((test_xgb + test_rf) / 2) > threshold*0.95).astype(int)
    submission = pd.read_csv('../input/sample_submission.csv')
    submission['Response'] = y_pred_final
    print(sum(y_pred_final))
    submission[['Id', 'Response']].to_csv('../submission/xgboost_20161020_submit4.csv', index=False)



