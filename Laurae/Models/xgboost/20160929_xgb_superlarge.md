```r
> #xgb.opt.depth(initial = 11, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)
> 
> Laurae.xgb.opt.depth.best <- 11
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
+   sink(file = "Laurae/20160929_xgb_superlarge/logs.txt", append = TRUE, split = FALSE)
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
+   write.csv(predictions1, file = "Laurae/20160929_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20160929_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20160929_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Average of validation predictions:  0.005736802
Average of test predictions:  0.005726347
Average of rolling test predictions:  0.02863174
Fold 1: MCC=0.2905034

Average of validation predictions:  0.005488478
Average of test predictions:  0.005556501
Average of rolling test predictions:  0.02820712
Fold 2: MCC=0.270387

Average of validation predictions:  0.005984531
Average of test predictions:  0.005989999
Average of rolling test predictions:  0.02878808
Fold 3: MCC=0.2756896

Average of validation predictions:  0.005581005
Average of test predictions:  0.005575172
Average of rolling test predictions:  0.02856002
Fold 4: MCC=0.2702875

Average of validation predictions:  0.005646931
Average of test predictions:  0.005655699
Average of rolling test predictions:  0.02850372
Fold 5: MCC=0.2713472
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20160929_xgb_superlarge/predictions_test_mean.csv", row.names = FALSE)
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
Fold 1: MCC=0.2905034 | rolling average: 0.2905034
Fold 2: MCC=0.270387 | rolling average: 0.2804452
Fold 3: MCC=0.2756896 | rolling average: 0.27886
Fold 4: MCC=0.2702875 | rolling average: 0.2767169
Fold 5: MCC=0.2713472 | rolling average: 0.2756429
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.2756429 + 0.008596407
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1064796 | rolling average: 0.1064796
Fold 2: threshold=0.1152651 | rolling average: 0.1108724
Fold 3: threshold=0.2142978 | rolling average: 0.1453475
Fold 4: threshold=0.2158443 | rolling average: 0.1629717
Fold 5: threshold=0.1231693 | rolling average: 0.1550112
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 >= best_mcc)
> print(sum(submission1$Response == 1))
[1] 2792
> write.csv(submission1, file = "Laurae/20160929_xgb_superlarge/submission1.csv", row.names = FALSE)
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
Fold 1: threshold=0.1064796 | rolling average: 0.002863785
Fold 2: threshold=0.1152651 | rolling average: 0.002874767
Fold 3: threshold=0.2142978 | rolling average: 0.00252841
Fold 4: threshold=0.2158443 | rolling average: 0.002347206
Fold 5: threshold=0.1231693 | rolling average: 0.002416224
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 1590
> write.csv(submission2, file = "Laurae/20160929_xgb_superlarge/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2219
> write.csv(submission2, file = "Laurae/20160929_xgb_superlarge/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2786
> write.csv(submission2, file = "Laurae/20160929_xgb_superlarge/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 3406
> write.csv(submission2, file = "Laurae/20160929_xgb_superlarge/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 4300
> write.csv(submission2, file = "Laurae/20160929_xgb_superlarge/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 4300
> write.csv(submission3, file = "Laurae/20160929_xgb_superlarge/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2792
> write.csv(submission4, file = "Laurae/20160929_xgb_superlarge/submission4.csv", row.names = FALSE)






Fold 1

[1]	train-auc:0.656278	test-auc:0.656399 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.655766	test-auc:0.655393 
[3]	train-auc:0.655769	test-auc:0.655398 
[4]	train-auc:0.655770	test-auc:0.655396 
[5]	train-auc:0.655771	test-auc:0.655401 
[6]	train-auc:0.655772	test-auc:0.655406 
[7]	train-auc:0.655775	test-auc:0.655409 
[8]	train-auc:0.655777	test-auc:0.655409 
[9]	train-auc:0.656403	test-auc:0.656358 
[10]	train-auc:0.656619	test-auc:0.656569 
[11]	train-auc:0.657339	test-auc:0.657760 
[12]	train-auc:0.657441	test-auc:0.657757 
[13]	train-auc:0.657441	test-auc:0.657759 
[14]	train-auc:0.657442	test-auc:0.657758 
[15]	train-auc:0.658054	test-auc:0.658292 
[16]	train-auc:0.659133	test-auc:0.659280 
[17]	train-auc:0.659128	test-auc:0.659271 
[18]	train-auc:0.659133	test-auc:0.659275 
[19]	train-auc:0.659237	test-auc:0.659271 
[20]	train-auc:0.659235	test-auc:0.659270 
[21]	train-auc:0.659496	test-auc:0.659695 
[22]	train-auc:0.659498	test-auc:0.659696 
[23]	train-auc:0.659894	test-auc:0.660238 
[24]	train-auc:0.659895	test-auc:0.660239 
[25]	train-auc:0.659897	test-auc:0.660240 
[26]	train-auc:0.659896	test-auc:0.660233 
[27]	train-auc:0.660003	test-auc:0.660232 
[28]	train-auc:0.660099	test-auc:0.660207 
[29]	train-auc:0.660103	test-auc:0.660210 
[30]	train-auc:0.660614	test-auc:0.660182 
[31]	train-auc:0.678600	test-auc:0.676103 
[32]	train-auc:0.683191	test-auc:0.683092 
[33]	train-auc:0.683085	test-auc:0.682553 
[34]	train-auc:0.683155	test-auc:0.682725 
[35]	train-auc:0.683217	test-auc:0.682552 
[36]	train-auc:0.683219	test-auc:0.682548 
[37]	train-auc:0.683155	test-auc:0.682725 
[38]	train-auc:0.683155	test-auc:0.682717 
[39]	train-auc:0.683156	test-auc:0.682717 
[40]	train-auc:0.683256	test-auc:0.682717 
[41]	train-auc:0.683253	test-auc:0.682709 
[42]	train-auc:0.683278	test-auc:0.682729 
[43]	train-auc:0.683277	test-auc:0.682728 
[44]	train-auc:0.683589	test-auc:0.683270 
[45]	train-auc:0.683898	test-auc:0.683478 
[46]	train-auc:0.684095	test-auc:0.683479 
[47]	train-auc:0.684235	test-auc:0.683480 
[48]	train-auc:0.684235	test-auc:0.683477 
[49]	train-auc:0.684232	test-auc:0.683471 
[50]	train-auc:0.684639	test-auc:0.684385 
[51]	train-auc:0.684967	test-auc:0.684445 
[52]	train-auc:0.687371	test-auc:0.685630 
[53]	train-auc:0.687596	test-auc:0.685544 
[54]	train-auc:0.688691	test-auc:0.686330 
[55]	train-auc:0.688685	test-auc:0.686315 
[56]	train-auc:0.688684	test-auc:0.686318 
[57]	train-auc:0.691066	test-auc:0.688923 
[58]	train-auc:0.691616	test-auc:0.688904 
[59]	train-auc:0.691597	test-auc:0.689180 
[60]	train-auc:0.692345	test-auc:0.689703 
[61]	train-auc:0.692974	test-auc:0.690146 
[62]	train-auc:0.693818	test-auc:0.689705 
[63]	train-auc:0.694062	test-auc:0.689717 
[64]	train-auc:0.694152	test-auc:0.689717 
[65]	train-auc:0.694197	test-auc:0.689751 
[66]	train-auc:0.694447	test-auc:0.689725 
[67]	train-auc:0.698383	test-auc:0.693448 
[68]	train-auc:0.698382	test-auc:0.693413 
[69]	train-auc:0.698664	test-auc:0.693407 
[70]	train-auc:0.699566	test-auc:0.693800 
[71]	train-auc:0.699848	test-auc:0.693853 
[72]	train-auc:0.699927	test-auc:0.693830 
[73]	train-auc:0.700342	test-auc:0.693951 
[74]	train-auc:0.700465	test-auc:0.693973 
[75]	train-auc:0.700472	test-auc:0.693973 
[76]	train-auc:0.700705	test-auc:0.694139 
[77]	train-auc:0.701356	test-auc:0.694185 
[78]	train-auc:0.702600	test-auc:0.695306 
[79]	train-auc:0.704411	test-auc:0.695561 
[80]	train-auc:0.704435	test-auc:0.695631 
[81]	train-auc:0.705414	test-auc:0.696479 
[82]	train-auc:0.705408	test-auc:0.696559 
[83]	train-auc:0.705399	test-auc:0.696564 
[84]	train-auc:0.705580	test-auc:0.696725 
[85]	train-auc:0.705654	test-auc:0.696831 
[86]	train-auc:0.709460	test-auc:0.701219 
[87]	train-auc:0.709466	test-auc:0.701188 
[88]	train-auc:0.709650	test-auc:0.701135 
[89]	train-auc:0.710041	test-auc:0.701380 
[90]	train-auc:0.710237	test-auc:0.701670 
[91]	train-auc:0.710641	test-auc:0.701685 
[92]	train-auc:0.713579	test-auc:0.703715 
[93]	train-auc:0.714759	test-auc:0.703897 
[94]	train-auc:0.715332	test-auc:0.703721 
[95]	train-auc:0.717282	test-auc:0.705638 
[96]	train-auc:0.718225	test-auc:0.705947 
[97]	train-auc:0.719368	test-auc:0.707789 
[98]	train-auc:0.719747	test-auc:0.708193 
[99]	train-auc:0.721537	test-auc:0.708759 
[100]	train-auc:0.722236	test-auc:0.708860 
[101]	train-auc:0.722548	test-auc:0.709214 
[102]	train-auc:0.724945	test-auc:0.710575 
[103]	train-auc:0.725223	test-auc:0.710508 
[104]	train-auc:0.726486	test-auc:0.710793 
[105]	train-auc:0.727563	test-auc:0.711374 
[106]	train-auc:0.727805	test-auc:0.711552 
[107]	train-auc:0.728406	test-auc:0.711466 
[108]	train-auc:0.728753	test-auc:0.711250 
[109]	train-auc:0.730637	test-auc:0.713534 
[110]	train-auc:0.734457	test-auc:0.715923 
[111]	train-auc:0.735745	test-auc:0.717227 
[112]	train-auc:0.740696	test-auc:0.719847 
[113]	train-auc:0.741923	test-auc:0.720606 
[114]	train-auc:0.742934	test-auc:0.720623 
[115]	train-auc:0.743398	test-auc:0.720591 
[116]	train-auc:0.743886	test-auc:0.722538 
[117]	train-auc:0.745269	test-auc:0.723510 
[118]	train-auc:0.746208	test-auc:0.723962 
[119]	train-auc:0.747052	test-auc:0.724159 
[120]	train-auc:0.747673	test-auc:0.724606 
[121]	train-auc:0.748008	test-auc:0.724640 
[122]	train-auc:0.748383	test-auc:0.724468 
[123]	train-auc:0.749199	test-auc:0.725194 
[124]	train-auc:0.749757	test-auc:0.725371 
[125]	train-auc:0.750325	test-auc:0.725403 
[126]	train-auc:0.750925	test-auc:0.725711 
[127]	train-auc:0.752069	test-auc:0.726795 
[128]	train-auc:0.753097	test-auc:0.727162 
[129]	train-auc:0.753874	test-auc:0.727150 
[130]	train-auc:0.756414	test-auc:0.728570 
[131]	train-auc:0.757325	test-auc:0.728558 
[132]	train-auc:0.759401	test-auc:0.729492 
[133]	train-auc:0.760446	test-auc:0.730037 
[134]	train-auc:0.761851	test-auc:0.730552 
[135]	train-auc:0.762952	test-auc:0.730898 
[136]	train-auc:0.764900	test-auc:0.731076 
[137]	train-auc:0.765958	test-auc:0.731312 
[138]	train-auc:0.766866	test-auc:0.731526 
[139]	train-auc:0.769807	test-auc:0.732131 
[140]	train-auc:0.771720	test-auc:0.732880 
[141]	train-auc:0.773187	test-auc:0.733264 
[142]	train-auc:0.775479	test-auc:0.733801 
[143]	train-auc:0.778490	test-auc:0.735429 
[144]	train-auc:0.779756	test-auc:0.735805 
[145]	train-auc:0.780826	test-auc:0.735975 
[146]	train-auc:0.783830	test-auc:0.736035 
[147]	train-auc:0.785297	test-auc:0.736316 
[148]	train-auc:0.787947	test-auc:0.736999 
[149]	train-auc:0.788787	test-auc:0.737214 
[150]	train-auc:0.789829	test-auc:0.737253 
[151]	train-auc:0.791492	test-auc:0.737605 
[152]	train-auc:0.793923	test-auc:0.738546 
[153]	train-auc:0.794949	test-auc:0.738655 
[154]	train-auc:0.795807	test-auc:0.738683 
[155]	train-auc:0.798227	test-auc:0.739643 
[156]	train-auc:0.799742	test-auc:0.740741 
[157]	train-auc:0.801115	test-auc:0.741094 
[158]	train-auc:0.802711	test-auc:0.741573 
[159]	train-auc:0.804681	test-auc:0.742114 
[160]	train-auc:0.806450	test-auc:0.742648 
[161]	train-auc:0.808442	test-auc:0.742785 
[162]	train-auc:0.809770	test-auc:0.743162 
[163]	train-auc:0.811265	test-auc:0.743319 
[164]	train-auc:0.812300	test-auc:0.743587 
[165]	train-auc:0.813449	test-auc:0.743974 
[166]	train-auc:0.815233	test-auc:0.743925 
[167]	train-auc:0.817146	test-auc:0.744211 
[168]	train-auc:0.818212	test-auc:0.744303 
[169]	train-auc:0.821455	test-auc:0.744724 
[170]	train-auc:0.823786	test-auc:0.744860 
[171]	train-auc:0.825084	test-auc:0.745224 
[172]	train-auc:0.826924	test-auc:0.745417 
[173]	train-auc:0.828653	test-auc:0.745845 
[174]	train-auc:0.830814	test-auc:0.746078 
[175]	train-auc:0.832413	test-auc:0.746134 
[176]	train-auc:0.833917	test-auc:0.746159 
[177]	train-auc:0.835099	test-auc:0.746350 
[178]	train-auc:0.836738	test-auc:0.746786 
[179]	train-auc:0.838081	test-auc:0.747154 
[180]	train-auc:0.839632	test-auc:0.747525 
[181]	train-auc:0.840831	test-auc:0.747640 
[182]	train-auc:0.842149	test-auc:0.747662 
[183]	train-auc:0.844016	test-auc:0.747946 
[184]	train-auc:0.845424	test-auc:0.748587 
[185]	train-auc:0.847317	test-auc:0.748893 
[186]	train-auc:0.848918	test-auc:0.749140 
[187]	train-auc:0.849778	test-auc:0.749117 
[188]	train-auc:0.851584	test-auc:0.749580 
[189]	train-auc:0.853613	test-auc:0.750169 
[190]	train-auc:0.854440	test-auc:0.750383 
[191]	train-auc:0.855635	test-auc:0.750386 
[192]	train-auc:0.857478	test-auc:0.750426 
[193]	train-auc:0.859452	test-auc:0.750571 
[194]	train-auc:0.860064	test-auc:0.750515 
[195]	train-auc:0.861593	test-auc:0.750542 
[196]	train-auc:0.863324	test-auc:0.750579 
[197]	train-auc:0.865439	test-auc:0.750700 
[198]	train-auc:0.866783	test-auc:0.750616 
[199]	train-auc:0.868814	test-auc:0.750893 
[200]	train-auc:0.870634	test-auc:0.750861 
[201]	train-auc:0.872248	test-auc:0.751030 
[202]	train-auc:0.873905	test-auc:0.751082 
[203]	train-auc:0.875886	test-auc:0.751240 
[204]	train-auc:0.876739	test-auc:0.751239 
[205]	train-auc:0.878264	test-auc:0.751074 
[206]	train-auc:0.880286	test-auc:0.751187 
[207]	train-auc:0.881440	test-auc:0.751102 
[208]	train-auc:0.882853	test-auc:0.751692 
[209]	train-auc:0.884306	test-auc:0.751907 
[210]	train-auc:0.885265	test-auc:0.751784 
[211]	train-auc:0.887206	test-auc:0.752045 
[212]	train-auc:0.888485	test-auc:0.752262 
[213]	train-auc:0.889808	test-auc:0.752669 
[214]	train-auc:0.891617	test-auc:0.752600 
[215]	train-auc:0.892796	test-auc:0.752716 
[216]	train-auc:0.894173	test-auc:0.752736 
[217]	train-auc:0.895098	test-auc:0.752754 
[218]	train-auc:0.897291	test-auc:0.752592 
[219]	train-auc:0.898170	test-auc:0.752604 
[220]	train-auc:0.900159	test-auc:0.752545 
[221]	train-auc:0.901040	test-auc:0.752512 
[222]	train-auc:0.902811	test-auc:0.752268 
[223]	train-auc:0.903678	test-auc:0.752885 
[224]	train-auc:0.905106	test-auc:0.752776 
[225]	train-auc:0.906251	test-auc:0.752846 
[226]	train-auc:0.908077	test-auc:0.752779 
[227]	train-auc:0.908693	test-auc:0.753218 
[228]	train-auc:0.910363	test-auc:0.753406 
[229]	train-auc:0.913196	test-auc:0.753686 
[230]	train-auc:0.915314	test-auc:0.754083 
[231]	train-auc:0.917057	test-auc:0.753936 
[232]	train-auc:0.918183	test-auc:0.754314 
[233]	train-auc:0.919959	test-auc:0.754604 
[234]	train-auc:0.921587	test-auc:0.754397 
[235]	train-auc:0.922743	test-auc:0.754174 
[236]	train-auc:0.923910	test-auc:0.754607 
[237]	train-auc:0.925042	test-auc:0.754634 
[238]	train-auc:0.926310	test-auc:0.754430 
[239]	train-auc:0.927470	test-auc:0.754486 
[240]	train-auc:0.928354	test-auc:0.754406 
[241]	train-auc:0.929187	test-auc:0.754224 
[242]	train-auc:0.930124	test-auc:0.754369 
[243]	train-auc:0.930887	test-auc:0.754137 
[244]	train-auc:0.931639	test-auc:0.754321 
[245]	train-auc:0.932240	test-auc:0.754360 
[246]	train-auc:0.932809	test-auc:0.754184 
[247]	train-auc:0.933507	test-auc:0.754077 
[248]	train-auc:0.934322	test-auc:0.754105 
[249]	train-auc:0.934967	test-auc:0.754141 
[250]	train-auc:0.935444	test-auc:0.754104 
[251]	train-auc:0.935820	test-auc:0.754128 
[252]	train-auc:0.937119	test-auc:0.754106 
[253]	train-auc:0.938096	test-auc:0.754394 
[254]	train-auc:0.938500	test-auc:0.754511 
[255]	train-auc:0.939315	test-auc:0.754696 
[256]	train-auc:0.939834	test-auc:0.754640 
[257]	train-auc:0.940572	test-auc:0.754676 
[258]	train-auc:0.941052	test-auc:0.754934 
[259]	train-auc:0.941613	test-auc:0.754901 
[260]	train-auc:0.942150	test-auc:0.755248 
[261]	train-auc:0.942590	test-auc:0.755267 
[262]	train-auc:0.942947	test-auc:0.755453 
[263]	train-auc:0.943654	test-auc:0.755481 
[264]	train-auc:0.944223	test-auc:0.755513 
[265]	train-auc:0.944522	test-auc:0.755335 
[266]	train-auc:0.945136	test-auc:0.755414 
[267]	train-auc:0.945494	test-auc:0.755501 
[268]	train-auc:0.945926	test-auc:0.755451 
[269]	train-auc:0.946575	test-auc:0.755591 
[270]	train-auc:0.947306	test-auc:0.755484 
[271]	train-auc:0.947742	test-auc:0.755341 
[272]	train-auc:0.948091	test-auc:0.755475 
[273]	train-auc:0.948497	test-auc:0.755298 
[274]	train-auc:0.948999	test-auc:0.755264 
[275]	train-auc:0.949212	test-auc:0.755243 
[276]	train-auc:0.949910	test-auc:0.755624 
[277]	train-auc:0.950591	test-auc:0.755741 
[278]	train-auc:0.951088	test-auc:0.755769 
[279]	train-auc:0.951509	test-auc:0.755785 
[280]	train-auc:0.951870	test-auc:0.755856 
[281]	train-auc:0.952148	test-auc:0.755834 
[282]	train-auc:0.952486	test-auc:0.755822 
[283]	train-auc:0.952731	test-auc:0.755575 
[284]	train-auc:0.952869	test-auc:0.755615 
[285]	train-auc:0.953165	test-auc:0.755555 
[286]	train-auc:0.953248	test-auc:0.755681 
[287]	train-auc:0.953464	test-auc:0.755733 
[288]	train-auc:0.953655	test-auc:0.755590 
[289]	train-auc:0.953869	test-auc:0.755644 
[290]	train-auc:0.954229	test-auc:0.755726 
[291]	train-auc:0.954440	test-auc:0.755567 
[292]	train-auc:0.954606	test-auc:0.755485 
[293]	train-auc:0.954853	test-auc:0.755619 
[294]	train-auc:0.955213	test-auc:0.755794 
[295]	train-auc:0.955372	test-auc:0.755904 
[296]	train-auc:0.955470	test-auc:0.755707 
[297]	train-auc:0.955861	test-auc:0.755695 
[298]	train-auc:0.955993	test-auc:0.755713 
[299]	train-auc:0.956212	test-auc:0.755610 
[300]	train-auc:0.956560	test-auc:0.755530 
[301]	train-auc:0.956894	test-auc:0.755721 
[302]	train-auc:0.957033	test-auc:0.755719 
[303]	train-auc:0.957264	test-auc:0.755807 
[304]	train-auc:0.957593	test-auc:0.755928 
[305]	train-auc:0.957725	test-auc:0.755951 
[306]	train-auc:0.958141	test-auc:0.756069 
[307]	train-auc:0.958702	test-auc:0.756150 
[308]	train-auc:0.958807	test-auc:0.756168 
[309]	train-auc:0.959011	test-auc:0.756228 
[310]	train-auc:0.959148	test-auc:0.756270 
[311]	train-auc:0.959304	test-auc:0.756335 
[312]	train-auc:0.959550	test-auc:0.756263 
[313]	train-auc:0.959701	test-auc:0.756195 
[314]	train-auc:0.959795	test-auc:0.756169 
[315]	train-auc:0.960109	test-auc:0.756126 
[316]	train-auc:0.960327	test-auc:0.756110 
[317]	train-auc:0.960664	test-auc:0.756172 
[318]	train-auc:0.960760	test-auc:0.756186 
[319]	train-auc:0.960874	test-auc:0.756047 
[320]	train-auc:0.960948	test-auc:0.756140 
[321]	train-auc:0.961035	test-auc:0.756158 
[322]	train-auc:0.961170	test-auc:0.756201 
[323]	train-auc:0.961419	test-auc:0.756184 
[324]	train-auc:0.961476	test-auc:0.756138 
[325]	train-auc:0.961536	test-auc:0.756166 
[326]	train-auc:0.961619	test-auc:0.756114 
[327]	train-auc:0.961769	test-auc:0.756154 
[328]	train-auc:0.961989	test-auc:0.756190 
[329]	train-auc:0.962049	test-auc:0.756188 
[330]	train-auc:0.962187	test-auc:0.756166 
[331]	train-auc:0.962229	test-auc:0.756087 
[332]	train-auc:0.962311	test-auc:0.756089 
[333]	train-auc:0.962388	test-auc:0.756046 
[334]	train-auc:0.962540	test-auc:0.755858 
[335]	train-auc:0.962766	test-auc:0.755966 
[336]	train-auc:0.962888	test-auc:0.755889 
[337]	train-auc:0.963079	test-auc:0.755832 
[338]	train-auc:0.963095	test-auc:0.755819 
[339]	train-auc:0.963303	test-auc:0.755767 
[340]	train-auc:0.963362	test-auc:0.755740 
[341]	train-auc:0.963407	test-auc:0.755737 
[342]	train-auc:0.963682	test-auc:0.755735 
[343]	train-auc:0.963781	test-auc:0.755794 
[344]	train-auc:0.963851	test-auc:0.755785 
[345]	train-auc:0.963997	test-auc:0.755731 
[346]	train-auc:0.964163	test-auc:0.755521 
[347]	train-auc:0.964224	test-auc:0.755471 
[348]	train-auc:0.964247	test-auc:0.755490 
[349]	train-auc:0.964321	test-auc:0.755461 
[350]	train-auc:0.964438	test-auc:0.755495 
[351]	train-auc:0.964464	test-auc:0.755552 
[352]	train-auc:0.964612	test-auc:0.755650 
[353]	train-auc:0.964686	test-auc:0.755626 
[354]	train-auc:0.965085	test-auc:0.755708 
[355]	train-auc:0.965086	test-auc:0.755678 
[356]	train-auc:0.965184	test-auc:0.755715 
[357]	train-auc:0.965295	test-auc:0.755668 
[358]	train-auc:0.965380	test-auc:0.755687 
[359]	train-auc:0.965478	test-auc:0.755743 
[360]	train-auc:0.965573	test-auc:0.755732 
[361]	train-auc:0.965600	test-auc:0.755722 
Stopping. Best iteration:
[311]	train-auc:0.959304	test-auc:0.756335




Fold 2

[1]	train-auc:0.656659	test-auc:0.660168 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.656164	test-auc:0.659982 
[3]	train-auc:0.656166	test-auc:0.659987 
[4]	train-auc:0.656463	test-auc:0.660305 
[5]	train-auc:0.658097	test-auc:0.663384 
[6]	train-auc:0.658103	test-auc:0.663387 
[7]	train-auc:0.658106	test-auc:0.663387 
[8]	train-auc:0.658107	test-auc:0.663385 
[9]	train-auc:0.658062	test-auc:0.663408 
[10]	train-auc:0.658279	test-auc:0.663223 
[11]	train-auc:0.658280	test-auc:0.663224 
[12]	train-auc:0.658281	test-auc:0.663224 
[13]	train-auc:0.659034	test-auc:0.663895 
[14]	train-auc:0.660260	test-auc:0.664607 
[15]	train-auc:0.660260	test-auc:0.664608 
[16]	train-auc:0.660262	test-auc:0.664608 
[17]	train-auc:0.660268	test-auc:0.664614 
[18]	train-auc:0.660269	test-auc:0.664613 
[19]	train-auc:0.660270	test-auc:0.664612 
[20]	train-auc:0.660327	test-auc:0.664600 
[21]	train-auc:0.660329	test-auc:0.664602 
[22]	train-auc:0.660336	test-auc:0.664616 
[23]	train-auc:0.660439	test-auc:0.664609 
[24]	train-auc:0.660415	test-auc:0.664548 
[25]	train-auc:0.660413	test-auc:0.664547 
[26]	train-auc:0.660413	test-auc:0.664545 
[27]	train-auc:0.672516	test-auc:0.679175 
[28]	train-auc:0.673185	test-auc:0.679487 
[29]	train-auc:0.673539	test-auc:0.679991 
[30]	train-auc:0.673542	test-auc:0.679993 
[31]	train-auc:0.673549	test-auc:0.679998 
[32]	train-auc:0.673554	test-auc:0.679994 
[33]	train-auc:0.673555	test-auc:0.679994 
[34]	train-auc:0.674111	test-auc:0.681140 
[35]	train-auc:0.676046	test-auc:0.681448 
[36]	train-auc:0.676041	test-auc:0.681875 
[37]	train-auc:0.676042	test-auc:0.681877 
[38]	train-auc:0.676046	test-auc:0.681879 
[39]	train-auc:0.683952	test-auc:0.689207 
[40]	train-auc:0.683964	test-auc:0.689188 
[41]	train-auc:0.684608	test-auc:0.690343 
[42]	train-auc:0.684595	test-auc:0.690365 
[43]	train-auc:0.684595	test-auc:0.690364 
[44]	train-auc:0.684671	test-auc:0.690400 
[45]	train-auc:0.684664	test-auc:0.690386 
[46]	train-auc:0.684317	test-auc:0.690001 
[47]	train-auc:0.684363	test-auc:0.689944 
[48]	train-auc:0.688913	test-auc:0.696123 
[49]	train-auc:0.689058	test-auc:0.696115 
[50]	train-auc:0.689595	test-auc:0.696717 
[51]	train-auc:0.690031	test-auc:0.696213 
[52]	train-auc:0.690573	test-auc:0.697250 
[53]	train-auc:0.690365	test-auc:0.697059 
[54]	train-auc:0.690430	test-auc:0.696880 
[55]	train-auc:0.691407	test-auc:0.697453 
[56]	train-auc:0.691483	test-auc:0.697440 
[57]	train-auc:0.692231	test-auc:0.698401 
[58]	train-auc:0.692392	test-auc:0.698438 
[59]	train-auc:0.692377	test-auc:0.698329 
[60]	train-auc:0.692770	test-auc:0.698448 
[61]	train-auc:0.692841	test-auc:0.698372 
[62]	train-auc:0.694566	test-auc:0.701056 
[63]	train-auc:0.694932	test-auc:0.700952 
[64]	train-auc:0.694939	test-auc:0.700910 
[65]	train-auc:0.695179	test-auc:0.700968 
[66]	train-auc:0.695373	test-auc:0.700946 
[67]	train-auc:0.695377	test-auc:0.700952 
[68]	train-auc:0.696985	test-auc:0.701249 
[69]	train-auc:0.696988	test-auc:0.701239 
[70]	train-auc:0.696989	test-auc:0.701230 
[71]	train-auc:0.697900	test-auc:0.702655 
[72]	train-auc:0.698179	test-auc:0.702561 
[73]	train-auc:0.698545	test-auc:0.702583 
[74]	train-auc:0.698540	test-auc:0.702555 
[75]	train-auc:0.698987	test-auc:0.702531 
[76]	train-auc:0.699123	test-auc:0.702528 
[77]	train-auc:0.699250	test-auc:0.702536 
[78]	train-auc:0.701339	test-auc:0.704078 
[79]	train-auc:0.701409	test-auc:0.704079 
[80]	train-auc:0.705884	test-auc:0.707875 
[81]	train-auc:0.706273	test-auc:0.708071 
[82]	train-auc:0.706532	test-auc:0.708164 
[83]	train-auc:0.707247	test-auc:0.708545 
[84]	train-auc:0.707297	test-auc:0.708579 
[85]	train-auc:0.708119	test-auc:0.708694 
[86]	train-auc:0.710716	test-auc:0.709695 
[87]	train-auc:0.711412	test-auc:0.709372 
[88]	train-auc:0.712342	test-auc:0.709697 
[89]	train-auc:0.712065	test-auc:0.709490 
[90]	train-auc:0.715238	test-auc:0.711702 
[91]	train-auc:0.715535	test-auc:0.711896 
[92]	train-auc:0.715644	test-auc:0.711631 
[93]	train-auc:0.715780	test-auc:0.711667 
[94]	train-auc:0.716124	test-auc:0.711662 
[95]	train-auc:0.716913	test-auc:0.712023 
[96]	train-auc:0.717871	test-auc:0.712630 
[97]	train-auc:0.718085	test-auc:0.712606 
[98]	train-auc:0.720185	test-auc:0.713348 
[99]	train-auc:0.721561	test-auc:0.713639 
[100]	train-auc:0.722169	test-auc:0.713223 
[101]	train-auc:0.722510	test-auc:0.713691 
[102]	train-auc:0.722793	test-auc:0.713804 
[103]	train-auc:0.723598	test-auc:0.713566 
[104]	train-auc:0.724394	test-auc:0.713829 
[105]	train-auc:0.724599	test-auc:0.714178 
[106]	train-auc:0.725933	test-auc:0.714536 
[107]	train-auc:0.726497	test-auc:0.715160 
[108]	train-auc:0.727152	test-auc:0.714616 
[109]	train-auc:0.728896	test-auc:0.715215 
[110]	train-auc:0.729216	test-auc:0.715366 
[111]	train-auc:0.729479	test-auc:0.715697 
[112]	train-auc:0.733334	test-auc:0.715990 
[113]	train-auc:0.735565	test-auc:0.716424 
[114]	train-auc:0.737330	test-auc:0.716894 
[115]	train-auc:0.738318	test-auc:0.716781 
[116]	train-auc:0.740260	test-auc:0.716284 
[117]	train-auc:0.743195	test-auc:0.717787 
[118]	train-auc:0.745038	test-auc:0.718436 
[119]	train-auc:0.745819	test-auc:0.718420 
[120]	train-auc:0.746311	test-auc:0.718391 
[121]	train-auc:0.746800	test-auc:0.718667 
[122]	train-auc:0.747858	test-auc:0.718737 
[123]	train-auc:0.748511	test-auc:0.719033 
[124]	train-auc:0.749642	test-auc:0.719098 
[125]	train-auc:0.750822	test-auc:0.719433 
[126]	train-auc:0.752020	test-auc:0.720144 
[127]	train-auc:0.752933	test-auc:0.719924 
[128]	train-auc:0.753372	test-auc:0.720100 
[129]	train-auc:0.754835	test-auc:0.719927 
[130]	train-auc:0.755481	test-auc:0.720207 
[131]	train-auc:0.756823	test-auc:0.720732 
[132]	train-auc:0.757862	test-auc:0.721241 
[133]	train-auc:0.758749	test-auc:0.721067 
[134]	train-auc:0.760658	test-auc:0.721955 
[135]	train-auc:0.762336	test-auc:0.722449 
[136]	train-auc:0.763808	test-auc:0.723095 
[137]	train-auc:0.766413	test-auc:0.723430 
[138]	train-auc:0.767942	test-auc:0.723292 
[139]	train-auc:0.770191	test-auc:0.724570 
[140]	train-auc:0.771667	test-auc:0.724989 
[141]	train-auc:0.773336	test-auc:0.725696 
[142]	train-auc:0.774102	test-auc:0.726330 
[143]	train-auc:0.775310	test-auc:0.726861 
[144]	train-auc:0.776217	test-auc:0.727290 
[145]	train-auc:0.779285	test-auc:0.728338 
[146]	train-auc:0.781137	test-auc:0.728891 
[147]	train-auc:0.783439	test-auc:0.729894 
[148]	train-auc:0.785193	test-auc:0.730064 
[149]	train-auc:0.786674	test-auc:0.730504 
[150]	train-auc:0.789413	test-auc:0.731477 
[151]	train-auc:0.791053	test-auc:0.731698 
[152]	train-auc:0.792465	test-auc:0.732344 
[153]	train-auc:0.794803	test-auc:0.732527 
[154]	train-auc:0.796113	test-auc:0.732799 
[155]	train-auc:0.797781	test-auc:0.732974 
[156]	train-auc:0.799290	test-auc:0.733588 
[157]	train-auc:0.801062	test-auc:0.733519 
[158]	train-auc:0.802931	test-auc:0.733976 
[159]	train-auc:0.804253	test-auc:0.734399 
[160]	train-auc:0.805705	test-auc:0.734534 
[161]	train-auc:0.807126	test-auc:0.734408 
[162]	train-auc:0.808079	test-auc:0.734482 
[163]	train-auc:0.809100	test-auc:0.734218 
[164]	train-auc:0.810176	test-auc:0.733972 
[165]	train-auc:0.811698	test-auc:0.733806 
[166]	train-auc:0.813140	test-auc:0.734366 
[167]	train-auc:0.815159	test-auc:0.734722 
[168]	train-auc:0.816592	test-auc:0.735049 
[169]	train-auc:0.817541	test-auc:0.735133 
[170]	train-auc:0.819139	test-auc:0.735658 
[171]	train-auc:0.820667	test-auc:0.736056 
[172]	train-auc:0.822401	test-auc:0.736252 
[173]	train-auc:0.823454	test-auc:0.736719 
[174]	train-auc:0.825921	test-auc:0.737509 
[175]	train-auc:0.827030	test-auc:0.737524 
[176]	train-auc:0.829551	test-auc:0.738124 
[177]	train-auc:0.831794	test-auc:0.738915 
[178]	train-auc:0.832855	test-auc:0.738972 
[179]	train-auc:0.835311	test-auc:0.739205 
[180]	train-auc:0.837467	test-auc:0.740203 
[181]	train-auc:0.839964	test-auc:0.741128 
[182]	train-auc:0.841938	test-auc:0.741070 
[183]	train-auc:0.843513	test-auc:0.741464 
[184]	train-auc:0.845306	test-auc:0.742197 
[185]	train-auc:0.846704	test-auc:0.742194 
[186]	train-auc:0.848625	test-auc:0.742814 
[187]	train-auc:0.850328	test-auc:0.743451 
[188]	train-auc:0.852107	test-auc:0.744047 
[189]	train-auc:0.853968	test-auc:0.744595 
[190]	train-auc:0.855215	test-auc:0.745037 
[191]	train-auc:0.856620	test-auc:0.745645 
[192]	train-auc:0.857857	test-auc:0.746075 
[193]	train-auc:0.858847	test-auc:0.746345 
[194]	train-auc:0.859813	test-auc:0.746212 
[195]	train-auc:0.860793	test-auc:0.746591 
[196]	train-auc:0.862120	test-auc:0.746617 
[197]	train-auc:0.863093	test-auc:0.746869 
[198]	train-auc:0.863903	test-auc:0.746999 
[199]	train-auc:0.865899	test-auc:0.747585 
[200]	train-auc:0.867440	test-auc:0.747830 
[201]	train-auc:0.869952	test-auc:0.748022 
[202]	train-auc:0.871984	test-auc:0.747935 
[203]	train-auc:0.873660	test-auc:0.748326 
[204]	train-auc:0.875411	test-auc:0.748398 
[205]	train-auc:0.876780	test-auc:0.748549 
[206]	train-auc:0.878431	test-auc:0.748873 
[207]	train-auc:0.880266	test-auc:0.749230 
[208]	train-auc:0.882058	test-auc:0.749668 
[209]	train-auc:0.883117	test-auc:0.749675 
[210]	train-auc:0.885142	test-auc:0.750267 
[211]	train-auc:0.886425	test-auc:0.750173 
[212]	train-auc:0.888127	test-auc:0.750857 
[213]	train-auc:0.889083	test-auc:0.751149 
[214]	train-auc:0.890446	test-auc:0.751781 
[215]	train-auc:0.892243	test-auc:0.752076 
[216]	train-auc:0.893528	test-auc:0.752350 
[217]	train-auc:0.894835	test-auc:0.752954 
[218]	train-auc:0.895881	test-auc:0.753172 
[219]	train-auc:0.897438	test-auc:0.753474 
[220]	train-auc:0.898862	test-auc:0.753828 
[221]	train-auc:0.900077	test-auc:0.754283 
[222]	train-auc:0.901595	test-auc:0.754191 
[223]	train-auc:0.902665	test-auc:0.754301 
[224]	train-auc:0.904153	test-auc:0.754613 
[225]	train-auc:0.905391	test-auc:0.754757 
[226]	train-auc:0.906339	test-auc:0.754882 
[227]	train-auc:0.906949	test-auc:0.754893 
[228]	train-auc:0.907894	test-auc:0.754831 
[229]	train-auc:0.908789	test-auc:0.755100 
[230]	train-auc:0.910102	test-auc:0.755203 
[231]	train-auc:0.911038	test-auc:0.755327 
[232]	train-auc:0.911852	test-auc:0.755385 
[233]	train-auc:0.913364	test-auc:0.755413 
[234]	train-auc:0.914803	test-auc:0.755884 
[235]	train-auc:0.916609	test-auc:0.756323 
[236]	train-auc:0.918400	test-auc:0.756346 
[237]	train-auc:0.919770	test-auc:0.756304 
[238]	train-auc:0.921415	test-auc:0.756497 
[239]	train-auc:0.922171	test-auc:0.756543 
[240]	train-auc:0.923535	test-auc:0.756964 
[241]	train-auc:0.924948	test-auc:0.756976 
[242]	train-auc:0.926122	test-auc:0.757211 
[243]	train-auc:0.927333	test-auc:0.757304 
[244]	train-auc:0.928953	test-auc:0.757328 
[245]	train-auc:0.929881	test-auc:0.757529 
[246]	train-auc:0.930870	test-auc:0.757568 
[247]	train-auc:0.932069	test-auc:0.757633 
[248]	train-auc:0.932824	test-auc:0.757570 
[249]	train-auc:0.933870	test-auc:0.757376 
[250]	train-auc:0.934952	test-auc:0.757359 
[251]	train-auc:0.936217	test-auc:0.757542 
[252]	train-auc:0.936776	test-auc:0.757464 
[253]	train-auc:0.938086	test-auc:0.757617 
[254]	train-auc:0.938705	test-auc:0.757440 
[255]	train-auc:0.939646	test-auc:0.757712 
[256]	train-auc:0.940317	test-auc:0.757681 
[257]	train-auc:0.941500	test-auc:0.757823 
[258]	train-auc:0.942025	test-auc:0.757622 
[259]	train-auc:0.942399	test-auc:0.758022 
[260]	train-auc:0.942815	test-auc:0.757978 
[261]	train-auc:0.943576	test-auc:0.758378 
[262]	train-auc:0.944110	test-auc:0.758545 
[263]	train-auc:0.945183	test-auc:0.758813 
[264]	train-auc:0.945808	test-auc:0.758890 
[265]	train-auc:0.947055	test-auc:0.759068 
[266]	train-auc:0.948183	test-auc:0.758960 
[267]	train-auc:0.948824	test-auc:0.759089 
[268]	train-auc:0.949310	test-auc:0.759235 
[269]	train-auc:0.949939	test-auc:0.759259 
[270]	train-auc:0.950816	test-auc:0.759461 
[271]	train-auc:0.951296	test-auc:0.759384 
[272]	train-auc:0.951683	test-auc:0.759407 
[273]	train-auc:0.951920	test-auc:0.759323 
[274]	train-auc:0.952579	test-auc:0.759187 
[275]	train-auc:0.953042	test-auc:0.759149 
[276]	train-auc:0.953239	test-auc:0.758995 
[277]	train-auc:0.953591	test-auc:0.759136 
[278]	train-auc:0.953978	test-auc:0.759025 
[279]	train-auc:0.954197	test-auc:0.759005 
[280]	train-auc:0.954340	test-auc:0.759092 
[281]	train-auc:0.954525	test-auc:0.759131 
[282]	train-auc:0.954911	test-auc:0.759235 
[283]	train-auc:0.955211	test-auc:0.759320 
[284]	train-auc:0.955471	test-auc:0.759362 
[285]	train-auc:0.955829	test-auc:0.759442 
[286]	train-auc:0.956087	test-auc:0.759463 
[287]	train-auc:0.956438	test-auc:0.759462 
[288]	train-auc:0.956531	test-auc:0.759453 
[289]	train-auc:0.956804	test-auc:0.759658 
[290]	train-auc:0.956964	test-auc:0.759610 
[291]	train-auc:0.957165	test-auc:0.759583 
[292]	train-auc:0.957354	test-auc:0.759508 
[293]	train-auc:0.957479	test-auc:0.759515 
[294]	train-auc:0.957707	test-auc:0.759522 
[295]	train-auc:0.957901	test-auc:0.759457 
[296]	train-auc:0.958026	test-auc:0.759507 
[297]	train-auc:0.958156	test-auc:0.759427 
[298]	train-auc:0.958496	test-auc:0.759466 
[299]	train-auc:0.958585	test-auc:0.759424 
[300]	train-auc:0.958872	test-auc:0.759432 
[301]	train-auc:0.959019	test-auc:0.759383 
[302]	train-auc:0.959162	test-auc:0.759407 
[303]	train-auc:0.959274	test-auc:0.759421 
[304]	train-auc:0.959548	test-auc:0.759309 
[305]	train-auc:0.959682	test-auc:0.759325 
[306]	train-auc:0.959770	test-auc:0.759403 
[307]	train-auc:0.959835	test-auc:0.759425 
[308]	train-auc:0.959897	test-auc:0.759394 
[309]	train-auc:0.960120	test-auc:0.759437 
[310]	train-auc:0.960223	test-auc:0.759341 
[311]	train-auc:0.960419	test-auc:0.759468 
[312]	train-auc:0.960683	test-auc:0.759601 
[313]	train-auc:0.960848	test-auc:0.759638 
[314]	train-auc:0.960972	test-auc:0.759511 
[315]	train-auc:0.961151	test-auc:0.759568 
[316]	train-auc:0.961355	test-auc:0.759533 
[317]	train-auc:0.961642	test-auc:0.759714 
[318]	train-auc:0.961725	test-auc:0.759685 
[319]	train-auc:0.961891	test-auc:0.759870 
[320]	train-auc:0.962062	test-auc:0.760064 
[321]	train-auc:0.962190	test-auc:0.760179 
[322]	train-auc:0.962549	test-auc:0.760407 
[323]	train-auc:0.962709	test-auc:0.760469 
[324]	train-auc:0.962783	test-auc:0.760500 
[325]	train-auc:0.962859	test-auc:0.760550 
[326]	train-auc:0.963078	test-auc:0.760496 
[327]	train-auc:0.963150	test-auc:0.760444 
[328]	train-auc:0.963196	test-auc:0.760410 
[329]	train-auc:0.963255	test-auc:0.760373 
[330]	train-auc:0.963406	test-auc:0.760446 
[331]	train-auc:0.963540	test-auc:0.760472 
[332]	train-auc:0.964119	test-auc:0.760741 
[333]	train-auc:0.964294	test-auc:0.760825 
[334]	train-auc:0.964348	test-auc:0.760812 
[335]	train-auc:0.964561	test-auc:0.760932 
[336]	train-auc:0.965070	test-auc:0.761108 
[337]	train-auc:0.965171	test-auc:0.761197 
[338]	train-auc:0.965255	test-auc:0.761172 
[339]	train-auc:0.965524	test-auc:0.761252 
[340]	train-auc:0.965708	test-auc:0.761303 
[341]	train-auc:0.965880	test-auc:0.761442 
[342]	train-auc:0.965902	test-auc:0.761453 
[343]	train-auc:0.966023	test-auc:0.761519 
[344]	train-auc:0.966057	test-auc:0.761491 
[345]	train-auc:0.966201	test-auc:0.761518 
[346]	train-auc:0.966276	test-auc:0.761569 
[347]	train-auc:0.966374	test-auc:0.761538 
[348]	train-auc:0.966478	test-auc:0.761421 
[349]	train-auc:0.966520	test-auc:0.761451 
[350]	train-auc:0.966650	test-auc:0.761574 
[351]	train-auc:0.966793	test-auc:0.761741 
[352]	train-auc:0.966833	test-auc:0.761744 
[353]	train-auc:0.966909	test-auc:0.761770 
[354]	train-auc:0.967088	test-auc:0.761746 
[355]	train-auc:0.967177	test-auc:0.761673 
[356]	train-auc:0.967248	test-auc:0.761649 
[357]	train-auc:0.967324	test-auc:0.761823 
[358]	train-auc:0.967383	test-auc:0.761917 
[359]	train-auc:0.967457	test-auc:0.761896 
[360]	train-auc:0.967533	test-auc:0.761927 
[361]	train-auc:0.967642	test-auc:0.761907 
[362]	train-auc:0.967665	test-auc:0.761991 
[363]	train-auc:0.967789	test-auc:0.762079 
[364]	train-auc:0.967879	test-auc:0.762121 
[365]	train-auc:0.968118	test-auc:0.762043 
[366]	train-auc:0.968233	test-auc:0.762044 
[367]	train-auc:0.968297	test-auc:0.762096 
[368]	train-auc:0.968376	test-auc:0.762114 
[369]	train-auc:0.968430	test-auc:0.762097 
[370]	train-auc:0.968550	test-auc:0.762107 
[371]	train-auc:0.968622	test-auc:0.762125 
[372]	train-auc:0.968672	test-auc:0.762131 
[373]	train-auc:0.968752	test-auc:0.762047 
[374]	train-auc:0.968767	test-auc:0.762041 
[375]	train-auc:0.968975	test-auc:0.762025 
[376]	train-auc:0.969020	test-auc:0.762075 
[377]	train-auc:0.969080	test-auc:0.762071 
[378]	train-auc:0.969155	test-auc:0.762074 
[379]	train-auc:0.969317	test-auc:0.762012 
[380]	train-auc:0.969430	test-auc:0.761998 
[381]	train-auc:0.969620	test-auc:0.761926 
[382]	train-auc:0.969886	test-auc:0.762058 
[383]	train-auc:0.970096	test-auc:0.762120 
[384]	train-auc:0.970204	test-auc:0.762150 
[385]	train-auc:0.970562	test-auc:0.761929 
[386]	train-auc:0.970605	test-auc:0.761863 
[387]	train-auc:0.970637	test-auc:0.761874 
[388]	train-auc:0.970710	test-auc:0.761831 
[389]	train-auc:0.970846	test-auc:0.761747 
[390]	train-auc:0.970898	test-auc:0.761822 
[391]	train-auc:0.971064	test-auc:0.761721 
[392]	train-auc:0.971092	test-auc:0.761654 
[393]	train-auc:0.971248	test-auc:0.761611 
[394]	train-auc:0.971341	test-auc:0.761625 
[395]	train-auc:0.971396	test-auc:0.761542 
[396]	train-auc:0.971459	test-auc:0.761541 
[397]	train-auc:0.971582	test-auc:0.761438 
[398]	train-auc:0.971622	test-auc:0.761450 
[399]	train-auc:0.971692	test-auc:0.761476 
[400]	train-auc:0.971733	test-auc:0.761525 
[401]	train-auc:0.971842	test-auc:0.761498 
[402]	train-auc:0.971906	test-auc:0.761497 
[403]	train-auc:0.971990	test-auc:0.761522 
[404]	train-auc:0.972053	test-auc:0.761536 
[405]	train-auc:0.972114	test-auc:0.761549 
[406]	train-auc:0.972174	test-auc:0.761602 
[407]	train-auc:0.972210	test-auc:0.761539 
[408]	train-auc:0.972380	test-auc:0.761569 
[409]	train-auc:0.972515	test-auc:0.761543 
[410]	train-auc:0.972531	test-auc:0.761515 
[411]	train-auc:0.972759	test-auc:0.761444 
[412]	train-auc:0.972829	test-auc:0.761526 
[413]	train-auc:0.972860	test-auc:0.761546 
[414]	train-auc:0.972972	test-auc:0.761728 
[415]	train-auc:0.973030	test-auc:0.761676 
[416]	train-auc:0.973035	test-auc:0.761693 
[417]	train-auc:0.973053	test-auc:0.761675 
[418]	train-auc:0.973074	test-auc:0.761662 
[419]	train-auc:0.973127	test-auc:0.761595 
[420]	train-auc:0.973257	test-auc:0.761503 
[421]	train-auc:0.973265	test-auc:0.761487 
[422]	train-auc:0.973365	test-auc:0.761451 
[423]	train-auc:0.973410	test-auc:0.761427 
[424]	train-auc:0.973458	test-auc:0.761385 
[425]	train-auc:0.973468	test-auc:0.761381 
[426]	train-auc:0.973508	test-auc:0.761433 
[427]	train-auc:0.973523	test-auc:0.761485 
[428]	train-auc:0.973561	test-auc:0.761503 
[429]	train-auc:0.973612	test-auc:0.761507 
[430]	train-auc:0.973687	test-auc:0.761506 
[431]	train-auc:0.973738	test-auc:0.761491 
[432]	train-auc:0.973779	test-auc:0.761488 
[433]	train-auc:0.973782	test-auc:0.761531 
[434]	train-auc:0.973887	test-auc:0.761627 
Stopping. Best iteration:
[384]	train-auc:0.970204	test-auc:0.762150




Fold 3

[1]	train-auc:0.658217	test-auc:0.659775 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.660924	test-auc:0.661251 
[3]	train-auc:0.660974	test-auc:0.661270 
[4]	train-auc:0.660974	test-auc:0.661281 
[5]	train-auc:0.660977	test-auc:0.661279 
[6]	train-auc:0.660978	test-auc:0.661277 
[7]	train-auc:0.660970	test-auc:0.661266 
[8]	train-auc:0.661460	test-auc:0.661844 
[9]	train-auc:0.661461	test-auc:0.661844 
[10]	train-auc:0.661461	test-auc:0.661845 
[11]	train-auc:0.661384	test-auc:0.661629 
[12]	train-auc:0.661385	test-auc:0.661629 
[13]	train-auc:0.661386	test-auc:0.661632 
[14]	train-auc:0.661387	test-auc:0.661631 
[15]	train-auc:0.661389	test-auc:0.661619 
[16]	train-auc:0.661387	test-auc:0.661614 
[17]	train-auc:0.661387	test-auc:0.661614 
[18]	train-auc:0.661580	test-auc:0.661409 
[19]	train-auc:0.661436	test-auc:0.661522 
[20]	train-auc:0.661598	test-auc:0.660398 
[21]	train-auc:0.661598	test-auc:0.660380 
[22]	train-auc:0.661601	test-auc:0.660376 
[23]	train-auc:0.661899	test-auc:0.660369 
[24]	train-auc:0.662030	test-auc:0.660363 
[25]	train-auc:0.661996	test-auc:0.660300 
[26]	train-auc:0.661997	test-auc:0.660295 
[27]	train-auc:0.662104	test-auc:0.660290 
[28]	train-auc:0.662106	test-auc:0.660290 
[29]	train-auc:0.662108	test-auc:0.660290 
[30]	train-auc:0.662110	test-auc:0.660290 
[31]	train-auc:0.676079	test-auc:0.670727 
[32]	train-auc:0.676081	test-auc:0.670728 
[33]	train-auc:0.676082	test-auc:0.670728 
[34]	train-auc:0.676605	test-auc:0.670708 
[35]	train-auc:0.676606	test-auc:0.670703 
[36]	train-auc:0.676609	test-auc:0.670709 
[37]	train-auc:0.676605	test-auc:0.670720 
[38]	train-auc:0.676605	test-auc:0.670720 
[39]	train-auc:0.676604	test-auc:0.670711 
[40]	train-auc:0.676834	test-auc:0.670478 
[41]	train-auc:0.676834	test-auc:0.670474 
[42]	train-auc:0.676814	test-auc:0.670457 
[43]	train-auc:0.676814	test-auc:0.670457 
[44]	train-auc:0.676816	test-auc:0.670457 
[45]	train-auc:0.676816	test-auc:0.670458 
[46]	train-auc:0.677052	test-auc:0.670940 
[47]	train-auc:0.677772	test-auc:0.671437 
[48]	train-auc:0.677766	test-auc:0.671431 
[49]	train-auc:0.678850	test-auc:0.671339 
[50]	train-auc:0.678857	test-auc:0.671293 
[51]	train-auc:0.679092	test-auc:0.671782 
[52]	train-auc:0.679092	test-auc:0.671780 
[53]	train-auc:0.679125	test-auc:0.671824 
[54]	train-auc:0.679254	test-auc:0.672052 
[55]	train-auc:0.679290	test-auc:0.672128 
[56]	train-auc:0.680150	test-auc:0.674017 
[57]	train-auc:0.679875	test-auc:0.671734 
[58]	train-auc:0.680676	test-auc:0.673424 
[59]	train-auc:0.680770	test-auc:0.673414 
[60]	train-auc:0.685941	test-auc:0.678407 
[61]	train-auc:0.685930	test-auc:0.678383 
[62]	train-auc:0.686345	test-auc:0.678704 
[63]	train-auc:0.700266	test-auc:0.686142 
[64]	train-auc:0.700257	test-auc:0.686138 
[65]	train-auc:0.700365	test-auc:0.686145 
[66]	train-auc:0.700493	test-auc:0.686143 
[67]	train-auc:0.700594	test-auc:0.686122 
[68]	train-auc:0.700793	test-auc:0.686114 
[69]	train-auc:0.701930	test-auc:0.686721 
[70]	train-auc:0.702053	test-auc:0.686832 
[71]	train-auc:0.702056	test-auc:0.687040 
[72]	train-auc:0.702064	test-auc:0.687579 
[73]	train-auc:0.702622	test-auc:0.688017 
[74]	train-auc:0.702775	test-auc:0.688386 
[75]	train-auc:0.702743	test-auc:0.688409 
[76]	train-auc:0.702745	test-auc:0.688404 
[77]	train-auc:0.703119	test-auc:0.688681 
[78]	train-auc:0.705645	test-auc:0.689528 
[79]	train-auc:0.706050	test-auc:0.689437 
[80]	train-auc:0.709433	test-auc:0.689833 
[81]	train-auc:0.709535	test-auc:0.689500 
[82]	train-auc:0.709857	test-auc:0.689492 
[83]	train-auc:0.710110	test-auc:0.689469 
[84]	train-auc:0.710316	test-auc:0.689231 
[85]	train-auc:0.710451	test-auc:0.689030 
[86]	train-auc:0.710492	test-auc:0.688987 
[87]	train-auc:0.710650	test-auc:0.689055 
[88]	train-auc:0.712091	test-auc:0.689145 
[89]	train-auc:0.712761	test-auc:0.689258 
[90]	train-auc:0.712943	test-auc:0.689322 
[91]	train-auc:0.718109	test-auc:0.691031 
[92]	train-auc:0.718826	test-auc:0.691622 
[93]	train-auc:0.719357	test-auc:0.692124 
[94]	train-auc:0.719759	test-auc:0.692027 
[95]	train-auc:0.721562	test-auc:0.691934 
[96]	train-auc:0.725191	test-auc:0.693911 
[97]	train-auc:0.727848	test-auc:0.695209 
[98]	train-auc:0.727994	test-auc:0.695608 
[99]	train-auc:0.728850	test-auc:0.695471 
[100]	train-auc:0.729655	test-auc:0.696377 
[101]	train-auc:0.730471	test-auc:0.696528 
[102]	train-auc:0.732514	test-auc:0.697786 
[103]	train-auc:0.733853	test-auc:0.698236 
[104]	train-auc:0.734491	test-auc:0.698187 
[105]	train-auc:0.734956	test-auc:0.698124 
[106]	train-auc:0.735775	test-auc:0.698573 
[107]	train-auc:0.735951	test-auc:0.698672 
[108]	train-auc:0.736921	test-auc:0.698558 
[109]	train-auc:0.737261	test-auc:0.698844 
[110]	train-auc:0.737787	test-auc:0.698771 
[111]	train-auc:0.740307	test-auc:0.699156 
[112]	train-auc:0.741414	test-auc:0.699438 
[113]	train-auc:0.741965	test-auc:0.699333 
[114]	train-auc:0.742516	test-auc:0.699551 
[115]	train-auc:0.744639	test-auc:0.701229 
[116]	train-auc:0.745469	test-auc:0.701731 
[117]	train-auc:0.746120	test-auc:0.701740 
[118]	train-auc:0.746497	test-auc:0.701916 
[119]	train-auc:0.747180	test-auc:0.702488 
[120]	train-auc:0.748061	test-auc:0.702803 
[121]	train-auc:0.748827	test-auc:0.703393 
[122]	train-auc:0.749468	test-auc:0.703511 
[123]	train-auc:0.750461	test-auc:0.703633 
[124]	train-auc:0.750970	test-auc:0.703966 
[125]	train-auc:0.751910	test-auc:0.703621 
[126]	train-auc:0.752675	test-auc:0.703870 
[127]	train-auc:0.753772	test-auc:0.704228 
[128]	train-auc:0.755135	test-auc:0.705132 
[129]	train-auc:0.756924	test-auc:0.707136 
[130]	train-auc:0.758141	test-auc:0.707486 
[131]	train-auc:0.759151	test-auc:0.708127 
[132]	train-auc:0.762681	test-auc:0.710545 
[133]	train-auc:0.764027	test-auc:0.710999 
[134]	train-auc:0.764817	test-auc:0.711426 
[135]	train-auc:0.766649	test-auc:0.711763 
[136]	train-auc:0.768839	test-auc:0.713011 
[137]	train-auc:0.770994	test-auc:0.714289 
[138]	train-auc:0.772023	test-auc:0.714912 
[139]	train-auc:0.773204	test-auc:0.716182 
[140]	train-auc:0.774223	test-auc:0.717047 
[141]	train-auc:0.776919	test-auc:0.717382 
[142]	train-auc:0.778986	test-auc:0.719659 
[143]	train-auc:0.780624	test-auc:0.720138 
[144]	train-auc:0.782498	test-auc:0.720404 
[145]	train-auc:0.784146	test-auc:0.720726 
[146]	train-auc:0.784962	test-auc:0.720975 
[147]	train-auc:0.786903	test-auc:0.721092 
[148]	train-auc:0.787683	test-auc:0.720996 
[149]	train-auc:0.788936	test-auc:0.721264 
[150]	train-auc:0.790540	test-auc:0.721393 
[151]	train-auc:0.791998	test-auc:0.720163 
[152]	train-auc:0.792958	test-auc:0.720441 
[153]	train-auc:0.793892	test-auc:0.720556 
[154]	train-auc:0.795634	test-auc:0.720351 
[155]	train-auc:0.796302	test-auc:0.720505 
[156]	train-auc:0.797101	test-auc:0.720370 
[157]	train-auc:0.798547	test-auc:0.720622 
[158]	train-auc:0.799686	test-auc:0.721169 
[159]	train-auc:0.801470	test-auc:0.721490 
[160]	train-auc:0.802694	test-auc:0.722115 
[161]	train-auc:0.803590	test-auc:0.722536 
[162]	train-auc:0.805075	test-auc:0.722713 
[163]	train-auc:0.806080	test-auc:0.722702 
[164]	train-auc:0.807424	test-auc:0.723225 
[165]	train-auc:0.809946	test-auc:0.723437 
[166]	train-auc:0.811554	test-auc:0.724129 
[167]	train-auc:0.813681	test-auc:0.724620 
[168]	train-auc:0.816090	test-auc:0.725232 
[169]	train-auc:0.818636	test-auc:0.725965 
[170]	train-auc:0.820370	test-auc:0.726340 
[171]	train-auc:0.822526	test-auc:0.727218 
[172]	train-auc:0.824311	test-auc:0.727776 
[173]	train-auc:0.825992	test-auc:0.727998 
[174]	train-auc:0.827362	test-auc:0.728398 
[175]	train-auc:0.828669	test-auc:0.729097 
[176]	train-auc:0.830738	test-auc:0.730224 
[177]	train-auc:0.832823	test-auc:0.730323 
[178]	train-auc:0.833928	test-auc:0.731203 
[179]	train-auc:0.835444	test-auc:0.731944 
[180]	train-auc:0.837220	test-auc:0.732526 
[181]	train-auc:0.838363	test-auc:0.732822 
[182]	train-auc:0.841287	test-auc:0.733132 
[183]	train-auc:0.843574	test-auc:0.733781 
[184]	train-auc:0.846174	test-auc:0.734485 
[185]	train-auc:0.848508	test-auc:0.734746 
[186]	train-auc:0.850739	test-auc:0.735206 
[187]	train-auc:0.853095	test-auc:0.735309 
[188]	train-auc:0.855229	test-auc:0.735466 
[189]	train-auc:0.856853	test-auc:0.735716 
[190]	train-auc:0.858639	test-auc:0.735441 
[191]	train-auc:0.860345	test-auc:0.735586 
[192]	train-auc:0.861634	test-auc:0.735826 
[193]	train-auc:0.863154	test-auc:0.736473 
[194]	train-auc:0.864401	test-auc:0.736705 
[195]	train-auc:0.865450	test-auc:0.736846 
[196]	train-auc:0.866164	test-auc:0.736778 
[197]	train-auc:0.868574	test-auc:0.737144 
[198]	train-auc:0.870038	test-auc:0.737566 
[199]	train-auc:0.871256	test-auc:0.737924 
[200]	train-auc:0.872884	test-auc:0.738387 
[201]	train-auc:0.873854	test-auc:0.738848 
[202]	train-auc:0.875101	test-auc:0.739132 
[203]	train-auc:0.875969	test-auc:0.739276 
[204]	train-auc:0.877177	test-auc:0.740106 
[205]	train-auc:0.878020	test-auc:0.740178 
[206]	train-auc:0.879038	test-auc:0.740254 
[207]	train-auc:0.880178	test-auc:0.740687 
[208]	train-auc:0.880815	test-auc:0.740978 
[209]	train-auc:0.882129	test-auc:0.740956 
[210]	train-auc:0.883014	test-auc:0.740976 
[211]	train-auc:0.884059	test-auc:0.741650 
[212]	train-auc:0.884807	test-auc:0.741715 
[213]	train-auc:0.886618	test-auc:0.741965 
[214]	train-auc:0.887341	test-auc:0.742287 
[215]	train-auc:0.888175	test-auc:0.742226 
[216]	train-auc:0.888849	test-auc:0.742409 
[217]	train-auc:0.889722	test-auc:0.742561 
[218]	train-auc:0.890884	test-auc:0.742733 
[219]	train-auc:0.892271	test-auc:0.742841 
[220]	train-auc:0.892762	test-auc:0.742804 
[221]	train-auc:0.893512	test-auc:0.742841 
[222]	train-auc:0.894424	test-auc:0.743022 
[223]	train-auc:0.895953	test-auc:0.742731 
[224]	train-auc:0.897020	test-auc:0.743217 
[225]	train-auc:0.898926	test-auc:0.743549 
[226]	train-auc:0.900186	test-auc:0.743720 
[227]	train-auc:0.900980	test-auc:0.743768 
[228]	train-auc:0.901849	test-auc:0.743830 
[229]	train-auc:0.904082	test-auc:0.744150 
[230]	train-auc:0.904628	test-auc:0.744021 
[231]	train-auc:0.905139	test-auc:0.744115 
[232]	train-auc:0.906341	test-auc:0.744120 
[233]	train-auc:0.907089	test-auc:0.744110 
[234]	train-auc:0.908271	test-auc:0.743965 
[235]	train-auc:0.909503	test-auc:0.744027 
[236]	train-auc:0.910032	test-auc:0.743916 
[237]	train-auc:0.911382	test-auc:0.744137 
[238]	train-auc:0.912025	test-auc:0.744186 
[239]	train-auc:0.913606	test-auc:0.744404 
[240]	train-auc:0.914410	test-auc:0.744296 
[241]	train-auc:0.915934	test-auc:0.744445 
[242]	train-auc:0.916597	test-auc:0.744360 
[243]	train-auc:0.917713	test-auc:0.744722 
[244]	train-auc:0.918022	test-auc:0.744728 
[245]	train-auc:0.919065	test-auc:0.745180 
[246]	train-auc:0.920098	test-auc:0.745241 
[247]	train-auc:0.921197	test-auc:0.745380 
[248]	train-auc:0.922281	test-auc:0.745499 
[249]	train-auc:0.922854	test-auc:0.745613 
[250]	train-auc:0.923821	test-auc:0.745712 
[251]	train-auc:0.925113	test-auc:0.745822 
[252]	train-auc:0.926246	test-auc:0.745916 
[253]	train-auc:0.926785	test-auc:0.746011 
[254]	train-auc:0.927810	test-auc:0.746121 
[255]	train-auc:0.928268	test-auc:0.746127 
[256]	train-auc:0.928753	test-auc:0.746333 
[257]	train-auc:0.929504	test-auc:0.746394 
[258]	train-auc:0.929927	test-auc:0.746476 
[259]	train-auc:0.930341	test-auc:0.746569 
[260]	train-auc:0.931127	test-auc:0.746525 
[261]	train-auc:0.931931	test-auc:0.746567 
[262]	train-auc:0.932374	test-auc:0.746703 
[263]	train-auc:0.933043	test-auc:0.746804 
[264]	train-auc:0.933625	test-auc:0.746929 
[265]	train-auc:0.934419	test-auc:0.747084 
[266]	train-auc:0.934817	test-auc:0.747166 
[267]	train-auc:0.935298	test-auc:0.747129 
[268]	train-auc:0.935548	test-auc:0.747120 
[269]	train-auc:0.936153	test-auc:0.747237 
[270]	train-auc:0.936551	test-auc:0.747314 
[271]	train-auc:0.936914	test-auc:0.747387 
[272]	train-auc:0.937862	test-auc:0.747538 
[273]	train-auc:0.938229	test-auc:0.747708 
[274]	train-auc:0.938981	test-auc:0.747859 
[275]	train-auc:0.939328	test-auc:0.747702 
[276]	train-auc:0.939839	test-auc:0.748048 
[277]	train-auc:0.940093	test-auc:0.748110 
[278]	train-auc:0.940487	test-auc:0.747935 
[279]	train-auc:0.940750	test-auc:0.747887 
[280]	train-auc:0.941439	test-auc:0.747951 
[281]	train-auc:0.942024	test-auc:0.748040 
[282]	train-auc:0.942390	test-auc:0.747949 
[283]	train-auc:0.942631	test-auc:0.748020 
[284]	train-auc:0.942827	test-auc:0.747939 
[285]	train-auc:0.942878	test-auc:0.747897 
[286]	train-auc:0.943055	test-auc:0.747809 
[287]	train-auc:0.943128	test-auc:0.747860 
[288]	train-auc:0.943387	test-auc:0.747730 
[289]	train-auc:0.943706	test-auc:0.747845 
[290]	train-auc:0.943787	test-auc:0.747821 
[291]	train-auc:0.944022	test-auc:0.747774 
[292]	train-auc:0.944502	test-auc:0.747861 
[293]	train-auc:0.944633	test-auc:0.747694 
[294]	train-auc:0.944686	test-auc:0.747685 
[295]	train-auc:0.944895	test-auc:0.747748 
[296]	train-auc:0.945065	test-auc:0.747727 
[297]	train-auc:0.945138	test-auc:0.747867 
[298]	train-auc:0.945184	test-auc:0.747888 
[299]	train-auc:0.945553	test-auc:0.747760 
[300]	train-auc:0.945823	test-auc:0.747677 
[301]	train-auc:0.946144	test-auc:0.747530 
[302]	train-auc:0.946240	test-auc:0.747587 
[303]	train-auc:0.946741	test-auc:0.747574 
[304]	train-auc:0.946877	test-auc:0.747514 
[305]	train-auc:0.946931	test-auc:0.747473 
[306]	train-auc:0.947266	test-auc:0.747328 
[307]	train-auc:0.947570	test-auc:0.747437 
[308]	train-auc:0.947772	test-auc:0.747484 
[309]	train-auc:0.947792	test-auc:0.747401 
[310]	train-auc:0.947970	test-auc:0.747305 
[311]	train-auc:0.948200	test-auc:0.747225 
[312]	train-auc:0.948682	test-auc:0.747236 
[313]	train-auc:0.948937	test-auc:0.746991 
[314]	train-auc:0.949112	test-auc:0.747001 
[315]	train-auc:0.949534	test-auc:0.747178 
[316]	train-auc:0.949581	test-auc:0.747126 
[317]	train-auc:0.949610	test-auc:0.747160 
[318]	train-auc:0.949802	test-auc:0.747158 
[319]	train-auc:0.950119	test-auc:0.747221 
[320]	train-auc:0.950569	test-auc:0.747368 
[321]	train-auc:0.950720	test-auc:0.747365 
[322]	train-auc:0.951331	test-auc:0.747318 
[323]	train-auc:0.951757	test-auc:0.747187 
[324]	train-auc:0.951926	test-auc:0.747251 
[325]	train-auc:0.952149	test-auc:0.747205 
[326]	train-auc:0.952286	test-auc:0.747268 
[327]	train-auc:0.952310	test-auc:0.747211 
Stopping. Best iteration:
[277]	train-auc:0.940093	test-auc:0.748110




Fold 4

[1]	train-auc:0.657345	test-auc:0.646001 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657902	test-auc:0.648411 
[3]	train-auc:0.657906	test-auc:0.648410 
[4]	train-auc:0.658144	test-auc:0.647737 
[5]	train-auc:0.658142	test-auc:0.647738 
[6]	train-auc:0.663331	test-auc:0.650247 
[7]	train-auc:0.663345	test-auc:0.650228 
[8]	train-auc:0.663336	test-auc:0.650247 
[9]	train-auc:0.663346	test-auc:0.650227 
[10]	train-auc:0.663346	test-auc:0.650226 
[11]	train-auc:0.663454	test-auc:0.650634 
[12]	train-auc:0.663449	test-auc:0.650628 
[13]	train-auc:0.663450	test-auc:0.650628 
[14]	train-auc:0.663451	test-auc:0.650628 
[15]	train-auc:0.676675	test-auc:0.661953 
[16]	train-auc:0.676677	test-auc:0.661953 
[17]	train-auc:0.676678	test-auc:0.661953 
[18]	train-auc:0.676992	test-auc:0.662389 
[19]	train-auc:0.677099	test-auc:0.662384 
[20]	train-auc:0.677100	test-auc:0.662382 
[21]	train-auc:0.677100	test-auc:0.662383 
[22]	train-auc:0.677101	test-auc:0.662383 
[23]	train-auc:0.677144	test-auc:0.662381 
[24]	train-auc:0.677145	test-auc:0.662381 
[25]	train-auc:0.677140	test-auc:0.662381 
[26]	train-auc:0.677140	test-auc:0.662381 
[27]	train-auc:0.677346	test-auc:0.662363 
[28]	train-auc:0.677343	test-auc:0.662357 
[29]	train-auc:0.677344	test-auc:0.662352 
[30]	train-auc:0.677343	test-auc:0.662352 
[31]	train-auc:0.677341	test-auc:0.662348 
[32]	train-auc:0.678106	test-auc:0.664449 
[33]	train-auc:0.678106	test-auc:0.664451 
[34]	train-auc:0.678103	test-auc:0.664449 
[35]	train-auc:0.678107	test-auc:0.664457 
[36]	train-auc:0.678246	test-auc:0.664455 
[37]	train-auc:0.678389	test-auc:0.664438 
[38]	train-auc:0.678386	test-auc:0.664433 
[39]	train-auc:0.678492	test-auc:0.664438 
[40]	train-auc:0.678483	test-auc:0.664430 
[41]	train-auc:0.679637	test-auc:0.665365 
[42]	train-auc:0.679702	test-auc:0.664866 
[43]	train-auc:0.679703	test-auc:0.664866 
[44]	train-auc:0.679716	test-auc:0.664878 
[45]	train-auc:0.679717	test-auc:0.664879 
[46]	train-auc:0.679856	test-auc:0.664864 
[47]	train-auc:0.690786	test-auc:0.677882 
[48]	train-auc:0.690786	test-auc:0.677882 
[49]	train-auc:0.691094	test-auc:0.678046 
[50]	train-auc:0.692387	test-auc:0.678539 
[51]	train-auc:0.693676	test-auc:0.679148 
[52]	train-auc:0.694105	test-auc:0.679663 
[53]	train-auc:0.696663	test-auc:0.681882 
[54]	train-auc:0.697577	test-auc:0.682211 
[55]	train-auc:0.697798	test-auc:0.682181 
[56]	train-auc:0.698002	test-auc:0.682169 
[57]	train-auc:0.698005	test-auc:0.682165 
[58]	train-auc:0.698093	test-auc:0.682166 
[59]	train-auc:0.698088	test-auc:0.682157 
[60]	train-auc:0.702247	test-auc:0.685125 
[61]	train-auc:0.702197	test-auc:0.685126 
[62]	train-auc:0.702459	test-auc:0.685109 
[63]	train-auc:0.702580	test-auc:0.685213 
[64]	train-auc:0.702649	test-auc:0.685264 
[65]	train-auc:0.702647	test-auc:0.685259 
[66]	train-auc:0.703036	test-auc:0.685170 
[67]	train-auc:0.703066	test-auc:0.685198 
[68]	train-auc:0.703792	test-auc:0.685145 
[69]	train-auc:0.705581	test-auc:0.685816 
[70]	train-auc:0.705756	test-auc:0.685819 
[71]	train-auc:0.705996	test-auc:0.685858 
[72]	train-auc:0.706285	test-auc:0.685820 
[73]	train-auc:0.707059	test-auc:0.686865 
[74]	train-auc:0.707356	test-auc:0.686901 
[75]	train-auc:0.707327	test-auc:0.686780 
[76]	train-auc:0.707518	test-auc:0.686991 
[77]	train-auc:0.710427	test-auc:0.689424 
[78]	train-auc:0.717362	test-auc:0.694571 
[79]	train-auc:0.717915	test-auc:0.696005 
[80]	train-auc:0.719869	test-auc:0.696752 
[81]	train-auc:0.720002	test-auc:0.696643 
[82]	train-auc:0.720201	test-auc:0.696627 
[83]	train-auc:0.720765	test-auc:0.696471 
[84]	train-auc:0.720837	test-auc:0.696502 
[85]	train-auc:0.720840	test-auc:0.696560 
[86]	train-auc:0.720967	test-auc:0.696502 
[87]	train-auc:0.720998	test-auc:0.696505 
[88]	train-auc:0.722483	test-auc:0.697653 
[89]	train-auc:0.723418	test-auc:0.697923 
[90]	train-auc:0.724233	test-auc:0.698059 
[91]	train-auc:0.728489	test-auc:0.700302 
[92]	train-auc:0.729370	test-auc:0.700684 
[93]	train-auc:0.729619	test-auc:0.700318 
[94]	train-auc:0.729620	test-auc:0.700206 
[95]	train-auc:0.730812	test-auc:0.701399 
[96]	train-auc:0.731159	test-auc:0.701756 
[97]	train-auc:0.731382	test-auc:0.702221 
[98]	train-auc:0.731769	test-auc:0.702307 
[99]	train-auc:0.732395	test-auc:0.702784 
[100]	train-auc:0.732831	test-auc:0.702989 
[101]	train-auc:0.734426	test-auc:0.703568 
[102]	train-auc:0.735420	test-auc:0.704215 
[103]	train-auc:0.736260	test-auc:0.704761 
[104]	train-auc:0.736986	test-auc:0.705038 
[105]	train-auc:0.737784	test-auc:0.705096 
[106]	train-auc:0.738195	test-auc:0.705244 
[107]	train-auc:0.738981	test-auc:0.705776 
[108]	train-auc:0.739127	test-auc:0.705653 
[109]	train-auc:0.740055	test-auc:0.705768 
[110]	train-auc:0.741264	test-auc:0.705870 
[111]	train-auc:0.741713	test-auc:0.705900 
[112]	train-auc:0.743533	test-auc:0.706308 
[113]	train-auc:0.744035	test-auc:0.707082 
[114]	train-auc:0.744548	test-auc:0.706695 
[115]	train-auc:0.744927	test-auc:0.706997 
[116]	train-auc:0.745997	test-auc:0.707830 
[117]	train-auc:0.746838	test-auc:0.708775 
[118]	train-auc:0.747689	test-auc:0.709035 
[119]	train-auc:0.748086	test-auc:0.709203 
[120]	train-auc:0.748728	test-auc:0.709255 
[121]	train-auc:0.749695	test-auc:0.709266 
[122]	train-auc:0.750522	test-auc:0.709571 
[123]	train-auc:0.751591	test-auc:0.709803 
[124]	train-auc:0.752312	test-auc:0.709900 
[125]	train-auc:0.753502	test-auc:0.710536 
[126]	train-auc:0.757258	test-auc:0.712435 
[127]	train-auc:0.759481	test-auc:0.713033 
[128]	train-auc:0.760792	test-auc:0.713192 
[129]	train-auc:0.761600	test-auc:0.713157 
[130]	train-auc:0.762427	test-auc:0.713033 
[131]	train-auc:0.763620	test-auc:0.713285 
[132]	train-auc:0.764818	test-auc:0.713495 
[133]	train-auc:0.765740	test-auc:0.713586 
[134]	train-auc:0.766398	test-auc:0.714052 
[135]	train-auc:0.767242	test-auc:0.714425 
[136]	train-auc:0.767851	test-auc:0.714651 
[137]	train-auc:0.768484	test-auc:0.715053 
[138]	train-auc:0.769329	test-auc:0.715865 
[139]	train-auc:0.770233	test-auc:0.716074 
[140]	train-auc:0.771116	test-auc:0.716560 
[141]	train-auc:0.771594	test-auc:0.716991 
[142]	train-auc:0.772603	test-auc:0.717419 
[143]	train-auc:0.773333	test-auc:0.717168 
[144]	train-auc:0.774622	test-auc:0.717014 
[145]	train-auc:0.775855	test-auc:0.717227 
[146]	train-auc:0.777092	test-auc:0.717672 
[147]	train-auc:0.779115	test-auc:0.718696 
[148]	train-auc:0.780774	test-auc:0.718971 
[149]	train-auc:0.781906	test-auc:0.718834 
[150]	train-auc:0.782885	test-auc:0.719732 
[151]	train-auc:0.785777	test-auc:0.719807 
[152]	train-auc:0.787066	test-auc:0.720220 
[153]	train-auc:0.788315	test-auc:0.720277 
[154]	train-auc:0.789313	test-auc:0.720715 
[155]	train-auc:0.792165	test-auc:0.721388 
[156]	train-auc:0.793557	test-auc:0.721614 
[157]	train-auc:0.795915	test-auc:0.722109 
[158]	train-auc:0.797948	test-auc:0.721929 
[159]	train-auc:0.800358	test-auc:0.722284 
[160]	train-auc:0.802283	test-auc:0.722413 
[161]	train-auc:0.804461	test-auc:0.723081 
[162]	train-auc:0.806321	test-auc:0.723386 
[163]	train-auc:0.807997	test-auc:0.723533 
[164]	train-auc:0.809954	test-auc:0.724213 
[165]	train-auc:0.812483	test-auc:0.724738 
[166]	train-auc:0.813776	test-auc:0.725111 
[167]	train-auc:0.816303	test-auc:0.725485 
[168]	train-auc:0.818208	test-auc:0.725425 
[169]	train-auc:0.820227	test-auc:0.725600 
[170]	train-auc:0.821710	test-auc:0.725436 
[171]	train-auc:0.822865	test-auc:0.725350 
[172]	train-auc:0.824237	test-auc:0.725681 
[173]	train-auc:0.825800	test-auc:0.726536 
[174]	train-auc:0.827522	test-auc:0.726881 
[175]	train-auc:0.829478	test-auc:0.727131 
[176]	train-auc:0.831017	test-auc:0.727217 
[177]	train-auc:0.832693	test-auc:0.728126 
[178]	train-auc:0.834408	test-auc:0.729170 
[179]	train-auc:0.835789	test-auc:0.729574 
[180]	train-auc:0.837201	test-auc:0.730394 
[181]	train-auc:0.838488	test-auc:0.731042 
[182]	train-auc:0.839913	test-auc:0.731351 
[183]	train-auc:0.841468	test-auc:0.732222 
[184]	train-auc:0.842999	test-auc:0.733099 
[185]	train-auc:0.844604	test-auc:0.733670 
[186]	train-auc:0.845638	test-auc:0.734321 
[187]	train-auc:0.847181	test-auc:0.735410 
[188]	train-auc:0.848472	test-auc:0.735748 
[189]	train-auc:0.849838	test-auc:0.735924 
[190]	train-auc:0.851287	test-auc:0.736109 
[191]	train-auc:0.853065	test-auc:0.736642 
[192]	train-auc:0.854422	test-auc:0.736960 
[193]	train-auc:0.855766	test-auc:0.737447 
[194]	train-auc:0.858065	test-auc:0.737941 
[195]	train-auc:0.859543	test-auc:0.738480 
[196]	train-auc:0.861445	test-auc:0.739003 
[197]	train-auc:0.863040	test-auc:0.739641 
[198]	train-auc:0.865008	test-auc:0.740230 
[199]	train-auc:0.867075	test-auc:0.740683 
[200]	train-auc:0.868843	test-auc:0.741247 
[201]	train-auc:0.870839	test-auc:0.741420 
[202]	train-auc:0.872105	test-auc:0.741820 
[203]	train-auc:0.873970	test-auc:0.741907 
[204]	train-auc:0.875932	test-auc:0.742235 
[205]	train-auc:0.877728	test-auc:0.742475 
[206]	train-auc:0.879196	test-auc:0.742712 
[207]	train-auc:0.881019	test-auc:0.743187 
[208]	train-auc:0.882628	test-auc:0.743372 
[209]	train-auc:0.883765	test-auc:0.743829 
[210]	train-auc:0.885402	test-auc:0.744263 
[211]	train-auc:0.886747	test-auc:0.744497 
[212]	train-auc:0.888142	test-auc:0.744722 
[213]	train-auc:0.889853	test-auc:0.745198 
[214]	train-auc:0.891778	test-auc:0.745454 
[215]	train-auc:0.893420	test-auc:0.745368 
[216]	train-auc:0.894908	test-auc:0.745236 
[217]	train-auc:0.896330	test-auc:0.745234 
[218]	train-auc:0.897570	test-auc:0.745272 
[219]	train-auc:0.898614	test-auc:0.745534 
[220]	train-auc:0.900147	test-auc:0.745983 
[221]	train-auc:0.901011	test-auc:0.745803 
[222]	train-auc:0.902444	test-auc:0.745942 
[223]	train-auc:0.903507	test-auc:0.745852 
[224]	train-auc:0.904583	test-auc:0.745625 
[225]	train-auc:0.905307	test-auc:0.745483 
[226]	train-auc:0.906131	test-auc:0.745434 
[227]	train-auc:0.907178	test-auc:0.745756 
[228]	train-auc:0.908387	test-auc:0.746038 
[229]	train-auc:0.909431	test-auc:0.746053 
[230]	train-auc:0.910005	test-auc:0.745903 
[231]	train-auc:0.912247	test-auc:0.746038 
[232]	train-auc:0.912934	test-auc:0.745971 
[233]	train-auc:0.913802	test-auc:0.745991 
[234]	train-auc:0.914994	test-auc:0.745928 
[235]	train-auc:0.917109	test-auc:0.745807 
[236]	train-auc:0.918209	test-auc:0.746006 
[237]	train-auc:0.919363	test-auc:0.746150 
[238]	train-auc:0.921072	test-auc:0.746208 
[239]	train-auc:0.922236	test-auc:0.746203 
[240]	train-auc:0.923274	test-auc:0.746248 
[241]	train-auc:0.924393	test-auc:0.746222 
[242]	train-auc:0.925095	test-auc:0.746293 
[243]	train-auc:0.925913	test-auc:0.746328 
[244]	train-auc:0.927205	test-auc:0.746392 
[245]	train-auc:0.928532	test-auc:0.746132 
[246]	train-auc:0.929301	test-auc:0.746075 
[247]	train-auc:0.930434	test-auc:0.746314 
[248]	train-auc:0.931184	test-auc:0.746506 
[249]	train-auc:0.932278	test-auc:0.746416 
[250]	train-auc:0.933170	test-auc:0.746273 
[251]	train-auc:0.934352	test-auc:0.746395 
[252]	train-auc:0.935605	test-auc:0.746698 
[253]	train-auc:0.936954	test-auc:0.746675 
[254]	train-auc:0.937882	test-auc:0.746534 
[255]	train-auc:0.938989	test-auc:0.746486 
[256]	train-auc:0.939712	test-auc:0.746582 
[257]	train-auc:0.940321	test-auc:0.746845 
[258]	train-auc:0.941049	test-auc:0.746868 
[259]	train-auc:0.942085	test-auc:0.746869 
[260]	train-auc:0.942918	test-auc:0.747034 
[261]	train-auc:0.943464	test-auc:0.747267 
[262]	train-auc:0.944032	test-auc:0.747747 
[263]	train-auc:0.944556	test-auc:0.748031 
[264]	train-auc:0.945218	test-auc:0.747970 
[265]	train-auc:0.945592	test-auc:0.748106 
[266]	train-auc:0.946079	test-auc:0.748067 
[267]	train-auc:0.946675	test-auc:0.748257 
[268]	train-auc:0.947056	test-auc:0.748435 
[269]	train-auc:0.947527	test-auc:0.748483 
[270]	train-auc:0.948022	test-auc:0.748796 
[271]	train-auc:0.948449	test-auc:0.748905 
[272]	train-auc:0.948843	test-auc:0.748886 
[273]	train-auc:0.949198	test-auc:0.748928 
[274]	train-auc:0.949539	test-auc:0.749124 
[275]	train-auc:0.949827	test-auc:0.749233 
[276]	train-auc:0.950158	test-auc:0.749557 
[277]	train-auc:0.950604	test-auc:0.749653 
[278]	train-auc:0.951192	test-auc:0.749695 
[279]	train-auc:0.951750	test-auc:0.749586 
[280]	train-auc:0.952168	test-auc:0.749706 
[281]	train-auc:0.952775	test-auc:0.749921 
[282]	train-auc:0.953267	test-auc:0.749912 
[283]	train-auc:0.953551	test-auc:0.749895 
[284]	train-auc:0.953912	test-auc:0.749827 
[285]	train-auc:0.954246	test-auc:0.749726 
[286]	train-auc:0.954434	test-auc:0.749686 
[287]	train-auc:0.954566	test-auc:0.749598 
[288]	train-auc:0.954635	test-auc:0.749623 
[289]	train-auc:0.954925	test-auc:0.749635 
[290]	train-auc:0.955508	test-auc:0.749508 
[291]	train-auc:0.955718	test-auc:0.749469 
[292]	train-auc:0.955895	test-auc:0.749499 
[293]	train-auc:0.956126	test-auc:0.749512 
[294]	train-auc:0.956379	test-auc:0.749523 
[295]	train-auc:0.956405	test-auc:0.749637 
[296]	train-auc:0.956862	test-auc:0.749858 
[297]	train-auc:0.957358	test-auc:0.749797 
[298]	train-auc:0.957537	test-auc:0.749674 
[299]	train-auc:0.957700	test-auc:0.749708 
[300]	train-auc:0.958016	test-auc:0.749769 
[301]	train-auc:0.958249	test-auc:0.749597 
[302]	train-auc:0.958955	test-auc:0.749566 
[303]	train-auc:0.959168	test-auc:0.749526 
[304]	train-auc:0.959404	test-auc:0.749459 
[305]	train-auc:0.959592	test-auc:0.749366 
[306]	train-auc:0.959655	test-auc:0.749345 
[307]	train-auc:0.959847	test-auc:0.749327 
[308]	train-auc:0.959933	test-auc:0.749236 
[309]	train-auc:0.960118	test-auc:0.749551 
[310]	train-auc:0.960361	test-auc:0.749619 
[311]	train-auc:0.960703	test-auc:0.749703 
[312]	train-auc:0.960809	test-auc:0.749703 
[313]	train-auc:0.961071	test-auc:0.749900 
[314]	train-auc:0.961151	test-auc:0.749839 
[315]	train-auc:0.961203	test-auc:0.749881 
[316]	train-auc:0.961472	test-auc:0.750005 
[317]	train-auc:0.961645	test-auc:0.749864 
[318]	train-auc:0.961869	test-auc:0.749806 
[319]	train-auc:0.962060	test-auc:0.749657 
[320]	train-auc:0.962149	test-auc:0.749697 
[321]	train-auc:0.962197	test-auc:0.749665 
[322]	train-auc:0.962366	test-auc:0.749713 
[323]	train-auc:0.962441	test-auc:0.749692 
[324]	train-auc:0.962979	test-auc:0.749548 
[325]	train-auc:0.963109	test-auc:0.749688 
[326]	train-auc:0.963286	test-auc:0.749741 
[327]	train-auc:0.963460	test-auc:0.749614 
[328]	train-auc:0.963583	test-auc:0.749511 
[329]	train-auc:0.963806	test-auc:0.749765 
[330]	train-auc:0.963911	test-auc:0.749835 
[331]	train-auc:0.963966	test-auc:0.749807 
[332]	train-auc:0.964091	test-auc:0.749824 
[333]	train-auc:0.964251	test-auc:0.749840 
[334]	train-auc:0.964416	test-auc:0.749723 
[335]	train-auc:0.964536	test-auc:0.749793 
[336]	train-auc:0.964803	test-auc:0.749874 
[337]	train-auc:0.964909	test-auc:0.749814 
[338]	train-auc:0.965013	test-auc:0.749783 
[339]	train-auc:0.965074	test-auc:0.749717 
[340]	train-auc:0.965147	test-auc:0.749799 
[341]	train-auc:0.965410	test-auc:0.749901 
[342]	train-auc:0.965468	test-auc:0.749888 
[343]	train-auc:0.965558	test-auc:0.749932 
[344]	train-auc:0.965602	test-auc:0.749933 
[345]	train-auc:0.965800	test-auc:0.749805 
[346]	train-auc:0.966145	test-auc:0.749830 
[347]	train-auc:0.966271	test-auc:0.749917 
[348]	train-auc:0.966366	test-auc:0.749965 
[349]	train-auc:0.966399	test-auc:0.749900 
[350]	train-auc:0.966513	test-auc:0.749881 
[351]	train-auc:0.966617	test-auc:0.749865 
[352]	train-auc:0.966836	test-auc:0.749821 
[353]	train-auc:0.966934	test-auc:0.749888 
[354]	train-auc:0.966976	test-auc:0.749884 
[355]	train-auc:0.967207	test-auc:0.749829 
[356]	train-auc:0.967277	test-auc:0.749797 
[357]	train-auc:0.967334	test-auc:0.749879 
[358]	train-auc:0.967366	test-auc:0.749830 
[359]	train-auc:0.967582	test-auc:0.749761 
[360]	train-auc:0.967838	test-auc:0.749973 
[361]	train-auc:0.967902	test-auc:0.749902 
[362]	train-auc:0.968103	test-auc:0.750106 
[363]	train-auc:0.968123	test-auc:0.750087 
[364]	train-auc:0.968188	test-auc:0.750149 
[365]	train-auc:0.968326	test-auc:0.750176 
[366]	train-auc:0.968398	test-auc:0.750258 
[367]	train-auc:0.968479	test-auc:0.750195 
[368]	train-auc:0.968813	test-auc:0.750176 
[369]	train-auc:0.969028	test-auc:0.750120 
[370]	train-auc:0.969079	test-auc:0.750062 
[371]	train-auc:0.969147	test-auc:0.750061 
[372]	train-auc:0.969175	test-auc:0.750067 
[373]	train-auc:0.969474	test-auc:0.750097 
[374]	train-auc:0.969561	test-auc:0.750133 
[375]	train-auc:0.969656	test-auc:0.750228 
[376]	train-auc:0.969989	test-auc:0.750299 
[377]	train-auc:0.970041	test-auc:0.750301 
[378]	train-auc:0.970141	test-auc:0.750379 
[379]	train-auc:0.970200	test-auc:0.750311 
[380]	train-auc:0.970223	test-auc:0.750208 
[381]	train-auc:0.970283	test-auc:0.750271 
[382]	train-auc:0.970404	test-auc:0.750209 
[383]	train-auc:0.970585	test-auc:0.750032 
[384]	train-auc:0.970626	test-auc:0.750045 
[385]	train-auc:0.970828	test-auc:0.750002 
[386]	train-auc:0.971004	test-auc:0.749837 
[387]	train-auc:0.971048	test-auc:0.749793 
[388]	train-auc:0.971126	test-auc:0.749711 
[389]	train-auc:0.971159	test-auc:0.749627 
[390]	train-auc:0.971254	test-auc:0.749604 
[391]	train-auc:0.971611	test-auc:0.749356 
[392]	train-auc:0.971663	test-auc:0.749407 
[393]	train-auc:0.971674	test-auc:0.749392 
[394]	train-auc:0.971725	test-auc:0.749379 
[395]	train-auc:0.971777	test-auc:0.749363 
[396]	train-auc:0.971839	test-auc:0.749373 
[397]	train-auc:0.971866	test-auc:0.749405 
[398]	train-auc:0.971936	test-auc:0.749392 
[399]	train-auc:0.971967	test-auc:0.749357 
[400]	train-auc:0.972026	test-auc:0.749424 
[401]	train-auc:0.972034	test-auc:0.749383 
[402]	train-auc:0.972124	test-auc:0.749368 
[403]	train-auc:0.972287	test-auc:0.749464 
[404]	train-auc:0.972640	test-auc:0.749325 
[405]	train-auc:0.972825	test-auc:0.749226 
[406]	train-auc:0.972920	test-auc:0.749252 
[407]	train-auc:0.972990	test-auc:0.749194 
[408]	train-auc:0.973010	test-auc:0.749218 
[409]	train-auc:0.973133	test-auc:0.749293 
[410]	train-auc:0.973297	test-auc:0.749254 
[411]	train-auc:0.973352	test-auc:0.749198 
[412]	train-auc:0.973375	test-auc:0.749236 
[413]	train-auc:0.973397	test-auc:0.749206 
[414]	train-auc:0.973484	test-auc:0.749207 
[415]	train-auc:0.973529	test-auc:0.749275 
[416]	train-auc:0.973713	test-auc:0.749055 
[417]	train-auc:0.973887	test-auc:0.749152 
[418]	train-auc:0.973956	test-auc:0.749147 
[419]	train-auc:0.974044	test-auc:0.749039 
[420]	train-auc:0.974123	test-auc:0.749087 
[421]	train-auc:0.974174	test-auc:0.749104 
[422]	train-auc:0.974310	test-auc:0.748986 
[423]	train-auc:0.974423	test-auc:0.748949 
[424]	train-auc:0.974483	test-auc:0.748895 
[425]	train-auc:0.974754	test-auc:0.748993 
[426]	train-auc:0.974824	test-auc:0.748868 
[427]	train-auc:0.974872	test-auc:0.748852 
[428]	train-auc:0.975001	test-auc:0.749081 
Stopping. Best iteration:
[378]	train-auc:0.970141	test-auc:0.750379




Fold 5

[1]	train-auc:0.658349	test-auc:0.652963 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657754	test-auc:0.653154 
[3]	train-auc:0.658215	test-auc:0.653542 
[4]	train-auc:0.658216	test-auc:0.653542 
[5]	train-auc:0.658218	test-auc:0.653543 
[6]	train-auc:0.658222	test-auc:0.653547 
[7]	train-auc:0.660995	test-auc:0.655129 
[8]	train-auc:0.661164	test-auc:0.655005 
[9]	train-auc:0.662342	test-auc:0.655931 
[10]	train-auc:0.663300	test-auc:0.655764 
[11]	train-auc:0.663303	test-auc:0.655766 
[12]	train-auc:0.663364	test-auc:0.655757 
[13]	train-auc:0.663376	test-auc:0.656379 
[14]	train-auc:0.663383	test-auc:0.656389 
[15]	train-auc:0.663385	test-auc:0.656392 
[16]	train-auc:0.663396	test-auc:0.656388 
[17]	train-auc:0.663390	test-auc:0.656333 
[18]	train-auc:0.663396	test-auc:0.656775 
[19]	train-auc:0.663335	test-auc:0.656625 
[20]	train-auc:0.663335	test-auc:0.656632 
[21]	train-auc:0.663327	test-auc:0.656691 
[22]	train-auc:0.663328	test-auc:0.656691 
[23]	train-auc:0.663432	test-auc:0.656688 
[24]	train-auc:0.663485	test-auc:0.656681 
[25]	train-auc:0.663486	test-auc:0.656682 
[26]	train-auc:0.663486	test-auc:0.656681 
[27]	train-auc:0.663588	test-auc:0.656674 
[28]	train-auc:0.664109	test-auc:0.657005 
[29]	train-auc:0.664541	test-auc:0.656986 
[30]	train-auc:0.664541	test-auc:0.656983 
[31]	train-auc:0.664545	test-auc:0.656987 
[32]	train-auc:0.664544	test-auc:0.656981 
[33]	train-auc:0.664549	test-auc:0.656980 
[34]	train-auc:0.664967	test-auc:0.656950 
[35]	train-auc:0.664966	test-auc:0.656949 
[36]	train-auc:0.677716	test-auc:0.668410 
[37]	train-auc:0.677718	test-auc:0.668410 
[38]	train-auc:0.677822	test-auc:0.668404 
[39]	train-auc:0.677822	test-auc:0.668402 
[40]	train-auc:0.677934	test-auc:0.668405 
[41]	train-auc:0.678661	test-auc:0.668800 
[42]	train-auc:0.678653	test-auc:0.668793 
[43]	train-auc:0.678644	test-auc:0.668789 
[44]	train-auc:0.678943	test-auc:0.668555 
[45]	train-auc:0.678943	test-auc:0.668554 
[46]	train-auc:0.678939	test-auc:0.668551 
[47]	train-auc:0.679042	test-auc:0.668542 
[48]	train-auc:0.679043	test-auc:0.668543 
[49]	train-auc:0.679233	test-auc:0.668541 
[50]	train-auc:0.679263	test-auc:0.668608 
[51]	train-auc:0.679391	test-auc:0.668827 
[52]	train-auc:0.679475	test-auc:0.668980 
[53]	train-auc:0.679527	test-auc:0.668682 
[54]	train-auc:0.680604	test-auc:0.670830 
[55]	train-auc:0.680605	test-auc:0.670827 
[56]	train-auc:0.680603	test-auc:0.670797 
[57]	train-auc:0.680604	test-auc:0.670797 
[58]	train-auc:0.682077	test-auc:0.672180 
[59]	train-auc:0.682071	test-auc:0.672168 
[60]	train-auc:0.682076	test-auc:0.672143 
[61]	train-auc:0.682076	test-auc:0.672142 
[62]	train-auc:0.682140	test-auc:0.672060 
[63]	train-auc:0.689356	test-auc:0.677270 
[64]	train-auc:0.689359	test-auc:0.677270 
[65]	train-auc:0.689356	test-auc:0.677263 
[66]	train-auc:0.689364	test-auc:0.677260 
[67]	train-auc:0.689363	test-auc:0.677255 
[68]	train-auc:0.689364	test-auc:0.677253 
[69]	train-auc:0.689363	test-auc:0.677243 
[70]	train-auc:0.691405	test-auc:0.678437 
[71]	train-auc:0.703188	test-auc:0.689346 
[72]	train-auc:0.703214	test-auc:0.689305 
[73]	train-auc:0.702932	test-auc:0.689361 
[74]	train-auc:0.702963	test-auc:0.689349 
[75]	train-auc:0.703929	test-auc:0.690401 
[76]	train-auc:0.703260	test-auc:0.689609 
[77]	train-auc:0.703606	test-auc:0.689911 
[78]	train-auc:0.703725	test-auc:0.689895 
[79]	train-auc:0.704054	test-auc:0.689808 
[80]	train-auc:0.704323	test-auc:0.689748 
[81]	train-auc:0.705423	test-auc:0.689643 
[82]	train-auc:0.705736	test-auc:0.689565 
[83]	train-auc:0.705729	test-auc:0.689545 
[84]	train-auc:0.705754	test-auc:0.689495 
[85]	train-auc:0.706168	test-auc:0.689728 
[86]	train-auc:0.707843	test-auc:0.690774 
[87]	train-auc:0.711724	test-auc:0.693010 
[88]	train-auc:0.711894	test-auc:0.692980 
[89]	train-auc:0.712500	test-auc:0.692843 
[90]	train-auc:0.713040	test-auc:0.692996 
[91]	train-auc:0.713224	test-auc:0.693042 
[92]	train-auc:0.713224	test-auc:0.692926 
[93]	train-auc:0.715410	test-auc:0.694743 
[94]	train-auc:0.721212	test-auc:0.697110 
[95]	train-auc:0.721688	test-auc:0.698194 
[96]	train-auc:0.722990	test-auc:0.699548 
[97]	train-auc:0.723072	test-auc:0.699513 
[98]	train-auc:0.725886	test-auc:0.700507 
[99]	train-auc:0.728009	test-auc:0.700901 
[100]	train-auc:0.729827	test-auc:0.702016 
[101]	train-auc:0.730612	test-auc:0.702178 
[102]	train-auc:0.731742	test-auc:0.702540 
[103]	train-auc:0.731791	test-auc:0.702643 
[104]	train-auc:0.733603	test-auc:0.703739 
[105]	train-auc:0.736613	test-auc:0.704979 
[106]	train-auc:0.736906	test-auc:0.705080 
[107]	train-auc:0.737316	test-auc:0.704972 
[108]	train-auc:0.737980	test-auc:0.705381 
[109]	train-auc:0.738474	test-auc:0.705300 
[110]	train-auc:0.739379	test-auc:0.705526 
[111]	train-auc:0.740344	test-auc:0.706349 
[112]	train-auc:0.740810	test-auc:0.706226 
[113]	train-auc:0.742365	test-auc:0.706768 
[114]	train-auc:0.745567	test-auc:0.708321 
[115]	train-auc:0.746496	test-auc:0.709230 
[116]	train-auc:0.749107	test-auc:0.709601 
[117]	train-auc:0.750327	test-auc:0.709503 
[118]	train-auc:0.752042	test-auc:0.709946 
[119]	train-auc:0.752435	test-auc:0.709945 
[120]	train-auc:0.754550	test-auc:0.710765 
[121]	train-auc:0.755297	test-auc:0.710965 
[122]	train-auc:0.756202	test-auc:0.710889 
[123]	train-auc:0.756654	test-auc:0.710767 
[124]	train-auc:0.758147	test-auc:0.711312 
[125]	train-auc:0.759861	test-auc:0.711702 
[126]	train-auc:0.760664	test-auc:0.711709 
[127]	train-auc:0.761714	test-auc:0.712196 
[128]	train-auc:0.762189	test-auc:0.712395 
[129]	train-auc:0.762430	test-auc:0.712265 
[130]	train-auc:0.762691	test-auc:0.712148 
[131]	train-auc:0.763171	test-auc:0.712298 
[132]	train-auc:0.763446	test-auc:0.712821 
[133]	train-auc:0.763901	test-auc:0.712598 
[134]	train-auc:0.764290	test-auc:0.712633 
[135]	train-auc:0.765393	test-auc:0.712945 
[136]	train-auc:0.765545	test-auc:0.713280 
[137]	train-auc:0.766335	test-auc:0.713517 
[138]	train-auc:0.767271	test-auc:0.713834 
[139]	train-auc:0.767757	test-auc:0.713854 
[140]	train-auc:0.768613	test-auc:0.713938 
[141]	train-auc:0.770544	test-auc:0.714175 
[142]	train-auc:0.772268	test-auc:0.714292 
[143]	train-auc:0.773102	test-auc:0.714503 
[144]	train-auc:0.774182	test-auc:0.714720 
[145]	train-auc:0.775514	test-auc:0.715377 
[146]	train-auc:0.776612	test-auc:0.715559 
[147]	train-auc:0.777752	test-auc:0.716141 
[148]	train-auc:0.778406	test-auc:0.715952 
[149]	train-auc:0.778905	test-auc:0.716244 
[150]	train-auc:0.779494	test-auc:0.716219 
[151]	train-auc:0.780293	test-auc:0.716250 
[152]	train-auc:0.781048	test-auc:0.716581 
[153]	train-auc:0.783953	test-auc:0.717552 
[154]	train-auc:0.784837	test-auc:0.717695 
[155]	train-auc:0.786212	test-auc:0.718742 
[156]	train-auc:0.786936	test-auc:0.719197 
[157]	train-auc:0.788296	test-auc:0.719457 
[158]	train-auc:0.789618	test-auc:0.719739 
[159]	train-auc:0.791563	test-auc:0.720703 
[160]	train-auc:0.792524	test-auc:0.721148 
[161]	train-auc:0.795101	test-auc:0.720873 
[162]	train-auc:0.795981	test-auc:0.721427 
[163]	train-auc:0.797300	test-auc:0.721352 
[164]	train-auc:0.798629	test-auc:0.721578 
[165]	train-auc:0.800300	test-auc:0.721793 
[166]	train-auc:0.801798	test-auc:0.722194 
[167]	train-auc:0.804603	test-auc:0.725210 
[168]	train-auc:0.806560	test-auc:0.727740 
[169]	train-auc:0.808465	test-auc:0.728898 
[170]	train-auc:0.810749	test-auc:0.729621 
[171]	train-auc:0.812685	test-auc:0.730440 
[172]	train-auc:0.813881	test-auc:0.730574 
[173]	train-auc:0.815757	test-auc:0.730942 
[174]	train-auc:0.817810	test-auc:0.731178 
[175]	train-auc:0.820774	test-auc:0.732209 
[176]	train-auc:0.822999	test-auc:0.732954 
[177]	train-auc:0.825523	test-auc:0.732932 
[178]	train-auc:0.828653	test-auc:0.734169 
[179]	train-auc:0.831068	test-auc:0.735097 
[180]	train-auc:0.833008	test-auc:0.736224 
[181]	train-auc:0.834625	test-auc:0.736278 
[182]	train-auc:0.836428	test-auc:0.736867 
[183]	train-auc:0.838224	test-auc:0.737366 
[184]	train-auc:0.839585	test-auc:0.737841 
[185]	train-auc:0.841058	test-auc:0.738613 
[186]	train-auc:0.842573	test-auc:0.738816 
[187]	train-auc:0.843932	test-auc:0.738634 
[188]	train-auc:0.845276	test-auc:0.738409 
[189]	train-auc:0.846830	test-auc:0.738357 
[190]	train-auc:0.848554	test-auc:0.738285 
[191]	train-auc:0.849615	test-auc:0.738254 
[192]	train-auc:0.850833	test-auc:0.738146 
[193]	train-auc:0.853106	test-auc:0.738378 
[194]	train-auc:0.854291	test-auc:0.738463 
[195]	train-auc:0.855501	test-auc:0.738915 
[196]	train-auc:0.857031	test-auc:0.739144 
[197]	train-auc:0.858190	test-auc:0.739081 
[198]	train-auc:0.859342	test-auc:0.739356 
[199]	train-auc:0.860529	test-auc:0.739621 
[200]	train-auc:0.861586	test-auc:0.739932 
[201]	train-auc:0.862885	test-auc:0.740162 
[202]	train-auc:0.864067	test-auc:0.740598 
[203]	train-auc:0.865022	test-auc:0.740795 
[204]	train-auc:0.866027	test-auc:0.740488 
[205]	train-auc:0.867110	test-auc:0.740830 
[206]	train-auc:0.868008	test-auc:0.740819 
[207]	train-auc:0.869325	test-auc:0.741040 
[208]	train-auc:0.870352	test-auc:0.740840 
[209]	train-auc:0.871608	test-auc:0.740905 
[210]	train-auc:0.872574	test-auc:0.740745 
[211]	train-auc:0.873794	test-auc:0.740727 
[212]	train-auc:0.874634	test-auc:0.740817 
[213]	train-auc:0.876406	test-auc:0.741152 
[214]	train-auc:0.877411	test-auc:0.741483 
[215]	train-auc:0.878390	test-auc:0.741728 
[216]	train-auc:0.880911	test-auc:0.742245 
[217]	train-auc:0.882300	test-auc:0.742357 
[218]	train-auc:0.883567	test-auc:0.742579 
[219]	train-auc:0.885024	test-auc:0.742469 
[220]	train-auc:0.886513	test-auc:0.742521 
[221]	train-auc:0.887731	test-auc:0.742831 
[222]	train-auc:0.889323	test-auc:0.743341 
[223]	train-auc:0.891198	test-auc:0.743752 
[224]	train-auc:0.892630	test-auc:0.743893 
[225]	train-auc:0.893858	test-auc:0.743854 
[226]	train-auc:0.895364	test-auc:0.743767 
[227]	train-auc:0.896066	test-auc:0.743837 
[228]	train-auc:0.897781	test-auc:0.743860 
[229]	train-auc:0.898978	test-auc:0.743798 
[230]	train-auc:0.901099	test-auc:0.743830 
[231]	train-auc:0.902624	test-auc:0.743975 
[232]	train-auc:0.904430	test-auc:0.744334 
[233]	train-auc:0.905662	test-auc:0.744446 
[234]	train-auc:0.907034	test-auc:0.744940 
[235]	train-auc:0.908553	test-auc:0.745562 
[236]	train-auc:0.909929	test-auc:0.746056 
[237]	train-auc:0.911369	test-auc:0.746107 
[238]	train-auc:0.912208	test-auc:0.746134 
[239]	train-auc:0.913540	test-auc:0.746375 
[240]	train-auc:0.914575	test-auc:0.746530 
[241]	train-auc:0.915859	test-auc:0.746365 
[242]	train-auc:0.916652	test-auc:0.746418 
[243]	train-auc:0.917885	test-auc:0.746409 
[244]	train-auc:0.918944	test-auc:0.746381 
[245]	train-auc:0.919752	test-auc:0.746288 
[246]	train-auc:0.920318	test-auc:0.746554 
[247]	train-auc:0.920773	test-auc:0.746574 
[248]	train-auc:0.921565	test-auc:0.746640 
[249]	train-auc:0.922272	test-auc:0.746901 
[250]	train-auc:0.922671	test-auc:0.747006 
[251]	train-auc:0.923907	test-auc:0.746929 
[252]	train-auc:0.924717	test-auc:0.747073 
[253]	train-auc:0.925365	test-auc:0.747274 
[254]	train-auc:0.925691	test-auc:0.747308 
[255]	train-auc:0.927302	test-auc:0.747604 
[256]	train-auc:0.927924	test-auc:0.747846 
[257]	train-auc:0.929156	test-auc:0.748143 
[258]	train-auc:0.929570	test-auc:0.748208 
[259]	train-auc:0.930167	test-auc:0.748518 
[260]	train-auc:0.930939	test-auc:0.748592 
[261]	train-auc:0.931963	test-auc:0.748546 
[262]	train-auc:0.932588	test-auc:0.748708 
[263]	train-auc:0.933146	test-auc:0.748663 
[264]	train-auc:0.933593	test-auc:0.748591 
[265]	train-auc:0.933993	test-auc:0.748646 
[266]	train-auc:0.934682	test-auc:0.748595 
[267]	train-auc:0.935403	test-auc:0.748816 
[268]	train-auc:0.936046	test-auc:0.748919 
[269]	train-auc:0.936584	test-auc:0.748914 
[270]	train-auc:0.937179	test-auc:0.749019 
[271]	train-auc:0.937598	test-auc:0.748945 
[272]	train-auc:0.937797	test-auc:0.749011 
[273]	train-auc:0.938043	test-auc:0.748993 
[274]	train-auc:0.938593	test-auc:0.749121 
[275]	train-auc:0.939131	test-auc:0.749245 
[276]	train-auc:0.939616	test-auc:0.749578 
[277]	train-auc:0.940422	test-auc:0.749634 
[278]	train-auc:0.941101	test-auc:0.749547 
[279]	train-auc:0.941529	test-auc:0.749525 
[280]	train-auc:0.941843	test-auc:0.749400 
[281]	train-auc:0.942118	test-auc:0.749263 
[282]	train-auc:0.942722	test-auc:0.749216 
[283]	train-auc:0.943041	test-auc:0.749287 
[284]	train-auc:0.943365	test-auc:0.749341 
[285]	train-auc:0.944167	test-auc:0.749496 
[286]	train-auc:0.944367	test-auc:0.749471 
[287]	train-auc:0.944819	test-auc:0.749470 
[288]	train-auc:0.945066	test-auc:0.749601 
[289]	train-auc:0.945715	test-auc:0.749597 
[290]	train-auc:0.945982	test-auc:0.749550 
[291]	train-auc:0.946457	test-auc:0.749817 
[292]	train-auc:0.946619	test-auc:0.749803 
[293]	train-auc:0.946830	test-auc:0.749837 
[294]	train-auc:0.947063	test-auc:0.749928 
[295]	train-auc:0.947249	test-auc:0.749894 
[296]	train-auc:0.947449	test-auc:0.749831 
[297]	train-auc:0.947566	test-auc:0.749776 
[298]	train-auc:0.947763	test-auc:0.749729 
[299]	train-auc:0.947959	test-auc:0.749679 
[300]	train-auc:0.948216	test-auc:0.749671 
[301]	train-auc:0.948425	test-auc:0.749573 
[302]	train-auc:0.948480	test-auc:0.749520 
[303]	train-auc:0.948535	test-auc:0.749363 
[304]	train-auc:0.948845	test-auc:0.749383 
[305]	train-auc:0.949043	test-auc:0.749338 
[306]	train-auc:0.949267	test-auc:0.749372 
[307]	train-auc:0.949465	test-auc:0.749324 
[308]	train-auc:0.949701	test-auc:0.749273 
[309]	train-auc:0.949953	test-auc:0.749385 
[310]	train-auc:0.950231	test-auc:0.749438 
[311]	train-auc:0.950651	test-auc:0.749541 
[312]	train-auc:0.950699	test-auc:0.749410 
[313]	train-auc:0.950865	test-auc:0.749524 
[314]	train-auc:0.951018	test-auc:0.749543 
[315]	train-auc:0.951187	test-auc:0.749567 
[316]	train-auc:0.951263	test-auc:0.749611 
[317]	train-auc:0.951540	test-auc:0.749679 
[318]	train-auc:0.951671	test-auc:0.749855 
[319]	train-auc:0.951756	test-auc:0.749830 
[320]	train-auc:0.951873	test-auc:0.750034 
[321]	train-auc:0.952082	test-auc:0.750040 
[322]	train-auc:0.952175	test-auc:0.750116 
[323]	train-auc:0.952275	test-auc:0.750130 
[324]	train-auc:0.952441	test-auc:0.750184 
[325]	train-auc:0.952491	test-auc:0.750127 
[326]	train-auc:0.952585	test-auc:0.750097 
[327]	train-auc:0.952987	test-auc:0.750053 
[328]	train-auc:0.953078	test-auc:0.750104 
[329]	train-auc:0.953162	test-auc:0.750297 
[330]	train-auc:0.953272	test-auc:0.750315 
[331]	train-auc:0.953528	test-auc:0.750379 
[332]	train-auc:0.953670	test-auc:0.750369 
[333]	train-auc:0.953742	test-auc:0.750467 
[334]	train-auc:0.953858	test-auc:0.750464 
[335]	train-auc:0.953969	test-auc:0.750464 
[336]	train-auc:0.954131	test-auc:0.750350 
[337]	train-auc:0.954155	test-auc:0.750316 
[338]	train-auc:0.954396	test-auc:0.750308 
[339]	train-auc:0.954463	test-auc:0.750302 
[340]	train-auc:0.954523	test-auc:0.750193 
[341]	train-auc:0.954706	test-auc:0.750176 
[342]	train-auc:0.954818	test-auc:0.750192 
[343]	train-auc:0.954919	test-auc:0.750168 
[344]	train-auc:0.954980	test-auc:0.750023 
[345]	train-auc:0.955070	test-auc:0.750032 
[346]	train-auc:0.955115	test-auc:0.750113 
[347]	train-auc:0.955191	test-auc:0.750103 
[348]	train-auc:0.955257	test-auc:0.749985 
[349]	train-auc:0.955680	test-auc:0.749889 
[350]	train-auc:0.955813	test-auc:0.749851 
[351]	train-auc:0.956091	test-auc:0.749672 
[352]	train-auc:0.956257	test-auc:0.749605 
[353]	train-auc:0.956302	test-auc:0.749572 
[354]	train-auc:0.956634	test-auc:0.749632 
[355]	train-auc:0.956727	test-auc:0.749588 
[356]	train-auc:0.956771	test-auc:0.749546 
[357]	train-auc:0.956905	test-auc:0.749541 
[358]	train-auc:0.957062	test-auc:0.749537 
[359]	train-auc:0.957425	test-auc:0.749424 
[360]	train-auc:0.957678	test-auc:0.749479 
[361]	train-auc:0.957754	test-auc:0.749445 
[362]	train-auc:0.957812	test-auc:0.749409 
[363]	train-auc:0.957910	test-auc:0.749374 
[364]	train-auc:0.958270	test-auc:0.749422 
[365]	train-auc:0.958440	test-auc:0.749379 
[366]	train-auc:0.958714	test-auc:0.749270 
[367]	train-auc:0.958757	test-auc:0.749255 
[368]	train-auc:0.958864	test-auc:0.749124 
[369]	train-auc:0.959041	test-auc:0.749113 
[370]	train-auc:0.959072	test-auc:0.749044 
[371]	train-auc:0.959160	test-auc:0.749043 
[372]	train-auc:0.959225	test-auc:0.748935 
[373]	train-auc:0.959281	test-auc:0.749001 
[374]	train-auc:0.959895	test-auc:0.749036 
[375]	train-auc:0.959951	test-auc:0.748920 
[376]	train-auc:0.960002	test-auc:0.748883 
[377]	train-auc:0.960398	test-auc:0.749109 
[378]	train-auc:0.960627	test-auc:0.749088 
[379]	train-auc:0.961014	test-auc:0.749196 
[380]	train-auc:0.961122	test-auc:0.749239 
[381]	train-auc:0.961208	test-auc:0.749221 
[382]	train-auc:0.961321	test-auc:0.749208 
[383]	train-auc:0.961429	test-auc:0.749300 
Stopping. Best iteration:
[333]	train-auc:0.953742	test-auc:0.750467

