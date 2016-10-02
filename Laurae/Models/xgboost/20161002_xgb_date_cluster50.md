```r
> format(Sys.time(), "%a %b %d %Y %X")
[1] "Sun Oct 02 2016 03:06:29 AM"
> #xgb.opt.depth(initial = 10, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)
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
+   sink(file = "Laurae/20161002_xgb_date_cluster50/logs.txt", append = TRUE, split = FALSE)
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
+   write.csv(predictions1, file = "Laurae/20161002_xgb_date_cluster50/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20161002_xgb_date_cluster50/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20161002_xgb_date_cluster50/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Time: Sun Oct 02 2016 04:10:15 AM
Average of validation predictions:  0.005708374
Average of test predictions:  0.00570597
Average of rolling test predictions:  0.02852985
Fold 1: MCC=0.2932568

Time: Sun Oct 02 2016 05:33:34 AM
Average of validation predictions:  0.005466016
Average of test predictions:  0.005533796
Average of rolling test predictions:  0.02809941
Fold 2: MCC=0.2695989

Time: Sun Oct 02 2016 06:32:09 AM
Average of validation predictions:  0.005967906
Average of test predictions:  0.00597674
Average of rolling test predictions:  0.02869418
Fold 3: MCC=0.276825

Time: Sun Oct 02 2016 07:43:10 AM
Average of validation predictions:  0.00563535
Average of test predictions:  0.005631972
Average of rolling test predictions:  0.0285606
Fold 4: MCC=0.2705896

Time: Sun Oct 02 2016 09:00:21 AM
Average of validation predictions:  0.005548812
Average of test predictions:  0.005568478
Average of rolling test predictions:  0.02841696
Fold 5: MCC=0.2713924
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20161002_xgb_date_cluster50/predictions_test_mean.csv", row.names = FALSE)
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
Fold 1: MCC=0.2932568 | rolling average: 0.2932568
Fold 2: MCC=0.2695989 | rolling average: 0.2814279
Fold 3: MCC=0.276825 | rolling average: 0.2798936
Fold 4: MCC=0.2705896 | rolling average: 0.2775676
Fold 5: MCC=0.2713924 | rolling average: 0.2763326
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.2763326 + 0.009866643
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1496985 | rolling average: 0.1496985
Fold 2: threshold=0.1253693 | rolling average: 0.1375339
Fold 3: threshold=0.1948101 | rolling average: 0.156626
Fold 4: threshold=0.1896127 | rolling average: 0.1648726
Fold 5: threshold=0.1302641 | rolling average: 0.1579509
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 >= best_mcc)
> print(sum(submission1$Response == 1))
[1] 2777
> write.csv(submission1, file = "Laurae/20161002_xgb_date_cluster50/submission1.csv", row.names = FALSE)
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
Fold 1: threshold=0.1496985 | rolling average: 0.0023037
Fold 2: threshold=0.1253693 | rolling average: 0.002524608
Fold 3: threshold=0.1948101 | rolling average: 0.002342559
Fold 4: threshold=0.1896127 | rolling average: 0.002261461
Fold 5: threshold=0.1302641 | rolling average: 0.002332591
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 1657
> write.csv(submission2, file = "Laurae/20161002_xgb_date_cluster50/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2250
> write.csv(submission2, file = "Laurae/20161002_xgb_date_cluster50/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2693
> write.csv(submission2, file = "Laurae/20161002_xgb_date_cluster50/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 3186
> write.csv(submission2, file = "Laurae/20161002_xgb_date_cluster50/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 4020
> write.csv(submission2, file = "Laurae/20161002_xgb_date_cluster50/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 4020
> write.csv(submission3, file = "Laurae/20161002_xgb_date_cluster50/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2777
> write.csv(submission4, file = "Laurae/20161002_xgb_date_cluster50/submission4.csv", row.names = FALSE)





Fold 1

[1]	train-auc:0.656278	test-auc:0.656403 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.655766	test-auc:0.655397 
[3]	train-auc:0.655769	test-auc:0.655401 
[4]	train-auc:0.655770	test-auc:0.655403 
[5]	train-auc:0.655772	test-auc:0.655405 
[6]	train-auc:0.655773	test-auc:0.655411 
[7]	train-auc:0.655775	test-auc:0.655412 
[8]	train-auc:0.655777	test-auc:0.655413 
[9]	train-auc:0.656403	test-auc:0.656361 
[10]	train-auc:0.656619	test-auc:0.656572 
[11]	train-auc:0.657339	test-auc:0.657763 
[12]	train-auc:0.657441	test-auc:0.657760 
[13]	train-auc:0.657440	test-auc:0.657761 
[14]	train-auc:0.657442	test-auc:0.657761 
[15]	train-auc:0.658054	test-auc:0.658294 
[16]	train-auc:0.659133	test-auc:0.659283 
[17]	train-auc:0.659129	test-auc:0.659272 
[18]	train-auc:0.659134	test-auc:0.659276 
[19]	train-auc:0.659239	test-auc:0.659272 
[20]	train-auc:0.659235	test-auc:0.659273 
[21]	train-auc:0.659496	test-auc:0.659700 
[22]	train-auc:0.659498	test-auc:0.659697 
[23]	train-auc:0.659895	test-auc:0.660240 
[24]	train-auc:0.659895	test-auc:0.660240 
[25]	train-auc:0.659897	test-auc:0.660241 
[26]	train-auc:0.659896	test-auc:0.660234 
[27]	train-auc:0.660002	test-auc:0.660233 
[28]	train-auc:0.660001	test-auc:0.660231 
[29]	train-auc:0.660000	test-auc:0.660224 
[30]	train-auc:0.660411	test-auc:0.660207 
[31]	train-auc:0.678599	test-auc:0.676107 
[32]	train-auc:0.683190	test-auc:0.683096 
[33]	train-auc:0.683086	test-auc:0.682557 
[34]	train-auc:0.683160	test-auc:0.682727 
[35]	train-auc:0.683224	test-auc:0.682555 
[36]	train-auc:0.683226	test-auc:0.682548 
[37]	train-auc:0.683160	test-auc:0.682724 
[38]	train-auc:0.683159	test-auc:0.682718 
[39]	train-auc:0.683158	test-auc:0.682721 
[40]	train-auc:0.683257	test-auc:0.682720 
[41]	train-auc:0.683255	test-auc:0.682713 
[42]	train-auc:0.683279	test-auc:0.682731 
[43]	train-auc:0.683278	test-auc:0.682730 
[44]	train-auc:0.683579	test-auc:0.683264 
[45]	train-auc:0.684087	test-auc:0.683472 
[46]	train-auc:0.684088	test-auc:0.683475 
[47]	train-auc:0.684091	test-auc:0.683478 
[48]	train-auc:0.684088	test-auc:0.683474 
[49]	train-auc:0.684192	test-auc:0.683470 
[50]	train-auc:0.684597	test-auc:0.684383 
[51]	train-auc:0.684818	test-auc:0.684443 
[52]	train-auc:0.687224	test-auc:0.685627 
[53]	train-auc:0.687451	test-auc:0.685541 
[54]	train-auc:0.688688	test-auc:0.686326 
[55]	train-auc:0.688683	test-auc:0.686316 
[56]	train-auc:0.688682	test-auc:0.686321 
[57]	train-auc:0.691063	test-auc:0.688925 
[58]	train-auc:0.691623	test-auc:0.688916 
[59]	train-auc:0.691592	test-auc:0.689178 
[60]	train-auc:0.692342	test-auc:0.689702 
[61]	train-auc:0.692969	test-auc:0.690149 
[62]	train-auc:0.693813	test-auc:0.689706 
[63]	train-auc:0.694056	test-auc:0.689720 
[64]	train-auc:0.694185	test-auc:0.689754 
[65]	train-auc:0.694229	test-auc:0.689788 
[66]	train-auc:0.694444	test-auc:0.689726 
[67]	train-auc:0.698378	test-auc:0.693443 
[68]	train-auc:0.698385	test-auc:0.693419 
[69]	train-auc:0.698662	test-auc:0.693410 
[70]	train-auc:0.699576	test-auc:0.693795 
[71]	train-auc:0.700037	test-auc:0.694022 
[72]	train-auc:0.700183	test-auc:0.694054 
[73]	train-auc:0.700428	test-auc:0.694010 
[74]	train-auc:0.700490	test-auc:0.694001 
[75]	train-auc:0.700608	test-auc:0.694097 
[76]	train-auc:0.700920	test-auc:0.694353 
[77]	train-auc:0.702405	test-auc:0.695375 
[78]	train-auc:0.702673	test-auc:0.695300 
[79]	train-auc:0.704101	test-auc:0.695563 
[80]	train-auc:0.705409	test-auc:0.696419 
[81]	train-auc:0.705417	test-auc:0.696455 
[82]	train-auc:0.705428	test-auc:0.696536 
[83]	train-auc:0.705428	test-auc:0.696591 
[84]	train-auc:0.705687	test-auc:0.696676 
[85]	train-auc:0.705666	test-auc:0.696908 
[86]	train-auc:0.709596	test-auc:0.701007 
[87]	train-auc:0.709472	test-auc:0.701202 
[88]	train-auc:0.709682	test-auc:0.701101 
[89]	train-auc:0.709889	test-auc:0.701445 
[90]	train-auc:0.710705	test-auc:0.701667 
[91]	train-auc:0.713557	test-auc:0.702304 
[92]	train-auc:0.713911	test-auc:0.702330 
[93]	train-auc:0.716166	test-auc:0.705275 
[94]	train-auc:0.716740	test-auc:0.705119 
[95]	train-auc:0.717886	test-auc:0.705157 
[96]	train-auc:0.719141	test-auc:0.706828 
[97]	train-auc:0.719333	test-auc:0.707282 
[98]	train-auc:0.719966	test-auc:0.707802 
[99]	train-auc:0.722072	test-auc:0.708360 
[100]	train-auc:0.722734	test-auc:0.708637 
[101]	train-auc:0.722930	test-auc:0.708627 
[102]	train-auc:0.724712	test-auc:0.710329 
[103]	train-auc:0.725543	test-auc:0.710514 
[104]	train-auc:0.726025	test-auc:0.710814 
[105]	train-auc:0.726883	test-auc:0.711004 
[106]	train-auc:0.727741	test-auc:0.710877 
[107]	train-auc:0.728116	test-auc:0.711199 
[108]	train-auc:0.728895	test-auc:0.711601 
[109]	train-auc:0.729629	test-auc:0.711831 
[110]	train-auc:0.733505	test-auc:0.714157 
[111]	train-auc:0.734880	test-auc:0.714398 
[112]	train-auc:0.737128	test-auc:0.717531 
[113]	train-auc:0.737459	test-auc:0.717796 
[114]	train-auc:0.741043	test-auc:0.719637 
[115]	train-auc:0.742291	test-auc:0.720454 
[116]	train-auc:0.742600	test-auc:0.721238 
[117]	train-auc:0.743555	test-auc:0.722303 
[118]	train-auc:0.744570	test-auc:0.723089 
[119]	train-auc:0.745333	test-auc:0.723235 
[120]	train-auc:0.746012	test-auc:0.723082 
[121]	train-auc:0.746890	test-auc:0.723366 
[122]	train-auc:0.747252	test-auc:0.723490 
[123]	train-auc:0.748302	test-auc:0.724680 
[124]	train-auc:0.748836	test-auc:0.724744 
[125]	train-auc:0.749740	test-auc:0.724862 
[126]	train-auc:0.749993	test-auc:0.724853 
[127]	train-auc:0.751055	test-auc:0.725963 
[128]	train-auc:0.751889	test-auc:0.726471 
[129]	train-auc:0.753154	test-auc:0.727195 
[130]	train-auc:0.753975	test-auc:0.727057 
[131]	train-auc:0.756513	test-auc:0.728787 
[132]	train-auc:0.757664	test-auc:0.729290 
[133]	train-auc:0.759017	test-auc:0.730188 
[134]	train-auc:0.759553	test-auc:0.730411 
[135]	train-auc:0.761213	test-auc:0.731206 
[136]	train-auc:0.763547	test-auc:0.731384 
[137]	train-auc:0.765065	test-auc:0.731780 
[138]	train-auc:0.768050	test-auc:0.732417 
[139]	train-auc:0.770589	test-auc:0.733240 
[140]	train-auc:0.771773	test-auc:0.733777 
[141]	train-auc:0.774512	test-auc:0.734878 
[142]	train-auc:0.775925	test-auc:0.735119 
[143]	train-auc:0.778315	test-auc:0.736278 
[144]	train-auc:0.779237	test-auc:0.736520 
[145]	train-auc:0.781574	test-auc:0.736302 
[146]	train-auc:0.783370	test-auc:0.736535 
[147]	train-auc:0.784576	test-auc:0.736923 
[148]	train-auc:0.785981	test-auc:0.737139 
[149]	train-auc:0.788085	test-auc:0.737844 
[150]	train-auc:0.789241	test-auc:0.738113 
[151]	train-auc:0.790744	test-auc:0.738341 
[152]	train-auc:0.791966	test-auc:0.739116 
[153]	train-auc:0.794022	test-auc:0.739535 
[154]	train-auc:0.795363	test-auc:0.739390 
[155]	train-auc:0.796753	test-auc:0.739664 
[156]	train-auc:0.797610	test-auc:0.739561 
[157]	train-auc:0.799303	test-auc:0.740152 
[158]	train-auc:0.801172	test-auc:0.740641 
[159]	train-auc:0.803380	test-auc:0.740755 
[160]	train-auc:0.804920	test-auc:0.741531 
[161]	train-auc:0.807368	test-auc:0.741949 
[162]	train-auc:0.808976	test-auc:0.742250 
[163]	train-auc:0.810485	test-auc:0.742960 
[164]	train-auc:0.811923	test-auc:0.743102 
[165]	train-auc:0.814039	test-auc:0.743240 
[166]	train-auc:0.815243	test-auc:0.743384 
[167]	train-auc:0.816766	test-auc:0.743891 
[168]	train-auc:0.818366	test-auc:0.744215 
[169]	train-auc:0.819806	test-auc:0.744491 
[170]	train-auc:0.821521	test-auc:0.744998 
[171]	train-auc:0.823747	test-auc:0.745116 
[172]	train-auc:0.824725	test-auc:0.745640 
[173]	train-auc:0.826078	test-auc:0.745562 
[174]	train-auc:0.827427	test-auc:0.746260 
[175]	train-auc:0.829464	test-auc:0.746635 
[176]	train-auc:0.831008	test-auc:0.747056 
[177]	train-auc:0.832728	test-auc:0.747311 
[178]	train-auc:0.834494	test-auc:0.748101 
[179]	train-auc:0.836065	test-auc:0.748538 
[180]	train-auc:0.837279	test-auc:0.748763 
[181]	train-auc:0.838303	test-auc:0.748953 
[182]	train-auc:0.839303	test-auc:0.749385 
[183]	train-auc:0.840345	test-auc:0.749790 
[184]	train-auc:0.842557	test-auc:0.750299 
[185]	train-auc:0.844420	test-auc:0.750634 
[186]	train-auc:0.845706	test-auc:0.751241 
[187]	train-auc:0.847216	test-auc:0.751488 
[188]	train-auc:0.848643	test-auc:0.751412 
[189]	train-auc:0.850246	test-auc:0.751604 
[190]	train-auc:0.852172	test-auc:0.752111 
[191]	train-auc:0.853472	test-auc:0.752147 
[192]	train-auc:0.854418	test-auc:0.752481 
[193]	train-auc:0.855905	test-auc:0.752286 
[194]	train-auc:0.856978	test-auc:0.752415 
[195]	train-auc:0.859044	test-auc:0.752897 
[196]	train-auc:0.860328	test-auc:0.753063 
[197]	train-auc:0.862202	test-auc:0.753095 
[198]	train-auc:0.864226	test-auc:0.753518 
[199]	train-auc:0.864861	test-auc:0.753443 
[200]	train-auc:0.866340	test-auc:0.753209 
[201]	train-auc:0.867455	test-auc:0.753349 
[202]	train-auc:0.869545	test-auc:0.754006 
[203]	train-auc:0.871026	test-auc:0.753840 
[204]	train-auc:0.872188	test-auc:0.753999 
[205]	train-auc:0.874073	test-auc:0.754338 
[206]	train-auc:0.875446	test-auc:0.754683 
[207]	train-auc:0.876741	test-auc:0.754805 
[208]	train-auc:0.877713	test-auc:0.754551 
[209]	train-auc:0.878817	test-auc:0.754731 
[210]	train-auc:0.879974	test-auc:0.754924 
[211]	train-auc:0.881641	test-auc:0.755346 
[212]	train-auc:0.882821	test-auc:0.755483 
[213]	train-auc:0.884077	test-auc:0.756002 
[214]	train-auc:0.886152	test-auc:0.755857 
[215]	train-auc:0.887460	test-auc:0.756300 
[216]	train-auc:0.890580	test-auc:0.756420 
[217]	train-auc:0.891873	test-auc:0.756577 
[218]	train-auc:0.892885	test-auc:0.756316 
[219]	train-auc:0.895517	test-auc:0.756310 
[220]	train-auc:0.896670	test-auc:0.756387 
[221]	train-auc:0.899515	test-auc:0.756404 
[222]	train-auc:0.900359	test-auc:0.756163 
[223]	train-auc:0.902388	test-auc:0.756194 
[224]	train-auc:0.903313	test-auc:0.756425 
[225]	train-auc:0.904985	test-auc:0.756621 
[226]	train-auc:0.907040	test-auc:0.756455 
[227]	train-auc:0.908009	test-auc:0.756877 
[228]	train-auc:0.909742	test-auc:0.756918 
[229]	train-auc:0.910689	test-auc:0.757239 
[230]	train-auc:0.911801	test-auc:0.757093 
[231]	train-auc:0.912603	test-auc:0.757258 
[232]	train-auc:0.913822	test-auc:0.757215 
[233]	train-auc:0.915968	test-auc:0.757053 
[234]	train-auc:0.918245	test-auc:0.757228 
[235]	train-auc:0.919490	test-auc:0.757147 
[236]	train-auc:0.921043	test-auc:0.757307 
[237]	train-auc:0.921658	test-auc:0.757156 
[238]	train-auc:0.922727	test-auc:0.757352 
[239]	train-auc:0.923995	test-auc:0.757261 
[240]	train-auc:0.925125	test-auc:0.757367 
[241]	train-auc:0.925861	test-auc:0.757387 
[242]	train-auc:0.927149	test-auc:0.757483 
[243]	train-auc:0.928174	test-auc:0.757317 
[244]	train-auc:0.929128	test-auc:0.757300 
[245]	train-auc:0.929703	test-auc:0.757619 
[246]	train-auc:0.930622	test-auc:0.757425 
[247]	train-auc:0.931517	test-auc:0.757356 
[248]	train-auc:0.932129	test-auc:0.757315 
[249]	train-auc:0.932710	test-auc:0.757273 
[250]	train-auc:0.933369	test-auc:0.757558 
[251]	train-auc:0.933995	test-auc:0.757603 
[252]	train-auc:0.934587	test-auc:0.757702 
[253]	train-auc:0.935183	test-auc:0.757583 
[254]	train-auc:0.935937	test-auc:0.757628 
[255]	train-auc:0.936425	test-auc:0.757930 
[256]	train-auc:0.937446	test-auc:0.757817 
[257]	train-auc:0.938017	test-auc:0.757846 
[258]	train-auc:0.938356	test-auc:0.757851 
[259]	train-auc:0.938852	test-auc:0.757870 
[260]	train-auc:0.939368	test-auc:0.757925 
[261]	train-auc:0.940268	test-auc:0.757953 
[262]	train-auc:0.941119	test-auc:0.757991 
[263]	train-auc:0.941713	test-auc:0.757972 
[264]	train-auc:0.942325	test-auc:0.757888 
[265]	train-auc:0.943186	test-auc:0.757968 
[266]	train-auc:0.943517	test-auc:0.757945 
[267]	train-auc:0.944057	test-auc:0.758146 
[268]	train-auc:0.944724	test-auc:0.758197 
[269]	train-auc:0.945291	test-auc:0.758160 
[270]	train-auc:0.945855	test-auc:0.758185 
[271]	train-auc:0.946381	test-auc:0.758081 
[272]	train-auc:0.947085	test-auc:0.758280 
[273]	train-auc:0.947360	test-auc:0.758479 
[274]	train-auc:0.947910	test-auc:0.758525 
[275]	train-auc:0.948413	test-auc:0.758430 
[276]	train-auc:0.948758	test-auc:0.758546 
[277]	train-auc:0.949212	test-auc:0.758440 
[278]	train-auc:0.949655	test-auc:0.758409 
[279]	train-auc:0.949938	test-auc:0.758482 
[280]	train-auc:0.950181	test-auc:0.758578 
[281]	train-auc:0.950375	test-auc:0.758586 
[282]	train-auc:0.950608	test-auc:0.758462 
[283]	train-auc:0.950802	test-auc:0.758533 
[284]	train-auc:0.951085	test-auc:0.758553 
[285]	train-auc:0.951187	test-auc:0.758552 
[286]	train-auc:0.951673	test-auc:0.758418 
[287]	train-auc:0.951922	test-auc:0.758167 
[288]	train-auc:0.952163	test-auc:0.758180 
[289]	train-auc:0.952358	test-auc:0.758303 
[290]	train-auc:0.952593	test-auc:0.758221 
[291]	train-auc:0.952750	test-auc:0.758378 
[292]	train-auc:0.953132	test-auc:0.758222 
[293]	train-auc:0.953312	test-auc:0.758306 
[294]	train-auc:0.953522	test-auc:0.758394 
[295]	train-auc:0.953660	test-auc:0.758527 
[296]	train-auc:0.953797	test-auc:0.758570 
[297]	train-auc:0.953944	test-auc:0.758464 
[298]	train-auc:0.954111	test-auc:0.758497 
[299]	train-auc:0.954524	test-auc:0.758453 
[300]	train-auc:0.955040	test-auc:0.758380 
[301]	train-auc:0.955213	test-auc:0.758248 
[302]	train-auc:0.955592	test-auc:0.758184 
[303]	train-auc:0.955881	test-auc:0.758168 
[304]	train-auc:0.956036	test-auc:0.758252 
[305]	train-auc:0.956328	test-auc:0.758242 
[306]	train-auc:0.956441	test-auc:0.758206 
[307]	train-auc:0.956553	test-auc:0.758205 
[308]	train-auc:0.956672	test-auc:0.758287 
[309]	train-auc:0.956869	test-auc:0.758309 
[310]	train-auc:0.956944	test-auc:0.758302 
[311]	train-auc:0.956999	test-auc:0.758346 
[312]	train-auc:0.957483	test-auc:0.758388 
[313]	train-auc:0.957661	test-auc:0.758329 
[314]	train-auc:0.957822	test-auc:0.758331 
[315]	train-auc:0.957964	test-auc:0.758297 
[316]	train-auc:0.958412	test-auc:0.758435 
[317]	train-auc:0.958642	test-auc:0.758498 
[318]	train-auc:0.958834	test-auc:0.758621 
[319]	train-auc:0.958921	test-auc:0.758650 
[320]	train-auc:0.958979	test-auc:0.758666 
[321]	train-auc:0.959136	test-auc:0.758599 
[322]	train-auc:0.959376	test-auc:0.758392 
[323]	train-auc:0.959519	test-auc:0.758420 
[324]	train-auc:0.959726	test-auc:0.758392 
[325]	train-auc:0.959792	test-auc:0.758360 
[326]	train-auc:0.959895	test-auc:0.758434 
[327]	train-auc:0.959963	test-auc:0.758381 
[328]	train-auc:0.960014	test-auc:0.758290 
[329]	train-auc:0.960176	test-auc:0.758283 
[330]	train-auc:0.960261	test-auc:0.758204 
[331]	train-auc:0.960270	test-auc:0.758148 
[332]	train-auc:0.960320	test-auc:0.758080 
[333]	train-auc:0.960436	test-auc:0.758051 
[334]	train-auc:0.960623	test-auc:0.758070 
[335]	train-auc:0.960828	test-auc:0.758063 
[336]	train-auc:0.960904	test-auc:0.758017 
[337]	train-auc:0.961079	test-auc:0.758001 
[338]	train-auc:0.961349	test-auc:0.758012 
[339]	train-auc:0.961386	test-auc:0.758039 
[340]	train-auc:0.961454	test-auc:0.757994 
[341]	train-auc:0.961540	test-auc:0.757948 
[342]	train-auc:0.961592	test-auc:0.757941 
[343]	train-auc:0.961661	test-auc:0.757898 
[344]	train-auc:0.961760	test-auc:0.757874 
[345]	train-auc:0.961898	test-auc:0.757897 
[346]	train-auc:0.962018	test-auc:0.757903 
[347]	train-auc:0.962044	test-auc:0.757917 
[348]	train-auc:0.962148	test-auc:0.757887 
[349]	train-auc:0.962380	test-auc:0.758130 
[350]	train-auc:0.962492	test-auc:0.758213 
[351]	train-auc:0.962619	test-auc:0.758167 
[352]	train-auc:0.962898	test-auc:0.758144 
[353]	train-auc:0.962931	test-auc:0.758159 
[354]	train-auc:0.962995	test-auc:0.758139 
[355]	train-auc:0.963119	test-auc:0.758051 
[356]	train-auc:0.963232	test-auc:0.757974 
[357]	train-auc:0.963250	test-auc:0.757960 
[358]	train-auc:0.963283	test-auc:0.757937 
[359]	train-auc:0.963313	test-auc:0.757939 
[360]	train-auc:0.963423	test-auc:0.757883 
[361]	train-auc:0.963638	test-auc:0.757900 
[362]	train-auc:0.963773	test-auc:0.758002 
[363]	train-auc:0.963831	test-auc:0.757957 
[364]	train-auc:0.963940	test-auc:0.757972 
[365]	train-auc:0.963967	test-auc:0.757944 
[366]	train-auc:0.964096	test-auc:0.758005 
[367]	train-auc:0.964186	test-auc:0.757942 
[368]	train-auc:0.964306	test-auc:0.757965 
[369]	train-auc:0.964383	test-auc:0.757993 
[370]	train-auc:0.964419	test-auc:0.757989 
Stopping. Best iteration:
[320]	train-auc:0.958979	test-auc:0.758666




Fold 2

[1]	train-auc:0.656659	test-auc:0.660168 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.656164	test-auc:0.659982 
[3]	train-auc:0.656166	test-auc:0.659987 
[4]	train-auc:0.656463	test-auc:0.660305 
[5]	train-auc:0.658097	test-auc:0.663383 
[6]	train-auc:0.658103	test-auc:0.663388 
[7]	train-auc:0.658104	test-auc:0.663387 
[8]	train-auc:0.658105	test-auc:0.663384 
[9]	train-auc:0.658061	test-auc:0.663406 
[10]	train-auc:0.658278	test-auc:0.663222 
[11]	train-auc:0.658279	test-auc:0.663222 
[12]	train-auc:0.658280	test-auc:0.663223 
[13]	train-auc:0.659033	test-auc:0.663894 
[14]	train-auc:0.660258	test-auc:0.664607 
[15]	train-auc:0.660259	test-auc:0.664607 
[16]	train-auc:0.660260	test-auc:0.664607 
[17]	train-auc:0.660267	test-auc:0.664613 
[18]	train-auc:0.660268	test-auc:0.664613 
[19]	train-auc:0.660269	test-auc:0.664613 
[20]	train-auc:0.660326	test-auc:0.664602 
[21]	train-auc:0.660328	test-auc:0.664603 
[22]	train-auc:0.660335	test-auc:0.664617 
[23]	train-auc:0.660438	test-auc:0.664609 
[24]	train-auc:0.660413	test-auc:0.664548 
[25]	train-auc:0.660414	test-auc:0.664548 
[26]	train-auc:0.660413	test-auc:0.664548 
[27]	train-auc:0.672517	test-auc:0.679178 
[28]	train-auc:0.673184	test-auc:0.679488 
[29]	train-auc:0.673540	test-auc:0.679995 
[30]	train-auc:0.673543	test-auc:0.679996 
[31]	train-auc:0.673551	test-auc:0.679998 
[32]	train-auc:0.673554	test-auc:0.679995 
[33]	train-auc:0.673555	test-auc:0.679995 
[34]	train-auc:0.674108	test-auc:0.681136 
[35]	train-auc:0.676043	test-auc:0.681444 
[36]	train-auc:0.676043	test-auc:0.681442 
[37]	train-auc:0.676042	test-auc:0.681441 
[38]	train-auc:0.676046	test-auc:0.681444 
[39]	train-auc:0.683951	test-auc:0.688770 
[40]	train-auc:0.683966	test-auc:0.688753 
[41]	train-auc:0.684608	test-auc:0.689905 
[42]	train-auc:0.684596	test-auc:0.689927 
[43]	train-auc:0.684595	test-auc:0.689925 
[44]	train-auc:0.684667	test-auc:0.689676 
[45]	train-auc:0.684665	test-auc:0.689661 
[46]	train-auc:0.684317	test-auc:0.689277 
[47]	train-auc:0.684364	test-auc:0.689220 
[48]	train-auc:0.689008	test-auc:0.695396 
[49]	train-auc:0.689155	test-auc:0.695391 
[50]	train-auc:0.689694	test-auc:0.696397 
[51]	train-auc:0.690131	test-auc:0.695891 
[52]	train-auc:0.690575	test-auc:0.696531 
[53]	train-auc:0.690355	test-auc:0.696328 
[54]	train-auc:0.690430	test-auc:0.696282 
[55]	train-auc:0.691414	test-auc:0.696866 
[56]	train-auc:0.691488	test-auc:0.696904 
[57]	train-auc:0.692041	test-auc:0.697990 
[58]	train-auc:0.692395	test-auc:0.697998 
[59]	train-auc:0.692332	test-auc:0.697941 
[60]	train-auc:0.692786	test-auc:0.698100 
[61]	train-auc:0.692849	test-auc:0.698024 
[62]	train-auc:0.694877	test-auc:0.700684 
[63]	train-auc:0.694946	test-auc:0.700600 
[64]	train-auc:0.694960	test-auc:0.700576 
[65]	train-auc:0.695190	test-auc:0.700616 
[66]	train-auc:0.695372	test-auc:0.700566 
[67]	train-auc:0.695375	test-auc:0.700570 
[68]	train-auc:0.696979	test-auc:0.700862 
[69]	train-auc:0.696985	test-auc:0.700865 
[70]	train-auc:0.697210	test-auc:0.700839 
[71]	train-auc:0.698128	test-auc:0.702275 
[72]	train-auc:0.698177	test-auc:0.702189 
[73]	train-auc:0.698532	test-auc:0.702196 
[74]	train-auc:0.698521	test-auc:0.702170 
[75]	train-auc:0.698967	test-auc:0.702168 
[76]	train-auc:0.699113	test-auc:0.702173 
[77]	train-auc:0.699233	test-auc:0.702170 
[78]	train-auc:0.701328	test-auc:0.703718 
[79]	train-auc:0.701404	test-auc:0.703730 
[80]	train-auc:0.706036	test-auc:0.707524 
[81]	train-auc:0.706424	test-auc:0.707714 
[82]	train-auc:0.706697	test-auc:0.707822 
[83]	train-auc:0.707400	test-auc:0.708191 
[84]	train-auc:0.707447	test-auc:0.708218 
[85]	train-auc:0.708312	test-auc:0.708286 
[86]	train-auc:0.710826	test-auc:0.709306 
[87]	train-auc:0.711315	test-auc:0.709202 
[88]	train-auc:0.712061	test-auc:0.709289 
[89]	train-auc:0.711914	test-auc:0.708926 
[90]	train-auc:0.714930	test-auc:0.711131 
[91]	train-auc:0.715140	test-auc:0.711263 
[92]	train-auc:0.715399	test-auc:0.711156 
[93]	train-auc:0.715592	test-auc:0.711249 
[94]	train-auc:0.715995	test-auc:0.711569 
[95]	train-auc:0.716995	test-auc:0.712107 
[96]	train-auc:0.717909	test-auc:0.712579 
[97]	train-auc:0.718142	test-auc:0.712563 
[98]	train-auc:0.719936	test-auc:0.713089 
[99]	train-auc:0.721394	test-auc:0.713479 
[100]	train-auc:0.721754	test-auc:0.713662 
[101]	train-auc:0.722436	test-auc:0.713975 
[102]	train-auc:0.722883	test-auc:0.714254 
[103]	train-auc:0.723608	test-auc:0.714071 
[104]	train-auc:0.724475	test-auc:0.714227 
[105]	train-auc:0.724661	test-auc:0.714260 
[106]	train-auc:0.725028	test-auc:0.714739 
[107]	train-auc:0.726303	test-auc:0.714978 
[108]	train-auc:0.726764	test-auc:0.715933 
[109]	train-auc:0.728790	test-auc:0.716260 
[110]	train-auc:0.729044	test-auc:0.716016 
[111]	train-auc:0.729354	test-auc:0.716400 
[112]	train-auc:0.729617	test-auc:0.716539 
[113]	train-auc:0.733683	test-auc:0.717066 
[114]	train-auc:0.736182	test-auc:0.717009 
[115]	train-auc:0.738259	test-auc:0.717337 
[116]	train-auc:0.739757	test-auc:0.717116 
[117]	train-auc:0.742770	test-auc:0.718437 
[118]	train-auc:0.744394	test-auc:0.718695 
[119]	train-auc:0.745491	test-auc:0.719036 
[120]	train-auc:0.746196	test-auc:0.719065 
[121]	train-auc:0.746773	test-auc:0.719261 
[122]	train-auc:0.747616	test-auc:0.719206 
[123]	train-auc:0.748265	test-auc:0.719459 
[124]	train-auc:0.749239	test-auc:0.719454 
[125]	train-auc:0.749798	test-auc:0.719608 
[126]	train-auc:0.750971	test-auc:0.719922 
[127]	train-auc:0.751876	test-auc:0.720043 
[128]	train-auc:0.751960	test-auc:0.719632 
[129]	train-auc:0.753995	test-auc:0.720406 
[130]	train-auc:0.755012	test-auc:0.720715 
[131]	train-auc:0.756057	test-auc:0.720945 
[132]	train-auc:0.757148	test-auc:0.721382 
[133]	train-auc:0.757691	test-auc:0.721393 
[134]	train-auc:0.758994	test-auc:0.722376 
[135]	train-auc:0.761840	test-auc:0.723286 
[136]	train-auc:0.765275	test-auc:0.723238 
[137]	train-auc:0.766937	test-auc:0.723677 
[138]	train-auc:0.768072	test-auc:0.723649 
[139]	train-auc:0.769130	test-auc:0.724210 
[140]	train-auc:0.770294	test-auc:0.724069 
[141]	train-auc:0.771640	test-auc:0.725082 
[142]	train-auc:0.772876	test-auc:0.725533 
[143]	train-auc:0.773463	test-auc:0.725955 
[144]	train-auc:0.775165	test-auc:0.726835 
[145]	train-auc:0.776020	test-auc:0.727102 
[146]	train-auc:0.779499	test-auc:0.727966 
[147]	train-auc:0.781862	test-auc:0.729010 
[148]	train-auc:0.784341	test-auc:0.729663 
[149]	train-auc:0.785776	test-auc:0.730511 
[150]	train-auc:0.788342	test-auc:0.731645 
[151]	train-auc:0.791584	test-auc:0.731942 
[152]	train-auc:0.793497	test-auc:0.732084 
[153]	train-auc:0.794945	test-auc:0.732461 
[154]	train-auc:0.795961	test-auc:0.732393 
[155]	train-auc:0.797423	test-auc:0.732599 
[156]	train-auc:0.799053	test-auc:0.732388 
[157]	train-auc:0.800754	test-auc:0.732827 
[158]	train-auc:0.802818	test-auc:0.733265 
[159]	train-auc:0.804409	test-auc:0.733753 
[160]	train-auc:0.805420	test-auc:0.733786 
[161]	train-auc:0.806713	test-auc:0.733914 
[162]	train-auc:0.808305	test-auc:0.733874 
[163]	train-auc:0.809882	test-auc:0.733922 
[164]	train-auc:0.810679	test-auc:0.733887 
[165]	train-auc:0.812334	test-auc:0.733978 
[166]	train-auc:0.813451	test-auc:0.734384 
[167]	train-auc:0.814991	test-auc:0.734955 
[168]	train-auc:0.816364	test-auc:0.735028 
[169]	train-auc:0.817866	test-auc:0.735380 
[170]	train-auc:0.819550	test-auc:0.735499 
[171]	train-auc:0.821020	test-auc:0.735652 
[172]	train-auc:0.822564	test-auc:0.736053 
[173]	train-auc:0.823391	test-auc:0.736523 
[174]	train-auc:0.824106	test-auc:0.736458 
[175]	train-auc:0.826409	test-auc:0.737754 
[176]	train-auc:0.828687	test-auc:0.738160 
[177]	train-auc:0.830226	test-auc:0.739240 
[178]	train-auc:0.832492	test-auc:0.739737 
[179]	train-auc:0.833733	test-auc:0.740002 
[180]	train-auc:0.836302	test-auc:0.740948 
[181]	train-auc:0.838888	test-auc:0.741261 
[182]	train-auc:0.840527	test-auc:0.741538 
[183]	train-auc:0.842688	test-auc:0.742081 
[184]	train-auc:0.844293	test-auc:0.742440 
[185]	train-auc:0.846461	test-auc:0.743329 
[186]	train-auc:0.848249	test-auc:0.744153 
[187]	train-auc:0.849582	test-auc:0.744817 
[188]	train-auc:0.851402	test-auc:0.745649 
[189]	train-auc:0.852597	test-auc:0.746017 
[190]	train-auc:0.853789	test-auc:0.746285 
[191]	train-auc:0.855422	test-auc:0.746556 
[192]	train-auc:0.856731	test-auc:0.746771 
[193]	train-auc:0.857631	test-auc:0.747137 
[194]	train-auc:0.858841	test-auc:0.747415 
[195]	train-auc:0.860109	test-auc:0.747996 
[196]	train-auc:0.861312	test-auc:0.748315 
[197]	train-auc:0.862031	test-auc:0.748559 
[198]	train-auc:0.862571	test-auc:0.748693 
[199]	train-auc:0.865430	test-auc:0.749265 
[200]	train-auc:0.867721	test-auc:0.749972 
[201]	train-auc:0.869635	test-auc:0.750289 
[202]	train-auc:0.871433	test-auc:0.750799 
[203]	train-auc:0.873138	test-auc:0.750924 
[204]	train-auc:0.874785	test-auc:0.751227 
[205]	train-auc:0.875811	test-auc:0.751331 
[206]	train-auc:0.877902	test-auc:0.751937 
[207]	train-auc:0.879265	test-auc:0.752094 
[208]	train-auc:0.880981	test-auc:0.752529 
[209]	train-auc:0.882574	test-auc:0.752608 
[210]	train-auc:0.883572	test-auc:0.752564 
[211]	train-auc:0.884441	test-auc:0.752378 
[212]	train-auc:0.885933	test-auc:0.752917 
[213]	train-auc:0.887970	test-auc:0.753398 
[214]	train-auc:0.889397	test-auc:0.753660 
[215]	train-auc:0.891030	test-auc:0.754046 
[216]	train-auc:0.892534	test-auc:0.754184 
[217]	train-auc:0.893275	test-auc:0.754126 
[218]	train-auc:0.894594	test-auc:0.754318 
[219]	train-auc:0.895948	test-auc:0.754274 
[220]	train-auc:0.897171	test-auc:0.754281 
[221]	train-auc:0.898617	test-auc:0.754315 
[222]	train-auc:0.900543	test-auc:0.754570 
[223]	train-auc:0.901782	test-auc:0.755103 
[224]	train-auc:0.903293	test-auc:0.755127 
[225]	train-auc:0.903993	test-auc:0.755342 
[226]	train-auc:0.904614	test-auc:0.755432 
[227]	train-auc:0.905304	test-auc:0.755428 
[228]	train-auc:0.907011	test-auc:0.755487 
[229]	train-auc:0.908938	test-auc:0.755643 
[230]	train-auc:0.909816	test-auc:0.755692 
[231]	train-auc:0.910730	test-auc:0.756018 
[232]	train-auc:0.911524	test-auc:0.755967 
[233]	train-auc:0.912827	test-auc:0.756001 
[234]	train-auc:0.914055	test-auc:0.756066 
[235]	train-auc:0.915685	test-auc:0.756562 
[236]	train-auc:0.916874	test-auc:0.756754 
[237]	train-auc:0.918843	test-auc:0.756911 
[238]	train-auc:0.920100	test-auc:0.757017 
[239]	train-auc:0.921749	test-auc:0.757405 
[240]	train-auc:0.923269	test-auc:0.757348 
[241]	train-auc:0.924460	test-auc:0.757408 
[242]	train-auc:0.925896	test-auc:0.757376 
[243]	train-auc:0.926558	test-auc:0.757467 
[244]	train-auc:0.927720	test-auc:0.757788 
[245]	train-auc:0.928885	test-auc:0.757871 
[246]	train-auc:0.930066	test-auc:0.757782 
[247]	train-auc:0.931096	test-auc:0.757765 
[248]	train-auc:0.932647	test-auc:0.757921 
[249]	train-auc:0.933481	test-auc:0.757929 
[250]	train-auc:0.934514	test-auc:0.757992 
[251]	train-auc:0.935296	test-auc:0.757774 
[252]	train-auc:0.936445	test-auc:0.758027 
[253]	train-auc:0.937316	test-auc:0.758080 
[254]	train-auc:0.938150	test-auc:0.757960 
[255]	train-auc:0.938878	test-auc:0.758143 
[256]	train-auc:0.939749	test-auc:0.758236 
[257]	train-auc:0.940458	test-auc:0.758391 
[258]	train-auc:0.941431	test-auc:0.758514 
[259]	train-auc:0.942005	test-auc:0.758561 
[260]	train-auc:0.942994	test-auc:0.758683 
[261]	train-auc:0.943355	test-auc:0.758911 
[262]	train-auc:0.943836	test-auc:0.759044 
[263]	train-auc:0.944399	test-auc:0.759276 
[264]	train-auc:0.944979	test-auc:0.759444 
[265]	train-auc:0.946604	test-auc:0.759460 
[266]	train-auc:0.947000	test-auc:0.759720 
[267]	train-auc:0.947715	test-auc:0.759776 
[268]	train-auc:0.948900	test-auc:0.759709 
[269]	train-auc:0.949400	test-auc:0.759864 
[270]	train-auc:0.949896	test-auc:0.760039 
[271]	train-auc:0.950470	test-auc:0.760225 
[272]	train-auc:0.950796	test-auc:0.760281 
[273]	train-auc:0.951067	test-auc:0.760350 
[274]	train-auc:0.951543	test-auc:0.760448 
[275]	train-auc:0.951981	test-auc:0.760413 
[276]	train-auc:0.952294	test-auc:0.760577 
[277]	train-auc:0.952695	test-auc:0.760587 
[278]	train-auc:0.952937	test-auc:0.760498 
[279]	train-auc:0.953054	test-auc:0.760546 
[280]	train-auc:0.953272	test-auc:0.760453 
[281]	train-auc:0.953367	test-auc:0.760483 
[282]	train-auc:0.953688	test-auc:0.760683 
[283]	train-auc:0.953912	test-auc:0.760793 
[284]	train-auc:0.954426	test-auc:0.760864 
[285]	train-auc:0.954493	test-auc:0.760894 
[286]	train-auc:0.954942	test-auc:0.760900 
[287]	train-auc:0.955198	test-auc:0.760900 
[288]	train-auc:0.955579	test-auc:0.761017 
[289]	train-auc:0.955902	test-auc:0.760991 
[290]	train-auc:0.956269	test-auc:0.761197 
[291]	train-auc:0.956595	test-auc:0.761282 
[292]	train-auc:0.956723	test-auc:0.761300 
[293]	train-auc:0.957139	test-auc:0.761286 
[294]	train-auc:0.957253	test-auc:0.761419 
[295]	train-auc:0.957335	test-auc:0.761423 
[296]	train-auc:0.957464	test-auc:0.761416 
[297]	train-auc:0.957680	test-auc:0.761310 
[298]	train-auc:0.957905	test-auc:0.761357 
[299]	train-auc:0.958057	test-auc:0.761347 
[300]	train-auc:0.958194	test-auc:0.761347 
[301]	train-auc:0.958386	test-auc:0.761344 
[302]	train-auc:0.958602	test-auc:0.761470 
[303]	train-auc:0.959047	test-auc:0.761465 
[304]	train-auc:0.959161	test-auc:0.761471 
[305]	train-auc:0.959221	test-auc:0.761623 
[306]	train-auc:0.959497	test-auc:0.761564 
[307]	train-auc:0.959800	test-auc:0.761517 
[308]	train-auc:0.959959	test-auc:0.761495 
[309]	train-auc:0.960004	test-auc:0.761547 
[310]	train-auc:0.960145	test-auc:0.761647 
[311]	train-auc:0.960265	test-auc:0.761575 
[312]	train-auc:0.960508	test-auc:0.761546 
[313]	train-auc:0.960624	test-auc:0.761510 
[314]	train-auc:0.960943	test-auc:0.761531 
[315]	train-auc:0.961131	test-auc:0.761543 
[316]	train-auc:0.961535	test-auc:0.761652 
[317]	train-auc:0.961872	test-auc:0.761812 
[318]	train-auc:0.961926	test-auc:0.761733 
[319]	train-auc:0.962084	test-auc:0.761736 
[320]	train-auc:0.962165	test-auc:0.761647 
[321]	train-auc:0.962314	test-auc:0.761640 
[322]	train-auc:0.962525	test-auc:0.761855 
[323]	train-auc:0.962658	test-auc:0.761783 
[324]	train-auc:0.962828	test-auc:0.761838 
[325]	train-auc:0.962942	test-auc:0.761821 
[326]	train-auc:0.963101	test-auc:0.761873 
[327]	train-auc:0.963169	test-auc:0.761829 
[328]	train-auc:0.963333	test-auc:0.761795 
[329]	train-auc:0.963372	test-auc:0.761888 
[330]	train-auc:0.963615	test-auc:0.761833 
[331]	train-auc:0.963641	test-auc:0.761788 
[332]	train-auc:0.963734	test-auc:0.761824 
[333]	train-auc:0.963850	test-auc:0.761887 
[334]	train-auc:0.963944	test-auc:0.761907 
[335]	train-auc:0.964027	test-auc:0.761928 
[336]	train-auc:0.964144	test-auc:0.761980 
[337]	train-auc:0.964219	test-auc:0.761999 
[338]	train-auc:0.964329	test-auc:0.761966 
[339]	train-auc:0.964434	test-auc:0.762096 
[340]	train-auc:0.964556	test-auc:0.762215 
[341]	train-auc:0.964870	test-auc:0.762278 
[342]	train-auc:0.964988	test-auc:0.762319 
[343]	train-auc:0.965086	test-auc:0.762326 
[344]	train-auc:0.965218	test-auc:0.762239 
[345]	train-auc:0.965239	test-auc:0.762216 
[346]	train-auc:0.965351	test-auc:0.762215 
[347]	train-auc:0.965402	test-auc:0.762137 
[348]	train-auc:0.965478	test-auc:0.762079 
[349]	train-auc:0.965571	test-auc:0.762056 
[350]	train-auc:0.965723	test-auc:0.762141 
[351]	train-auc:0.965757	test-auc:0.762107 
[352]	train-auc:0.965900	test-auc:0.762191 
[353]	train-auc:0.966154	test-auc:0.762093 
[354]	train-auc:0.966195	test-auc:0.762131 
[355]	train-auc:0.966318	test-auc:0.762291 
[356]	train-auc:0.966470	test-auc:0.762257 
[357]	train-auc:0.966575	test-auc:0.762196 
[358]	train-auc:0.966860	test-auc:0.762247 
[359]	train-auc:0.966923	test-auc:0.762230 
[360]	train-auc:0.966936	test-auc:0.762115 
[361]	train-auc:0.967102	test-auc:0.762218 
[362]	train-auc:0.967182	test-auc:0.762299 
[363]	train-auc:0.967610	test-auc:0.762328 
[364]	train-auc:0.967660	test-auc:0.762376 
[365]	train-auc:0.967755	test-auc:0.762450 
[366]	train-auc:0.967947	test-auc:0.762479 
[367]	train-auc:0.968022	test-auc:0.762437 
[368]	train-auc:0.968069	test-auc:0.762471 
[369]	train-auc:0.968160	test-auc:0.762553 
[370]	train-auc:0.968213	test-auc:0.762643 
[371]	train-auc:0.968439	test-auc:0.762761 
[372]	train-auc:0.968490	test-auc:0.762804 
[373]	train-auc:0.968642	test-auc:0.762786 
[374]	train-auc:0.968839	test-auc:0.762962 
[375]	train-auc:0.968926	test-auc:0.762921 
[376]	train-auc:0.968961	test-auc:0.762902 
[377]	train-auc:0.969007	test-auc:0.762861 
[378]	train-auc:0.969164	test-auc:0.763035 
[379]	train-auc:0.969271	test-auc:0.763059 
[380]	train-auc:0.969471	test-auc:0.763164 
[381]	train-auc:0.969509	test-auc:0.763091 
[382]	train-auc:0.969587	test-auc:0.763038 
[383]	train-auc:0.969646	test-auc:0.763052 
[384]	train-auc:0.969769	test-auc:0.763133 
[385]	train-auc:0.969831	test-auc:0.763228 
[386]	train-auc:0.969870	test-auc:0.763200 
[387]	train-auc:0.969980	test-auc:0.763279 
[388]	train-auc:0.970274	test-auc:0.763487 
[389]	train-auc:0.970355	test-auc:0.763459 
[390]	train-auc:0.970486	test-auc:0.763490 
[391]	train-auc:0.970600	test-auc:0.763523 
[392]	train-auc:0.970665	test-auc:0.763595 
[393]	train-auc:0.970788	test-auc:0.763453 
[394]	train-auc:0.970960	test-auc:0.763469 
[395]	train-auc:0.971028	test-auc:0.763470 
[396]	train-auc:0.971138	test-auc:0.763540 
[397]	train-auc:0.971182	test-auc:0.763480 
[398]	train-auc:0.971222	test-auc:0.763473 
[399]	train-auc:0.971396	test-auc:0.763395 
[400]	train-auc:0.971455	test-auc:0.763449 
[401]	train-auc:0.971479	test-auc:0.763534 
[402]	train-auc:0.971531	test-auc:0.763542 
[403]	train-auc:0.971646	test-auc:0.763616 
[404]	train-auc:0.971884	test-auc:0.763742 
[405]	train-auc:0.971935	test-auc:0.763828 
[406]	train-auc:0.971993	test-auc:0.763884 
[407]	train-auc:0.972133	test-auc:0.763930 
[408]	train-auc:0.972250	test-auc:0.763986 
[409]	train-auc:0.972338	test-auc:0.763968 
[410]	train-auc:0.972394	test-auc:0.763951 
[411]	train-auc:0.972623	test-auc:0.764110 
[412]	train-auc:0.972647	test-auc:0.764091 
[413]	train-auc:0.972813	test-auc:0.764178 
[414]	train-auc:0.972863	test-auc:0.764268 
[415]	train-auc:0.972902	test-auc:0.764421 
[416]	train-auc:0.973048	test-auc:0.764331 
[417]	train-auc:0.973198	test-auc:0.764388 
[418]	train-auc:0.973242	test-auc:0.764422 
[419]	train-auc:0.973322	test-auc:0.764336 
[420]	train-auc:0.973407	test-auc:0.764404 
[421]	train-auc:0.973455	test-auc:0.764434 
[422]	train-auc:0.973624	test-auc:0.764451 
[423]	train-auc:0.973925	test-auc:0.764318 
[424]	train-auc:0.974042	test-auc:0.764283 
[425]	train-auc:0.974107	test-auc:0.764252 
[426]	train-auc:0.974138	test-auc:0.764239 
[427]	train-auc:0.974174	test-auc:0.764210 
[428]	train-auc:0.974298	test-auc:0.764246 
[429]	train-auc:0.974359	test-auc:0.764189 
[430]	train-auc:0.974491	test-auc:0.764156 
[431]	train-auc:0.974529	test-auc:0.764081 
[432]	train-auc:0.974593	test-auc:0.764039 
[433]	train-auc:0.974652	test-auc:0.764065 
[434]	train-auc:0.974696	test-auc:0.764102 
[435]	train-auc:0.974777	test-auc:0.764081 
[436]	train-auc:0.974927	test-auc:0.764043 
[437]	train-auc:0.974956	test-auc:0.764077 
[438]	train-auc:0.974969	test-auc:0.764122 
[439]	train-auc:0.975075	test-auc:0.764221 
[440]	train-auc:0.975174	test-auc:0.764256 
[441]	train-auc:0.975251	test-auc:0.764201 
[442]	train-auc:0.975273	test-auc:0.764184 
[443]	train-auc:0.975310	test-auc:0.764320 
[444]	train-auc:0.975424	test-auc:0.764150 
[445]	train-auc:0.975494	test-auc:0.764166 
[446]	train-auc:0.975545	test-auc:0.764131 
[447]	train-auc:0.975619	test-auc:0.764301 
[448]	train-auc:0.975679	test-auc:0.764237 
[449]	train-auc:0.975901	test-auc:0.764315 
[450]	train-auc:0.975976	test-auc:0.764364 
[451]	train-auc:0.975980	test-auc:0.764353 
[452]	train-auc:0.976042	test-auc:0.764371 
[453]	train-auc:0.976108	test-auc:0.764362 
[454]	train-auc:0.976146	test-auc:0.764392 
[455]	train-auc:0.976163	test-auc:0.764408 
[456]	train-auc:0.976226	test-auc:0.764336 
[457]	train-auc:0.976397	test-auc:0.764273 
[458]	train-auc:0.976445	test-auc:0.764275 
[459]	train-auc:0.976510	test-auc:0.764215 
[460]	train-auc:0.976556	test-auc:0.764086 
[461]	train-auc:0.976669	test-auc:0.763986 
[462]	train-auc:0.976683	test-auc:0.763990 
[463]	train-auc:0.976738	test-auc:0.764030 
[464]	train-auc:0.976781	test-auc:0.764035 
[465]	train-auc:0.976810	test-auc:0.764087 
[466]	train-auc:0.976879	test-auc:0.764035 
[467]	train-auc:0.976892	test-auc:0.764059 
[468]	train-auc:0.976923	test-auc:0.764060 
[469]	train-auc:0.976963	test-auc:0.764028 
[470]	train-auc:0.977029	test-auc:0.763935 
[471]	train-auc:0.977115	test-auc:0.763925 
[472]	train-auc:0.977131	test-auc:0.763896 
Stopping. Best iteration:
[422]	train-auc:0.973624	test-auc:0.764451




Fold 3

[1]	train-auc:0.658215	test-auc:0.659768 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.660921	test-auc:0.661243 
[3]	train-auc:0.660977	test-auc:0.661261 
[4]	train-auc:0.660973	test-auc:0.661269 
[5]	train-auc:0.660973	test-auc:0.661272 
[6]	train-auc:0.660974	test-auc:0.661270 
[7]	train-auc:0.660970	test-auc:0.661259 
[8]	train-auc:0.661459	test-auc:0.661836 
[9]	train-auc:0.661460	test-auc:0.661838 
[10]	train-auc:0.661461	test-auc:0.661837 
[11]	train-auc:0.661384	test-auc:0.661622 
[12]	train-auc:0.661384	test-auc:0.661623 
[13]	train-auc:0.661385	test-auc:0.661624 
[14]	train-auc:0.661387	test-auc:0.661625 
[15]	train-auc:0.661389	test-auc:0.661614 
[16]	train-auc:0.661387	test-auc:0.661609 
[17]	train-auc:0.661387	test-auc:0.661609 
[18]	train-auc:0.661582	test-auc:0.661410 
[19]	train-auc:0.661436	test-auc:0.661518 
[20]	train-auc:0.661597	test-auc:0.660396 
[21]	train-auc:0.661604	test-auc:0.660390 
[22]	train-auc:0.661599	test-auc:0.660374 
[23]	train-auc:0.661900	test-auc:0.660367 
[24]	train-auc:0.662029	test-auc:0.660363 
[25]	train-auc:0.662000	test-auc:0.660302 
[26]	train-auc:0.662000	test-auc:0.660297 
[27]	train-auc:0.662103	test-auc:0.660289 
[28]	train-auc:0.662106	test-auc:0.660289 
[29]	train-auc:0.662107	test-auc:0.660289 
[30]	train-auc:0.662107	test-auc:0.660289 
[31]	train-auc:0.676078	test-auc:0.670726 
[32]	train-auc:0.676078	test-auc:0.670727 
[33]	train-auc:0.676079	test-auc:0.670727 
[34]	train-auc:0.676602	test-auc:0.670706 
[35]	train-auc:0.676603	test-auc:0.670700 
[36]	train-auc:0.676606	test-auc:0.670707 
[37]	train-auc:0.676602	test-auc:0.670718 
[38]	train-auc:0.676603	test-auc:0.670716 
[39]	train-auc:0.676603	test-auc:0.670717 
[40]	train-auc:0.676777	test-auc:0.670709 
[41]	train-auc:0.676830	test-auc:0.670475 
[42]	train-auc:0.676819	test-auc:0.670466 
[43]	train-auc:0.676820	test-auc:0.670466 
[44]	train-auc:0.676812	test-auc:0.670457 
[45]	train-auc:0.676812	test-auc:0.670457 
[46]	train-auc:0.677050	test-auc:0.670940 
[47]	train-auc:0.677769	test-auc:0.671436 
[48]	train-auc:0.677761	test-auc:0.671430 
[49]	train-auc:0.678848	test-auc:0.671341 
[50]	train-auc:0.678853	test-auc:0.671293 
[51]	train-auc:0.679087	test-auc:0.671781 
[52]	train-auc:0.679088	test-auc:0.671782 
[53]	train-auc:0.679123	test-auc:0.671827 
[54]	train-auc:0.679250	test-auc:0.672054 
[55]	train-auc:0.679285	test-auc:0.672127 
[56]	train-auc:0.680145	test-auc:0.674017 
[57]	train-auc:0.679874	test-auc:0.671734 
[58]	train-auc:0.680681	test-auc:0.673426 
[59]	train-auc:0.680779	test-auc:0.673415 
[60]	train-auc:0.685952	test-auc:0.678409 
[61]	train-auc:0.685942	test-auc:0.678382 
[62]	train-auc:0.686357	test-auc:0.678704 
[63]	train-auc:0.700288	test-auc:0.686155 
[64]	train-auc:0.700267	test-auc:0.686138 
[65]	train-auc:0.700370	test-auc:0.686146 
[66]	train-auc:0.700481	test-auc:0.686126 
[67]	train-auc:0.700596	test-auc:0.686110 
[68]	train-auc:0.700789	test-auc:0.686091 
[69]	train-auc:0.701945	test-auc:0.686725 
[70]	train-auc:0.702060	test-auc:0.686821 
[71]	train-auc:0.702072	test-auc:0.687035 
[72]	train-auc:0.702072	test-auc:0.687571 
[73]	train-auc:0.702641	test-auc:0.688022 
[74]	train-auc:0.702787	test-auc:0.688385 
[75]	train-auc:0.702755	test-auc:0.688409 
[76]	train-auc:0.702758	test-auc:0.688417 
[77]	train-auc:0.703123	test-auc:0.688692 
[78]	train-auc:0.705653	test-auc:0.689542 
[79]	train-auc:0.706148	test-auc:0.689444 
[80]	train-auc:0.709456	test-auc:0.689848 
[81]	train-auc:0.709766	test-auc:0.689502 
[82]	train-auc:0.709877	test-auc:0.689514 
[83]	train-auc:0.710277	test-auc:0.689454 
[84]	train-auc:0.710196	test-auc:0.689239 
[85]	train-auc:0.710277	test-auc:0.689049 
[86]	train-auc:0.710408	test-auc:0.689020 
[87]	train-auc:0.710568	test-auc:0.689094 
[88]	train-auc:0.712095	test-auc:0.689152 
[89]	train-auc:0.712763	test-auc:0.689256 
[90]	train-auc:0.717913	test-auc:0.691010 
[91]	train-auc:0.718126	test-auc:0.691053 
[92]	train-auc:0.718830	test-auc:0.691621 
[93]	train-auc:0.719345	test-auc:0.692064 
[94]	train-auc:0.719872	test-auc:0.692100 
[95]	train-auc:0.721049	test-auc:0.691871 
[96]	train-auc:0.724569	test-auc:0.693871 
[97]	train-auc:0.727481	test-auc:0.694953 
[98]	train-auc:0.727560	test-auc:0.695349 
[99]	train-auc:0.728306	test-auc:0.695227 
[100]	train-auc:0.729267	test-auc:0.695927 
[101]	train-auc:0.730388	test-auc:0.696310 
[102]	train-auc:0.732074	test-auc:0.697251 
[103]	train-auc:0.733885	test-auc:0.698364 
[104]	train-auc:0.734571	test-auc:0.698368 
[105]	train-auc:0.734934	test-auc:0.698478 
[106]	train-auc:0.735923	test-auc:0.698884 
[107]	train-auc:0.736052	test-auc:0.698951 
[108]	train-auc:0.736313	test-auc:0.698844 
[109]	train-auc:0.737368	test-auc:0.699083 
[110]	train-auc:0.737945	test-auc:0.698867 
[111]	train-auc:0.740431	test-auc:0.699215 
[112]	train-auc:0.741552	test-auc:0.699243 
[113]	train-auc:0.742069	test-auc:0.699323 
[114]	train-auc:0.742613	test-auc:0.699385 
[115]	train-auc:0.744747	test-auc:0.701242 
[116]	train-auc:0.745787	test-auc:0.701491 
[117]	train-auc:0.746329	test-auc:0.701593 
[118]	train-auc:0.746735	test-auc:0.701643 
[119]	train-auc:0.747103	test-auc:0.701907 
[120]	train-auc:0.748268	test-auc:0.702289 
[121]	train-auc:0.749190	test-auc:0.703383 
[122]	train-auc:0.749737	test-auc:0.703210 
[123]	train-auc:0.751057	test-auc:0.703824 
[124]	train-auc:0.751542	test-auc:0.703570 
[125]	train-auc:0.752647	test-auc:0.704012 
[126]	train-auc:0.753988	test-auc:0.704304 
[127]	train-auc:0.754921	test-auc:0.705044 
[128]	train-auc:0.755485	test-auc:0.704983 
[129]	train-auc:0.757252	test-auc:0.707413 
[130]	train-auc:0.758233	test-auc:0.707839 
[131]	train-auc:0.759043	test-auc:0.708451 
[132]	train-auc:0.759691	test-auc:0.708561 
[133]	train-auc:0.760777	test-auc:0.709337 
[134]	train-auc:0.763034	test-auc:0.710516 
[135]	train-auc:0.764587	test-auc:0.711005 
[136]	train-auc:0.765555	test-auc:0.711920 
[137]	train-auc:0.766856	test-auc:0.712972 
[138]	train-auc:0.770391	test-auc:0.715204 
[139]	train-auc:0.771402	test-auc:0.715839 
[140]	train-auc:0.772555	test-auc:0.715944 
[141]	train-auc:0.775543	test-auc:0.717840 
[142]	train-auc:0.778153	test-auc:0.719640 
[143]	train-auc:0.779720	test-auc:0.720679 
[144]	train-auc:0.781431	test-auc:0.721076 
[145]	train-auc:0.783746	test-auc:0.721622 
[146]	train-auc:0.784840	test-auc:0.721840 
[147]	train-auc:0.786439	test-auc:0.721830 
[148]	train-auc:0.787382	test-auc:0.722063 
[149]	train-auc:0.788835	test-auc:0.722290 
[150]	train-auc:0.789444	test-auc:0.720487 
[151]	train-auc:0.790609	test-auc:0.721104 
[152]	train-auc:0.792466	test-auc:0.721502 
[153]	train-auc:0.793748	test-auc:0.722118 
[154]	train-auc:0.795440	test-auc:0.722503 
[155]	train-auc:0.796333	test-auc:0.722370 
[156]	train-auc:0.797338	test-auc:0.722272 
[157]	train-auc:0.799055	test-auc:0.722301 
[158]	train-auc:0.799751	test-auc:0.722533 
[159]	train-auc:0.801236	test-auc:0.723035 
[160]	train-auc:0.803036	test-auc:0.723746 
[161]	train-auc:0.803943	test-auc:0.724266 
[162]	train-auc:0.804960	test-auc:0.724493 
[163]	train-auc:0.806358	test-auc:0.725037 
[164]	train-auc:0.807470	test-auc:0.725744 
[165]	train-auc:0.809791	test-auc:0.726093 
[166]	train-auc:0.812507	test-auc:0.726617 
[167]	train-auc:0.814442	test-auc:0.726976 
[168]	train-auc:0.816605	test-auc:0.727465 
[169]	train-auc:0.818705	test-auc:0.727537 
[170]	train-auc:0.820764	test-auc:0.727984 
[171]	train-auc:0.822640	test-auc:0.728123 
[172]	train-auc:0.824783	test-auc:0.728799 
[173]	train-auc:0.826227	test-auc:0.729394 
[174]	train-auc:0.828200	test-auc:0.729733 
[175]	train-auc:0.829509	test-auc:0.729910 
[176]	train-auc:0.830560	test-auc:0.730360 
[177]	train-auc:0.832194	test-auc:0.730609 
[178]	train-auc:0.833389	test-auc:0.731276 
[179]	train-auc:0.834081	test-auc:0.731230 
[180]	train-auc:0.835427	test-auc:0.731848 
[181]	train-auc:0.837084	test-auc:0.732571 
[182]	train-auc:0.840312	test-auc:0.733419 
[183]	train-auc:0.842820	test-auc:0.734169 
[184]	train-auc:0.844991	test-auc:0.734845 
[185]	train-auc:0.847368	test-auc:0.735319 
[186]	train-auc:0.849390	test-auc:0.735831 
[187]	train-auc:0.851570	test-auc:0.736751 
[188]	train-auc:0.853401	test-auc:0.737546 
[189]	train-auc:0.855133	test-auc:0.737453 
[190]	train-auc:0.856779	test-auc:0.738112 
[191]	train-auc:0.858298	test-auc:0.738511 
[192]	train-auc:0.859960	test-auc:0.738797 
[193]	train-auc:0.861139	test-auc:0.738831 
[194]	train-auc:0.862725	test-auc:0.738959 
[195]	train-auc:0.864001	test-auc:0.739416 
[196]	train-auc:0.865488	test-auc:0.739459 
[197]	train-auc:0.867010	test-auc:0.739474 
[198]	train-auc:0.868033	test-auc:0.739525 
[199]	train-auc:0.869161	test-auc:0.740119 
[200]	train-auc:0.870003	test-auc:0.740118 
[201]	train-auc:0.870869	test-auc:0.740242 
[202]	train-auc:0.872036	test-auc:0.740442 
[203]	train-auc:0.873321	test-auc:0.740976 
[204]	train-auc:0.874519	test-auc:0.741375 
[205]	train-auc:0.876124	test-auc:0.741345 
[206]	train-auc:0.877250	test-auc:0.741712 
[207]	train-auc:0.878195	test-auc:0.741939 
[208]	train-auc:0.878963	test-auc:0.741929 
[209]	train-auc:0.879862	test-auc:0.742249 
[210]	train-auc:0.880698	test-auc:0.742083 
[211]	train-auc:0.881818	test-auc:0.742464 
[212]	train-auc:0.883015	test-auc:0.742672 
[213]	train-auc:0.883713	test-auc:0.742680 
[214]	train-auc:0.884834	test-auc:0.742590 
[215]	train-auc:0.885539	test-auc:0.742518 
[216]	train-auc:0.886760	test-auc:0.743055 
[217]	train-auc:0.887867	test-auc:0.743294 
[218]	train-auc:0.888918	test-auc:0.743365 
[219]	train-auc:0.889959	test-auc:0.743176 
[220]	train-auc:0.891277	test-auc:0.743087 
[221]	train-auc:0.892434	test-auc:0.743272 
[222]	train-auc:0.893632	test-auc:0.743599 
[223]	train-auc:0.894414	test-auc:0.743699 
[224]	train-auc:0.896508	test-auc:0.744062 
[225]	train-auc:0.897862	test-auc:0.744075 
[226]	train-auc:0.898646	test-auc:0.744097 
[227]	train-auc:0.899711	test-auc:0.743879 
[228]	train-auc:0.901742	test-auc:0.744117 
[229]	train-auc:0.902630	test-auc:0.744284 
[230]	train-auc:0.903244	test-auc:0.744664 
[231]	train-auc:0.904353	test-auc:0.745056 
[232]	train-auc:0.905446	test-auc:0.745200 
[233]	train-auc:0.906535	test-auc:0.745284 
[234]	train-auc:0.906996	test-auc:0.745392 
[235]	train-auc:0.907698	test-auc:0.745376 
[236]	train-auc:0.909033	test-auc:0.745549 
[237]	train-auc:0.909830	test-auc:0.745729 
[238]	train-auc:0.910624	test-auc:0.745898 
[239]	train-auc:0.911855	test-auc:0.746196 
[240]	train-auc:0.912201	test-auc:0.746209 
[241]	train-auc:0.912767	test-auc:0.746081 
[242]	train-auc:0.914300	test-auc:0.746239 
[243]	train-auc:0.915750	test-auc:0.746368 
[244]	train-auc:0.916721	test-auc:0.746542 
[245]	train-auc:0.917248	test-auc:0.746523 
[246]	train-auc:0.917744	test-auc:0.746634 
[247]	train-auc:0.918708	test-auc:0.746992 
[248]	train-auc:0.919716	test-auc:0.746958 
[249]	train-auc:0.920183	test-auc:0.747080 
[250]	train-auc:0.920571	test-auc:0.747279 
[251]	train-auc:0.921885	test-auc:0.747259 
[252]	train-auc:0.923058	test-auc:0.747544 
[253]	train-auc:0.924105	test-auc:0.747492 
[254]	train-auc:0.924783	test-auc:0.747574 
[255]	train-auc:0.926101	test-auc:0.747645 
[256]	train-auc:0.926388	test-auc:0.747584 
[257]	train-auc:0.927216	test-auc:0.747680 
[258]	train-auc:0.927754	test-auc:0.747719 
[259]	train-auc:0.928531	test-auc:0.747688 
[260]	train-auc:0.929340	test-auc:0.747978 
[261]	train-auc:0.930077	test-auc:0.747831 
[262]	train-auc:0.930683	test-auc:0.747875 
[263]	train-auc:0.931674	test-auc:0.747745 
[264]	train-auc:0.932238	test-auc:0.747793 
[265]	train-auc:0.932975	test-auc:0.748055 
[266]	train-auc:0.933943	test-auc:0.748288 
[267]	train-auc:0.934852	test-auc:0.748231 
[268]	train-auc:0.935645	test-auc:0.748384 
[269]	train-auc:0.936255	test-auc:0.748270 
[270]	train-auc:0.936703	test-auc:0.748312 
[271]	train-auc:0.937010	test-auc:0.748323 
[272]	train-auc:0.937312	test-auc:0.748322 
[273]	train-auc:0.937622	test-auc:0.748437 
[274]	train-auc:0.938044	test-auc:0.748443 
[275]	train-auc:0.938693	test-auc:0.748602 
[276]	train-auc:0.939355	test-auc:0.748840 
[277]	train-auc:0.939777	test-auc:0.748920 
[278]	train-auc:0.940139	test-auc:0.748992 
[279]	train-auc:0.940869	test-auc:0.749182 
[280]	train-auc:0.941107	test-auc:0.748969 
[281]	train-auc:0.941371	test-auc:0.748915 
[282]	train-auc:0.941665	test-auc:0.748829 
[283]	train-auc:0.941929	test-auc:0.748782 
[284]	train-auc:0.942172	test-auc:0.748926 
[285]	train-auc:0.942238	test-auc:0.748947 
[286]	train-auc:0.942451	test-auc:0.749061 
[287]	train-auc:0.942595	test-auc:0.748831 
[288]	train-auc:0.942796	test-auc:0.748850 
[289]	train-auc:0.943038	test-auc:0.748974 
[290]	train-auc:0.943417	test-auc:0.748888 
[291]	train-auc:0.943635	test-auc:0.748899 
[292]	train-auc:0.943774	test-auc:0.748918 
[293]	train-auc:0.944054	test-auc:0.748782 
[294]	train-auc:0.944142	test-auc:0.748791 
[295]	train-auc:0.944401	test-auc:0.748701 
[296]	train-auc:0.944674	test-auc:0.748617 
[297]	train-auc:0.944738	test-auc:0.748644 
[298]	train-auc:0.944804	test-auc:0.748571 
[299]	train-auc:0.944817	test-auc:0.748528 
[300]	train-auc:0.945148	test-auc:0.748452 
[301]	train-auc:0.945567	test-auc:0.748492 
[302]	train-auc:0.945656	test-auc:0.748518 
[303]	train-auc:0.945978	test-auc:0.748561 
[304]	train-auc:0.946319	test-auc:0.748355 
[305]	train-auc:0.946626	test-auc:0.748199 
[306]	train-auc:0.946709	test-auc:0.748164 
[307]	train-auc:0.946785	test-auc:0.748172 
[308]	train-auc:0.946906	test-auc:0.748056 
[309]	train-auc:0.947013	test-auc:0.748135 
[310]	train-auc:0.947245	test-auc:0.748045 
[311]	train-auc:0.947333	test-auc:0.748111 
[312]	train-auc:0.947450	test-auc:0.747972 
[313]	train-auc:0.947568	test-auc:0.747964 
[314]	train-auc:0.947620	test-auc:0.747858 
[315]	train-auc:0.947811	test-auc:0.747827 
[316]	train-auc:0.947961	test-auc:0.747857 
[317]	train-auc:0.948246	test-auc:0.748006 
[318]	train-auc:0.948285	test-auc:0.747963 
[319]	train-auc:0.948731	test-auc:0.747770 
[320]	train-auc:0.948872	test-auc:0.747863 
[321]	train-auc:0.948903	test-auc:0.747769 
[322]	train-auc:0.949087	test-auc:0.747647 
[323]	train-auc:0.949407	test-auc:0.747713 
[324]	train-auc:0.949534	test-auc:0.747642 
[325]	train-auc:0.949742	test-auc:0.747562 
[326]	train-auc:0.949816	test-auc:0.747552 
[327]	train-auc:0.949857	test-auc:0.747576 
[328]	train-auc:0.950011	test-auc:0.747634 
[329]	train-auc:0.950372	test-auc:0.747818 
Stopping. Best iteration:
[279]	train-auc:0.940869	test-auc:0.749182




Fold 4

[1]	train-auc:0.657345	test-auc:0.646007 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657896	test-auc:0.648411 
[3]	train-auc:0.657902	test-auc:0.648413 
[4]	train-auc:0.658144	test-auc:0.647740 
[5]	train-auc:0.658145	test-auc:0.647741 
[6]	train-auc:0.663330	test-auc:0.650247 
[7]	train-auc:0.663343	test-auc:0.650228 
[8]	train-auc:0.663336	test-auc:0.650251 
[9]	train-auc:0.663345	test-auc:0.650228 
[10]	train-auc:0.663346	test-auc:0.650228 
[11]	train-auc:0.663453	test-auc:0.650634 
[12]	train-auc:0.663449	test-auc:0.650630 
[13]	train-auc:0.663449	test-auc:0.650631 
[14]	train-auc:0.663450	test-auc:0.650631 
[15]	train-auc:0.676675	test-auc:0.661956 
[16]	train-auc:0.676677	test-auc:0.661955 
[17]	train-auc:0.676678	test-auc:0.661955 
[18]	train-auc:0.676992	test-auc:0.662391 
[19]	train-auc:0.677098	test-auc:0.662385 
[20]	train-auc:0.677098	test-auc:0.662383 
[21]	train-auc:0.677099	test-auc:0.662383 
[22]	train-auc:0.677101	test-auc:0.662383 
[23]	train-auc:0.677143	test-auc:0.662381 
[24]	train-auc:0.677144	test-auc:0.662381 
[25]	train-auc:0.677145	test-auc:0.662381 
[26]	train-auc:0.677145	test-auc:0.662382 
[27]	train-auc:0.677351	test-auc:0.662363 
[28]	train-auc:0.677350	test-auc:0.662355 
[29]	train-auc:0.677351	test-auc:0.662356 
[30]	train-auc:0.677344	test-auc:0.662354 
[31]	train-auc:0.677344	test-auc:0.662351 
[32]	train-auc:0.678108	test-auc:0.664447 
[33]	train-auc:0.678110	test-auc:0.664450 
[34]	train-auc:0.678110	test-auc:0.664450 
[35]	train-auc:0.678115	test-auc:0.664458 
[36]	train-auc:0.678254	test-auc:0.664459 
[37]	train-auc:0.678396	test-auc:0.664440 
[38]	train-auc:0.678397	test-auc:0.664436 
[39]	train-auc:0.678498	test-auc:0.664437 
[40]	train-auc:0.678490	test-auc:0.664429 
[41]	train-auc:0.679646	test-auc:0.665367 
[42]	train-auc:0.679647	test-auc:0.665361 
[43]	train-auc:0.679648	test-auc:0.665362 
[44]	train-auc:0.679728	test-auc:0.664882 
[45]	train-auc:0.679724	test-auc:0.664872 
[46]	train-auc:0.679864	test-auc:0.664861 
[47]	train-auc:0.679919	test-auc:0.664830 
[48]	train-auc:0.679920	test-auc:0.664830 
[49]	train-auc:0.691394	test-auc:0.678009 
[50]	train-auc:0.692704	test-auc:0.678507 
[51]	train-auc:0.693998	test-auc:0.679118 
[52]	train-auc:0.694417	test-auc:0.679628 
[53]	train-auc:0.696974	test-auc:0.681849 
[54]	train-auc:0.697789	test-auc:0.682181 
[55]	train-auc:0.698183	test-auc:0.682179 
[56]	train-auc:0.698317	test-auc:0.682138 
[57]	train-auc:0.698318	test-auc:0.682136 
[58]	train-auc:0.698403	test-auc:0.682136 
[59]	train-auc:0.698405	test-auc:0.682136 
[60]	train-auc:0.702592	test-auc:0.685102 
[61]	train-auc:0.702766	test-auc:0.684874 
[62]	train-auc:0.702779	test-auc:0.684881 
[63]	train-auc:0.703039	test-auc:0.684849 
[64]	train-auc:0.703043	test-auc:0.684849 
[65]	train-auc:0.703974	test-auc:0.684782 
[66]	train-auc:0.704016	test-auc:0.684772 
[67]	train-auc:0.703988	test-auc:0.684774 
[68]	train-auc:0.704014	test-auc:0.685088 
[69]	train-auc:0.705773	test-auc:0.685771 
[70]	train-auc:0.705986	test-auc:0.685783 
[71]	train-auc:0.706279	test-auc:0.685804 
[72]	train-auc:0.706640	test-auc:0.685800 
[73]	train-auc:0.707453	test-auc:0.686825 
[74]	train-auc:0.707474	test-auc:0.686861 
[75]	train-auc:0.707437	test-auc:0.686764 
[76]	train-auc:0.707631	test-auc:0.686965 
[77]	train-auc:0.707684	test-auc:0.687174 
[78]	train-auc:0.717020	test-auc:0.694260 
[79]	train-auc:0.717886	test-auc:0.695789 
[80]	train-auc:0.718207	test-auc:0.696019 
[81]	train-auc:0.720107	test-auc:0.696742 
[82]	train-auc:0.720646	test-auc:0.696695 
[83]	train-auc:0.720784	test-auc:0.696627 
[84]	train-auc:0.720801	test-auc:0.696634 
[85]	train-auc:0.720866	test-auc:0.696562 
[86]	train-auc:0.720933	test-auc:0.696620 
[87]	train-auc:0.722202	test-auc:0.697802 
[88]	train-auc:0.722433	test-auc:0.697890 
[89]	train-auc:0.723711	test-auc:0.698401 
[90]	train-auc:0.724278	test-auc:0.698428 
[91]	train-auc:0.728630	test-auc:0.700409 
[92]	train-auc:0.729510	test-auc:0.700958 
[93]	train-auc:0.729727	test-auc:0.701094 
[94]	train-auc:0.729799	test-auc:0.701140 
[95]	train-auc:0.730194	test-auc:0.701334 
[96]	train-auc:0.731178	test-auc:0.702187 
[97]	train-auc:0.731217	test-auc:0.702265 
[98]	train-auc:0.731465	test-auc:0.702639 
[99]	train-auc:0.731959	test-auc:0.702677 
[100]	train-auc:0.733753	test-auc:0.703564 
[101]	train-auc:0.734472	test-auc:0.703812 
[102]	train-auc:0.735382	test-auc:0.704402 
[103]	train-auc:0.736408	test-auc:0.705069 
[104]	train-auc:0.737489	test-auc:0.705783 
[105]	train-auc:0.738147	test-auc:0.706119 
[106]	train-auc:0.738767	test-auc:0.706199 
[107]	train-auc:0.739058	test-auc:0.706155 
[108]	train-auc:0.739410	test-auc:0.706066 
[109]	train-auc:0.740349	test-auc:0.706424 
[110]	train-auc:0.741337	test-auc:0.706384 
[111]	train-auc:0.741970	test-auc:0.706082 
[112]	train-auc:0.742894	test-auc:0.706491 
[113]	train-auc:0.744234	test-auc:0.707114 
[114]	train-auc:0.744780	test-auc:0.707555 
[115]	train-auc:0.745494	test-auc:0.707996 
[116]	train-auc:0.746154	test-auc:0.708028 
[117]	train-auc:0.746908	test-auc:0.709088 
[118]	train-auc:0.747563	test-auc:0.708210 
[119]	train-auc:0.748323	test-auc:0.708644 
[120]	train-auc:0.749340	test-auc:0.709305 
[121]	train-auc:0.750510	test-auc:0.709491 
[122]	train-auc:0.751181	test-auc:0.709599 
[123]	train-auc:0.751747	test-auc:0.709710 
[124]	train-auc:0.753111	test-auc:0.710606 
[125]	train-auc:0.753687	test-auc:0.710895 
[126]	train-auc:0.757465	test-auc:0.712985 
[127]	train-auc:0.759142	test-auc:0.713442 
[128]	train-auc:0.760427	test-auc:0.713571 
[129]	train-auc:0.761590	test-auc:0.713345 
[130]	train-auc:0.762320	test-auc:0.713241 
[131]	train-auc:0.763807	test-auc:0.714095 
[132]	train-auc:0.764707	test-auc:0.713984 
[133]	train-auc:0.765730	test-auc:0.714537 
[134]	train-auc:0.766549	test-auc:0.714898 
[135]	train-auc:0.767428	test-auc:0.715091 
[136]	train-auc:0.768231	test-auc:0.715699 
[137]	train-auc:0.768745	test-auc:0.716071 
[138]	train-auc:0.769375	test-auc:0.716704 
[139]	train-auc:0.770301	test-auc:0.717230 
[140]	train-auc:0.771397	test-auc:0.717210 
[141]	train-auc:0.772246	test-auc:0.717532 
[142]	train-auc:0.772745	test-auc:0.717614 
[143]	train-auc:0.773383	test-auc:0.717631 
[144]	train-auc:0.774648	test-auc:0.717765 
[145]	train-auc:0.775231	test-auc:0.717853 
[146]	train-auc:0.777376	test-auc:0.718832 
[147]	train-auc:0.779073	test-auc:0.719309 
[148]	train-auc:0.780307	test-auc:0.719925 
[149]	train-auc:0.782006	test-auc:0.720370 
[150]	train-auc:0.783480	test-auc:0.720578 
[151]	train-auc:0.784277	test-auc:0.720596 
[152]	train-auc:0.786519	test-auc:0.720971 
[153]	train-auc:0.788459	test-auc:0.721718 
[154]	train-auc:0.789604	test-auc:0.721909 
[155]	train-auc:0.791140	test-auc:0.722233 
[156]	train-auc:0.792652	test-auc:0.722417 
[157]	train-auc:0.795177	test-auc:0.722816 
[158]	train-auc:0.796835	test-auc:0.722766 
[159]	train-auc:0.799278	test-auc:0.722991 
[160]	train-auc:0.801825	test-auc:0.723446 
[161]	train-auc:0.803449	test-auc:0.723690 
[162]	train-auc:0.806022	test-auc:0.724392 
[163]	train-auc:0.808570	test-auc:0.724777 
[164]	train-auc:0.810621	test-auc:0.725135 
[165]	train-auc:0.812625	test-auc:0.725174 
[166]	train-auc:0.814838	test-auc:0.725421 
[167]	train-auc:0.816844	test-auc:0.725803 
[168]	train-auc:0.818618	test-auc:0.725887 
[169]	train-auc:0.820217	test-auc:0.726029 
[170]	train-auc:0.822284	test-auc:0.725993 
[171]	train-auc:0.823624	test-auc:0.726144 
[172]	train-auc:0.825248	test-auc:0.726130 
[173]	train-auc:0.826613	test-auc:0.726140 
[174]	train-auc:0.828000	test-auc:0.726289 
[175]	train-auc:0.829580	test-auc:0.727329 
[176]	train-auc:0.831349	test-auc:0.728009 
[177]	train-auc:0.832938	test-auc:0.729010 
[178]	train-auc:0.834571	test-auc:0.729707 
[179]	train-auc:0.836282	test-auc:0.730694 
[180]	train-auc:0.838172	test-auc:0.731176 
[181]	train-auc:0.839797	test-auc:0.731611 
[182]	train-auc:0.841024	test-auc:0.731746 
[183]	train-auc:0.842814	test-auc:0.732547 
[184]	train-auc:0.844119	test-auc:0.733907 
[185]	train-auc:0.845421	test-auc:0.734678 
[186]	train-auc:0.846759	test-auc:0.735141 
[187]	train-auc:0.848888	test-auc:0.735828 
[188]	train-auc:0.850171	test-auc:0.736460 
[189]	train-auc:0.851761	test-auc:0.736640 
[190]	train-auc:0.853173	test-auc:0.737061 
[191]	train-auc:0.854493	test-auc:0.737393 
[192]	train-auc:0.855853	test-auc:0.737882 
[193]	train-auc:0.857872	test-auc:0.738209 
[194]	train-auc:0.859859	test-auc:0.738555 
[195]	train-auc:0.861139	test-auc:0.738635 
[196]	train-auc:0.863442	test-auc:0.739404 
[197]	train-auc:0.865173	test-auc:0.739987 
[198]	train-auc:0.867423	test-auc:0.740659 
[199]	train-auc:0.869219	test-auc:0.740977 
[200]	train-auc:0.870818	test-auc:0.741267 
[201]	train-auc:0.872809	test-auc:0.741680 
[202]	train-auc:0.874528	test-auc:0.741777 
[203]	train-auc:0.876277	test-auc:0.742156 
[204]	train-auc:0.877504	test-auc:0.742531 
[205]	train-auc:0.879366	test-auc:0.742947 
[206]	train-auc:0.881240	test-auc:0.743176 
[207]	train-auc:0.882254	test-auc:0.743597 
[208]	train-auc:0.883115	test-auc:0.744174 
[209]	train-auc:0.884667	test-auc:0.744539 
[210]	train-auc:0.886669	test-auc:0.744737 
[211]	train-auc:0.887717	test-auc:0.744995 
[212]	train-auc:0.888746	test-auc:0.745093 
[213]	train-auc:0.890265	test-auc:0.745455 
[214]	train-auc:0.891677	test-auc:0.745659 
[215]	train-auc:0.892902	test-auc:0.745815 
[216]	train-auc:0.894166	test-auc:0.746010 
[217]	train-auc:0.895467	test-auc:0.745886 
[218]	train-auc:0.896475	test-auc:0.746134 
[219]	train-auc:0.897415	test-auc:0.745996 
[220]	train-auc:0.898680	test-auc:0.746068 
[221]	train-auc:0.899990	test-auc:0.746187 
[222]	train-auc:0.901178	test-auc:0.746131 
[223]	train-auc:0.902023	test-auc:0.746324 
[224]	train-auc:0.903166	test-auc:0.746710 
[225]	train-auc:0.904082	test-auc:0.746784 
[226]	train-auc:0.904941	test-auc:0.746862 
[227]	train-auc:0.906060	test-auc:0.746942 
[228]	train-auc:0.907138	test-auc:0.747129 
[229]	train-auc:0.908400	test-auc:0.747018 
[230]	train-auc:0.909341	test-auc:0.747169 
[231]	train-auc:0.911639	test-auc:0.747169 
[232]	train-auc:0.912823	test-auc:0.747680 
[233]	train-auc:0.914602	test-auc:0.747700 
[234]	train-auc:0.915666	test-auc:0.747848 
[235]	train-auc:0.917529	test-auc:0.747744 
[236]	train-auc:0.918057	test-auc:0.748010 
[237]	train-auc:0.919102	test-auc:0.747989 
[238]	train-auc:0.920458	test-auc:0.747982 
[239]	train-auc:0.921741	test-auc:0.748029 
[240]	train-auc:0.922746	test-auc:0.748224 
[241]	train-auc:0.923275	test-auc:0.748446 
[242]	train-auc:0.924154	test-auc:0.748298 
[243]	train-auc:0.925361	test-auc:0.748042 
[244]	train-auc:0.926170	test-auc:0.748160 
[245]	train-auc:0.926784	test-auc:0.748276 
[246]	train-auc:0.927356	test-auc:0.748318 
[247]	train-auc:0.928211	test-auc:0.748192 
[248]	train-auc:0.928823	test-auc:0.748281 
[249]	train-auc:0.929382	test-auc:0.748603 
[250]	train-auc:0.930488	test-auc:0.748785 
[251]	train-auc:0.931141	test-auc:0.748741 
[252]	train-auc:0.932049	test-auc:0.748689 
[253]	train-auc:0.932843	test-auc:0.748942 
[254]	train-auc:0.933923	test-auc:0.749086 
[255]	train-auc:0.934848	test-auc:0.749225 
[256]	train-auc:0.935502	test-auc:0.749501 
[257]	train-auc:0.936400	test-auc:0.749405 
[258]	train-auc:0.936922	test-auc:0.749617 
[259]	train-auc:0.938333	test-auc:0.749727 
[260]	train-auc:0.938836	test-auc:0.749691 
[261]	train-auc:0.939726	test-auc:0.749438 
[262]	train-auc:0.940855	test-auc:0.749407 
[263]	train-auc:0.941328	test-auc:0.749514 
[264]	train-auc:0.941920	test-auc:0.749837 
[265]	train-auc:0.942378	test-auc:0.749967 
[266]	train-auc:0.942925	test-auc:0.750143 
[267]	train-auc:0.943232	test-auc:0.750178 
[268]	train-auc:0.943616	test-auc:0.750251 
[269]	train-auc:0.944208	test-auc:0.750659 
[270]	train-auc:0.944575	test-auc:0.750804 
[271]	train-auc:0.945256	test-auc:0.751001 
[272]	train-auc:0.945648	test-auc:0.751007 
[273]	train-auc:0.945853	test-auc:0.751049 
[274]	train-auc:0.946112	test-auc:0.750984 
[275]	train-auc:0.946816	test-auc:0.751109 
[276]	train-auc:0.947246	test-auc:0.751094 
[277]	train-auc:0.948038	test-auc:0.751228 
[278]	train-auc:0.948629	test-auc:0.751523 
[279]	train-auc:0.948837	test-auc:0.751706 
[280]	train-auc:0.949064	test-auc:0.751691 
[281]	train-auc:0.949379	test-auc:0.751856 
[282]	train-auc:0.950088	test-auc:0.752096 
[283]	train-auc:0.950257	test-auc:0.752140 
[284]	train-auc:0.950426	test-auc:0.752097 
[285]	train-auc:0.950688	test-auc:0.752236 
[286]	train-auc:0.951254	test-auc:0.752340 
[287]	train-auc:0.951591	test-auc:0.752596 
[288]	train-auc:0.951788	test-auc:0.752608 
[289]	train-auc:0.952019	test-auc:0.752694 
[290]	train-auc:0.952317	test-auc:0.752552 
[291]	train-auc:0.952956	test-auc:0.752515 
[292]	train-auc:0.953225	test-auc:0.752499 
[293]	train-auc:0.953575	test-auc:0.752714 
[294]	train-auc:0.953680	test-auc:0.752746 
[295]	train-auc:0.954068	test-auc:0.752745 
[296]	train-auc:0.954329	test-auc:0.752884 
[297]	train-auc:0.954587	test-auc:0.752616 
[298]	train-auc:0.954748	test-auc:0.752619 
[299]	train-auc:0.954885	test-auc:0.752496 
[300]	train-auc:0.955062	test-auc:0.752461 
[301]	train-auc:0.955542	test-auc:0.752700 
[302]	train-auc:0.955758	test-auc:0.752652 
[303]	train-auc:0.955867	test-auc:0.752570 
[304]	train-auc:0.955944	test-auc:0.752467 
[305]	train-auc:0.955981	test-auc:0.752542 
[306]	train-auc:0.956240	test-auc:0.752762 
[307]	train-auc:0.956584	test-auc:0.752826 
[308]	train-auc:0.956635	test-auc:0.752917 
[309]	train-auc:0.956875	test-auc:0.752911 
[310]	train-auc:0.956908	test-auc:0.752935 
[311]	train-auc:0.957214	test-auc:0.752940 
[312]	train-auc:0.957272	test-auc:0.753011 
[313]	train-auc:0.957488	test-auc:0.753040 
[314]	train-auc:0.957788	test-auc:0.753087 
[315]	train-auc:0.958277	test-auc:0.753245 
[316]	train-auc:0.958470	test-auc:0.753258 
[317]	train-auc:0.958475	test-auc:0.753196 
[318]	train-auc:0.958617	test-auc:0.753293 
[319]	train-auc:0.958844	test-auc:0.753238 
[320]	train-auc:0.958906	test-auc:0.753203 
[321]	train-auc:0.959332	test-auc:0.753369 
[322]	train-auc:0.959882	test-auc:0.753416 
[323]	train-auc:0.959990	test-auc:0.753326 
[324]	train-auc:0.960262	test-auc:0.753290 
[325]	train-auc:0.960365	test-auc:0.753264 
[326]	train-auc:0.960431	test-auc:0.753259 
[327]	train-auc:0.960655	test-auc:0.753372 
[328]	train-auc:0.960823	test-auc:0.753501 
[329]	train-auc:0.960885	test-auc:0.753512 
[330]	train-auc:0.961260	test-auc:0.753623 
[331]	train-auc:0.961537	test-auc:0.753535 
[332]	train-auc:0.961588	test-auc:0.753449 
[333]	train-auc:0.961800	test-auc:0.753477 
[334]	train-auc:0.961903	test-auc:0.753594 
[335]	train-auc:0.962020	test-auc:0.753663 
[336]	train-auc:0.962092	test-auc:0.753669 
[337]	train-auc:0.962115	test-auc:0.753697 
[338]	train-auc:0.962222	test-auc:0.753679 
[339]	train-auc:0.962365	test-auc:0.753548 
[340]	train-auc:0.962618	test-auc:0.753636 
[341]	train-auc:0.962684	test-auc:0.753749 
[342]	train-auc:0.962716	test-auc:0.753786 
[343]	train-auc:0.962818	test-auc:0.753940 
[344]	train-auc:0.963135	test-auc:0.753909 
[345]	train-auc:0.963219	test-auc:0.753891 
[346]	train-auc:0.963458	test-auc:0.753877 
[347]	train-auc:0.963511	test-auc:0.753920 
[348]	train-auc:0.963529	test-auc:0.753903 
[349]	train-auc:0.963592	test-auc:0.753975 
[350]	train-auc:0.963697	test-auc:0.753877 
[351]	train-auc:0.963758	test-auc:0.753924 
[352]	train-auc:0.963911	test-auc:0.753963 
[353]	train-auc:0.964048	test-auc:0.753987 
[354]	train-auc:0.964138	test-auc:0.754009 
[355]	train-auc:0.964204	test-auc:0.754087 
[356]	train-auc:0.964273	test-auc:0.753855 
[357]	train-auc:0.964326	test-auc:0.753866 
[358]	train-auc:0.964355	test-auc:0.753821 
[359]	train-auc:0.964603	test-auc:0.753794 
[360]	train-auc:0.964767	test-auc:0.753928 
[361]	train-auc:0.965046	test-auc:0.753938 
[362]	train-auc:0.965193	test-auc:0.753873 
[363]	train-auc:0.965255	test-auc:0.753877 
[364]	train-auc:0.965286	test-auc:0.753918 
[365]	train-auc:0.965415	test-auc:0.754013 
[366]	train-auc:0.965572	test-auc:0.754058 
[367]	train-auc:0.965624	test-auc:0.754082 
[368]	train-auc:0.965666	test-auc:0.753956 
[369]	train-auc:0.965714	test-auc:0.753954 
[370]	train-auc:0.965785	test-auc:0.753910 
[371]	train-auc:0.965937	test-auc:0.753840 
[372]	train-auc:0.966149	test-auc:0.753793 
[373]	train-auc:0.966208	test-auc:0.753856 
[374]	train-auc:0.966334	test-auc:0.753989 
[375]	train-auc:0.966820	test-auc:0.753963 
[376]	train-auc:0.967032	test-auc:0.753983 
[377]	train-auc:0.967085	test-auc:0.753982 
[378]	train-auc:0.967144	test-auc:0.754017 
[379]	train-auc:0.967199	test-auc:0.754004 
[380]	train-auc:0.967267	test-auc:0.753948 
[381]	train-auc:0.967295	test-auc:0.753924 
[382]	train-auc:0.967470	test-auc:0.753884 
[383]	train-auc:0.967722	test-auc:0.753666 
[384]	train-auc:0.968064	test-auc:0.753656 
[385]	train-auc:0.968445	test-auc:0.753585 
[386]	train-auc:0.968479	test-auc:0.753579 
[387]	train-auc:0.968633	test-auc:0.753675 
[388]	train-auc:0.968706	test-auc:0.753672 
[389]	train-auc:0.968881	test-auc:0.753659 
[390]	train-auc:0.968915	test-auc:0.753672 
[391]	train-auc:0.969074	test-auc:0.753665 
[392]	train-auc:0.969225	test-auc:0.753654 
[393]	train-auc:0.969491	test-auc:0.753641 
[394]	train-auc:0.969551	test-auc:0.753653 
[395]	train-auc:0.969619	test-auc:0.753704 
[396]	train-auc:0.969806	test-auc:0.753648 
[397]	train-auc:0.969855	test-auc:0.753596 
[398]	train-auc:0.969892	test-auc:0.753579 
[399]	train-auc:0.970018	test-auc:0.753648 
[400]	train-auc:0.970146	test-auc:0.753669 
[401]	train-auc:0.970175	test-auc:0.753727 
[402]	train-auc:0.970260	test-auc:0.753740 
[403]	train-auc:0.970493	test-auc:0.753718 
[404]	train-auc:0.970542	test-auc:0.753754 
[405]	train-auc:0.970586	test-auc:0.753902 
Stopping. Best iteration:
[355]	train-auc:0.964204	test-auc:0.754087




Fold 5

[1]	train-auc:0.658349	test-auc:0.652966 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657753	test-auc:0.653157 
[3]	train-auc:0.658214	test-auc:0.653541 
[4]	train-auc:0.658215	test-auc:0.653540 
[5]	train-auc:0.658218	test-auc:0.653541 
[6]	train-auc:0.658221	test-auc:0.653544 
[7]	train-auc:0.660993	test-auc:0.655126 
[8]	train-auc:0.661165	test-auc:0.655004 
[9]	train-auc:0.662343	test-auc:0.655930 
[10]	train-auc:0.663300	test-auc:0.655760 
[11]	train-auc:0.663303	test-auc:0.655762 
[12]	train-auc:0.663365	test-auc:0.655754 
[13]	train-auc:0.663376	test-auc:0.656376 
[14]	train-auc:0.663383	test-auc:0.656388 
[15]	train-auc:0.663386	test-auc:0.656390 
[16]	train-auc:0.663396	test-auc:0.656387 
[17]	train-auc:0.663389	test-auc:0.656332 
[18]	train-auc:0.663399	test-auc:0.656341 
[19]	train-auc:0.663336	test-auc:0.656625 
[20]	train-auc:0.663335	test-auc:0.656632 
[21]	train-auc:0.663327	test-auc:0.656691 
[22]	train-auc:0.663328	test-auc:0.656691 
[23]	train-auc:0.663432	test-auc:0.656688 
[24]	train-auc:0.663484	test-auc:0.656682 
[25]	train-auc:0.663485	test-auc:0.656683 
[26]	train-auc:0.663486	test-auc:0.656683 
[27]	train-auc:0.663587	test-auc:0.656676 
[28]	train-auc:0.664108	test-auc:0.657008 
[29]	train-auc:0.664540	test-auc:0.656987 
[30]	train-auc:0.664539	test-auc:0.656985 
[31]	train-auc:0.664543	test-auc:0.656987 
[32]	train-auc:0.664541	test-auc:0.656983 
[33]	train-auc:0.664546	test-auc:0.656983 
[34]	train-auc:0.664964	test-auc:0.656953 
[35]	train-auc:0.664963	test-auc:0.656951 
[36]	train-auc:0.677713	test-auc:0.668412 
[37]	train-auc:0.677715	test-auc:0.668412 
[38]	train-auc:0.677812	test-auc:0.668399 
[39]	train-auc:0.677813	test-auc:0.668397 
[40]	train-auc:0.677928	test-auc:0.668402 
[41]	train-auc:0.678653	test-auc:0.668796 
[42]	train-auc:0.678651	test-auc:0.668796 
[43]	train-auc:0.678699	test-auc:0.668569 
[44]	train-auc:0.678939	test-auc:0.668557 
[45]	train-auc:0.678940	test-auc:0.668558 
[46]	train-auc:0.678934	test-auc:0.668554 
[47]	train-auc:0.679036	test-auc:0.668544 
[48]	train-auc:0.679035	test-auc:0.668543 
[49]	train-auc:0.679229	test-auc:0.668540 
[50]	train-auc:0.679259	test-auc:0.668610 
[51]	train-auc:0.679388	test-auc:0.668829 
[52]	train-auc:0.679472	test-auc:0.668983 
[53]	train-auc:0.679524	test-auc:0.668684 
[54]	train-auc:0.680597	test-auc:0.670819 
[55]	train-auc:0.680598	test-auc:0.670820 
[56]	train-auc:0.680602	test-auc:0.670800 
[57]	train-auc:0.680596	test-auc:0.670786 
[58]	train-auc:0.682075	test-auc:0.672182 
[59]	train-auc:0.682070	test-auc:0.672170 
[60]	train-auc:0.682076	test-auc:0.672144 
[61]	train-auc:0.682068	test-auc:0.672126 
[62]	train-auc:0.682145	test-auc:0.672064 
[63]	train-auc:0.689354	test-auc:0.677264 
[64]	train-auc:0.689357	test-auc:0.677263 
[65]	train-auc:0.689354	test-auc:0.677255 
[66]	train-auc:0.689362	test-auc:0.677255 
[67]	train-auc:0.689364	test-auc:0.677258 
[68]	train-auc:0.689365	test-auc:0.677258 
[69]	train-auc:0.689362	test-auc:0.677248 
[70]	train-auc:0.691401	test-auc:0.678428 
[71]	train-auc:0.703191	test-auc:0.689346 
[72]	train-auc:0.703213	test-auc:0.689299 
[73]	train-auc:0.702928	test-auc:0.689351 
[74]	train-auc:0.702958	test-auc:0.689346 
[75]	train-auc:0.703927	test-auc:0.690399 
[76]	train-auc:0.703260	test-auc:0.689617 
[77]	train-auc:0.703594	test-auc:0.689900 
[78]	train-auc:0.703719	test-auc:0.689891 
[79]	train-auc:0.704046	test-auc:0.689800 
[80]	train-auc:0.705159	test-auc:0.689654 
[81]	train-auc:0.705421	test-auc:0.689640 
[82]	train-auc:0.705727	test-auc:0.689561 
[83]	train-auc:0.705721	test-auc:0.689548 
[84]	train-auc:0.705741	test-auc:0.689489 
[85]	train-auc:0.707439	test-auc:0.690143 
[86]	train-auc:0.711271	test-auc:0.692928 
[87]	train-auc:0.711457	test-auc:0.692906 
[88]	train-auc:0.711748	test-auc:0.693071 
[89]	train-auc:0.711944	test-auc:0.692990 
[90]	train-auc:0.712550	test-auc:0.692969 
[91]	train-auc:0.713854	test-auc:0.692915 
[92]	train-auc:0.714114	test-auc:0.692842 
[93]	train-auc:0.716323	test-auc:0.694728 
[94]	train-auc:0.722048	test-auc:0.697129 
[95]	train-auc:0.722227	test-auc:0.696988 
[96]	train-auc:0.722908	test-auc:0.697264 
[97]	train-auc:0.723596	test-auc:0.699050 
[98]	train-auc:0.726487	test-auc:0.700310 
[99]	train-auc:0.727831	test-auc:0.701639 
[100]	train-auc:0.728919	test-auc:0.701834 
[101]	train-auc:0.730104	test-auc:0.702049 
[102]	train-auc:0.730976	test-auc:0.702502 
[103]	train-auc:0.732736	test-auc:0.703623 
[104]	train-auc:0.733245	test-auc:0.704346 
[105]	train-auc:0.736047	test-auc:0.704960 
[106]	train-auc:0.736460	test-auc:0.704837 
[107]	train-auc:0.736809	test-auc:0.705286 
[108]	train-auc:0.737529	test-auc:0.705292 
[109]	train-auc:0.737946	test-auc:0.705448 
[110]	train-auc:0.738961	test-auc:0.705597 
[111]	train-auc:0.741784	test-auc:0.707417 
[112]	train-auc:0.742247	test-auc:0.707688 
[113]	train-auc:0.743310	test-auc:0.708329 
[114]	train-auc:0.745413	test-auc:0.709385 
[115]	train-auc:0.747641	test-auc:0.709822 
[116]	train-auc:0.748838	test-auc:0.709915 
[117]	train-auc:0.750703	test-auc:0.710140 
[118]	train-auc:0.751697	test-auc:0.710455 
[119]	train-auc:0.753538	test-auc:0.711089 
[120]	train-auc:0.754014	test-auc:0.710940 
[121]	train-auc:0.755499	test-auc:0.711386 
[122]	train-auc:0.756011	test-auc:0.711183 
[123]	train-auc:0.757295	test-auc:0.711646 
[124]	train-auc:0.757941	test-auc:0.711500 
[125]	train-auc:0.758888	test-auc:0.711916 
[126]	train-auc:0.759332	test-auc:0.712268 
[127]	train-auc:0.759781	test-auc:0.712443 
[128]	train-auc:0.760307	test-auc:0.712239 
[129]	train-auc:0.760571	test-auc:0.712642 
[130]	train-auc:0.761084	test-auc:0.713192 
[131]	train-auc:0.761639	test-auc:0.713246 
[132]	train-auc:0.761939	test-auc:0.713235 
[133]	train-auc:0.762346	test-auc:0.713353 
[134]	train-auc:0.762688	test-auc:0.713431 
[135]	train-auc:0.763764	test-auc:0.713480 
[136]	train-auc:0.763926	test-auc:0.713472 
[137]	train-auc:0.764892	test-auc:0.713622 
[138]	train-auc:0.765796	test-auc:0.713710 
[139]	train-auc:0.766386	test-auc:0.713443 
[140]	train-auc:0.767166	test-auc:0.713471 
[141]	train-auc:0.769514	test-auc:0.713803 
[142]	train-auc:0.771052	test-auc:0.713986 
[143]	train-auc:0.771816	test-auc:0.713817 
[144]	train-auc:0.772885	test-auc:0.714113 
[145]	train-auc:0.773906	test-auc:0.714287 
[146]	train-auc:0.774589	test-auc:0.714382 
[147]	train-auc:0.775116	test-auc:0.714813 
[148]	train-auc:0.776691	test-auc:0.715590 
[149]	train-auc:0.777286	test-auc:0.715719 
[150]	train-auc:0.778400	test-auc:0.716309 
[151]	train-auc:0.779676	test-auc:0.716393 
[152]	train-auc:0.782605	test-auc:0.717855 
[153]	train-auc:0.783680	test-auc:0.718120 
[154]	train-auc:0.784355	test-auc:0.718335 
[155]	train-auc:0.786316	test-auc:0.718941 
[156]	train-auc:0.787064	test-auc:0.718667 
[157]	train-auc:0.788726	test-auc:0.719200 
[158]	train-auc:0.789575	test-auc:0.719456 
[159]	train-auc:0.792167	test-auc:0.719128 
[160]	train-auc:0.794028	test-auc:0.720056 
[161]	train-auc:0.795629	test-auc:0.720006 
[162]	train-auc:0.797627	test-auc:0.721975 
[163]	train-auc:0.798721	test-auc:0.722103 
[164]	train-auc:0.801406	test-auc:0.724303 
[165]	train-auc:0.802625	test-auc:0.724933 
[166]	train-auc:0.804588	test-auc:0.726465 
[167]	train-auc:0.805539	test-auc:0.726687 
[168]	train-auc:0.807121	test-auc:0.727470 
[169]	train-auc:0.808334	test-auc:0.728529 
[170]	train-auc:0.809984	test-auc:0.728909 
[171]	train-auc:0.812267	test-auc:0.729613 
[172]	train-auc:0.814685	test-auc:0.729871 
[173]	train-auc:0.817444	test-auc:0.729882 
[174]	train-auc:0.818938	test-auc:0.729798 
[175]	train-auc:0.821786	test-auc:0.730192 
[176]	train-auc:0.824016	test-auc:0.730505 
[177]	train-auc:0.827091	test-auc:0.731174 
[178]	train-auc:0.829786	test-auc:0.731958 
[179]	train-auc:0.831789	test-auc:0.732584 
[180]	train-auc:0.834035	test-auc:0.733395 
[181]	train-auc:0.835926	test-auc:0.734031 
[182]	train-auc:0.837439	test-auc:0.734345 
[183]	train-auc:0.838947	test-auc:0.734433 
[184]	train-auc:0.840604	test-auc:0.735274 
[185]	train-auc:0.842089	test-auc:0.735847 
[186]	train-auc:0.843669	test-auc:0.736333 
[187]	train-auc:0.845327	test-auc:0.736876 
[188]	train-auc:0.846993	test-auc:0.737003 
[189]	train-auc:0.848119	test-auc:0.737356 
[190]	train-auc:0.849582	test-auc:0.737405 
[191]	train-auc:0.851184	test-auc:0.737609 
[192]	train-auc:0.852257	test-auc:0.737744 
[193]	train-auc:0.854313	test-auc:0.737765 
[194]	train-auc:0.855612	test-auc:0.737818 
[195]	train-auc:0.856854	test-auc:0.738159 
[196]	train-auc:0.857938	test-auc:0.738168 
[197]	train-auc:0.859155	test-auc:0.738589 
[198]	train-auc:0.860006	test-auc:0.738760 
[199]	train-auc:0.860780	test-auc:0.739264 
[200]	train-auc:0.861534	test-auc:0.739495 
[201]	train-auc:0.862569	test-auc:0.739855 
[202]	train-auc:0.863785	test-auc:0.739918 
[203]	train-auc:0.864636	test-auc:0.740091 
[204]	train-auc:0.865780	test-auc:0.740365 
[205]	train-auc:0.866603	test-auc:0.740235 
[206]	train-auc:0.867780	test-auc:0.740098 
[207]	train-auc:0.869124	test-auc:0.740372 
[208]	train-auc:0.869947	test-auc:0.740162 
[209]	train-auc:0.870686	test-auc:0.740320 
[210]	train-auc:0.871562	test-auc:0.740376 
[211]	train-auc:0.872307	test-auc:0.740438 
[212]	train-auc:0.873444	test-auc:0.740552 
[213]	train-auc:0.874230	test-auc:0.740388 
[214]	train-auc:0.875276	test-auc:0.740183 
[215]	train-auc:0.876411	test-auc:0.739982 
[216]	train-auc:0.877102	test-auc:0.740539 
[217]	train-auc:0.878599	test-auc:0.740942 
[218]	train-auc:0.880693	test-auc:0.741451 
[219]	train-auc:0.882402	test-auc:0.741816 
[220]	train-auc:0.883333	test-auc:0.741980 
[221]	train-auc:0.884700	test-auc:0.742069 
[222]	train-auc:0.886369	test-auc:0.742144 
[223]	train-auc:0.887619	test-auc:0.742329 
[224]	train-auc:0.888872	test-auc:0.742456 
[225]	train-auc:0.890350	test-auc:0.742635 
[226]	train-auc:0.891867	test-auc:0.742833 
[227]	train-auc:0.893435	test-auc:0.742867 
[228]	train-auc:0.894954	test-auc:0.742661 
[229]	train-auc:0.897469	test-auc:0.742628 
[230]	train-auc:0.898811	test-auc:0.742661 
[231]	train-auc:0.900000	test-auc:0.742563 
[232]	train-auc:0.901636	test-auc:0.743165 
[233]	train-auc:0.903022	test-auc:0.743260 
[234]	train-auc:0.904545	test-auc:0.743644 
[235]	train-auc:0.905764	test-auc:0.744064 
[236]	train-auc:0.906738	test-auc:0.744058 
[237]	train-auc:0.907650	test-auc:0.744298 
[238]	train-auc:0.908543	test-auc:0.744137 
[239]	train-auc:0.909628	test-auc:0.744321 
[240]	train-auc:0.910405	test-auc:0.744472 
[241]	train-auc:0.911323	test-auc:0.744543 
[242]	train-auc:0.912300	test-auc:0.744418 
[243]	train-auc:0.913198	test-auc:0.744659 
[244]	train-auc:0.914129	test-auc:0.744686 
[245]	train-auc:0.914897	test-auc:0.744674 
[246]	train-auc:0.915475	test-auc:0.744952 
[247]	train-auc:0.916440	test-auc:0.745207 
[248]	train-auc:0.916786	test-auc:0.745226 
[249]	train-auc:0.917576	test-auc:0.745461 
[250]	train-auc:0.917938	test-auc:0.745537 
[251]	train-auc:0.919605	test-auc:0.745501 
[252]	train-auc:0.920940	test-auc:0.745556 
[253]	train-auc:0.922394	test-auc:0.745842 
[254]	train-auc:0.923351	test-auc:0.745791 
[255]	train-auc:0.923788	test-auc:0.745899 
[256]	train-auc:0.924646	test-auc:0.745861 
[257]	train-auc:0.925577	test-auc:0.746120 
[258]	train-auc:0.926030	test-auc:0.746306 
[259]	train-auc:0.927647	test-auc:0.746627 
[260]	train-auc:0.928204	test-auc:0.746591 
[261]	train-auc:0.928936	test-auc:0.746524 
[262]	train-auc:0.929220	test-auc:0.746534 
[263]	train-auc:0.929524	test-auc:0.746618 
[264]	train-auc:0.930354	test-auc:0.746559 
[265]	train-auc:0.931123	test-auc:0.746805 
[266]	train-auc:0.931804	test-auc:0.746785 
[267]	train-auc:0.932423	test-auc:0.746818 
[268]	train-auc:0.933009	test-auc:0.746792 
[269]	train-auc:0.933503	test-auc:0.746835 
[270]	train-auc:0.934011	test-auc:0.746889 
[271]	train-auc:0.934666	test-auc:0.747067 
[272]	train-auc:0.935460	test-auc:0.747174 
[273]	train-auc:0.936139	test-auc:0.747127 
[274]	train-auc:0.936750	test-auc:0.747299 
[275]	train-auc:0.937407	test-auc:0.747442 
[276]	train-auc:0.937948	test-auc:0.747481 
[277]	train-auc:0.938450	test-auc:0.747607 
[278]	train-auc:0.938670	test-auc:0.747498 
[279]	train-auc:0.939121	test-auc:0.747479 
[280]	train-auc:0.939453	test-auc:0.747460 
[281]	train-auc:0.939932	test-auc:0.747478 
[282]	train-auc:0.940461	test-auc:0.747530 
[283]	train-auc:0.940933	test-auc:0.747730 
[284]	train-auc:0.941262	test-auc:0.747767 
[285]	train-auc:0.941544	test-auc:0.747737 
[286]	train-auc:0.942053	test-auc:0.747758 
[287]	train-auc:0.942574	test-auc:0.747972 
[288]	train-auc:0.942780	test-auc:0.747991 
[289]	train-auc:0.943127	test-auc:0.748134 
[290]	train-auc:0.943575	test-auc:0.748167 
[291]	train-auc:0.943876	test-auc:0.748295 
[292]	train-auc:0.944022	test-auc:0.748298 
[293]	train-auc:0.944337	test-auc:0.748197 
[294]	train-auc:0.944449	test-auc:0.748198 
[295]	train-auc:0.944639	test-auc:0.748255 
[296]	train-auc:0.945012	test-auc:0.748206 
[297]	train-auc:0.945232	test-auc:0.748241 
[298]	train-auc:0.945290	test-auc:0.748243 
[299]	train-auc:0.945528	test-auc:0.748182 
[300]	train-auc:0.945699	test-auc:0.748113 
[301]	train-auc:0.945793	test-auc:0.748053 
[302]	train-auc:0.946169	test-auc:0.747942 
[303]	train-auc:0.946457	test-auc:0.747807 
[304]	train-auc:0.946602	test-auc:0.747984 
[305]	train-auc:0.946668	test-auc:0.747924 
[306]	train-auc:0.946875	test-auc:0.748031 
[307]	train-auc:0.947012	test-auc:0.748021 
[308]	train-auc:0.947160	test-auc:0.748111 
[309]	train-auc:0.947569	test-auc:0.748052 
[310]	train-auc:0.947716	test-auc:0.748060 
[311]	train-auc:0.947905	test-auc:0.748008 
[312]	train-auc:0.948242	test-auc:0.748244 
[313]	train-auc:0.948445	test-auc:0.748180 
[314]	train-auc:0.948526	test-auc:0.748157 
[315]	train-auc:0.948687	test-auc:0.748290 
[316]	train-auc:0.948806	test-auc:0.748317 
[317]	train-auc:0.948966	test-auc:0.748266 
[318]	train-auc:0.949068	test-auc:0.748185 
[319]	train-auc:0.949194	test-auc:0.748136 
[320]	train-auc:0.949522	test-auc:0.748120 
[321]	train-auc:0.949637	test-auc:0.748221 
[322]	train-auc:0.949717	test-auc:0.748178 
[323]	train-auc:0.949768	test-auc:0.748270 
[324]	train-auc:0.949893	test-auc:0.748435 
[325]	train-auc:0.949940	test-auc:0.748527 
[326]	train-auc:0.950080	test-auc:0.748529 
[327]	train-auc:0.950239	test-auc:0.748404 
[328]	train-auc:0.950387	test-auc:0.748319 
[329]	train-auc:0.950460	test-auc:0.748352 
[330]	train-auc:0.950527	test-auc:0.748199 
[331]	train-auc:0.950857	test-auc:0.748302 
[332]	train-auc:0.951025	test-auc:0.748324 
[333]	train-auc:0.951222	test-auc:0.748385 
[334]	train-auc:0.951277	test-auc:0.748367 
[335]	train-auc:0.951417	test-auc:0.748430 
[336]	train-auc:0.951565	test-auc:0.748442 
[337]	train-auc:0.951651	test-auc:0.748360 
[338]	train-auc:0.951852	test-auc:0.748369 
[339]	train-auc:0.952099	test-auc:0.748266 
[340]	train-auc:0.952217	test-auc:0.748136 
[341]	train-auc:0.952336	test-auc:0.748164 
[342]	train-auc:0.952807	test-auc:0.748065 
[343]	train-auc:0.953068	test-auc:0.748124 
[344]	train-auc:0.953358	test-auc:0.748167 
[345]	train-auc:0.953548	test-auc:0.748060 
[346]	train-auc:0.953574	test-auc:0.747994 
[347]	train-auc:0.953620	test-auc:0.748022 
[348]	train-auc:0.953930	test-auc:0.748014 
[349]	train-auc:0.954103	test-auc:0.747954 
[350]	train-auc:0.954187	test-auc:0.747867 
[351]	train-auc:0.954352	test-auc:0.747842 
[352]	train-auc:0.954341	test-auc:0.747896 
[353]	train-auc:0.954490	test-auc:0.747978 
[354]	train-auc:0.954520	test-auc:0.747978 
[355]	train-auc:0.954847	test-auc:0.748121 
[356]	train-auc:0.955140	test-auc:0.748228 
[357]	train-auc:0.955282	test-auc:0.748245 
[358]	train-auc:0.955423	test-auc:0.748223 
[359]	train-auc:0.955513	test-auc:0.748288 
[360]	train-auc:0.955579	test-auc:0.748420 
[361]	train-auc:0.955767	test-auc:0.748523 
[362]	train-auc:0.955788	test-auc:0.748455 
[363]	train-auc:0.956184	test-auc:0.748461 
[364]	train-auc:0.956219	test-auc:0.748491 
[365]	train-auc:0.956339	test-auc:0.748508 
[366]	train-auc:0.956375	test-auc:0.748511 
[367]	train-auc:0.956520	test-auc:0.748550 
[368]	train-auc:0.956630	test-auc:0.748533 
[369]	train-auc:0.956740	test-auc:0.748575 
[370]	train-auc:0.956840	test-auc:0.748636 
[371]	train-auc:0.957272	test-auc:0.748528 
[372]	train-auc:0.957359	test-auc:0.748545 
[373]	train-auc:0.957387	test-auc:0.748546 
[374]	train-auc:0.957479	test-auc:0.748558 
[375]	train-auc:0.957579	test-auc:0.748552 
[376]	train-auc:0.957812	test-auc:0.748551 
[377]	train-auc:0.957851	test-auc:0.748642 
[378]	train-auc:0.957989	test-auc:0.748676 
[379]	train-auc:0.958050	test-auc:0.748651 
[380]	train-auc:0.958173	test-auc:0.748697 
[381]	train-auc:0.958259	test-auc:0.748655 
[382]	train-auc:0.958335	test-auc:0.748719 
[383]	train-auc:0.958378	test-auc:0.748736 
[384]	train-auc:0.958659	test-auc:0.748798 
[385]	train-auc:0.958801	test-auc:0.748808 
[386]	train-auc:0.958867	test-auc:0.748734 
[387]	train-auc:0.958992	test-auc:0.748683 
[388]	train-auc:0.959025	test-auc:0.748655 
[389]	train-auc:0.959190	test-auc:0.748584 
[390]	train-auc:0.959437	test-auc:0.748556 
[391]	train-auc:0.959533	test-auc:0.748578 
[392]	train-auc:0.959577	test-auc:0.748558 
[393]	train-auc:0.959655	test-auc:0.748519 
[394]	train-auc:0.959724	test-auc:0.748530 
[395]	train-auc:0.959817	test-auc:0.748507 
[396]	train-auc:0.959878	test-auc:0.748546 
[397]	train-auc:0.959993	test-auc:0.748367 
[398]	train-auc:0.960090	test-auc:0.748360 
[399]	train-auc:0.960181	test-auc:0.748341 
[400]	train-auc:0.960258	test-auc:0.748294 
[401]	train-auc:0.960275	test-auc:0.748302 
[402]	train-auc:0.960386	test-auc:0.748273 
[403]	train-auc:0.960470	test-auc:0.748342 
[404]	train-auc:0.960515	test-auc:0.748326 
[405]	train-auc:0.960622	test-auc:0.748453 
[406]	train-auc:0.960715	test-auc:0.748389 
[407]	train-auc:0.960772	test-auc:0.748371 
[408]	train-auc:0.960907	test-auc:0.748371 
[409]	train-auc:0.960945	test-auc:0.748358 
[410]	train-auc:0.960958	test-auc:0.748339 
[411]	train-auc:0.961012	test-auc:0.748224 
[412]	train-auc:0.961310	test-auc:0.748301 
[413]	train-auc:0.961521	test-auc:0.748180 
[414]	train-auc:0.961599	test-auc:0.748131 
[415]	train-auc:0.961607	test-auc:0.748133 
[416]	train-auc:0.961717	test-auc:0.748244 
[417]	train-auc:0.961782	test-auc:0.748142 
[418]	train-auc:0.961866	test-auc:0.748176 
[419]	train-auc:0.961921	test-auc:0.748171 
[420]	train-auc:0.962060	test-auc:0.748125 
[421]	train-auc:0.962291	test-auc:0.748147 
[422]	train-auc:0.962341	test-auc:0.748044 
[423]	train-auc:0.962469	test-auc:0.748074 
[424]	train-auc:0.962490	test-auc:0.748122 
[425]	train-auc:0.962563	test-auc:0.748139 
[426]	train-auc:0.962620	test-auc:0.748061 
[427]	train-auc:0.962921	test-auc:0.748009 
[428]	train-auc:0.963005	test-auc:0.748057 
[429]	train-auc:0.963035	test-auc:0.748177 
[430]	train-auc:0.963110	test-auc:0.748167 
[431]	train-auc:0.963490	test-auc:0.748353 
[432]	train-auc:0.963516	test-auc:0.748384 
[433]	train-auc:0.963700	test-auc:0.748358 
[434]	train-auc:0.963797	test-auc:0.748320 
[435]	train-auc:0.963872	test-auc:0.748316 
Stopping. Best iteration:
[385]	train-auc:0.958801	test-auc:0.748808

