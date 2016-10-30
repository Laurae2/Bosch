from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.ensemble import ExtraTreesClassifier, RandomForestClassifier

from sklearn.neighbors import KNeighborsClassifier


#~~~~~~~~~~~~~~
#RANDOM FOREST:
#~~~~~~~~~~~~~~

model = RandomForestClassifier(n_estimators = 10)


#~~~~~~~~~~~~
#EXTRA TRESS: 100 trees in 10 minutes
#~~~~~~~~~~~~

model = ExtraTreesClassifier(n_estimators=100)
model.fit(X, y)

#~~~~
#KNN: crashes...
#~~~~

#scale the data for this?

model = KNeighborsClassifier(n_neighbors=10)

model.fit(X, y)

preds = model.predict(X_val)
roc_auc_score(y_val, preds)


predz = 1*(preds > 0.2)
predz.sum()

matthews_corrcoef(y_val, predz)



def evaluate(model):
    model.fit(X, y)
    print("Done Training")
    preds = model.predict(X_val)
    auc = roc_auc_score(y_val, preds)
    preds = 1*(preds > 0.2)
    mcc = matthews_corrcoef(y_val, preds)
    return (auc, mcc, model)

    #0.1581 with extra trees
    #0.16 with keras
    #0.1848 with RF only 10 trees.
