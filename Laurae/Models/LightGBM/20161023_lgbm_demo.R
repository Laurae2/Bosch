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

my_script_is_using <- "E:/Laurae/20161023_lgbm_demo"

train_data <- fread("Mike/0 - Data Files/train_eng.csv")
test_data <- fread("Mike/0 - Data Files/test_eng.csv")
label <- train_data$Response

train_data[, Id := NULL]
test_data[, Id := NULL]
train_data[, Response := NULL]

# Sanity check
identical(colnames(train_data), colnames(test_data))

folds <- list()
folds[[1]] <- fread("datasets/folds/folds_tbinned_0.csv")$sample_row
folds[[2]] <- fread("datasets/folds/folds_tbinned_1.csv")$sample_row
folds[[3]] <- fread("datasets/folds/folds_tbinned_2.csv")$sample_row
folds[[4]] <- fread("datasets/folds/folds_tbinned_3.csv")$sample_row
folds[[5]] <- fread("datasets/folds/folds_tbinned_4.csv")$sample_row
which(!(1:1183747 %in% c(folds[[1]], folds[[2]], folds[[3]], folds[[4]], folds[[5]])))

temp_model <- lgbm.cv(y_train = label,
                      x_train = train_data,
                      x_test = test_data,
                      data_has_label = TRUE,
                      NA_value = -999,
                      lgbm_path = "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe", #you can use lgbm.find()
                      workingdir = my_script_is_using,
                      files_exist = FALSE,
                      save_binary = FALSE,
                      validation = TRUE,
                      folds = folds,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = 12,
                      application = "binary",
                      learning_rate = 0.025,
                      num_iterations = 50000,
                      early_stopping_rounds = 250,
                      num_leaves = 511,
                      min_data_in_leaf = 50,
                      min_sum_hessian_in_leaf = 5,
                      max_bin = 255,
                      feature_fraction = 1,
                      bagging_fraction = 1,
                      bagging_freq = 0,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)





#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))





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


# Know what is inside
str(temp_model)

temp_model$Models[[1]]$Metrics$Test_AUC[temp_model$Models[[1]]$Best]
temp_model$Models[[2]]$Metrics$Test_AUC[temp_model$Models[[2]]$Best]
temp_model$Models[[3]]$Metrics$Test_AUC[temp_model$Models[[3]]$Best]
temp_model$Models[[4]]$Metrics$Test_AUC[temp_model$Models[[4]]$Best]
temp_model$Models[[5]]$Metrics$Test_AUC[temp_model$Models[[5]]$Best]

predictions1 <- temp_model$Validation
temp_mcc <- numeric(5)
best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = predictions1[folds[[j]]], y_true = label[folds[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc[j]
  cat("Fold ", j, ": MCC=", temp_mcc[j], " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}
cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")



lgbm.fi.plot(temp_model, n_best = 50, no_log = FALSE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
