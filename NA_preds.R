
library(dplyr)
library(data.table)
library(Matrix)
library(xgboost)

train_num = fread("/Users/alexpapiu/Documents/Data/Bosh/train_numeric.csv")
test_num = fread("/Users/alexpapiu/Documents/Data/Bosh/test_numeric.csv")


y_num = train_num$Response
Id = test_num$Id

train_num[is.na(train_num) == 0] = 1
train_num[is.na(train_num)] = 0

test_num[is.na(test_num) == 0] = 1
test_num[is.na(test_num)] = 0



X = train_num %>% select( - Id, - Response) %>% as.matrix() %>% Matrix(sparse = TRUE)

model = xgboost(data = X, label = y_num, nrounds = 40, missing ="NAN", max_depth = 3,
                metrics = "auc", objective = "reg:logistic")



X_test = test_num %>% select( - Id) %>% as.matrix() %>% Matrix(sparse = TRUE)
preds = predict(model, X_test)

prob_solution = data.frame(Id = test_num$Id, Response = preds)
write.csv(prob_solution, "/Users/alexpapiu/Documents/Data/Bosh/NA_probs.csv", row.names = FALSE)


predz = 1*(preds > 0.18) #having around 2000 defective here is fine.

solution = data.frame(Id = Id, Response = predz)
write.csv(solution, "/Users/alexpapiu/Documents/Data/Bosh/NA_preds.csv", row.names = FALSE)