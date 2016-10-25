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

my_script_is_using <- "E:/Laurae/20161025_lgbm_jayjay_200feat_ultra"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
leaves <- 255
eta <- 0.05
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

smaller_data <- c("sameL0_Number1", "sameL1_Number1", "CATEGORICAL_Last_____1", 
                  "GF1", "sameL3_Number1", "GF0", "sameL3", "BAC60_Sum_S3", "FOR60_Sum_S3", 
                  "L1_S24_F1723", "DATE_S33max", "DATE_L3kurt", "FOR30_Sum_S", 
                  "BAC30_Sum_S", "BAC100_Sum", "FOR100_Sum", "Kurtosis", "FOR165_log_lag", 
                  "L3_S33_F3857", "L1_S24_F1632", "L3_S30_F3754", "FOR100_log_lag_L3", 
                  "BAC100_log_lag_L3", "FOR165_Sum", "L3_S33_F3859", "Range", "L3_S30_F3744", 
                  "L3_S30_F3759", "L0max_L3max", "L3max_L0min", "BAC165_Sum", "BAC100_log_lag", 
                  "S33max_S29min", "L3_S33_F3865", "L0_Max", "FOR100_log_lag", 
                  "L3_S30_F3774", "L3_S30_F3749", "L3_L3_Unique_Count", "BAC165_log_lag", 
                  "L1_S24_F1844", "L3_S30_F3804", "BAC165_log_lag_L3", "CATEGORICAL_Last_____2", 
                  "L3_S30_F3809", "L3_S29_F3351", "DATE_S34max", "DATE_S32max", 
                  "L3_S29_F3345", "Response_Minus1", "L3_S29_F3324", "L3_S29_F3348", "L0_S1_F28", 
                  "L3_S29_F3373", "L3_S29_F3321", "L3_S30_F3554", "FOR165_log_lag_L3", 
                  "L3_S30_F3494", "L3_S30_F3704", "L3_S30_F3769", "L0_S0_F20_Mult_L0_S0_F20", 
                  "L3_S29_F3342", "L3_S30_F3829", "L0_Mean", "L3_S29_F3427", "L3_S29_F3379", 
                  "L3_S29_F3333", "L3_S29_F3354", "L3_S36_F3920", "S33min_S30min", 
                  "L3_S29_F3339", "L3_S29_F3327", "L3_S29_F3315", "Response_Minus1_Number1", 
                  "L0_Min", "sameL0", "L3_S29_F3479", "L3_S30_F3574", "L1_S24_F1846", 
                  "L0_S1_F24", "L3_S30_F3794", "L3_S30_F3609", "L3_S29_F3336", 
                  "L3_S30_F3544", "L3_S30_F3519", "L3_S29_F3330", "L3_S29_F3376", 
                  "L3_S29_F3382", "L3_S30_F3604", "L3_S30_F3524", "FOR60_log_lag_S34", 
                  "L0_S0_F20", "L2_Min", "FOR165_log_lag_L2", "L0_S0_F18", "L0_S0_F16", 
                  "L3_S30_F3534", "L3_S30_F3784", "L0_S9_F180", "L3_S30_F3514", "BAC60_log_lag_S34", "L3_S30_F3639", "DATE_S35max", 
                  "L3_S29_F3433", "BAC165_log_lag_L1", "L3_S29_F3318", "BAC165_log_lag_L2", 
                  "L3_S30_F3819", "L0_S4_F104", "L0_S0_F0", "L3_S30_F3709", "L3_S30_F3764", 
                  "L3_S30_F3504", "DATE_S36max", "L3_S30_F3624", "L3_S29_F3407", 
                  "L3_S30_F3509", "L3_S30_F3629", "L2max_S37max", "L0_S0_F2", "FOR30_log_lag_S34", 
                  "BAC165_log_lag_L0", "DATE_S30max", "BAC60_log_lag_S33", "FOR165_log_lag_L0", 
                  "L3_S29_F3430", "BAC165_LAG2_Missing_Value_Count_ResponseMinus1", 
                  "FOR60_log_lag_S33", "L0_S2_F36", "BAC100_log_lag_L1", "L3_Range", 
                  "S29min_S37min", "L3_Max", "L3_S29_F3473", "L3_S30_F3799", "L3_S30_F3579", 
                  "FOR165_log_lag_L1", "FOR165_LAG_Missing_Value_Count_ResponseMinus1", 
                  "L3max_S30max", "L0_S3_F100", "L3_Min", "DATE_S37max", "FOR165_LAG3_Missing_Value_Count_ResponseMinus1", 
                  "BAC165_LAG_Missing_Value_Count_ResponseMinus1", "FOR165_LAG3_Count_Mult_ResponseMinus1", 
                  "BAC100_LAG_Missing_Value_Count_ResponseMinus1", "FOR165_LAG_Count_Mult_ResponseMinus1", 
                  "L0_S2_F44", "FOR165_LAG2_Missing_Value_Count_ResponseMinus1",
                  "L0_S10_F244", "L0_S5_F114", "FOR60_log_lag_S30", "L0_S4_F109", 
                  "BAC165_LAG2_Count_Mult_ResponseMinus1", "L0_S2_F60", "L3_S29_F3436", 
                  "FOR100_log_lag_L2", "BAC30_log_lag_S33", "BAC100_log_lag_L2", 
                  "L0_S5_F116", "FOR100_LAG_Missing_Value_Count_ResponseMinus1", 
                  "BAC30_log_lag_S30", "FOR165_LAG1_Missing_Value_Count_ResponseMinus1", 
                  "L0_S3_F96", "CATEGORICAL_Unique_Count", "L3_S30_F3669", "S30min_S37min", 
                  "L3_S29_F3461", "BAC100_LAG_Count_Mult_ResponseMinus1", "BAC165_LAG_Count_Mult_ResponseMinus1", 
                  "BAC100_LAG3_Missing_Value_Count_ResponseMinus1", "L0_S7_F138", 
                  "FOR165_LAG2_Count_Mult_ResponseMinus1", "L0_Range", "BAC30_log_lag_S34", 
                  "L0_S6_F132", "FOR100_LAG3_Missing_Value_Count_ResponseMinus1", 
                  "FOR165_LAG0_Missing_Value_Count_ResponseMinus1", "BAC165_LAG1_Missing_Value_Count_ResponseMinus1", 
                  "BAC165_LAG1_Count_Mult_ResponseMinus1", "L0_S2_F64", "FOR100_LAG_Count_Mult_ResponseMinus1", 
                  "Min", "L0_S3_F72", "Unique_Count", "CATEGORICAL_Missing_Value_Count", 
                  "FOR165_LAG0_Count_Mult_ResponseMinus1", "FOR100_LAG2_Missing_Value_Count_ResponseMinus1", 
                  "FOR165_LAG1_Count_Mult_ResponseMinus1", "BAC165_LAG0_Count_Mult_ResponseMinus1", 
                  "FOR100_log_lag_L1", "L0_S6_F122", "FOR100_LAG2_Count_Mult_ResponseMinus1", 
                  "Mean", "L3_S29_F3357", "BAC165_LAG3_Count_Mult_ResponseMinus1", 
                  "BAC165_LAG3_Missing_Value_Count_ResponseMinus1", "BAC100_LAG2_Missing_Value_Count_ResponseMinus1", 
                  "L0_S11_F310")

gc()

train <- train[, smaller_data, with = FALSE]
test <- test[, smaller_data, with = FALSE]

gc()

# 199 features
# spooky <- numeric(ncol(train))
# for (i in 1:ncol(train)) {
#   spooky[i] <- fastdigest(train[[i]])
#   cat("Iteration ", i, " --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = "")
#   if (i %% 20) {gc(verbose = FALSE)}
# }

# Still 199 features
# train <- train[, which(!duplicated(spooky)), with = FALSE]
# gc()
# test <- test[, which(!duplicated(spooky)), with = FALSE]
# gc()

folds <- nkfold(label, n = 12, k = c(3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6), weight = TRUE)
dividor <- folds$Weights
folds <- folds$Folds


# Real cannon is here

temp_model <- lgbm.cv(y_train = label,
                      x_train = train,
                      x_test = test,
                      data_has_label = TRUE,
                      NA_value = "nan",
                      lgbm_path = my_lgbm_is_at,
                      workingdir = my_script_is_using,
                      files_exist = FALSE,
                      save_binary = FALSE,
                      validation = TRUE,
                      unicity = TRUE,
                      folds = folds,
                      folds_weight = dividor,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = threads,
                      application = "binary",
                      learning_rate = eta,
                      num_iterations = 500,
                      early_stopping_rounds = 30,
                      num_leaves = leaves,
                      min_data_in_leaf = min_sample,
                      min_sum_hessian_in_leaf = min_hess,
                      max_bin = 255,
                      feature_fraction = colsample,
                      bagging_fraction = subsample,
                      bagging_freq = sampling_freq,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)

gc()



#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))



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


jpeg(filename = file.path(my_script_is_using, "importance_log_small.jpg"), width = 760, height = 894, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 50, no_log = FALSE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()
jpeg(filename = file.path(my_script_is_using, "importance_nonlog_small.jpg"), width = 760, height = 894, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 50, no_log = TRUE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()

jpeg(filename = file.path(my_script_is_using, "importance_log_big.jpg"), width = 760, height = 1788, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 100, no_log = FALSE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()
jpeg(filename = file.path(my_script_is_using, "importance_nonlog_big.jpg"), width = 760, height = 1788, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 100, no_log = TRUE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()


# Know what is inside

sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = FALSE, split = TRUE)

temp_iter <- numeric(length(folds))
best_iter <- 0
for (j in 1:length(folds)) {
  temp_iter[j] <- temp_model$Models[[j]]$Best
  best_iter <- best_iter + (dividor[j] * temp_iter[j])
  cat("Fold ", j, " converged after ", temp_iter[j], " iterations.\n", sep = "")
}
cat("3-fold Iterations: ", mean(temp_iter[1:9]), " + ", sd(temp_iter[1:9]), "\n", sep = "")
cat("4-fold Iterations: ", mean(temp_iter[10:21]), " + ", sd(temp_iter[10:21]), "\n", sep = "")
cat("5-fold Iterations: ", mean(temp_iter[22:36]), " + ", sd(temp_iter[22:36]), "\n", sep = "")
cat("6-fold Iterations: ", mean(temp_iter[37:54]), " + ", sd(temp_iter[37:54]), "\n", sep = "")

cat("Cross-validated best features list (top 1-50):\n")
mini_model <- copy(temp_model$FeatureImp)
#mini_model <- mini_model[Freq == 5, ]
dput(mini_model$Feature[1:50])

cat("\n\nCross-validated best features list (top 51-100):\n")
dput(mini_model$Feature[51:100])

cat("\n\nCross-validated best features list (top 101-150):\n")
dput(mini_model$Feature[101:150])

cat("\n\nCross-validated best features list (top 151-200):\n")
dput(mini_model$Feature[151:200])
cat("\nSee the screenshots for more accuracy about the gain\n\n\n")

temp_auc <- numeric(length(folds))
best_auc <- 0
for (j in 1:length(folds)) {
  temp_auc[j] <- FastROC(y = label[folds[[j]]], x = temp_model$Validation[[2]][[j]])
  best_auc <- best_auc + (dividor[j] * temp_auc[j])
  cat("Fold ", j, ": AUC=", temp_auc[j], "\n", sep = "")
}
cat("3-fold AUC: ", mean(temp_auc[1:9]), " + ", sd(temp_auc[1:9]), "\n", sep = "")
cat("4-fold AUC: ", mean(temp_auc[10:21]), " + ", sd(temp_auc[10:21]), "\n", sep = "")
cat("5-fold AUC: ", mean(temp_auc[22:36]), " + ", sd(temp_auc[22:36]), "\n", sep = "")
cat("6-fold AUC: ", mean(temp_auc[37:54]), " + ", sd(temp_auc[37:54]), "\n", sep = "")
cat("Average AUC using all data (3x 3+4+5+6 fold): ", FastROC(y = label, x = temp_model$Validation[[1]]), "\n\n\n", sep = "")

temp_mcc <- numeric(length(folds))
temp_thresh <- numeric(length(folds))
best_mcc <- 0
for (j in 1:length(folds)) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = temp_model$Validation[[2]][[j]], y_true = label[folds[[j]]])
  temp_thresh[j] <- mcc_eval_pred(y_prob = temp_model$Validation[[2]][[j]], y_true = label[folds[[j]]])
  best_mcc <- best_mcc + (dividor[j] * temp_mcc[j])
  cat("Fold ", j, ": MCC=", temp_mcc[j], ", threshold=", temp_thresh[j], " | positives=", sum(temp_model$Validation[[2]][[j]] > temp_thresh[j]), "\n", sep = "")
  
}
cat("3-fold MCC: ", mean(temp_mcc[1:9]), " + ", sd(temp_mcc[1:9]), "\n", sep = "")
cat("4-fold MCC: ", mean(temp_mcc[10:21]), " + ", sd(temp_mcc[10:21]), "\n", sep = "")
cat("5-fold MCC: ", mean(temp_mcc[22:36]), " + ", sd(temp_mcc[22:36]), "\n", sep = "")
cat("6-fold MCC: ", mean(temp_mcc[37:54]), " + ", sd(temp_mcc[37:54]), "\n", sep = "")
cat("Average MCC on all data (3x 3+4+5+6 fold): ", mcc_fixed(y_prob = temp_model$Validation[[1]], y_true = label, prob = mean(temp_mcc)), ", threshold=", mean(temp_mcc), "\n", sep = "")
cat("Average MCC using all data (3x 3+4+5+6 fold): ", mcc_eval_print(y_prob = temp_model$Validation[[1]], y_true = label), ", threshold=", mcc_eval_pred(y_prob = temp_model$Validation[[1]], y_true = label), "\n\n\n", sep = "")

# best_mcc1 <- mcc_eval_pred(y_prob = temp_model$Validation[[1]], y_true = label)
# submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ov$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc1)
# best_count1 <- sum(submission0_ov$Response == 1)
# cat("Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
# write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc2 <- best_mcc
# submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc2)
# best_count2 <- sum(submission0$Response == 1)
# cat("Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
# write.csv(submission0, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc2), "_", best_count2, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc3 <- (best_mcc1 + best_mcc2) / 2
# submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ex$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc3)
# best_count3 <- sum(submission0_ex$Response == 1)
# cat("Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
# write.csv(submission0_ex, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc3), "_", best_count3, ".csv", sep = "")), row.names = FALSE)

sink()
# 
# write.csv(temp_model$Validation, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY.csv"), row.names = FALSE)
# write.csv(temp_model$Testing[[1]], file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY.csv"), row.names = FALSE)
# 
# 
# 
# 
# 
# best_model <- lgbm.train(y_train = label,
#                          x_train = train,
#                          x_test = test,
#                          data_has_label = TRUE,
#                          NA_value = "nan",
#                          lgbm_path = my_lgbm_is_at,
#                          workingdir = my_script_is_using,
#                          files_exist = FALSE,
#                          save_binary = FALSE,
#                          predictions = TRUE,
#                          importance = TRUE,
#                          full_quiet = FALSE,
#                          verbose = TRUE,
#                          num_threads = threads,
#                          application = "binary",
#                          learning_rate = eta,
#                          num_iterations = floor(best_iter * 1.2),
#                          num_leaves = leaves,
#                          min_data_in_leaf = min_sample,
#                          min_sum_hessian_in_leaf = min_hess,
#                          max_bin = 255,
#                          feature_fraction = colsample,
#                          bagging_fraction = subsample,
#                          bagging_freq = sampling_freq,
#                          is_unbalance = FALSE,
#                          metric = "auc",
#                          is_training_metric = TRUE)
# 
# saveRDS(best_model, file.path(my_script_is_using, "aaa_LightGBM_full.rds"), compress = TRUE)
# 
# 
# 
# sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = TRUE, split = TRUE)
# 
# best_mcc1_all <- best_mcc1
# submission0_ov_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ov_all$Response <- as.numeric(best_model$Testing > best_mcc1_all)
# best_count1_all <- sum(submission0_ov_all$Response == 1)
# cat("Submission with all data overfitted threshold on all MCC positives: ", best_count1_all, ". Threshold=", best_mcc1_all, "\n\n", sep = "")
# write.csv(submission0_ov_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc1_all), "_", best_count1_all, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc2_all <- best_mcc2
# submission0_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_all$Response <- as.numeric(best_model$Testing > best_mcc2_all)
# best_count2_all <- sum(submission0_all$Response == 1)
# cat("Submission with all data average validated threshold on all MCC positives: ", best_count2_all, ". Threshold=", best_mcc2_all, "\n\n", sep = "")
# write.csv(submission0_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc2_all), "_", best_count2_all, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc3_all <- best_mcc3
# submission0_ex_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ex_all$Response <- as.numeric(best_model$Testing > best_mcc3_all)
# best_count3_all <- sum(submission0_ex_all$Response == 1)
# cat("Submission with all data average of overfit+validated threshold positives: ", best_count3_all, ". Threshold=", best_mcc3_all, "\n\n", sep = "")
# write.csv(submission0_ex_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc3_all), "_", best_count3_all, ".csv", sep = "")), row.names = FALSE)
# 
# 
# 
# mini_preds <- best_model$Testing
# mini_preds <- mini_preds[order(mini_preds, decreasing = TRUE)]
# 
# best_mcc1_all_val <- mini_preds[best_count1 + 1]
# submission0_ov_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ov_all_val$Response <- as.numeric(best_model$Testing > best_mcc1_all_val)
# best_count1_all_val <- sum(submission0_ov_all_val$Response == 1)
# cat("Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: ", best_count1_all_val, ". Threshold=", best_mcc1_all_val, "\n\n", sep = "")
# write.csv(submission0_ov_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc1_all_val), "_", best_count1_all_val, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc2_all_val <- mini_preds[best_count2 + 1]
# submission0_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_all_val$Response <- as.numeric(best_model$Testing > best_mcc2_all_val)
# best_count2_all_val <- sum(submission0_all_val$Response == 1)
# cat("Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: ", best_count2_all_val, ". Threshold=", best_mcc2_all_val, "\n\n", sep = "")
# write.csv(submission0_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc2_all_val), "_", best_count2_all_val, ".csv", sep = "")), row.names = FALSE)
# 
# best_mcc3_all_val <- mini_preds[best_count3 + 1]
# submission0_ex_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# submission0_ex_all_val$Response <- as.numeric(best_model$Testing > best_mcc3_all_val)
# best_count3_all_val <- sum(submission0_ex_all_val$Response == 1)
# cat("Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: ", best_count3_all_val, ". Threshold=", best_mcc3_all_val, "\n\n", sep = "")
# write.csv(submission0_ex_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc3_all_val), "_", best_count3_all_val, ".csv", sep = "")), row.names = FALSE)
# 
# sink()
