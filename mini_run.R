library(data.table)
library(recommenderlab)
library(xgboost)
library(caret)
library("Metrics")
library('doParallel')
library('foreach')
setwd("~/kaggle/Bosche/code")

################################################################################
# lauraue, i put your utility function in a folder so you won't see them below. you probably have to have them in order
# for the script to run. thanks
###################################################################################

category_features <- c("L3_S32_F3854", "L3_S32_F3851", "L1_S24_F1523", "L1_S24_F1525", "L2_S26_F3038", "L1_S24_F1530",
                       "L1_S24_F819",  "L2_S27_F3131", "L3_S29_F3475", "L3_S29_F3317")

train_categorical <- readRDS("datasets/train_categorical.rds")
print(format(object.size(train_categorical), units = "MB"))
train_categorical <- train_categorical[, category_features, with = FALSE]
gc()
test_categorical <- readRDS("datasets/test_categorical.rds")
print(format(object.size(test_categorical), units = "MB"))
test_categorical <- test_categorical[, category_features, with = FALSE]

data_categorical <- rbind(train_categorical, test_categorical)
gc()

temp_sparse <- cbind(t(fac2sparse(data_categorical[["L3_S32_F3851"]])),
                     t(fac2sparse(data_categorical[["L1_S24_F1523"]])),
                     t(fac2sparse(data_categorical[["L2_S26_F3038"]])),
                     t(fac2sparse(data_categorical[["L1_S24_F819"]])),
                     t(fac2sparse(data_categorical[["L2_S27_F3131"]])),
                     t(fac2sparse(data_categorical[["L3_S29_F3475"]])),
                     t(fac2sparse(data_categorical[["L3_S29_F3317"]])))
temp_sparse <- temp_sparse[, c(2, 4, 6, 8, 10, 12, 14)]
temp_sparse@Dimnames[[2]] <- c("L3_S32_F3851:T1", "L1_S24_F1523:T1", "L2_S26_F3038:T1", "L1_S24_F819:T1", "L2_S27_F3131:T1", "L3_S29_F3475:T1", "L3_S29_F3317:T1")
temp_sparse2 <- cbind(sparse.model.matrix(~ .-1, data = data_categorical[, 1, with = FALSE]),
                      sparse.model.matrix(~ .-1, data = data_categorical[, 4, with = FALSE]),
                      sparse.model.matrix(~ .-1, data = data_categorical[, 6, with = FALSE]))
temp_sparse2@Dimnames[[2]] <- gsub("T", ":T", temp_sparse2@Dimnames[[2]])
temp_sparse2 <- temp_sparse2[, c(1:30, 32:44)]
data_categorical_sparse <- cbind(temp_sparse, temp_sparse2)
rm(temp_sparse, temp_sparse2)
rm(train_categorical, test_categorical, data_categorical, category_features)

numeric_features <- c("L3_S32_F3850", "L3_S29_F3412", "L1_S24_F1723", "L3_S33_F3865", "L1_S24_F1846", "L1_S24_F1695",
                      "L3_S33_F3859", "L3_S30_F3519", "L3_S33_F3873", "L3_S29_F3407", "L1_S24_F1632", "L3_S30_F3724",
                      "L3_S30_F3809", "L3_S29_F3382", "L1_S24_F1604", "L3_S30_F3704", "L1_S24_F1844", "L1_S24_F1498",
                      "L3_S38_F3956", "L3_S38_F3960", "L3_S33_F3867", "L3_S33_F3857", "L3_S29_F3351", "L3_S38_F3952",
                      "L1_S24_F867",  "L3_S29_F3339", "L3_S33_F3855", "L0_S0_F20",    "L3_S30_F3744", "L3_S30_F3554",
                      "L3_S34_F3880", "L2_S26_F3040", "L3_S29_F3395", "L3_S30_F3754", "L3_S29_F3479", "L3_S29_F3458",
                      "L2_S27_F3166", "L3_S30_F3804", "L1_S24_F1609", "L3_S30_F3759", "L1_S24_F1842", "L0_S0_F22",   
                      "L3_S36_F3920", "L0_S1_F24",    "L0_S4_F104",   "L3_S29_F3348", "L3_S33_F3861", "L1_S24_F1758",
                      "L0_S12_F350",  "L3_S29_F3336", "L3_S34_F3876", "L3_S30_F3769", "L3_S30_F3774", "L1_S24_F1578",
                      "L0_S1_F28")


train_numeric_sparse <- readRDS("datasets/train_numeric_sparse.rds")
Y <- train_numeric_sparse[, train_numeric_sparse@Dim[2]]
train_numeric_sparse <- train_numeric_sparse[, numeric_features]
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))

test_numeric_sparse <- readRDS("datasets/test_numeric_sparse.rds")
test_numeric_sparse <- test_numeric_sparse[, numeric_features]
print(test_numeric_sparse@Dim[2])
print(format(object.size(test_numeric_sparse), units = "MB"))

train_mini <- cbind(train_numeric_sparse, data_categorical_sparse[1:1183747, ])
gc()
test_mini <- cbind(test_numeric_sparse, data_categorical_sparse[1183748:2367495, ])
gc()

rm(train_numeric_sparse, test_numeric_sparse, data_categorical_sparse)
rm(numeric_features)


train_categorical_sparse <- readRDS("datasets/train_categorical_sparse_dedup.rds")
print(train_categorical_sparse@Dim[2])
print(format(object.size(train_categorical_sparse), units = "MB"))

gc()
#train_numeric_sparse <- readRDS("/train_numeric_sparse_decor.rds")
#print(train_numeric_sparse@Dim[2])
#print(format(object.size(train_numeric_sparse), units = "MB"))

#gc()
#train_date_sparse <- readRDS("datasets/train_date_sparse_decor.rds")
#print(train_date_sparse@Dim[2])
#print(format(object.size(train_date_sparse), units = "MB"))


gc()
test_categorical_sparse <- readRDS("datasets/test_categorical_sparse_dedup.rds")
print(test_categorical_sparse@Dim[2])
print(format(object.size(test_categorical_sparse), units = "MB"))

#gc()
#test_numeric_sparse <- readRDS("datasets/test_numeric_sparse_decor.rds")
#print(test_numeric_sparse@Dim[2])
#print(format(object.size(test_numeric_sparse), units = "MB"))
NA_features <- readRDS("../input/DateFeatures/NA_features.rds")
Mean_features <- readRDS("../input/DateFeatures/Mean_features.rds")
#Min_features <- readRDS("../input/DateFeatures/Min_features.rds")
MinMin_features <- readRDS("../input/DateFeatures/MinMin_features.rds")
Max_features <- readRDS("../input/DateFeatures/Max_features.rds")
MaxMax_features <- readRDS("../input/DateFeatures/MaxMax_features.rds")
Time0_features <- readRDS("../input/DateFeatures/Time0_features.rds")
FirstLast_features <- readRDS("../input/DateFeatures/StationFirstLast_features.rds")
Timing_features <- readRDS("../input/DateFeatures/StationTiming_features.rds")
TimeToExitStation_features <- readRDS("../input/DateFeatures/TimeToExitStation_features.rds")
TimeToExitProduction_features <- readRDS("../input/DateFeatures/TimeToExitProduction_features.rds")

Date_features <- cbind(NA_features,
                       Mean_features,
                       #Min_features,
                       MinMin_features,
                       Max_features,
                       MaxMax_features,
                       Time0_features,
                       Timing_features,
                       TimeToExitStation_features,
                       TimeToExitProduction_features)

Date_features_train <- as.matrix(Date_features[1:1183747, ])
gc()
Date_features_train <- dropNA(Date_features_train)
gc()
Date_features_test <- as.matrix(Date_features[1183748:2367495, ])
gc()
Date_features_test <- dropNA(Date_features_test)
gc()




train <- cbind(train_mini, Date_features_train)
test <- cbind(test_mini, Date_features_test)
features <- list()

StratifiedCV <- function(Y, i, seed) {
  folded <- list()
  folded1 <- list()
  folded2 <- list()
  set.seed(seed)
  temp_Y0 <- which(Y == 0)
  temp_Y1 <- which(Y == 1)
  for (i in 1:5) {
    folded1[[i]] <- sample(temp_Y0, floor(length(temp_Y0) / (6 - i)))
    temp_Y0 <- temp_Y0[!temp_Y0 %in% folded1[[i]]]
    folded2[[i]] <- sample(temp_Y1, floor(length(temp_Y1) / (6 - i)))
    temp_Y1 <- temp_Y1[!temp_Y1 %in% folded2[[i]]]
    folded[[i]] <- c(folded1[[i]], folded2[[i]])
  }
  return(folded)
}

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
j =2
for (j in 1:5) {
  
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
                              early_stopping_rounds = 10,
                              objective = "binary:logistic",
                              verbose = TRUE,
                              prediction = TRUE,
                              watchlist = list(train = dval1, test = dval2)
                              # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                              #                                maximize = TRUE,
                              #                                verbose = TRUE))
  )
  )
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
  #write.csv(predictions1, file = "Laurae/20160928_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
  #write.csv(predictions3, file = "Laurae/20160928_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
  #write.csv(features[[j]], file = paste("Laurae/20160928_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
}