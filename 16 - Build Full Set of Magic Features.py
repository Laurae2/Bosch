import pandas as pd
import numpy as np

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
stapath = 'D:\\Kaggle Project\\0 - Data Files\\Station Data\\'
#===============================================================================================================================
#===============================================================================================================================
def sta_time(m, M, mu):
    if m==M: return m
    return mu

def sta_dt(s):
    tr_data  = pd.read_csv(stapath+'station_'+str(s)+'_date_tr.csv', sep=',', usecols = ['Id','feature_value'], dtype={'Id':int})
    ts_data  = pd.read_csv(stapath+'station_'+str(s)+'_date_ts.csv', sep=',', usecols = ['Id','feature_value'],dtype={'Id':int})
    ###  These files are stacked versions of the train_date and test_date files.  The stacked versions take all of the data
    ###  supplied by Kaggle and turns them into a file containing columns = ('Id','line','station','feature','feature_value).
    ###  I then split up the stacked data files into train and test files for each station.    
    datafile = tr_data.append(ts_data)
    del tr_data
    del ts_data
    
    out  = datafile.groupby('Id').min()
    out.rename(columns={'feature_value':'sta_min'}, inplace=True)
    maxs = datafile.groupby('Id').max()
    means = datafile.groupby('Id').max()
    out['sta_max'] = maxs.feature_value
    out['sta_mean'] = means.feature_value
    del datafile
    del maxs
    del means
    
    out['sta_'+str(s)+'_time'] = map(lambda x,y,z: sta_time(x,y,z), out.sta_min, out.sta_max, out.sta_mean)
    out.reset_index(drop=False, inplace=True)
    out.Id = out.Id.astype(int)
    return out[['Id','sta_'+str(s)+'_time']]

def lead_in(datafile, i):
    target = datafile.tolist()
    lead   = ([np.nan]*i) + target[:-i]
    return datafile - lead

#===============================================================================================================================
#===============================================================================================================================
#===============================================================================================================================
#===============================================================================================================================
train = pd.read_csv(datapath+'train_numeric.csv', sep=',', usecols=['Id','Response'], dtype={'Id':int})
test = pd.read_csv(datapath+'test_numeric.csv', sep=',', usecols=['Id'], dtype={'Id':int})
data = train.append(test)
data.reset_index(drop=True, inplace=True)
del train
del test

for s in range(52):
    print 'Processing station:', str(s)
    sta_dt_data = sta_dt(s)
    data = pd.merge(data, sta_dt_data, on='Id', how='left')

train = data[np.isnan(data.Response)==False]
test  = data[np.isnan(data.Response)==True]
test.drop('Response', axis=1, inplace=True)
train.to_csv(datapath+'station_time_tr.csv', index=False)
test.to_csv(datapath+'station_time_ts.csv', index=False)

del train
del test

#===============================================================================================================================
#===============================================================================================================================
cols = data.columns.tolist()
cols.remove('Id')
cols.remove('Response')
data['start_time'] = data[cols].min(axis=1)
data['end_time'] = data[cols].max(axis=1)

data['magic1'] = data.Id.diff().fillna(9999999).astype(int)
data['magic2'] = data.Id.iloc[::-1].diff().fillna(9999999).astype(int)

data.sort_values(by=['start_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)

data['magic3'] = data.Id.diff().fillna(9999999).astype(int)
data['magic4'] = data.Id.iloc[::-1].diff().fillna(9999999).astype(int)

data.sort_values(by=['end_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)

data['magic5'] = data.Id.diff().fillna(9999999).astype(int)
data['magic6'] = data.Id.iloc[::-1].diff().fillna(9999999).astype(int)
#===============================================================================================================================
#===============================================================================================================================
out_cols = ['Id','Response','start_time','end_time','magic1','magic2','magic3','magic4','magic5','magic6']
M3 = []
M4 = []
for s in range(52):
    data.sort_values(by=['sta_'+str(s)+'_time','Id'], ascending=True, inplace=True)
    data.reset_index(drop=True, inplace=True)

    data['sta_'+str(s)+'m3'] = data.Id.diff().fillna(9999999).astype(int)
    data['sta_'+str(s)+'m4'] = data.Id.iloc[::-1].diff().fillna(9999999).astype(int)
    M3 = M3 + ['sta_'+str(s)+'m3']
    M4 = M4 + ['sta_'+str(s)+'m4']
    out_cols = out_cols+['sta_'+str(s)+'m3', 'sta_'+str(s)+'m4']

data.replace(9999999, np.nan, inplace=True)
data = data[out_cols]

data['m3_min'] = data[M3].min(axis=1)
data['m3_mean'] = data[M3].mean(axis=1)
data['m3_kurt'] = data[M3].kurtosis(axis=1)
data['m3_skew'] = data[M3].skew(axis=1)
data['m3_max'] = data[M3].max(axis=1)
data['m3_rng'] = data.m3_max - data.m3_min
data['m4_min'] = data[M4].min(axis=1)
data['m4_mean'] = data[M4].mean(axis=1)
data['m4_kurt'] = data[M4].kurtosis(axis=1)
data['m4_skew'] = data[M4].skew(axis=1)
data['m4_max'] = data[M4].max(axis=1)
data['m4_rng'] = data.m4_max - data.m4_min

#===============================================================================================================================
#===============================================================================================================================
n_list = [2,3,4,5,10,50,100]

data.sort_values(by=['start_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)
for n in n_list:
    print str(n)
    data['magic3_lead'+str(n)] = lead_in(data.Id, n)
    data['magic4_lead'+str(n)] = lead_in(data.Id.iloc[::-1], n)

data.sort_values(by=['end_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)
for n in n_list:
    print str(n)
    data['magic5_lead'+str(n)] = lead_in(data.Id, n)
    data['magic6_lead'+str(n)] = lead_in(data.Id.iloc[::-1], n)

data.to_csv(datapath+'magic_feature_full_set.csv', index=False)

train = data[np.isnan(data.Response)==False]
train.to_csv(datapath+'magic_feature_full_tr.csv', index=False)
test  = data[np.isnan(data.Response)==True]
test.drop('Response', axis=1, inplace=True)
test.to_csv(datapath+'magic_feature_full_ts.csv', index=False)