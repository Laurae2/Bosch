import pandas as pd
import numpy as np

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
sta_path = 'D:\\Kaggle Project\\0 - Data Files\\Station Data\\'
#rootpath = 'E:\\Mike\\0 - Data Files\\'
#===============================================================================================================================
#===============================================================================================================================
trn  = pd.read_csv(datapath+'train_numeric.csv', sep=',', usecols=['Id','Response'], dtype={'Id':str})
tst  = pd.read_csv(datapath+'test_numeric.csv', sep=',', usecols=['Id'],dtype={'Id':str})
hdr = trn.append(tst)
hdr.reset_index(drop=True, inplace=True)
#=============================================================
data = pd.read_csv(datapath+'Min_features.csv', sep=',', dtype={'Id':str})
S24_subs = ['S24.101_Min','S24.102_Min','S24.103_Min','S24.104_Min','S24.105_Min','S24.106_Min',\
              'S24.107_Min','S24.108_Min','S24.109_Min','S24.11_Min','S24.111_Min','S24.112_Min','S24.2_Min','S24.201_Min',\
              'S24.202_Min','S24.203_Min','S24.204_Min','S24.205_Min','S24.206_Min','S24.207_Min','S24.208_Min','S24.209_Min',\
              'S24.21_Min','S24.211_Min','S24.3_Min','S24.301_Min','S24.302_Min','S24.303_Min','S24.304_Min','S24.305_Min',\
              'S24.306_Min','S24.307_Min','S24.308_Min','S24.309_Min','S24.31_Min','S24.311_Min']

S25_subs = ['S25.1_Min','S25.101_Min','S25.102_Min','S25.103_Min','S25.104_Min','S25.105_Min','S25.106_Min','S25.107_Min',\
            'S25.108_Min','S25.109_Min','S25.11_Min','S25.2_Min','S25.201_Min','S25.202_Min','S25.203_Min','S25.204_Min',\
            'S25.205_Min','S25.206_Min','S25.207_Min','S25.208_Min','S25.209_Min','S25.21_Min','S25.211_Min','S25.212_Min',\
            'S25.213_Min','S25.214_Min','S25.215_Min','S25.216_Min','S25.217_Min','S25.218_Min','S25.219_Min','S25.22_Min',\
            'S25.221_Min','S25.222_Min','S25.223_Min','S25.224_Min','S25.225_Min','S25.226_Min','S25.227_Min','S25.228_Min',\
            'S25.229_Min','S25.23_Min']

sta_feats = ['S0_Min','S1_Min','S2_Min','S3_Min','S4_Min','S5_Min','S6_Min','S7_Min','S8_Min','S9_Min','S10_Min','S11_Min',\
              'S12_Min','S13_Min','S14_Min','S15_Min','S16_Min','S17_Min','S18_Min','S19_Min','S20_Min','S21_Min','S22_Min',\
              'S23_Min','S24_Mean','S25_Mean','S26_Min','S27_Min','S28_Min','S29_Min','S30_Min','S31_Min','S32_Min','S33_Min',\
              'S34_Min','S35_Min','S36_Min','S37_Min','S38_Min','S39_Min','S40_Min','S41_Min','S42_Min','S43_Min','S44_Min',\
              'S45_Min','S46_Min','S47_Min','S48_Min','S49_Min','S50_Min','S51_Min']

data['start_time'] = data.min(axis=1)
data['end_time'] = data.max(axis=1)
data['tot_time'] = data.end_time - data.start_time
data['sub_sta_count'] = data.count(axis=1)
data['S24_Mean'] = data[S24_subs].mean(axis=1)
data['S25_Mean'] = data[S25_subs].mean(axis=1)
data['station_count'] = data[sta_feats].count(axis=1)
data['Id'] = hdr.Id
data['Response'] = hdr.Response
del trn
del tst
del hdr
to_drop = sta_feats+S24_subs+S25_subs
data.drop(to_drop, axis=1, inplace=True)
#=============================================================
clusters = pd.read_csv(datapath+'eda_sample_clusters.csv', sep=',', dtype={'Id':str})
data = pd.merge(data, clusters, on=['Id'], how='left')
del clusters
#=============================================================
euc_tr = pd.read_csv(datapath+'train_euc_NFs.csv', sep=',', dtype={'Id':str})
euc_ts = pd.read_csv(datapath+'test_euc_NFs.csv', sep=',', dtype={'Id':str})
euc_tr = euc_tr.append(euc_ts)
data = pd.merge(data, euc_tr, on=['Id'], how='left')
del euc_tr
del euc_ts
#=============================================================
man_tr = pd.read_csv(datapath+'train_man_NFs.csv', sep=',', dtype={'Id':str})
man_ts = pd.read_csv(datapath+'test_man_NFs.csv', sep=',', dtype={'Id':str})
man_tr = man_tr.append(man_ts)
data = pd.merge(data, man_tr, on=['Id'], how='left')
del man_tr
del man_ts
#=============================================================
dups = pd.read_csv(datapath+'data_dupped4.csv', sep=',', dtype={'x':np.int8})
data['dup'] = dups
del dups
#=============================================================
magic = pd.read_csv(datapath+'magic_features.csv', sep=',', dtype={'Id':str})
magic.drop('Response', axis=1, inplace=True)
data = pd.merge(data, magic, on=['Id'], how='left')
del magic
#===============================================================================================================================
train = data[np.isnan(data.Response)==False].copy()
test = data[np.isnan(data.Response)==True].copy()
del data
test.drop('Response', axis=1, inplace=True)
#=============================================================
#=============================================================
data  = pd.read_csv(datapath+'train_numeric_vertical.csv', sep=',', dtype={'Id':str})
#=============================================================
df    = data[['Id','feature_value']].groupby('Id', as_index=False).mean()
df.rename(columns={'feature_value':'mean_num_value'}, inplace=True)
train = pd.merge(train, df, on='Id', how='left')
del df
#=============================================================
df = data.iloc[data.groupby('Id',as_index=False)['feature_value'].idxmax()]
#  slices the data by returning the indices of the rows where feature_value is maximized in the group
df.rename(columns={'feature_value':'max_num_value','feature':'max_num_feat'}, inplace=True)
train = pd.merge(train, df[['Id','max_num_value','max_num_feat']], on='Id', how='left')
del df
#=============================================================
df = data.iloc[data.groupby('Id',as_index=False)['feature_value'].idxmin()]
df.rename(columns={'feature_value':'min_num_value','feature':'min_num_feat'}, inplace=True)
train = pd.merge(train, df[['Id','min_num_value','min_num_feat']], on='Id', how='left')
del df
del data
#=============================================================
#=============================================================
data  = pd.read_csv(datapath+'test_numeric_vertical.csv', sep=',', dtype={'Id':str})
#=============================================================
df    = data[['Id','feature_value']].groupby('Id', as_index=False).mean()
df.rename(columns={'feature_value':'mean_num_value'}, inplace=True)
test = pd.merge(test, df, on='Id', how='left')
del df
#=============================================================
df = data.iloc[data.groupby('Id',as_index=False)['feature_value'].idxmax()]
#  slices the data by returning the indices of the rows where feature_value is maximized in the group
df.rename(columns={'feature_value':'max_num_value','feature':'max_num_feat'}, inplace=True)
test = pd.merge(test, df[['Id','max_num_value','max_num_feat']], on='Id', how='left')
del df
#=============================================================
df = data.iloc[data.groupby('Id',as_index=False)['feature_value'].idxmin()]
df.rename(columns={'feature_value':'min_num_value','feature':'min_num_feat'}, inplace=True)
test = pd.merge(test, df[['Id','min_num_value','min_num_feat']], on='Id', how='left')
del df
del data
#===============================================================================================================================
#===============================================================================================================================
train.fillna(9999999, inplace=True)
train.to_csv(datapath+'train_eng.csv', index=False)
test.fillna(9999999, inplace=True)
test.to_csv(datapath+'test_eng.csv', index=False)

