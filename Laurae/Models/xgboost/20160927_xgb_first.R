# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(xgboost)
library(Laurae)
library(fastdigest)
library(pbapply)

setwd("E:/")

category_features <- c("L3_S32_F3854", "L3_S32_F3851", "L1_S24_F1523", "L1_S24_F1525", "L2_S26_F3038", "L1_S24_F1530",
                       "L1_S24_F819",  "L2_S27_F3131", "L3_S29_F3475", "L3_S29_F3317")
# Uncommon is L3_S32_F3854:T65536

gc()
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

gc()
train_numeric_sparse <- readRDS("datasets/train_numeric_sparse.rds")
Y <- train_numeric_sparse[, train_numeric_sparse@Dim[2]]
train_numeric_sparse <- train_numeric_sparse[, numeric_features]
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))

#gc()
#train_date_sparse <- readRDS("datasets/train_date_sparse_decor.rds")
#print(train_date_sparse@Dim[2])
#print(format(object.size(train_date_sparse), units = "MB"))



gc()
test_numeric_sparse <- readRDS("datasets/test_numeric_sparse.rds")
test_numeric_sparse <- test_numeric_sparse[, numeric_features]
print(test_numeric_sparse@Dim[2])
print(format(object.size(test_numeric_sparse), units = "MB"))

#gc()
#test_date_sparse <- readRDS("datasets/test_date_sparse_decor.rds")
#print(test_date_sparse@Dim[2])
#print(format(object.size(test_date_sparse), units = "MB"))


# train_numeric_sparse <- train_numeric_sparse[, c(2:(train_numeric_sparse@Dim[2] - 1))]
# gc()
# train_categorical_sparse <- train_categorical_sparse[, c(2:train_categorical_sparse@Dim[2])]
# gc()
#train_date_sparse <- train_date_sparse[, c(2:train_date_sparse@Dim[2])]
#gc()
# test_numeric_sparse <- test_numeric_sparse[, c(2:test_numeric_sparse@Dim[2])]
# gc()
# test_categorical_sparse <- test_categorical_sparse[, c(2:test_categorical_sparse@Dim[2])]
# gc()
#test_date_sparse <- test_date_sparse[, c(2:test_date_sparse@Dim[2])]
#gc()

#train <- cbind(train_numeric_sparse, train_categorical_sparse, train_date_sparse)
train <- cbind(train_numeric_sparse, data_categorical_sparse[1:1183747, ])
gc()
#test <- cbind(test_numeric_sparse, test_categorical_sparse, test_date_sparse)
test <- cbind(test_numeric_sparse, data_categorical_sparse[1183748:2367495, ])
gc()

#rm(train_numeric_sparse, train_categorical_sparse, train_date_sparse, test_numeric_sparse, test_categorical_sparse, test_date_sparse)
rm(train_numeric_sparse, test_numeric_sparse, data_categorical_sparse)
rm(numeric_features)

gc()


NA_features <- readRDS("Laurae/DateFeatures/NA_features.rds")
#Mean_features <- readRDS("Laurae/DateFeatures/Mean_features.rds")
Min_features <- readRDS("Laurae/DateFeatures/Min_features.rds")
MinMin_features <- readRDS("Laurae/DateFeatures/MinMin_features.rds")
Max_features <- readRDS("Laurae/DateFeatures/Max_features.rds")
MaxMax_features <- readRDS("Laurae/DateFeatures/MaxMax_features.rds")
Time0_features <- readRDS("Laurae/DateFeatures/Time0_features.rds")
FirstLast_features <- readRDS("Laurae/DateFeatures/StationFirstLast_features.rds")
Timing_features <- readRDS("Laurae/DateFeatures/StationTiming_features.rds")
TimeToExitStation_features <- readRDS("Laurae/DateFeatures/TimeToExitStation_features.rds")
TimeToExitProduction_features <- readRDS("Laurae/DateFeatures/TimeToExitProduction_features.rds")

# temp_NAs <- pbapply(Mean_features, 2, function(x) {2367495 - sum(is.na(x))})
# Mean_features <- Mean_features[, which(temp_NAs > 25), with = FALSE]
# gc()

temp_NAs <- pbapply(Min_features, 2, function(x) {2367495 - sum(is.na(x))})
Min_features <- Min_features[, which(temp_NAs > 35), with = FALSE]
gc()

temp_NAs <- pbapply(Max_features, 2, function(x) {2367495 - sum(is.na(x))})
Min_features <- Max_features[, which(temp_NAs > 35), with = FALSE]
gc()

temp_NAs <- pbapply(Time0_features, 2, function(x) {2367495 - sum(is.na(x))})
Time0_features <- Time0_features[, which(temp_NAs > 35), with = FALSE]
gc()

temp_NAs <- pbapply(Timing_features, 2, function(x) {2367495 - sum(is.na(x))})
Timing_features <- Timing_features[, which(temp_NAs > 35), with = FALSE]
gc()

temp_NAs <- pbapply(TimeToExitStation_features, 2, function(x) {2367495 - sum(is.na(x))})
TimeToExitStation_features <- TimeToExitStation_features[, which(temp_NAs > 35), with = FALSE]
gc()



rm(temp_NAs)
gc()

Date_features <- cbind(NA_features,
                       #Mean_features,
                       Min_features,
                       MinMin_features,
                       Max_features,
                       MaxMax_features,
                       Time0_features,
                       Timing_features,
                       TimeToExitStation_features,
                       TimeToExitProduction_features)

rm(NA_features,
   #Mean_features,
   Min_features,
   MinMin_features,
   Max_features,
   MaxMax_features,
   Time0_features,
   Timing_features,
   TimeToExitStation_features,
   TimeToExitProduction_features)
gc()

spooky <- numeric(ncol(Date_features))
for (i in 1:ncol(Date_features)) {
  spooky[i] <- fastdigest(Date_features[[i]][1:1183747]) # Compute hash only on training data... obviously
  cat("Iteration ", i, " --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = "")
}
Date_features <- Date_features[, which(!duplicated(spooky)), with = FALSE]
gc()

spooky <- pbapply(Date_features, 2, function(x) {r <- ifelse((min(x, na.rm = TRUE) == max(x, na.rm = TRUE)), TRUE, FALSE); gc(verbose = FALSE); r})
gc()
Date_features <- Date_features[, which(!spooky), with = FALSE]
gc()

FirstLast_features_fact <- FirstLast_features
FirstLast_features_fact$FirstStation <- as.factor(FirstLast_features$FirstStation)
FirstLast_features_fact$LastStation <- as.factor(FirstLast_features$LastStation)

temp_sparse <- cbind(model.matrix(~ .-1, data = model.frame(FirstLast_features_fact[, 1, with = FALSE], na.action = na.pass)),
                     model.matrix(~ .-1, data = model.frame(FirstLast_features_fact[, 2, with = FALSE], na.action = na.pass)))

# temp_sparse <- cbind(sparse.model.matrix(~ .-1, data = FirstLast_features_fact[, 1, with = FALSE]),
#                      sparse.model.matrix(~ .-1, data = FirstLast_features_fact[, 2, with = FALSE]))
gc()
temp_sparse <- temp_sparse[, c("FirstStation1", "FirstStation2", "FirstStation13", "FirstStation25",
                               "FirstStation26", "FirstStation27", "FirstStation28", "FirstStation29",
                               "FirstStation30", "FirstStation39", "FirstStation40",
                               "LastStation36", "LastStation37", "LastStation38", "LastStation39",
                               "LastStation50", "LastStation52")]
gc()

rm(FirstLast_features, FirstLast_features_fact)
gc()

rm(spooky, i)
gc()

Date_features <- cbind(Date_features, temp_sparse)
rm(temp_sparse)
gc()

Date_features_train <- as.matrix(Date_features[1:1183747, ])
gc()
Date_features_train <- dropNA(Date_features_train)
gc()
Date_features_test <- as.matrix(Date_features[1183748:2367495, ])
gc()
Date_features_test <- dropNA(Date_features_test)
gc()

train <- cbind(train, Date_features_train)
gc()
saveRDS(train, "Laurae/20160927_xgb_first_better/train_sparse.rds", compress = TRUE)
test <- cbind(test, Date_features_test)
gc()
saveRDS(test, "Laurae/20160927_xgb_first_better/test_sparse.rds", compress = TRUE)

rm(Date_features_train, Date_features_test)
gc()

rm(Date_features)
gc()

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

mcc <- function(TP, FP, FN, TN) {
  num <- (TP * TN) - (FP * FN)
  den <- (TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)
  return(ifelse(den == 0, 0, num / sqrt(den)))
}


gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

max_better <- function(cp) {
  
  return(max(cp, na.rm = TRUE))
  
}

my_learner <- function(depth) {
  
  sink(file = "Laurae/20160927_xgb_first_better/log.txt", append = TRUE, split = FALSE)
  cat("\n\n\nDepth ", depth, "\n\n", sep = "")
  gc()
  set.seed(11111)
  temp_model <- xgb.cv(data = dtrain,
                       nthread = 12,
                       folds = folded,
                       nrounds = 1000000,
                       max_depth = depth,
                       eta = 0.20,
                       #gamma = 0.1,
                       subsample = 1.0,
                       colsample_bytree = 1.0,
                       booster = "gbtree",
                       eval_metric = "auc",
                       maximize = TRUE,
                       early_stopping_rounds = 10,
                       objective = "binary:logistic",
                       verbose = TRUE)
  sink()
  return(c(temp_model$evaluation_log[[4]][temp_model$best_iteration], temp_model$evaluation_log[[5]][temp_model$best_iteration], temp_model$best_iteration))
  
}

xgb.opt.depth.callback <- function(i, learner, better, sd_effect) {
  
  cat("\nExploring depth ", sprintf("%02d", Laurae.xgb.opt.depth.iter[i, "Depth"]), ": ")
  Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], c("mean", "sd", "nrounds")] <<- learner(Laurae.xgb.opt.depth.iter[i, "Depth"])
  Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"] <<- Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"] + (Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "sd"] * sd_effect)
  Laurae.xgb.opt.depth.iter[i, "Score"] <<- Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"]
  Laurae.xgb.opt.depth.iter[i, "Best"] <<- better(Laurae.xgb.opt.depth.df[, "score"])
  Laurae.xgb.opt.depth.best <<- which(Laurae.xgb.opt.depth.df[, "score"] == Laurae.xgb.opt.depth.iter[i, "Best"])[1]
  cat("[",
      sprintf("%05d", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "nrounds"]),
      "] ",
      sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"]),
      ifelse(is.na(Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"]) == TRUE, "", paste("+", sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "sd"]), sep = "")),
      " (Score: ",
      sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"]),
      ifelse(Laurae.xgb.opt.depth.iter[i, "Best"] == Laurae.xgb.opt.depth.iter[i, "Score"], " <<<)", "    )"),
      " - best is: ",
      Laurae.xgb.opt.depth.best,
      sep = "")
  
}



mcc_eval_print <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  gc(verbose = FALSE)
  
  return(max(DT[['mcc_v']]))
  
}

xgb.opt.depth(initial = 10, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)

#Laurae.xgb.opt.depth.best <- 10

features <- list()

predictions1 <- numeric(1183747)
predictions2 <- numeric(1183748)
predictions3 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))

for (j in 1:5) {
  
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  
  i <- 0
  sink(file = "Laurae/20160927_xgb_first_better/logs.txt", append = TRUE, split = FALSE)
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 12,
                              nrounds = 1000000,
                              max_depth = Laurae.xgb.opt.depth.best,
                              eta = 0.025,
                              #gamma = 20,
                              subsample = 1.0,
                              colsample_bytree = 1.0,
                              booster = "gbtree",
                              #feval = mcc_eval_nofail,
                              eval_metric = "auc",
                              maximize = TRUE,
                              early_stopping_rounds = 40,
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
  write.csv(predictions1, file = "Laurae/20160927_xgb_first_better/predictions_oof.csv", row.names = FALSE)
  write.csv(predictions3, file = "Laurae/20160927_xgb_first_better/predictions_test_raw.csv", row.names = FALSE)
  write.csv(features[[j]], file = paste("Laurae/20160927_xgb_first_better/best_features", j, ".csv", sep = ""), row.names = FALSE)
  
}

predictions2 <- predictions2 / 5
write.csv(predictions2, file = "Laurae/20160927_xgb_first_better/predictions_test_mean.csv", row.names = FALSE)




mcc_eval_pred <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  return(DT[['y_prob']][which.max(DT[['mcc_v']])])
  
}



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

submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions2 >= best_mcc)
print(sum(submission1$Response == 1))
write.csv(submission1, file = "Laurae/20160927_xgb_first_better/submission1.csv", row.names = FALSE)

best_mcc <- numeric(1183748)

for (j in 1:5) {
  
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + as.numeric(predictions3[, j] >= temp_mcc)
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
  
}

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 3)
print(sum(submission2$Response == 1))
write.csv(submission2, file = "Laurae/20160927_xgb_first_better/submission2.csv", row.names = FALSE)


submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
print(sum(submission3$Response == 1))
write.csv(submission3, file = "Laurae/20160927_xgb_first_better/submission3.csv", row.names = FALSE)

submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
print(sum(submission4$Response == 1))
write.csv(submission4, file = "Laurae/20160927_xgb_first_better/submission4.csv", row.names = FALSE)
