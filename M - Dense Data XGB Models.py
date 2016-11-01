import pandas as pd
import numpy as np
import xgboost as xgb
import operator
from matplotlib import pylab as plt
from sklearn.cross_validation import StratifiedKFold
from sklearn.feature_selection import SelectPercentile, f_classif, chi2, SelectKBest
from sklearn.preprocessing import LabelEncoder
lbl = LabelEncoder()

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
np.random.seed(14)
kfolds = 5
#===============================================================================================================================
###  Load Data Files
#===============================================================================================================================
train  = pd.read_csv(datapath+'train_eng4.csv', sep=',', dtype={'activity_id':str})
target = train.Response
print('Data: train shape {}'.format(train.shape))
#===============================================================================================================================
###  Features & Feature selection
features = train.columns.tolist()
features.remove('Response')
features.remove('Id')


#selector = SelectPercentile(f_classif, percentile=80)
#selector.fit(train[features], target)
#train = selector.transform(train[features])
#test  = selector.transform(test[features])
#===============================================================================================================================
###  XGBOOST
#===============================================================================================================================
params = {}
params['booster'] = 'gbtree'
params['objective'] = 'binary:logistic'
params['eval_metric'] = 'auc'

params['eta'] = 0.05
params['subsample'] = 0.7
params['colsample_bytree'] = 0.7
params['max_depth'] = 15
params['min_child_weight'] = 7
rounds = 2000
early_stop = 50

# Random 10% for validation

kf  = train[['Id']]
kf['fold'] = np.random.randint(kfolds, size=kf.shape[0])
train = pd.merge(train, kf, on='Id', how='left')

#  Train the model with a 10% validation set
Xtr = np.matrix(train[features][train.fold!=0])
Xte = np.matrix(train[features][train.fold==0])
ytr = target[train.fold!=0]
yte = target[train.fold==0]

d_train = xgb.DMatrix(Xtr, label=ytr, missing=np.nan)
d_valid = xgb.DMatrix(Xte, label=yte, missing=np.nan)
watchlist = [(d_train, 'train'), (d_valid, 'eval')]

#  Train the model & Predict results
clf = xgb.train(params, d_train, rounds, watchlist, early_stopping_rounds=early_stop)

#  Get feature importances

def create_feature_map(features):
    outfile = open('xgb.fmap', 'w')
    i = 0
    for feat in features:
        outfile.write('{0}\t{1}\tq\n'.format(i, feat))
        i = i + 1
    outfile.close()

create_feature_map(features)

importance = clf.get_fscore(fmap='xgb.fmap')
importance = sorted(importance.items(), key=operator.itemgetter(1))
imps = pd.DataFrame(importance, columns=['feature', 'fscore'])
imps['fscore'] = imps['fscore'] / imps['fscore'].sum()
imps.to_csv(datapath+'imps.csv', index=False)

#plt.figure()
#imps.plot()
imps.plot(kind='barh', x='feature', y='fscore', legend=False, figsize=(6, 10))
plt.title('XGBoost Feature Importance')
plt.xlabel('relative importance')
plt.show()
#plt.gcf().savefig('feature_importance_xgb.png')

