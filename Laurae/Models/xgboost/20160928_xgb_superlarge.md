> xgb.opt.depth(initial = 11, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)

Exploring depth  11 : [00039] 0.74537160+0.00662581 (Score: 0.74537160 <<<) - best is: 11
Exploring depth  09 : [00062] 0.74262420+0.00309976 (Score: 0.74262420    ) - best is: 11
Exploring depth  13 : [00030] 0.74397660+0.00513464 (Score: 0.74397660    ) - best is: 11
Exploring depth  10 : [00033] 0.74369180+0.00501748 (Score: 0.74369180    ) - best is: 11
Exploring depth  12 : [00037] 0.74233880+0.00636647 (Score: 0.74233880    ) - best is: 11
Best depth found was: 11.
NULL
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
+   sink(file = "Laurae/20160928_xgb_superlarge/logs.txt", append = TRUE, split = FALSE)
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
+   write.csv(predictions1, file = "Laurae/20160928_xgb_superlarge/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20160928_xgb_superlarge/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20160928_xgb_superlarge/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Average of validation predictions:  0.005709233
Average of test predictions:  0.005706137
Average of rolling test predictions:  0.02853068
Fold 1: MCC=0.2927757

Average of validation predictions:  0.005466718
Average of test predictions:  0.005526881
Average of rolling test predictions:  0.02808255
Fold 2: MCC=0.2708237

Average of validation predictions:  0.005480236
Average of test predictions:  0.005490571
Average of rolling test predictions:  0.02787265
Fold 3: MCC=0.2793473

Average of validation predictions:  0.005568942
Average of test predictions:  0.005565054
Average of rolling test predictions:  0.0278608
Fold 4: MCC=0.2707781

Average of validation predictions:  0.005711359
Average of test predictions:  0.005723964
Average of rolling test predictions:  0.02801261
Fold 5: MCC=0.2736898
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20160928_xgb_superlarge/predictions_test_mean.csv", row.names = FALSE)
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
Fold 1: MCC=0.2927757 | rolling average: 0.2927757
Fold 2: MCC=0.2708237 | rolling average: 0.2817997
Fold 3: MCC=0.2793473 | rolling average: 0.2809822
Fold 4: MCC=0.2707781 | rolling average: 0.2784312
Fold 5: MCC=0.2736898 | rolling average: 0.2774829
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.2774829 + 0.009233539
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1492192 | rolling average: 0.1492192
Fold 2: threshold=0.1201597 | rolling average: 0.1346894
Fold 3: threshold=0.2450055 | rolling average: 0.1714615
Fold 4: threshold=0.2347339 | rolling average: 0.1872796
Fold 5: threshold=0.140843 | rolling average: 0.1779923
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 >= best_mcc)
> print(sum(submission1$Response == 1))
[1] 2550
> write.csv(submission1, file = "Laurae/20160928_xgb_superlarge/submission1.csv", row.names = FALSE)
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
Fold 1: threshold=0.1492192 | rolling average: 0.002296942
Fold 2: threshold=0.1201597 | rolling average: 0.002568114
Fold 3: threshold=0.2450055 | rolling average: 0.002273569
Fold 4: threshold=0.2347339 | rolling average: 0.002138758
Fold 5: threshold=0.140843 | rolling average: 0.002206044
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 2528
> write.csv(submission2, file = "Laurae/20160928_xgb_superlarge/submission2.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 2668
> write.csv(submission3, file = "Laurae/20160928_xgb_superlarge/submission3.csv", row.names = FALSE)
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 2410
> write.csv(submission4, file = "Laurae/20160928_xgb_superlarge/submission4.csv", row.names = FALSE)






Depth 11

[1]	train-auc:0.657370+0.000822	test-auc:0.655064+0.005224 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.660334+0.002463	test-auc:0.657550+0.004572 
[3]	train-auc:0.661288+0.002089	test-auc:0.657833+0.004628 
[4]	train-auc:0.661915+0.001695	test-auc:0.658068+0.004809 
[5]	train-auc:0.671587+0.006831	test-auc:0.666883+0.009000 
[6]	train-auc:0.673254+0.007952	test-auc:0.668915+0.011152 
[7]	train-auc:0.684268+0.006014	test-auc:0.679380+0.009770 
[8]	train-auc:0.687693+0.005582	test-auc:0.681887+0.009344 
[9]	train-auc:0.692576+0.006076	test-auc:0.685467+0.008884 
[10]	train-auc:0.700962+0.005474	test-auc:0.691350+0.006448 
[11]	train-auc:0.706626+0.005959	test-auc:0.694204+0.007810 
[12]	train-auc:0.716198+0.006006	test-auc:0.699199+0.007569 
[13]	train-auc:0.722437+0.004458	test-auc:0.702291+0.006577 
[14]	train-auc:0.732478+0.003446	test-auc:0.705529+0.006257 
[15]	train-auc:0.740819+0.002714	test-auc:0.708259+0.007887 
[16]	train-auc:0.750379+0.002202	test-auc:0.712489+0.008078 
[17]	train-auc:0.757579+0.001992	test-auc:0.714756+0.008760 
[18]	train-auc:0.768976+0.003907	test-auc:0.719529+0.007148 
[19]	train-auc:0.781329+0.002901	test-auc:0.723207+0.007806 
[20]	train-auc:0.792235+0.003149	test-auc:0.725844+0.008269 
[21]	train-auc:0.805101+0.005018	test-auc:0.728258+0.007799 
[22]	train-auc:0.820832+0.003696	test-auc:0.730073+0.007611 
[23]	train-auc:0.832759+0.003438	test-auc:0.733273+0.006346 
[24]	train-auc:0.845213+0.003111	test-auc:0.736119+0.005903 
[25]	train-auc:0.856564+0.004379	test-auc:0.738715+0.006361 
[26]	train-auc:0.866806+0.004988	test-auc:0.740345+0.006723 
[27]	train-auc:0.876432+0.005216	test-auc:0.743252+0.006313 
[28]	train-auc:0.883539+0.005395	test-auc:0.743471+0.006559 
[29]	train-auc:0.892522+0.005388	test-auc:0.743475+0.005381 
[30]	train-auc:0.901359+0.004624	test-auc:0.743289+0.005488 
[31]	train-auc:0.908743+0.005876	test-auc:0.744374+0.006219 
[32]	train-auc:0.914197+0.005753	test-auc:0.744512+0.006006 
[33]	train-auc:0.919505+0.005493	test-auc:0.745279+0.006144 
[34]	train-auc:0.923801+0.005661	test-auc:0.745217+0.006207 
[35]	train-auc:0.927050+0.005330	test-auc:0.745250+0.006538 
[36]	train-auc:0.931590+0.004522	test-auc:0.744993+0.006979 
[37]	train-auc:0.934338+0.004505	test-auc:0.745224+0.006983 
[38]	train-auc:0.936039+0.003907	test-auc:0.745356+0.006709 
[39]	train-auc:0.938304+0.002956	test-auc:0.745372+0.006626 
[40]	train-auc:0.940474+0.002775	test-auc:0.744736+0.006167 
[41]	train-auc:0.942218+0.003283	test-auc:0.744901+0.006149 
[42]	train-auc:0.943926+0.004124	test-auc:0.745142+0.006608 
[43]	train-auc:0.944998+0.003878	test-auc:0.745273+0.006384 
[44]	train-auc:0.946429+0.004746	test-auc:0.744541+0.005757 
[45]	train-auc:0.948844+0.004799	test-auc:0.744058+0.005661 
[46]	train-auc:0.950482+0.005287	test-auc:0.743570+0.005598 
[47]	train-auc:0.951561+0.005032	test-auc:0.743564+0.005339 
[48]	train-auc:0.952105+0.004793	test-auc:0.743926+0.005231 
[49]	train-auc:0.953225+0.004658	test-auc:0.743747+0.005469 
Stopping. Best iteration:
[39]	train-auc:0.938304+0.002956	test-auc:0.745372+0.006626




Depth 9

[1]	train-auc:0.608262+0.023557	test-auc:0.604716+0.019808 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.632312+0.028156	test-auc:0.628203+0.028249 
[3]	train-auc:0.655639+0.001298	test-auc:0.652911+0.004845 
[4]	train-auc:0.657668+0.001977	test-auc:0.653349+0.005206 
[5]	train-auc:0.658828+0.002728	test-auc:0.654294+0.004271 
[6]	train-auc:0.659978+0.002048	test-auc:0.655147+0.005283 
[7]	train-auc:0.660640+0.002014	test-auc:0.655608+0.005654 
[8]	train-auc:0.660997+0.001942	test-auc:0.656218+0.005343 
[9]	train-auc:0.666786+0.007814	test-auc:0.662116+0.009894 
[10]	train-auc:0.674890+0.006856	test-auc:0.669878+0.011342 
[11]	train-auc:0.684656+0.006578	test-auc:0.678256+0.009599 
[12]	train-auc:0.691405+0.009282	test-auc:0.684433+0.011510 
[13]	train-auc:0.701496+0.005318	test-auc:0.689077+0.009122 
[14]	train-auc:0.711137+0.006773	test-auc:0.695342+0.006495 
[15]	train-auc:0.723035+0.003596	test-auc:0.702278+0.006508 
[16]	train-auc:0.731658+0.003190	test-auc:0.706718+0.007140 
[17]	train-auc:0.737984+0.002016	test-auc:0.709172+0.006434 
[18]	train-auc:0.744869+0.000780	test-auc:0.712823+0.007970 
[19]	train-auc:0.754239+0.001785	test-auc:0.716782+0.008164 
[20]	train-auc:0.762487+0.002506	test-auc:0.719338+0.007852 
[21]	train-auc:0.773199+0.003426	test-auc:0.722394+0.008469 
[22]	train-auc:0.782728+0.003540	test-auc:0.725093+0.007144 
[23]	train-auc:0.794134+0.003328	test-auc:0.728055+0.007083 
[24]	train-auc:0.804602+0.003637	test-auc:0.732065+0.006273 
[25]	train-auc:0.814236+0.003722	test-auc:0.734685+0.005658 
[26]	train-auc:0.822817+0.004354	test-auc:0.735473+0.004271 
[27]	train-auc:0.830346+0.002019	test-auc:0.736940+0.005978 
[28]	train-auc:0.840103+0.002338	test-auc:0.738395+0.005293 
[29]	train-auc:0.847654+0.002100	test-auc:0.738792+0.004972 
[30]	train-auc:0.855191+0.002626	test-auc:0.738640+0.005069 
[31]	train-auc:0.862870+0.004349	test-auc:0.738488+0.005104 
[32]	train-auc:0.869349+0.004287	test-auc:0.738032+0.004573 
[33]	train-auc:0.874168+0.003301	test-auc:0.738706+0.004853 
[34]	train-auc:0.879306+0.004111	test-auc:0.738851+0.005464 
[35]	train-auc:0.883517+0.004270	test-auc:0.739598+0.005254 
[36]	train-auc:0.886528+0.005011	test-auc:0.739764+0.005242 
[37]	train-auc:0.889545+0.004794	test-auc:0.740158+0.004835 
[38]	train-auc:0.891681+0.005187	test-auc:0.740129+0.004411 
[39]	train-auc:0.895166+0.005433	test-auc:0.740439+0.004008 
[40]	train-auc:0.896806+0.005114	test-auc:0.740156+0.004092 
[41]	train-auc:0.898669+0.005015	test-auc:0.740036+0.004134 
[42]	train-auc:0.900506+0.005163	test-auc:0.739772+0.004483 
[43]	train-auc:0.902793+0.005433	test-auc:0.739600+0.003866 
[44]	train-auc:0.904481+0.004750	test-auc:0.739464+0.003728 
[45]	train-auc:0.906324+0.004982	test-auc:0.739501+0.003414 
[46]	train-auc:0.907783+0.004584	test-auc:0.739869+0.003113 
[47]	train-auc:0.909673+0.004265	test-auc:0.740648+0.003064 
[48]	train-auc:0.910703+0.004068	test-auc:0.740988+0.003086 
[49]	train-auc:0.911942+0.004703	test-auc:0.741117+0.002471 
[50]	train-auc:0.914100+0.005151	test-auc:0.741323+0.002682 
[51]	train-auc:0.915378+0.005256	test-auc:0.741505+0.002284 
[52]	train-auc:0.917121+0.006061	test-auc:0.741536+0.002099 
[53]	train-auc:0.918191+0.005757	test-auc:0.741629+0.002253 
[54]	train-auc:0.919171+0.005475	test-auc:0.741880+0.002233 
[55]	train-auc:0.919817+0.005405	test-auc:0.742213+0.002309 
[56]	train-auc:0.921166+0.005322	test-auc:0.742349+0.002408 
[57]	train-auc:0.922900+0.004373	test-auc:0.742245+0.002467 
[58]	train-auc:0.924943+0.005085	test-auc:0.742296+0.002658 
[59]	train-auc:0.926665+0.004470	test-auc:0.742052+0.002919 
[60]	train-auc:0.927790+0.003641	test-auc:0.742136+0.002895 
[61]	train-auc:0.928698+0.003910	test-auc:0.742475+0.003006 
[62]	train-auc:0.930314+0.004329	test-auc:0.742624+0.003100 
[63]	train-auc:0.931391+0.004220	test-auc:0.742525+0.002816 
[64]	train-auc:0.932227+0.004583	test-auc:0.742363+0.002626 
[65]	train-auc:0.933530+0.005078	test-auc:0.741983+0.002913 
[66]	train-auc:0.935030+0.004891	test-auc:0.741637+0.002980 
[67]	train-auc:0.936073+0.004697	test-auc:0.741369+0.002864 
[68]	train-auc:0.937132+0.004300	test-auc:0.741446+0.003206 
[69]	train-auc:0.938093+0.004697	test-auc:0.741409+0.003165 
[70]	train-auc:0.938943+0.004698	test-auc:0.741201+0.002975 
[71]	train-auc:0.939635+0.004526	test-auc:0.741260+0.003208 
[72]	train-auc:0.940913+0.004709	test-auc:0.740748+0.003452 
Stopping. Best iteration:
[62]	train-auc:0.930314+0.004329	test-auc:0.742624+0.003100




Depth 13

[1]	train-auc:0.658922+0.000930	test-auc:0.656049+0.004851 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.670102+0.007524	test-auc:0.666702+0.009008 
[3]	train-auc:0.675533+0.008264	test-auc:0.670711+0.010049 
[4]	train-auc:0.676343+0.008049	test-auc:0.671013+0.010007 
[5]	train-auc:0.682728+0.003216	test-auc:0.675395+0.008660 
[6]	train-auc:0.690112+0.005243	test-auc:0.682304+0.010171 
[7]	train-auc:0.693193+0.005626	test-auc:0.684675+0.011094 
[8]	train-auc:0.703864+0.002945	test-auc:0.690631+0.007276 
[9]	train-auc:0.709919+0.003584	test-auc:0.695301+0.006537 
[10]	train-auc:0.716098+0.004561	test-auc:0.698480+0.006870 
[11]	train-auc:0.722409+0.003566	test-auc:0.701307+0.007614 
[12]	train-auc:0.730893+0.003523	test-auc:0.705522+0.007686 
[13]	train-auc:0.737488+0.003515	test-auc:0.707576+0.007170 
[14]	train-auc:0.746356+0.003538	test-auc:0.709191+0.007402 
[15]	train-auc:0.757527+0.002720	test-auc:0.714003+0.009113 
[16]	train-auc:0.768345+0.002067	test-auc:0.717869+0.009951 
[17]	train-auc:0.780770+0.002994	test-auc:0.722080+0.007414 
[18]	train-auc:0.793667+0.004480	test-auc:0.725114+0.008598 
[19]	train-auc:0.807597+0.005628	test-auc:0.727236+0.008887 
[20]	train-auc:0.822547+0.002427	test-auc:0.730254+0.006712 
[21]	train-auc:0.838817+0.002162	test-auc:0.733412+0.006388 
[22]	train-auc:0.852854+0.004086	test-auc:0.736443+0.006360 
[23]	train-auc:0.869405+0.003763	test-auc:0.737005+0.006968 
[24]	train-auc:0.883977+0.005289	test-auc:0.738553+0.006503 
[25]	train-auc:0.897240+0.004814	test-auc:0.739666+0.006867 
[26]	train-auc:0.909488+0.004209	test-auc:0.740210+0.005898 
[27]	train-auc:0.918152+0.003931	test-auc:0.741292+0.006453 
[28]	train-auc:0.926929+0.003660	test-auc:0.742713+0.005986 
[29]	train-auc:0.933395+0.004098	test-auc:0.741867+0.005570 
[30]	train-auc:0.940697+0.003852	test-auc:0.743977+0.005135 
[31]	train-auc:0.946359+0.004258	test-auc:0.743967+0.005444 
[32]	train-auc:0.951091+0.003451	test-auc:0.743716+0.005247 
[33]	train-auc:0.956247+0.003458	test-auc:0.743096+0.004749 
[34]	train-auc:0.959918+0.002614	test-auc:0.743603+0.004879 
[35]	train-auc:0.962995+0.003199	test-auc:0.742933+0.005602 
[36]	train-auc:0.965841+0.002442	test-auc:0.743211+0.005618 
[37]	train-auc:0.967175+0.002774	test-auc:0.743358+0.005912 
[38]	train-auc:0.968435+0.002941	test-auc:0.743722+0.006082 
[39]	train-auc:0.969514+0.002963	test-auc:0.743281+0.006370 
[40]	train-auc:0.970754+0.002833	test-auc:0.743028+0.006511 
Stopping. Best iteration:
[30]	train-auc:0.940697+0.003852	test-auc:0.743977+0.005135




Depth 10

[1]	train-auc:0.633091+0.027875	test-auc:0.630001+0.028912 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.657551+0.002949	test-auc:0.655608+0.004733 
[3]	train-auc:0.658827+0.002863	test-auc:0.655874+0.004409 
[4]	train-auc:0.660302+0.001786	test-auc:0.656626+0.005142 
[5]	train-auc:0.663722+0.007119	test-auc:0.659358+0.004160 
[6]	train-auc:0.667733+0.007789	test-auc:0.662826+0.006690 
[7]	train-auc:0.677465+0.007930	test-auc:0.673378+0.012448 
[8]	train-auc:0.680448+0.010281	test-auc:0.675819+0.011832 
[9]	train-auc:0.684557+0.006199	test-auc:0.679162+0.009654 
[10]	train-auc:0.689533+0.007876	test-auc:0.682857+0.010070 
[11]	train-auc:0.697627+0.008998	test-auc:0.688597+0.010349 
[12]	train-auc:0.702628+0.005441	test-auc:0.692044+0.007398 
[13]	train-auc:0.712248+0.006634	test-auc:0.696255+0.007547 
[14]	train-auc:0.720888+0.006697	test-auc:0.700026+0.007099 
[15]	train-auc:0.730763+0.004484	test-auc:0.704751+0.007059 
[16]	train-auc:0.742758+0.003571	test-auc:0.710272+0.006297 
[17]	train-auc:0.748408+0.002991	test-auc:0.713177+0.006582 
[18]	train-auc:0.757276+0.004137	test-auc:0.718036+0.006967 
[19]	train-auc:0.766454+0.002875	test-auc:0.721880+0.007640 
[20]	train-auc:0.777951+0.002712	test-auc:0.724007+0.006995 
[21]	train-auc:0.787231+0.004007	test-auc:0.725383+0.007520 
[22]	train-auc:0.798868+0.005549	test-auc:0.727906+0.007209 
[23]	train-auc:0.811121+0.003864	test-auc:0.731390+0.006267 
[24]	train-auc:0.820625+0.003523	test-auc:0.734829+0.006322 
[25]	train-auc:0.832166+0.003605	test-auc:0.736240+0.005877 
[26]	train-auc:0.844879+0.003225	test-auc:0.738190+0.006502 
[27]	train-auc:0.854421+0.003562	test-auc:0.740049+0.006306 
[28]	train-auc:0.860781+0.004705	test-auc:0.740219+0.006699 
[29]	train-auc:0.868868+0.006110	test-auc:0.741298+0.006481 
[30]	train-auc:0.877497+0.005014	test-auc:0.741609+0.005201 
[31]	train-auc:0.885772+0.005398	test-auc:0.742661+0.005296 
[32]	train-auc:0.891722+0.005058	test-auc:0.743166+0.005407 
[33]	train-auc:0.897126+0.004983	test-auc:0.743692+0.005017 
[34]	train-auc:0.902504+0.004471	test-auc:0.743536+0.004951 
[35]	train-auc:0.906588+0.004407	test-auc:0.743651+0.005271 
[36]	train-auc:0.910311+0.005029	test-auc:0.743689+0.005301 
[37]	train-auc:0.913608+0.006681	test-auc:0.743455+0.006044 
[38]	train-auc:0.917220+0.006691	test-auc:0.743336+0.006146 
[39]	train-auc:0.919106+0.006931	test-auc:0.743393+0.005912 
[40]	train-auc:0.921472+0.005516	test-auc:0.743494+0.005830 
[41]	train-auc:0.924114+0.005313	test-auc:0.743353+0.005534 
[42]	train-auc:0.925936+0.005296	test-auc:0.743423+0.005332 
[43]	train-auc:0.927447+0.004874	test-auc:0.743596+0.005305 
Stopping. Best iteration:
[33]	train-auc:0.897126+0.004983	test-auc:0.743692+0.005017




Depth 12

[1]	train-auc:0.658487+0.000773	test-auc:0.656064+0.004847 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.664195+0.007087	test-auc:0.660833+0.003112 
[3]	train-auc:0.667848+0.008070	test-auc:0.663169+0.005273 
[4]	train-auc:0.668485+0.007937	test-auc:0.663340+0.005168 
[5]	train-auc:0.675640+0.005324	test-auc:0.669856+0.008744 
[6]	train-auc:0.684826+0.005615	test-auc:0.679489+0.010322 
[7]	train-auc:0.687486+0.006849	test-auc:0.681111+0.009988 
[8]	train-auc:0.696186+0.002310	test-auc:0.686719+0.007992 
[9]	train-auc:0.702399+0.002826	test-auc:0.690000+0.006621 
[10]	train-auc:0.709531+0.005483	test-auc:0.694919+0.005686 
[11]	train-auc:0.716507+0.003330	test-auc:0.698244+0.007845 
[12]	train-auc:0.722724+0.002878	test-auc:0.700841+0.007885 
[13]	train-auc:0.730157+0.004901	test-auc:0.704176+0.005486 
[14]	train-auc:0.738934+0.002835	test-auc:0.707085+0.006311 
[15]	train-auc:0.748432+0.003161	test-auc:0.711243+0.009424 
[16]	train-auc:0.757706+0.002364	test-auc:0.714153+0.009536 
[17]	train-auc:0.768886+0.002191	test-auc:0.717853+0.007451 
[18]	train-auc:0.780554+0.002784	test-auc:0.721775+0.009320 
[19]	train-auc:0.792912+0.004277	test-auc:0.724726+0.008939 
[20]	train-auc:0.804944+0.003544	test-auc:0.726605+0.007936 
[21]	train-auc:0.822261+0.004336	test-auc:0.729812+0.007389 
[22]	train-auc:0.835503+0.005101	test-auc:0.733263+0.007949 
[23]	train-auc:0.851695+0.005421	test-auc:0.735799+0.006803 
[24]	train-auc:0.864937+0.004726	test-auc:0.738811+0.006382 
[25]	train-auc:0.877747+0.004277	test-auc:0.740022+0.006841 
[26]	train-auc:0.888997+0.004808	test-auc:0.739785+0.006891 
[27]	train-auc:0.896952+0.005145	test-auc:0.739575+0.006622 
[28]	train-auc:0.904488+0.004215	test-auc:0.740404+0.006667 
[29]	train-auc:0.913408+0.005867	test-auc:0.740976+0.006797 
[30]	train-auc:0.921491+0.004352	test-auc:0.741478+0.006283 
[31]	train-auc:0.929640+0.002148	test-auc:0.741724+0.006626 
[32]	train-auc:0.934957+0.003333	test-auc:0.741161+0.006163 
[33]	train-auc:0.939236+0.003663	test-auc:0.741322+0.005932 
[34]	train-auc:0.943244+0.003743	test-auc:0.741191+0.006144 
[35]	train-auc:0.947085+0.003861	test-auc:0.741469+0.006514 
[36]	train-auc:0.949829+0.003396	test-auc:0.741806+0.006873 
[37]	train-auc:0.951923+0.002997	test-auc:0.742339+0.006366 
[38]	train-auc:0.953610+0.002640	test-auc:0.742214+0.006370 
[39]	train-auc:0.955398+0.003594	test-auc:0.741508+0.006048 
[40]	train-auc:0.956503+0.003704	test-auc:0.741915+0.006250 
[41]	train-auc:0.959261+0.002595	test-auc:0.741539+0.006519 
[42]	train-auc:0.961178+0.002100	test-auc:0.741315+0.006832 
[43]	train-auc:0.962769+0.003119	test-auc:0.740852+0.006862 
[44]	train-auc:0.963512+0.003312	test-auc:0.740782+0.006927 
[45]	train-auc:0.965149+0.002850	test-auc:0.740652+0.006646 
[46]	train-auc:0.966017+0.002642	test-auc:0.740730+0.006361 
[47]	train-auc:0.966535+0.002718	test-auc:0.740532+0.006411 
Stopping. Best iteration:
[37]	train-auc:0.951923+0.002997	test-auc:0.742339+0.006366






Fold 1

[1]	train-auc:0.656278	test-auc:0.656404 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.655766	test-auc:0.655398 
[3]	train-auc:0.655769	test-auc:0.655402 
[4]	train-auc:0.655770	test-auc:0.655403 
[5]	train-auc:0.655772	test-auc:0.655404 
[6]	train-auc:0.655773	test-auc:0.655411 
[7]	train-auc:0.655775	test-auc:0.655412 
[8]	train-auc:0.655777	test-auc:0.655413 
[9]	train-auc:0.656403	test-auc:0.656362 
[10]	train-auc:0.656619	test-auc:0.656573 
[11]	train-auc:0.657339	test-auc:0.657763 
[12]	train-auc:0.657441	test-auc:0.657760 
[13]	train-auc:0.657440	test-auc:0.657762 
[14]	train-auc:0.657442	test-auc:0.657762 
[15]	train-auc:0.658054	test-auc:0.658296 
[16]	train-auc:0.659133	test-auc:0.659284 
[17]	train-auc:0.659128	test-auc:0.659274 
[18]	train-auc:0.659133	test-auc:0.659279 
[19]	train-auc:0.659238	test-auc:0.659275 
[20]	train-auc:0.659236	test-auc:0.659273 
[21]	train-auc:0.659498	test-auc:0.659702 
[22]	train-auc:0.659500	test-auc:0.659699 
[23]	train-auc:0.659897	test-auc:0.660239 
[24]	train-auc:0.659898	test-auc:0.660239 
[25]	train-auc:0.659896	test-auc:0.660232 
[26]	train-auc:0.659898	test-auc:0.660232 
[27]	train-auc:0.660002	test-auc:0.660229 
[28]	train-auc:0.659999	test-auc:0.660217 
[29]	train-auc:0.660000	test-auc:0.660218 
[30]	train-auc:0.660415	test-auc:0.660207 
[31]	train-auc:0.678599	test-auc:0.676104 
[32]	train-auc:0.683192	test-auc:0.683095 
[33]	train-auc:0.683028	test-auc:0.682492 
[34]	train-auc:0.683163	test-auc:0.682725 
[35]	train-auc:0.683227	test-auc:0.682554 
[36]	train-auc:0.683221	test-auc:0.682548 
[37]	train-auc:0.683155	test-auc:0.682724 
[38]	train-auc:0.683155	test-auc:0.682719 
[39]	train-auc:0.683154	test-auc:0.682718 
[40]	train-auc:0.683255	test-auc:0.682717 
[41]	train-auc:0.683252	test-auc:0.682710 
[42]	train-auc:0.683277	test-auc:0.682728 
[43]	train-auc:0.683277	test-auc:0.682726 
[44]	train-auc:0.683585	test-auc:0.683270 
[45]	train-auc:0.683901	test-auc:0.683480 
[46]	train-auc:0.684097	test-auc:0.683477 
[47]	train-auc:0.684236	test-auc:0.683478 
[48]	train-auc:0.684235	test-auc:0.683473 
[49]	train-auc:0.684341	test-auc:0.683469 
[50]	train-auc:0.684746	test-auc:0.684381 
[51]	train-auc:0.684972	test-auc:0.684447 
[52]	train-auc:0.687379	test-auc:0.685631 
[53]	train-auc:0.687601	test-auc:0.685541 
[54]	train-auc:0.688693	test-auc:0.686327 
[55]	train-auc:0.688689	test-auc:0.686318 
[56]	train-auc:0.688689	test-auc:0.686322 
[57]	train-auc:0.691070	test-auc:0.688926 
[58]	train-auc:0.691616	test-auc:0.688900 
[59]	train-auc:0.691589	test-auc:0.689163 
[60]	train-auc:0.692336	test-auc:0.689689 
[61]	train-auc:0.692934	test-auc:0.690109 
[62]	train-auc:0.693794	test-auc:0.689684 
[63]	train-auc:0.694038	test-auc:0.689698 
[64]	train-auc:0.694144	test-auc:0.689703 
[65]	train-auc:0.694189	test-auc:0.689735 
[66]	train-auc:0.694421	test-auc:0.689693 
[67]	train-auc:0.698355	test-auc:0.693414 
[68]	train-auc:0.698374	test-auc:0.693392 
[69]	train-auc:0.698650	test-auc:0.693386 
[70]	train-auc:0.699563	test-auc:0.693771 
[71]	train-auc:0.700020	test-auc:0.693996 
[72]	train-auc:0.700166	test-auc:0.694027 
[73]	train-auc:0.700411	test-auc:0.693982 
[74]	train-auc:0.700471	test-auc:0.693975 
[75]	train-auc:0.700597	test-auc:0.694092 
[76]	train-auc:0.700910	test-auc:0.694348 
[77]	train-auc:0.702395	test-auc:0.695374 
[78]	train-auc:0.702666	test-auc:0.695301 
[79]	train-auc:0.704091	test-auc:0.695566 
[80]	train-auc:0.705403	test-auc:0.696424 
[81]	train-auc:0.705402	test-auc:0.696450 
[82]	train-auc:0.705414	test-auc:0.696533 
[83]	train-auc:0.705417	test-auc:0.696585 
[84]	train-auc:0.705673	test-auc:0.696679 
[85]	train-auc:0.705644	test-auc:0.696899 
[86]	train-auc:0.709574	test-auc:0.701000 
[87]	train-auc:0.709443	test-auc:0.701180 
[88]	train-auc:0.709659	test-auc:0.701086 
[89]	train-auc:0.709866	test-auc:0.701432 
[90]	train-auc:0.710685	test-auc:0.701650 
[91]	train-auc:0.713543	test-auc:0.702286 
[92]	train-auc:0.713909	test-auc:0.702322 
[93]	train-auc:0.716137	test-auc:0.705254 
[94]	train-auc:0.716718	test-auc:0.705103 
[95]	train-auc:0.717555	test-auc:0.705193 
[96]	train-auc:0.719184	test-auc:0.706799 
[97]	train-auc:0.719372	test-auc:0.707259 
[98]	train-auc:0.720041	test-auc:0.707777 
[99]	train-auc:0.722148	test-auc:0.708337 
[100]	train-auc:0.722822	test-auc:0.708616 
[101]	train-auc:0.722993	test-auc:0.708625 
[102]	train-auc:0.724783	test-auc:0.710318 
[103]	train-auc:0.725618	test-auc:0.710499 
[104]	train-auc:0.726313	test-auc:0.710877 
[105]	train-auc:0.726983	test-auc:0.711239 
[106]	train-auc:0.727659	test-auc:0.710925 
[107]	train-auc:0.727931	test-auc:0.711098 
[108]	train-auc:0.728774	test-auc:0.711515 
[109]	train-auc:0.729545	test-auc:0.711759 
[110]	train-auc:0.731980	test-auc:0.712984 
[111]	train-auc:0.736548	test-auc:0.716636 
[112]	train-auc:0.737772	test-auc:0.717161 
[113]	train-auc:0.738929	test-auc:0.718519 
[114]	train-auc:0.742149	test-auc:0.719818 
[115]	train-auc:0.743537	test-auc:0.720645 
[116]	train-auc:0.744378	test-auc:0.721137 
[117]	train-auc:0.744536	test-auc:0.721884 
[118]	train-auc:0.745759	test-auc:0.722880 
[119]	train-auc:0.746306	test-auc:0.723183 
[120]	train-auc:0.747263	test-auc:0.723210 
[121]	train-auc:0.748321	test-auc:0.723242 
[122]	train-auc:0.748693	test-auc:0.723417 
[123]	train-auc:0.749208	test-auc:0.723955 
[124]	train-auc:0.750161	test-auc:0.725108 
[125]	train-auc:0.750467	test-auc:0.725211 
[126]	train-auc:0.751102	test-auc:0.725790 
[127]	train-auc:0.752993	test-auc:0.726303 
[128]	train-auc:0.753826	test-auc:0.726921 
[129]	train-auc:0.754338	test-auc:0.726934 
[130]	train-auc:0.755098	test-auc:0.727494 
[131]	train-auc:0.757536	test-auc:0.729076 
[132]	train-auc:0.758412	test-auc:0.728912 
[133]	train-auc:0.759065	test-auc:0.729950 
[134]	train-auc:0.761099	test-auc:0.730715 
[135]	train-auc:0.761522	test-auc:0.731036 
[136]	train-auc:0.762713	test-auc:0.731477 
[137]	train-auc:0.765674	test-auc:0.732025 
[138]	train-auc:0.768811	test-auc:0.732368 
[139]	train-auc:0.770582	test-auc:0.733130 
[140]	train-auc:0.771453	test-auc:0.733609 
[141]	train-auc:0.773846	test-auc:0.734858 
[142]	train-auc:0.775404	test-auc:0.735636 
[143]	train-auc:0.777677	test-auc:0.736378 
[144]	train-auc:0.779971	test-auc:0.736879 
[145]	train-auc:0.780996	test-auc:0.737175 
[146]	train-auc:0.782815	test-auc:0.737401 
[147]	train-auc:0.783919	test-auc:0.737863 
[148]	train-auc:0.785293	test-auc:0.737663 
[149]	train-auc:0.787614	test-auc:0.737806 
[150]	train-auc:0.789035	test-auc:0.737893 
[151]	train-auc:0.790082	test-auc:0.737926 
[152]	train-auc:0.792559	test-auc:0.738531 
[153]	train-auc:0.793229	test-auc:0.738565 
[154]	train-auc:0.795699	test-auc:0.740327 
[155]	train-auc:0.797557	test-auc:0.741698 
[156]	train-auc:0.798701	test-auc:0.742314 
[157]	train-auc:0.800282	test-auc:0.742166 
[158]	train-auc:0.802353	test-auc:0.742409 
[159]	train-auc:0.803491	test-auc:0.742416 
[160]	train-auc:0.805711	test-auc:0.742710 
[161]	train-auc:0.807560	test-auc:0.743351 
[162]	train-auc:0.809125	test-auc:0.743437 
[163]	train-auc:0.810635	test-auc:0.743745 
[164]	train-auc:0.811811	test-auc:0.743993 
[165]	train-auc:0.813471	test-auc:0.744166 
[166]	train-auc:0.815176	test-auc:0.744822 
[167]	train-auc:0.816553	test-auc:0.745055 
[168]	train-auc:0.818655	test-auc:0.745135 
[169]	train-auc:0.821414	test-auc:0.745315 
[170]	train-auc:0.823305	test-auc:0.745584 
[171]	train-auc:0.825095	test-auc:0.745892 
[172]	train-auc:0.826563	test-auc:0.746360 
[173]	train-auc:0.827710	test-auc:0.746169 
[174]	train-auc:0.829204	test-auc:0.746843 
[175]	train-auc:0.830668	test-auc:0.747377 
[176]	train-auc:0.832597	test-auc:0.747804 
[177]	train-auc:0.833968	test-auc:0.747994 
[178]	train-auc:0.835234	test-auc:0.748028 
[179]	train-auc:0.836220	test-auc:0.748183 
[180]	train-auc:0.837844	test-auc:0.748576 
[181]	train-auc:0.839055	test-auc:0.748774 
[182]	train-auc:0.840156	test-auc:0.748888 
[183]	train-auc:0.841534	test-auc:0.749266 
[184]	train-auc:0.842505	test-auc:0.749167 
[185]	train-auc:0.844987	test-auc:0.749797 
[186]	train-auc:0.846983	test-auc:0.750192 
[187]	train-auc:0.848150	test-auc:0.750300 
[188]	train-auc:0.849825	test-auc:0.750643 
[189]	train-auc:0.850732	test-auc:0.750804 
[190]	train-auc:0.853046	test-auc:0.751231 
[191]	train-auc:0.854314	test-auc:0.751570 
[192]	train-auc:0.855362	test-auc:0.751978 
[193]	train-auc:0.856922	test-auc:0.752221 
[194]	train-auc:0.859068	test-auc:0.752241 
[195]	train-auc:0.860713	test-auc:0.752568 
[196]	train-auc:0.861535	test-auc:0.752557 
[197]	train-auc:0.863621	test-auc:0.752721 
[198]	train-auc:0.865877	test-auc:0.753174 
[199]	train-auc:0.867994	test-auc:0.753252 
[200]	train-auc:0.869346	test-auc:0.753384 
[201]	train-auc:0.870305	test-auc:0.753394 
[202]	train-auc:0.872246	test-auc:0.753871 
[203]	train-auc:0.873623	test-auc:0.753782 
[204]	train-auc:0.875437	test-auc:0.753786 
[205]	train-auc:0.876941	test-auc:0.753624 
[206]	train-auc:0.878740	test-auc:0.754238 
[207]	train-auc:0.880045	test-auc:0.755004 
[208]	train-auc:0.881205	test-auc:0.755035 
[209]	train-auc:0.882615	test-auc:0.755274 
[210]	train-auc:0.883719	test-auc:0.755490 
[211]	train-auc:0.884638	test-auc:0.755560 
[212]	train-auc:0.885942	test-auc:0.755361 
[213]	train-auc:0.887358	test-auc:0.755223 
[214]	train-auc:0.890376	test-auc:0.755388 
[215]	train-auc:0.891169	test-auc:0.755844 
[216]	train-auc:0.893669	test-auc:0.755843 
[217]	train-auc:0.894793	test-auc:0.756299 
[218]	train-auc:0.896801	test-auc:0.756335 
[219]	train-auc:0.898041	test-auc:0.756448 
[220]	train-auc:0.899203	test-auc:0.756284 
[221]	train-auc:0.901175	test-auc:0.756065 
[222]	train-auc:0.902076	test-auc:0.756014 
[223]	train-auc:0.903856	test-auc:0.755539 
[224]	train-auc:0.905817	test-auc:0.755619 
[225]	train-auc:0.906793	test-auc:0.755655 
[226]	train-auc:0.908084	test-auc:0.755993 
[227]	train-auc:0.910257	test-auc:0.756063 
[228]	train-auc:0.911283	test-auc:0.755930 
[229]	train-auc:0.911965	test-auc:0.756246 
[230]	train-auc:0.912987	test-auc:0.756365 
[231]	train-auc:0.914664	test-auc:0.756480 
[232]	train-auc:0.915310	test-auc:0.756549 
[233]	train-auc:0.916116	test-auc:0.756574 
[234]	train-auc:0.918026	test-auc:0.756919 
[235]	train-auc:0.919216	test-auc:0.756654 
[236]	train-auc:0.920928	test-auc:0.756829 
[237]	train-auc:0.922013	test-auc:0.756916 
[238]	train-auc:0.923035	test-auc:0.757067 
[239]	train-auc:0.924070	test-auc:0.756969 
[240]	train-auc:0.925183	test-auc:0.757294 
[241]	train-auc:0.926615	test-auc:0.757230 
[242]	train-auc:0.927798	test-auc:0.757296 
[243]	train-auc:0.928903	test-auc:0.757248 
[244]	train-auc:0.929411	test-auc:0.757010 
[245]	train-auc:0.930260	test-auc:0.757454 
[246]	train-auc:0.930709	test-auc:0.757472 
[247]	train-auc:0.931765	test-auc:0.757590 
[248]	train-auc:0.932503	test-auc:0.757600 
[249]	train-auc:0.933268	test-auc:0.757813 
[250]	train-auc:0.934034	test-auc:0.757849 
[251]	train-auc:0.934730	test-auc:0.758011 
[252]	train-auc:0.935146	test-auc:0.758108 
[253]	train-auc:0.936137	test-auc:0.757952 
[254]	train-auc:0.936620	test-auc:0.758048 
[255]	train-auc:0.937065	test-auc:0.758173 
[256]	train-auc:0.937505	test-auc:0.757997 
[257]	train-auc:0.938047	test-auc:0.757995 
[258]	train-auc:0.938360	test-auc:0.757953 
[259]	train-auc:0.938914	test-auc:0.758108 
[260]	train-auc:0.939493	test-auc:0.758094 
[261]	train-auc:0.940196	test-auc:0.758020 
[262]	train-auc:0.941021	test-auc:0.758117 
[263]	train-auc:0.941567	test-auc:0.758071 
[264]	train-auc:0.942131	test-auc:0.758156 
[265]	train-auc:0.942802	test-auc:0.758350 
[266]	train-auc:0.943634	test-auc:0.758345 
[267]	train-auc:0.944328	test-auc:0.758496 
[268]	train-auc:0.944749	test-auc:0.758631 
[269]	train-auc:0.945333	test-auc:0.758658 
[270]	train-auc:0.946039	test-auc:0.758658 
[271]	train-auc:0.946605	test-auc:0.758731 
[272]	train-auc:0.947030	test-auc:0.758642 
[273]	train-auc:0.947673	test-auc:0.758708 
[274]	train-auc:0.948001	test-auc:0.758738 
[275]	train-auc:0.948305	test-auc:0.758823 
[276]	train-auc:0.948540	test-auc:0.758918 
[277]	train-auc:0.949052	test-auc:0.758839 
[278]	train-auc:0.949517	test-auc:0.758681 
[279]	train-auc:0.949747	test-auc:0.758819 
[280]	train-auc:0.949970	test-auc:0.758936 
[281]	train-auc:0.950147	test-auc:0.759027 
[282]	train-auc:0.950396	test-auc:0.758742 
[283]	train-auc:0.950531	test-auc:0.758879 
[284]	train-auc:0.950710	test-auc:0.758874 
[285]	train-auc:0.950837	test-auc:0.758867 
[286]	train-auc:0.951177	test-auc:0.758830 
[287]	train-auc:0.951280	test-auc:0.758868 
[288]	train-auc:0.951910	test-auc:0.758949 
[289]	train-auc:0.952087	test-auc:0.758897 
[290]	train-auc:0.952257	test-auc:0.758807 
[291]	train-auc:0.952437	test-auc:0.758776 
[292]	train-auc:0.952596	test-auc:0.758733 
[293]	train-auc:0.952839	test-auc:0.758772 
[294]	train-auc:0.952927	test-auc:0.758777 
[295]	train-auc:0.953101	test-auc:0.758870 
[296]	train-auc:0.953192	test-auc:0.758940 
[297]	train-auc:0.953434	test-auc:0.759015 
[298]	train-auc:0.953646	test-auc:0.759070 
[299]	train-auc:0.953791	test-auc:0.759109 
[300]	train-auc:0.954103	test-auc:0.759239 
[301]	train-auc:0.954334	test-auc:0.759210 
[302]	train-auc:0.954523	test-auc:0.759174 
[303]	train-auc:0.954860	test-auc:0.759283 
[304]	train-auc:0.955242	test-auc:0.759302 
[305]	train-auc:0.955329	test-auc:0.759300 
[306]	train-auc:0.955625	test-auc:0.759285 
[307]	train-auc:0.956226	test-auc:0.759204 
[308]	train-auc:0.956643	test-auc:0.759313 
[309]	train-auc:0.956706	test-auc:0.759370 
[310]	train-auc:0.956863	test-auc:0.759370 
[311]	train-auc:0.956953	test-auc:0.759368 
[312]	train-auc:0.957159	test-auc:0.759320 
[313]	train-auc:0.957323	test-auc:0.759396 
[314]	train-auc:0.957417	test-auc:0.759402 
[315]	train-auc:0.957614	test-auc:0.759337 
[316]	train-auc:0.957748	test-auc:0.759276 
[317]	train-auc:0.957949	test-auc:0.759358 
[318]	train-auc:0.958081	test-auc:0.759416 
[319]	train-auc:0.958258	test-auc:0.759470 
[320]	train-auc:0.958578	test-auc:0.759426 
[321]	train-auc:0.958670	test-auc:0.759372 
[322]	train-auc:0.958769	test-auc:0.759322 
[323]	train-auc:0.958868	test-auc:0.759325 
[324]	train-auc:0.958920	test-auc:0.759269 
[325]	train-auc:0.958973	test-auc:0.759320 
[326]	train-auc:0.959105	test-auc:0.759220 
[327]	train-auc:0.959223	test-auc:0.758982 
[328]	train-auc:0.959333	test-auc:0.759021 
[329]	train-auc:0.959396	test-auc:0.759063 
[330]	train-auc:0.959504	test-auc:0.759076 
[331]	train-auc:0.959738	test-auc:0.759039 
[332]	train-auc:0.959845	test-auc:0.759122 
[333]	train-auc:0.959986	test-auc:0.759085 
[334]	train-auc:0.960006	test-auc:0.759037 
[335]	train-auc:0.960082	test-auc:0.759067 
[336]	train-auc:0.960224	test-auc:0.759009 
[337]	train-auc:0.960246	test-auc:0.758944 
[338]	train-auc:0.960407	test-auc:0.758971 
[339]	train-auc:0.960536	test-auc:0.758942 
[340]	train-auc:0.960849	test-auc:0.758762 
[341]	train-auc:0.960897	test-auc:0.758802 
[342]	train-auc:0.961066	test-auc:0.758715 
[343]	train-auc:0.961096	test-auc:0.758733 
[344]	train-auc:0.961154	test-auc:0.758781 
[345]	train-auc:0.961248	test-auc:0.758702 
[346]	train-auc:0.961359	test-auc:0.758693 
[347]	train-auc:0.961395	test-auc:0.758665 
[348]	train-auc:0.961495	test-auc:0.758655 
[349]	train-auc:0.961582	test-auc:0.758710 
[350]	train-auc:0.961618	test-auc:0.758691 
[351]	train-auc:0.961729	test-auc:0.758665 
[352]	train-auc:0.961727	test-auc:0.758608 
[353]	train-auc:0.961863	test-auc:0.758555 
[354]	train-auc:0.961988	test-auc:0.758461 
[355]	train-auc:0.962037	test-auc:0.758396 
[356]	train-auc:0.962180	test-auc:0.758332 
[357]	train-auc:0.962193	test-auc:0.758278 
[358]	train-auc:0.962221	test-auc:0.758276 
[359]	train-auc:0.962383	test-auc:0.758247 
[360]	train-auc:0.962471	test-auc:0.758284 
[361]	train-auc:0.962610	test-auc:0.758195 
[362]	train-auc:0.962789	test-auc:0.758063 
[363]	train-auc:0.962823	test-auc:0.758057 
[364]	train-auc:0.962860	test-auc:0.758033 
[365]	train-auc:0.962949	test-auc:0.757909 
[366]	train-auc:0.963116	test-auc:0.757962 
[367]	train-auc:0.963251	test-auc:0.757766 
[368]	train-auc:0.963291	test-auc:0.757768 
[369]	train-auc:0.963395	test-auc:0.757823 
Stopping. Best iteration:
[319]	train-auc:0.958258	test-auc:0.759470




Fold 2

[1]	train-auc:0.656659	test-auc:0.660168 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.656164	test-auc:0.659982 
[3]	train-auc:0.656166	test-auc:0.659987 
[4]	train-auc:0.656463	test-auc:0.660305 
[5]	train-auc:0.658097	test-auc:0.663383 
[6]	train-auc:0.658103	test-auc:0.663388 
[7]	train-auc:0.658106	test-auc:0.663387 
[8]	train-auc:0.658107	test-auc:0.663384 
[9]	train-auc:0.658063	test-auc:0.663406 
[10]	train-auc:0.658279	test-auc:0.663222 
[11]	train-auc:0.658281	test-auc:0.663222 
[12]	train-auc:0.658282	test-auc:0.663223 
[13]	train-auc:0.659035	test-auc:0.663894 
[14]	train-auc:0.660260	test-auc:0.664607 
[15]	train-auc:0.660261	test-auc:0.664607 
[16]	train-auc:0.660262	test-auc:0.664607 
[17]	train-auc:0.660269	test-auc:0.664613 
[18]	train-auc:0.660270	test-auc:0.664613 
[19]	train-auc:0.660271	test-auc:0.664613 
[20]	train-auc:0.660328	test-auc:0.664602 
[21]	train-auc:0.660329	test-auc:0.664603 
[22]	train-auc:0.660336	test-auc:0.664616 
[23]	train-auc:0.660440	test-auc:0.664609 
[24]	train-auc:0.660415	test-auc:0.664548 
[25]	train-auc:0.660416	test-auc:0.664548 
[26]	train-auc:0.660415	test-auc:0.664548 
[27]	train-auc:0.672519	test-auc:0.679178 
[28]	train-auc:0.673188	test-auc:0.679491 
[29]	train-auc:0.673540	test-auc:0.679998 
[30]	train-auc:0.673543	test-auc:0.679999 
[31]	train-auc:0.673551	test-auc:0.680001 
[32]	train-auc:0.673554	test-auc:0.679995 
[33]	train-auc:0.673552	test-auc:0.679990 
[34]	train-auc:0.674112	test-auc:0.681133 
[35]	train-auc:0.676044	test-auc:0.681439 
[36]	train-auc:0.676046	test-auc:0.681439 
[37]	train-auc:0.676047	test-auc:0.681440 
[38]	train-auc:0.676051	test-auc:0.681443 
[39]	train-auc:0.683955	test-auc:0.688771 
[40]	train-auc:0.683970	test-auc:0.688755 
[41]	train-auc:0.684612	test-auc:0.689908 
[42]	train-auc:0.684598	test-auc:0.689929 
[43]	train-auc:0.684597	test-auc:0.689928 
[44]	train-auc:0.684676	test-auc:0.689680 
[45]	train-auc:0.684674	test-auc:0.689664 
[46]	train-auc:0.684326	test-auc:0.689280 
[47]	train-auc:0.684372	test-auc:0.689223 
[48]	train-auc:0.689015	test-auc:0.695399 
[49]	train-auc:0.689162	test-auc:0.695394 
[50]	train-auc:0.689702	test-auc:0.696400 
[51]	train-auc:0.689691	test-auc:0.695988 
[52]	train-auc:0.690589	test-auc:0.696536 
[53]	train-auc:0.690349	test-auc:0.696315 
[54]	train-auc:0.690429	test-auc:0.696818 
[55]	train-auc:0.691416	test-auc:0.697399 
[56]	train-auc:0.691486	test-auc:0.697343 
[57]	train-auc:0.692044	test-auc:0.698436 
[58]	train-auc:0.692399	test-auc:0.698373 
[59]	train-auc:0.692383	test-auc:0.698263 
[60]	train-auc:0.692792	test-auc:0.698473 
[61]	train-auc:0.692865	test-auc:0.698406 
[62]	train-auc:0.694891	test-auc:0.701059 
[63]	train-auc:0.694960	test-auc:0.700977 
[64]	train-auc:0.694968	test-auc:0.700943 
[65]	train-auc:0.695198	test-auc:0.700976 
[66]	train-auc:0.695383	test-auc:0.700944 
[67]	train-auc:0.695384	test-auc:0.700944 
[68]	train-auc:0.696983	test-auc:0.701230 
[69]	train-auc:0.697027	test-auc:0.701279 
[70]	train-auc:0.697257	test-auc:0.701258 
[71]	train-auc:0.698146	test-auc:0.702631 
[72]	train-auc:0.698202	test-auc:0.702562 
[73]	train-auc:0.698561	test-auc:0.702569 
[74]	train-auc:0.698545	test-auc:0.702528 
[75]	train-auc:0.698983	test-auc:0.702522 
[76]	train-auc:0.699131	test-auc:0.702699 
[77]	train-auc:0.699247	test-auc:0.702639 
[78]	train-auc:0.701352	test-auc:0.704190 
[79]	train-auc:0.701428	test-auc:0.704205 
[80]	train-auc:0.705890	test-auc:0.707989 
[81]	train-auc:0.706280	test-auc:0.708109 
[82]	train-auc:0.706549	test-auc:0.708223 
[83]	train-auc:0.707260	test-auc:0.708599 
[84]	train-auc:0.707310	test-auc:0.708629 
[85]	train-auc:0.708171	test-auc:0.708700 
[86]	train-auc:0.710611	test-auc:0.709725 
[87]	train-auc:0.711296	test-auc:0.709597 
[88]	train-auc:0.712274	test-auc:0.709911 
[89]	train-auc:0.712061	test-auc:0.709654 
[90]	train-auc:0.715245	test-auc:0.711858 
[91]	train-auc:0.715534	test-auc:0.712054 
[92]	train-auc:0.715722	test-auc:0.711848 
[93]	train-auc:0.715794	test-auc:0.711820 
[94]	train-auc:0.716181	test-auc:0.712117 
[95]	train-auc:0.716981	test-auc:0.712461 
[96]	train-auc:0.717912	test-auc:0.713029 
[97]	train-auc:0.718135	test-auc:0.712933 
[98]	train-auc:0.720141	test-auc:0.713687 
[99]	train-auc:0.721559	test-auc:0.713996 
[100]	train-auc:0.721917	test-auc:0.714169 
[101]	train-auc:0.722632	test-auc:0.714063 
[102]	train-auc:0.722918	test-auc:0.713991 
[103]	train-auc:0.723631	test-auc:0.713924 
[104]	train-auc:0.724522	test-auc:0.713941 
[105]	train-auc:0.724708	test-auc:0.714231 
[106]	train-auc:0.727426	test-auc:0.714916 
[107]	train-auc:0.728011	test-auc:0.715715 
[108]	train-auc:0.728484	test-auc:0.715621 
[109]	train-auc:0.728734	test-auc:0.715695 
[110]	train-auc:0.729028	test-auc:0.715859 
[111]	train-auc:0.729409	test-auc:0.715743 
[112]	train-auc:0.733255	test-auc:0.716526 
[113]	train-auc:0.735426	test-auc:0.716571 
[114]	train-auc:0.737691	test-auc:0.716725 
[115]	train-auc:0.738880	test-auc:0.716654 
[116]	train-auc:0.739745	test-auc:0.716731 
[117]	train-auc:0.742856	test-auc:0.717979 
[118]	train-auc:0.744410	test-auc:0.718301 
[119]	train-auc:0.745564	test-auc:0.718442 
[120]	train-auc:0.746269	test-auc:0.718472 
[121]	train-auc:0.746708	test-auc:0.718675 
[122]	train-auc:0.747549	test-auc:0.718949 
[123]	train-auc:0.748009	test-auc:0.718944 
[124]	train-auc:0.749474	test-auc:0.718961 
[125]	train-auc:0.750335	test-auc:0.718997 
[126]	train-auc:0.750898	test-auc:0.719032 
[127]	train-auc:0.751860	test-auc:0.718997 
[128]	train-auc:0.753663	test-auc:0.719904 
[129]	train-auc:0.755351	test-auc:0.720012 
[130]	train-auc:0.755943	test-auc:0.720201 
[131]	train-auc:0.756868	test-auc:0.720929 
[132]	train-auc:0.758101	test-auc:0.721326 
[133]	train-auc:0.759250	test-auc:0.721785 
[134]	train-auc:0.760859	test-auc:0.722472 
[135]	train-auc:0.763270	test-auc:0.722670 
[136]	train-auc:0.764795	test-auc:0.723438 
[137]	train-auc:0.767358	test-auc:0.723890 
[138]	train-auc:0.768657	test-auc:0.724078 
[139]	train-auc:0.769613	test-auc:0.724305 
[140]	train-auc:0.770945	test-auc:0.724741 
[141]	train-auc:0.773110	test-auc:0.726097 
[142]	train-auc:0.774360	test-auc:0.726982 
[143]	train-auc:0.775157	test-auc:0.727044 
[144]	train-auc:0.775838	test-auc:0.727387 
[145]	train-auc:0.778962	test-auc:0.728278 
[146]	train-auc:0.781352	test-auc:0.729128 
[147]	train-auc:0.783375	test-auc:0.729729 
[148]	train-auc:0.785128	test-auc:0.730389 
[149]	train-auc:0.786775	test-auc:0.730758 
[150]	train-auc:0.788845	test-auc:0.731144 
[151]	train-auc:0.791355	test-auc:0.731807 
[152]	train-auc:0.793229	test-auc:0.732665 
[153]	train-auc:0.794650	test-auc:0.733380 
[154]	train-auc:0.796337	test-auc:0.733456 
[155]	train-auc:0.797684	test-auc:0.733572 
[156]	train-auc:0.799673	test-auc:0.733549 
[157]	train-auc:0.800925	test-auc:0.733786 
[158]	train-auc:0.802615	test-auc:0.733913 
[159]	train-auc:0.803999	test-auc:0.733833 
[160]	train-auc:0.805142	test-auc:0.733966 
[161]	train-auc:0.806253	test-auc:0.733783 
[162]	train-auc:0.807559	test-auc:0.733777 
[163]	train-auc:0.808696	test-auc:0.733650 
[164]	train-auc:0.810250	test-auc:0.733532 
[165]	train-auc:0.811639	test-auc:0.733839 
[166]	train-auc:0.812685	test-auc:0.734211 
[167]	train-auc:0.813982	test-auc:0.734329 
[168]	train-auc:0.815626	test-auc:0.735032 
[169]	train-auc:0.816836	test-auc:0.734985 
[170]	train-auc:0.818380	test-auc:0.735263 
[171]	train-auc:0.819918	test-auc:0.736163 
[172]	train-auc:0.820793	test-auc:0.736233 
[173]	train-auc:0.822991	test-auc:0.736999 
[174]	train-auc:0.824668	test-auc:0.738057 
[175]	train-auc:0.826301	test-auc:0.738748 
[176]	train-auc:0.828252	test-auc:0.739035 
[177]	train-auc:0.830869	test-auc:0.739454 
[178]	train-auc:0.832705	test-auc:0.739489 
[179]	train-auc:0.834689	test-auc:0.739763 
[180]	train-auc:0.837133	test-auc:0.740130 
[181]	train-auc:0.838718	test-auc:0.740457 
[182]	train-auc:0.840336	test-auc:0.740950 
[183]	train-auc:0.841680	test-auc:0.741527 
[184]	train-auc:0.843185	test-auc:0.742264 
[185]	train-auc:0.845276	test-auc:0.742950 
[186]	train-auc:0.847181	test-auc:0.743669 
[187]	train-auc:0.848752	test-auc:0.744371 
[188]	train-auc:0.850233	test-auc:0.744638 
[189]	train-auc:0.851534	test-auc:0.745314 
[190]	train-auc:0.852903	test-auc:0.745683 
[191]	train-auc:0.854411	test-auc:0.746079 
[192]	train-auc:0.856006	test-auc:0.746296 
[193]	train-auc:0.857395	test-auc:0.746511 
[194]	train-auc:0.859199	test-auc:0.746862 
[195]	train-auc:0.860498	test-auc:0.747498 
[196]	train-auc:0.861521	test-auc:0.747368 
[197]	train-auc:0.862581	test-auc:0.747540 
[198]	train-auc:0.863242	test-auc:0.747644 
[199]	train-auc:0.864244	test-auc:0.747516 
[200]	train-auc:0.866633	test-auc:0.748500 
[201]	train-auc:0.869133	test-auc:0.749009 
[202]	train-auc:0.871140	test-auc:0.749397 
[203]	train-auc:0.872366	test-auc:0.749497 
[204]	train-auc:0.873231	test-auc:0.749538 
[205]	train-auc:0.875163	test-auc:0.750316 
[206]	train-auc:0.876105	test-auc:0.750214 
[207]	train-auc:0.877103	test-auc:0.750619 
[208]	train-auc:0.878968	test-auc:0.751323 
[209]	train-auc:0.880315	test-auc:0.751508 
[210]	train-auc:0.881429	test-auc:0.751461 
[211]	train-auc:0.882772	test-auc:0.751874 
[212]	train-auc:0.883765	test-auc:0.751826 
[213]	train-auc:0.884679	test-auc:0.751770 
[214]	train-auc:0.886477	test-auc:0.752414 
[215]	train-auc:0.887986	test-auc:0.752354 
[216]	train-auc:0.889584	test-auc:0.752513 
[217]	train-auc:0.890831	test-auc:0.752692 
[218]	train-auc:0.892565	test-auc:0.753013 
[219]	train-auc:0.894270	test-auc:0.753301 
[220]	train-auc:0.895327	test-auc:0.753321 
[221]	train-auc:0.896726	test-auc:0.753522 
[222]	train-auc:0.898603	test-auc:0.753645 
[223]	train-auc:0.899602	test-auc:0.753919 
[224]	train-auc:0.900964	test-auc:0.754117 
[225]	train-auc:0.901696	test-auc:0.754434 
[226]	train-auc:0.903496	test-auc:0.754468 
[227]	train-auc:0.905067	test-auc:0.754919 
[228]	train-auc:0.906683	test-auc:0.755317 
[229]	train-auc:0.908095	test-auc:0.755496 
[230]	train-auc:0.909197	test-auc:0.755558 
[231]	train-auc:0.910546	test-auc:0.755800 
[232]	train-auc:0.912195	test-auc:0.755963 
[233]	train-auc:0.914163	test-auc:0.756155 
[234]	train-auc:0.915516	test-auc:0.756244 
[235]	train-auc:0.917094	test-auc:0.756132 
[236]	train-auc:0.918413	test-auc:0.756216 
[237]	train-auc:0.919919	test-auc:0.756411 
[238]	train-auc:0.920852	test-auc:0.756664 
[239]	train-auc:0.922030	test-auc:0.756683 
[240]	train-auc:0.923030	test-auc:0.756770 
[241]	train-auc:0.924668	test-auc:0.756958 
[242]	train-auc:0.925605	test-auc:0.756955 
[243]	train-auc:0.926945	test-auc:0.757230 
[244]	train-auc:0.927717	test-auc:0.757361 
[245]	train-auc:0.929788	test-auc:0.757443 
[246]	train-auc:0.930808	test-auc:0.757068 
[247]	train-auc:0.931966	test-auc:0.757069 
[248]	train-auc:0.932776	test-auc:0.757034 
[249]	train-auc:0.933940	test-auc:0.757316 
[250]	train-auc:0.934541	test-auc:0.757257 
[251]	train-auc:0.935287	test-auc:0.757125 
[252]	train-auc:0.936632	test-auc:0.757426 
[253]	train-auc:0.937250	test-auc:0.757250 
[254]	train-auc:0.938099	test-auc:0.757404 
[255]	train-auc:0.938508	test-auc:0.757459 
[256]	train-auc:0.939551	test-auc:0.757270 
[257]	train-auc:0.940186	test-auc:0.757178 
[258]	train-auc:0.940969	test-auc:0.757174 
[259]	train-auc:0.941513	test-auc:0.757349 
[260]	train-auc:0.942177	test-auc:0.757117 
[261]	train-auc:0.942686	test-auc:0.756872 
[262]	train-auc:0.943093	test-auc:0.756804 
[263]	train-auc:0.943898	test-auc:0.757183 
[264]	train-auc:0.944984	test-auc:0.757137 
[265]	train-auc:0.945858	test-auc:0.757419 
[266]	train-auc:0.946336	test-auc:0.757157 
[267]	train-auc:0.947291	test-auc:0.757292 
[268]	train-auc:0.947777	test-auc:0.757583 
[269]	train-auc:0.948530	test-auc:0.757625 
[270]	train-auc:0.949062	test-auc:0.757843 
[271]	train-auc:0.949550	test-auc:0.757990 
[272]	train-auc:0.950020	test-auc:0.757926 
[273]	train-auc:0.950359	test-auc:0.758119 
[274]	train-auc:0.950795	test-auc:0.758132 
[275]	train-auc:0.951410	test-auc:0.758068 
[276]	train-auc:0.951799	test-auc:0.757964 
[277]	train-auc:0.952230	test-auc:0.757913 
[278]	train-auc:0.952662	test-auc:0.758017 
[279]	train-auc:0.952747	test-auc:0.757857 
[280]	train-auc:0.953059	test-auc:0.757761 
[281]	train-auc:0.953273	test-auc:0.757875 
[282]	train-auc:0.953721	test-auc:0.757974 
[283]	train-auc:0.954123	test-auc:0.757911 
[284]	train-auc:0.954501	test-auc:0.758094 
[285]	train-auc:0.954772	test-auc:0.758211 
[286]	train-auc:0.954900	test-auc:0.758206 
[287]	train-auc:0.955052	test-auc:0.758320 
[288]	train-auc:0.955215	test-auc:0.758255 
[289]	train-auc:0.955700	test-auc:0.758163 
[290]	train-auc:0.955782	test-auc:0.758108 
[291]	train-auc:0.956089	test-auc:0.758009 
[292]	train-auc:0.956376	test-auc:0.757986 
[293]	train-auc:0.956758	test-auc:0.758210 
[294]	train-auc:0.956842	test-auc:0.758102 
[295]	train-auc:0.957063	test-auc:0.758108 
[296]	train-auc:0.957298	test-auc:0.758225 
[297]	train-auc:0.957672	test-auc:0.758187 
[298]	train-auc:0.957758	test-auc:0.758323 
[299]	train-auc:0.957925	test-auc:0.758146 
[300]	train-auc:0.958033	test-auc:0.758252 
[301]	train-auc:0.958131	test-auc:0.758287 
[302]	train-auc:0.958200	test-auc:0.758252 
[303]	train-auc:0.958475	test-auc:0.758356 
[304]	train-auc:0.958777	test-auc:0.758636 
[305]	train-auc:0.958934	test-auc:0.758597 
[306]	train-auc:0.959143	test-auc:0.758623 
[307]	train-auc:0.959231	test-auc:0.758684 
[308]	train-auc:0.959504	test-auc:0.758684 
[309]	train-auc:0.959566	test-auc:0.758684 
[310]	train-auc:0.959887	test-auc:0.758608 
[311]	train-auc:0.960096	test-auc:0.758565 
[312]	train-auc:0.960116	test-auc:0.758573 
[313]	train-auc:0.960156	test-auc:0.758692 
[314]	train-auc:0.960291	test-auc:0.758662 
[315]	train-auc:0.960650	test-auc:0.758572 
[316]	train-auc:0.960881	test-auc:0.758707 
[317]	train-auc:0.960959	test-auc:0.758729 
[318]	train-auc:0.961082	test-auc:0.758663 
[319]	train-auc:0.961272	test-auc:0.758815 
[320]	train-auc:0.961450	test-auc:0.758812 
[321]	train-auc:0.961554	test-auc:0.758870 
[322]	train-auc:0.961774	test-auc:0.758982 
[323]	train-auc:0.961878	test-auc:0.758930 
[324]	train-auc:0.961989	test-auc:0.759064 
[325]	train-auc:0.962110	test-auc:0.759054 
[326]	train-auc:0.962289	test-auc:0.759127 
[327]	train-auc:0.962641	test-auc:0.759026 
[328]	train-auc:0.962790	test-auc:0.759218 
[329]	train-auc:0.962949	test-auc:0.759069 
[330]	train-auc:0.963017	test-auc:0.759045 
[331]	train-auc:0.963162	test-auc:0.759101 
[332]	train-auc:0.963224	test-auc:0.759125 
[333]	train-auc:0.963439	test-auc:0.759158 
[334]	train-auc:0.963630	test-auc:0.759163 
[335]	train-auc:0.963819	test-auc:0.759211 
[336]	train-auc:0.964005	test-auc:0.759369 
[337]	train-auc:0.964085	test-auc:0.759377 
[338]	train-auc:0.964286	test-auc:0.759374 
[339]	train-auc:0.964372	test-auc:0.759325 
[340]	train-auc:0.964544	test-auc:0.759430 
[341]	train-auc:0.964714	test-auc:0.759429 
[342]	train-auc:0.964836	test-auc:0.759431 
[343]	train-auc:0.965094	test-auc:0.759539 
[344]	train-auc:0.965187	test-auc:0.759500 
[345]	train-auc:0.965262	test-auc:0.759438 
[346]	train-auc:0.965434	test-auc:0.759445 
[347]	train-auc:0.965691	test-auc:0.759582 
[348]	train-auc:0.965826	test-auc:0.759604 
[349]	train-auc:0.965888	test-auc:0.759538 
[350]	train-auc:0.965951	test-auc:0.759477 
[351]	train-auc:0.966035	test-auc:0.759523 
[352]	train-auc:0.966116	test-auc:0.759593 
[353]	train-auc:0.966239	test-auc:0.759565 
[354]	train-auc:0.966365	test-auc:0.759580 
[355]	train-auc:0.966423	test-auc:0.759594 
[356]	train-auc:0.966438	test-auc:0.759588 
[357]	train-auc:0.966562	test-auc:0.759642 
[358]	train-auc:0.966631	test-auc:0.759695 
[359]	train-auc:0.966754	test-auc:0.759741 
[360]	train-auc:0.966931	test-auc:0.759665 
[361]	train-auc:0.966934	test-auc:0.759640 
[362]	train-auc:0.967047	test-auc:0.759658 
[363]	train-auc:0.967197	test-auc:0.759550 
[364]	train-auc:0.967279	test-auc:0.759518 
[365]	train-auc:0.967421	test-auc:0.759565 
[366]	train-auc:0.967497	test-auc:0.759631 
[367]	train-auc:0.967580	test-auc:0.759610 
[368]	train-auc:0.967693	test-auc:0.759606 
[369]	train-auc:0.967696	test-auc:0.759620 
[370]	train-auc:0.967855	test-auc:0.759554 
[371]	train-auc:0.968020	test-auc:0.759596 
[372]	train-auc:0.968206	test-auc:0.759685 
[373]	train-auc:0.968231	test-auc:0.759689 
[374]	train-auc:0.968357	test-auc:0.759760 
[375]	train-auc:0.968408	test-auc:0.759793 
[376]	train-auc:0.968481	test-auc:0.759900 
[377]	train-auc:0.968530	test-auc:0.759937 
[378]	train-auc:0.968623	test-auc:0.760022 
[379]	train-auc:0.968784	test-auc:0.760127 
[380]	train-auc:0.968854	test-auc:0.760161 
[381]	train-auc:0.968940	test-auc:0.760201 
[382]	train-auc:0.968986	test-auc:0.760171 
[383]	train-auc:0.969061	test-auc:0.760098 
[384]	train-auc:0.969315	test-auc:0.760226 
[385]	train-auc:0.969385	test-auc:0.760274 
[386]	train-auc:0.969435	test-auc:0.760345 
[387]	train-auc:0.969519	test-auc:0.760457 
[388]	train-auc:0.969639	test-auc:0.760409 
[389]	train-auc:0.969733	test-auc:0.760395 
[390]	train-auc:0.969759	test-auc:0.760391 
[391]	train-auc:0.969935	test-auc:0.760274 
[392]	train-auc:0.969993	test-auc:0.760276 
[393]	train-auc:0.970043	test-auc:0.760153 
[394]	train-auc:0.970088	test-auc:0.760162 
[395]	train-auc:0.970142	test-auc:0.760194 
[396]	train-auc:0.970193	test-auc:0.760218 
[397]	train-auc:0.970229	test-auc:0.760198 
[398]	train-auc:0.970311	test-auc:0.760217 
[399]	train-auc:0.970360	test-auc:0.760178 
[400]	train-auc:0.970419	test-auc:0.760229 
[401]	train-auc:0.970593	test-auc:0.760238 
[402]	train-auc:0.970639	test-auc:0.760269 
[403]	train-auc:0.970797	test-auc:0.760314 
[404]	train-auc:0.970928	test-auc:0.760332 
[405]	train-auc:0.970967	test-auc:0.760416 
[406]	train-auc:0.971013	test-auc:0.760439 
[407]	train-auc:0.971092	test-auc:0.760478 
[408]	train-auc:0.971252	test-auc:0.760576 
[409]	train-auc:0.971287	test-auc:0.760610 
[410]	train-auc:0.971411	test-auc:0.760646 
[411]	train-auc:0.971447	test-auc:0.760579 
[412]	train-auc:0.971473	test-auc:0.760570 
[413]	train-auc:0.971612	test-auc:0.760559 
[414]	train-auc:0.971704	test-auc:0.760638 
[415]	train-auc:0.971704	test-auc:0.760622 
[416]	train-auc:0.971768	test-auc:0.760716 
[417]	train-auc:0.972040	test-auc:0.760940 
[418]	train-auc:0.972196	test-auc:0.761003 
[419]	train-auc:0.972399	test-auc:0.760964 
[420]	train-auc:0.972451	test-auc:0.761099 
[421]	train-auc:0.972478	test-auc:0.761120 
[422]	train-auc:0.972499	test-auc:0.761134 
[423]	train-auc:0.972647	test-auc:0.761135 
[424]	train-auc:0.972683	test-auc:0.761217 
[425]	train-auc:0.972748	test-auc:0.761299 
[426]	train-auc:0.972974	test-auc:0.761395 
[427]	train-auc:0.973089	test-auc:0.761430 
[428]	train-auc:0.973143	test-auc:0.761463 
[429]	train-auc:0.973206	test-auc:0.761384 
[430]	train-auc:0.973224	test-auc:0.761372 
[431]	train-auc:0.973434	test-auc:0.761486 
[432]	train-auc:0.973488	test-auc:0.761502 
[433]	train-auc:0.973497	test-auc:0.761487 
[434]	train-auc:0.973689	test-auc:0.761517 
[435]	train-auc:0.973722	test-auc:0.761522 
[436]	train-auc:0.973756	test-auc:0.761482 
[437]	train-auc:0.973790	test-auc:0.761520 
[438]	train-auc:0.973816	test-auc:0.761541 
[439]	train-auc:0.973842	test-auc:0.761497 
[440]	train-auc:0.973971	test-auc:0.761486 
[441]	train-auc:0.974057	test-auc:0.761455 
[442]	train-auc:0.974198	test-auc:0.761328 
[443]	train-auc:0.974265	test-auc:0.761355 
[444]	train-auc:0.974288	test-auc:0.761369 
[445]	train-auc:0.974396	test-auc:0.761432 
[446]	train-auc:0.974432	test-auc:0.761386 
[447]	train-auc:0.974522	test-auc:0.761391 
[448]	train-auc:0.974546	test-auc:0.761414 
[449]	train-auc:0.974586	test-auc:0.761353 
[450]	train-auc:0.974595	test-auc:0.761266 
[451]	train-auc:0.974692	test-auc:0.761148 
[452]	train-auc:0.974870	test-auc:0.761202 
[453]	train-auc:0.974893	test-auc:0.761192 
[454]	train-auc:0.974915	test-auc:0.761207 
[455]	train-auc:0.974945	test-auc:0.761166 
[456]	train-auc:0.975094	test-auc:0.761165 
[457]	train-auc:0.975185	test-auc:0.761165 
[458]	train-auc:0.975273	test-auc:0.761134 
[459]	train-auc:0.975301	test-auc:0.761070 
[460]	train-auc:0.975367	test-auc:0.761070 
[461]	train-auc:0.975393	test-auc:0.760999 
[462]	train-auc:0.975433	test-auc:0.760898 
[463]	train-auc:0.975508	test-auc:0.760790 
[464]	train-auc:0.975528	test-auc:0.760771 
[465]	train-auc:0.975864	test-auc:0.760536 
[466]	train-auc:0.975931	test-auc:0.760488 
[467]	train-auc:0.975949	test-auc:0.760519 
[468]	train-auc:0.975963	test-auc:0.760527 
[469]	train-auc:0.975994	test-auc:0.760501 
[470]	train-auc:0.976051	test-auc:0.760537 
[471]	train-auc:0.976075	test-auc:0.760546 
[472]	train-auc:0.976116	test-auc:0.760426 
[473]	train-auc:0.976225	test-auc:0.760436 
[474]	train-auc:0.976258	test-auc:0.760417 
[475]	train-auc:0.976332	test-auc:0.760359 
[476]	train-auc:0.976348	test-auc:0.760339 
[477]	train-auc:0.976387	test-auc:0.760304 
[478]	train-auc:0.976405	test-auc:0.760321 
[479]	train-auc:0.976423	test-auc:0.760365 
[480]	train-auc:0.976482	test-auc:0.760319 
[481]	train-auc:0.976511	test-auc:0.760384 
[482]	train-auc:0.976641	test-auc:0.760278 
[483]	train-auc:0.976672	test-auc:0.760331 
[484]	train-auc:0.976923	test-auc:0.760126 
[485]	train-auc:0.976944	test-auc:0.760108 
[486]	train-auc:0.977036	test-auc:0.760072 
[487]	train-auc:0.977063	test-auc:0.760018 
[488]	train-auc:0.977159	test-auc:0.759829 
Stopping. Best iteration:
[438]	train-auc:0.973816	test-auc:0.761541




Fold 3

[1]	train-auc:0.658217	test-auc:0.659775 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.660923	test-auc:0.661250 
[3]	train-auc:0.660975	test-auc:0.661271 
[4]	train-auc:0.660974	test-auc:0.661279 
[5]	train-auc:0.660977	test-auc:0.661278 
[6]	train-auc:0.660978	test-auc:0.661276 
[7]	train-auc:0.660970	test-auc:0.661265 
[8]	train-auc:0.661460	test-auc:0.661843 
[9]	train-auc:0.661461	test-auc:0.661842 
[10]	train-auc:0.661461	test-auc:0.661843 
[11]	train-auc:0.661384	test-auc:0.661627 
[12]	train-auc:0.661384	test-auc:0.661628 
[13]	train-auc:0.661385	test-auc:0.661630 
[14]	train-auc:0.661387	test-auc:0.661630 
[15]	train-auc:0.661389	test-auc:0.661619 
[16]	train-auc:0.661387	test-auc:0.661613 
[17]	train-auc:0.661387	test-auc:0.661613 
[18]	train-auc:0.661582	test-auc:0.661413 
[19]	train-auc:0.661436	test-auc:0.661522 
[20]	train-auc:0.661597	test-auc:0.660401 
[21]	train-auc:0.661600	test-auc:0.660384 
[22]	train-auc:0.661597	test-auc:0.660378 
[23]	train-auc:0.661898	test-auc:0.660371 
[24]	train-auc:0.662032	test-auc:0.660372 
[25]	train-auc:0.662001	test-auc:0.660307 
[26]	train-auc:0.661997	test-auc:0.660305 
[27]	train-auc:0.662104	test-auc:0.660294 
[28]	train-auc:0.662106	test-auc:0.660295 
[29]	train-auc:0.662108	test-auc:0.660295 
[30]	train-auc:0.662110	test-auc:0.660294 
[31]	train-auc:0.676079	test-auc:0.670731 
[32]	train-auc:0.676081	test-auc:0.670732 
[33]	train-auc:0.676082	test-auc:0.670730 
[34]	train-auc:0.676604	test-auc:0.670709 
[35]	train-auc:0.676605	test-auc:0.670705 
[36]	train-auc:0.676608	test-auc:0.670711 
[37]	train-auc:0.676604	test-auc:0.670722 
[38]	train-auc:0.676606	test-auc:0.670723 
[39]	train-auc:0.676606	test-auc:0.670721 
[40]	train-auc:0.676838	test-auc:0.670492 
[41]	train-auc:0.676832	test-auc:0.670482 
[42]	train-auc:0.676821	test-auc:0.670473 
[43]	train-auc:0.676822	test-auc:0.670474 
[44]	train-auc:0.676813	test-auc:0.670463 
[45]	train-auc:0.676813	test-auc:0.670464 
[46]	train-auc:0.677051	test-auc:0.670947 
[47]	train-auc:0.677770	test-auc:0.671443 
[48]	train-auc:0.677763	test-auc:0.671437 
[49]	train-auc:0.678848	test-auc:0.671345 
[50]	train-auc:0.678855	test-auc:0.671300 
[51]	train-auc:0.679087	test-auc:0.671788 
[52]	train-auc:0.679089	test-auc:0.671789 
[53]	train-auc:0.679123	test-auc:0.671833 
[54]	train-auc:0.679250	test-auc:0.672060 
[55]	train-auc:0.679288	test-auc:0.672134 
[56]	train-auc:0.680147	test-auc:0.674023 
[57]	train-auc:0.679901	test-auc:0.671690 
[58]	train-auc:0.680682	test-auc:0.673430 
[59]	train-auc:0.680780	test-auc:0.673419 
[60]	train-auc:0.685938	test-auc:0.678396 
[61]	train-auc:0.685936	test-auc:0.678379 
[62]	train-auc:0.686347	test-auc:0.678662 
[63]	train-auc:0.700274	test-auc:0.686152 
[64]	train-auc:0.700261	test-auc:0.686144 
[65]	train-auc:0.700370	test-auc:0.686151 
[66]	train-auc:0.700486	test-auc:0.686138 
[67]	train-auc:0.700582	test-auc:0.686110 
[68]	train-auc:0.700777	test-auc:0.686091 
[69]	train-auc:0.701946	test-auc:0.686734 
[70]	train-auc:0.702054	test-auc:0.686828 
[71]	train-auc:0.702059	test-auc:0.687042 
[72]	train-auc:0.702069	test-auc:0.687577 
[73]	train-auc:0.702627	test-auc:0.688022 
[74]	train-auc:0.702781	test-auc:0.688388 
[75]	train-auc:0.702748	test-auc:0.688410 
[76]	train-auc:0.702753	test-auc:0.688417 
[77]	train-auc:0.703126	test-auc:0.688696 
[78]	train-auc:0.705653	test-auc:0.689543 
[79]	train-auc:0.706151	test-auc:0.689454 
[80]	train-auc:0.709527	test-auc:0.689535 
[81]	train-auc:0.709753	test-auc:0.689490 
[82]	train-auc:0.709870	test-auc:0.689505 
[83]	train-auc:0.710115	test-auc:0.689469 
[84]	train-auc:0.710311	test-auc:0.689069 
[85]	train-auc:0.710453	test-auc:0.689036 
[86]	train-auc:0.710492	test-auc:0.688986 
[87]	train-auc:0.710654	test-auc:0.689065 
[88]	train-auc:0.712085	test-auc:0.689139 
[89]	train-auc:0.712761	test-auc:0.689249 
[90]	train-auc:0.717915	test-auc:0.691013 
[91]	train-auc:0.718117	test-auc:0.691050 
[92]	train-auc:0.718824	test-auc:0.691634 
[93]	train-auc:0.719392	test-auc:0.691776 
[94]	train-auc:0.719875	test-auc:0.692169 
[95]	train-auc:0.721045	test-auc:0.691883 
[96]	train-auc:0.724568	test-auc:0.693882 
[97]	train-auc:0.727504	test-auc:0.694964 
[98]	train-auc:0.727593	test-auc:0.695364 
[99]	train-auc:0.728297	test-auc:0.695236 
[100]	train-auc:0.729282	test-auc:0.695952 
[101]	train-auc:0.730399	test-auc:0.696326 
[102]	train-auc:0.732005	test-auc:0.697154 
[103]	train-auc:0.733804	test-auc:0.698043 
[104]	train-auc:0.734468	test-auc:0.698026 
[105]	train-auc:0.734834	test-auc:0.698280 
[106]	train-auc:0.735841	test-auc:0.698816 
[107]	train-auc:0.735987	test-auc:0.698964 
[108]	train-auc:0.736261	test-auc:0.698849 
[109]	train-auc:0.737317	test-auc:0.699179 
[110]	train-auc:0.737905	test-auc:0.698952 
[111]	train-auc:0.740403	test-auc:0.699294 
[112]	train-auc:0.741529	test-auc:0.699277 
[113]	train-auc:0.742058	test-auc:0.699078 
[114]	train-auc:0.742595	test-auc:0.699330 
[115]	train-auc:0.744733	test-auc:0.701139 
[116]	train-auc:0.745771	test-auc:0.701469 
[117]	train-auc:0.746276	test-auc:0.701373 
[118]	train-auc:0.746634	test-auc:0.701646 
[119]	train-auc:0.747118	test-auc:0.701909 
[120]	train-auc:0.748130	test-auc:0.702410 
[121]	train-auc:0.749128	test-auc:0.703513 
[122]	train-auc:0.749598	test-auc:0.703325 
[123]	train-auc:0.750672	test-auc:0.703915 
[124]	train-auc:0.751169	test-auc:0.703903 
[125]	train-auc:0.751956	test-auc:0.703968 
[126]	train-auc:0.753225	test-auc:0.704227 
[127]	train-auc:0.754406	test-auc:0.704845 
[128]	train-auc:0.754889	test-auc:0.704940 
[129]	train-auc:0.756671	test-auc:0.706880 
[130]	train-auc:0.757799	test-auc:0.707414 
[131]	train-auc:0.758557	test-auc:0.707862 
[132]	train-auc:0.762145	test-auc:0.710324 
[133]	train-auc:0.763123	test-auc:0.710574 
[134]	train-auc:0.763186	test-auc:0.710681 
[135]	train-auc:0.765788	test-auc:0.711810 
[136]	train-auc:0.767702	test-auc:0.712800 
[137]	train-auc:0.768545	test-auc:0.713578 
[138]	train-auc:0.771669	test-auc:0.714842 
[139]	train-auc:0.772859	test-auc:0.715375 
[140]	train-auc:0.773539	test-auc:0.715747 
[141]	train-auc:0.776385	test-auc:0.717057 
[142]	train-auc:0.777649	test-auc:0.717433 
[143]	train-auc:0.780166	test-auc:0.719441 
[144]	train-auc:0.781278	test-auc:0.720246 
[145]	train-auc:0.783575	test-auc:0.720129 
[146]	train-auc:0.784796	test-auc:0.720272 
[147]	train-auc:0.786247	test-auc:0.720686 
[148]	train-auc:0.787487	test-auc:0.720953 
[149]	train-auc:0.788480	test-auc:0.719460 
[150]	train-auc:0.789697	test-auc:0.719527 
[151]	train-auc:0.791191	test-auc:0.719986 
[152]	train-auc:0.792529	test-auc:0.720168 
[153]	train-auc:0.794397	test-auc:0.720558 
[154]	train-auc:0.795358	test-auc:0.720967 
[155]	train-auc:0.796784	test-auc:0.721269 
[156]	train-auc:0.797573	test-auc:0.721249 
[157]	train-auc:0.798694	test-auc:0.721758 
[158]	train-auc:0.799872	test-auc:0.721750 
[159]	train-auc:0.801591	test-auc:0.722112 
[160]	train-auc:0.802522	test-auc:0.722427 
[161]	train-auc:0.803886	test-auc:0.722806 
[162]	train-auc:0.804492	test-auc:0.722892 
[163]	train-auc:0.806223	test-auc:0.723587 
[164]	train-auc:0.808336	test-auc:0.724399 
[165]	train-auc:0.809813	test-auc:0.724628 
[166]	train-auc:0.812423	test-auc:0.725312 
[167]	train-auc:0.814404	test-auc:0.725755 
[168]	train-auc:0.816644	test-auc:0.726209 
[169]	train-auc:0.818923	test-auc:0.726586 
[170]	train-auc:0.820822	test-auc:0.727024 
[171]	train-auc:0.822840	test-auc:0.727513 
[172]	train-auc:0.824410	test-auc:0.727939 
[173]	train-auc:0.825383	test-auc:0.728141 
[174]	train-auc:0.826882	test-auc:0.728541 
[175]	train-auc:0.828758	test-auc:0.728909 
[176]	train-auc:0.830193	test-auc:0.729520 
[177]	train-auc:0.831480	test-auc:0.730284 
[178]	train-auc:0.832873	test-auc:0.730574 
[179]	train-auc:0.834259	test-auc:0.730648 
[180]	train-auc:0.835776	test-auc:0.731773 
[181]	train-auc:0.838790	test-auc:0.732415 
[182]	train-auc:0.841402	test-auc:0.732811 
[183]	train-auc:0.843705	test-auc:0.734230 
[184]	train-auc:0.846085	test-auc:0.734607 
[185]	train-auc:0.848150	test-auc:0.735041 
[186]	train-auc:0.850019	test-auc:0.735301 
[187]	train-auc:0.852028	test-auc:0.736026 
[188]	train-auc:0.854513	test-auc:0.736950 
[189]	train-auc:0.855866	test-auc:0.736864 
[190]	train-auc:0.857276	test-auc:0.737019 
[191]	train-auc:0.858210	test-auc:0.737273 
[192]	train-auc:0.859125	test-auc:0.737447 
[193]	train-auc:0.860515	test-auc:0.737895 
[194]	train-auc:0.861811	test-auc:0.737695 
[195]	train-auc:0.863792	test-auc:0.738138 
[196]	train-auc:0.865521	test-auc:0.738416 
[197]	train-auc:0.867399	test-auc:0.738447 
[198]	train-auc:0.868306	test-auc:0.738485 
[199]	train-auc:0.869755	test-auc:0.738948 
[200]	train-auc:0.871049	test-auc:0.739081 
[201]	train-auc:0.872175	test-auc:0.739597 
[202]	train-auc:0.873649	test-auc:0.740135 
[203]	train-auc:0.874844	test-auc:0.740036 
[204]	train-auc:0.875809	test-auc:0.740276 
[205]	train-auc:0.876907	test-auc:0.740793 
[206]	train-auc:0.878000	test-auc:0.740965 
[207]	train-auc:0.878996	test-auc:0.741195 
[208]	train-auc:0.879947	test-auc:0.741242 
[209]	train-auc:0.880767	test-auc:0.741542 
[210]	train-auc:0.882363	test-auc:0.741602 
[211]	train-auc:0.883297	test-auc:0.741696 
[212]	train-auc:0.884109	test-auc:0.741646 
[213]	train-auc:0.884832	test-auc:0.741823 
[214]	train-auc:0.886711	test-auc:0.741993 
[215]	train-auc:0.887243	test-auc:0.742271 
[216]	train-auc:0.887748	test-auc:0.742566 
[217]	train-auc:0.888473	test-auc:0.742501 
[218]	train-auc:0.889696	test-auc:0.742722 
[219]	train-auc:0.890221	test-auc:0.742774 
[220]	train-auc:0.891452	test-auc:0.742996 
[221]	train-auc:0.892610	test-auc:0.742873 
[222]	train-auc:0.893486	test-auc:0.742976 
[223]	train-auc:0.894258	test-auc:0.742918 
[224]	train-auc:0.895503	test-auc:0.742829 
[225]	train-auc:0.896261	test-auc:0.742936 
[226]	train-auc:0.897085	test-auc:0.742876 
[227]	train-auc:0.898000	test-auc:0.742631 
[228]	train-auc:0.899806	test-auc:0.742906 
[229]	train-auc:0.900839	test-auc:0.743026 
[230]	train-auc:0.902628	test-auc:0.743417 
[231]	train-auc:0.903831	test-auc:0.743535 
[232]	train-auc:0.904681	test-auc:0.743783 
[233]	train-auc:0.905444	test-auc:0.743854 
[234]	train-auc:0.906081	test-auc:0.744094 
[235]	train-auc:0.907177	test-auc:0.744306 
[236]	train-auc:0.908976	test-auc:0.744646 
[237]	train-auc:0.909620	test-auc:0.744785 
[238]	train-auc:0.911257	test-auc:0.744905 
[239]	train-auc:0.911932	test-auc:0.744985 
[240]	train-auc:0.912267	test-auc:0.745131 
[241]	train-auc:0.913864	test-auc:0.745453 
[242]	train-auc:0.914954	test-auc:0.745496 
[243]	train-auc:0.916579	test-auc:0.745853 
[244]	train-auc:0.917472	test-auc:0.746076 
[245]	train-auc:0.918619	test-auc:0.746346 
[246]	train-auc:0.919980	test-auc:0.746729 
[247]	train-auc:0.921297	test-auc:0.746775 
[248]	train-auc:0.921980	test-auc:0.747184 
[249]	train-auc:0.923027	test-auc:0.747309 
[250]	train-auc:0.923660	test-auc:0.747387 
[251]	train-auc:0.924759	test-auc:0.747448 
[252]	train-auc:0.925642	test-auc:0.747468 
[253]	train-auc:0.926372	test-auc:0.747531 
[254]	train-auc:0.927417	test-auc:0.747619 
[255]	train-auc:0.928282	test-auc:0.747549 
[256]	train-auc:0.929640	test-auc:0.747894 
[257]	train-auc:0.930047	test-auc:0.747857 
[258]	train-auc:0.930779	test-auc:0.747866 
[259]	train-auc:0.931213	test-auc:0.748036 
[260]	train-auc:0.931881	test-auc:0.748029 
[261]	train-auc:0.932591	test-auc:0.748101 
[262]	train-auc:0.933116	test-auc:0.748083 
[263]	train-auc:0.933575	test-auc:0.748100 
[264]	train-auc:0.933786	test-auc:0.748174 
[265]	train-auc:0.934789	test-auc:0.748094 
[266]	train-auc:0.935451	test-auc:0.748221 
[267]	train-auc:0.936176	test-auc:0.748038 
[268]	train-auc:0.936663	test-auc:0.748007 
[269]	train-auc:0.937177	test-auc:0.747969 
[270]	train-auc:0.937417	test-auc:0.747917 
[271]	train-auc:0.937659	test-auc:0.747886 
[272]	train-auc:0.937913	test-auc:0.747939 
[273]	train-auc:0.938313	test-auc:0.747935 
[274]	train-auc:0.938769	test-auc:0.748038 
[275]	train-auc:0.939088	test-auc:0.747998 
[276]	train-auc:0.939892	test-auc:0.748119 
[277]	train-auc:0.940469	test-auc:0.748084 
[278]	train-auc:0.940813	test-auc:0.747949 
[279]	train-auc:0.941428	test-auc:0.748060 
[280]	train-auc:0.941770	test-auc:0.748023 
[281]	train-auc:0.941915	test-auc:0.748234 
[282]	train-auc:0.942326	test-auc:0.748448 
[283]	train-auc:0.942675	test-auc:0.748347 
[284]	train-auc:0.942733	test-auc:0.748321 
[285]	train-auc:0.942815	test-auc:0.748491 
[286]	train-auc:0.943082	test-auc:0.748425 
[287]	train-auc:0.943264	test-auc:0.748506 
[288]	train-auc:0.943350	test-auc:0.748378 
[289]	train-auc:0.943505	test-auc:0.748411 
[290]	train-auc:0.943573	test-auc:0.748494 
[291]	train-auc:0.943642	test-auc:0.748521 
[292]	train-auc:0.943901	test-auc:0.748695 
[293]	train-auc:0.944005	test-auc:0.748589 
[294]	train-auc:0.944226	test-auc:0.748634 
[295]	train-auc:0.944283	test-auc:0.748771 
[296]	train-auc:0.944535	test-auc:0.748690 
[297]	train-auc:0.944624	test-auc:0.748657 
[298]	train-auc:0.945077	test-auc:0.748702 
[299]	train-auc:0.945116	test-auc:0.748721 
[300]	train-auc:0.945262	test-auc:0.748667 
[301]	train-auc:0.945481	test-auc:0.748594 
[302]	train-auc:0.946015	test-auc:0.748676 
[303]	train-auc:0.946131	test-auc:0.748641 
[304]	train-auc:0.946195	test-auc:0.748718 
[305]	train-auc:0.946515	test-auc:0.748780 
[306]	train-auc:0.946622	test-auc:0.748798 
[307]	train-auc:0.947124	test-auc:0.748941 
[308]	train-auc:0.947185	test-auc:0.748840 
[309]	train-auc:0.947261	test-auc:0.748843 
[310]	train-auc:0.947731	test-auc:0.748929 
[311]	train-auc:0.948019	test-auc:0.748816 
[312]	train-auc:0.948034	test-auc:0.748807 
[313]	train-auc:0.948394	test-auc:0.748800 
[314]	train-auc:0.948705	test-auc:0.748771 
[315]	train-auc:0.948803	test-auc:0.748780 
[316]	train-auc:0.948968	test-auc:0.748927 
[317]	train-auc:0.949025	test-auc:0.748874 
[318]	train-auc:0.949153	test-auc:0.748846 
[319]	train-auc:0.949284	test-auc:0.748673 
[320]	train-auc:0.949530	test-auc:0.748802 
[321]	train-auc:0.949583	test-auc:0.748816 
[322]	train-auc:0.949853	test-auc:0.748965 
[323]	train-auc:0.950155	test-auc:0.748925 
[324]	train-auc:0.950236	test-auc:0.748930 
[325]	train-auc:0.950586	test-auc:0.748829 
[326]	train-auc:0.950784	test-auc:0.748802 
[327]	train-auc:0.950931	test-auc:0.748761 
[328]	train-auc:0.951164	test-auc:0.748880 
[329]	train-auc:0.951216	test-auc:0.748836 
[330]	train-auc:0.952010	test-auc:0.748907 
[331]	train-auc:0.952350	test-auc:0.748903 
[332]	train-auc:0.952468	test-auc:0.748891 
[333]	train-auc:0.952785	test-auc:0.748947 
[334]	train-auc:0.952823	test-auc:0.748976 
[335]	train-auc:0.953085	test-auc:0.748956 
[336]	train-auc:0.953407	test-auc:0.748835 
[337]	train-auc:0.953598	test-auc:0.748775 
[338]	train-auc:0.953743	test-auc:0.748688 
[339]	train-auc:0.953773	test-auc:0.748667 
[340]	train-auc:0.953941	test-auc:0.748712 
[341]	train-auc:0.954386	test-auc:0.748565 
[342]	train-auc:0.954560	test-auc:0.748527 
[343]	train-auc:0.954673	test-auc:0.748566 
[344]	train-auc:0.954849	test-auc:0.748478 
[345]	train-auc:0.955042	test-auc:0.748644 
[346]	train-auc:0.955405	test-auc:0.748700 
[347]	train-auc:0.955484	test-auc:0.748722 
[348]	train-auc:0.955866	test-auc:0.748836 
[349]	train-auc:0.955979	test-auc:0.748817 
[350]	train-auc:0.956083	test-auc:0.748785 
[351]	train-auc:0.956119	test-auc:0.748780 
[352]	train-auc:0.956134	test-auc:0.748784 
[353]	train-auc:0.956423	test-auc:0.748727 
[354]	train-auc:0.956412	test-auc:0.748769 
[355]	train-auc:0.956875	test-auc:0.748687 
[356]	train-auc:0.957030	test-auc:0.748695 
[357]	train-auc:0.957119	test-auc:0.748653 
[358]	train-auc:0.957142	test-auc:0.748672 
[359]	train-auc:0.957214	test-auc:0.748758 
[360]	train-auc:0.957377	test-auc:0.748846 
[361]	train-auc:0.957632	test-auc:0.748827 
[362]	train-auc:0.957756	test-auc:0.748895 
[363]	train-auc:0.957875	test-auc:0.748897 
[364]	train-auc:0.957927	test-auc:0.748926 
[365]	train-auc:0.958006	test-auc:0.748962 
[366]	train-auc:0.958133	test-auc:0.748861 
[367]	train-auc:0.958306	test-auc:0.748904 
[368]	train-auc:0.958409	test-auc:0.748886 
[369]	train-auc:0.958651	test-auc:0.749010 
[370]	train-auc:0.958667	test-auc:0.748982 
[371]	train-auc:0.958758	test-auc:0.748967 
[372]	train-auc:0.959022	test-auc:0.748924 
[373]	train-auc:0.959427	test-auc:0.748837 
[374]	train-auc:0.959450	test-auc:0.748921 
[375]	train-auc:0.959639	test-auc:0.748885 
[376]	train-auc:0.959748	test-auc:0.748862 
[377]	train-auc:0.959761	test-auc:0.748825 
[378]	train-auc:0.959772	test-auc:0.748843 
[379]	train-auc:0.959838	test-auc:0.748851 
[380]	train-auc:0.959920	test-auc:0.748825 
[381]	train-auc:0.960169	test-auc:0.748857 
[382]	train-auc:0.960287	test-auc:0.748931 
[383]	train-auc:0.960352	test-auc:0.748929 
[384]	train-auc:0.960551	test-auc:0.748936 
[385]	train-auc:0.960569	test-auc:0.748926 
[386]	train-auc:0.960612	test-auc:0.748929 
[387]	train-auc:0.960764	test-auc:0.748934 
[388]	train-auc:0.960976	test-auc:0.749054 
[389]	train-auc:0.961370	test-auc:0.748968 
[390]	train-auc:0.961409	test-auc:0.748959 
[391]	train-auc:0.961608	test-auc:0.748882 
[392]	train-auc:0.961732	test-auc:0.748971 
[393]	train-auc:0.961821	test-auc:0.748948 
[394]	train-auc:0.961916	test-auc:0.748958 
[395]	train-auc:0.961984	test-auc:0.749000 
[396]	train-auc:0.962060	test-auc:0.749097 
[397]	train-auc:0.962134	test-auc:0.749195 
[398]	train-auc:0.962215	test-auc:0.749236 
[399]	train-auc:0.962433	test-auc:0.749363 
[400]	train-auc:0.962526	test-auc:0.749432 
[401]	train-auc:0.962565	test-auc:0.749467 
[402]	train-auc:0.962568	test-auc:0.749460 
[403]	train-auc:0.962704	test-auc:0.749460 
[404]	train-auc:0.962808	test-auc:0.749404 
[405]	train-auc:0.962878	test-auc:0.749525 
[406]	train-auc:0.962995	test-auc:0.749570 
[407]	train-auc:0.963638	test-auc:0.749511 
[408]	train-auc:0.963688	test-auc:0.749575 
[409]	train-auc:0.963738	test-auc:0.749611 
[410]	train-auc:0.963828	test-auc:0.749601 
[411]	train-auc:0.963892	test-auc:0.749585 
[412]	train-auc:0.963961	test-auc:0.749600 
[413]	train-auc:0.964009	test-auc:0.749545 
[414]	train-auc:0.964083	test-auc:0.749553 
[415]	train-auc:0.964210	test-auc:0.749618 
[416]	train-auc:0.964255	test-auc:0.749630 
[417]	train-auc:0.964366	test-auc:0.749664 
[418]	train-auc:0.964445	test-auc:0.749498 
[419]	train-auc:0.964467	test-auc:0.749555 
[420]	train-auc:0.964547	test-auc:0.749471 
[421]	train-auc:0.964614	test-auc:0.749509 
[422]	train-auc:0.964654	test-auc:0.749554 
[423]	train-auc:0.964694	test-auc:0.749584 
[424]	train-auc:0.964765	test-auc:0.749696 
[425]	train-auc:0.964822	test-auc:0.749749 
[426]	train-auc:0.964887	test-auc:0.749763 
[427]	train-auc:0.965218	test-auc:0.749789 
[428]	train-auc:0.965347	test-auc:0.749810 
[429]	train-auc:0.965405	test-auc:0.749826 
[430]	train-auc:0.965430	test-auc:0.749865 
[431]	train-auc:0.965454	test-auc:0.749886 
[432]	train-auc:0.965514	test-auc:0.749845 
[433]	train-auc:0.965741	test-auc:0.749797 
[434]	train-auc:0.966232	test-auc:0.749865 
[435]	train-auc:0.966264	test-auc:0.749893 
[436]	train-auc:0.966297	test-auc:0.749955 
[437]	train-auc:0.966338	test-auc:0.749924 
[438]	train-auc:0.966444	test-auc:0.749867 
[439]	train-auc:0.966498	test-auc:0.749915 
[440]	train-auc:0.966650	test-auc:0.749993 
[441]	train-auc:0.966706	test-auc:0.750003 
[442]	train-auc:0.966751	test-auc:0.749956 
[443]	train-auc:0.967004	test-auc:0.750014 
[444]	train-auc:0.967018	test-auc:0.750031 
[445]	train-auc:0.967241	test-auc:0.750018 
[446]	train-auc:0.967266	test-auc:0.749974 
[447]	train-auc:0.967383	test-auc:0.750023 
[448]	train-auc:0.967414	test-auc:0.750029 
[449]	train-auc:0.967447	test-auc:0.750165 
[450]	train-auc:0.967551	test-auc:0.750224 
[451]	train-auc:0.967592	test-auc:0.750219 
[452]	train-auc:0.967627	test-auc:0.750250 
[453]	train-auc:0.967662	test-auc:0.750265 
[454]	train-auc:0.967707	test-auc:0.750264 
[455]	train-auc:0.967805	test-auc:0.750333 
[456]	train-auc:0.967834	test-auc:0.750392 
[457]	train-auc:0.967883	test-auc:0.750327 
[458]	train-auc:0.967929	test-auc:0.750323 
[459]	train-auc:0.967943	test-auc:0.750373 
[460]	train-auc:0.968099	test-auc:0.750358 
[461]	train-auc:0.968211	test-auc:0.750432 
[462]	train-auc:0.968365	test-auc:0.750392 
[463]	train-auc:0.968441	test-auc:0.750392 
[464]	train-auc:0.968523	test-auc:0.750260 
[465]	train-auc:0.968555	test-auc:0.750219 
[466]	train-auc:0.968640	test-auc:0.750251 
[467]	train-auc:0.968702	test-auc:0.750279 
[468]	train-auc:0.968719	test-auc:0.750242 
[469]	train-auc:0.968837	test-auc:0.750309 
[470]	train-auc:0.968910	test-auc:0.750212 
[471]	train-auc:0.968994	test-auc:0.750167 
[472]	train-auc:0.969034	test-auc:0.750182 
[473]	train-auc:0.969083	test-auc:0.750136 
[474]	train-auc:0.969258	test-auc:0.750057 
[475]	train-auc:0.969602	test-auc:0.750014 
[476]	train-auc:0.969870	test-auc:0.749998 
[477]	train-auc:0.970124	test-auc:0.750001 
[478]	train-auc:0.970133	test-auc:0.750013 
[479]	train-auc:0.970140	test-auc:0.750013 
[480]	train-auc:0.970191	test-auc:0.750047 
[481]	train-auc:0.970219	test-auc:0.750019 
[482]	train-auc:0.970359	test-auc:0.750044 
[483]	train-auc:0.970625	test-auc:0.749974 
[484]	train-auc:0.970730	test-auc:0.749931 
[485]	train-auc:0.970782	test-auc:0.749971 
[486]	train-auc:0.970964	test-auc:0.750129 
[487]	train-auc:0.970966	test-auc:0.750121 
[488]	train-auc:0.970982	test-auc:0.750188 
[489]	train-auc:0.970998	test-auc:0.750174 
[490]	train-auc:0.971022	test-auc:0.750166 
[491]	train-auc:0.971135	test-auc:0.750238 
[492]	train-auc:0.971181	test-auc:0.750226 
[493]	train-auc:0.971196	test-auc:0.750259 
[494]	train-auc:0.971218	test-auc:0.750268 
[495]	train-auc:0.971263	test-auc:0.750180 
[496]	train-auc:0.971687	test-auc:0.750126 
[497]	train-auc:0.971714	test-auc:0.750098 
[498]	train-auc:0.971731	test-auc:0.750079 
[499]	train-auc:0.971749	test-auc:0.750135 
[500]	train-auc:0.971978	test-auc:0.750151 
[501]	train-auc:0.972061	test-auc:0.750214 
[502]	train-auc:0.972107	test-auc:0.750135 
[503]	train-auc:0.972297	test-auc:0.750218 
[504]	train-auc:0.972467	test-auc:0.750357 
[505]	train-auc:0.972872	test-auc:0.750423 
[506]	train-auc:0.973174	test-auc:0.750433 
[507]	train-auc:0.973514	test-auc:0.750555 
[508]	train-auc:0.973833	test-auc:0.750463 
[509]	train-auc:0.974105	test-auc:0.750511 
[510]	train-auc:0.974305	test-auc:0.750469 
[511]	train-auc:0.974570	test-auc:0.750481 
[512]	train-auc:0.974737	test-auc:0.750443 
[513]	train-auc:0.974931	test-auc:0.750375 
[514]	train-auc:0.975061	test-auc:0.750374 
[515]	train-auc:0.975139	test-auc:0.750330 
[516]	train-auc:0.975352	test-auc:0.750312 
[517]	train-auc:0.975449	test-auc:0.750194 
[518]	train-auc:0.975618	test-auc:0.750236 
[519]	train-auc:0.975770	test-auc:0.750189 
[520]	train-auc:0.975899	test-auc:0.750235 
[521]	train-auc:0.976085	test-auc:0.750317 
[522]	train-auc:0.976279	test-auc:0.750179 
[523]	train-auc:0.976472	test-auc:0.750292 
[524]	train-auc:0.976544	test-auc:0.750261 
[525]	train-auc:0.976671	test-auc:0.750097 
[526]	train-auc:0.976850	test-auc:0.750010 
[527]	train-auc:0.976921	test-auc:0.749929 
[528]	train-auc:0.977081	test-auc:0.749887 
[529]	train-auc:0.977116	test-auc:0.749886 
[530]	train-auc:0.977132	test-auc:0.749903 
[531]	train-auc:0.977294	test-auc:0.749887 
[532]	train-auc:0.977422	test-auc:0.749940 
[533]	train-auc:0.977470	test-auc:0.749922 
[534]	train-auc:0.977481	test-auc:0.749931 
[535]	train-auc:0.977580	test-auc:0.749946 
[536]	train-auc:0.977625	test-auc:0.749897 
[537]	train-auc:0.977700	test-auc:0.749824 
[538]	train-auc:0.977727	test-auc:0.749837 
[539]	train-auc:0.977815	test-auc:0.749861 
[540]	train-auc:0.977852	test-auc:0.749792 
[541]	train-auc:0.977899	test-auc:0.749809 
[542]	train-auc:0.977910	test-auc:0.749837 
[543]	train-auc:0.977920	test-auc:0.749822 
[544]	train-auc:0.977957	test-auc:0.749887 
[545]	train-auc:0.978164	test-auc:0.749958 
[546]	train-auc:0.978186	test-auc:0.749970 
[547]	train-auc:0.978205	test-auc:0.749983 
[548]	train-auc:0.978375	test-auc:0.749856 
[549]	train-auc:0.978470	test-auc:0.749856 
[550]	train-auc:0.978514	test-auc:0.749892 
[551]	train-auc:0.978540	test-auc:0.749808 
[552]	train-auc:0.978557	test-auc:0.749806 
[553]	train-auc:0.978593	test-auc:0.749837 
[554]	train-auc:0.978699	test-auc:0.749744 
[555]	train-auc:0.978725	test-auc:0.749747 
[556]	train-auc:0.978749	test-auc:0.749735 
[557]	train-auc:0.978765	test-auc:0.749788 
Stopping. Best iteration:
[507]	train-auc:0.973514	test-auc:0.750555




Fold 4

[1]	train-auc:0.657345	test-auc:0.646007 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657896	test-auc:0.648411 
[3]	train-auc:0.657902	test-auc:0.648412 
[4]	train-auc:0.658145	test-auc:0.647741 
[5]	train-auc:0.658146	test-auc:0.647742 
[6]	train-auc:0.663330	test-auc:0.650247 
[7]	train-auc:0.663344	test-auc:0.650228 
[8]	train-auc:0.663336	test-auc:0.650251 
[9]	train-auc:0.663345	test-auc:0.650229 
[10]	train-auc:0.663346	test-auc:0.650230 
[11]	train-auc:0.663454	test-auc:0.650636 
[12]	train-auc:0.663449	test-auc:0.650630 
[13]	train-auc:0.663450	test-auc:0.650630 
[14]	train-auc:0.663451	test-auc:0.650630 
[15]	train-auc:0.676676	test-auc:0.661954 
[16]	train-auc:0.676677	test-auc:0.661953 
[17]	train-auc:0.676678	test-auc:0.661954 
[18]	train-auc:0.676992	test-auc:0.662389 
[19]	train-auc:0.677099	test-auc:0.662385 
[20]	train-auc:0.677099	test-auc:0.662383 
[21]	train-auc:0.677099	test-auc:0.662383 
[22]	train-auc:0.677100	test-auc:0.662383 
[23]	train-auc:0.677143	test-auc:0.662381 
[24]	train-auc:0.677144	test-auc:0.662382 
[25]	train-auc:0.677145	test-auc:0.662382 
[26]	train-auc:0.677145	test-auc:0.662382 
[27]	train-auc:0.677351	test-auc:0.662363 
[28]	train-auc:0.677350	test-auc:0.662354 
[29]	train-auc:0.677351	test-auc:0.662356 
[30]	train-auc:0.677345	test-auc:0.662351 
[31]	train-auc:0.677344	test-auc:0.662348 
[32]	train-auc:0.678108	test-auc:0.664450 
[33]	train-auc:0.678111	test-auc:0.664450 
[34]	train-auc:0.678111	test-auc:0.664450 
[35]	train-auc:0.678112	test-auc:0.664459 
[36]	train-auc:0.678254	test-auc:0.664459 
[37]	train-auc:0.678397	test-auc:0.664442 
[38]	train-auc:0.678398	test-auc:0.664438 
[39]	train-auc:0.678498	test-auc:0.664439 
[40]	train-auc:0.678489	test-auc:0.664428 
[41]	train-auc:0.679646	test-auc:0.665367 
[42]	train-auc:0.679644	test-auc:0.665351 
[43]	train-auc:0.679645	test-auc:0.665348 
[44]	train-auc:0.679658	test-auc:0.665359 
[45]	train-auc:0.679725	test-auc:0.664865 
[46]	train-auc:0.679865	test-auc:0.664853 
[47]	train-auc:0.679924	test-auc:0.664824 
[48]	train-auc:0.679919	test-auc:0.664817 
[49]	train-auc:0.691394	test-auc:0.677995 
[50]	train-auc:0.692703	test-auc:0.678500 
[51]	train-auc:0.693998	test-auc:0.679118 
[52]	train-auc:0.694418	test-auc:0.679629 
[53]	train-auc:0.696975	test-auc:0.681848 
[54]	train-auc:0.697790	test-auc:0.682183 
[55]	train-auc:0.698183	test-auc:0.682178 
[56]	train-auc:0.698406	test-auc:0.682131 
[57]	train-auc:0.698407	test-auc:0.682128 
[58]	train-auc:0.698482	test-auc:0.682130 
[59]	train-auc:0.698485	test-auc:0.682131 
[60]	train-auc:0.702590	test-auc:0.685093 
[61]	train-auc:0.702587	test-auc:0.685092 
[62]	train-auc:0.702764	test-auc:0.685070 
[63]	train-auc:0.702889	test-auc:0.685173 
[64]	train-auc:0.702953	test-auc:0.685232 
[65]	train-auc:0.703937	test-auc:0.685093 
[66]	train-auc:0.703991	test-auc:0.685075 
[67]	train-auc:0.704013	test-auc:0.685118 
[68]	train-auc:0.704051	test-auc:0.685103 
[69]	train-auc:0.705804	test-auc:0.685777 
[70]	train-auc:0.706009	test-auc:0.685781 
[71]	train-auc:0.706312	test-auc:0.685814 
[72]	train-auc:0.706662	test-auc:0.685804 
[73]	train-auc:0.707463	test-auc:0.686845 
[74]	train-auc:0.707462	test-auc:0.686871 
[75]	train-auc:0.707429	test-auc:0.686773 
[76]	train-auc:0.707631	test-auc:0.686961 
[77]	train-auc:0.707669	test-auc:0.687155 
[78]	train-auc:0.717004	test-auc:0.694235 
[79]	train-auc:0.717900	test-auc:0.695705 
[80]	train-auc:0.718225	test-auc:0.695930 
[81]	train-auc:0.720153	test-auc:0.696572 
[82]	train-auc:0.720700	test-auc:0.696425 
[83]	train-auc:0.720836	test-auc:0.696362 
[84]	train-auc:0.720854	test-auc:0.696258 
[85]	train-auc:0.720898	test-auc:0.696270 
[86]	train-auc:0.720963	test-auc:0.696324 
[87]	train-auc:0.722221	test-auc:0.697407 
[88]	train-auc:0.722450	test-auc:0.697499 
[89]	train-auc:0.723724	test-auc:0.698012 
[90]	train-auc:0.724306	test-auc:0.698050 
[91]	train-auc:0.728651	test-auc:0.700032 
[92]	train-auc:0.729525	test-auc:0.700504 
[93]	train-auc:0.729789	test-auc:0.700358 
[94]	train-auc:0.729889	test-auc:0.700232 
[95]	train-auc:0.730257	test-auc:0.700706 
[96]	train-auc:0.731244	test-auc:0.701592 
[97]	train-auc:0.731270	test-auc:0.701689 
[98]	train-auc:0.731515	test-auc:0.702450 
[99]	train-auc:0.731996	test-auc:0.702479 
[100]	train-auc:0.732572	test-auc:0.702652 
[101]	train-auc:0.734395	test-auc:0.703072 
[102]	train-auc:0.735265	test-auc:0.703849 
[103]	train-auc:0.736533	test-auc:0.704490 
[104]	train-auc:0.737013	test-auc:0.704917 
[105]	train-auc:0.737827	test-auc:0.705263 
[106]	train-auc:0.738256	test-auc:0.705208 
[107]	train-auc:0.738738	test-auc:0.705188 
[108]	train-auc:0.739819	test-auc:0.705520 
[109]	train-auc:0.740602	test-auc:0.705988 
[110]	train-auc:0.741231	test-auc:0.705695 
[111]	train-auc:0.741882	test-auc:0.705414 
[112]	train-auc:0.742881	test-auc:0.705960 
[113]	train-auc:0.743120	test-auc:0.706683 
[114]	train-auc:0.744673	test-auc:0.707482 
[115]	train-auc:0.745414	test-auc:0.707648 
[116]	train-auc:0.745759	test-auc:0.707618 
[117]	train-auc:0.747310	test-auc:0.707994 
[118]	train-auc:0.747838	test-auc:0.708360 
[119]	train-auc:0.748525	test-auc:0.708631 
[120]	train-auc:0.749082	test-auc:0.708552 
[121]	train-auc:0.749510	test-auc:0.708891 
[122]	train-auc:0.750608	test-auc:0.709257 
[123]	train-auc:0.751157	test-auc:0.709454 
[124]	train-auc:0.752583	test-auc:0.710211 
[125]	train-auc:0.756306	test-auc:0.712550 
[126]	train-auc:0.758343	test-auc:0.712925 
[127]	train-auc:0.760178	test-auc:0.713006 
[128]	train-auc:0.761244	test-auc:0.713211 
[129]	train-auc:0.762248	test-auc:0.713488 
[130]	train-auc:0.762695	test-auc:0.713453 
[131]	train-auc:0.763964	test-auc:0.713949 
[132]	train-auc:0.764536	test-auc:0.713882 
[133]	train-auc:0.765382	test-auc:0.714336 
[134]	train-auc:0.766261	test-auc:0.714777 
[135]	train-auc:0.767373	test-auc:0.714963 
[136]	train-auc:0.768209	test-auc:0.715462 
[137]	train-auc:0.768842	test-auc:0.715899 
[138]	train-auc:0.770045	test-auc:0.716407 
[139]	train-auc:0.770743	test-auc:0.716544 
[140]	train-auc:0.771541	test-auc:0.716756 
[141]	train-auc:0.772027	test-auc:0.717367 
[142]	train-auc:0.772790	test-auc:0.717258 
[143]	train-auc:0.773533	test-auc:0.717440 
[144]	train-auc:0.774315	test-auc:0.717320 
[145]	train-auc:0.775859	test-auc:0.717919 
[146]	train-auc:0.777252	test-auc:0.718263 
[147]	train-auc:0.779032	test-auc:0.719214 
[148]	train-auc:0.780712	test-auc:0.719671 
[149]	train-auc:0.781826	test-auc:0.720212 
[150]	train-auc:0.783201	test-auc:0.720201 
[151]	train-auc:0.784411	test-auc:0.720877 
[152]	train-auc:0.786462	test-auc:0.721228 
[153]	train-auc:0.787188	test-auc:0.721201 
[154]	train-auc:0.789635	test-auc:0.721467 
[155]	train-auc:0.791976	test-auc:0.722345 
[156]	train-auc:0.793645	test-auc:0.722437 
[157]	train-auc:0.795524	test-auc:0.722548 
[158]	train-auc:0.797231	test-auc:0.722654 
[159]	train-auc:0.799301	test-auc:0.722361 
[160]	train-auc:0.801569	test-auc:0.722988 
[161]	train-auc:0.803789	test-auc:0.723578 
[162]	train-auc:0.805840	test-auc:0.724141 
[163]	train-auc:0.807559	test-auc:0.724345 
[164]	train-auc:0.809861	test-auc:0.724399 
[165]	train-auc:0.812190	test-auc:0.725090 
[166]	train-auc:0.814105	test-auc:0.725483 
[167]	train-auc:0.815981	test-auc:0.725744 
[168]	train-auc:0.818110	test-auc:0.725945 
[169]	train-auc:0.819924	test-auc:0.725822 
[170]	train-auc:0.821395	test-auc:0.725969 
[171]	train-auc:0.823196	test-auc:0.726307 
[172]	train-auc:0.824763	test-auc:0.726262 
[173]	train-auc:0.826264	test-auc:0.727433 
[174]	train-auc:0.827520	test-auc:0.727703 
[175]	train-auc:0.828847	test-auc:0.727855 
[176]	train-auc:0.830032	test-auc:0.728354 
[177]	train-auc:0.832075	test-auc:0.729916 
[178]	train-auc:0.833651	test-auc:0.730961 
[179]	train-auc:0.835542	test-auc:0.731363 
[180]	train-auc:0.837470	test-auc:0.732039 
[181]	train-auc:0.838449	test-auc:0.732542 
[182]	train-auc:0.840676	test-auc:0.733659 
[183]	train-auc:0.841889	test-auc:0.734892 
[184]	train-auc:0.843231	test-auc:0.735227 
[185]	train-auc:0.844850	test-auc:0.735675 
[186]	train-auc:0.846263	test-auc:0.736427 
[187]	train-auc:0.847619	test-auc:0.737076 
[188]	train-auc:0.848884	test-auc:0.737261 
[189]	train-auc:0.850517	test-auc:0.737671 
[190]	train-auc:0.851534	test-auc:0.737928 
[191]	train-auc:0.852539	test-auc:0.738445 
[192]	train-auc:0.854200	test-auc:0.739015 
[193]	train-auc:0.856209	test-auc:0.739254 
[194]	train-auc:0.857409	test-auc:0.739365 
[195]	train-auc:0.859959	test-auc:0.740468 
[196]	train-auc:0.861511	test-auc:0.740857 
[197]	train-auc:0.863429	test-auc:0.741373 
[198]	train-auc:0.865592	test-auc:0.741660 
[199]	train-auc:0.867466	test-auc:0.742063 
[200]	train-auc:0.869762	test-auc:0.742401 
[201]	train-auc:0.871610	test-auc:0.742891 
[202]	train-auc:0.873206	test-auc:0.743086 
[203]	train-auc:0.875048	test-auc:0.743245 
[204]	train-auc:0.877135	test-auc:0.743772 
[205]	train-auc:0.878575	test-auc:0.744290 
[206]	train-auc:0.880009	test-auc:0.744674 
[207]	train-auc:0.881556	test-auc:0.744815 
[208]	train-auc:0.882621	test-auc:0.744792 
[209]	train-auc:0.883794	test-auc:0.745047 
[210]	train-auc:0.884438	test-auc:0.745564 
[211]	train-auc:0.885945	test-auc:0.745880 
[212]	train-auc:0.886810	test-auc:0.746234 
[213]	train-auc:0.888685	test-auc:0.746394 
[214]	train-auc:0.889875	test-auc:0.746528 
[215]	train-auc:0.891005	test-auc:0.746742 
[216]	train-auc:0.892353	test-auc:0.746948 
[217]	train-auc:0.893791	test-auc:0.747122 
[218]	train-auc:0.895268	test-auc:0.747360 
[219]	train-auc:0.896330	test-auc:0.747336 
[220]	train-auc:0.897715	test-auc:0.747408 
[221]	train-auc:0.898976	test-auc:0.747493 
[222]	train-auc:0.900320	test-auc:0.747606 
[223]	train-auc:0.901413	test-auc:0.747554 
[224]	train-auc:0.902576	test-auc:0.747505 
[225]	train-auc:0.903662	test-auc:0.747571 
[226]	train-auc:0.904170	test-auc:0.747358 
[227]	train-auc:0.905024	test-auc:0.747424 
[228]	train-auc:0.905914	test-auc:0.747545 
[229]	train-auc:0.907165	test-auc:0.747782 
[230]	train-auc:0.909167	test-auc:0.747645 
[231]	train-auc:0.910520	test-auc:0.747657 
[232]	train-auc:0.911166	test-auc:0.747874 
[233]	train-auc:0.913217	test-auc:0.747724 
[234]	train-auc:0.913974	test-auc:0.747622 
[235]	train-auc:0.914773	test-auc:0.747821 
[236]	train-auc:0.916514	test-auc:0.747838 
[237]	train-auc:0.917766	test-auc:0.747825 
[238]	train-auc:0.919264	test-auc:0.747839 
[239]	train-auc:0.920236	test-auc:0.747726 
[240]	train-auc:0.921386	test-auc:0.747782 
[241]	train-auc:0.922190	test-auc:0.747841 
[242]	train-auc:0.923408	test-auc:0.747879 
[243]	train-auc:0.924700	test-auc:0.747748 
[244]	train-auc:0.925450	test-auc:0.747788 
[245]	train-auc:0.926087	test-auc:0.747891 
[246]	train-auc:0.927226	test-auc:0.747743 
[247]	train-auc:0.927939	test-auc:0.747778 
[248]	train-auc:0.929060	test-auc:0.747628 
[249]	train-auc:0.930254	test-auc:0.747672 
[250]	train-auc:0.931470	test-auc:0.747712 
[251]	train-auc:0.931969	test-auc:0.747871 
[252]	train-auc:0.932556	test-auc:0.747820 
[253]	train-auc:0.933565	test-auc:0.747851 
[254]	train-auc:0.934369	test-auc:0.747958 
[255]	train-auc:0.935210	test-auc:0.748028 
[256]	train-auc:0.935830	test-auc:0.748013 
[257]	train-auc:0.936477	test-auc:0.747962 
[258]	train-auc:0.937239	test-auc:0.748191 
[259]	train-auc:0.938456	test-auc:0.748369 
[260]	train-auc:0.938970	test-auc:0.748283 
[261]	train-auc:0.939554	test-auc:0.748396 
[262]	train-auc:0.940781	test-auc:0.748624 
[263]	train-auc:0.941412	test-auc:0.748963 
[264]	train-auc:0.942141	test-auc:0.749117 
[265]	train-auc:0.942520	test-auc:0.749158 
[266]	train-auc:0.943056	test-auc:0.749330 
[267]	train-auc:0.943488	test-auc:0.749555 
[268]	train-auc:0.944007	test-auc:0.749625 
[269]	train-auc:0.944396	test-auc:0.749762 
[270]	train-auc:0.944653	test-auc:0.749722 
[271]	train-auc:0.945000	test-auc:0.749970 
[272]	train-auc:0.945713	test-auc:0.750298 
[273]	train-auc:0.946110	test-auc:0.750426 
[274]	train-auc:0.946657	test-auc:0.750746 
[275]	train-auc:0.947442	test-auc:0.750895 
[276]	train-auc:0.947710	test-auc:0.750857 
[277]	train-auc:0.947979	test-auc:0.750778 
[278]	train-auc:0.948824	test-auc:0.750744 
[279]	train-auc:0.949073	test-auc:0.750728 
[280]	train-auc:0.949745	test-auc:0.750809 
[281]	train-auc:0.950047	test-auc:0.750834 
[282]	train-auc:0.950335	test-auc:0.750843 
[283]	train-auc:0.950485	test-auc:0.750805 
[284]	train-auc:0.950657	test-auc:0.750693 
[285]	train-auc:0.951477	test-auc:0.750865 
[286]	train-auc:0.951646	test-auc:0.751004 
[287]	train-auc:0.952041	test-auc:0.751277 
[288]	train-auc:0.952435	test-auc:0.751437 
[289]	train-auc:0.952600	test-auc:0.751472 
[290]	train-auc:0.952840	test-auc:0.751386 
[291]	train-auc:0.953378	test-auc:0.751341 
[292]	train-auc:0.953693	test-auc:0.751277 
[293]	train-auc:0.953880	test-auc:0.751305 
[294]	train-auc:0.954180	test-auc:0.751276 
[295]	train-auc:0.954555	test-auc:0.751639 
[296]	train-auc:0.954652	test-auc:0.751618 
[297]	train-auc:0.955280	test-auc:0.751758 
[298]	train-auc:0.955568	test-auc:0.751734 
[299]	train-auc:0.955620	test-auc:0.751692 
[300]	train-auc:0.955891	test-auc:0.751711 
[301]	train-auc:0.956174	test-auc:0.751910 
[302]	train-auc:0.956231	test-auc:0.751883 
[303]	train-auc:0.956623	test-auc:0.751806 
[304]	train-auc:0.956852	test-auc:0.751740 
[305]	train-auc:0.957131	test-auc:0.751677 
[306]	train-auc:0.957337	test-auc:0.751758 
[307]	train-auc:0.957663	test-auc:0.751821 
[308]	train-auc:0.957769	test-auc:0.751782 
[309]	train-auc:0.957942	test-auc:0.751844 
[310]	train-auc:0.958123	test-auc:0.751701 
[311]	train-auc:0.958375	test-auc:0.751627 
[312]	train-auc:0.958523	test-auc:0.751591 
[313]	train-auc:0.958666	test-auc:0.751513 
[314]	train-auc:0.958915	test-auc:0.751550 
[315]	train-auc:0.959059	test-auc:0.751486 
[316]	train-auc:0.959522	test-auc:0.751558 
[317]	train-auc:0.959682	test-auc:0.751521 
[318]	train-auc:0.959683	test-auc:0.751420 
[319]	train-auc:0.959926	test-auc:0.751518 
[320]	train-auc:0.960190	test-auc:0.751493 
[321]	train-auc:0.960508	test-auc:0.751474 
[322]	train-auc:0.960792	test-auc:0.751551 
[323]	train-auc:0.960861	test-auc:0.751519 
[324]	train-auc:0.960987	test-auc:0.751651 
[325]	train-auc:0.961752	test-auc:0.751514 
[326]	train-auc:0.962042	test-auc:0.751614 
[327]	train-auc:0.962168	test-auc:0.751627 
[328]	train-auc:0.962228	test-auc:0.751655 
[329]	train-auc:0.962332	test-auc:0.751603 
[330]	train-auc:0.962421	test-auc:0.751564 
[331]	train-auc:0.962584	test-auc:0.751672 
[332]	train-auc:0.962743	test-auc:0.751821 
[333]	train-auc:0.962936	test-auc:0.751816 
[334]	train-auc:0.963056	test-auc:0.751911 
[335]	train-auc:0.963183	test-auc:0.752002 
[336]	train-auc:0.963430	test-auc:0.752071 
[337]	train-auc:0.963524	test-auc:0.752094 
[338]	train-auc:0.963599	test-auc:0.752097 
[339]	train-auc:0.963694	test-auc:0.752161 
[340]	train-auc:0.963961	test-auc:0.752114 
[341]	train-auc:0.964116	test-auc:0.752193 
[342]	train-auc:0.964170	test-auc:0.752297 
[343]	train-auc:0.964466	test-auc:0.752219 
[344]	train-auc:0.964580	test-auc:0.752319 
[345]	train-auc:0.964700	test-auc:0.752371 
[346]	train-auc:0.964790	test-auc:0.752352 
[347]	train-auc:0.964889	test-auc:0.752437 
[348]	train-auc:0.964919	test-auc:0.752407 
[349]	train-auc:0.964999	test-auc:0.752442 
[350]	train-auc:0.965173	test-auc:0.752420 
[351]	train-auc:0.965252	test-auc:0.752414 
[352]	train-auc:0.965343	test-auc:0.752417 
[353]	train-auc:0.965458	test-auc:0.752460 
[354]	train-auc:0.965480	test-auc:0.752472 
[355]	train-auc:0.965780	test-auc:0.752428 
[356]	train-auc:0.965916	test-auc:0.752529 
[357]	train-auc:0.966002	test-auc:0.752583 
[358]	train-auc:0.966199	test-auc:0.752466 
[359]	train-auc:0.966216	test-auc:0.752381 
[360]	train-auc:0.966279	test-auc:0.752403 
[361]	train-auc:0.966452	test-auc:0.752467 
[362]	train-auc:0.966621	test-auc:0.752482 
[363]	train-auc:0.966690	test-auc:0.752478 
[364]	train-auc:0.966785	test-auc:0.752571 
[365]	train-auc:0.966959	test-auc:0.752670 
[366]	train-auc:0.967011	test-auc:0.752683 
[367]	train-auc:0.967041	test-auc:0.752765 
[368]	train-auc:0.967154	test-auc:0.752914 
[369]	train-auc:0.967208	test-auc:0.752926 
[370]	train-auc:0.967241	test-auc:0.752986 
[371]	train-auc:0.967304	test-auc:0.753148 
[372]	train-auc:0.967355	test-auc:0.753046 
[373]	train-auc:0.967423	test-auc:0.753060 
[374]	train-auc:0.967634	test-auc:0.752969 
[375]	train-auc:0.967707	test-auc:0.752846 
[376]	train-auc:0.967783	test-auc:0.752893 
[377]	train-auc:0.967815	test-auc:0.752819 
[378]	train-auc:0.967869	test-auc:0.752840 
[379]	train-auc:0.968057	test-auc:0.752851 
[380]	train-auc:0.968265	test-auc:0.752928 
[381]	train-auc:0.968319	test-auc:0.752936 
[382]	train-auc:0.968367	test-auc:0.753071 
[383]	train-auc:0.968579	test-auc:0.752993 
[384]	train-auc:0.968612	test-auc:0.752960 
[385]	train-auc:0.968663	test-auc:0.753054 
[386]	train-auc:0.968775	test-auc:0.753022 
[387]	train-auc:0.968804	test-auc:0.753008 
[388]	train-auc:0.968874	test-auc:0.753047 
[389]	train-auc:0.969195	test-auc:0.753195 
[390]	train-auc:0.969286	test-auc:0.753232 
[391]	train-auc:0.969326	test-auc:0.753232 
[392]	train-auc:0.969366	test-auc:0.753312 
[393]	train-auc:0.969379	test-auc:0.753206 
[394]	train-auc:0.969553	test-auc:0.753199 
[395]	train-auc:0.969604	test-auc:0.753270 
[396]	train-auc:0.969760	test-auc:0.753230 
[397]	train-auc:0.969837	test-auc:0.753312 
[398]	train-auc:0.970122	test-auc:0.753594 
[399]	train-auc:0.970178	test-auc:0.753638 
[400]	train-auc:0.970216	test-auc:0.753606 
[401]	train-auc:0.970480	test-auc:0.753512 
[402]	train-auc:0.970518	test-auc:0.753595 
[403]	train-auc:0.970659	test-auc:0.753640 
[404]	train-auc:0.970716	test-auc:0.753711 
[405]	train-auc:0.970847	test-auc:0.753535 
[406]	train-auc:0.970936	test-auc:0.753655 
[407]	train-auc:0.970992	test-auc:0.753683 
[408]	train-auc:0.971065	test-auc:0.753712 
[409]	train-auc:0.971112	test-auc:0.753803 
[410]	train-auc:0.971195	test-auc:0.753944 
[411]	train-auc:0.971484	test-auc:0.754173 
[412]	train-auc:0.971696	test-auc:0.754177 
[413]	train-auc:0.972023	test-auc:0.754128 
[414]	train-auc:0.972166	test-auc:0.754047 
[415]	train-auc:0.972409	test-auc:0.754131 
[416]	train-auc:0.972664	test-auc:0.754022 
[417]	train-auc:0.972859	test-auc:0.754081 
[418]	train-auc:0.972935	test-auc:0.754137 
[419]	train-auc:0.972976	test-auc:0.754148 
[420]	train-auc:0.973167	test-auc:0.754016 
[421]	train-auc:0.973214	test-auc:0.753978 
[422]	train-auc:0.973342	test-auc:0.753786 
[423]	train-auc:0.973458	test-auc:0.753722 
[424]	train-auc:0.973660	test-auc:0.753617 
[425]	train-auc:0.973839	test-auc:0.753499 
[426]	train-auc:0.974057	test-auc:0.753602 
[427]	train-auc:0.974097	test-auc:0.753570 
[428]	train-auc:0.974239	test-auc:0.753502 
[429]	train-auc:0.974317	test-auc:0.753582 
[430]	train-auc:0.974499	test-auc:0.753603 
[431]	train-auc:0.974685	test-auc:0.753837 
[432]	train-auc:0.974832	test-auc:0.753794 
[433]	train-auc:0.974955	test-auc:0.753743 
[434]	train-auc:0.975067	test-auc:0.753730 
[435]	train-auc:0.975196	test-auc:0.753648 
[436]	train-auc:0.975375	test-auc:0.753696 
[437]	train-auc:0.975541	test-auc:0.753759 
[438]	train-auc:0.975662	test-auc:0.753991 
[439]	train-auc:0.975702	test-auc:0.754028 
[440]	train-auc:0.975830	test-auc:0.754072 
[441]	train-auc:0.975865	test-auc:0.754012 
[442]	train-auc:0.975978	test-auc:0.754026 
[443]	train-auc:0.975989	test-auc:0.754042 
[444]	train-auc:0.976169	test-auc:0.753848 
[445]	train-auc:0.976173	test-auc:0.753805 
[446]	train-auc:0.976187	test-auc:0.753806 
[447]	train-auc:0.976255	test-auc:0.753774 
[448]	train-auc:0.976286	test-auc:0.753833 
[449]	train-auc:0.976333	test-auc:0.753795 
[450]	train-auc:0.976386	test-auc:0.753798 
[451]	train-auc:0.976431	test-auc:0.753770 
[452]	train-auc:0.976465	test-auc:0.753730 
[453]	train-auc:0.976501	test-auc:0.753654 
[454]	train-auc:0.976632	test-auc:0.753712 
[455]	train-auc:0.976657	test-auc:0.753629 
[456]	train-auc:0.976668	test-auc:0.753658 
[457]	train-auc:0.976721	test-auc:0.753740 
[458]	train-auc:0.976780	test-auc:0.753790 
[459]	train-auc:0.976790	test-auc:0.753777 
[460]	train-auc:0.976957	test-auc:0.753764 
[461]	train-auc:0.977014	test-auc:0.753733 
[462]	train-auc:0.977036	test-auc:0.753707 
Stopping. Best iteration:
[412]	train-auc:0.971696	test-auc:0.754177




Fold 5

[1]	train-auc:0.658349	test-auc:0.652966 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.657753	test-auc:0.653157 
[3]	train-auc:0.658214	test-auc:0.653541 
[4]	train-auc:0.658215	test-auc:0.653540 
[5]	train-auc:0.658218	test-auc:0.653541 
[6]	train-auc:0.658221	test-auc:0.653544 
[7]	train-auc:0.660992	test-auc:0.655126 
[8]	train-auc:0.661164	test-auc:0.655004 
[9]	train-auc:0.662343	test-auc:0.655930 
[10]	train-auc:0.663300	test-auc:0.655761 
[11]	train-auc:0.663303	test-auc:0.655764 
[12]	train-auc:0.663364	test-auc:0.655755 
[13]	train-auc:0.663376	test-auc:0.656376 
[14]	train-auc:0.663383	test-auc:0.656387 
[15]	train-auc:0.663386	test-auc:0.656390 
[16]	train-auc:0.663396	test-auc:0.656387 
[17]	train-auc:0.663389	test-auc:0.656332 
[18]	train-auc:0.663399	test-auc:0.656340 
[19]	train-auc:0.663335	test-auc:0.656624 
[20]	train-auc:0.663335	test-auc:0.656630 
[21]	train-auc:0.663327	test-auc:0.656690 
[22]	train-auc:0.663327	test-auc:0.656691 
[23]	train-auc:0.663432	test-auc:0.656688 
[24]	train-auc:0.663484	test-auc:0.656682 
[25]	train-auc:0.663485	test-auc:0.656681 
[26]	train-auc:0.663486	test-auc:0.656681 
[27]	train-auc:0.663586	test-auc:0.656674 
[28]	train-auc:0.664108	test-auc:0.657006 
[29]	train-auc:0.664540	test-auc:0.656985 
[30]	train-auc:0.664540	test-auc:0.656983 
[31]	train-auc:0.664543	test-auc:0.656986 
[32]	train-auc:0.664541	test-auc:0.656981 
[33]	train-auc:0.664546	test-auc:0.656981 
[34]	train-auc:0.664964	test-auc:0.656951 
[35]	train-auc:0.664962	test-auc:0.656950 
[36]	train-auc:0.677713	test-auc:0.668411 
[37]	train-auc:0.677715	test-auc:0.668411 
[38]	train-auc:0.677819	test-auc:0.668406 
[39]	train-auc:0.677817	test-auc:0.668401 
[40]	train-auc:0.677932	test-auc:0.668407 
[41]	train-auc:0.678658	test-auc:0.668803 
[42]	train-auc:0.678651	test-auc:0.668795 
[43]	train-auc:0.678707	test-auc:0.668578 
[44]	train-auc:0.678939	test-auc:0.668558 
[45]	train-auc:0.678940	test-auc:0.668558 
[46]	train-auc:0.678938	test-auc:0.668557 
[47]	train-auc:0.679035	test-auc:0.668544 
[48]	train-auc:0.679037	test-auc:0.668545 
[49]	train-auc:0.679229	test-auc:0.668543 
[50]	train-auc:0.679260	test-auc:0.668613 
[51]	train-auc:0.679390	test-auc:0.668832 
[52]	train-auc:0.679473	test-auc:0.668985 
[53]	train-auc:0.679525	test-auc:0.668688 
[54]	train-auc:0.680599	test-auc:0.670823 
[55]	train-auc:0.680600	test-auc:0.670824 
[56]	train-auc:0.680598	test-auc:0.670789 
[57]	train-auc:0.680599	test-auc:0.670789 
[58]	train-auc:0.682077	test-auc:0.672185 
[59]	train-auc:0.682072	test-auc:0.672172 
[60]	train-auc:0.682077	test-auc:0.672146 
[61]	train-auc:0.682074	test-auc:0.672137 
[62]	train-auc:0.682146	test-auc:0.672072 
[63]	train-auc:0.689361	test-auc:0.677278 
[64]	train-auc:0.689355	test-auc:0.677264 
[65]	train-auc:0.689348	test-auc:0.677254 
[66]	train-auc:0.689360	test-auc:0.677256 
[67]	train-auc:0.689363	test-auc:0.677255 
[68]	train-auc:0.689363	test-auc:0.677255 
[69]	train-auc:0.689350	test-auc:0.677229 
[70]	train-auc:0.691391	test-auc:0.678421 
[71]	train-auc:0.703190	test-auc:0.689353 
[72]	train-auc:0.703211	test-auc:0.689301 
[73]	train-auc:0.702927	test-auc:0.689359 
[74]	train-auc:0.702956	test-auc:0.689346 
[75]	train-auc:0.703929	test-auc:0.690403 
[76]	train-auc:0.703263	test-auc:0.689620 
[77]	train-auc:0.703594	test-auc:0.689900 
[78]	train-auc:0.703720	test-auc:0.689893 
[79]	train-auc:0.704048	test-auc:0.689803 
[80]	train-auc:0.705162	test-auc:0.689656 
[81]	train-auc:0.705421	test-auc:0.689643 
[82]	train-auc:0.705727	test-auc:0.689567 
[83]	train-auc:0.705725	test-auc:0.689550 
[84]	train-auc:0.705748	test-auc:0.689486 
[85]	train-auc:0.707449	test-auc:0.690145 
[86]	train-auc:0.711283	test-auc:0.692930 
[87]	train-auc:0.711469	test-auc:0.692905 
[88]	train-auc:0.711742	test-auc:0.693057 
[89]	train-auc:0.711936	test-auc:0.692964 
[90]	train-auc:0.712547	test-auc:0.692951 
[91]	train-auc:0.713847	test-auc:0.692897 
[92]	train-auc:0.714111	test-auc:0.692830 
[93]	train-auc:0.716319	test-auc:0.694704 
[94]	train-auc:0.722043	test-auc:0.697115 
[95]	train-auc:0.722226	test-auc:0.696979 
[96]	train-auc:0.722907	test-auc:0.697252 
[97]	train-auc:0.723599	test-auc:0.699048 
[98]	train-auc:0.726495	test-auc:0.700317 
[99]	train-auc:0.727841	test-auc:0.701649 
[100]	train-auc:0.728923	test-auc:0.701833 
[101]	train-auc:0.730107	test-auc:0.702046 
[102]	train-auc:0.730975	test-auc:0.702502 
[103]	train-auc:0.732730	test-auc:0.703630 
[104]	train-auc:0.733250	test-auc:0.704355 
[105]	train-auc:0.736053	test-auc:0.704965 
[106]	train-auc:0.736468	test-auc:0.704848 
[107]	train-auc:0.736818	test-auc:0.705304 
[108]	train-auc:0.737536	test-auc:0.705306 
[109]	train-auc:0.737949	test-auc:0.705448 
[110]	train-auc:0.738964	test-auc:0.705592 
[111]	train-auc:0.741783	test-auc:0.707411 
[112]	train-auc:0.742242	test-auc:0.707676 
[113]	train-auc:0.743305	test-auc:0.708316 
[114]	train-auc:0.745411	test-auc:0.709367 
[115]	train-auc:0.747637	test-auc:0.709814 
[116]	train-auc:0.748828	test-auc:0.709908 
[117]	train-auc:0.750435	test-auc:0.710072 
[118]	train-auc:0.751457	test-auc:0.710589 
[119]	train-auc:0.753127	test-auc:0.710678 
[120]	train-auc:0.753999	test-auc:0.710828 
[121]	train-auc:0.755495	test-auc:0.711265 
[122]	train-auc:0.756025	test-auc:0.711118 
[123]	train-auc:0.757748	test-auc:0.711758 
[124]	train-auc:0.758316	test-auc:0.711483 
[125]	train-auc:0.759454	test-auc:0.711933 
[126]	train-auc:0.759886	test-auc:0.712131 
[127]	train-auc:0.760477	test-auc:0.712355 
[128]	train-auc:0.761039	test-auc:0.712230 
[129]	train-auc:0.761407	test-auc:0.712770 
[130]	train-auc:0.761602	test-auc:0.713161 
[131]	train-auc:0.762023	test-auc:0.713211 
[132]	train-auc:0.762287	test-auc:0.713091 
[133]	train-auc:0.762789	test-auc:0.713171 
[134]	train-auc:0.763252	test-auc:0.713191 
[135]	train-auc:0.764516	test-auc:0.713366 
[136]	train-auc:0.764955	test-auc:0.713476 
[137]	train-auc:0.765875	test-auc:0.713519 
[138]	train-auc:0.766414	test-auc:0.713599 
[139]	train-auc:0.766843	test-auc:0.713279 
[140]	train-auc:0.767598	test-auc:0.713502 
[141]	train-auc:0.769960	test-auc:0.713847 
[142]	train-auc:0.771286	test-auc:0.713779 
[143]	train-auc:0.772148	test-auc:0.713662 
[144]	train-auc:0.773307	test-auc:0.714056 
[145]	train-auc:0.774425	test-auc:0.714208 
[146]	train-auc:0.774976	test-auc:0.714343 
[147]	train-auc:0.776021	test-auc:0.714674 
[148]	train-auc:0.776845	test-auc:0.714763 
[149]	train-auc:0.777522	test-auc:0.714670 
[150]	train-auc:0.778643	test-auc:0.715347 
[151]	train-auc:0.779311	test-auc:0.715620 
[152]	train-auc:0.782148	test-auc:0.717077 
[153]	train-auc:0.782879	test-auc:0.717459 
[154]	train-auc:0.783393	test-auc:0.717562 
[155]	train-auc:0.785341	test-auc:0.718226 
[156]	train-auc:0.786019	test-auc:0.718349 
[157]	train-auc:0.786601	test-auc:0.718512 
[158]	train-auc:0.787896	test-auc:0.718862 
[159]	train-auc:0.790633	test-auc:0.718562 
[160]	train-auc:0.792370	test-auc:0.718900 
[161]	train-auc:0.794658	test-auc:0.719936 
[162]	train-auc:0.795933	test-auc:0.719954 
[163]	train-auc:0.797186	test-auc:0.720251 
[164]	train-auc:0.798474	test-auc:0.720467 
[165]	train-auc:0.800182	test-auc:0.720694 
[166]	train-auc:0.801607	test-auc:0.721311 
[167]	train-auc:0.802523	test-auc:0.721958 
[168]	train-auc:0.803876	test-auc:0.724087 
[169]	train-auc:0.805382	test-auc:0.724314 
[170]	train-auc:0.807882	test-auc:0.726895 
[171]	train-auc:0.810967	test-auc:0.728581 
[172]	train-auc:0.813155	test-auc:0.729518 
[173]	train-auc:0.815528	test-auc:0.729826 
[174]	train-auc:0.817185	test-auc:0.729868 
[175]	train-auc:0.818615	test-auc:0.729959 
[176]	train-auc:0.820816	test-auc:0.730392 
[177]	train-auc:0.824359	test-auc:0.731552 
[178]	train-auc:0.827308	test-auc:0.732187 
[179]	train-auc:0.829638	test-auc:0.732770 
[180]	train-auc:0.832074	test-auc:0.733317 
[181]	train-auc:0.834503	test-auc:0.734309 
[182]	train-auc:0.836255	test-auc:0.734620 
[183]	train-auc:0.837814	test-auc:0.735026 
[184]	train-auc:0.838937	test-auc:0.735422 
[185]	train-auc:0.840577	test-auc:0.735719 
[186]	train-auc:0.842207	test-auc:0.736434 
[187]	train-auc:0.843728	test-auc:0.736673 
[188]	train-auc:0.845310	test-auc:0.736857 
[189]	train-auc:0.847039	test-auc:0.737348 
[190]	train-auc:0.848651	test-auc:0.737245 
[191]	train-auc:0.850235	test-auc:0.737793 
[192]	train-auc:0.851607	test-auc:0.737880 
[193]	train-auc:0.853249	test-auc:0.738173 
[194]	train-auc:0.854749	test-auc:0.738354 
[195]	train-auc:0.855784	test-auc:0.738645 
[196]	train-auc:0.857203	test-auc:0.738702 
[197]	train-auc:0.858471	test-auc:0.739105 
[198]	train-auc:0.859581	test-auc:0.739133 
[199]	train-auc:0.860399	test-auc:0.739723 
[200]	train-auc:0.861517	test-auc:0.739615 
[201]	train-auc:0.862401	test-auc:0.739913 
[202]	train-auc:0.863265	test-auc:0.740047 
[203]	train-auc:0.864403	test-auc:0.740306 
[204]	train-auc:0.865117	test-auc:0.740215 
[205]	train-auc:0.866109	test-auc:0.740357 
[206]	train-auc:0.866931	test-auc:0.740395 
[207]	train-auc:0.868078	test-auc:0.740505 
[208]	train-auc:0.869069	test-auc:0.740303 
[209]	train-auc:0.870566	test-auc:0.740562 
[210]	train-auc:0.871527	test-auc:0.740491 
[211]	train-auc:0.872375	test-auc:0.740952 
[212]	train-auc:0.873412	test-auc:0.740865 
[213]	train-auc:0.874909	test-auc:0.741471 
[214]	train-auc:0.875735	test-auc:0.741691 
[215]	train-auc:0.876748	test-auc:0.741673 
[216]	train-auc:0.878327	test-auc:0.741829 
[217]	train-auc:0.879297	test-auc:0.741767 
[218]	train-auc:0.881000	test-auc:0.742014 
[219]	train-auc:0.882819	test-auc:0.742507 
[220]	train-auc:0.884059	test-auc:0.742573 
[221]	train-auc:0.885359	test-auc:0.742694 
[222]	train-auc:0.886666	test-auc:0.742707 
[223]	train-auc:0.888420	test-auc:0.742754 
[224]	train-auc:0.889915	test-auc:0.743130 
[225]	train-auc:0.891216	test-auc:0.743184 
[226]	train-auc:0.892394	test-auc:0.743413 
[227]	train-auc:0.893637	test-auc:0.743498 
[228]	train-auc:0.894786	test-auc:0.743568 
[229]	train-auc:0.895788	test-auc:0.743714 
[230]	train-auc:0.896927	test-auc:0.743952 
[231]	train-auc:0.898494	test-auc:0.743865 
[232]	train-auc:0.899990	test-auc:0.743733 
[233]	train-auc:0.901913	test-auc:0.744328 
[234]	train-auc:0.903482	test-auc:0.744739 
[235]	train-auc:0.904778	test-auc:0.744768 
[236]	train-auc:0.906339	test-auc:0.745261 
[237]	train-auc:0.907361	test-auc:0.745290 
[238]	train-auc:0.908499	test-auc:0.745543 
[239]	train-auc:0.909335	test-auc:0.745755 
[240]	train-auc:0.910871	test-auc:0.745846 
[241]	train-auc:0.911788	test-auc:0.745991 
[242]	train-auc:0.912564	test-auc:0.746097 
[243]	train-auc:0.913304	test-auc:0.746346 
[244]	train-auc:0.914263	test-auc:0.746413 
[245]	train-auc:0.914934	test-auc:0.746355 
[246]	train-auc:0.915398	test-auc:0.746459 
[247]	train-auc:0.916171	test-auc:0.746668 
[248]	train-auc:0.916595	test-auc:0.746652 
[249]	train-auc:0.918315	test-auc:0.746775 
[250]	train-auc:0.919531	test-auc:0.746629 
[251]	train-auc:0.920035	test-auc:0.746698 
[252]	train-auc:0.920399	test-auc:0.746887 
[253]	train-auc:0.921421	test-auc:0.747052 
[254]	train-auc:0.921950	test-auc:0.747096 
[255]	train-auc:0.922844	test-auc:0.747217 
[256]	train-auc:0.923322	test-auc:0.747125 
[257]	train-auc:0.924197	test-auc:0.747406 
[258]	train-auc:0.925007	test-auc:0.747425 
[259]	train-auc:0.925833	test-auc:0.747493 
[260]	train-auc:0.926431	test-auc:0.747462 
[261]	train-auc:0.926818	test-auc:0.747427 
[262]	train-auc:0.927830	test-auc:0.747490 
[263]	train-auc:0.928288	test-auc:0.747593 
[264]	train-auc:0.928980	test-auc:0.747794 
[265]	train-auc:0.929271	test-auc:0.747886 
[266]	train-auc:0.929795	test-auc:0.748000 
[267]	train-auc:0.930242	test-auc:0.748185 
[268]	train-auc:0.930865	test-auc:0.748146 
[269]	train-auc:0.931350	test-auc:0.748162 
[270]	train-auc:0.932028	test-auc:0.748168 
[271]	train-auc:0.932544	test-auc:0.748105 
[272]	train-auc:0.933356	test-auc:0.748252 
[273]	train-auc:0.933990	test-auc:0.748666 
[274]	train-auc:0.934494	test-auc:0.748704 
[275]	train-auc:0.934593	test-auc:0.748683 
[276]	train-auc:0.935401	test-auc:0.748881 
[277]	train-auc:0.936093	test-auc:0.749079 
[278]	train-auc:0.936627	test-auc:0.749070 
[279]	train-auc:0.937399	test-auc:0.749165 
[280]	train-auc:0.937885	test-auc:0.749129 
[281]	train-auc:0.938506	test-auc:0.749279 
[282]	train-auc:0.938919	test-auc:0.749373 
[283]	train-auc:0.939261	test-auc:0.749342 
[284]	train-auc:0.939783	test-auc:0.749489 
[285]	train-auc:0.940224	test-auc:0.749436 
[286]	train-auc:0.940437	test-auc:0.749613 
[287]	train-auc:0.941141	test-auc:0.749644 
[288]	train-auc:0.941713	test-auc:0.749984 
[289]	train-auc:0.942050	test-auc:0.750149 
[290]	train-auc:0.942329	test-auc:0.750246 
[291]	train-auc:0.942494	test-auc:0.750327 
[292]	train-auc:0.942565	test-auc:0.750336 
[293]	train-auc:0.943113	test-auc:0.750174 
[294]	train-auc:0.943321	test-auc:0.750035 
[295]	train-auc:0.944079	test-auc:0.750275 
[296]	train-auc:0.944610	test-auc:0.750262 
[297]	train-auc:0.944731	test-auc:0.750249 
[298]	train-auc:0.945077	test-auc:0.750281 
[299]	train-auc:0.945213	test-auc:0.750361 
[300]	train-auc:0.945687	test-auc:0.750312 
[301]	train-auc:0.945849	test-auc:0.750265 
[302]	train-auc:0.946124	test-auc:0.750242 
[303]	train-auc:0.946396	test-auc:0.750308 
[304]	train-auc:0.946553	test-auc:0.750272 
[305]	train-auc:0.946682	test-auc:0.750157 
[306]	train-auc:0.946971	test-auc:0.750339 
[307]	train-auc:0.947140	test-auc:0.750240 
[308]	train-auc:0.947473	test-auc:0.750310 
[309]	train-auc:0.947760	test-auc:0.750308 
[310]	train-auc:0.947824	test-auc:0.750267 
[311]	train-auc:0.947936	test-auc:0.750211 
[312]	train-auc:0.948057	test-auc:0.750282 
[313]	train-auc:0.948282	test-auc:0.750298 
[314]	train-auc:0.948632	test-auc:0.750378 
[315]	train-auc:0.948896	test-auc:0.750197 
[316]	train-auc:0.949036	test-auc:0.750025 
[317]	train-auc:0.949178	test-auc:0.750056 
[318]	train-auc:0.949300	test-auc:0.750029 
[319]	train-auc:0.949377	test-auc:0.750080 
[320]	train-auc:0.949512	test-auc:0.750121 
[321]	train-auc:0.949540	test-auc:0.750021 
[322]	train-auc:0.949630	test-auc:0.749946 
[323]	train-auc:0.949868	test-auc:0.750073 
[324]	train-auc:0.950045	test-auc:0.750167 
[325]	train-auc:0.950230	test-auc:0.750184 
[326]	train-auc:0.950367	test-auc:0.750064 
[327]	train-auc:0.950518	test-auc:0.749965 
[328]	train-auc:0.950670	test-auc:0.750095 
[329]	train-auc:0.950885	test-auc:0.750045 
[330]	train-auc:0.951230	test-auc:0.749919 
[331]	train-auc:0.951508	test-auc:0.750032 
[332]	train-auc:0.951622	test-auc:0.750121 
[333]	train-auc:0.951808	test-auc:0.750190 
[334]	train-auc:0.952027	test-auc:0.750089 
[335]	train-auc:0.952236	test-auc:0.750090 
[336]	train-auc:0.952319	test-auc:0.750066 
[337]	train-auc:0.952574	test-auc:0.750014 
[338]	train-auc:0.952658	test-auc:0.749999 
[339]	train-auc:0.952773	test-auc:0.750183 
[340]	train-auc:0.953077	test-auc:0.750065 
[341]	train-auc:0.953595	test-auc:0.749938 
[342]	train-auc:0.953807	test-auc:0.749992 
[343]	train-auc:0.953854	test-auc:0.749973 
[344]	train-auc:0.954076	test-auc:0.749989 
[345]	train-auc:0.954299	test-auc:0.750011 
[346]	train-auc:0.954468	test-auc:0.749975 
[347]	train-auc:0.954489	test-auc:0.749991 
[348]	train-auc:0.954603	test-auc:0.749950 
[349]	train-auc:0.954702	test-auc:0.749824 
[350]	train-auc:0.954811	test-auc:0.749850 
[351]	train-auc:0.954832	test-auc:0.749808 
[352]	train-auc:0.954880	test-auc:0.749869 
[353]	train-auc:0.955046	test-auc:0.749834 
[354]	train-auc:0.955106	test-auc:0.749874 
[355]	train-auc:0.955278	test-auc:0.749907 
[356]	train-auc:0.955508	test-auc:0.749995 
[357]	train-auc:0.955556	test-auc:0.749933 
[358]	train-auc:0.955908	test-auc:0.750054 
[359]	train-auc:0.956033	test-auc:0.749863 
[360]	train-auc:0.956144	test-auc:0.749843 
[361]	train-auc:0.956276	test-auc:0.749809 
[362]	train-auc:0.956328	test-auc:0.749851 
[363]	train-auc:0.956353	test-auc:0.749849 
[364]	train-auc:0.956547	test-auc:0.749804 
Stopping. Best iteration:
[314]	train-auc:0.948632	test-auc:0.750378

