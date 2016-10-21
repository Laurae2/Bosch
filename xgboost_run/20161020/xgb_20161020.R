library(data.table)
library(recommenderlab)
library(xgboost)
library(caret)
library("Metrics")
library('doParallel')
library('foreach')
library(feather)
setwd("~/kaggle/Bosche/code")
source("utils.R")
library(randomForest)

#train = readRDS('datasets/train_sparse.rds')
#test = readRDS('datasets/test_sparse.rds')
#train <- train[,2:(train@Dim[2])]
Y = readRDS('datasets/y.rds')

train = fread('../input/train_eng.csv')
test = fread('../input/test_eng.csv')

train = train[,cluster_n500:=NULL]
train = train[,unique_path:=NULL]
train = train[,Id:=NULL]
train = train[,Response:=NULL]
test = test[,unique_path:=NULL]
test = test[,cluster_n500:=NULL]
test = test[,Id:=NULL]
test = test[,colnames(train),with = F]


train = dropNA(as.matrix(train))
test = dropNA(as.matrix(test))

features <- list()
folded <- StratifiedCV(Y, 5, 11111)
i <- 0
gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

predictions1 <- numeric(1183747)
predictions2 <- numeric(1183748)
predictions3 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))
for (j in 1:5) {
  #sink(file = "../logs/20161010_xgb_level1_log.txt", append = TRUE, split = FALSE)
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  i <- 0
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 12,
                              nrounds = 1000000,
                              max_depth = 8,
                              eta = 0.05,
                              #gamma = 20,
                              subsample = 0.8,
                              colsample_bytree = 0.8,
                              booster = "gbtree",
                              #feval = mcc_eval_nofail,
                              eval_metric = "auc",
                              #maximize = TRUE,
                              print_every_n = 10,
                              base_score = 0.005,
                              early_stopping_rounds = 30,
                              objective = "binary:logistic",
                              verbose = TRUE,
                              prediction = TRUE,
                              watchlist = list(train = dval1, test = dval2)
                              # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                              #                                maximize = TRUE,
                              #                                verbose = TRUE))
  )
  )
  #sink()
  gc(verbose = FALSE)
  predictions1[folded[[j]]] <- predict(temp_model, dval2, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of validation predictions: ", mean(predictions1[folded[[j]]]))
  gc(verbose = FALSE)
  predictions3[, j] <- predict(temp_model, dtest, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of test predictions: ", mean(predictions3[, j]))
  predictions2 <- predictions3[, j] + predictions2
  cat("\nAverage of rolling test predictions: ", mean(predictions2) * (5 / j))
  gc(verbose = FALSE)
  features[[j]] <- xgb.importance(feature_names = train@Dimnames[[2]], model = temp_model)
  gc(verbose = FALSE)
  cat("\nFold ", j, ": MCC=", mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
  result = data.frame(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  importance_matrix <- xgb.importance(train@Dimnames[[2]], model = temp_model)
  xgb.plot.importance(importance_matrix[1:30])
  print(importance_matrix[1:10])
  #write.csv(predictions1, file = "Laurae/20160928_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
  #write.csv(predictions3, file = "Laurae/20160928_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
  #write.csv(features[[j]], file = paste("Laurae/20160928_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
}
predictions2  = predictions2/5


write.csv(predictions1,'../stacking/level1_train_20161020_feature_set7.csv',row.names = F)
write.csv(predictions2,'../stacking/level1_test_level1_20161020_feature_set7.csv',row.names = F)

temp_mcc <- numeric(5)
best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc[j]
  cat("Fold ", j, ": MCC=", temp_mcc[j], " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
}
cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")

best_mcc <- 0
for (j in 1:5) {
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
}


submission1 <- fread("../input/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions2 >= best_mcc)
print(sum(submission1$Response == 1))
write.csv(submission1, file = "../submission/201601010_xgb_level1.csv", row.names = FALSE)


tr_feature1 = fread('../stacking/level1_train_20161010.csv')
tr_feature2 = fread('../stacking/level1_train_20161010_feature_set2.csv')
tr_feature3 = fread('../stacking/level1_train_20161010_feature_set3.csv')
tr_feature4 = fread('../stacking/level1_train_20161010_feature_set4.csv')
tr_feature5 = fread('../stacking/level1_train_20161011_feature_set5.csv')
tr_feature6 = fread('../stacking/level1_train_20161013_feature_set6.csv')
tr_feature7 = fread('../stacking/level1_train_20161020_feature_set7.csv')


te_feature1 = fread('../stacking/level1_test_level1_train_20161010.csv')
te_feature2 = fread('../stacking/level1_test_level1_train_20161010_feature_set2.csv')
te_feature3 = fread('../stacking/level1_test_level1_train_20161010_feature_set3.csv')
te_feature4 = fread('../stacking/level1_test_level1_train_20161010_feature_set4.csv')
te_feature5 = fread('../stacking/level1_test_level1_train_20161011_feature_set5.csv')
te_feature6 = fread('../stacking/level1_test_level1_20161013_feature_set6.csv')
te_feature7 = fread('../stacking/level1_test_level1_20161020_feature_set7.csv')

train_numeric_sparse = readRDS('datasets/train_numeric_dedup.rds')
test_numeric_sparse = readRDS('datasets/test_numeric_dedup.rds')
train_date_sparse = readRDS('datasets/train_date_dedup.rds')
test_date_sparse = readRDS('datasets/test_date_dedup.rds')

tr = cbind(train_numeric_sparse[,2:(dim(train_numeric_sparse)[2]-1),with = F],train_date_sparse[,2:(dim(train_date_sparse)[2]),with = F])
te = cbind(test_numeric_sparse[,2:(dim(test_numeric_sparse)[2]),with = F],test_date_sparse[,2:(dim(test_date_sparse)[2]),with = F])

tr = dropNA(as.matrix(tr))
te = dropNA(as.matrix(te))

train <- cbind(tr_feature1$x,tr_feature2$x,tr_feature3$x,tr_feature4$x,tr_feature5$x,tr_feature6$x,tr_feature7$x,Y)
test <- cbind(te_feature1$x,te_feature2$x,te_feature3$x,te_feature4$x,te_feature5$x,te_feature6$x,te_feature7$x)
#train@Dimnames[2][[1]][1089:1093] = c('feature1','feature2','feature3','feature4','feature5')
#test@Dimnames[2][[1]][1089:1093] = c('feature1','feature2','feature3','feature4','feature5')
#train@Dimnames[2][[1]][1:6] = c('feature1','feature2','feature3','feature4','feature5','feature6')
#test@Dimnames[2][[1]][1:6] = c('feature1','feature2','feature3','feature4','feature5','feature6')
#write_feather(as.data.frame(train),'../input/tr_stack.feather')
#write_feather(as.data.frame(test),'../input/te_stack.feather')


gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

predictions4 <- numeric(1183747)
predictions5 <- numeric(1183748)
predictions6 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))
predictions4_rf <- numeric(1183747)
predictions5_rf <- numeric(1183748)
predictions6_rf <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))

for (j in 1:5) {
  
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  
  i <- 0
  #sink(file = "../logs/20161011_xgb_level2_log.txt", append = TRUE, split = FALSE)
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  temp_model <- xgb.train(data = dval1,
                          nthread = 12,
                          nrounds = 1000000,
                          max_depth = 5,
                          eta = 0.05,
                          #gamma = 20,
                          subsample = 0.8,
                          colsample_bytree = 0.6,
                          booster = "gbtree",
                          #feval = mcc_eval_nofail,
                          eval_metric = "auc",
                          #maximize = TRUE,
                          print_every_n = 10,
                          early_stopping_rounds = 30,
                          objective = "binary:logistic",
                          verbose = TRUE,
                          prediction = TRUE,
                          watchlist = list(train = dval1, test = dval2)
                          # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                          #                                maximize = TRUE,
                          #                                verbose = TRUE))
  )
  
  rf = randomForest(x = train[(1:1183747)[-folded[[j]]],],y = Y[(1:1183747)[-folded[[j]]]],n = 100)
  predictions4_rf[folded[[j]]] = predict(rf,train[(1:1183747)[folded[[j]]]])
  #sink()
  gc(verbose = FALSE)
  predictions4[folded[[j]]] <- predict(temp_model, dval2, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of validation predictions: ", mean(predictions4[folded[[j]]]))
  gc(verbose = FALSE)
  predictions6[, j] <- predict(temp_model, dtest, ntreelimit = temp_model$best_iteration)
  predictions6_rf[, j] <- predict(rf, test)
  
  cat("\nAverage of test predictions: ", mean(predictions6[, j]))
  predictions5 <- predictions6[, j] + predictions5
  predictions5_rf <- predictions6_rf[, j] + predictions5_rf
  cat("\nAverage of xgb rolling test predictions: ", mean(predictions5) * (5 / j))
  cat("\nAverage of rf rolling test predictions: ", mean(predictions5_rf) * (5 / j))
  gc(verbose = FALSE)
  #features[[j]] <- xgb.importance(feature_names = train@Dimnames[[2]], model = temp_model)
  gc(verbose = FALSE)
  cat("\nFold xgb", j, ": MCC=", mcc_eval_print(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
  cat("\nFold rf", j, ": MCC=", mcc_eval_print(y_prob = predictions4_rf[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
  cat("\nFold xgb rf", j, ": MCC=", mcc_eval_print(y_prob = predictions4[folded[[j]]] * 0.6 + predictions4_rf[folded[[j]]]  * 0.4, y_true = Y[folded[[j]]]), "\n", sep = "")
  
  result = data.frame(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]])
  result_rf = data.frame(y_prob = predictions4_rf[folded[[j]]], y_true = Y[folded[[j]]])
  #importance_matrix <- xgb.importance(train@Dimnames[[2]], model = temp_model)
  #xgb.plot.importance(importance_matrix[1:30])
  #print(importance_matrix[1:10])
  #write.csv(predictions1, file = "Laurae/20160928_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
  #write.csv(predictions3, file = "Laurae/20160928_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
  #write.csv(features[[j]], file = paste("Laurae/20160928_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
}

predictions5 = predictions5/5


best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc[j]
  cat("Fold ", j, ": MCC=", temp_mcc[j], " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}
cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")



best_mcc <- 0
for (j in 1:5) {
  temp_mcc <- mcc_eval_pred(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
}

submission1 <- fread("../input/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions5 >= best_mcc)
print(sum(submission1$Response == 1))
write.csv(submission1, file = "../submission/20161011_xgb.csv", row.names = FALSE)





whole_model <- xgb.train(data = dtrain,
                         nthread = 12,
                         nrounds = 170,
                         max_depth = 10,
                         eta = 0.05,
                         #gamma = 20,
                         subsample = 0.8,
                         colsample_bytree = 0.6,
                         booster = "gbtree",
                         #feval = mcc_eval_nofail,
                         eval_metric = "auc",
                         #maximize = TRUE,
                         print_every_n = 10,
                         #early_stopping_rounds = 30,
                         objective = "binary:logistic",
                         verbose = TRUE
                         #prediction = TRUE,
                         #watchlist = list(train = dval1, test = dval2)
                         # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                         #                                maximize = TRUE,
                         #                                verbose = TRUE))
)


whole_predictions = predict(whole_model, dtest)

best_mcc <- 0
for (j in 1:5) {
  temp_mcc <- mcc_eval_pred(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
}

tr_whole_predictions = predict(whole_model,dtrain)
temp_mcc <- mcc_eval_pred(y_prob = tr_whole_predictions, y_true = Y)


submission1 <- fread("../input/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(whole_predictions >= (best_mcc))
print(sum(submission1$Response == 1))
write.csv(submission1, file = "../submission/201601011_xgb_whole_v2.csv", row.names = FALSE)


train = as.data.frame(dropNA2matrix(train))
test = as.data.frame(dropNA2matrix(test))
write_feather(as.data.frame(train), '../input/train2.feather')
write_feather(test, '../input/test2.feather')

write_feather(na_data[,c("Id","path","startTime"),with = F],'../input/na_data.feather')


submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 3)
print(sum(submission2$Response == 1))
write.csv(submission2, file = "../submission/201601009_xgb.csv", row.names = FALSE)



a = fread('../submission/201601006_xgb.csv')
sum(a$Response==1)