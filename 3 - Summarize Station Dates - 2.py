import pandas as pd
import numpy as np

datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
outpath = 'D:\\Kaggle Project\\0 - Data Files\\Station Data\\'
#===============================================================================================================================
#  This is the last version of this stage that I ran.  The previous version only compared columns in feature number sequence.
#  This version compares all columns to group the date columns that are the same in multi_dt_sta
#===============================================================================================================================
def multi_dt_sta(s):
    tr_data  = pd.read_csv(outpath+'station_'+str(s)+'_date_tr.csv', sep=',', dtype={'Id':str})
    ts_data  = pd.read_csv(outpath+'station_'+str(s)+'_date_ts.csv', sep=',', dtype={'Id':str})
    v_data = tr_data.append(ts_data)
    del tr_data
    del ts_data
    v_data.feature = map(lambda x: 'd'+str(x), v_data.feature)
    data = v_data.pivot('Id','feature','feature_value')
    del v_data
    all_cols = data.columns.tolist()
    all_cols.sort()
    
    comb_list = []
    out_cols = []
    
    while len(all_cols)>0:
        X = data[ all_cols[0] ]
        out_cols  = out_cols + [ all_cols[0] ]
        comb_list = comb_list + [ (all_cols[0], all_cols[0]) ]
        drop_list = [ all_cols[0] ]
        
        i = 1
        while i<len(all_cols):
            diff = np.absolute(X - data[ all_cols[i] ])
            
            if any( diff>0 ):
                i = i+1
            else:
                comb_list = comb_list + [(all_cols[0], all_cols[i])]
                drop_list = drop_list + [ all_cols[i] ]
                i = i+1
        all_cols = [x for x in all_cols if x not in drop_list]              
    
    data = data[out_cols]
    data['sta_'+str(s)+'_time'] = data.mean(axis=1)
    comb_record = pd.DataFrame(comb_list, columns=['sta_'+str(s)+'_time','sta_original_dt'])
    comb_record.to_csv('D:\\Kaggle Project\\0 - Data Files\\Station Data\\station_'+str(s)+'_dt_comb.csv', index=False)
    data.reset_index(drop=False, inplace=True)
    data.Id = data.Id.astype(str)
    del comb_record
    
    return data

def sta_dt(s):
    tr_data  = pd.read_csv(outpath+'station_'+str(s)+'_tr.csv', sep=',', dtype={'Id':str})
    ts_data  = pd.read_csv(outpath+'station_'+str(s)+'_ts.csv', sep=',', dtype={'Id':str})
    data = tr_data.append(ts_data)
    del tr_data
    del ts_data
    cols = data.columns.tolist()
    
    if 'sta_date_max' in cols:
        del data
        data = multi_dt_sta(s)
        return data
    else:
        data.rename(columns={'sta_date_min':'sta_'+str(s)+'_time'}, inplace=True)
        data = data[['Id','sta_'+str(s)+'_time']]
        return data
        
    
#=========================================================
train = pd.read_csv(datapath+'train_numeric.csv', sep=',', usecols=['Id','Response'], dtype={'Id':str})
test = pd.read_csv(datapath+'test_numeric.csv', sep=',', usecols=['Id'], dtype={'Id':str})
hdr = train.append(test)
del train
del test

for s in range(52):
    print 'Processing station:', str(s)
    sta_dt_data = sta_dt(s)
    hdr = pd.merge(hdr, sta_dt_data, on='Id', how='left')

train = hdr[np.isnan(hdr.Response)==False]
test  = hdr[np.isnan(hdr.Response)==True]
test.drop('Response', axis=1, inplace=True)
train.to_csv(datapath+'station_time_tr.csv', index=False)
test.to_csv(datapath+'station_time_ts.csv', index=False)

del hdr
del train
del test
#===============================================================================================================================
#===============================================================================================================================

#  Build station time-incidence matrices and mean relative times
tr_data  = pd.read_csv(datapath+'station_time_tr.csv', sep=',', dtype={'Id':str}, index_col='Id')
ts_data  = pd.read_csv(datapath+'station_time_ts.csv', sep=',', dtype={'Id':str}, index_col='Id')
data = tr_data.append(ts_data)
del tr_data
del ts_data

out = []
for s1 in range(51):
    for s2 in range(s1+1,52):
        f1 = 'sta_'+str(s1)+'_time'
        f2 = 'sta_'+str(s2)+'_time'
        time_diff = np.mean(data[f1]-data[f2])
        out = out + [(f1,f2,time_diff)]
        out = out + [(f2,f1, -1*time_diff)]

out = pd.DataFrame(out, columns = ['station1','station2','time_diff'])

out_pivot = out.pivot('station1','station2','time_diff')
out_pivot.to_csv(datapath+'station_time_diffs.csv')

#=========================================================
cols = data.columns.tolist()
cols.remove('Response')

data['min_time'] = data[cols].min(axis=1)
data['max_time'] = data[cols].max(axis=1)
data['range']    = data.max_time - data.min_time

for c in cols:
    data[c] = (data[c]-data.min_time)/data.range

orders = data.mean()
out = pd.DataFrame(orders, columns = ['rel_time_order'])
out.to_csv(datapath+'relative_sta_times.csv')



