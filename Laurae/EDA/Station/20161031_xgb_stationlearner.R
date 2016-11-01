# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(Laurae)
library(fastdigest)
library(pbapply)
library(ggplot2)
library(R.utils)
library(stringi)
library(xgboost)

setwd("E:/")

my_script_is_using <- "E:/Laurae/20161031_xgb_stationlearner"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
depth <- 8
eta <- 0.1
min_sample <- 100
min_hess <- 10
subsample <- 1.0
colsample <- 1.0
sampling_freq <- ifelse(subsample == 1, 0, 1)


# Load from RDS
train_numeric <- readRDS("Laurae/DatesSpotting/train_dedup.rds")
test_numeric <- readRDS("Laurae/DatesSpotting/test_dedup.rds")
label <- readRDS("datasets/labels.rds")
feature_names <- fread("Laurae/date_feat_lut_V2.txt", header = TRUE)
feature_names <- feature_names[, c("name_num", "station_V2")]
feature_names <- feature_names[!(feature_names$name_num == ""), ]

StratifiedCV <- function(Y, folds, seed) {
  folded <- list()
  folded1 <- list()
  folded2 <- list()
  set.seed(seed)
  temp_Y0 <- which(Y == 0)
  temp_Y1 <- which(Y == 1)
  for (i in 1:folds) {
    folded1[[i]] <- sample(temp_Y0, floor(length(temp_Y0) / ((folds + 1) - i)))
    temp_Y0 <- temp_Y0[!temp_Y0 %in% folded1[[i]]]
    folded2[[i]] <- sample(temp_Y1, floor(length(temp_Y1) / ((folds + 1) - i)))
    temp_Y1 <- temp_Y1[!temp_Y1 %in% folded2[[i]]]
    folded[[i]] <- c(folded1[[i]], folded2[[i]])
  }
  return(folded)
}

folds <- StratifiedCV(label, 5, 11111)

train_numeric[, Id := NULL]
test_numeric[, Id := NULL]


station_base <- data.frame(matrix(nrow = nrow(feature_names), ncol = 2))
colnames(station_base) <- c("Feature", "Station")
for (i in 1:nrow(feature_names)) {
  station_base$Station[i] <- feature_names$station_V2[i]
  station_base$Feature[i] <- as.numeric(unlist(regmatches(feature_names$name_num[i], gregexpr("[0-9]+", feature_names$name_num[i]))))[3]
}


station_reference <- data.frame(matrix(nrow = ncol(train_numeric), ncol = 2))
colnames(station_reference) <- c("Feature", "Station")
for (i in 1:ncol(train_numeric)) {
  station_reference$Feature[i] <- as.numeric(unlist(regmatches(colnames(train_numeric)[i], gregexpr("[0-9]+", colnames(train_numeric)[i]))))[3]
  station_reference$Station[i] <- station_base$Station[which(station_reference$Feature[i] == station_base$Feature)]
}

station_reference_out <- station_reference$Station


mcc_fixed <- function(y_prob, y_true, prob) {
  
  positives <- as.logical(y_true) # label to boolean
  counter <- sum(positives) # get the amount of positive labels
  tp <- as.numeric(sum(y_prob[positives] > prob))
  fp <- as.numeric(sum(y_prob[!positives] > prob))
  tn <- as.numeric(length(y_true) - counter - fp) # avoid computing he opposite
  fn <- as.numeric(counter - tp) # avoid computing the opposite
  mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
  mcc <- ifelse(is.na(mcc), -1, mcc)
  return(mcc)
  
}

mcc_eval_print <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  gc(verbose = FALSE)
  
  return(max(DT[['mcc_v']]))
  
}

mcc_eval_pred <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  return(DT[['y_prob']][which.max(DT[['mcc_v']])])
  
}

FastROC <- function(y, x) {
  
  # y = actual
  # x = predicted
  x1 = as.numeric(x[y == 1])
  n1 = as.numeric(length(x1))
  x2 = as.numeric(x[y == 0])
  n2 = as.numeric(length(x2))
  r = rank(c(x1,x2))
  return((sum(r[1:n1]) - n1 * (n1 + 1) / 2) / (n1 * n2))
  
}




# Know what is inside


AnalysisFunc <- function(lgbm, extra_name, id, label, folds, validationValues, predictedValuesCV) {
  # lgbm = your LightGBM cross-validated model (set as "NA" if it is not a LGBM model)
  # Label = your label
  # Folds = your fold list
  # validationValues = your validation values (out of fold predictions)
  # predictedValuesCV = your predicted values (on test data) from CV (set as "NA" if you don't have any)
  # predictedValues = your prediction values (on test data) on a model trained on all data (set as "NA" if you don't have any)
  
  # Setup tee
  sink(file = file.path(my_script_is_using, paste("diagnostics_", extra_name, ".txt", sep = "")), append = FALSE, split = TRUE)
  cat("```r\n")
  
  temp_iter <- numeric(5)
  best_iter <- 0
  for (j in 1:5) {
    temp_iter[j] <- lgbm[[j]]$best_iteration
    best_iter <- best_iter + (temp_iter[j] / length(folds))
    cat("Fold ", j, " converged after ", temp_iter[j], " iterations.\n", sep = "")
  }
  cat("Iterations: ", mean(temp_iter), " + ", sd(temp_iter), "\n\n\n", sep = "")
  data_out[id, "Iter_Mean"] <<- mean(temp_iter)
  data_out[id, "Iter_Std"] <<- sd(temp_iter)
  
  # Get AUC metric information
  temp_auc <- numeric(length(folds))
  best_auc <- 0
  for (j in 1:length(folds)) {
    temp_auc[j] <- FastROC(y = label[folds[[j]]], x = validationValues[folds[[j]]])
    best_auc <- best_auc + (temp_auc[j] / length(folds))
    cat("Fold ", j, ": AUC=", temp_auc[j], "\n", sep = "")
  }
  cat("AUC: ", mean(temp_auc), " + ", sd(temp_auc), "\n", sep = "")
  cat("Average AUC using all data: ", FastROC(y = label, x = validationValues), "\n\n\n", sep = "")
  data_out[id, "AUC_Mean"] <<- mean(temp_auc)
  data_out[id, "AUC_Std"] <<- sd(temp_auc)
  
  # Get MCC metric information
  temp_mcc <- numeric(length(folds))
  temp_thresh <- numeric(length(folds))
  temp_positives <- numeric(length(folds))
  temp_detection <- numeric(length(folds))
  best_mcc <- 0
  for (j in 1:length(folds)) {
    
    temp_mcc[j] <- mcc_eval_print(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_thresh[j] <- mcc_eval_pred(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_positives[j] <- sum(validationValues[folds[[j]]] > temp_thresh[[j]])
    temp_detection[j] <- temp_positives[j] / sum(label[folds[[j]]])
    best_mcc <- best_mcc + (temp_mcc[j] / length(folds))
    cat("Fold ", j, ": MCC=", temp_mcc[j], " (", temp_positives[j], " [", sprintf("%05.2f", temp_detection[j] * 100), "%] positives), threshold=", temp_thresh[j], "\n", sep = "")
    
  }
  cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
  cat("Positives: ", mean(temp_positives), " + ", sd(temp_positives), "\n", sep = "")
  cat("Detection Rate: ", mean(temp_detection), " + ", sd(temp_detection), "\n", sep = "")
  cat("Average MCC on all data (5 fold): ", mcc_fixed(y_prob = validationValues, y_true = label, prob = mean(temp_mcc)), ", threshold=", mean(temp_mcc), "\n", sep = "")
  cat("Average MCC using all data: ", mcc_eval_print(y_prob = validationValues, y_true = label), ", threshold=", mcc_eval_pred(y_prob = validationValues, y_true = label), "\n", sep = "")
  data_out[id, "MCC_Mean"] <<- mean(temp_mcc)
  data_out[id, "MCC_Std"] <<- sd(temp_mcc)
  data_out[id, "Thresh_Mean"] <<- mean(temp_thresh)
  data_out[id, "Thresh_Std"] <<- sd(temp_thresh)
  data_out[id, "Detect_Mean"] <<- mean(temp_detection)
  data_out[id, "Detect_Std"] <<- sd(temp_detection)
  
  # Create files for stacker
  write.csv(validationValues, file = file.path(my_script_is_using, paste("xgb_train_", extra_name, "_val.csv", sep = "")), row.names = FALSE)
  write.csv(predictedValuesCV, file = file.path(my_script_is_using, paste("xgb_test_", extra_name, "_val.csv", sep = "")), row.names = FALSE)
  
  cat("```")
  sink()
  
}

data_out <- data.frame(matrix(nrow = length(unique(station_reference_out)), ncol = 10))
colnames(data_out) <- c("Iter_Mean", "Iter_Std", "AUC_Mean", "AUC_Std", "MCC_Mean", "MCC_Std", "Thresh_Mean", "Thresh_Std", "Detect_Mean", "Detect_Std")

startfrom <- 0

for (i in unique(station_reference_out)[which(startfrom == unique(station_reference_out)):length(unique(station_reference_out))]) {
  
  sink(file = file.path(my_script_is_using, "diagnostics_timing.txt"), append = TRUE, split = TRUE)
  sink(file = file.path(my_script_is_using, "diagnostics_all.txt"), append = TRUE, split = TRUE)
  cat("\n\n# Doing Station ", i, " at ", format(Sys.time(), "%a %b %d %Y %X"), ".\n\n", sep = "")
  sink()
  sink()
  col_learn <- which(station_reference_out == i)
  train <- train_numeric[, .SD, .SDcols = col_learn]
  train <- as.matrix(train)
  train[, 1] <- as.numeric(train[, 1])
  gc(verbose = FALSE)
  test <- test_numeric[, .SD, .SDcols = col_learn]
  test <- as.matrix(test)
  test[, 1] <- as.numeric(test[, 1])
  gc(verbose = FALSE)
  
  # Real cannon is here
  dtrain <- xgb.DMatrix(data = train, label = label, missing = 0)
  gc(verbose = FALSE)
  dtest <- xgb.DMatrix(data = test, missing = 0)
  gc(verbose = FALSE)
  
  features <- list()
  
  predictions1 <- numeric(1183747)
  predictions2 <- numeric(1183748)
  predictions3 <- data.frame(matrix(rep(0, 1183748*length(folds)), nrow = 1183748))
  best_iter <- 0
  temp_model <- list()
  
  for (j in 1:length(folds)) {
    
    gc(verbose = FALSE)
    dval1 <- dtrain[(1:1183747)[-folds[[j]]]]
    gc(verbose = FALSE)
    dval2 <- dtrain[(1:1183747)[folds[[j]]]]
    
    sink(file = file.path(my_script_is_using, paste("diagnostics_timing_S", i, ".txt", sep = "")), append = TRUE, split = FALSE)
    sink(file = file.path(my_script_is_using, "diagnostics_timing.txt"), append = TRUE, split = TRUE)
    gc(verbose = FALSE)
    set.seed(11111)
    temp_model[[j]] <- xgb.train(data = dval1,
                                 nthread = 12,
                                 nrounds = 1000000,
                                 eta = eta,
                                 depth = depth,
                                 #gamma = 20,
                                 subsample = 1.0,
                                 colsample_bytree = 1.0,
                                 booster = "gbtree",
                                 #feval = mcc_eval_nofail,
                                 eval_metric = "auc",
                                 maximize = TRUE,
                                 early_stopping_rounds = 100,
                                 objective = "binary:logistic",
                                 verbose = TRUE,
                                 watchlist = list(train = dval1, test = dval2),
                                 base_score = 6879/1183747)
    sink()
    sink()
    
    best_iter <- best_iter + (temp_model[[j]]$best_iteration / length(folds))
    gc(verbose = FALSE)
    predictions1[folds[[j]]] <- predict(temp_model[[j]], dval2, ntreelimit = temp_model[[j]]$best_iteration)
    predictions3[, j] <- predict(temp_model[[j]], dtest, ntreelimit = temp_model[[j]]$best_iteration)
    predictions2 <- predictions3[, j] + predictions2
    features[[j]] <- xgb.importance(feature_names = colnames(train), model = temp_model[[j]])
    cat("\nFor ", sprintf("%04d", temp_model[[j]]$best_iteration), " rounds: ", colnames(temp_model[[j]]$evaluation_log)[2], ": ", temp_model[[j]]$evaluation_log[[2]][temp_model[[j]]$best_iteration], " - ", colnames(temp_model[[j]]$evaluation_log)[3], ": ", temp_model[[j]]$evaluation_log[[3]][temp_model[[j]]$best_iteration], sep = "")
    temp_mcc <- mcc_eval_pred(y_prob = predictions1[folds[[j]]], y_true = label[folds[[j]]])
    temp_preds <- as.numeric(predictions1[folds[[j]]] > temp_mcc)
    
  }
  
  saveRDS(temp_model, file.path(my_script_is_using, paste("xgb_model_cv_S", i, ".rds", sep = "")), compress = TRUE)
  saveRDS(features, file.path(my_script_is_using, paste("xgb_feat_cv_S", i, ".rds", sep = "")), compress = TRUE)
  
  sink(file = file.path(my_script_is_using, "diagnostics_all.txt"), append = TRUE, split = FALSE)
  AnalysisFunc(lgbm = temp_model,
               extra_name = paste("S", i, sep = ""),
               id = which(i == unique(station_reference_out)),
               label = label,
               folds = folds,
               validationValues = predictions1,
               predictedValuesCV = predictions2)
  sink()
  
  fwrite(data_out, "Laurae/20161031_xgb_stationlearner/aggregated.csv")
  
}
