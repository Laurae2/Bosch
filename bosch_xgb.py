# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
from operator import itemgetter
from sklearn.cross_validation import train_test_split
import xgboost as xgb
import os
from sklearn.preprocessing import LabelEncoder
from sklearn.feature_extraction import DictVectorizer
import sklearn.preprocessing
from xgboost import XGBClassifier
from sklearn.metrics import matthews_corrcoef, roc_auc_score
from sklearn.cross_validation import cross_val_score, StratifiedKFold
import random

datadir = '../input/'

def find_matthews_threshold(p_valid, y_valid, try_all=False, verbose=False):
    p_valid, y_valid = np.array(p_valid), np.array(y_valid)

    best = 0
    best_score = -2
    totry = np.arange(0,1,0.01) if try_all is False else np.unique(p_valid)
    for t in totry:
        score = matthews_corrcoef(y_valid, p_valid > t)
        if score > best_score:
            best_score = score
            best = t
    if verbose is True: 
        print('Best score: ', round(best_score, 5), ' @ threshold ', best)

    return best

def best_threshold_submission(p_valid, y_valid, p_test, try_all=False, verbose=False):
    p_test = np.array(p_test)
    thresh = find_matthews_threshold(p_valid, y_valid, try_all, verbose)
    return p_test > thresh

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
    numn = n - nump              # number of negative
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
    print('XGBoost gbm.get_fscore')
    importance = sorted(importance.items(), key=itemgetter(1), reverse=True)
    return importance

#########################################################################################
#
# a default xgb and feature importance function
#
#########################################################################################


def run_default_test(train, target, test,random_state=2016):
    seed = random.randint(55, 99999)
    random_state=seed
    eta = 0.05
    max_depth = 7
    subsample = 0.6
    colsample_bytree = 0.7
    print('XGBoost params. ETA: {}, MAX_DEPTH: {}, SUBSAMPLE: {}, COLSAMPLE_BY_TREE: {}'.format(eta, max_depth, subsample, colsample_bytree))
    params = {
        "objective": "binary:logistic",
        "booster" : "gbtree",
        "eval_metric": "auc",
        "eta": eta,
        "max_depth": max_depth,
        "subsample": subsample,
        "colsample_bytree": colsample_bytree,
        "silent": 1,
        "scale_pos_weight":2,
        "seed": random_state
    }
    num_boost_round = 450
    early_stopping_rounds = 50
    test_size = 0.2
    
    X_train, X_valid = train_test_split(train, test_size=test_size, random_state=random_state)
    y_train = X_train[target]
    y_valid = X_valid[target]
    print("create matric")
    X_train=X_train.drop('Response', axis=1)
    features=list(X_train.columns.values) 
    dtrain = xgb.DMatrix(X_train[features], y_train)
    dvalid = xgb.DMatrix(X_valid[features], y_valid)
    print("train")
    watchlist = [(dtrain, 'train'), (dvalid, 'eval')]
    gbm = xgb.train(params, dtrain, num_boost_round, evals=watchlist, early_stopping_rounds=early_stopping_rounds, verbose_eval=1)

    print("Validating...")
    check = gbm.predict(xgb.DMatrix(X_valid[features]), ntree_limit=gbm.best_ntree_limit)
    score = roc_auc_score(X_valid[target].values, check)
    print('Check error value: {:.6f}'.format(score))

    imp = get_importance(gbm, features)
    print('Importance array: ', imp)
    proba = gbm.predict(xgb.DMatrix(test[features]), ntree_limit=gbm.best_ntree_limit)
    predictions = pd.DataFrame({"Id":test['Id'],"proba":proba})
    predictions.to_csv("../subs/predictions_"+str(seed)+".csv.gz", compression="gzip")

    return score

#################################################################################
#
# another CV method but didn't use it seems to gave same results
#
##################################################################################

def CV(train,y):
    print('Train:', train.shape)
    features = list(train.columns)
    features.remove('Response')
    #features.remove('Id')
    print(features)
    num_rounds = 500
    params = {}
    params['objective'] = "binary:logistic"
    params['eta'] = 0.021
    params['max_depth'] = 7
    params['colsample_bytree'] = 0.82
    params['min_child_weight'] = 3
    params['base_score'] = 0.005
    params['silent'] = 1
    train=train[features]
    print('Fitting')
    trainpredictions = None
    #train = train.values
    cv = StratifiedKFold(y, n_folds=5)
    preds = np.ones(y.shape[0])
    for i, (tr, te) in enumerate(cv):
        test_size = 0.2
        X_train, X_valid ,y_train,y_valid= train_test_split(train.values[tr], y[tr],test_size=test_size, random_state=i)
        dtrain = xgb.DMatrix(X_train, y_train)
        dvalid = xgb.DMatrix(X_valid, y_valid)
        print('Fold:', i)
        params['seed'] = i
        watchlist = [(dtrain, 'train'), (dvalid, 'val')]
        clf = xgb.train(params, dtrain,
                        num_boost_round=num_rounds,
                        evals=watchlist,
                        early_stopping_rounds=20,
                        feval=mcc_eval,maximize=True)
 
        limit = clf.best_iteration+1
        predictions = clf.predict(dtrain, ntree_limit=limit)

        best_proba, best_mcc, y_pred = eval_mcc(y_train,predictions,True)
        print('tree limit:', limit)
        print('mcc:', best_mcc)
        print(matthews_corrcoef(y_train,y_pred))


#################################################################################
#
# start 
#
##################################################################################
NROWS=3000000
#NROWS=51151
if 0:
  print("read train")
  train1 = pd.read_csv("../input/train_numeric.csv.gz",nrows=NROWS)
  test1  = pd.read_csv("../input/test_numeric.csv.gz",nrows=NROWS)
  print('train numeric',train1.shape)
  print('test numeric',test1.shape)
  df = pd.DataFrame(train1['Id'])
  df1 =pd.DataFrame(test1['Id'])
### attempt to generate interaction feature with brute force

  liste_interaction=['L0_S0_F20','L0_S11_F314']##,'L0_S6_F122','L0_S7_F138','L2_S26_F3047','L0_S0_F22','L2_S27_F3140','L0_S12_F350','L0_S18_F439','L1_S24_F1842','L1_S24_F1831','L1_S24_F1637','L1_S24_F1728','L0_S19_F455','L1_S24_F1763','L3_S45_F4124','L1_S24_F1490','L1_S24_F1331','L1_S25_F2164','L1_S25_F2147','L1_S24_F1808','L0_S12_F352','L1_S24_F1366','L1_S24_F1094','L1_S24_F1016','L1_S25_F3026','L1_S24_F1240','L1_S24_F998','L1_S24_F1411','L1_S24_F963','L1_S25_F2460','L1_S24_F844','L1_S24_F872']

  for i in liste_interaction:
    print(i)
    
    for j in liste_interaction:
      col = str(i) + '_*_'  + str(j)
      if col not in df :
          col = str(j) + '_*_'  + str(i)
          df[col] = train1[j] * train1[i]
          df1[col] = test1[j] * test1[i] 
          #col = str(j) + '_/_'  + str(i)
          #df[col] = train1[j] / train1[i] 

  train1= pd.merge(train1,df ,how='inner',on='Id', left_index=True)  
  test1 = pd.merge(test1 ,df1,how='inner',on='Id', left_index=True)
  # just add Reponse to the test df 
  test1['Response'] = -1
  print("test1",test1.shape)
  # merge numeric feature with all extra features
  df1_s34 = pd.read_csv("../input/extra_var_v1_S34.csv.gz")
  print('extra_var_v1_S34.csv.gz',df1_s34.shape)
  df1 = pd.read_csv("../input/extra_var_v1.csv.gz")
  print('extra_var_v1.csv.gz',df1.shape)
  df1 = pd.merge(df1,df1_s34,how='inner',on='Id', left_index=True)
  print('merge var v1 S34 et var v1',df1.shape)
  df2 = pd.read_csv("../input/extra_var_v2.csv.gz")
  print('train var v2',df2.shape)
  df3 = pd.read_csv("../input/extra_var_v3.csv.gz")
  print('extra v3',df3.shape)

  #bin few categorical features into true / false 
  df3['CATEGORICAL_Last_____1'] = df3['CATEGORICAL_Last'].isin(['T2', 'T4','T514'])
  df3['CATEGORICAL_Last_____2'] = df3['CATEGORICAL_Last'].isin(['T16','T48'])
  df3['CATEGORICAL_Max______1'] = df3['CATEGORICAL_Max'].isin(['T2', 'T8389632', 'T514'])
  df3['CATEGORICAL_Max______2'] = df3['CATEGORICAL_Max'].isin(['T16', 'T48', 'T7','T98'])
  df3['CATEGORICAL_Max______3'] = df3['CATEGORICAL_Max'].isin(['T3','T145','T4','T143','T8','T512','T6','T32'])
  df3['CATEGORICAL_L1_S24_F1827___T3'] = df3['CATEGORICAL_L1_S24_F1827'].isin(['T3'])
  #remove categorical features
  for f in df3.columns:
    if df3[f].dtype=='object':
      print(f)
      df3=df3.drop(f,axis=1)

  #finally join everything
  print("join")
  df_tmp = pd.merge(df1, df2, how='inner',on='Id', left_index=True)
  df_tmp = pd.merge(df_tmp,df3, how='inner',on='Id', left_index=True)

  train = pd.merge(train1,df_tmp, how='inner',on='Id', left_index=True)
  test  = pd.merge(test1,df_tmp, how='inner',on='Id', left_index=True)
  final_var = ['Id','Response','ratio','FOR100_Sum','L3_S33_F3857','FOR165_Sum','BAC165_Sum','BAC100_Sum','sameL0 (#1)','L3_S30_F3754','L3_S30_F3809','FOR165_log_lag_L2','L3_S30_F3744','BAC100_log_lag_L3','DATE_L3kurt','sameL3','sameL3 (#1)','FOR100_log_lag_L3','FOR165_log_lag','BAC165_log_lag','L3_S30_F3774','sameL1 (#1)','L3_S33_F3859','L3_S30_F3494','L3_S29_F3333','BAC165_log_lag_L3','L3_S30_F3759','L0_S1_F28','L3_S29_F3373','Range','Kurtosis','L3_S33_F3865','BAC30_Sum_S','DATE_S33max','FOR165_log_lag_L3','FOR60_Sum_S3','L3_S29_F3348','sameL2 (#1)','L0_Max','L3_S30_F3769','Response(-1)','L3_S30_F3749','BAC100_log_lag','L3_S29_F3351','L3_S36_F3920','FOR100_log_lag','BAC165_log_lag_L2','BAC60_Sum_S3','L3_S29_F3339','L3_S30_F3804','L3max_L0min','L3_S29_F3379','L3_S29_F3479','FOR100_log_lag_L2','BAC165_log_lag_L1','BAC165_log_lag_L0','FOR30_Sum_S','BAC100_log_lag_L2','L3_S29_F3342','L3_S29_F3327','L0_S2_F44','L3_S30_F3604','L0_S3_F100','L3_S30_F3534','L3_S29_F3354','L3_S30_F3574','L1_S24_F1844','L0_S0_F20_*_L0_S0_F20','L3_S30_F3639','FOR165_log_lag_L1','FOR100_log_lag_L1','FOR165_log_lag_L0','L3_S30_F3504','L3_S30_F3609','L0_S7_F138','L3_S29_F3321','L3_Min','L3_S29_F3336','Response(-1) (#1)','L0max_L3max','BAC100_log_lag_L1','L3_S30_F3709','L3_S30_F3829','FOR60_log_lag_S33','L3_S29_F3315','L0_S0_F18','L3_S30_F3544','L3_S29_F3330','L0_S1_F24','L0_S5_F116','L3_S29_F3324','CATEGORICAL_Last_____1','FOR60_log_lag_S30','L0_S0_F0','L0_S4_F109','L0_S9_F180','L3_S35_F3889','L1_S24_F1581','CATEGORICAL_out_out_L3_S32_F3854_class2','L2_Min','L0_S0_F20','L0_S6_F132','L1_S24_F1516','L3_S30_F3554','L3_S29_F3473','DATE_S34max','L3_S30_F3784','L3_S30_F3689','L3_S30_F3514','DATE_S37max','L1_S24_F1672','L2_S26_F3106','L3_S30_F3799','BAC30_log_lag_S34','FOR100_log_lag_L0','GF0','L3_S30_F3624','L3_S30_F3579','L3_S30_F3564','L3_S30_F3684','L3_Max','L0_S4_F104','L3_S29_F3345','L3_S29_F3427','L3_S30_F3764','L2_S26_F3051','L0_S0_F2','L3_S30_F3524','DATE_S35max','L3_S30_F3519','BAC60_log_lag_S33','L3_S30_F3499','L0_S2_F64','L3_S30_F3794','L3_S29_F3318','L0_S9_F195','DATE_S36max','L0_S11_F286','L3_S29_F3376','DATE_S38max','L0_S2_F36','L1_S24_F1850','L3_S30_F3509','L0_S11_F326','L0_S10_F244','DATE_S32max','L2_S27_F3199','L3_S30_F3584','S37min_S34min','BAC100_log_lag_L0','L0_S0_F16','L0_S2_F60','L2_S27_F3210','L1_S24_F1846','L3_S30_F3669','L0_S11_F314_*_L0_S0_F20','L0_S5_F114','L3_S30_F3704','L2_S26_F3062','FOR30_log_lag_S34','L1_S24_F1842','L3max_S26max','L1_S24_F1578','L3_S30_F3629','L0_S3_F72','L2max_S37max','L1_S24_F1514','L1_S24_F1518','L3_S29_F3433','L0_S11_F294','L0_S3_F80','DATE_L1kurt','L3_S29_F3357','sameL0','L0_S11_F318','L2_S27_F3214','L0_S10_F219','DATE_S30max','L1_S24_F1575','L1_Min','L0_S9_F155','CATEGORICAL_Unique count','L0_S6_F122','L0_S10_F254','L0_S2_F48','L3_S29_F3388','L0_S3_F84','L0_S15_F406','L3_Range','L1_S24_F1814','L0_S11_F310','L2_S26_F3073','L3_S30_F3819','S33max_S29min','Unique count','L3_S29_F3382','L3_S38_F3960','L2_S27_F3129','L0_S15_F397', 'L1_S24_F1812','L3_S29_F3424','L3_S29_F3430', 'L3_S30_F3589','L0_S0_F12','L0_Min','S33min_S37min','L3_S30_F3649','DATE_S7_max','L3_S29_F3395','DATE_S2_max','L0_S0_F22','L3_S32_F3850','L0_Range','L2_S26_F3121','L0_S3_F96','L0_S9_F210','L3_S29_F3476','DATE_S6_max','L0_Mean','L2_S27_F3206','L1_S25_F2126','L0_S11_F306','S36max_S29min','L0_S11_F314_*_L0_S11_F314','S33min_S30min','L0_S13_F356','S29min_S32min','BAC30_log_lag_S33','L1_S24_F1637','FOR30_log_lag_S30','L2_S26_F3047','DATE_S4_max','L3_S30_F3664','L0_S11_F282','L2_S27_F3162','L3_S29_F3452','BAC60_log_lag_S34','L2_S26_F3113','L3_S30_F3644','L3_S47_F4163','S30min_S37min','L0_S11_F322','L0_S19_F455','L1_S24_F1773','L1_Range','L1_S24_F1803','L1_S24_F1700','BAC30_log_lag_S30','L1_S24_F1632','L0_S0_F4','L0_S9_F200','L0_S18_F439','L0_S17_F433','L0_S9_F190','L1_S24_F1685','S29min_S37min','BAC60_log_lag_S30','L1_S24_F1609','L3_S29_F3421','S33min_S36min','FOR60_log_lag_S34','L0_S23_F643','S29min_S34min','L1_S24_F1798','L3_S29_F3436','GF1','L1_S24_F1831','L1_S24_F1667','L1_S24_F1520','L0_S9_F170','L3_S29_F3385','S35min_L1min','L0_S0_F8','L0_S15_F403','L3_S29_F3458','L3_S35_F3896','L0_S11_F302','L1_S24_F1723','L1_S24_F1728','L3_S29_F3461','L0_S23_F623','L0_S7_F142','L0_S10_F234','DATE_S19max','Min','L2_S27_F3144','L3max_S30max','L0_S15_F415','DATE_S3_max','L0_S11_F290','L1_Max','L3_S29_F3455','L2_S26_F3036','L1_S24_F1571','L0_S9_F185','L0_S21_F472','L1_S24_F1758','L2_S26_F3069','L0_S21_F537','DATE_S0_max','CATEGORICAL_Missing value count','L0_S12_F332','L3_S45_F4124','FOR30_log_lag_S33','Mean','L0_S10_F249','L3_S29_F3367','L3_S29_F3407','L0_S0_F6','L3_S30_F3569','L0_S10_F229','L3_Unique count','DATE_S24max','S13min_S33min','L0_S23_F659','L3_S41_F4000','L3_S30_F3634','L0_S9_F175','L1_S24_F1778','L1_S24_F1512','L3_S30_F3679','L0_S15_F418','L1_S25_F2116','L3_S30_F3539','L0_S10_F259','S32max_S37min','L0_S9_F165','L3_S30_F3529','L1_S25_F2161','L0_S10_F224','L3_S36_F3924','L0_S10_F264','L0_S21_F482','L0_S14_F386','L3_S29_F3370','L1_S25_F2056','L0_Unique count','L0_S21_F497','L1_S24_F1743','L0_S14_F362','S26min_S37min','DATE_S26max','L1_S24_F1567','L1_S24_F1565','L0_S18_F449','L2_S27_F3155','L1_S25_F2147','DATE_S44max','L2_Max','L3_S30_F3549','L1_S25_F1992','L0_S22_F576','S33min_S35min','DATE_S10max','L3_S47_F4153','L3_S29_F3401','L3max_S34min','L0_S12_F350','L3_S30_F3559','L0_S16_F421','L1_S24_F1544','Max','L1_S24_F1002','L0_S22_F591','L0_S12_F330','L1_S24_F1810','L2_S27_F3133','L3_L3_Unique count','L0_S10_F274','L1_S25_F1892','DATE_S11max','L0_S23_F667','DATE_S8_max','L2_S27_F3140','L3_S33_F3855','L0_S14_F390','L0_S13_F354','L3_S29_F3449','L1_S24_F1793','L2_S26_F3040','L3_S29_F3439','L0_S9_F160','L1_S24_F1662','DATE_S27max','L0_S17_F431','L1_S25_F1855','L3_S35_F3894','L1_S24_F1829','L1_S24_F1822','L1_S24_F1783','L3_S29_F3412','L0_S22_F551','L0_S12_F346','L3_S38_F3952','L0_S22_F596','L1_S24_F1818','L1_S24_F1788','S26min_S24min','L1_S24_F1026','L1_S24_F1599','L1_S24_F1652','L0_S16_F426','L0_S12_F348','L3_S30_F3674','L1_S24_F1763','L3_S41_F4006','L1_S25_F1869','L1_S24_F1594','S30min_S35min','L3_S36_F3918','L1_S24_F1816','DATE_S25max','L1_S24_F948','L0_S21_F522','DATE_S9_max','L1_S24_F983','L1_S24_F1848','L3_S40_F3982','L3_S36_F3938','L3_S29_F3360','L0_S2_F40','L3_S48_F4202','L3_S41_F4020','L2_S26_F3117','L0_S22_F556','DATE_S24min','L1_S24_F1820','L1_S24_F1539','L1_S25_F2176','L3_S44_F4118','L3_S38_F3956','L0_S22_F561','S33min_S34min','L3_S41_F4008','L3_S47_F4143','L1_S24_F1041','L0_S19_F459','L0_S22_F571','L0_S23_F639','L1_S25_F1900','S27min_S32min','L0_S21_F517','L1_S24_F1808','DATE_S13max','L1_S25_F2111','L0_S21_F477','L0_S21_F532','DATE_L0max','L3_S29_F3404','L1_S24_F1622','L1_S24_F1718','L1_S24_F1573','sameL2','L0_S22_F601','DATE_S1_max','L3_S29_F3467','L0_S23_F655','L1_S25_F2131','L1_S24_F1463','L1_S25_F2136','S34min_S35min','L0_S11_F314','L0_S21_F527','L3_S34_F3882','S32min_S30min','L3_S47_F4158','L0_S14_F374','L3_S41_F4014','L0_S23_F671','L0_S23_F631','DATE_S10min','L0_S22_F546','S29max_S35max','L1_S24_F1713','L0_S0_F10','sameL1','L1_S24_F1824','L0_S12_F352','L1_S24_F1647','L2_Range','L3_S47_F4138','L0_S21_F487','L0_S23_F651','L3_S41_F4004','L0_S12_F334','DATE_S20max','L1_S24_F691','L3_S44_F4115','L0_S23_F663','L1_S24_F1406','S26max_S32max','L3_S29_F3488','L1_S25_F2021','L1_S25_F1978','L0_S14_F370','L1_S24_F1202','S32min_S34min','L1_S24_F1336',
'L1_S24_F1569','L3_S40_F3980','L2_S28_F3255','L3_S43_F4090','L3_S48_F4198','L3_S41_F4026','DATE_S23max','L1_S24_F1494','L0_S0_F14','L1_S25_F2051','L1_Unique count','L0_S23_F619','L1_S25_F2173','L0_S12_F342','L1_S24_F1642','L0_S23_F627','L1_S24_F1834','L0_S2_F32','L3_S44_F4121','L1_S25_F2144','L1_S25_F2061','DATE_S50max','L1_S24_F1733','L0_S6_F118','L3_S50_F4243','L3_S30_F3734','DATE_S28max','CATEGORICAL_Last_____2','L3_L3_Missing value count','L1_S25_F2026','L1_S24_F988','L1_S25_F2158','L0_S12_F338','L3_S41_F4016','L1_S24_F1381','L1_S25_F1938','L1_S24_F973','L2_S28_F3311','L1_S24_F1836','L0_S22_F611','DATE_S49max','L1_S24_F1748','L3_S29_F3491','L3_S43_F4085','L0_S21_F502','L1_S25_F2167','CATEGORICAL_out_L3_S32_F3854_class1','L1_S24_F1235','L2_S27_F3166','L0_S9_F205','L1_S24_F1498','L0_S22_F586','L1_S24_F1490','L1_L1_Missing value count','L2_L2_Unique count','L1_S24_F963','L1_S24_F1122','L1_S24_F1431','L1_S24_F1451','L0_S21_F512','L0_S12_F344','L1_S25_F1914','L1_S24_F1768','L3_S47_F4148','L0_S12_F336','L2_S28_F3299','L1_S25_F2441','L1_S25_F2086','L1_S25_F1958','L2_S26_F3077','L1_S25_F2106','L0_S8_F144','L0_S10_F239','L2_S28_F3248','CATEGORICAL_Max______1','L1_S24_F802','L1_S24_F808','L3_S43_F4095','L1_S24_F1293','L3_S29_F3482','L1_S24_F1102','L1_S25_F1873','L1_S24_F1184','L1_S25_F2152','L3_S39_F3968','L3_S29_F3442','L1_S25_F1858','L1_S25_F2081','L3_S40_F3984','L0_S3_F68','L0_S21_F492','L3_S36_F3934','L1_S24_F814','L1_S24_F1838','L3_S41_F4023','L1_S24_F1441','L1_S25_F1968','L1_S24_F1321','L3_S43_F4080','L1_S25_F2164','L1_S24_F1657','L1_S24_F1627','L1_S25_F2297','L1_S24_F1738','L3_S41_F4011','L3_S40_F3986','L1_S24_F1240','L1_S25_F2220','L0_S22_F606','L1_S24_F1056','L1_S24_F1166','L3_S48_F4196','L1_S25_F2312','L1_S25_F1973','L1_S25_F3034','DATE_S20min','L1_S24_F700','L1_S24_F1753','L1_S24_F1006','L1_S25_F2007','L1_S25_F2170','L1_S25_F2071','DATE_S40max','L0_S2_F56','L3_S33_F3861','L3_S33_F3867','L1_S25_F2408','L1_S25_F2960','L1_S24_F1004','L1_S24_F829','L1_S24_F1506','L1_S25_F2031','L0_S15_F400','L1_S25_F2101','L1_S24_F998','L3_S37_F3950','L3_S35_F3884','L1_S24_F1180','L1_S25_F2443','L1_S25_F1890','L1_S25_F3009','L1_S25_F2433','L3_S44_F4112','L1_S24_F1255','L0_S20_F461','L3_S34_F3876','CATEGORICAL_Max______3','L1_S24_F800','L1_S24_F1690','L1_S25_F2770','L1_S24_F1172','L2_Unique count','L1_S24_F728','L3_S31_F3842','L3_S30_F3724','L3_S49_F4231','L3_S29_F3398','DATE_S45min','L3_S47_F4183','L1_S24_F1197','L1_S25_F2155','L1_S24_F935','S25max_S32min','DATE_S43max','DATE_S41max','L1_S24_F1331','L1_S25_F2278','L1_S25_F2423','L1_S25_F2837','L0_S7_F136','L1_S24_F1245','L1_S24_F978','L1_S24_F812','L1_S24_F810','L1_S25_F2743','L3_S49_F4211','L1_S24_F1068','L1_S25_F3026','L1_S25_F1909','L1_S24_F968','L1_S25_F2016','L1_S25_F1963','L0_S21_F507','L0_S14_F366','DATE_S8_min','L1_S24_F1416','L3_S33_F3873','L1_S24_F1303','L1_S25_F2791','L1_S25_F2797','L1_S24_F1401','L1_S24_F1012','L1_S24_F1016','L1_S24_F1391','L1_S25_F1929','L1_S25_F2046','L0_S3_F76','DATE_S13min','L2_S28_F3307','L3_S36_F3922','L3_S36_F3926','DATE_S47max','L1_S25_F1877','DATE_S12max','L1_S25_F2041','L0_S10_F269','L1_S25_F2317','L1_S24_F1356','S22min_S32min','L1_S25_F2258','L1_S24_F877','L1_S25_F2915','L1_S24_F683','DATE_S23min','L3_S43_F4065','S32min_S10min','L1_S25_F1953','L0_S8_F146','L2_S26_F3125','L3_S31_F3846','L0_S3_F92','L1_S25_F2091','L0_S12_F340','L3_S33_F3863','L1_S24_F958','L1_S24_F733','L1_S25_F3017','S22max_S32min','L1_S24_F1482','DATE_S25min','L1_S24_F1000','L1_S24_F1366','L1_S25_F2322','L1_S25_F1919']
  print('train before filtering',train.shape)
  train = train[final_var]
  print('test before filtering',test.shape)
  test = test[final_var]
  print("train final:",train.shape)  
  print("test final :",test.shape)
  print("saving ....")
  train.to_csv("../input/train.csv.gz", compression="gzip",index=False)
  test.to_csv("../input/test.csv.gz", compression="gzip",index=False)

if 1:
  train = pd.read_csv("../input/train.csv.gz")
  print("train final:",train.shape)
  test  = pd.read_csv("../input/test.csv.gz") 
  print("test final :",test.shape)
  key = list(train.columns)
  key.remove('Id')
  key.remove('Response') 


  
#######################################
#
# start of xgb 
#
#######################################
y = train['Response'].values.ravel()
ID =train['Id']
to_drop = ['Id'] 
train=train.drop(to_drop,axis=1)


##############################################################################################
#
# i have commented these two features but might be worth trying to add them, basically it detect if a part
# 
##############################################################################################
#train['same']=train['sameL0']+train['sameL1']+train['sameL2']+train['sameL3']
#train['same2']=train['sameL0 (#1)']+train['sameL1 (#1)']+train['sameL2 (#1)']+train['sameL3 (#1)']

#################################################################
# another strange attempt that i have commented 
#################################################################
#train['col1375']=  train['Min'] % 1375

train = train.fillna(-999)
test = test.fillna(-999)

print('train: {0}'.format(train.shape))
print("----------------------- run default test if you have time --------------------------")
score = run_default_test(train, 'Response',test)

train = train.drop('Response',axis=1)
X = train.values
features = list(train.columns)
features.append('Id')
TEST=test

################ if you want to bag several xgb than change the range value
for i in range(1):
#############################################################################
 seed = random.randint(55, 99999)
 print('seed',seed)
 clf = XGBClassifier(max_depth=7, seed=seed,base_score=0.09,colsample_bytree=0.7,subsample=0.6,scale_pos_weight=2,learning_rate=0.05,objective='binary:logistic')
# CROSS VALIDATION
 if 1:
    cv = StratifiedKFold(y, n_folds=10,shuffle=False,random_state=seed)
    preds = np.ones(y.shape[0])
    for i, (train, test) in enumerate(cv):
        print(i)
        preds[test] = clf.fit(X[train], y[train]).predict_proba(X[test])[:,1]
        print("fold {}, ROC AUC: {:.3f}".format(i, roc_auc_score(y[test], preds[test])))
    print(roc_auc_score(y, preds))
    from sklearn.metrics import matthews_corrcoef, roc_auc_score
    # pick the best threshold out-of-fold
    thresholds = np.linspace(0.001, 0.999, 150)
    mcc = np.array([matthews_corrcoef(y, preds>thr) for thr in thresholds])
    best_threshold = thresholds[mcc.argmax()]
    print('MCC MAX:',mcc.max())
    ooo = pd.DataFrame({"Id": ID, "Prediction": preds, "Response": y})
    ooo.to_csv('../subs/ooo_'+str(seed)+'.csv',index=False)
    from sklearn.externals import joblib
    joblib.dump(clf, '../subs/model_xgb_'+str(seed)+'.pkl', compress=9)
############################### load test
print('predicting .......')
print("best_threshold",best_threshold)
#/!\ i have a small doubt here that if clf is not only build from the last fold ????
proba = clf.predict_proba(TEST)[:,1]
predictions = pd.DataFrame({"Id":TEST['Id'],"proba":proba})
predictions.to_csv("../subs/predictions_"+str(seed)+".csv.gz", compression="gzip")
preds = (clf.predict_proba(TEST)[:,1] > best_threshold).astype(np.int8)

# and submit
sub = pd.read_csv("../input/sample_submission.csv", index_col=0)
sub["Response"] = preds
sub.to_csv("submission_"+str(best_threshold)+"_"+str(mcc.max())+"_"+str(seed)+".csv.gz", compression="gzip")

