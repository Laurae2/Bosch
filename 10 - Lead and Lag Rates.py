import pandas as pd
import numpy as np

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
sta_path = 'D:\\Kaggle Project\\0 - Data Files\\Station Data\\'
#===============================================================================================================================
#===============================================================================================================================
train = pd.read_csv(datapath+'station_time_tr.csv', sep=',', dtype={'Id':str})
test  = pd.read_csv(datapath+'station_time_ts.csv', sep=',', dtype={'Id':str})
data = train.append(test)
data.reset_index(drop=True, inplace=True)
del train
del test
cols = data.columns.tolist()
cols.remove('Id')
cols.remove('Response')
data['start_time'] = data[cols].min(axis=1)
data['end_time'] = data[cols].max(axis=1)
data = data[['Id','Response','start_time','end_time']]
#===============================================================================================================================
#===============================================================================================================================

def lead_in(datafile, x):
    target = datafile.Response.tolist()
    cols = []
    for i in range(1,x+1):
        lead   = ([np.nan]*i) + target[:-i]
        datafile['L'+str(i)] = lead
        cols = cols + ['L'+str(i)]
    datafile['lead'+str(x)+'cnt'] = datafile[cols].count(axis=1)
    datafile['lead'+str(x)+'sum'] = datafile[cols].sum(axis=1)
    datafile['lead'+str(x)+'rate'] = datafile[cols].mean(axis=1)
    return datafile[['Id','lead'+str(x)+'cnt','lead'+str(x)+'sum','lead'+str(x)+'rate']]

def lag_out(datafile, x):
    target = datafile.Response.tolist()
    cols = []
    for i in range(1,x+1):
        lag   = target[i:] + ([np.nan]*i)
        datafile['L'+str(i)] = lag
        cols = cols + ['L'+str(i)]
    datafile['lag'+str(x)+'cnt'] = datafile[cols].count(axis=1)
    datafile['lag'+str(x)+'sum'] = datafile[cols].sum(axis=1)
    datafile['lag'+str(x)+'rate'] = datafile[cols].mean(axis=1)
    return datafile[['Id','lag'+str(x)+'cnt','lag'+str(x)+'sum','lag'+str(x)+'rate']]
#===============================================================================================================================
#===============================================================================================================================

n_list = [5,10,50,100,150,200]

data.sort_values(by=['start_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)
for n in n_list:
    print str(n)
    lead_data = lead_in(data[['Id','Response']], n)
    data = pd.merge(data, lead_data, on='Id', how='left')

data.sort_values(by=['end_time','Id'], ascending=True, inplace=True)
data.reset_index(drop=True, inplace=True)
for n in n_list:
    print str(n)
    lag_data  = lag_out(data[['Id','Response']], n)
    data = pd.merge(data, lag_data, on='Id', how='left')

data.to_csv(datapath+'lead_lag_data.csv', index=False)

#data.drop(['Response','start_time','end_time'], axis=1, inplace=True)
#train = pd.read_csv(datapath+'train_eng.csv', sep=',', dtype={'Id':str})
#train = pd.merge(train, data, on='Id', how='left')
#train.to_csv(datapath+'train_eng3.csv', index=False)
#
#test  = pd.read_csv(datapath+'train_eng.csv', sep=',', dtype={'Id':str})
#test  = pd.merge(test, data, on='Id', how='left')
#test.to_csv(datapath+'test_eng3.csv', index=False)
