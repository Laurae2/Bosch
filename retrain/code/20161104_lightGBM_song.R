library(data.table)
library(Matrix)
library(recommenderlab)
library(Laurae)
library(fastdigest)
library(pbapply)
library(ggplot2)
library(R.utils)
library(stringi)
library(feather)

setwd("~/kaggle/Bosche/push")
source("utils.R")

my_script_is_using <- "/home/shubinli/kaggle/Bosche/temp"
my_lgbm_is_at = "/home/shubinli/software/LightGBM/lightgbm"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
leaves <- 255
eta <- 0.05
min_sample <- 100
min_hess <- 10
subsample <- 0.9
colsample <- 0.9
sampling_freq <- ifelse(subsample == 1, 0, 1)


# Load from RDS

train <- readRDS("../input/song/train_mike_song_v24.rds")
test <- readRDS("../input/song/test_mike_song_v24.rds")
label <- readRDS("../input/jay/labels.rds")
#keep <- readRDS('../input/song/varimp_v012_new24_all.rds')


train = as.data.table(dropNA2matrix(train))
test = as.data.table(dropNA2matrix(test))

train <- DTcolsample(train,kept = names(train))
test <- DTcolsample(test,kept = names(test))


#write_feather(as.data.frame(train),'../input/song/tr_song.feather')
#write_feather(as.data.frame(test),'../input/song/te_song.feather')

#train = read_feather('../input/song/tr_song.feather')
#test = read_feather('../input/song/te_song.feather')


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
                      folds = folds,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = threads,
                      application = "binary",
                      learning_rate = eta,
                      num_iterations = 1000,
                      early_stopping_rounds = 100,
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
                         verbose = FALSE,
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
                         is_training_metric = TRUE)

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


AnalysisFunc <- function(lgbm, label, folds, validationValues, predictedValuesCV, predictedValues) {
  # lgbm = your LightGBM cross-validated model (set as "NA" if it is not a LGBM model)
  # Label = your label
  # Folds = your fold list
  # validationValues = your validation values (out of fold predictions)
  # predictedValuesCV = your predicted values (on test data) from CV (set as "NA" if you don't have any)
  # predictedValues = your prediction values (on test data) on a model trained on all data (set as "NA" if you don't have any)
  
  if (length(lgbm) > 1) {
    
    # Print feature importance to file
    
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
    
  }
  
  # Setup tee
  sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = FALSE, split = TRUE)
  cat("```r\n")
  
  if (length(lgbm) > 1) {
    
    # Get iteration information
    temp_iter <- numeric(5)
    best_iter <- 0
    for (j in 1:5) {
      temp_iter[j] <- lgbm$Models[[j]]$Best
      best_iter <- best_iter + (temp_iter[j] / length(folds))
      cat("Fold ", j, " converged after ", temp_iter[j], " iterations.\n", sep = "")
    }
    cat("Iterations: ", mean(temp_iter), " + ", sd(temp_iter), "\n\n\n", sep = "")
    
  }
  
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
  cat("Average MCC on all data (5 fold): ", mcc_fixed(y_prob = validationValues, y_true = label, prob = mean(temp_thresh)), ", threshold=", mean(temp_thresh), "\n", sep = "")
  cat("Average MCC using all data: ", mcc_eval_print(y_prob = validationValues, y_true = label), ", threshold=", mcc_eval_pred(y_prob = validationValues, y_true = label), "\n\n\n", sep = "")
  
  
  if (length(predictedValuesCV) > 1) {
    # Create files for stacker
    write.csv(validationValues, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY.csv"), row.names = FALSE)
    write.csv(predictedValuesCV, file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY.csv"), row.names = FALSE)
    
  }
  
  
  
  if (length(lgbm) > 1) {
    
    # Do best feature listing
    cat("Cross-validated used features list (all used features to copy & paste):\n\n")
    mini_model <- copy(lgbm$FeatureImp)
    dput(mini_model$Feature)
    cat("\n\nCross-validated multipresence used features list (all used features to copy & paste):\n\n")
    mini_model <- mini_model[Freq == length(folds), ]
    dput(mini_model$Feature)
    cat("\n\nSee the screenshots for more accuracy about the gain\n\n\n")
    
  }
  
  sink()
  
  cat("```")
  return("Done")
  
}
AnalysisFunc(lgbm = temp_model,
             label = label,
             folds = folds,
             validationValues = temp_model$Validation[[1]],
             predictedValuesCV = temp_model$Testing[[1]],
             predictedValues = best_model$Testing)

mean(temp_model$Validation[[2]][[1]])
mean(temp_model$Validation[[2]][[2]])
mean(temp_model$Validation[[2]][[3]])
mean(temp_model$Validation[[2]][[4]])
mean(temp_model$Validation[[2]][[5]])




# Borked submission fix

temp_model <- readRDS(file.path(my_script_is_using, "../log/20161104_Song/aaa_LightGBM_cv.rds"))

predictedValuesCV <- numeric(1183748)
predictedValues <- numeric(1183748)

for (i in 1:5) {
  
  temp_values <- lgbm.predict(model = temp_model$Models[[i]],
                              y_pred = NA,
                              x_pred = test,
                              verbose = TRUE,
                              files_exist = (!(i == 1)),
                              data.table = TRUE)
  predictedValuesCV <- predictedValuesCV + (0.2 * temp_values)
  
}

summary(predictedValuesCV - temp_model$Testing[[1]]) # BETTER!!!

best_model <- readRDS(file.path(my_script_is_using, "../log/20161104_Song/aaa_LightGBM_full.rds"))

predictedValues <- lgbm.predict(model = best_model,
                                y_pred = NA,
                                x_pred = test,
                                verbose = TRUE,
                                files_exist = TRUE,
                                data.table = TRUE)

summary(predictedValues - temp_model$Testing) # BETTER!!!

AnalysisFunc(lgbm = temp_model,
             label = label,
             folds = folds,
             validationValues = temp_model$Validation[[1]],
             predictedValuesCV = predictedValuesCV,
             predictedValues = predictedValues)



validations = temp_model$Validation[[1]]
test_predictions = temp_model$Testing[[1]]

write.csv(validations,'../pushing/20161103_lightGBM_train_feature_set5.csv',row.names = F)
write.csv(test_predictions,'../pushing/20161103_lightGBM_test_feature_set5.csv',row.names = F)

