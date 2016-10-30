import numpy as np
import pandas as pd
from keras.layers import Dense, Dropout
from keras.models import Sequential
from sklearn.preprocessing import StandardScaler, MaxAbsScaler
from sklearn.metrics import matthews_corrcoef, roc_auc_score


train = pd.read_csv("/Users/alexpapiu/Documents/Data/Bosh/train_numeric.csv")
fold3 = pd.read_csv("/Users/alexpapiu/Documents/Data/Bosh/folds/folds03.csv")

#filling with 0 works best:
train = train.fillna(0)


train_mask = np.setdiff1d(np.arange(train.shape[0]), fold3.x)
val = train.iloc[fold3.x]
train = train.iloc[train_mask]

X = train.loc[:,"L3_S32_F3850":"L0_S1_F28"].values
X_val = val.loc[:,"L3_S32_F3850":"L0_S1_F28"].values


#doing PCA doesn't work:
scale = make_pipeline(StandardScaler(), PCA(n_components = 30))
#X = scale.fit_transform(X)
#X_val = scale.fit_transform(X_val)

#doing MaxAbsScaler doesn't help:
scale = MaxAbsScaler()

y = train.Response.values
y_val = val.Response.values

#~~~~~~
#KERAS:
#~~~~~~

model = Sequential()
model.add(Dense(512, activation="relu", input_dim= X.shape[1]))
model.add(Dropout(0.3))

#adding another layer not much improvment
#model.add(Dense(512, activation="relu"))
#model.add(Dropout(0.3))

model.add(Dense(1, activation="sigmoid"))

model.compile(loss = "binary_crossentropy", optimizer="adam")

hsit = model.fit(X, y, validation_data= (X_val, y_val),
                 nb_epoch=10, batch_size=256, verbose=1)

pd.DataFrame(hsit.history)


preds = model.predict(X_val)
roc_auc_score(y_val, preds)


preds = 1*(preds[:, 1] > 0.2)
preds.sum()

matthews_corrcoef(y_val, preds)
