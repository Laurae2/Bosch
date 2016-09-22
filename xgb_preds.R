#a basic xgboost starter on the numeric train. This gets around 0.211 on the LB.

library(dplyr)
library(data.table)
library(Matrix)
library(xgboost)

train_num = fread("../Data/Bosh/train_numeric.csv")
test_num = fread("../Documents/Data/Bosh/test_numeric.csv")

#making the numeric matrices sparse:
X = train_num %>% select( - Id, - Response) %>% as.matrix()  %>% Matrix(sparse = TRUE)
X_test = test_num %>% select( - Id) %>% as.matrix()  %>% Matrix(sparse = TRUE)
rm(train_num, test_num)

y = train_num$Response

#save.image()

model = xgboost(data = X, label = y, nrounds = 40, missing ="NAN", max_depth = 3,
                metrics = "auc", objective = "binary:logistic")

gc()

preds = predict(model, X_test)
predz = 1*(preds > 0.20) 

solution = data.frame(Id = test_num$Id, Response = predz)
write.csv(solution, "../Data/Bosh/Preds/first_predz_022tresh_0isna_17.csv", row.names = FALSE)
