# MY PACKAGES

library(data.table)
library(xgboost)

# WHERE I WORK
setwd("E:/")

# HOW MANY FEATURES
how_many <- 199

# HOW MANY THREADS I HAVE
my_threads <- 12


# Load from RDS
label <- readRDS("datasets/labels.rds")

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


# Shrink train
train <- readRDS("Laurae/jayjay_clean/train.rds")
train <- train[, smaller_data[1:how_many], with = FALSE]
gc()
setDF(train)
train <- as.matrix(train)
gc()

# Shrink test
test <- readRDS("Laurae/jayjay_clean/test.rds")
test <- test[, smaller_data[1:how_many], with = FALSE]
gc()
setDF(test)
test <- as.matrix(test)
gc()


gc()
dtrain <- xgb.DMatrix(data = train, label = label)
gc()
dtest <- xgb.DMatrix(data = test)
gc()



# SOME DIAGNOSTICS

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


AnalysisFunc <- function(lgbm, diag_file, label, folds, validationValues, predictedValuesCV, predictedValues) {
  # lgbm = your LightGBM cross-validated model (set as "NA" if it is not a LGBM model)
  # diag_file = your diagnostic file stored here
  # Label = your label
  # Folds = your fold list
  # validationValues = your validation values (out of fold predictions)
  # predictedValuesCV = your predicted values (on test data) from CV (set as "NA" if you don't have any)
  # predictedValues = your prediction values (on test data) on a model trained on all data (set as "NA" if you don't have any)
  
  # Setup tee
  sink(file = diag_file, append = FALSE, split = TRUE)
  cat("```r\n")
  
  if (length(lgbm) > 1) {
    
    # Get iteration information
    temp_iter <- numeric(length(folds))
    best_iter <- 0
    for (j in 1:length(folds)) {
      temp_iter[j] <- lgbm[[j]]$best_iteration
      best_iter <- best_iter + (temp_iter[j] / length(folds))
      cat("Fold ", j, " converged after ", sprintf("%04d", temp_iter[j]), " iterations.\n", sep = "")
    }
    cat("Iterations: ", sprintf("%06.2f", mean(temp_iter)), " + ", sprintf("%06.3f", sd(temp_iter)), "\n\n\n", sep = "")
    
  }
  
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
    
    # Create CV submission from validation
    best_mcc2 <- mean(temp_thresh)
    submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0$Response <- as.numeric(predictedValuesCV > best_mcc2)
    best_count2 <- sum(submission0$Response == 1)
    cat("Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
    
    # Create average of the two previous submissions
    best_mcc3 <- (best_mcc1 + best_mcc2) / 2
    submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex$Response <- as.numeric(predictedValuesCV > best_mcc3)
    best_count3 <- sum(submission0_ex$Response == 1)
    cat("Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
    
  }
  
  
  if (length(predictedValues) > 1) {
    
    # Create overfitted submission from all data using full trained model
    best_mcc1_all <- best_mcc1
    submission0_ov_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov_all$Response <- as.numeric(predictedValues > best_mcc1_all)
    best_count1_all <- sum(submission0_ov_all$Response == 1)
    cat("Submission with all data overfitted threshold on all MCC positives: ", best_count1_all, ". Threshold=", best_mcc1_all, "\n\n", sep = "")
    
    # Create CV submission from validation using full trained model
    best_mcc2_all <- best_mcc2
    submission0_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_all$Response <- as.numeric(predictedValues > best_mcc2_all)
    best_count2_all <- sum(submission0_all$Response == 1)
    cat("Submission with all data average validated threshold on all MCC positives: ", best_count2_all, ". Threshold=", best_mcc2_all, "\n\n", sep = "")
    
    # Create average of the two previous submissions using full trained model
    best_mcc3_all <- best_mcc3
    submission0_ex_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex_all$Response <- as.numeric(predictedValues > best_mcc3_all)
    best_count3_all <- sum(submission0_ex_all$Response == 1)
    cat("Submission with all data average of overfit+validated threshold positives: ", best_count3_all, ". Threshold=", best_mcc3_all, "\n\n", sep = "")
    
    
    
    mini_preds <- predictedValues
    mini_preds <- mini_preds[order(mini_preds, decreasing = TRUE)]
    
    # Create overfitted submission from all data using full trained model using respective positive count
    best_mcc1_all_val <- mini_preds[best_count1 + 1]
    submission0_ov_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov_all_val$Response <- as.numeric(predictedValues > best_mcc1_all_val)
    best_count1_all_val <- sum(submission0_ov_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: ", best_count1_all_val, ". Threshold=", best_mcc1_all_val, "\n\n", sep = "")
    
    # Create CV submission from validation using full trained model using respective positive count
    best_mcc2_all_val <- mini_preds[best_count2 + 1]
    submission0_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_all_val$Response <- as.numeric(predictedValues > best_mcc2_all_val)
    best_count2_all_val <- sum(submission0_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: ", best_count2_all_val, ". Threshold=", best_mcc2_all_val, "\n\n", sep = "")
    
    # Create average of the two previous submissions using full trained model using respective positive count
    best_mcc3_all_val <- mini_preds[best_count3 + 1]
    submission0_ex_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex_all_val$Response <- as.numeric(predictedValues > best_mcc3_all_val)
    best_count3_all_val <- sum(submission0_ex_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: ", best_count3_all_val, ". Threshold=", best_mcc3_all_val, "\n\n", sep = "")
    
    # Create submissions using full trained model using total validated positive count
    best_mcc_extra <- mini_preds[sum(temp_positives) + 1]
    submission0_extra <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_extra$Response <- as.numeric(predictedValues > best_mcc_extra)
    best_count_extra <- sum(submission0_extra$Response == 1)
    cat("Submission with all data by taking the sum of positives of validated positives: ", best_count_extra, ". Threshold=", best_mcc_extra, "\n\n", sep = "")
    
  }
  
  cat("```")
  sink()
  
}





############# START LOOKING THERE


# HOW MANY FOLDS

how_many_folds <- 1 # set to 5 for full CV

# MY PARAMETERS

eta <- 0.10
subsample <- 1.0
colsample_bytree <- 1.0
hessian_sum <- 1 # This is 10 in my LightGBM, because it is unlimited depth it must be regularized strongly
loss_red <- 1
early_stop <- 25



# RUN FROM THIS
temp_model <- list()
best_iter <- 0
predictions1 <- numeric(1183747)
predictions2 <- numeric(1183748)

for (i in 1:how_many_folds) {
  
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folds[[i]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folds[[i]]]]
  
  gc()
  set.seed(11111)
  temp_model[[i]] <- xgb.train(data = dval1,
                               nthread = my_threads,
                               nrounds = 1000000,
                               eta = eta,
                               max_depth = 7,
                               subsample = subsample,
                               colsample_bytree = colsample_bytree,
                               min_child_weight = hessian_sum,
                               gamma = loss_red,
                               booster = "gbtree",
                               #feval = mcc_eval_nofail,
                               eval_metric = "auc",
                               maximize = TRUE,
                               early_stopping_rounds = early_stop,
                               objective = "binary:logistic",
                               verbose = TRUE,
                               prediction = TRUE,
                               watchlist = list(test = dval2))
  best_iter <- best_iter + (0.2 * temp_model[[i]]$best_iteration)
  
  gc(verbose = FALSE)
  predictions1[folds[[i]]] <- predict(temp_model, dval2, ntreelimit = temp_model[[i]]$best_iteration)
  gc(verbose = FALSE)
  predictions2 <- predictions2 + (0.2 * predict(temp_model, dtest, ntreelimit = temp_model[[i]]$best_iteration))
  gc(verbose = FALSE)
  
  mimi_fold <- list()
  mimi_fold[[i]] <- 1:length(folds[[i]])
  mimi_preds <- predictions1[folds[[i]]]
  mimi_label <- label[folds[[i]]]
  
  AnalysisFunc(lgbm = temp_model,
               diag_file = "Laurae/diagnostics.txt",
               label = mimi_label,
               folds = mimi_fold,
               validationValues = mimi_preds,
               predictedValuesCV = NA,
               predictedValues = NA)
  
}



# NEED FULL MODEL? RUN FROM THIS

gc()
set.seed(11111)
best_model <- xgb.train(data = dtrain,
                        nthread = my_threads,
                        nrounds = floor(best_iter * 1.1),
                        eta = eta,
                        max_depth = 7,
                        subsample = subsample,
                        colsample_bytree = colsample_bytree,
                        min_child_weight = hessian_sum,
                        gamma = loss_red,
                        booster = "gbtree",
                        #feval = mcc_eval_nofail,
                        eval_metric = "auc",
                        maximize = TRUE,
                        objective = "binary:logistic",
                        verbose = TRUE,
                        prediction = TRUE,
                        watchlist = list(test = dtrain))








AnalysisFunc(lgbm = temp_model,
             diag_file = "Laurae/diagnostics.txt",
             label = label,
             folds = folds,
             validationValues = predictions1,
             predictedValuesCV = predictions2,
             predictedValues = predict(best_model, dtest))
