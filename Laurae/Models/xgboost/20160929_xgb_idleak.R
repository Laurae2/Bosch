> #xgb.opt.depth(initial = 11, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)
> 
> Laurae.xgb.opt.depth.best <- 11
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
+   sink(file = "Laurae/20160929_xgb_idleak/logs.txt", append = TRUE, split = FALSE)
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
+   write.csv(predictions1, file = "Laurae/20160929_xgb_idleak/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20160929_xgb_idleak/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20160929_xgb_idleak/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Average of validation predictions:  0.00681513
Average of test predictions:  0.006862742
Average of rolling test predictions:  0.03431371
Fold 1: MCC=0.2921457

Average of validation predictions:  0.005678665
Average of test predictions:  0.00578842
Average of rolling test predictions:  0.0316279
Fold 2: MCC=0.2748663

Average of validation predictions:  0.005993765
Average of test predictions:  0.006052329
Average of rolling test predictions:  0.03117248
Fold 3: MCC=0.2808746

Average of validation predictions:  0.005571549
Average of test predictions:  0.005618154
Average of rolling test predictions:  0.03040206
Fold 4: MCC=0.2613375

Average of validation predictions:  0.006319477
Average of test predictions:  0.006359555
Average of rolling test predictions:  0.0306812
Fold 5: MCC=0.2711212
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20160929_xgb_idleak/predictions_test_mean.csv", row.names = FALSE)
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
Fold 1: MCC=0.2921457 | rolling average: 0.2921457
Fold 2: MCC=0.2748663 | rolling average: 0.283506
Fold 3: MCC=0.2808746 | rolling average: 0.2826289
Fold 4: MCC=0.2613375 | rolling average: 0.277306
Fold 5: MCC=0.2711212 | rolling average: 0.276069
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.276069 + 0.01145097
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1326073 | rolling average: 0.1326073
Fold 2: threshold=0.1204901 | rolling average: 0.1265487
Fold 3: threshold=0.2201519 | rolling average: 0.1577498
Fold 4: threshold=0.2192755 | rolling average: 0.1731312
Fold 5: threshold=0.1600446 | rolling average: 0.1705139
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 >= best_mcc)
> print(sum(submission1$Response == 1))
[1] 2764
> write.csv(submission1, file = "Laurae/20160929_xgb_idleak/submission1.csv", row.names = FALSE)
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
Fold 1: threshold=0.1326073 | rolling average: 0.002804651
Fold 2: threshold=0.1204901 | rolling average: 0.002859561
Fold 3: threshold=0.2201519 | rolling average: 0.002543616
Fold 4: threshold=0.2192755 | rolling average: 0.002370015
Fold 5: threshold=0.1600446 | rolling average: 0.002372802
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 1558
> write.csv(submission2, file = "Laurae/20160929_xgb_idleak/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2209
> write.csv(submission2, file = "Laurae/20160929_xgb_idleak/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2724
> write.csv(submission2, file = "Laurae/20160929_xgb_idleak/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 3325
> write.csv(submission2, file = "Laurae/20160929_xgb_idleak/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 4228
> write.csv(submission2, file = "Laurae/20160929_xgb_idleak/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 4228
> write.csv(submission3, file = "Laurae/20160929_xgb_idleak/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2764
> write.csv(submission4, file = "Laurae/20160929_xgb_idleak/submission4.csv", row.names = FALSE)





Fold 1

[1]	train-auc:0.670186	test-auc:0.666676 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.669697	test-auc:0.665681 
[3]	train-auc:0.670383	test-auc:0.666721 
[4]	train-auc:0.670387	test-auc:0.666723 
[5]	train-auc:0.671907	test-auc:0.667362 
[6]	train-auc:0.671905	test-auc:0.667367 
[7]	train-auc:0.671907	test-auc:0.667367 
[8]	train-auc:0.674549	test-auc:0.671067 
[9]	train-auc:0.674551	test-auc:0.671066 
[10]	train-auc:0.675110	test-auc:0.671493 
[11]	train-auc:0.675112	test-auc:0.671495 
[12]	train-auc:0.675313	test-auc:0.671696 
[13]	train-auc:0.675609	test-auc:0.671703 
[14]	train-auc:0.675853	test-auc:0.672437 
[15]	train-auc:0.675854	test-auc:0.672437 
[16]	train-auc:0.675857	test-auc:0.672438 
[17]	train-auc:0.675859	test-auc:0.672464 
[18]	train-auc:0.675861	test-auc:0.672464 
[19]	train-auc:0.676819	test-auc:0.673199 
[20]	train-auc:0.676814	test-auc:0.673201 
[21]	train-auc:0.676815	test-auc:0.673202 
[22]	train-auc:0.676817	test-auc:0.673203 
[23]	train-auc:0.676964	test-auc:0.673200 
[24]	train-auc:0.676969	test-auc:0.673203 
[25]	train-auc:0.676968	test-auc:0.673193 
[26]	train-auc:0.676970	test-auc:0.673192 
[27]	train-auc:0.676966	test-auc:0.673182 
[28]	train-auc:0.676963	test-auc:0.673171 
[29]	train-auc:0.676963	test-auc:0.673164 
[30]	train-auc:0.676964	test-auc:0.673165 
[31]	train-auc:0.677161	test-auc:0.673138 
[32]	train-auc:0.677163	test-auc:0.673139 
[33]	train-auc:0.677159	test-auc:0.673123 
[34]	train-auc:0.677164	test-auc:0.673124 
[35]	train-auc:0.677167	test-auc:0.673125 
[36]	train-auc:0.677220	test-auc:0.673186 
[37]	train-auc:0.677221	test-auc:0.673187 
[38]	train-auc:0.677223	test-auc:0.673190 
[39]	train-auc:0.677223	test-auc:0.673189 
[40]	train-auc:0.677322	test-auc:0.673183 
[41]	train-auc:0.677326	test-auc:0.673184 
[42]	train-auc:0.677327	test-auc:0.673185 
[43]	train-auc:0.677333	test-auc:0.673194 
[44]	train-auc:0.677636	test-auc:0.673611 
[45]	train-auc:0.692639	test-auc:0.687260 
[46]	train-auc:0.692638	test-auc:0.687259 
[47]	train-auc:0.692638	test-auc:0.687259 
[48]	train-auc:0.692639	test-auc:0.687256 
[49]	train-auc:0.692747	test-auc:0.687251 
[50]	train-auc:0.692735	test-auc:0.687203 
[51]	train-auc:0.692764	test-auc:0.687219 
[52]	train-auc:0.693072	test-auc:0.687588 
[53]	train-auc:0.693076	test-auc:0.687590 
[54]	train-auc:0.693212	test-auc:0.687580 
[55]	train-auc:0.693216	test-auc:0.687581 
[56]	train-auc:0.697507	test-auc:0.693837 
[57]	train-auc:0.697509	test-auc:0.693838 
[58]	train-auc:0.697986	test-auc:0.694427 
[59]	train-auc:0.698094	test-auc:0.694391 
[60]	train-auc:0.698235	test-auc:0.694393 
[61]	train-auc:0.698612	test-auc:0.694616 
[62]	train-auc:0.698573	test-auc:0.694654 
[63]	train-auc:0.698610	test-auc:0.694655 
[64]	train-auc:0.698806	test-auc:0.694648 
[65]	train-auc:0.698798	test-auc:0.694650 
[66]	train-auc:0.698842	test-auc:0.694646 
[67]	train-auc:0.698842	test-auc:0.694646 
[68]	train-auc:0.700386	test-auc:0.695796 
[69]	train-auc:0.706549	test-auc:0.701167 
[70]	train-auc:0.706563	test-auc:0.701164 
[71]	train-auc:0.706737	test-auc:0.701309 
[72]	train-auc:0.707705	test-auc:0.702021 
[73]	train-auc:0.708076	test-auc:0.702284 
[74]	train-auc:0.708144	test-auc:0.702346 
[75]	train-auc:0.708125	test-auc:0.702267 
[76]	train-auc:0.708188	test-auc:0.702488 
[77]	train-auc:0.708385	test-auc:0.702789 
[78]	train-auc:0.708972	test-auc:0.703285 
[79]	train-auc:0.709607	test-auc:0.703864 
[80]	train-auc:0.710491	test-auc:0.704377 
[81]	train-auc:0.710560	test-auc:0.704518 
[82]	train-auc:0.711029	test-auc:0.704764 
[83]	train-auc:0.711650	test-auc:0.704781 
[84]	train-auc:0.713790	test-auc:0.707263 
[85]	train-auc:0.717519	test-auc:0.711758 
[86]	train-auc:0.716067	test-auc:0.709421 
[87]	train-auc:0.716071	test-auc:0.709400 
[88]	train-auc:0.716547	test-auc:0.710083 
[89]	train-auc:0.716825	test-auc:0.710114 
[90]	train-auc:0.717318	test-auc:0.710156 
[91]	train-auc:0.719461	test-auc:0.710253 
[92]	train-auc:0.720958	test-auc:0.710340 
[93]	train-auc:0.721205	test-auc:0.710336 
[94]	train-auc:0.722217	test-auc:0.711277 
[95]	train-auc:0.727226	test-auc:0.716631 
[96]	train-auc:0.727349	test-auc:0.716592 
[97]	train-auc:0.727503	test-auc:0.716510 
[98]	train-auc:0.728917	test-auc:0.718009 
[99]	train-auc:0.730133	test-auc:0.718538 
[100]	train-auc:0.730815	test-auc:0.718762 
[101]	train-auc:0.731188	test-auc:0.718611 
[102]	train-auc:0.731985	test-auc:0.718950 
[103]	train-auc:0.733385	test-auc:0.720379 
[104]	train-auc:0.733505	test-auc:0.720312 
[105]	train-auc:0.733836	test-auc:0.720364 
[106]	train-auc:0.733899	test-auc:0.720740 
[107]	train-auc:0.734560	test-auc:0.720806 
[108]	train-auc:0.736323	test-auc:0.721033 
[109]	train-auc:0.737078	test-auc:0.721080 
[110]	train-auc:0.737743	test-auc:0.721277 
[111]	train-auc:0.740728	test-auc:0.723814 
[112]	train-auc:0.741862	test-auc:0.724575 
[113]	train-auc:0.742519	test-auc:0.724680 
[114]	train-auc:0.743504	test-auc:0.725740 
[115]	train-auc:0.744058	test-auc:0.726405 
[116]	train-auc:0.744348	test-auc:0.726592 
[117]	train-auc:0.744746	test-auc:0.726936 
[118]	train-auc:0.745008	test-auc:0.727326 
[119]	train-auc:0.745376	test-auc:0.727432 
[120]	train-auc:0.745606	test-auc:0.727909 
[121]	train-auc:0.745720	test-auc:0.728161 
[122]	train-auc:0.745793	test-auc:0.728131 
[123]	train-auc:0.746127	test-auc:0.729084 
[124]	train-auc:0.746583	test-auc:0.729022 
[125]	train-auc:0.746890	test-auc:0.728931 
[126]	train-auc:0.747394	test-auc:0.729240 
[127]	train-auc:0.747764	test-auc:0.729313 
[128]	train-auc:0.748797	test-auc:0.730456 
[129]	train-auc:0.749528	test-auc:0.730696 
[130]	train-auc:0.749938	test-auc:0.731135 
[131]	train-auc:0.750620	test-auc:0.731365 
[132]	train-auc:0.751094	test-auc:0.731341 
[133]	train-auc:0.751372	test-auc:0.731577 
[134]	train-auc:0.751876	test-auc:0.731735 
[135]	train-auc:0.754400	test-auc:0.733549 
[136]	train-auc:0.754916	test-auc:0.733975 
[137]	train-auc:0.755260	test-auc:0.734263 
[138]	train-auc:0.756149	test-auc:0.734584 
[139]	train-auc:0.758446	test-auc:0.737015 
[140]	train-auc:0.759599	test-auc:0.738098 
[141]	train-auc:0.762053	test-auc:0.739222 
[142]	train-auc:0.762965	test-auc:0.739673 
[143]	train-auc:0.763346	test-auc:0.740009 
[144]	train-auc:0.764452	test-auc:0.740432 
[145]	train-auc:0.765371	test-auc:0.740332 
[146]	train-auc:0.766041	test-auc:0.740960 
[147]	train-auc:0.767377	test-auc:0.741480 
[148]	train-auc:0.769036	test-auc:0.742168 
[149]	train-auc:0.770895	test-auc:0.742911 
[150]	train-auc:0.772264	test-auc:0.742821 
[151]	train-auc:0.774235	test-auc:0.742918 
[152]	train-auc:0.776250	test-auc:0.743031 
[153]	train-auc:0.777233	test-auc:0.743059 
[154]	train-auc:0.779037	test-auc:0.742786 
[155]	train-auc:0.779946	test-auc:0.743091 
[156]	train-auc:0.781492	test-auc:0.743186 
[157]	train-auc:0.782153	test-auc:0.742565 
[158]	train-auc:0.783528	test-auc:0.743295 
[159]	train-auc:0.785735	test-auc:0.743957 
[160]	train-auc:0.787161	test-auc:0.744803 
[161]	train-auc:0.789315	test-auc:0.744894 
[162]	train-auc:0.790936	test-auc:0.744959 
[163]	train-auc:0.793010	test-auc:0.745424 
[164]	train-auc:0.795154	test-auc:0.745776 
[165]	train-auc:0.797031	test-auc:0.745734 
[166]	train-auc:0.798237	test-auc:0.746283 
[167]	train-auc:0.799926	test-auc:0.746582 
[168]	train-auc:0.802764	test-auc:0.746791 
[169]	train-auc:0.804432	test-auc:0.746724 
[170]	train-auc:0.805644	test-auc:0.747348 
[171]	train-auc:0.807112	test-auc:0.747440 
[172]	train-auc:0.808232	test-auc:0.747262 
[173]	train-auc:0.809211	test-auc:0.747244 
[174]	train-auc:0.812176	test-auc:0.748026 
[175]	train-auc:0.814060	test-auc:0.748396 
[176]	train-auc:0.816324	test-auc:0.748717 
[177]	train-auc:0.818588	test-auc:0.749106 
[178]	train-auc:0.820166	test-auc:0.749211 
[179]	train-auc:0.821594	test-auc:0.749594 
[180]	train-auc:0.822991	test-auc:0.750009 
[181]	train-auc:0.824445	test-auc:0.750286 
[182]	train-auc:0.825231	test-auc:0.750297 
[183]	train-auc:0.826824	test-auc:0.750863 
[184]	train-auc:0.828064	test-auc:0.750892 
[185]	train-auc:0.829370	test-auc:0.751364 
[186]	train-auc:0.831086	test-auc:0.752055 
[187]	train-auc:0.833078	test-auc:0.753295 
[188]	train-auc:0.834133	test-auc:0.753797 
[189]	train-auc:0.836165	test-auc:0.754490 
[190]	train-auc:0.837850	test-auc:0.754801 
[191]	train-auc:0.840119	test-auc:0.755025 
[192]	train-auc:0.842120	test-auc:0.755235 
[193]	train-auc:0.844357	test-auc:0.755886 
[194]	train-auc:0.846155	test-auc:0.755799 
[195]	train-auc:0.847922	test-auc:0.756181 
[196]	train-auc:0.849420	test-auc:0.756275 
[197]	train-auc:0.851527	test-auc:0.756213 
[198]	train-auc:0.853373	test-auc:0.756754 
[199]	train-auc:0.854975	test-auc:0.756667 
[200]	train-auc:0.856325	test-auc:0.756464 
[201]	train-auc:0.858001	test-auc:0.756395 
[202]	train-auc:0.859145	test-auc:0.756180 
[203]	train-auc:0.860291	test-auc:0.755756 
[204]	train-auc:0.862372	test-auc:0.755867 
[205]	train-auc:0.863924	test-auc:0.755632 
[206]	train-auc:0.865347	test-auc:0.755398 
[207]	train-auc:0.866779	test-auc:0.755643 
[208]	train-auc:0.867904	test-auc:0.755639 
[209]	train-auc:0.869114	test-auc:0.755606 
[210]	train-auc:0.870008	test-auc:0.755615 
[211]	train-auc:0.872490	test-auc:0.756127 
[212]	train-auc:0.874257	test-auc:0.756508 
[213]	train-auc:0.875860	test-auc:0.756966 
[214]	train-auc:0.877642	test-auc:0.756824 
[215]	train-auc:0.878744	test-auc:0.757073 
[216]	train-auc:0.879668	test-auc:0.757040 
[217]	train-auc:0.880769	test-auc:0.756801 
[218]	train-auc:0.882435	test-auc:0.756650 
[219]	train-auc:0.883772	test-auc:0.756665 
[220]	train-auc:0.885025	test-auc:0.757077 
[221]	train-auc:0.886515	test-auc:0.757290 
[222]	train-auc:0.889124	test-auc:0.757451 
[223]	train-auc:0.890115	test-auc:0.757610 
[224]	train-auc:0.892536	test-auc:0.757357 
[225]	train-auc:0.893526	test-auc:0.757454 
[226]	train-auc:0.894324	test-auc:0.757593 
[227]	train-auc:0.895703	test-auc:0.757646 
[228]	train-auc:0.897739	test-auc:0.757711 
[229]	train-auc:0.898502	test-auc:0.757753 
[230]	train-auc:0.900201	test-auc:0.757586 
[231]	train-auc:0.901080	test-auc:0.757482 
[232]	train-auc:0.902283	test-auc:0.757508 
[233]	train-auc:0.904782	test-auc:0.757764 
[234]	train-auc:0.905745	test-auc:0.757994 
[235]	train-auc:0.907555	test-auc:0.757966 
[236]	train-auc:0.909738	test-auc:0.758282 
[237]	train-auc:0.911364	test-auc:0.758173 
[238]	train-auc:0.913541	test-auc:0.758393 
[239]	train-auc:0.915401	test-auc:0.758391 
[240]	train-auc:0.916466	test-auc:0.758199 
[241]	train-auc:0.917346	test-auc:0.758087 
[242]	train-auc:0.918699	test-auc:0.757969 
[243]	train-auc:0.919160	test-auc:0.757987 
[244]	train-auc:0.920022	test-auc:0.757853 
[245]	train-auc:0.921325	test-auc:0.757866 
[246]	train-auc:0.922391	test-auc:0.757410 
[247]	train-auc:0.923453	test-auc:0.757536 
[248]	train-auc:0.924434	test-auc:0.757303 
[249]	train-auc:0.925038	test-auc:0.757470 
[250]	train-auc:0.925985	test-auc:0.757746 
[251]	train-auc:0.926443	test-auc:0.757819 
[252]	train-auc:0.926936	test-auc:0.757767 
[253]	train-auc:0.927403	test-auc:0.757785 
[254]	train-auc:0.928354	test-auc:0.757740 
[255]	train-auc:0.928779	test-auc:0.757636 
[256]	train-auc:0.929064	test-auc:0.757819 
[257]	train-auc:0.929369	test-auc:0.757768 
[258]	train-auc:0.930039	test-auc:0.757779 
[259]	train-auc:0.930736	test-auc:0.757872 
[260]	train-auc:0.931014	test-auc:0.757780 
[261]	train-auc:0.931534	test-auc:0.757794 
[262]	train-auc:0.931866	test-auc:0.757745 
[263]	train-auc:0.932642	test-auc:0.757857 
[264]	train-auc:0.933239	test-auc:0.757903 
[265]	train-auc:0.933528	test-auc:0.757854 
[266]	train-auc:0.934551	test-auc:0.757868 
[267]	train-auc:0.935361	test-auc:0.757933 
[268]	train-auc:0.935931	test-auc:0.757922 
[269]	train-auc:0.936813	test-auc:0.757737 
[270]	train-auc:0.937067	test-auc:0.757615 
[271]	train-auc:0.937693	test-auc:0.757580 
[272]	train-auc:0.938361	test-auc:0.757483 
[273]	train-auc:0.938765	test-auc:0.757405 
[274]	train-auc:0.939717	test-auc:0.757387 
[275]	train-auc:0.940129	test-auc:0.757253 
[276]	train-auc:0.940296	test-auc:0.757497 
[277]	train-auc:0.940941	test-auc:0.757220 
[278]	train-auc:0.941252	test-auc:0.757133 
[279]	train-auc:0.941742	test-auc:0.757010 
[280]	train-auc:0.942541	test-auc:0.756924 
[281]	train-auc:0.942901	test-auc:0.756853 
[282]	train-auc:0.943246	test-auc:0.756872 
[283]	train-auc:0.943936	test-auc:0.756874 
[284]	train-auc:0.944345	test-auc:0.756959 
[285]	train-auc:0.945000	test-auc:0.756971 
[286]	train-auc:0.945561	test-auc:0.756917 
[287]	train-auc:0.945705	test-auc:0.756823 
[288]	train-auc:0.945992	test-auc:0.756947 
Stopping. Best iteration:
[238]	train-auc:0.913541	test-auc:0.758393




Fold 2

[1]	train-auc:0.668780	test-auc:0.669673 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.668446	test-auc:0.669909 
[3]	train-auc:0.668462	test-auc:0.669924 
[4]	train-auc:0.668497	test-auc:0.670081 
[5]	train-auc:0.668748	test-auc:0.670432 
[6]	train-auc:0.668754	test-auc:0.670434 
[7]	train-auc:0.670491	test-auc:0.674080 
[8]	train-auc:0.670492	test-auc:0.674081 
[9]	train-auc:0.670830	test-auc:0.674060 
[10]	train-auc:0.671046	test-auc:0.673868 
[11]	train-auc:0.670838	test-auc:0.674055 
[12]	train-auc:0.673399	test-auc:0.676714 
[13]	train-auc:0.673398	test-auc:0.676712 
[14]	train-auc:0.673498	test-auc:0.676703 
[15]	train-auc:0.673499	test-auc:0.676705 
[16]	train-auc:0.673506	test-auc:0.676703 
[17]	train-auc:0.673506	test-auc:0.676707 
[18]	train-auc:0.673509	test-auc:0.676704 
[19]	train-auc:0.673509	test-auc:0.676703 
[20]	train-auc:0.673510	test-auc:0.676704 
[21]	train-auc:0.673512	test-auc:0.676705 
[22]	train-auc:0.673563	test-auc:0.676707 
[23]	train-auc:0.673958	test-auc:0.676701 
[24]	train-auc:0.674903	test-auc:0.677441 
[25]	train-auc:0.674907	test-auc:0.677443 
[26]	train-auc:0.674914	test-auc:0.677450 
[27]	train-auc:0.675013	test-auc:0.677439 
[28]	train-auc:0.675013	test-auc:0.677436 
[29]	train-auc:0.675002	test-auc:0.677426 
[30]	train-auc:0.675003	test-auc:0.677427 
[31]	train-auc:0.675007	test-auc:0.677426 
[32]	train-auc:0.675004	test-auc:0.677420 
[33]	train-auc:0.675006	test-auc:0.677420 
[34]	train-auc:0.675005	test-auc:0.677418 
[35]	train-auc:0.687157	test-auc:0.692846 
[36]	train-auc:0.687160	test-auc:0.692842 
[37]	train-auc:0.687163	test-auc:0.692842 
[38]	train-auc:0.687398	test-auc:0.693029 
[39]	train-auc:0.687682	test-auc:0.693025 
[40]	train-auc:0.687688	test-auc:0.693009 
[41]	train-auc:0.687690	test-auc:0.693010 
[42]	train-auc:0.687930	test-auc:0.693345 
[43]	train-auc:0.687932	test-auc:0.693348 
[44]	train-auc:0.687945	test-auc:0.693329 
[45]	train-auc:0.687946	test-auc:0.693769 
[46]	train-auc:0.687962	test-auc:0.693780 
[47]	train-auc:0.687965	test-auc:0.693781 
[48]	train-auc:0.688025	test-auc:0.693843 
[49]	train-auc:0.688176	test-auc:0.693856 
[50]	train-auc:0.689692	test-auc:0.693728 
[51]	train-auc:0.689900	test-auc:0.693712 
[52]	train-auc:0.689906	test-auc:0.693712 
[53]	train-auc:0.690128	test-auc:0.693614 
[54]	train-auc:0.690516	test-auc:0.693613 
[55]	train-auc:0.690505	test-auc:0.693602 
[56]	train-auc:0.701167	test-auc:0.707858 
[57]	train-auc:0.701162	test-auc:0.707851 
[58]	train-auc:0.701166	test-auc:0.707852 
[59]	train-auc:0.701169	test-auc:0.707854 
[60]	train-auc:0.701135	test-auc:0.707811 
[61]	train-auc:0.701152	test-auc:0.707819 
[62]	train-auc:0.701120	test-auc:0.708270 
[63]	train-auc:0.701374	test-auc:0.708206 
[64]	train-auc:0.701374	test-auc:0.708190 
[65]	train-auc:0.701490	test-auc:0.708066 
[66]	train-auc:0.701468	test-auc:0.708041 
[67]	train-auc:0.701618	test-auc:0.707587 
[68]	train-auc:0.701630	test-auc:0.707789 
[69]	train-auc:0.701653	test-auc:0.707945 
[70]	train-auc:0.701763	test-auc:0.707714 
[71]	train-auc:0.701754	test-auc:0.707906 
[72]	train-auc:0.701752	test-auc:0.707686 
[73]	train-auc:0.701793	test-auc:0.707681 
[74]	train-auc:0.701835	test-auc:0.707668 
[75]	train-auc:0.701854	test-auc:0.707682 
[76]	train-auc:0.702354	test-auc:0.707814 
[77]	train-auc:0.702550	test-auc:0.707979 
[78]	train-auc:0.702590	test-auc:0.707796 
[79]	train-auc:0.702591	test-auc:0.707791 
[80]	train-auc:0.702633	test-auc:0.707769 
[81]	train-auc:0.702650	test-auc:0.708486 
[82]	train-auc:0.702665	test-auc:0.708486 
[83]	train-auc:0.702703	test-auc:0.708280 
[84]	train-auc:0.702696	test-auc:0.708475 
[85]	train-auc:0.702798	test-auc:0.708381 
[86]	train-auc:0.704585	test-auc:0.709426 
[87]	train-auc:0.705397	test-auc:0.709624 
[88]	train-auc:0.706201	test-auc:0.709444 
[89]	train-auc:0.706223	test-auc:0.709458 
[90]	train-auc:0.706442	test-auc:0.709486 
[91]	train-auc:0.706553	test-auc:0.709484 
[92]	train-auc:0.714876	test-auc:0.715609 
[93]	train-auc:0.715636	test-auc:0.715627 
[94]	train-auc:0.715925	test-auc:0.715708 
[95]	train-auc:0.717772	test-auc:0.715959 
[96]	train-auc:0.719406	test-auc:0.716832 
[97]	train-auc:0.719978	test-auc:0.717583 
[98]	train-auc:0.720143	test-auc:0.717708 
[99]	train-auc:0.720193	test-auc:0.717844 
[100]	train-auc:0.720327	test-auc:0.717658 
[101]	train-auc:0.720354	test-auc:0.717549 
[102]	train-auc:0.720602	test-auc:0.717513 
[103]	train-auc:0.722698	test-auc:0.718011 
[104]	train-auc:0.726189	test-auc:0.723419 
[105]	train-auc:0.726671	test-auc:0.723432 
[106]	train-auc:0.728180	test-auc:0.722809 
[107]	train-auc:0.728527	test-auc:0.723259 
[108]	train-auc:0.729865	test-auc:0.723941 
[109]	train-auc:0.730109	test-auc:0.724607 
[110]	train-auc:0.730931	test-auc:0.724635 
[111]	train-auc:0.732551	test-auc:0.726686 
[112]	train-auc:0.733526	test-auc:0.727549 
[113]	train-auc:0.737966	test-auc:0.728793 
[114]	train-auc:0.739256	test-auc:0.728814 
[115]	train-auc:0.740171	test-auc:0.728665 
[116]	train-auc:0.740607	test-auc:0.728787 
[117]	train-auc:0.741136	test-auc:0.728139 
[118]	train-auc:0.742219	test-auc:0.727907 
[119]	train-auc:0.742912	test-auc:0.727197 
[120]	train-auc:0.743458	test-auc:0.727647 
[121]	train-auc:0.744663	test-auc:0.727802 
[122]	train-auc:0.745844	test-auc:0.728423 
[123]	train-auc:0.746733	test-auc:0.728154 
[124]	train-auc:0.747994	test-auc:0.729013 
[125]	train-auc:0.748624	test-auc:0.729763 
[126]	train-auc:0.749359	test-auc:0.730101 
[127]	train-auc:0.750316	test-auc:0.730015 
[128]	train-auc:0.751507	test-auc:0.729789 
[129]	train-auc:0.753554	test-auc:0.731583 
[130]	train-auc:0.755342	test-auc:0.731932 
[131]	train-auc:0.756014	test-auc:0.731899 
[132]	train-auc:0.756734	test-auc:0.732031 
[133]	train-auc:0.756846	test-auc:0.732182 
[134]	train-auc:0.757104	test-auc:0.732045 
[135]	train-auc:0.757412	test-auc:0.732183 
[136]	train-auc:0.757873	test-auc:0.732148 
[137]	train-auc:0.759660	test-auc:0.732429 
[138]	train-auc:0.760320	test-auc:0.732707 
[139]	train-auc:0.761390	test-auc:0.732837 
[140]	train-auc:0.762662	test-auc:0.732996 
[141]	train-auc:0.763767	test-auc:0.732881 
[142]	train-auc:0.765319	test-auc:0.733408 
[143]	train-auc:0.766803	test-auc:0.733380 
[144]	train-auc:0.767273	test-auc:0.733448 
[145]	train-auc:0.769142	test-auc:0.733426 
[146]	train-auc:0.770086	test-auc:0.733791 
[147]	train-auc:0.771128	test-auc:0.734088 
[148]	train-auc:0.772438	test-auc:0.734171 
[149]	train-auc:0.774481	test-auc:0.734655 
[150]	train-auc:0.776714	test-auc:0.735123 
[151]	train-auc:0.778453	test-auc:0.735171 
[152]	train-auc:0.780083	test-auc:0.735112 
[153]	train-auc:0.782735	test-auc:0.735403 
[154]	train-auc:0.784367	test-auc:0.735284 
[155]	train-auc:0.786696	test-auc:0.735707 
[156]	train-auc:0.788722	test-auc:0.735671 
[157]	train-auc:0.789943	test-auc:0.735664 
[158]	train-auc:0.791326	test-auc:0.735797 
[159]	train-auc:0.792470	test-auc:0.735561 
[160]	train-auc:0.793955	test-auc:0.735354 
[161]	train-auc:0.796202	test-auc:0.735528 
[162]	train-auc:0.798801	test-auc:0.736286 
[163]	train-auc:0.800353	test-auc:0.736843 
[164]	train-auc:0.802562	test-auc:0.738501 
[165]	train-auc:0.804236	test-auc:0.738708 
[166]	train-auc:0.805510	test-auc:0.738922 
[167]	train-auc:0.806949	test-auc:0.739057 
[168]	train-auc:0.807955	test-auc:0.739168 
[169]	train-auc:0.809795	test-auc:0.740252 
[170]	train-auc:0.811329	test-auc:0.741200 
[171]	train-auc:0.813208	test-auc:0.741621 
[172]	train-auc:0.816013	test-auc:0.742100 
[173]	train-auc:0.817774	test-auc:0.742192 
[174]	train-auc:0.819711	test-auc:0.742207 
[175]	train-auc:0.821859	test-auc:0.742232 
[176]	train-auc:0.822830	test-auc:0.742785 
[177]	train-auc:0.824388	test-auc:0.742384 
[178]	train-auc:0.825478	test-auc:0.742714 
[179]	train-auc:0.827330	test-auc:0.742647 
[180]	train-auc:0.829831	test-auc:0.743235 
[181]	train-auc:0.831371	test-auc:0.743237 
[182]	train-auc:0.832488	test-auc:0.743551 
[183]	train-auc:0.833956	test-auc:0.743718 
[184]	train-auc:0.835611	test-auc:0.744241 
[185]	train-auc:0.837124	test-auc:0.744709 
[186]	train-auc:0.838274	test-auc:0.745224 
[187]	train-auc:0.839378	test-auc:0.745261 
[188]	train-auc:0.840547	test-auc:0.745856 
[189]	train-auc:0.841620	test-auc:0.746002 
[190]	train-auc:0.842917	test-auc:0.746272 
[191]	train-auc:0.843709	test-auc:0.746442 
[192]	train-auc:0.844504	test-auc:0.746647 
[193]	train-auc:0.845558	test-auc:0.746778 
[194]	train-auc:0.848621	test-auc:0.747558 
[195]	train-auc:0.851318	test-auc:0.747881 
[196]	train-auc:0.853725	test-auc:0.748031 
[197]	train-auc:0.855488	test-auc:0.748378 
[198]	train-auc:0.857854	test-auc:0.748741 
[199]	train-auc:0.859416	test-auc:0.749245 
[200]	train-auc:0.860671	test-auc:0.749557 
[201]	train-auc:0.862703	test-auc:0.749955 
[202]	train-auc:0.864030	test-auc:0.750090 
[203]	train-auc:0.865621	test-auc:0.750367 
[204]	train-auc:0.866676	test-auc:0.750358 
[205]	train-auc:0.868063	test-auc:0.750775 
[206]	train-auc:0.869484	test-auc:0.751194 
[207]	train-auc:0.870979	test-auc:0.751362 
[208]	train-auc:0.872131	test-auc:0.751669 
[209]	train-auc:0.873600	test-auc:0.751744 
[210]	train-auc:0.875003	test-auc:0.751812 
[211]	train-auc:0.876285	test-auc:0.752223 
[212]	train-auc:0.877974	test-auc:0.752373 
[213]	train-auc:0.879040	test-auc:0.752744 
[214]	train-auc:0.879892	test-auc:0.752976 
[215]	train-auc:0.880946	test-auc:0.753169 
[216]	train-auc:0.882227	test-auc:0.752976 
[217]	train-auc:0.882970	test-auc:0.753091 
[218]	train-auc:0.884173	test-auc:0.753121 
[219]	train-auc:0.884765	test-auc:0.753003 
[220]	train-auc:0.886205	test-auc:0.753534 
[221]	train-auc:0.887280	test-auc:0.753625 
[222]	train-auc:0.888302	test-auc:0.753622 
[223]	train-auc:0.889952	test-auc:0.754366 
[224]	train-auc:0.891020	test-auc:0.754641 
[225]	train-auc:0.891854	test-auc:0.754527 
[226]	train-auc:0.892549	test-auc:0.754696 
[227]	train-auc:0.893354	test-auc:0.754679 
[228]	train-auc:0.894456	test-auc:0.754819 
[229]	train-auc:0.895198	test-auc:0.754915 
[230]	train-auc:0.896787	test-auc:0.755372 
[231]	train-auc:0.897862	test-auc:0.755409 
[232]	train-auc:0.899253	test-auc:0.755544 
[233]	train-auc:0.899904	test-auc:0.755597 
[234]	train-auc:0.902140	test-auc:0.755515 
[235]	train-auc:0.903661	test-auc:0.756090 
[236]	train-auc:0.905525	test-auc:0.756279 
[237]	train-auc:0.907076	test-auc:0.756334 
[238]	train-auc:0.908744	test-auc:0.756348 
[239]	train-auc:0.910512	test-auc:0.756130 
[240]	train-auc:0.912025	test-auc:0.756258 
[241]	train-auc:0.913607	test-auc:0.756366 
[242]	train-auc:0.914757	test-auc:0.756251 
[243]	train-auc:0.916181	test-auc:0.756169 
[244]	train-auc:0.918019	test-auc:0.756527 
[245]	train-auc:0.919179	test-auc:0.756635 
[246]	train-auc:0.920898	test-auc:0.756769 
[247]	train-auc:0.922098	test-auc:0.756637 
[248]	train-auc:0.923191	test-auc:0.756563 
[249]	train-auc:0.924481	test-auc:0.756607 
[250]	train-auc:0.925424	test-auc:0.756739 
[251]	train-auc:0.926540	test-auc:0.756953 
[252]	train-auc:0.928285	test-auc:0.757106 
[253]	train-auc:0.928984	test-auc:0.757072 
[254]	train-auc:0.930277	test-auc:0.757197 
[255]	train-auc:0.931527	test-auc:0.757198 
[256]	train-auc:0.932158	test-auc:0.757154 
[257]	train-auc:0.933363	test-auc:0.757072 
[258]	train-auc:0.934141	test-auc:0.757241 
[259]	train-auc:0.935266	test-auc:0.757000 
[260]	train-auc:0.936627	test-auc:0.756941 
[261]	train-auc:0.937475	test-auc:0.757060 
[262]	train-auc:0.938132	test-auc:0.757068 
[263]	train-auc:0.939056	test-auc:0.756913 
[264]	train-auc:0.940051	test-auc:0.757001 
[265]	train-auc:0.940659	test-auc:0.757000 
[266]	train-auc:0.941472	test-auc:0.757163 
[267]	train-auc:0.942599	test-auc:0.757063 
[268]	train-auc:0.943089	test-auc:0.756991 
[269]	train-auc:0.943948	test-auc:0.757218 
[270]	train-auc:0.944479	test-auc:0.757394 
[271]	train-auc:0.944885	test-auc:0.757513 
[272]	train-auc:0.945454	test-auc:0.757608 
[273]	train-auc:0.945935	test-auc:0.757613 
[274]	train-auc:0.946860	test-auc:0.757499 
[275]	train-auc:0.947461	test-auc:0.757541 
[276]	train-auc:0.947903	test-auc:0.757577 
[277]	train-auc:0.948207	test-auc:0.757618 
[278]	train-auc:0.948550	test-auc:0.757736 
[279]	train-auc:0.948864	test-auc:0.757889 
[280]	train-auc:0.949209	test-auc:0.758034 
[281]	train-auc:0.949515	test-auc:0.757974 
[282]	train-auc:0.949732	test-auc:0.757949 
[283]	train-auc:0.949921	test-auc:0.758019 
[284]	train-auc:0.950198	test-auc:0.758132 
[285]	train-auc:0.950391	test-auc:0.758257 
[286]	train-auc:0.950919	test-auc:0.758338 
[287]	train-auc:0.951072	test-auc:0.758367 
[288]	train-auc:0.951493	test-auc:0.758343 
[289]	train-auc:0.951632	test-auc:0.758415 
[290]	train-auc:0.951973	test-auc:0.758471 
[291]	train-auc:0.952275	test-auc:0.758753 
[292]	train-auc:0.952361	test-auc:0.758725 
[293]	train-auc:0.952800	test-auc:0.758836 
[294]	train-auc:0.952887	test-auc:0.758844 
[295]	train-auc:0.953085	test-auc:0.758766 
[296]	train-auc:0.953154	test-auc:0.758784 
[297]	train-auc:0.953470	test-auc:0.758802 
[298]	train-auc:0.953907	test-auc:0.759029 
[299]	train-auc:0.954039	test-auc:0.759053 
[300]	train-auc:0.954098	test-auc:0.759106 
[301]	train-auc:0.954607	test-auc:0.759294 
[302]	train-auc:0.954896	test-auc:0.759414 
[303]	train-auc:0.955060	test-auc:0.759451 
[304]	train-auc:0.955094	test-auc:0.759421 
[305]	train-auc:0.955306	test-auc:0.759449 
[306]	train-auc:0.955670	test-auc:0.759379 
[307]	train-auc:0.955697	test-auc:0.759322 
[308]	train-auc:0.955940	test-auc:0.759398 
[309]	train-auc:0.956077	test-auc:0.759440 
[310]	train-auc:0.956268	test-auc:0.759334 
[311]	train-auc:0.956573	test-auc:0.759302 
[312]	train-auc:0.956786	test-auc:0.759205 
[313]	train-auc:0.956907	test-auc:0.759180 
[314]	train-auc:0.957005	test-auc:0.759277 
[315]	train-auc:0.957133	test-auc:0.759212 
[316]	train-auc:0.957217	test-auc:0.759262 
[317]	train-auc:0.957338	test-auc:0.759218 
[318]	train-auc:0.957528	test-auc:0.759216 
[319]	train-auc:0.957714	test-auc:0.759146 
[320]	train-auc:0.957809	test-auc:0.759254 
[321]	train-auc:0.957830	test-auc:0.759181 
[322]	train-auc:0.957988	test-auc:0.759250 
[323]	train-auc:0.958208	test-auc:0.759236 
[324]	train-auc:0.958276	test-auc:0.759189 
[325]	train-auc:0.958361	test-auc:0.759217 
[326]	train-auc:0.958619	test-auc:0.759154 
[327]	train-auc:0.958890	test-auc:0.759090 
[328]	train-auc:0.959043	test-auc:0.759143 
[329]	train-auc:0.959140	test-auc:0.759073 
[330]	train-auc:0.959212	test-auc:0.759024 
[331]	train-auc:0.959273	test-auc:0.759048 
[332]	train-auc:0.959435	test-auc:0.759007 
[333]	train-auc:0.959526	test-auc:0.758927 
[334]	train-auc:0.959605	test-auc:0.758840 
[335]	train-auc:0.959779	test-auc:0.758807 
[336]	train-auc:0.959932	test-auc:0.758739 
[337]	train-auc:0.960019	test-auc:0.758713 
[338]	train-auc:0.960170	test-auc:0.758719 
[339]	train-auc:0.960209	test-auc:0.758696 
[340]	train-auc:0.960280	test-auc:0.758793 
[341]	train-auc:0.960364	test-auc:0.758891 
[342]	train-auc:0.960553	test-auc:0.758893 
[343]	train-auc:0.960762	test-auc:0.758913 
[344]	train-auc:0.960952	test-auc:0.758944 
[345]	train-auc:0.961146	test-auc:0.759011 
[346]	train-auc:0.961283	test-auc:0.759116 
[347]	train-auc:0.961408	test-auc:0.759032 
[348]	train-auc:0.961518	test-auc:0.759049 
[349]	train-auc:0.961840	test-auc:0.759254 
[350]	train-auc:0.961963	test-auc:0.759246 
[351]	train-auc:0.962121	test-auc:0.759209 
[352]	train-auc:0.962198	test-auc:0.759171 
[353]	train-auc:0.962366	test-auc:0.759165 
Stopping. Best iteration:
[303]	train-auc:0.955060	test-auc:0.759451




Fold 3

[1]	train-auc:0.669885	test-auc:0.671077 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.670163	test-auc:0.671075 
[3]	train-auc:0.670169	test-auc:0.671083 
[4]	train-auc:0.670172	test-auc:0.671082 
[5]	train-auc:0.670173	test-auc:0.671077 
[6]	train-auc:0.670174	test-auc:0.671073 
[7]	train-auc:0.670174	test-auc:0.671073 
[8]	train-auc:0.670172	test-auc:0.671072 
[9]	train-auc:0.670174	test-auc:0.671074 
[10]	train-auc:0.670175	test-auc:0.671074 
[11]	train-auc:0.670180	test-auc:0.671077 
[12]	train-auc:0.670179	test-auc:0.671075 
[13]	train-auc:0.670183	test-auc:0.671080 
[14]	train-auc:0.670185	test-auc:0.671079 
[15]	train-auc:0.670186	test-auc:0.671079 
[16]	train-auc:0.670187	test-auc:0.671078 
[17]	train-auc:0.670188	test-auc:0.671078 
[18]	train-auc:0.670396	test-auc:0.670842 
[19]	train-auc:0.670448	test-auc:0.670835 
[20]	train-auc:0.670449	test-auc:0.670837 
[21]	train-auc:0.670448	test-auc:0.670828 
[22]	train-auc:0.670445	test-auc:0.670829 
[23]	train-auc:0.670447	test-auc:0.670829 
[24]	train-auc:0.689163	test-auc:0.686723 
[25]	train-auc:0.689303	test-auc:0.686716 
[26]	train-auc:0.689321	test-auc:0.686767 
[27]	train-auc:0.689321	test-auc:0.686762 
[28]	train-auc:0.689429	test-auc:0.685622 
[29]	train-auc:0.689431	test-auc:0.685622 
[30]	train-auc:0.689437	test-auc:0.685629 
[31]	train-auc:0.689438	test-auc:0.685630 
[32]	train-auc:0.689441	test-auc:0.685630 
[33]	train-auc:0.689443	test-auc:0.685631 
[34]	train-auc:0.689445	test-auc:0.685629 
[35]	train-auc:0.689446	test-auc:0.685629 
[36]	train-auc:0.689450	test-auc:0.685631 
[37]	train-auc:0.689451	test-auc:0.685631 
[38]	train-auc:0.689455	test-auc:0.685631 
[39]	train-auc:0.689456	test-auc:0.685630 
[40]	train-auc:0.689629	test-auc:0.685618 
[41]	train-auc:0.689630	test-auc:0.685618 
[42]	train-auc:0.689620	test-auc:0.685609 
[43]	train-auc:0.689666	test-auc:0.685367 
[44]	train-auc:0.689677	test-auc:0.685376 
[45]	train-auc:0.689677	test-auc:0.685376 
[46]	train-auc:0.689678	test-auc:0.685378 
[47]	train-auc:0.689682	test-auc:0.685383 
[48]	train-auc:0.689893	test-auc:0.685370 
[49]	train-auc:0.690036	test-auc:0.685362 
[50]	train-auc:0.690139	test-auc:0.685346 
[51]	train-auc:0.690142	test-auc:0.685346 
[52]	train-auc:0.690344	test-auc:0.685680 
[53]	train-auc:0.690346	test-auc:0.685682 
[54]	train-auc:0.690350	test-auc:0.685684 
[55]	train-auc:0.690831	test-auc:0.686177 
[56]	train-auc:0.690830	test-auc:0.686182 
[57]	train-auc:0.690820	test-auc:0.686169 
[58]	train-auc:0.691110	test-auc:0.684719 
[59]	train-auc:0.691207	test-auc:0.684569 
[60]	train-auc:0.691204	test-auc:0.684566 
[61]	train-auc:0.691212	test-auc:0.684289 
[62]	train-auc:0.691309	test-auc:0.684283 
[63]	train-auc:0.691285	test-auc:0.684252 
[64]	train-auc:0.691278	test-auc:0.684246 
[65]	train-auc:0.698974	test-auc:0.691716 
[66]	train-auc:0.699018	test-auc:0.691666 
[67]	train-auc:0.701230	test-auc:0.692018 
[68]	train-auc:0.702911	test-auc:0.692682 
[69]	train-auc:0.703189	test-auc:0.692884 
[70]	train-auc:0.703395	test-auc:0.692862 
[71]	train-auc:0.703417	test-auc:0.692935 
[72]	train-auc:0.703451	test-auc:0.693351 
[73]	train-auc:0.703986	test-auc:0.693271 
[74]	train-auc:0.703824	test-auc:0.694194 
[75]	train-auc:0.703819	test-auc:0.694187 
[76]	train-auc:0.703906	test-auc:0.694178 
[77]	train-auc:0.703998	test-auc:0.694571 
[78]	train-auc:0.703982	test-auc:0.694534 
[79]	train-auc:0.718749	test-auc:0.702152 
[80]	train-auc:0.718762	test-auc:0.702219 
[81]	train-auc:0.718734	test-auc:0.702184 
[82]	train-auc:0.718743	test-auc:0.702188 
[83]	train-auc:0.718798	test-auc:0.702179 
[84]	train-auc:0.718811	test-auc:0.702175 
[85]	train-auc:0.718884	test-auc:0.702224 
[86]	train-auc:0.718861	test-auc:0.702152 
[87]	train-auc:0.719074	test-auc:0.702134 
[88]	train-auc:0.719725	test-auc:0.702034 
[89]	train-auc:0.720123	test-auc:0.702149 
[90]	train-auc:0.720790	test-auc:0.702457 
[91]	train-auc:0.721180	test-auc:0.702418 
[92]	train-auc:0.721511	test-auc:0.702534 
[93]	train-auc:0.721534	test-auc:0.702344 
[94]	train-auc:0.725543	test-auc:0.703079 
[95]	train-auc:0.727445	test-auc:0.703893 
[96]	train-auc:0.727198	test-auc:0.701810 
[97]	train-auc:0.728686	test-auc:0.701867 
[98]	train-auc:0.728891	test-auc:0.701501 
[99]	train-auc:0.731947	test-auc:0.702634 
[100]	train-auc:0.732122	test-auc:0.702398 
[101]	train-auc:0.734214	test-auc:0.702683 
[102]	train-auc:0.735257	test-auc:0.702478 
[103]	train-auc:0.735428	test-auc:0.702407 
[104]	train-auc:0.735678	test-auc:0.702769 
[105]	train-auc:0.736207	test-auc:0.702766 
[106]	train-auc:0.736331	test-auc:0.702945 
[107]	train-auc:0.736572	test-auc:0.703237 
[108]	train-auc:0.736978	test-auc:0.703182 
[109]	train-auc:0.737257	test-auc:0.703110 
[110]	train-auc:0.741779	test-auc:0.705025 
[111]	train-auc:0.743061	test-auc:0.705365 
[112]	train-auc:0.743526	test-auc:0.705420 
[113]	train-auc:0.744519	test-auc:0.706184 
[114]	train-auc:0.744474	test-auc:0.706442 
[115]	train-auc:0.745285	test-auc:0.706846 
[116]	train-auc:0.747175	test-auc:0.709449 
[117]	train-auc:0.747393	test-auc:0.709430 
[118]	train-auc:0.747937	test-auc:0.709209 
[119]	train-auc:0.748468	test-auc:0.709102 
[120]	train-auc:0.748962	test-auc:0.709369 
[121]	train-auc:0.749482	test-auc:0.709595 
[122]	train-auc:0.750062	test-auc:0.709759 
[123]	train-auc:0.750322	test-auc:0.710138 
[124]	train-auc:0.750672	test-auc:0.710044 
[125]	train-auc:0.750785	test-auc:0.710312 
[126]	train-auc:0.752126	test-auc:0.711624 
[127]	train-auc:0.752263	test-auc:0.711770 
[128]	train-auc:0.752504	test-auc:0.711930 
[129]	train-auc:0.753653	test-auc:0.712288 
[130]	train-auc:0.755255	test-auc:0.713671 
[131]	train-auc:0.756109	test-auc:0.714006 
[132]	train-auc:0.756303	test-auc:0.713967 
[133]	train-auc:0.757867	test-auc:0.714958 
[134]	train-auc:0.758676	test-auc:0.715342 
[135]	train-auc:0.759982	test-auc:0.715508 
[136]	train-auc:0.761117	test-auc:0.715432 
[137]	train-auc:0.761445	test-auc:0.715845 
[138]	train-auc:0.761636	test-auc:0.715946 
[139]	train-auc:0.762425	test-auc:0.715923 
[140]	train-auc:0.764112	test-auc:0.715653 
[141]	train-auc:0.765459	test-auc:0.716459 
[142]	train-auc:0.767296	test-auc:0.716776 
[143]	train-auc:0.768337	test-auc:0.717280 
[144]	train-auc:0.770674	test-auc:0.717717 
[145]	train-auc:0.771083	test-auc:0.717771 
[146]	train-auc:0.771885	test-auc:0.718378 
[147]	train-auc:0.773317	test-auc:0.719191 
[148]	train-auc:0.774274	test-auc:0.719193 
[149]	train-auc:0.776935	test-auc:0.719563 
[150]	train-auc:0.777462	test-auc:0.719521 
[151]	train-auc:0.779786	test-auc:0.720563 
[152]	train-auc:0.781545	test-auc:0.722341 
[153]	train-auc:0.783620	test-auc:0.722950 
[154]	train-auc:0.785830	test-auc:0.723624 
[155]	train-auc:0.787762	test-auc:0.724578 
[156]	train-auc:0.789183	test-auc:0.724651 
[157]	train-auc:0.790386	test-auc:0.724673 
[158]	train-auc:0.791212	test-auc:0.724704 
[159]	train-auc:0.793168	test-auc:0.724990 
[160]	train-auc:0.794126	test-auc:0.725080 
[161]	train-auc:0.796313	test-auc:0.725056 
[162]	train-auc:0.798256	test-auc:0.725279 
[163]	train-auc:0.800291	test-auc:0.725489 
[164]	train-auc:0.801580	test-auc:0.725604 
[165]	train-auc:0.802541	test-auc:0.725541 
[166]	train-auc:0.804019	test-auc:0.726075 
[167]	train-auc:0.804565	test-auc:0.726501 
[168]	train-auc:0.805692	test-auc:0.726627 
[169]	train-auc:0.808017	test-auc:0.726443 
[170]	train-auc:0.809451	test-auc:0.726433 
[171]	train-auc:0.810729	test-auc:0.726779 
[172]	train-auc:0.812657	test-auc:0.726782 
[173]	train-auc:0.814526	test-auc:0.727131 
[174]	train-auc:0.815654	test-auc:0.727613 
[175]	train-auc:0.816936	test-auc:0.727831 
[176]	train-auc:0.818359	test-auc:0.727928 
[177]	train-auc:0.820817	test-auc:0.728364 
[178]	train-auc:0.822718	test-auc:0.728299 
[179]	train-auc:0.824249	test-auc:0.728755 
[180]	train-auc:0.827006	test-auc:0.729122 
[181]	train-auc:0.828725	test-auc:0.729933 
[182]	train-auc:0.830306	test-auc:0.730720 
[183]	train-auc:0.831926	test-auc:0.731380 
[184]	train-auc:0.833164	test-auc:0.731641 
[185]	train-auc:0.835376	test-auc:0.732576 
[186]	train-auc:0.836932	test-auc:0.733735 
[187]	train-auc:0.838258	test-auc:0.733572 
[188]	train-auc:0.840076	test-auc:0.733643 
[189]	train-auc:0.841317	test-auc:0.734396 
[190]	train-auc:0.842572	test-auc:0.734424 
[191]	train-auc:0.843625	test-auc:0.734713 
[192]	train-auc:0.844902	test-auc:0.734993 
[193]	train-auc:0.846911	test-auc:0.735772 
[194]	train-auc:0.849156	test-auc:0.736075 
[195]	train-auc:0.850795	test-auc:0.736413 
[196]	train-auc:0.852470	test-auc:0.736511 
[197]	train-auc:0.854055	test-auc:0.736768 
[198]	train-auc:0.855301	test-auc:0.736937 
[199]	train-auc:0.856366	test-auc:0.737030 
[200]	train-auc:0.857281	test-auc:0.737041 
[201]	train-auc:0.858634	test-auc:0.736926 
[202]	train-auc:0.860019	test-auc:0.737004 
[203]	train-auc:0.861567	test-auc:0.737558 
[204]	train-auc:0.863481	test-auc:0.738083 
[205]	train-auc:0.864564	test-auc:0.738274 
[206]	train-auc:0.866224	test-auc:0.738403 
[207]	train-auc:0.867592	test-auc:0.738450 
[208]	train-auc:0.868516	test-auc:0.738669 
[209]	train-auc:0.869998	test-auc:0.739064 
[210]	train-auc:0.871088	test-auc:0.739053 
[211]	train-auc:0.872699	test-auc:0.739457 
[212]	train-auc:0.874126	test-auc:0.739718 
[213]	train-auc:0.875834	test-auc:0.740213 
[214]	train-auc:0.877149	test-auc:0.740242 
[215]	train-auc:0.878285	test-auc:0.740348 
[216]	train-auc:0.879149	test-auc:0.740167 
[217]	train-auc:0.880911	test-auc:0.740685 
[218]	train-auc:0.882257	test-auc:0.740798 
[219]	train-auc:0.883838	test-auc:0.740818 
[220]	train-auc:0.885810	test-auc:0.740888 
[221]	train-auc:0.887314	test-auc:0.741138 
[222]	train-auc:0.889387	test-auc:0.741329 
[223]	train-auc:0.890456	test-auc:0.741529 
[224]	train-auc:0.892059	test-auc:0.741559 
[225]	train-auc:0.894322	test-auc:0.742052 
[226]	train-auc:0.895327	test-auc:0.741993 
[227]	train-auc:0.896809	test-auc:0.742162 
[228]	train-auc:0.898003	test-auc:0.742412 
[229]	train-auc:0.898975	test-auc:0.742298 
[230]	train-auc:0.899608	test-auc:0.742378 
[231]	train-auc:0.900838	test-auc:0.742683 
[232]	train-auc:0.901792	test-auc:0.742844 
[233]	train-auc:0.902193	test-auc:0.742698 
[234]	train-auc:0.902666	test-auc:0.742622 
[235]	train-auc:0.903245	test-auc:0.742692 
[236]	train-auc:0.904569	test-auc:0.742586 
[237]	train-auc:0.904938	test-auc:0.742603 
[238]	train-auc:0.907103	test-auc:0.742674 
[239]	train-auc:0.908421	test-auc:0.742696 
[240]	train-auc:0.910225	test-auc:0.742765 
[241]	train-auc:0.912214	test-auc:0.743176 
[242]	train-auc:0.913611	test-auc:0.743445 
[243]	train-auc:0.914645	test-auc:0.743719 
[244]	train-auc:0.915026	test-auc:0.743913 
[245]	train-auc:0.916036	test-auc:0.743811 
[246]	train-auc:0.917357	test-auc:0.743797 
[247]	train-auc:0.918650	test-auc:0.743948 
[248]	train-auc:0.919268	test-auc:0.743895 
[249]	train-auc:0.920509	test-auc:0.743958 
[250]	train-auc:0.921048	test-auc:0.744028 
[251]	train-auc:0.921862	test-auc:0.743980 
[252]	train-auc:0.922294	test-auc:0.743992 
[253]	train-auc:0.922982	test-auc:0.744077 
[254]	train-auc:0.923951	test-auc:0.744032 
[255]	train-auc:0.924913	test-auc:0.743748 
[256]	train-auc:0.925784	test-auc:0.743504 
[257]	train-auc:0.926906	test-auc:0.743484 
[258]	train-auc:0.927833	test-auc:0.743461 
[259]	train-auc:0.928284	test-auc:0.743424 
[260]	train-auc:0.929059	test-auc:0.743558 
[261]	train-auc:0.929846	test-auc:0.743637 
[262]	train-auc:0.930323	test-auc:0.743779 
[263]	train-auc:0.930723	test-auc:0.743702 
[264]	train-auc:0.931771	test-auc:0.743645 
[265]	train-auc:0.932371	test-auc:0.743741 
[266]	train-auc:0.933283	test-auc:0.744026 
[267]	train-auc:0.933673	test-auc:0.744031 
[268]	train-auc:0.933878	test-auc:0.744164 
[269]	train-auc:0.934502	test-auc:0.744250 
[270]	train-auc:0.935001	test-auc:0.744329 
[271]	train-auc:0.935595	test-auc:0.744348 
[272]	train-auc:0.936627	test-auc:0.744493 
[273]	train-auc:0.937030	test-auc:0.744457 
[274]	train-auc:0.937464	test-auc:0.744683 
[275]	train-auc:0.937687	test-auc:0.744818 
[276]	train-auc:0.938443	test-auc:0.744743 
[277]	train-auc:0.938924	test-auc:0.744636 
[278]	train-auc:0.939451	test-auc:0.744755 
[279]	train-auc:0.939875	test-auc:0.744725 
[280]	train-auc:0.940262	test-auc:0.744509 
[281]	train-auc:0.941008	test-auc:0.744611 
[282]	train-auc:0.941522	test-auc:0.744695 
[283]	train-auc:0.942076	test-auc:0.744676 
[284]	train-auc:0.942274	test-auc:0.744532 
[285]	train-auc:0.942535	test-auc:0.744560 
[286]	train-auc:0.942797	test-auc:0.744446 
[287]	train-auc:0.943079	test-auc:0.744574 
[288]	train-auc:0.943374	test-auc:0.744533 
[289]	train-auc:0.943563	test-auc:0.744731 
[290]	train-auc:0.943778	test-auc:0.744717 
[291]	train-auc:0.943992	test-auc:0.744622 
[292]	train-auc:0.944042	test-auc:0.744679 
[293]	train-auc:0.944297	test-auc:0.744655 
[294]	train-auc:0.944350	test-auc:0.744681 
[295]	train-auc:0.944529	test-auc:0.744593 
[296]	train-auc:0.944727	test-auc:0.744562 
[297]	train-auc:0.944776	test-auc:0.744587 
[298]	train-auc:0.944916	test-auc:0.744465 
[299]	train-auc:0.945166	test-auc:0.744498 
[300]	train-auc:0.945657	test-auc:0.744349 
[301]	train-auc:0.945786	test-auc:0.744344 
[302]	train-auc:0.945895	test-auc:0.744372 
[303]	train-auc:0.946404	test-auc:0.744280 
[304]	train-auc:0.946497	test-auc:0.744285 
[305]	train-auc:0.946851	test-auc:0.744083 
[306]	train-auc:0.946940	test-auc:0.744087 
[307]	train-auc:0.947226	test-auc:0.744122 
[308]	train-auc:0.947447	test-auc:0.744146 
[309]	train-auc:0.947564	test-auc:0.744150 
[310]	train-auc:0.947551	test-auc:0.744154 
[311]	train-auc:0.947917	test-auc:0.744287 
[312]	train-auc:0.948366	test-auc:0.744259 
[313]	train-auc:0.948617	test-auc:0.744243 
[314]	train-auc:0.948720	test-auc:0.744289 
[315]	train-auc:0.948908	test-auc:0.744249 
[316]	train-auc:0.949110	test-auc:0.744267 
[317]	train-auc:0.949298	test-auc:0.744189 
[318]	train-auc:0.949374	test-auc:0.744197 
[319]	train-auc:0.949844	test-auc:0.744278 
[320]	train-auc:0.949995	test-auc:0.744079 
[321]	train-auc:0.950140	test-auc:0.744024 
[322]	train-auc:0.950189	test-auc:0.744056 
[323]	train-auc:0.950206	test-auc:0.744106 
[324]	train-auc:0.950291	test-auc:0.744138 
[325]	train-auc:0.950526	test-auc:0.744031 
Stopping. Best iteration:
[275]	train-auc:0.937687	test-auc:0.744818




Fold 4

[1]	train-auc:0.673911	test-auc:0.661997 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.673995	test-auc:0.662582 
[3]	train-auc:0.675321	test-auc:0.665678 
[4]	train-auc:0.675548	test-auc:0.665027 
[5]	train-auc:0.676794	test-auc:0.666317 
[6]	train-auc:0.676803	test-auc:0.666312 
[7]	train-auc:0.676730	test-auc:0.666755 
[8]	train-auc:0.676735	test-auc:0.666741 
[9]	train-auc:0.676729	test-auc:0.666748 
[10]	train-auc:0.676784	test-auc:0.666733 
[11]	train-auc:0.676787	test-auc:0.666738 
[12]	train-auc:0.677359	test-auc:0.667446 
[13]	train-auc:0.677361	test-auc:0.667446 
[14]	train-auc:0.677363	test-auc:0.667436 
[15]	train-auc:0.677503	test-auc:0.667845 
[16]	train-auc:0.677509	test-auc:0.667859 
[17]	train-auc:0.677512	test-auc:0.667848 
[18]	train-auc:0.677391	test-auc:0.668284 
[19]	train-auc:0.677541	test-auc:0.668265 
[20]	train-auc:0.677543	test-auc:0.668267 
[21]	train-auc:0.677545	test-auc:0.668267 
[22]	train-auc:0.677544	test-auc:0.668265 
[23]	train-auc:0.677553	test-auc:0.668231 
[24]	train-auc:0.677558	test-auc:0.668236 
[25]	train-auc:0.677560	test-auc:0.668235 
[26]	train-auc:0.677594	test-auc:0.668218 
[27]	train-auc:0.677783	test-auc:0.668202 
[28]	train-auc:0.677783	test-auc:0.668198 
[29]	train-auc:0.677803	test-auc:0.668188 
[30]	train-auc:0.690242	test-auc:0.678747 
[31]	train-auc:0.690371	test-auc:0.678769 
[32]	train-auc:0.690537	test-auc:0.678935 
[33]	train-auc:0.690684	test-auc:0.678994 
[34]	train-auc:0.690867	test-auc:0.678925 
[35]	train-auc:0.691065	test-auc:0.679155 
[36]	train-auc:0.691056	test-auc:0.679182 
[37]	train-auc:0.691056	test-auc:0.679181 
[38]	train-auc:0.691196	test-auc:0.679168 
[39]	train-auc:0.691212	test-auc:0.679165 
[40]	train-auc:0.691232	test-auc:0.679163 
[41]	train-auc:0.691374	test-auc:0.679162 
[42]	train-auc:0.691977	test-auc:0.680645 
[43]	train-auc:0.691983	test-auc:0.681066 
[44]	train-auc:0.692144	test-auc:0.680751 
[45]	train-auc:0.692145	test-auc:0.680748 
[46]	train-auc:0.692147	test-auc:0.680750 
[47]	train-auc:0.692149	test-auc:0.680752 
[48]	train-auc:0.692388	test-auc:0.680740 
[49]	train-auc:0.692367	test-auc:0.680680 
[50]	train-auc:0.692553	test-auc:0.680686 
[51]	train-auc:0.692676	test-auc:0.680821 
[52]	train-auc:0.692753	test-auc:0.680336 
[53]	train-auc:0.704768	test-auc:0.693863 
[54]	train-auc:0.704771	test-auc:0.693864 
[55]	train-auc:0.704835	test-auc:0.693856 
[56]	train-auc:0.704836	test-auc:0.693853 
[57]	train-auc:0.705011	test-auc:0.693605 
[58]	train-auc:0.705544	test-auc:0.693259 
[59]	train-auc:0.705762	test-auc:0.693136 
[60]	train-auc:0.706132	test-auc:0.693204 
[61]	train-auc:0.706014	test-auc:0.693343 
[62]	train-auc:0.706098	test-auc:0.693143 
[63]	train-auc:0.706157	test-auc:0.693132 
[64]	train-auc:0.706113	test-auc:0.692938 
[65]	train-auc:0.706693	test-auc:0.693717 
[66]	train-auc:0.706684	test-auc:0.693569 
[67]	train-auc:0.707316	test-auc:0.693618 
[68]	train-auc:0.707321	test-auc:0.693609 
[69]	train-auc:0.707605	test-auc:0.693596 
[70]	train-auc:0.715470	test-auc:0.697888 
[71]	train-auc:0.716885	test-auc:0.699302 
[72]	train-auc:0.717812	test-auc:0.699266 
[73]	train-auc:0.717909	test-auc:0.699238 
[74]	train-auc:0.718108	test-auc:0.699447 
[75]	train-auc:0.718875	test-auc:0.699984 
[76]	train-auc:0.720014	test-auc:0.701135 
[77]	train-auc:0.720344	test-auc:0.701086 
[78]	train-auc:0.722096	test-auc:0.701773 
[79]	train-auc:0.722434	test-auc:0.702095 
[80]	train-auc:0.722451	test-auc:0.702463 
[81]	train-auc:0.722907	test-auc:0.702438 
[82]	train-auc:0.726845	test-auc:0.704390 
[83]	train-auc:0.727815	test-auc:0.704414 
[84]	train-auc:0.727752	test-auc:0.704332 
[85]	train-auc:0.728057	test-auc:0.704598 
[86]	train-auc:0.728143	test-auc:0.704831 
[87]	train-auc:0.728365	test-auc:0.704889 
[88]	train-auc:0.729868	test-auc:0.705676 
[89]	train-auc:0.730452	test-auc:0.705974 
[90]	train-auc:0.730784	test-auc:0.705309 
[91]	train-auc:0.730878	test-auc:0.705295 
[92]	train-auc:0.730936	test-auc:0.705280 
[93]	train-auc:0.730944	test-auc:0.705290 
[94]	train-auc:0.732289	test-auc:0.705688 
[95]	train-auc:0.732463	test-auc:0.706179 
[96]	train-auc:0.732617	test-auc:0.706536 
[97]	train-auc:0.733992	test-auc:0.707948 
[98]	train-auc:0.734565	test-auc:0.707971 
[99]	train-auc:0.734582	test-auc:0.707874 
[100]	train-auc:0.737135	test-auc:0.709238 
[101]	train-auc:0.737805	test-auc:0.710202 
[102]	train-auc:0.737929	test-auc:0.710295 
[103]	train-auc:0.738089	test-auc:0.710622 
[104]	train-auc:0.738498	test-auc:0.710836 
[105]	train-auc:0.738671	test-auc:0.710728 
[106]	train-auc:0.739248	test-auc:0.710834 
[107]	train-auc:0.739690	test-auc:0.710919 
[108]	train-auc:0.740098	test-auc:0.710873 
[109]	train-auc:0.740436	test-auc:0.710889 
[110]	train-auc:0.741751	test-auc:0.711382 
[111]	train-auc:0.742149	test-auc:0.711468 
[112]	train-auc:0.743418	test-auc:0.711383 
[113]	train-auc:0.743827	test-auc:0.711084 
[114]	train-auc:0.745074	test-auc:0.711017 
[115]	train-auc:0.745277	test-auc:0.711005 
[116]	train-auc:0.745418	test-auc:0.710922 
[117]	train-auc:0.746018	test-auc:0.710871 
[118]	train-auc:0.746496	test-auc:0.711314 
[119]	train-auc:0.746998	test-auc:0.711344 
[120]	train-auc:0.747685	test-auc:0.711610 
[121]	train-auc:0.747868	test-auc:0.711504 
[122]	train-auc:0.748480	test-auc:0.711484 
[123]	train-auc:0.748939	test-auc:0.711321 
[124]	train-auc:0.749816	test-auc:0.711404 
[125]	train-auc:0.751849	test-auc:0.712002 
[126]	train-auc:0.753081	test-auc:0.712248 
[127]	train-auc:0.754476	test-auc:0.712728 
[128]	train-auc:0.755441	test-auc:0.713528 
[129]	train-auc:0.756268	test-auc:0.713980 
[130]	train-auc:0.756458	test-auc:0.714638 
[131]	train-auc:0.756692	test-auc:0.715041 
[132]	train-auc:0.760317	test-auc:0.715944 
[133]	train-auc:0.762248	test-auc:0.716749 
[134]	train-auc:0.762706	test-auc:0.716878 
[135]	train-auc:0.763861	test-auc:0.717437 
[136]	train-auc:0.764989	test-auc:0.717885 
[137]	train-auc:0.765819	test-auc:0.718074 
[138]	train-auc:0.766120	test-auc:0.718454 
[139]	train-auc:0.766823	test-auc:0.719095 
[140]	train-auc:0.767083	test-auc:0.719424 
[141]	train-auc:0.767598	test-auc:0.719497 
[142]	train-auc:0.768200	test-auc:0.720177 
[143]	train-auc:0.769496	test-auc:0.720946 
[144]	train-auc:0.769961	test-auc:0.720661 
[145]	train-auc:0.771148	test-auc:0.721095 
[146]	train-auc:0.772762	test-auc:0.721990 
[147]	train-auc:0.773496	test-auc:0.722244 
[148]	train-auc:0.774721	test-auc:0.722716 
[149]	train-auc:0.775638	test-auc:0.722908 
[150]	train-auc:0.777064	test-auc:0.723168 
[151]	train-auc:0.778348	test-auc:0.723842 
[152]	train-auc:0.779546	test-auc:0.724048 
[153]	train-auc:0.781569	test-auc:0.724988 
[154]	train-auc:0.782680	test-auc:0.725246 
[155]	train-auc:0.784093	test-auc:0.725281 
[156]	train-auc:0.785553	test-auc:0.725369 
[157]	train-auc:0.786729	test-auc:0.725468 
[158]	train-auc:0.789425	test-auc:0.726197 
[159]	train-auc:0.790644	test-auc:0.726022 
[160]	train-auc:0.791963	test-auc:0.725738 
[161]	train-auc:0.793113	test-auc:0.725584 
[162]	train-auc:0.794800	test-auc:0.726189 
[163]	train-auc:0.797758	test-auc:0.727020 
[164]	train-auc:0.800364	test-auc:0.727613 
[165]	train-auc:0.802454	test-auc:0.728016 
[166]	train-auc:0.804203	test-auc:0.728054 
[167]	train-auc:0.806276	test-auc:0.728506 
[168]	train-auc:0.807899	test-auc:0.729090 
[169]	train-auc:0.809626	test-auc:0.729379 
[170]	train-auc:0.811079	test-auc:0.729750 
[171]	train-auc:0.812582	test-auc:0.729910 
[172]	train-auc:0.814449	test-auc:0.730894 
[173]	train-auc:0.815850	test-auc:0.731639 
[174]	train-auc:0.817204	test-auc:0.732365 
[175]	train-auc:0.819183	test-auc:0.732756 
[176]	train-auc:0.820663	test-auc:0.732698 
[177]	train-auc:0.822097	test-auc:0.732750 
[178]	train-auc:0.823895	test-auc:0.732661 
[179]	train-auc:0.825165	test-auc:0.732612 
[180]	train-auc:0.826546	test-auc:0.732744 
[181]	train-auc:0.827701	test-auc:0.732757 
[182]	train-auc:0.828989	test-auc:0.733308 
[183]	train-auc:0.830468	test-auc:0.733461 
[184]	train-auc:0.831603	test-auc:0.733556 
[185]	train-auc:0.833750	test-auc:0.734021 
[186]	train-auc:0.834831	test-auc:0.734013 
[187]	train-auc:0.836762	test-auc:0.734907 
[188]	train-auc:0.838499	test-auc:0.735050 
[189]	train-auc:0.840628	test-auc:0.735069 
[190]	train-auc:0.842597	test-auc:0.735429 
[191]	train-auc:0.845363	test-auc:0.736404 
[192]	train-auc:0.847397	test-auc:0.737170 
[193]	train-auc:0.849736	test-auc:0.737612 
[194]	train-auc:0.851947	test-auc:0.737832 
[195]	train-auc:0.853712	test-auc:0.738418 
[196]	train-auc:0.854874	test-auc:0.738859 
[197]	train-auc:0.856898	test-auc:0.739226 
[198]	train-auc:0.858162	test-auc:0.739425 
[199]	train-auc:0.859218	test-auc:0.739850 
[200]	train-auc:0.860798	test-auc:0.740251 
[201]	train-auc:0.862330	test-auc:0.740252 
[202]	train-auc:0.863502	test-auc:0.740489 
[203]	train-auc:0.865172	test-auc:0.740820 
[204]	train-auc:0.866653	test-auc:0.740894 
[205]	train-auc:0.867537	test-auc:0.741174 
[206]	train-auc:0.869598	test-auc:0.741438 
[207]	train-auc:0.871161	test-auc:0.741630 
[208]	train-auc:0.873051	test-auc:0.741648 
[209]	train-auc:0.874626	test-auc:0.742094 
[210]	train-auc:0.876202	test-auc:0.742061 
[211]	train-auc:0.877860	test-auc:0.742399 
[212]	train-auc:0.879366	test-auc:0.742610 
[213]	train-auc:0.880722	test-auc:0.742479 
[214]	train-auc:0.882178	test-auc:0.742420 
[215]	train-auc:0.883530	test-auc:0.742425 
[216]	train-auc:0.885103	test-auc:0.742712 
[217]	train-auc:0.886613	test-auc:0.742616 
[218]	train-auc:0.887834	test-auc:0.742559 
[219]	train-auc:0.888978	test-auc:0.742553 
[220]	train-auc:0.890395	test-auc:0.742932 
[221]	train-auc:0.891453	test-auc:0.742949 
[222]	train-auc:0.892900	test-auc:0.743114 
[223]	train-auc:0.894167	test-auc:0.743233 
[224]	train-auc:0.895038	test-auc:0.743414 
[225]	train-auc:0.896323	test-auc:0.743584 
[226]	train-auc:0.897206	test-auc:0.743570 
[227]	train-auc:0.898591	test-auc:0.743572 
[228]	train-auc:0.899693	test-auc:0.743485 
[229]	train-auc:0.901136	test-auc:0.743541 
[230]	train-auc:0.902086	test-auc:0.743529 
[231]	train-auc:0.904050	test-auc:0.743645 
[232]	train-auc:0.905306	test-auc:0.743646 
[233]	train-auc:0.907618	test-auc:0.743486 
[234]	train-auc:0.908637	test-auc:0.743457 
[235]	train-auc:0.910381	test-auc:0.743649 
[236]	train-auc:0.910938	test-auc:0.743932 
[237]	train-auc:0.912214	test-auc:0.743819 
[238]	train-auc:0.913682	test-auc:0.743806 
[239]	train-auc:0.914947	test-auc:0.743891 
[240]	train-auc:0.916455	test-auc:0.744018 
[241]	train-auc:0.917897	test-auc:0.744041 
[242]	train-auc:0.919129	test-auc:0.743958 
[243]	train-auc:0.920015	test-auc:0.744030 
[244]	train-auc:0.920815	test-auc:0.744331 
[245]	train-auc:0.921571	test-auc:0.744403 
[246]	train-auc:0.922097	test-auc:0.744549 
[247]	train-auc:0.922940	test-auc:0.744650 
[248]	train-auc:0.923599	test-auc:0.744941 
[249]	train-auc:0.924576	test-auc:0.745346 
[250]	train-auc:0.925481	test-auc:0.745370 
[251]	train-auc:0.926082	test-auc:0.745525 
[252]	train-auc:0.927106	test-auc:0.745791 
[253]	train-auc:0.928138	test-auc:0.746224 
[254]	train-auc:0.928919	test-auc:0.746323 
[255]	train-auc:0.930049	test-auc:0.746292 
[256]	train-auc:0.931012	test-auc:0.746269 
[257]	train-auc:0.932010	test-auc:0.746426 
[258]	train-auc:0.932761	test-auc:0.746595 
[259]	train-auc:0.933316	test-auc:0.746614 
[260]	train-auc:0.934288	test-auc:0.746668 
[261]	train-auc:0.935578	test-auc:0.746661 
[262]	train-auc:0.936432	test-auc:0.746614 
[263]	train-auc:0.936888	test-auc:0.746787 
[264]	train-auc:0.937523	test-auc:0.746678 
[265]	train-auc:0.938206	test-auc:0.746763 
[266]	train-auc:0.938654	test-auc:0.746883 
[267]	train-auc:0.939452	test-auc:0.746918 
[268]	train-auc:0.940301	test-auc:0.747177 
[269]	train-auc:0.940918	test-auc:0.747171 
[270]	train-auc:0.941729	test-auc:0.747395 
[271]	train-auc:0.942350	test-auc:0.747438 
[272]	train-auc:0.943161	test-auc:0.747574 
[273]	train-auc:0.943636	test-auc:0.747569 
[274]	train-auc:0.944129	test-auc:0.747683 
[275]	train-auc:0.944654	test-auc:0.747627 
[276]	train-auc:0.945328	test-auc:0.747777 
[277]	train-auc:0.945897	test-auc:0.748054 
[278]	train-auc:0.946244	test-auc:0.748053 
[279]	train-auc:0.946600	test-auc:0.748027 
[280]	train-auc:0.946982	test-auc:0.748017 
[281]	train-auc:0.947270	test-auc:0.748093 
[282]	train-auc:0.948189	test-auc:0.747979 
[283]	train-auc:0.948546	test-auc:0.748146 
[284]	train-auc:0.948800	test-auc:0.748154 
[285]	train-auc:0.949007	test-auc:0.748278 
[286]	train-auc:0.949470	test-auc:0.748300 
[287]	train-auc:0.949647	test-auc:0.748173 
[288]	train-auc:0.949774	test-auc:0.748218 
[289]	train-auc:0.950209	test-auc:0.748444 
[290]	train-auc:0.950633	test-auc:0.748383 
[291]	train-auc:0.951390	test-auc:0.748505 
[292]	train-auc:0.951571	test-auc:0.748459 
[293]	train-auc:0.952163	test-auc:0.748197 
[294]	train-auc:0.952480	test-auc:0.748265 
[295]	train-auc:0.952573	test-auc:0.748268 
[296]	train-auc:0.952914	test-auc:0.748244 
[297]	train-auc:0.953198	test-auc:0.748238 
[298]	train-auc:0.953625	test-auc:0.748274 
[299]	train-auc:0.953893	test-auc:0.748316 
[300]	train-auc:0.954206	test-auc:0.748421 
[301]	train-auc:0.954287	test-auc:0.748325 
[302]	train-auc:0.954569	test-auc:0.748262 
[303]	train-auc:0.954592	test-auc:0.748263 
[304]	train-auc:0.954829	test-auc:0.748333 
[305]	train-auc:0.955076	test-auc:0.748360 
[306]	train-auc:0.955227	test-auc:0.748402 
[307]	train-auc:0.955434	test-auc:0.748280 
[308]	train-auc:0.955663	test-auc:0.748338 
[309]	train-auc:0.955822	test-auc:0.748594 
[310]	train-auc:0.955835	test-auc:0.748563 
[311]	train-auc:0.955843	test-auc:0.748553 
[312]	train-auc:0.956014	test-auc:0.748601 
[313]	train-auc:0.956320	test-auc:0.748462 
[314]	train-auc:0.956368	test-auc:0.748507 
[315]	train-auc:0.956366	test-auc:0.748402 
[316]	train-auc:0.956433	test-auc:0.748404 
[317]	train-auc:0.956798	test-auc:0.748390 
[318]	train-auc:0.957024	test-auc:0.748281 
[319]	train-auc:0.957021	test-auc:0.748224 
[320]	train-auc:0.957402	test-auc:0.748067 
[321]	train-auc:0.957420	test-auc:0.748021 
[322]	train-auc:0.957591	test-auc:0.748000 
[323]	train-auc:0.957961	test-auc:0.747965 
[324]	train-auc:0.958078	test-auc:0.748067 
[325]	train-auc:0.958268	test-auc:0.748238 
[326]	train-auc:0.958507	test-auc:0.748330 
[327]	train-auc:0.958635	test-auc:0.748407 
[328]	train-auc:0.958710	test-auc:0.748549 
[329]	train-auc:0.958880	test-auc:0.748720 
[330]	train-auc:0.959102	test-auc:0.748690 
[331]	train-auc:0.959350	test-auc:0.748603 
[332]	train-auc:0.959509	test-auc:0.748594 
[333]	train-auc:0.959775	test-auc:0.748675 
[334]	train-auc:0.959794	test-auc:0.748629 
[335]	train-auc:0.959916	test-auc:0.748658 
[336]	train-auc:0.959930	test-auc:0.748605 
[337]	train-auc:0.960176	test-auc:0.748591 
[338]	train-auc:0.960265	test-auc:0.748722 
[339]	train-auc:0.960502	test-auc:0.748637 
[340]	train-auc:0.960733	test-auc:0.748532 
[341]	train-auc:0.960832	test-auc:0.748507 
[342]	train-auc:0.960889	test-auc:0.748562 
[343]	train-auc:0.961014	test-auc:0.748542 
[344]	train-auc:0.961300	test-auc:0.748385 
[345]	train-auc:0.961493	test-auc:0.748315 
[346]	train-auc:0.961578	test-auc:0.748280 
[347]	train-auc:0.961611	test-auc:0.748232 
[348]	train-auc:0.961840	test-auc:0.748428 
[349]	train-auc:0.961987	test-auc:0.748456 
[350]	train-auc:0.962077	test-auc:0.748428 
[351]	train-auc:0.962162	test-auc:0.748398 
[352]	train-auc:0.962196	test-auc:0.748475 
[353]	train-auc:0.962287	test-auc:0.748429 
[354]	train-auc:0.962332	test-auc:0.748389 
[355]	train-auc:0.962493	test-auc:0.748385 
[356]	train-auc:0.962601	test-auc:0.748496 
[357]	train-auc:0.962685	test-auc:0.748513 
[358]	train-auc:0.962704	test-auc:0.748438 
[359]	train-auc:0.962826	test-auc:0.748614 
[360]	train-auc:0.963062	test-auc:0.748655 
[361]	train-auc:0.963099	test-auc:0.748651 
[362]	train-auc:0.963279	test-auc:0.748504 
[363]	train-auc:0.963682	test-auc:0.748454 
[364]	train-auc:0.963806	test-auc:0.748598 
[365]	train-auc:0.963858	test-auc:0.748706 
[366]	train-auc:0.963917	test-auc:0.748630 
[367]	train-auc:0.964000	test-auc:0.748630 
[368]	train-auc:0.964103	test-auc:0.748658 
[369]	train-auc:0.964150	test-auc:0.748554 
[370]	train-auc:0.964195	test-auc:0.748564 
[371]	train-auc:0.964356	test-auc:0.748557 
[372]	train-auc:0.964525	test-auc:0.748583 
[373]	train-auc:0.964760	test-auc:0.748705 
[374]	train-auc:0.964857	test-auc:0.748764 
[375]	train-auc:0.965227	test-auc:0.748579 
[376]	train-auc:0.965283	test-auc:0.748506 
[377]	train-auc:0.965348	test-auc:0.748408 
[378]	train-auc:0.965466	test-auc:0.748437 
[379]	train-auc:0.965686	test-auc:0.748295 
[380]	train-auc:0.965845	test-auc:0.748415 
[381]	train-auc:0.965914	test-auc:0.748389 
[382]	train-auc:0.965934	test-auc:0.748438 
[383]	train-auc:0.966051	test-auc:0.748486 
[384]	train-auc:0.966085	test-auc:0.748605 
[385]	train-auc:0.966144	test-auc:0.748655 
[386]	train-auc:0.966175	test-auc:0.748634 
[387]	train-auc:0.966225	test-auc:0.748618 
[388]	train-auc:0.966505	test-auc:0.748625 
[389]	train-auc:0.966546	test-auc:0.748608 
[390]	train-auc:0.966627	test-auc:0.748630 
[391]	train-auc:0.966663	test-auc:0.748539 
[392]	train-auc:0.966996	test-auc:0.748441 
[393]	train-auc:0.967075	test-auc:0.748469 
[394]	train-auc:0.967147	test-auc:0.748419 
[395]	train-auc:0.967520	test-auc:0.748268 
[396]	train-auc:0.967633	test-auc:0.748256 
[397]	train-auc:0.967972	test-auc:0.748058 
[398]	train-auc:0.968106	test-auc:0.747985 
[399]	train-auc:0.968140	test-auc:0.748007 
[400]	train-auc:0.968192	test-auc:0.748011 
[401]	train-auc:0.968333	test-auc:0.748039 
[402]	train-auc:0.968443	test-auc:0.748147 
[403]	train-auc:0.968446	test-auc:0.748104 
[404]	train-auc:0.968488	test-auc:0.748005 
[405]	train-auc:0.968530	test-auc:0.748031 
[406]	train-auc:0.968596	test-auc:0.747968 
[407]	train-auc:0.968677	test-auc:0.747902 
[408]	train-auc:0.968732	test-auc:0.747878 
[409]	train-auc:0.968790	test-auc:0.747868 
[410]	train-auc:0.968854	test-auc:0.747825 
[411]	train-auc:0.969040	test-auc:0.747766 
[412]	train-auc:0.969133	test-auc:0.747785 
[413]	train-auc:0.969186	test-auc:0.747735 
[414]	train-auc:0.969219	test-auc:0.747782 
[415]	train-auc:0.969416	test-auc:0.747631 
[416]	train-auc:0.969433	test-auc:0.747571 
[417]	train-auc:0.969471	test-auc:0.747572 
[418]	train-auc:0.969532	test-auc:0.747545 
[419]	train-auc:0.969663	test-auc:0.747517 
[420]	train-auc:0.969709	test-auc:0.747479 
[421]	train-auc:0.969754	test-auc:0.747517 
[422]	train-auc:0.969793	test-auc:0.747539 
[423]	train-auc:0.969824	test-auc:0.747593 
[424]	train-auc:0.969960	test-auc:0.747695 
Stopping. Best iteration:
[374]	train-auc:0.964857	test-auc:0.748764




Fold 5

[1]	train-auc:0.669454	test-auc:0.665727 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.668857	test-auc:0.665978 
[3]	train-auc:0.668862	test-auc:0.665977 
[4]	train-auc:0.669221	test-auc:0.666371 
[5]	train-auc:0.668867	test-auc:0.665977 
[6]	train-auc:0.670374	test-auc:0.667065 
[7]	train-auc:0.672446	test-auc:0.669431 
[8]	train-auc:0.674618	test-auc:0.671030 
[9]	train-auc:0.674947	test-auc:0.671402 
[10]	train-auc:0.674948	test-auc:0.671398 
[11]	train-auc:0.674961	test-auc:0.671414 
[12]	train-auc:0.674974	test-auc:0.671418 
[13]	train-auc:0.675181	test-auc:0.670822 
[14]	train-auc:0.675476	test-auc:0.671370 
[15]	train-auc:0.675478	test-auc:0.671352 
[16]	train-auc:0.675569	test-auc:0.671523 
[17]	train-auc:0.675861	test-auc:0.671500 
[18]	train-auc:0.675774	test-auc:0.671771 
[19]	train-auc:0.676755	test-auc:0.672470 
[20]	train-auc:0.676765	test-auc:0.672471 
[21]	train-auc:0.677186	test-auc:0.673463 
[22]	train-auc:0.677477	test-auc:0.673459 
[23]	train-auc:0.677632	test-auc:0.673456 
[24]	train-auc:0.677636	test-auc:0.673456 
[25]	train-auc:0.677638	test-auc:0.673456 
[26]	train-auc:0.677638	test-auc:0.673454 
[27]	train-auc:0.677743	test-auc:0.673448 
[28]	train-auc:0.677745	test-auc:0.673445 
[29]	train-auc:0.677748	test-auc:0.673448 
[30]	train-auc:0.677748	test-auc:0.673447 
[31]	train-auc:0.677748	test-auc:0.673448 
[32]	train-auc:0.677748	test-auc:0.673447 
[33]	train-auc:0.677749	test-auc:0.673445 
[34]	train-auc:0.677755	test-auc:0.673448 
[35]	train-auc:0.677756	test-auc:0.673447 
[36]	train-auc:0.677757	test-auc:0.673449 
[37]	train-auc:0.677759	test-auc:0.673451 
[38]	train-auc:0.690219	test-auc:0.684270 
[39]	train-auc:0.690220	test-auc:0.684268 
[40]	train-auc:0.690632	test-auc:0.684240 
[41]	train-auc:0.690952	test-auc:0.684225 
[42]	train-auc:0.690949	test-auc:0.684219 
[43]	train-auc:0.690956	test-auc:0.684224 
[44]	train-auc:0.690950	test-auc:0.684216 
[45]	train-auc:0.690951	test-auc:0.684213 
[46]	train-auc:0.691666	test-auc:0.684543 
[47]	train-auc:0.691657	test-auc:0.684541 
[48]	train-auc:0.691659	test-auc:0.684542 
[49]	train-auc:0.691658	test-auc:0.684540 
[50]	train-auc:0.691659	test-auc:0.684538 
[51]	train-auc:0.691676	test-auc:0.684547 
[52]	train-auc:0.691952	test-auc:0.684516 
[53]	train-auc:0.691954	test-auc:0.684516 
[54]	train-auc:0.692302	test-auc:0.684787 
[55]	train-auc:0.692268	test-auc:0.684707 
[56]	train-auc:0.693400	test-auc:0.686943 
[57]	train-auc:0.693396	test-auc:0.686924 
[58]	train-auc:0.693399	test-auc:0.686925 
[59]	train-auc:0.693398	test-auc:0.686920 
[60]	train-auc:0.694039	test-auc:0.687359 
[61]	train-auc:0.694113	test-auc:0.687279 
[62]	train-auc:0.694119	test-auc:0.687289 
[63]	train-auc:0.694111	test-auc:0.687272 
[64]	train-auc:0.705013	test-auc:0.698318 
[65]	train-auc:0.705170	test-auc:0.697829 
[66]	train-auc:0.705386	test-auc:0.697426 
[67]	train-auc:0.705367	test-auc:0.697401 
[68]	train-auc:0.705388	test-auc:0.697413 
[69]	train-auc:0.705396	test-auc:0.697411 
[70]	train-auc:0.705385	test-auc:0.697403 
[71]	train-auc:0.705412	test-auc:0.697441 
[72]	train-auc:0.705428	test-auc:0.697662 
[73]	train-auc:0.705417	test-auc:0.697645 
[74]	train-auc:0.705411	test-auc:0.698009 
[75]	train-auc:0.709427	test-auc:0.700962 
[76]	train-auc:0.709507	test-auc:0.700900 
[77]	train-auc:0.710663	test-auc:0.701508 
[78]	train-auc:0.711076	test-auc:0.701488 
[79]	train-auc:0.711256	test-auc:0.701474 
[80]	train-auc:0.711246	test-auc:0.701512 
[81]	train-auc:0.711372	test-auc:0.701507 
[82]	train-auc:0.712256	test-auc:0.702135 
[83]	train-auc:0.712493	test-auc:0.702096 
[84]	train-auc:0.712732	test-auc:0.702297 
[85]	train-auc:0.712930	test-auc:0.702277 
[86]	train-auc:0.713061	test-auc:0.702395 
[87]	train-auc:0.713069	test-auc:0.702399 
[88]	train-auc:0.714770	test-auc:0.704146 
[89]	train-auc:0.714765	test-auc:0.704130 
[90]	train-auc:0.714750	test-auc:0.704116 
[91]	train-auc:0.714748	test-auc:0.703926 
[92]	train-auc:0.714947	test-auc:0.703953 
[93]	train-auc:0.715112	test-auc:0.703947 
[94]	train-auc:0.717306	test-auc:0.703956 
[95]	train-auc:0.720508	test-auc:0.703803 
[96]	train-auc:0.722382	test-auc:0.705622 
[97]	train-auc:0.725001	test-auc:0.705871 
[98]	train-auc:0.728166	test-auc:0.708062 
[99]	train-auc:0.728576	test-auc:0.708273 
[100]	train-auc:0.728833	test-auc:0.708324 
[101]	train-auc:0.729285	test-auc:0.708430 
[102]	train-auc:0.729383	test-auc:0.708447 
[103]	train-auc:0.730691	test-auc:0.710015 
[104]	train-auc:0.731168	test-auc:0.710027 
[105]	train-auc:0.734721	test-auc:0.712931 
[106]	train-auc:0.735481	test-auc:0.713148 
[107]	train-auc:0.736180	test-auc:0.713122 
[108]	train-auc:0.737883	test-auc:0.714401 
[109]	train-auc:0.740119	test-auc:0.714694 
[110]	train-auc:0.740947	test-auc:0.715134 
[111]	train-auc:0.741564	test-auc:0.715118 
[112]	train-auc:0.744650	test-auc:0.715987 
[113]	train-auc:0.745829	test-auc:0.716318 
[114]	train-auc:0.747390	test-auc:0.717075 
[115]	train-auc:0.747840	test-auc:0.717214 
[116]	train-auc:0.747851	test-auc:0.717395 
[117]	train-auc:0.748461	test-auc:0.717599 
[118]	train-auc:0.749270	test-auc:0.718128 
[119]	train-auc:0.749907	test-auc:0.718548 
[120]	train-auc:0.750608	test-auc:0.718498 
[121]	train-auc:0.751151	test-auc:0.718602 
[122]	train-auc:0.751354	test-auc:0.718649 
[123]	train-auc:0.751448	test-auc:0.718440 
[124]	train-auc:0.752149	test-auc:0.718426 
[125]	train-auc:0.752580	test-auc:0.718459 
[126]	train-auc:0.753263	test-auc:0.718320 
[127]	train-auc:0.753972	test-auc:0.718394 
[128]	train-auc:0.754498	test-auc:0.718527 
[129]	train-auc:0.754686	test-auc:0.718769 
[130]	train-auc:0.754718	test-auc:0.718794 
[131]	train-auc:0.754841	test-auc:0.718733 
[132]	train-auc:0.755270	test-auc:0.718833 
[133]	train-auc:0.755494	test-auc:0.718730 
[134]	train-auc:0.755911	test-auc:0.719048 
[135]	train-auc:0.758299	test-auc:0.720189 
[136]	train-auc:0.759214	test-auc:0.720587 
[137]	train-auc:0.759286	test-auc:0.720398 
[138]	train-auc:0.759710	test-auc:0.720503 
[139]	train-auc:0.759860	test-auc:0.720653 
[140]	train-auc:0.760948	test-auc:0.721620 
[141]	train-auc:0.762728	test-auc:0.722122 
[142]	train-auc:0.763681	test-auc:0.722088 
[143]	train-auc:0.767018	test-auc:0.725815 
[144]	train-auc:0.767286	test-auc:0.725801 
[145]	train-auc:0.768709	test-auc:0.725900 
[146]	train-auc:0.770103	test-auc:0.726032 
[147]	train-auc:0.770959	test-auc:0.726376 
[148]	train-auc:0.772201	test-auc:0.726214 
[149]	train-auc:0.772837	test-auc:0.726617 
[150]	train-auc:0.777042	test-auc:0.728640 
[151]	train-auc:0.779054	test-auc:0.729288 
[152]	train-auc:0.780188	test-auc:0.729988 
[153]	train-auc:0.781361	test-auc:0.730550 
[154]	train-auc:0.782498	test-auc:0.731936 
[155]	train-auc:0.783263	test-auc:0.732428 
[156]	train-auc:0.784456	test-auc:0.732538 
[157]	train-auc:0.785394	test-auc:0.732798 
[158]	train-auc:0.786536	test-auc:0.733064 
[159]	train-auc:0.787344	test-auc:0.733181 
[160]	train-auc:0.788287	test-auc:0.733555 
[161]	train-auc:0.789396	test-auc:0.733770 
[162]	train-auc:0.789867	test-auc:0.733827 
[163]	train-auc:0.790796	test-auc:0.734134 
[164]	train-auc:0.791093	test-auc:0.733954 
[165]	train-auc:0.791871	test-auc:0.733886 
[166]	train-auc:0.793690	test-auc:0.733386 
[167]	train-auc:0.795358	test-auc:0.733804 
[168]	train-auc:0.796909	test-auc:0.733743 
[169]	train-auc:0.798353	test-auc:0.733643 
[170]	train-auc:0.800723	test-auc:0.733090 
[171]	train-auc:0.802116	test-auc:0.733251 
[172]	train-auc:0.803790	test-auc:0.733334 
[173]	train-auc:0.806077	test-auc:0.734037 
[174]	train-auc:0.808231	test-auc:0.733721 
[175]	train-auc:0.810437	test-auc:0.734076 
[176]	train-auc:0.812254	test-auc:0.734269 
[177]	train-auc:0.813865	test-auc:0.734252 
[178]	train-auc:0.815484	test-auc:0.735008 
[179]	train-auc:0.817286	test-auc:0.734787 
[180]	train-auc:0.818898	test-auc:0.735252 
[181]	train-auc:0.820972	test-auc:0.735734 
[182]	train-auc:0.824009	test-auc:0.736403 
[183]	train-auc:0.826273	test-auc:0.736353 
[184]	train-auc:0.829044	test-auc:0.737176 
[185]	train-auc:0.831370	test-auc:0.738094 
[186]	train-auc:0.832902	test-auc:0.738206 
[187]	train-auc:0.835017	test-auc:0.738565 
[188]	train-auc:0.836708	test-auc:0.738774 
[189]	train-auc:0.838977	test-auc:0.739414 
[190]	train-auc:0.840793	test-auc:0.739926 
[191]	train-auc:0.842496	test-auc:0.740393 
[192]	train-auc:0.844151	test-auc:0.740939 
[193]	train-auc:0.845300	test-auc:0.740850 
[194]	train-auc:0.847406	test-auc:0.741032 
[195]	train-auc:0.848476	test-auc:0.741229 
[196]	train-auc:0.849993	test-auc:0.741545 
[197]	train-auc:0.850897	test-auc:0.741905 
[198]	train-auc:0.852784	test-auc:0.742309 
[199]	train-auc:0.854150	test-auc:0.742495 
[200]	train-auc:0.855613	test-auc:0.742626 
[201]	train-auc:0.856783	test-auc:0.743069 
[202]	train-auc:0.857752	test-auc:0.743633 
[203]	train-auc:0.859136	test-auc:0.744251 
[204]	train-auc:0.860840	test-auc:0.744196 
[205]	train-auc:0.862002	test-auc:0.744457 
[206]	train-auc:0.863613	test-auc:0.744382 
[207]	train-auc:0.864935	test-auc:0.744034 
[208]	train-auc:0.866165	test-auc:0.744205 
[209]	train-auc:0.867678	test-auc:0.744186 
[210]	train-auc:0.869101	test-auc:0.744016 
[211]	train-auc:0.870690	test-auc:0.743845 
[212]	train-auc:0.871839	test-auc:0.743870 
[213]	train-auc:0.872973	test-auc:0.743959 
[214]	train-auc:0.874086	test-auc:0.743814 
[215]	train-auc:0.875109	test-auc:0.743834 
[216]	train-auc:0.876540	test-auc:0.743535 
[217]	train-auc:0.877809	test-auc:0.743787 
[218]	train-auc:0.879111	test-auc:0.744046 
[219]	train-auc:0.880209	test-auc:0.743881 
[220]	train-auc:0.881409	test-auc:0.744057 
[221]	train-auc:0.882799	test-auc:0.744692 
[222]	train-auc:0.883989	test-auc:0.744594 
[223]	train-auc:0.885444	test-auc:0.744689 
[224]	train-auc:0.886903	test-auc:0.744772 
[225]	train-auc:0.888190	test-auc:0.744942 
[226]	train-auc:0.889740	test-auc:0.744704 
[227]	train-auc:0.890793	test-auc:0.744720 
[228]	train-auc:0.892867	test-auc:0.744974 
[229]	train-auc:0.894183	test-auc:0.745027 
[230]	train-auc:0.896044	test-auc:0.744937 
[231]	train-auc:0.897270	test-auc:0.744923 
[232]	train-auc:0.898613	test-auc:0.745268 
[233]	train-auc:0.900690	test-auc:0.745509 
[234]	train-auc:0.902526	test-auc:0.745538 
[235]	train-auc:0.903842	test-auc:0.745633 
[236]	train-auc:0.905399	test-auc:0.745653 
[237]	train-auc:0.906455	test-auc:0.745757 
[238]	train-auc:0.907855	test-auc:0.746286 
[239]	train-auc:0.909587	test-auc:0.746552 
[240]	train-auc:0.910755	test-auc:0.746377 
[241]	train-auc:0.911593	test-auc:0.746180 
[242]	train-auc:0.912621	test-auc:0.745993 
[243]	train-auc:0.913581	test-auc:0.745936 
[244]	train-auc:0.914191	test-auc:0.745782 
[245]	train-auc:0.915026	test-auc:0.745722 
[246]	train-auc:0.916006	test-auc:0.745962 
[247]	train-auc:0.917363	test-auc:0.746152 
[248]	train-auc:0.918381	test-auc:0.746321 
[249]	train-auc:0.919086	test-auc:0.746549 
[250]	train-auc:0.920921	test-auc:0.746795 
[251]	train-auc:0.921496	test-auc:0.746884 
[252]	train-auc:0.922020	test-auc:0.746785 
[253]	train-auc:0.922444	test-auc:0.746975 
[254]	train-auc:0.923253	test-auc:0.746876 
[255]	train-auc:0.924546	test-auc:0.747019 
[256]	train-auc:0.925639	test-auc:0.747239 
[257]	train-auc:0.926655	test-auc:0.747004 
[258]	train-auc:0.927174	test-auc:0.746946 
[259]	train-auc:0.927758	test-auc:0.746824 
[260]	train-auc:0.928430	test-auc:0.746869 
[261]	train-auc:0.928774	test-auc:0.746801 
[262]	train-auc:0.928926	test-auc:0.746769 
[263]	train-auc:0.929714	test-auc:0.746662 
[264]	train-auc:0.930205	test-auc:0.746663 
[265]	train-auc:0.930382	test-auc:0.746543 
[266]	train-auc:0.931004	test-auc:0.746512 
[267]	train-auc:0.931626	test-auc:0.746513 
[268]	train-auc:0.932093	test-auc:0.746515 
[269]	train-auc:0.932747	test-auc:0.746419 
[270]	train-auc:0.933360	test-auc:0.746362 
[271]	train-auc:0.933920	test-auc:0.746323 
[272]	train-auc:0.934188	test-auc:0.746230 
[273]	train-auc:0.934775	test-auc:0.746155 
[274]	train-auc:0.934815	test-auc:0.746189 
[275]	train-auc:0.935310	test-auc:0.746128 
[276]	train-auc:0.935977	test-auc:0.746325 
[277]	train-auc:0.936443	test-auc:0.746309 
[278]	train-auc:0.936875	test-auc:0.746308 
[279]	train-auc:0.937421	test-auc:0.746337 
[280]	train-auc:0.938480	test-auc:0.746261 
[281]	train-auc:0.938797	test-auc:0.746220 
[282]	train-auc:0.939165	test-auc:0.746215 
[283]	train-auc:0.939899	test-auc:0.746189 
[284]	train-auc:0.940146	test-auc:0.746175 
[285]	train-auc:0.940393	test-auc:0.746184 
[286]	train-auc:0.940768	test-auc:0.746064 
[287]	train-auc:0.940870	test-auc:0.746084 
[288]	train-auc:0.941121	test-auc:0.746056 
[289]	train-auc:0.941550	test-auc:0.746216 
[290]	train-auc:0.941593	test-auc:0.746169 
[291]	train-auc:0.942240	test-auc:0.746138 
[292]	train-auc:0.942351	test-auc:0.746114 
[293]	train-auc:0.942803	test-auc:0.746294 
[294]	train-auc:0.943251	test-auc:0.746283 
[295]	train-auc:0.944044	test-auc:0.746385 
[296]	train-auc:0.944632	test-auc:0.746277 
[297]	train-auc:0.944940	test-auc:0.746307 
[298]	train-auc:0.945647	test-auc:0.746428 
[299]	train-auc:0.945786	test-auc:0.746609 
[300]	train-auc:0.945863	test-auc:0.746584 
[301]	train-auc:0.946148	test-auc:0.746707 
[302]	train-auc:0.946221	test-auc:0.746694 
[303]	train-auc:0.946814	test-auc:0.746655 
[304]	train-auc:0.946999	test-auc:0.746789 
[305]	train-auc:0.947003	test-auc:0.746766 
[306]	train-auc:0.947257	test-auc:0.746797 
Stopping. Best iteration:
[256]	train-auc:0.925639	test-auc:0.747239

