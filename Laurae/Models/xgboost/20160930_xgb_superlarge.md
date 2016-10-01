```r
> format(Sys.time(), "%a %b %d %Y %X")
[1] "Sat Oct 01 2016 04:14:42 AM"
> xgb.opt.depth(initial = 10, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)

Exploring depth  10 : [00037] 0.73579720+0.00545991 (Score: 0.73579720 <<<) - best is: 10
Exploring depth  08 : [00037] 0.73708740+0.00648026 (Score: 0.73708740 <<<) - best is: 8
Exploring depth  12 : [00031] 0.73467860+0.00661126 (Score: 0.73467860    ) - best is: 8
Exploring depth  09 : [00036] 0.73823760+0.00636823 (Score: 0.73823760 <<<) - best is: 9
Best depth found was: 9.
NULL
> 
> #Laurae.xgb.opt.depth.best <- 11
> 
> features <- list()
> 
> predictions1 <- numeric(1183747)
> predictions2 <- numeric(1183748)
> predictions3 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))
> 
> for (j in 1:5) {
+   
+   gc(verbose = FALSE)
+   dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
+   gc(verbose = FALSE)
+   dval2 <- dtrain[(1:1183747)[folded[[j]]]]
+   
+   i <- 0
+   sink(file = "Laurae/20160930_xgb_superlarge/logs.txt", append = TRUE, split = FALSE)
+   cat("\n\n\nFold ", j, "\n\n", sep = "")
+   gc()
+   set.seed(11111)
+   try(temp_model <- xgb.train(data = dval1,
+                               nthread = 6,
+                               nrounds = 1000000,
+                               max_depth = Laurae.xgb.opt.depth.best,
+                               eta = 0.025,
+                               #gamma = 20,
+                               subsample = 1.0,
+                               colsample_bytree = 1.0,
+                               booster = "gbtree",
+                               #feval = mcc_eval_nofail,
+                               eval_metric = "auc",
+                               maximize = TRUE,
+                               early_stopping_rounds = 50,
+                               objective = "binary:logistic",
+                               verbose = TRUE,
+                               prediction = TRUE,
+                               watchlist = list(train = dval1, test = dval2)
+                               # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
+                               #                                maximize = TRUE,
+                               #                                verbose = TRUE))
+   )
+   )
+   sink()
+   cat("\nTime: ", format(Sys.time(), "%a %b %d %Y %X"), sep = "")
+   gc(verbose = FALSE)
+   predictions1[folded[[j]]] <- predict(temp_model, dval2, ntreelimit = temp_model$best_iteration)
+   cat("\nAverage of validation predictions: ", mean(predictions1[folded[[j]]]))
+   gc(verbose = FALSE)
+   predictions3[, j] <- predict(temp_model, dtest, ntreelimit = temp_model$best_iteration)
+   cat("\nAverage of test predictions: ", mean(predictions3[, j]))
+   predictions2 <- predictions3[, j] + predictions2
+   cat("\nAverage of rolling test predictions: ", mean(predictions2) * (5 / j))
+   gc(verbose = FALSE)
+   features[[j]] <- xgb.importance(feature_names = train@Dimnames[[2]], model = temp_model)
+   gc(verbose = FALSE)
+   cat("\nFold ", j, ": MCC=", mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
+   write.csv(predictions1, file = "Laurae/20160930_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20160930_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20160930_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Time: Sat Oct 01 2016 08:30:56 AM
Average of validation predictions:  0.006020155
Average of test predictions:  0.006023205
Average of rolling test predictions:  0.03011603
Fold 1: MCC=0.2935352

Time: Sat Oct 01 2016 10:31:40 AM
Average of validation predictions:  0.005605632
Average of test predictions:  0.00563654
Average of rolling test predictions:  0.02914936
Fold 2: MCC=0.2730313

Time: Sat Oct 01 2016 12:14:36 PM
Average of validation predictions:  0.005785361
Average of test predictions:  0.005780478
Average of rolling test predictions:  0.02906704
Fold 3: MCC=0.271903

Time: Sat Oct 01 2016 02:02:44 PM
Average of validation predictions:  0.005655868
Average of test predictions:  0.005659681
Average of rolling test predictions:  0.02887488
Fold 4: MCC=0.2647218

Time: Sat Oct 01 2016 03:48:50 PM
Average of validation predictions:  0.005666485
Average of test predictions:  0.005673132
Average of rolling test predictions:  0.02877304
Fold 5: MCC=0.2698435
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20160930_xgb_superlarge/predictions_test_mean.csv", row.names = FALSE)
> 
> 
> 
> 
> mcc_eval_pred <- function(y_prob, y_true) {
+   y_true <- y_true
+   
+   DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
+   
+   nump <- sum(y_true)
+   numn <- length(y_true) - nump
+   
+   DT[, tn_v := cumsum(y_true == 0)]
+   DT[, fp_v := cumsum(y_true == 1)]
+   DT[, fn_v := numn - tn_v]
+   DT[, tp_v := nump - fp_v]
+   DT[, tp_v := nump - fp_v]
+   DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
+   DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
+   
+   return(DT[['y_prob']][which.max(DT[['mcc_v']])])
+   
+ }
> 
> 
> 
> temp_mcc <- numeric(5)
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc[j] <- mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc[j]
+   cat("Fold ", j, ": MCC=", temp_mcc[j], " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: MCC=0.2935352 | rolling average: 0.2935352
Fold 2: MCC=0.2730313 | rolling average: 0.2832833
Fold 3: MCC=0.271903 | rolling average: 0.2794898
Fold 4: MCC=0.2647218 | rolling average: 0.2757978
Fold 5: MCC=0.2698435 | rolling average: 0.274607
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.274607 + 0.01105082
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1569358 | rolling average: 0.1569358
Fold 2: threshold=0.1171917 | rolling average: 0.1370638
Fold 3: threshold=0.1684356 | rolling average: 0.1475211
Fold 4: threshold=0.1119568 | rolling average: 0.13863
Fold 5: threshold=0.2024233 | rolling average: 0.1513887
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 >= best_mcc)
> print(sum(submission1$Response == 1))
[1] 2890
> write.csv(submission1, file = "Laurae/20160930_xgb_superlarge/submission1.csv", row.names = FALSE)
> 
> 
> best_mcc <- numeric(1183748)
> 
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + as.numeric(predictions3[, j] >= temp_mcc)
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1569358 | rolling average: 0.002301165
Fold 2: threshold=0.1171917 | rolling average: 0.002551219
Fold 3: threshold=0.1684356 | rolling average: 0.002436329
Fold 4: threshold=0.1119568 | rolling average: 0.002529466
Fold 5: threshold=0.2024233 | rolling average: 0.00240879
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 1815
> write.csv(submission2, file = "Laurae/20160930_xgb_superlarge/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2396
> write.csv(submission2, file = "Laurae/20160930_xgb_superlarge/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2838
> write.csv(submission2, file = "Laurae/20160930_xgb_superlarge/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 3277
> write.csv(submission2, file = "Laurae/20160930_xgb_superlarge/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 3931
> write.csv(submission2, file = "Laurae/20160930_xgb_superlarge/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 3931
> write.csv(submission3, file = "Laurae/20160930_xgb_superlarge/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2890
> write.csv(submission4, file = "Laurae/20160930_xgb_superlarge/submission4.csv", row.names = FALSE)
