import pandas as pd
import numpy as np
import networkx as nx
datapath = 'D:\\Kaggle Project\\0 - Data Files\\'
sta_path = 'D:\\Kaggle Project\\0 - Data Files\\Station Data\\'
#===============================================================================================================================
data_num = '13'
fscore_min = 0.005
corr_min = 0.90
#===============================================================================================================================
train  = pd.read_csv(datapath+'train_eng13.csv', sep=',', dtype={'Id':str})
test   = pd.read_csv(datapath+'test_eng13.csv', sep=',', dtype={'Id':str})
imps   = pd.read_csv(datapath+'imps.csv', sep=',', dtype={'Id':str}) # feature, fscore
data = train.append(test)
del train
del test
cols = data.columns.tolist()
cols.remove('Id')
cols.remove('Response')
#===============================================================================================================================
corr = data[cols].corr()
corr.to_csv(datapath+'data'+data_num+'_corr_matrix.csv', index=False)

for f in cols:
    corr[f] = np.where(np.absolute(corr[f])>corr_min,1,0)  #Create a graph incidence matrix with features linked by >0.90 correlation
G = nx.Graph(data=np.array(corr))  #  Create a graph from the correlation incidence matrix
components = sorted(nx.connected_components(G), key = len, reverse=True)  # separate out the connected graph components

#=============================================================
#  Output the connected groups
i=0
out=[]
while i<len(components):
    comp = list(components[i])
    for n in comp:
        if len(comp)>1:
            f = cols[n]
            out = out + [(f,i)]
    i=i+1
corr_groups = pd.DataFrame(out,columns=['feature','corr_group'])
pd.DataFrame.to_csv(corr_groups,datapath+'data'+data_num+'_corr_groups.csv',index=False)

#===============================================================================================================================

imps = pd.merge(imps, corr_groups, on='feature', how='left')
feature_set = imps[(imps.fscore>fscore_min) & (np.isnan(imps.corr_group)==True)]

imps = imps[np.isnan(imps.corr_group)==False]
imps.sort_values(by=['corr_group','fscore'], ascending=True, inplace=True)
imps.drop_duplicates('corr_group', keep='last', inplace=True)
feature_set = feature_set.append(imps)

feature_set.to_csv(datapath+'best_feats_'+data_num+'.csv', index=False)
