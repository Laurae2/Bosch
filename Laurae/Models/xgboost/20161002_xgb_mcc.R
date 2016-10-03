```r
> format(Sys.time(), "%a %b %d %Y %X")
[1] "Sun Oct 02 2016 08:43:25 PM"
> xgb.opt.depth(initial = 10, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)

Exploring depth  10 : [00051] 0.27937840+0.00992452 (Score: 0.27937840 <<<) - best is: 10
Exploring depth  08 : [00104] 0.28045182+0.01068867 (Score: 0.28045182 <<<) - best is: 8
Exploring depth  12 : [00080] 0.28000932+0.00522009 (Score: 0.28000932    ) - best is: 8
Exploring depth  09 : [00045] 0.28096524+0.01077124 (Score: 0.28096524 <<<) - best is: 9
Best depth found was: 9.


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
+   sink(file = "Laurae/20161002_xgb_mcc/logs.txt", append = TRUE, split = FALSE)
+   cat("\n\n\nFold ", j, "\n\n", sep = "")
+   gc()
+   set.seed(11111)
+   try(temp_model <- xgb.train(data = dval1,
+                               nthread = 12,
+                               nrounds = 1000000,
+                               max_depth = Laurae.xgb.opt.depth.best,
+                               eta = 0.025,
+                               #gamma = 20,
+                               subsample = 1.0,
+                               colsample_bytree = 1.0,
+                               booster = "gbtree",
+                               feval = mcc_eval_nofail_fold,
+                               #eval_metric = "auc",
+                               maximize = TRUE,
+                               early_stopping_rounds = 100,
+                               objective = "binary:logistic",
+                               verbose = TRUE,
+                               prediction = TRUE,
+                               watchlist = list(train = dval1, test = dval2),
+                               base_score = 0.05
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
+   cat("\nFor ", sprintf("%04d", temp_model$best_iteration), " rounds: ", colnames(temp_model$evaluation_log)[2], ": ", temp_model$evaluation_log[[2]][temp_model$best_iteration], " - ", colnames(temp_model$evaluation_log)[3], ": ", temp_model$evaluation_log[[3]][temp_model$best_iteration], sep = "")
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   temp_preds <- as.numeric(predictions1[folded[[j]]] > temp_mcc)
+   cat("\nConfusion matrix:\n")
+   print(table(data.frame(preds = temp_preds, truth = Y[folded[[j]]])))
+   print(table(data.frame(preds = temp_preds, truth = Y[folded[[j]]]))/length(folded[[j]]))
+   cat("\nFold ", j, ": MCC=", mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
+   write.csv(predictions1, file = "Laurae/20161002_xgb_mcc/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20161002_xgb_mcc/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20161002_xgb_mcc/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Time: Mon Oct 03 2016 04:10:26 AM
Average of validation predictions:  0.005769624
Average of test predictions:  0.007384678
Average of rolling test predictions:  0.03692339
For 0235 rounds: train_mcc: 0.4100457 - test_mcc: 0.3048437
Confusion matrix:
     truth
preds      0      1
    0 235069   1101
    1    304    274
     truth
preds           0           1
    0 0.992908071 0.004650514
    1 0.001284066 0.001157349

Fold 1: MCC=0.3048437

Time: Mon Oct 03 2016 04:49:31 AM
Average of validation predictions:  0.005847757
Average of test predictions:  0.007444425
Average of rolling test predictions:  0.03707276
For 0211 rounds: train_mcc: 0.40902 - test_mcc: 0.2735438
Confusion matrix:
     truth
preds      0      1
    0 234974   1112
    1    399    264
     truth
preds           0           1
    0 0.992502608 0.004696958
    1 0.001685329 0.001115105

Fold 2: MCC=0.2735438

Time: Mon Oct 03 2016 05:19:04 AM
Average of validation predictions:  0.006595934
Average of test predictions:  0.008227653
Average of rolling test predictions:  0.03842793
For 0155 rounds: train_mcc: 0.3971798 - test_mcc: 0.2719351
Confusion matrix:
     truth
preds      0      1
    0 235198   1180
    1    176    196
     truth
preds            0            1
    0 0.9934445618 0.0049841605
    1 0.0007434002 0.0008278775

Fold 3: MCC=0.2719351

Time: Mon Oct 03 2016 06:04:42 AM
Average of validation predictions:  0.005743322
Average of test predictions:  0.007324201
Average of rolling test predictions:  0.0379762
For 0249 rounds: train_mcc: 0.4166178 - test_mcc: 0.2769864
Confusion matrix:
     truth
preds      0      1
    0 235095   1141
    1    279    235
     truth
preds            0            1
    0 0.9930095037 0.0048194298
    1 0.0011784583 0.0009926082

Fold 4: MCC=0.2769864

Time: Mon Oct 03 2016 06:48:08 AM
Average of validation predictions:  0.005721593
Average of test predictions:  0.007295428
Average of rolling test predictions:  0.03767638
For 0270 rounds: train_mcc: 0.4207962 - test_mcc: 0.2840936
Confusion matrix:
     truth
preds      0      1
    0 235054   1121
    1    320    255
     truth
preds           0           1
    0 0.992836325 0.004734952
    1 0.001351637 0.001077086

Fold 5: MCC=0.2840936
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20161002_xgb_mcc/predictions_test_mean.csv", row.names = FALSE)
> 
> 
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
Fold 1: MCC=0.3048437 | rolling average: 0.3048437
Fold 2: MCC=0.2735438 | rolling average: 0.2891938
Fold 3: MCC=0.2719351 | rolling average: 0.2834409
Fold 4: MCC=0.2769864 | rolling average: 0.2818273
Fold 5: MCC=0.2840936 | rolling average: 0.2822805
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.2822805 + 0.01345149
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1535558 | rolling average: 0.1535558
Fold 2: threshold=0.1246095 | rolling average: 0.1390827
Fold 3: threshold=0.2546903 | rolling average: 0.1776186
Fold 4: threshold=0.1810271 | rolling average: 0.1784707
Fold 5: threshold=0.1609393 | rolling average: 0.1749644
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 > best_mcc)
> print(sum(submission1$Response == 1))
[1] 2888
> write.csv(submission1, file = "Laurae/20161002_xgb_mcc/submission1.csv", row.names = FALSE)
> 
> 
> best_mcc <- numeric(1183748)
> 
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + as.numeric(predictions3[, j] > temp_mcc)
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1535558 | rolling average: 0.002663574
Fold 2: threshold=0.1246095 | rolling average: 0.002919118
Fold 3: threshold=0.2546903 | rolling average: 0.002561356
Fold 4: threshold=0.1810271 | rolling average: 0.002501588
Fold 5: threshold=0.1609393 | rolling average: 0.002520807
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 1960
> write.csv(submission2, file = "Laurae/20161002_xgb_mcc/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2525
> write.csv(submission2, file = "Laurae/20161002_xgb_mcc/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2898
> write.csv(submission2, file = "Laurae/20161002_xgb_mcc/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 3323
> write.csv(submission2, file = "Laurae/20161002_xgb_mcc/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 4214
> write.csv(submission2, file = "Laurae/20161002_xgb_mcc/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 4214
> write.csv(submission3, file = "Laurae/20161002_xgb_mcc/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2888
> write.csv(submission4, file = "Laurae/20161002_xgb_mcc/submission4.csv", row.names = FALSE)
