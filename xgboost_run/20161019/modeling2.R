library(data.table)
library(recommenderlab)
library(xgboost)
library(caret)
library("Metrics")
library('doParallel')
library('foreach')
setwd("~/kaggle/Bosche/code")
source("utils.R")

train = readRDS('datasets/train_sparse.rds')
test = readRDS('datasets/test_sparse.rds')
train <- train[,2:(train@Dim[2])]
Y = readRDS('datasets/y.rds')
leak = fread('../input/leak_feature.csv')
leak[,Response:=NULL]
leak[,Id:=NULL]
leak <- dropNA(as.matrix(leak))


train = cbind(train,leak[1:dim(train)[1],])
test = cbind(test,leak[(dim(train)[1]+1):(dim(leak)[1]),])

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
  sink(file = "../logs/20161009_xgb_level1_log.txt", append = TRUE, split = FALSE)
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  i <- 0
  #sink(file = "Laurae/20160928_xgb_superlarge/logs.txt", append = TRUE, split = FALSE)
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 12,
                              nrounds = 1000000,
                              max_depth = 10,
                              eta = 0.05,
                              #gamma = 20,
                              subsample = 0.8,
                              colsample_bytree = 0.8,
                              booster = "gbtree",
                              #feval = mcc_eval_nofail,
                              eval_metric = "auc",
                              #maximize = TRUE,
                              print_every_n = 10,
                              early_stopping_rounds = 20,
                              objective = "binary:logistic",
                              verbose = TRUE,
                              prediction = TRUE,
                              watchlist = list(train = dval1, test = dval2)
                              # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                              #                                maximize = TRUE,
                              #                                verbose = TRUE))
  )
  )
  sink()
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


write.csv(predictions1,'../input/prediction_train.csv',row.names = F)
write.csv(predictions2,'../input/prediction_test.csv',row.names = F)

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


train <- cbind(train,predictions1)
test <- cbind(test,predictions2)

gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

predictions4 <- numeric(1183747)
predictions5 <- numeric(1183748)
predictions6 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))
for (j in 1:5) {
  
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  
  i <- 0
  sink(file = "../logs/20161009_xgb_level2_log.txt", append = TRUE, split = FALSE)
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 12,
                              nrounds = 1000000,
                              max_depth = 6,
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
  )
  sink()
  gc(verbose = FALSE)
  predictions4[folded[[j]]] <- predict(temp_model, dval2, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of validation predictions: ", mean(predictions4[folded[[j]]]))
  gc(verbose = FALSE)
  predictions6[, j] <- predict(temp_model, dtest, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of test predictions: ", mean(predictions6[, j]))
  predictions5 <- predictions6[, j] + predictions5
  cat("\nAverage of rolling test predictions: ", mean(predictions5) * (5 / j))
  gc(verbose = FALSE)
  features[[j]] <- xgb.importance(feature_names = train@Dimnames[[2]], model = temp_model)
  gc(verbose = FALSE)
  cat("\nFold ", j, ": MCC=", mcc_eval_print(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
  
  result = data.frame(y_prob = predictions4[folded[[j]]], y_true = Y[folded[[j]]])
  importance_matrix <- xgb.importance(train@Dimnames[[2]], model = temp_model)
  xgb.plot.importance(importance_matrix[1:30])
  print(importance_matrix[1:10])
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
write.csv(submission1, file = "../submission/201601009_xgb.csv", row.names = FALSE)

best_mcc <- 0
for (j in 1:5) {
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + as.numeric(predictions3[, j] >= temp_mcc)
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
  
}

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 3)
print(sum(submission2$Response == 1))
write.csv(submission2, file = "../submission/201601009_xgb.csv", row.names = FALSE)

a = fread('../submission/201601006_xgb.csv')
sum(a$Response==1)