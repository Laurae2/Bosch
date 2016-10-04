#%% Try with scikit-learn

from sklearn.neighbors import NearestNeighbors
import datetime

nbrs = NearestNeighbors(n_neighbors = 1, algorithm = 'brute', p = 1) # auto "brute" with sparse
neighs = nbrs.fit(Xtrain)
predict = neighs.kneighbors(X = Xtest[0:1000], n_neighbors = 1, return_distance = True)

#%%

predict2 = neighs.kneighbors(X = Xtrain[0:10], n_neighbors = 1, return_distance = True)
for i in range(0, 10):
    print([x[i] for x in predict2])

#list(predict2)[0]
#list(predict2)[1]
#np.concatenate((list(predict2)[0],list(predict2)[1]))

#%% super mega predictions
# Done on test set

knnearst = 128

predict3 = neighs.kneighbors(X = Xtest[0], n_neighbors = knnearst, return_distance = True)
distances = list(predict3)[0]
closest = list(predict3)[1]+1

# 112070 = 2*5*7*1601

#for i in range(0, 71):
for i in range(0, 1601):
    i_min = i*1601+1
    i_max = (i+1)*1601+1
    predict3 = neighs.kneighbors(X = Xtest[i_min:i_max], n_neighbors = knnearst, return_distance = True)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), "=> Doing", i_min, "to", i_max, "(", "%06f" % (100*i_max/112071), "%)")
    distances = np.concatenate((distances, list(predict3)[0]))
    closest = np.concatenate((closest, list(predict3)[1]+1))

np.savetxt("leak_distance.csv", distances, delimiter=",")
np.savetxt("leak_closest.csv", closest, delimiter=",")


#%%
# Prepare Predict out-of-fold leaks

from sklearn import cross_validation
targetencoder = LabelEncoder().fit(gatrain.group)
y = targetencoder.transform(gatrain.group)
folds = list(cross_validation.StratifiedKFold(y = y, n_folds = 10, shuffle = True, random_state = 11111))
np.savetxt('Fold01sff.csv', folds[0][0], delimiter = ',', header = 'Fold01')
np.savetxt('Fold02sff.csv', folds[1][0], delimiter = ',', header = 'Fold02')
np.savetxt('Fold03sff.csv', folds[2][0], delimiter = ',', header = 'Fold03')
np.savetxt('Fold04sff.csv', folds[3][0], delimiter = ',', header = 'Fold04')
np.savetxt('Fold05sff.csv', folds[4][0], delimiter = ',', header = 'Fold05')
np.savetxt('Fold06sff.csv', folds[5][0], delimiter = ',', header = 'Fold06')
np.savetxt('Fold07sff.csv', folds[6][0], delimiter = ',', header = 'Fold07')
np.savetxt('Fold08sff.csv', folds[7][0], delimiter = ',', header = 'Fold08')
np.savetxt('Fold09sff.csv', folds[8][0], delimiter = ',', header = 'Fold09')
np.savetxt('Fold10sff.csv', folds[9][0], delimiter = ',', header = 'Fold10')
np.savetxt('Fold01sff_v.csv', folds[0][1], delimiter = ',', header = 'Fold01')
np.savetxt('Fold02sff_v.csv', folds[1][1], delimiter = ',', header = 'Fold02')
np.savetxt('Fold03sff_v.csv', folds[2][1], delimiter = ',', header = 'Fold03')
np.savetxt('Fold04sff_v.csv', folds[3][1], delimiter = ',', header = 'Fold04')
np.savetxt('Fold05sff_v.csv', folds[4][1], delimiter = ',', header = 'Fold05')
np.savetxt('Fold06sff_v.csv', folds[5][1], delimiter = ',', header = 'Fold06')
np.savetxt('Fold07sff_v.csv', folds[6][1], delimiter = ',', header = 'Fold07')
np.savetxt('Fold08sff_v.csv', folds[7][1], delimiter = ',', header = 'Fold08')
np.savetxt('Fold09sff_v.csv', folds[8][1], delimiter = ',', header = 'Fold09')
np.savetxt('Fold10sff_v.csv', folds[9][1], delimiter = ',', header = 'Fold10')

#%%
# Do Predict out-of-fold leaks

from sklearn.neighbors import NearestNeighbors
import datetime

for i in range(0, 10):
    #indexes = list(range(1, 1+len(folds[i-1][0])))
    folded1 = np.array(pd.read_csv('Fold'+"%02d" % (i+1)+'sff.csv').ix[:, 0]).astype(int)
    folded2 = np.array(pd.read_csv('Fold'+"%02d" % (i+1)+'sff_v.csv').ix[:, 0]).astype(int)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), "=> Doing", "- [" + len(folded1), + len(folded2) + "]")
    folds = [folded1, folded2]
    nbrs = NearestNeighbors(n_neighbors = 1, algorithm = 'brute', p = 1) # auto "brute" with sparse
    neighs = nbrs.fit(Xtrain[folds[0]])
    predict4 = neighs.kneighbors(X = Xtrain[folds[1]], n_neighbors = knnearst, return_distance = True)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), "=> Done", "%02d" % (i+1), "(", "%02f" % (100*(i+1)/10), "%)")
    distanced = list(predict4)[0]
    closested = folds[0][list(predict4)[1]]+1
    np.savetxt("leak_distance_"+"%02d" % (i+1)+".csv", distanced, delimiter=",")
    np.savetxt("leak_closest_"+"%02d" % (i+1)+".csv", closested, delimiter=",")

#%%

np.savetxt("labels_leak_74645.csv", y)
