# Libraries

library(data.table)
library(recommenderlab)
library(xgboost)
library(caret)

setwd("E:/")


gc()
train_categorical_sparse <- readRDS("datasets/train_categorical_sparse_dedup.rds")
print(train_categorical_sparse@Dim[2])
print(format(object.size(train_categorical_sparse), units = "MB"))

gc()
train_numeric_sparse <- readRDS("datasets/train_numeric_sparse_decor.rds")
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))

gc()
train_date_sparse <- readRDS("datasets/train_date_sparse_decor.rds")
print(train_date_sparse@Dim[2])
print(format(object.size(train_date_sparse), units = "MB"))


gc()
test_categorical_sparse <- readRDS("datasets/test_categorical_sparse_dedup.rds")
print(test_categorical_sparse@Dim[2])
print(format(object.size(test_categorical_sparse), units = "MB"))

gc()
test_numeric_sparse <- readRDS("datasets/test_numeric_sparse_decor.rds")
print(test_numeric_sparse@Dim[2])
print(format(object.size(test_numeric_sparse), units = "MB"))

gc()
test_date_sparse <- readRDS("datasets/test_date_sparse_decor.rds")
print(test_date_sparse@Dim[2])
print(format(object.size(test_date_sparse), units = "MB"))


Y <- train_numeric_sparse[, train_numeric_sparse@Dim[2]]
train_numeric_sparse <- train_numeric_sparse[, c(2:(train_numeric_sparse@Dim[2] - 1))]
gc()
train_categorical_sparse <- train_categorical_sparse[, c(2:train_categorical_sparse@Dim[2])]
gc()
train_date_sparse <- train_date_sparse[, c(2:train_date_sparse@Dim[2])]
gc()
test_numeric_sparse <- test_numeric_sparse[, c(2:test_numeric_sparse@Dim[2])]
gc()
test_categorical_sparse <- test_categorical_sparse[, c(2:test_categorical_sparse@Dim[2])]
gc()
test_date_sparse <- test_date_sparse[, c(2:test_date_sparse@Dim[2])]
gc()

train <- cbind(train_numeric_sparse, train_categorical_sparse, train_date_sparse)
gc()
test <- cbind(test_numeric_sparse, test_categorical_sparse, test_date_sparse)
gc()

rm(train_numeric_sparse, train_categorical_sparse, train_date_sparse, test_numeric_sparse, test_categorical_sparse, test_date_sparse)

gc()

i <- 0

mcc <- function(TP, FP, FN, TN)
{
  num <- (TP * TN) - (FP * FN)
  den <- (TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)
  return(ifelse(den == 0, 0, num / sqrt(den)))
}

eval_mmcDT <- function(y_true, y_prob, show = FALSE) {
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
  
  i <<- i + 1
  if ((i %% 50) == 0) {gc(verbose = FALSE)}
  
  return(max(DT[['mcc_v']]))
  
}

mcc_eval <- function(pred, dtrain) {
  y_true <- getinfo(dtrain, "label")
  
  DT <- data.table(y_true = y_true, y_prob = pred, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  #if ((i %% 10) == 0) {print(DT[['y_prob']][which.max(DT[['mcc_v']])]); j <- 0} else {j <<- j + 0.2*DT[['y_prob']][which.max(DT[['mcc_v']])]} #comment for no prob output
  
  return(list(metric = "mcc", value = max(DT[['mcc_v']])))

}



mcc_eval_nofail <- function(pred, dtrain) {
  y_true <- getinfo(dtrain, "label")
  
  DT <- data.table(y_true = y_true, y_prob = pred, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  
  return(list(metric = "mcc", value = ifelse(i < 21, 0.005*i, round(max(DT[['mcc_v']]), digits = 12)))) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
  
}


gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

# 5-fold CV, eta = 0.025
# depth=05 => [47]	train-mcc:0.242187+0.002459	test-mcc:0.236419+0.008560
# depth=10 => [141]	train-mcc:0.421739+0.004081	test-mcc:0.256067+0.008422
# depth=12 => [131]	train-mcc:0.443671+0.002146	test-mcc:0.253824+0.009940
# depth=15 => [61]	train-mcc:0.430237+0.002979	test-mcc:0.238813+0.012041 (interrupted)

gc()
set.seed(11111)
temp_model <- xgb.cv(data = dtrain,
                     nthread = 6,
                     nfold = 6,
                     nrounds = 1000000,
                     max_depth = 10,
                     eta = 0.025,
                     #gamma = 20,
                     subsample = 1.0,
                     colsample_bytree = 1.0,
                     booster = "gbtree",
                     eval_metric = mcc_eval,
                     maximize = TRUE,
                     early_stopping_rounds = 25,
                     objective = "binary:logistic",
                     verbose = TRUE,
                     prediction = TRUE)


# Fixed seed beforehand
# Custom callbacks to avoid errors
# Fixed pred

format.eval.string <- function(iter, eval_res, eval_err=NULL) {
  if (length(eval_res) == 0)
    stop('no evaluation results')
  enames <- names(eval_res)
  if (is.null(enames))
    stop('evaluation results must have names')
  iter <- sprintf('[%d]\t', iter)
  if (!is.null(eval_err)) {
    if (length(eval_res) != length(eval_err))
      stop('eval_res & eval_err lengths mismatch')
    res <- paste0(sprintf("%s:%f+%f", enames, eval_res, eval_err), collapse='\t')
  } else {
    res <- paste0(sprintf("%s:%f", enames, eval_res), collapse='\t')
  }
  return(paste0(iter, res))
}


NVL <- function(x, val) {
  if (is.null(x))
    return(val)
  if (is.vector(x)) {
    x[is.na(x)] <- val
    return(x)
  }
  if (typeof(x) == 'closure')
    return(x)
  stop("typeof(x) == ", typeof(x), " is not supported by NVL")
}

cb.early.stop <- function(stopping_rounds, maximize=FALSE, 
                          metric_name=NULL, verbose=TRUE) {
  # state variables
  best_iteration <- -1
  best_ntreelimit <- -1
  best_score <- Inf
  best_msg <- NULL
  metric_idx <- 1
  
  init <- function(env) {
    if (length(env$bst_evaluation) == 0)
      stop("For early stopping, watchlist must have at least one element")
    
    eval_names <- gsub('-', '_', names(env$bst_evaluation))
    if (!is.null(metric_name)) {
      metric_idx <<- which(gsub('-', '_', metric_name) == eval_names)
      if (length(metric_idx) == 0)
        stop("'metric_name' for early stopping is not one of the following:\n",
             paste(eval_names, collapse=' '), '\n')
    }
    
    metric_name <<- eval_names[metric_idx]
    
    best_iteration <<- 1
    if (maximize) best_score <<- -Inf
    
    env$stop_condition <- FALSE
    
    if (!is.null(env$bst)) {
      if (class(env$bst) != 'xgb.Booster')
        stop("'bst' in the parent frame must be an 'xgb.Booster'")
      if (!is.null(best_score <- xgb.attr(env$bst$handle, 'best_score'))) {
        best_score <<- as.numeric(best_score)
        best_iteration <<- as.numeric(xgb.attr(env$bst$handle, 'best_iteration')) + 1
        best_msg <<- as.numeric(xgb.attr(env$bst$handle, 'best_msg'))
      } else {
        xgb.attributes(env$bst$handle) <- list(best_iteration = best_iteration - 1,
                                               best_score = best_score)
      }
    } else if (is.null(env$bst_folds) || is.null(env$basket)) {
      stop("Parent frame has neither 'bst' nor ('bst_folds' and 'basket')")
    }
  }
  
  finalizer <- function(env) {
    if (!is.null(env$bst)) {
      attr_best_score = as.numeric(xgb.attr(env$bst$handle, 'best_score'))
      if (!((best_score < (attr_best_score + 1e-12)) & (best_score > (attr_best_score - 1e-12))))
        stop("Inconsistent 'best_score' values between the closure state: ", best_score,
             " and the xgb.attr: ", attr_best_score)
      env$bst$best_iteration = best_iteration
      env$bst$best_ntreelimit = best_ntreelimit
      env$bst$best_score = best_score
    } else {
      env$basket$best_iteration <- best_iteration
      env$basket$best_ntreelimit <- best_ntreelimit
    }
  }
  
  callback <- function(env = parent.frame(), finalize = FALSE) {
    if (best_iteration < 0)
      init(env)
    
    if (finalize)
      return(finalizer(env))
    
    i <- env$iteration
    score = env$bst_evaluation[metric_idx]
    
    if (( maximize && score > best_score) ||
        (!maximize && score < best_score)) {
      
      best_msg <<- format.eval.string(i, env$bst_evaluation, env$bst_evaluation_err)
      best_score <<- score
      best_iteration <<- i
      best_ntreelimit <<- best_iteration * env$num_parallel_tree
      # save the property to attributes, so they will occur in checkpoint
      if (!is.null(env$bst)) {
        xgb.attributes(env$bst) <- list(
          best_iteration = best_iteration - 1, # convert to 0-based index
          best_score = best_score,
          best_msg = best_msg,
          best_ntreelimit = best_ntreelimit)
      }
    } else if (i - best_iteration >= stopping_rounds) {
      env$stop_condition <- TRUE
      env$end_iteration <- i
      if (verbose && NVL(env$rank, 0) == 0)
        cat("Stopping. Best iteration:\n", best_msg, "\n\n", sep = '')
    }
  }
  attr(callback, 'call') <- match.call()
  attr(callback, 'name') <- 'cb.early.stop'
  callback
}

set.seed(11111)
#folded <- createFolds(Y, k = 5, list = TRUE, returnTrain = FALSE)

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
  sink(file = "Laurae/20160925_xgb_first/logs.txt", append = TRUE, split = TRUE)
  cat("\n\n\nFold ", j, "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 12,
                              nrounds = 1000000,
                              max_depth = 10,
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
  
}

predictions2 <- predictions2 / 5



write.csv(predictions1, file = "Laurae/20160925_xgb_first/predictions_oof.csv", row.names = FALSE)
write.csv(predictions2, file = "Laurae/20160925_xgb_first/predictions_test_mean.csv", row.names = FALSE)
write.csv(predictions3, file = "Laurae/20160925_xgb_first/predictions_test_raw.csv", row.names = FALSE)
write.csv(features[[1]], file = "Laurae/20160925_xgb_first/best_features1.csv", row.names = FALSE)
write.csv(features[[2]], file = "Laurae/20160925_xgb_first/best_features2.csv", row.names = FALSE)
write.csv(features[[3]], file = "Laurae/20160925_xgb_first/best_features3.csv", row.names = FALSE)
write.csv(features[[4]], file = "Laurae/20160925_xgb_first/best_features4.csv", row.names = FALSE)
write.csv(features[[5]], file = "Laurae/20160925_xgb_first/best_features5.csv", row.names = FALSE)



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
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  
  return(DT[['y_prob']][which.max(DT[['mcc_v']])]) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
  
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
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  
  return(max(DT[['mcc_v']])) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
  
}

best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc <- mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": MCC=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}

best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}

submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions2 >= best_mcc)
print(sum(submission1$Response == 1))
write.csv(submission1, file = "Laurae/20160925_xgb_first/submission1.csv", row.names = FALSE)

best_mcc <- numeric(1183748)

for (j in 1:5) {
  
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + as.numeric(predictions3[, j] >= temp_mcc)
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
  
}

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 3)
print(sum(submission2$Response == 1))
write.csv(submission2, file = "Laurae/20160925_xgb_first/submission2.csv", row.names = FALSE)


submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
print(sum(submission3$Response == 1))
write.csv(submission3, file = "Laurae/20160925_xgb_first/submission3.csv", row.names = FALSE)

submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
print(sum(submission4$Response == 1))
write.csv(submission4, file = "Laurae/20160925_xgb_first/submission4.csv", row.names = FALSE)
