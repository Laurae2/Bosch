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

setwd("E:/")

my_script_is_using <- "E:/Laurae/20161111_lgbm_jay"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
leaves <- 255
eta <- 0.01
min_sample <- 100
min_hess <- 10
subsample <- 1.0
colsample <- 1.0
sampling_freq <- ifelse(subsample == 1, 0, 1)


# Load from RDS

train <- readRDS("Laurae/jayjay_clean/train.rds")
test <- readRDS("Laurae/jayjay_clean/test.rds")
label <- readRDS("datasets/labels.rds")

train[, Id := NULL]
test[, Id := NULL]

gc()



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


# Real cannon is here


temp_data <- lgbm.cv.prep(y_train = label,
                          x_train = train,
                          x_test = test,
                          data_has_label = TRUE,
                          NA_value = "nan",
                          workingdir = my_script_is_using,
                          folds = folds)

temp_model <- lgbm.cv(y_train = label,
                      x_train = train,
                      x_test = test,
                      data_has_label = TRUE,
                      NA_value = "nan",
                      lgbm_path = my_lgbm_is_at,
                      workingdir = my_script_is_using,
                      files_exist = TRUE,
                      save_binary = FALSE,
                      validation = TRUE,
                      folds = folds,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = threads,
                      application = "binary",
                      learning_rate = eta,
                      num_iterations = 2500,
                      early_stopping_rounds = 500,
                      num_leaves = leaves,
                      min_data_in_leaf = min_sample,
                      min_sum_hessian_in_leaf = min_hess,
                      max_bin = 255,
                      feature_fraction = colsample,
                      bagging_fraction = subsample,
                      bagging_freq = sampling_freq,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE,
                      is_sparse = FALSE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)

gc()

#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))

best_iter <- 0
for (j in 1:5) {
  best_iter <- best_iter + 0.2 * temp_model$Models[[j]]$Best
}

cat("Going for ", best_iter, " rounds.  \n", sep = "")

best_model <- lgbm.train(y_train = label,
                         x_train = train,
                         x_test = test,
                         data_has_label = TRUE,
                         NA_value = "nan",
                         lgbm_path = my_lgbm_is_at,
                         workingdir = my_script_is_using,
                         files_exist = FALSE,
                         save_binary = FALSE,
                         predictions = TRUE,
                         importance = TRUE,
                         full_quiet = FALSE,
                         verbose = TRUE,
                         num_threads = threads,
                         application = "binary",
                         learning_rate = eta,
                         num_iterations = floor(best_iter * 1.1),
                         num_leaves = leaves,
                         min_data_in_leaf = min_sample,
                         min_sum_hessian_in_leaf = min_hess,
                         max_bin = 255,
                         feature_fraction = colsample,
                         bagging_fraction = subsample,
                         bagging_freq = sampling_freq,
                         is_unbalance = FALSE,
                         metric = "auc",
                         is_training_metric = TRUE,
                         is_sparse = FALSE)

saveRDS(best_model, file.path(my_script_is_using, "aaa_LightGBM_full.rds"), compress = TRUE)



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
  cleaner <- !duplicated(DT[, "y_prob"], fromLast = TRUE)
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT <- DT[cleaner, ]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  gc(verbose = FALSE)
  
  return(max(DT[['mcc_v']]))
  
}

mcc_eval_pred <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  cleaner <- !duplicated(DT[, "y_prob"], fromLast = TRUE)
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT <- DT[cleaner, ]
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


Rescaler <- function(folds, CV_Preds, Test_Preds) {
  All_Scale <- list()
  CV_All <- numeric(1183747)
  Test_Scale <- numeric(1183748)
  for (i in 1:length(folds)) {
    All_Scale[[i]] <- c(CV_Preds[[i]], Test_Preds[[i]])
    All_Scale[[i]] <- rank(All_Scale[[i]], ties.method = "average") / length(All_Scale[[i]])
    CV_Preds[[i]] <- All_Scale[[i]][1:length(CV_Preds[[i]])]
    CV_All[folds[[i]]] <- CV_Preds[[i]]
    Test_Preds[[i]] <- All_Scale[[i]][(length(CV_Preds[[i]]) + 1):length(All_Scale[[i]])]
    Test_Scale <- Test_Scale + (Test_Preds[[i]] / length(folds))
  }
  returned <- list()
  returned[["CV"]] <- CV_All
  returned[["CV_Fold"]] <- CV_Preds
  returned[["Test"]] <- Test_Scale
  returned[["Test_Fold"]] <- Test_Preds
  
  return(returned)
}


# Know what is inside


AnalysisFunc <- function(label, folds, validationValues, predictedValuesCV, predictedValuesCVList = NA) {
  # Label = your label
  # Folds = your fold list
  # validationValues = your validation values (out of fold predictions)
  # predictedValuesCV = your predicted values (on test data) from CV (set as "NA" if you don't have any)
  
  
  # Setup tee
  sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = FALSE, split = TRUE)
  cat("```r\n")
  
  # Get AUC metric information
  temp_auc <- numeric(length(folds))
  best_auc <- 0
  for (j in 1:length(folds)) {
    temp_auc[j] <- FastROC(y = label[folds[[j]]], x = validationValues[folds[[j]]])
    best_auc <- best_auc + (temp_auc[j] / length(folds))
    cat("Fold ", j, ": AUC=", sprintf("%.07f", temp_auc[j]), "\n", sep = "")
  }
  cat("AUC: ", sprintf("%.07f", mean(temp_auc)), " + ", sprintf("%.07f", sd(temp_auc)), "\n", sep = "")
  cat("Average AUC using all data: ", sprintf("%.07f", FastROC(y = label, x = validationValues)), "\n\n\n", sep = "")
  
  
  # Get MCC metric information
  temp_mcc <- numeric(length(folds))
  temp_thresh <- numeric(length(folds))
  temp_positives <- numeric(length(folds))
  temp_detection <- numeric(length(folds))
  temp_true <- numeric(length(folds))
  temp_undetect <- numeric(length(folds))
  best_mcc <- 0
  for (j in 1:length(folds)) {
    
    temp_mcc[j] <- mcc_eval_print(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_thresh[j] <- mcc_eval_pred(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    mini_preds <- validationValues[folds[[j]]] > temp_thresh[[j]]
    temp_positives[j] <- sum(mini_preds)
    temp_detection[j] <- 100 * temp_positives[j] / sum(label[folds[[j]]])
    temp_true[j] <- sum((mini_preds[mini_preds == TRUE] == label[folds[[j]]][mini_preds == TRUE]))
    temp_undetect[j] <- sum(label[folds[[j]]]) - temp_true[j]
    temp_true[j] <- 100 * temp_true[j] / sum(length(mini_preds[mini_preds == TRUE]))
    best_mcc <- best_mcc + (temp_mcc[j] / length(folds))
    cat("Fold ", j, ": MCC=", sprintf("%.07f", temp_mcc[j]), " (", sprintf("%04d", temp_positives[j]), " [", sprintf("%05.2f", temp_detection[j]), "%] positives), threshold=", sprintf("%.07f", temp_thresh[j]), " => True positives = ", sprintf("%06.3f", temp_true[j]), "%\n", sep = "")
    
  }
  cat("MCC: ", sprintf("%.07f", mean(temp_mcc)), " + ", sprintf("%.07f", sd(temp_mcc)), "\n", sep = "")
  cat("Threshold: ", sprintf("%.07f", mean(temp_thresh)), " + ", sprintf("%.07f", sd(temp_thresh)), "\n", sep = "")
  cat("Positives: ", sprintf("%06.2f", mean(temp_positives)), " + ", sprintf("%06.2f", sd(temp_positives)), "\n", sep = "")
  cat("Detection Rate %: ", sprintf("%06.3f", mean(temp_detection)), " + ", sprintf("%06.3f", sd(temp_detection)), "\n", sep = "")
  cat("True positives %: ", sprintf("%06.3f", mean(temp_true)), " + ", sprintf("%06.3f", sd(temp_true)), "\n", sep = "")
  cat("Undetected positives: ", sprintf("%07.2f", mean(temp_undetect)), " + ", sprintf("%07.2f", sd(temp_undetect)), "\n", sep = "")
  cat("Average MCC on all data (5 fold): ", sprintf("%.07f", mcc_fixed(y_prob = validationValues, y_true = label, prob = mean(temp_thresh))), ", threshold=", sprintf("%.07f", mean(temp_thresh)), "\n", sep = "")
  cat("Average MCC using all data: ", sprintf("%.07f", mcc_eval_print(y_prob = validationValues, y_true = label)), ", threshold=", sprintf("%.07f", mcc_eval_pred(y_prob = validationValues, y_true = label)), "\n\n\n", sep = "")
  
  
  if (length(predictedValuesCV) > 1) {
    
    # Create overfitted submission from all data
    best_mcc1 <- mcc_eval_pred(y_prob = validationValues, y_true = label)
    submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov$Response <- as.numeric(predictedValuesCV > best_mcc1)
    best_count1 <- sum(submission0_ov$Response == 1)
    cat("Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
    write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation
    best_mcc2 <- mean(temp_thresh)
    submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0$Response <- as.numeric(predictedValuesCV > best_mcc2)
    best_count2 <- sum(submission0$Response == 1)
    cat("Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
    write.csv(submission0, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc2), "_", best_count2, ".csv", sep = "")), row.names = FALSE)
    
    # Create average of the two previous submissions
    best_mcc3 <- (best_mcc1 + best_mcc2) / 2
    submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex$Response <- as.numeric(predictedValuesCV > best_mcc3)
    best_count3 <- sum(submission0_ex$Response == 1)
    cat("Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
    write.csv(submission0_ex, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc3), "_", best_count3, ".csv", sep = "")), row.names = FALSE)
    
    # Create files for stacker
    write.csv(validationValues, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY.csv"), row.names = FALSE)
    write.csv(predictedValuesCV, file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY.csv"), row.names = FALSE)
    
    # Setup things for ranking
    cat("\n\n\nAnalzying and ranking predictions...\n\n")
    temp_validation <- list()
    for (i in 1:length(folds)) {
      temp_validation[[i]] <- validationValues[folds[[i]]]
    }
    extra_scale <- Rescaler(folds, temp_validation, predictedValuesCVList)
    write.csv(extra_scale$CV, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY_scale.csv"), row.names = FALSE)
    write.csv(extra_scale$Test, file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY_scale.csv"), row.names = FALSE)
    
    for (i in 1:length(folds)) {
      temp_validation[[i]] <- validationValues[folds[[i]]]
      cat("Fold ", i, ": preds=", mean(validationValues[folds[[i]]]), "+", sd(validationValues[folds[[i]]]), " => ranked=", mean(extra_scale$CV[folds[[i]]]), "+", sd(extra_scale$CV[folds[[i]]]), "\n", sep = "")
    }
    
    # Get AUC metric information
    temp_auc <- numeric(length(folds))
    best_auc <- 0
    for (j in 1:length(folds)) {
      temp_auc[j] <- FastROC(y = label[folds[[j]]], x = extra_scale$CV[folds[[j]]])
      best_auc <- best_auc + (temp_auc[j] / length(folds))
      cat("Fold ", j, ": AUC=", sprintf("%.07f", temp_auc[j]), "\n", sep = "")
    }
    cat("AUC: ", sprintf("%.07f", mean(temp_auc)), " + ", sprintf("%.07f", sd(temp_auc)), "\n", sep = "")
    cat("Average AUC using all data: ", sprintf("%.07f", FastROC(y = label, x = extra_scale$CV)), "\n\n\n", sep = "")
    
    
    # Get MCC metric information
    temp_mcc <- numeric(length(folds))
    temp_thresh <- numeric(length(folds))
    temp_positives <- numeric(length(folds))
    temp_detection <- numeric(length(folds))
    temp_true <- numeric(length(folds))
    temp_undetect <- numeric(length(folds))
    best_mcc <- 0
    for (j in 1:length(folds)) {
      
      temp_mcc[j] <- mcc_eval_print(y_prob = extra_scale$CV[folds[[j]]], y_true = label[folds[[j]]])
      temp_thresh[j] <- mcc_eval_pred(y_prob = extra_scale$CV[folds[[j]]], y_true = label[folds[[j]]])
      mini_preds <- extra_scale$CV[folds[[j]]] > temp_thresh[[j]]
      temp_positives[j] <- sum(mini_preds)
      temp_detection[j] <- 100 * temp_positives[j] / sum(label[folds[[j]]])
      temp_true[j] <- sum((mini_preds[mini_preds == TRUE] == label[folds[[j]]][mini_preds == TRUE]))
      temp_undetect[j] <- sum(label[folds[[j]]]) - temp_true[j]
      temp_true[j] <- 100 * temp_true[j] / sum(length(mini_preds[mini_preds == TRUE]))
      best_mcc <- best_mcc + (temp_mcc[j] / length(folds))
      cat("Fold ", j, ": MCC=", sprintf("%.07f", temp_mcc[j]), " (", sprintf("%04d", temp_positives[j]), " [", sprintf("%05.2f", temp_detection[j]), "%] positives), threshold=", sprintf("%.07f", temp_thresh[j]), " => True positives = ", sprintf("%06.3f", temp_true[j]), "%\n", sep = "")
      
    }
    cat("MCC: ", sprintf("%.07f", mean(temp_mcc)), " + ", sprintf("%.07f", sd(temp_mcc)), "\n", sep = "")
    cat("Threshold: ", sprintf("%.07f", mean(temp_thresh)), " + ", sprintf("%.07f", sd(temp_thresh)), "\n", sep = "")
    cat("Positives: ", sprintf("%06.2f", mean(temp_positives)), " + ", sprintf("%06.2f", sd(temp_positives)), "\n", sep = "")
    cat("Detection Rate %: ", sprintf("%06.3f", mean(temp_detection)), " + ", sprintf("%06.3f", sd(temp_detection)), "\n", sep = "")
    cat("True positives %: ", sprintf("%06.3f", mean(temp_true)), " + ", sprintf("%06.3f", sd(temp_true)), "\n", sep = "")
    cat("Undetected positives: ", sprintf("%07.2f", mean(temp_undetect)), " + ", sprintf("%07.2f", sd(temp_undetect)), "\n", sep = "")
    cat("Average MCC on all data (5 fold): ", sprintf("%.07f", mcc_fixed(y_prob = extra_scale$CV, y_true = label, prob = mean(temp_thresh))), ", threshold=", sprintf("%.07f", mean(temp_thresh)), "\n", sep = "")
    cat("Average MCC using all data: ", sprintf("%.07f", mcc_eval_print(y_prob = extra_scale$CV, y_true = label)), ", threshold=", sprintf("%.07f", mcc_eval_pred(y_prob = extra_scale$CV, y_true = label)), "\n\n\n", sep = "")
    
    
    # Create overfitted submission from all data
    best_mcc1 <- mcc_eval_pred(y_prob = extra_scale$CV, y_true = label)
    submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov$Response <- as.numeric(extra_scale$Test > best_mcc1)
    best_count1 <- sum(submission0_ov$Response == 1)
    cat("Scaled Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
    write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_scale_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation
    best_mcc2 <- mean(temp_thresh)
    submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0$Response <- as.numeric(extra_scale$Test > best_mcc2)
    best_count2 <- sum(submission0$Response == 1)
    cat("Scaled Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
    write.csv(submission0, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_scale_", sprintf("%.06f", best_mcc2), "_", best_count2, ".csv", sep = "")), row.names = FALSE)
    
    # Create average of the two previous submissions
    best_mcc3 <- (best_mcc1 + best_mcc2) / 2
    submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex$Response <- as.numeric(extra_scale$Test > best_mcc3)
    best_count3 <- sum(submission0_ex$Response == 1)
    cat("Scaled Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
    write.csv(submission0_ex, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_scale_", sprintf("%.06f", best_mcc3), "_", best_count3, ".csv", sep = "")), row.names = FALSE)
    
  }
  
  cat("```")
  sink()
  
}



AnalysisFunc(label = label,
             folds = folds,
             validationValues = temp_model$Validation,
             predictedValuesCV = temp_model$Testing[[1]],
             predictedValuesCVList = temp_model$Testing[[2]])
