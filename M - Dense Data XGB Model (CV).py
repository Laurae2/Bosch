import pandas as pd
import numpy as np
import xgboost as xgb
from sklearn.cross_validation import StratifiedKFold
from sklearn.metrics import matthews_corrcoef, roc_auc_score
from scipy import io
from sklearn.feature_selection import SelectPercentile, f_classif, chi2, SelectKBest
from sklearn.preprocessing import LabelEncoder
lbl = LabelEncoder()

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
np.random.seed(42)
kfolds = 5
#===============================================================================================================================
###  Load Data Files
#===============================================================================================================================
train  = pd.read_csv(datapath+'train_eng.csv', sep=',', dtype={'Id':str})
target = train.Response
test   = pd.read_csv(datapath+'test_eng.csv', sep=',', dtype={'Id':str})
print('Data: train shape {}, test shape {}'.format(train.shape, test.shape))
#===============================================================================================================================
###  Features & Feature selection
features = train.columns.tolist()
features.remove('Response')
features.remove('Id')

#selector = SelectPercentile(f_classif, percentile=80)
#selector.fit(train_mtx, target)
#train_mtx = selector.transform(train_mtx)
#test_mtx  = selector.transform(test_mtx)

def mcc_threshold(y_act, y_pred):
    thresholds = np.linspace(0.01, 0.99, 200)
    mcc = np.array([matthews_corrcoef(y_act, y_pred>thr) for thr in thresholds])
    best_threshold = thresholds[mcc.argmax()]
    return best_threshold, mcc.max()


#===============================================================================================================================
###  XGBOOST
#===============================================================================================================================
params = {}
params['booster'] = 'gbtree'
params['objective'] = 'binary:logistic'
params['eval_metric'] = 'auc'

params['eta'] = 0.1
params['subsample'] = 0.7
params['colsample_bytree'] = 0.7
params['max_depth'] = 11
params['min_child_weight'] = 5
rounds = 52

def model(trn, y, tst):
    d_train = xgb.DMatrix(trn, label=y)
    clf = xgb.train(params, d_train, rounds)
    pred = clf.predict(xgb.DMatrix(tst))
    return pred

kf  = train[['Id']]
kf['fold'] = np.random.randint(kfolds, size=kf.shape[0])
train = pd.merge(train, kf, on='Id', how='left')

CV = []
thresholds = []
MCV = []
oof_preds = pd.DataFrame()

for k in range(kfolds):
    Xtr = np.matrix(train[features][train.fold!=k])
    ytr = target[train.fold!=k]
    Xte = np.matrix(train[features][train.fold==k])
    yte = target[train.fold==k]
    yid = train.Id[train.fold==k]
    preds     = model(Xtr, ytr, Xte)
    oof_preds = oof_preds.append(pd.DataFrame(preds, index=yid, columns=['oof_pred']))
    score     = roc_auc_score(yte, preds)
    CV = CV + [score]
    print 'Fold '+str(k)+' AUC: ', score
    
    threshold, mcc_score = mcc_threshold(yte, preds)
    MCV = MCV + [mcc_score]
    thresholds = thresholds + [threshold]
    print 'Fold '+str(k)+' MCC: ', mcc_score
    print 'Fold '+str(k)+' Threshold: ', threshold
    
print str(kfolds)+'-Fold CV Mean AUC: ', np.mean(CV)
oof_preds.reset_index(drop=False, inplace=True)
oof_preds.Id = oof_preds.Id.astype(str)
oof_preds = pd.merge(oof_preds, train[['Id','Response']], on='Id', how='left')
threshold, mcc_score = mcc_threshold(oof_preds.Response, oof_preds.oof_pred)
print str(kfolds)+'Fold MCC: ', mcc_score
print str(kfolds)+'Fold MCC Threshold: ', threshold

oof_preds.to_csv('D:\\Kaggle Project\\98 - OOF Prediction Files\\XGB_XXXTR.csv', index=True)
#===============================================================================================================================
#===============================================================================================================================

preds      = model(train[features], target, test[features])
mcc_preds  = np.where(preds>threshold, 1, 0)
submission = pd.DataFrame(mcc_preds, index=test.Id, columns=['Response'])
submission.to_csv('D:\\Kaggle Project\\99 - Submission Files\\XGB_XXX.csv', index=True)

