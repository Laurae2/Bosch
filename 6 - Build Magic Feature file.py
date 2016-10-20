import pandas as pd
import numpy as np

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
train = pd.read_csv(datapath+'station_time_tr.csv', sep=',')
test  = pd.read_csv(datapath+'station_time_ts.csv', sep=',')
data = train.append(test)
data.reset_index(drop=True, inplace=True)
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
out_cols = ['Id','Response','magic1','magic2','magic3','magic4','magic5','magic6']
for s in range(52):
    data.sort_values(by=['sta_'+str(s)+'_time','Id'], ascending=True, inplace=True)
    data.reset_index(drop=True, inplace=True)

    data['sta_'+str(s)+'m3'] = data.Id.diff().fillna(9999999).astype(int)
    data['sta_'+str(s)+'m4'] = data.Id.iloc[::-1].diff().fillna(9999999).astype(int)
    out_cols = out_cols+['sta_'+str(s)+'m3', 'sta_'+str(s)+'m4']

data[out_cols].to_csv(datapath+'magic_features.csv', index=False)