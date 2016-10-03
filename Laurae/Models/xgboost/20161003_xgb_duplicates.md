```r
> format(Sys.time(), "%a %b %d %Y %X")
[1] "Mon Oct 03 2016 01:49:37 PM"
Warning message:
In as.POSIXlt.POSIXct(x, tz) : unable to identify current timezone 'C':
please set environment variable 'TZ'
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
+   sink(file = "Laurae/20161003_xgb_duplicates/logs.txt", append = TRUE, split = FALSE)
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
+                               #feval = mcc_eval_nofail_fold,
+                               eval_metric = "auc",
+                               maximize = TRUE,
+                               early_stopping_rounds = 100,
+                               objective = "binary:logistic",
+                               verbose = TRUE,
+                               prediction = TRUE,
+                               watchlist = list(train = dval1, test = dval2),
+                               #base_score = 0.005811208
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
+   write.csv(predictions1, file = "Laurae/20161003_xgb_duplicates/predictions_oof.csv", row.names = FALSE)
+   write.csv(predictions3, file = "Laurae/20161003_xgb_duplicates/predictions_test_raw.csv", row.names = FALSE)
+   write.csv(features[[j]], file = paste("Laurae/20161003_xgb_duplicates/best_features", j, ".csv", sep = ""), row.names = FALSE)
+   
+ }

Time: Mon Oct 03 2016 03:01:05 PM
Average of validation predictions:  0.005506697
Average of test predictions:  0.006809115
Average of rolling test predictions:  0.03404558
For 0396 rounds: train_auc: 0.952437 - test_auc: 0.791553
Confusion matrix:
     truth
preds      0      1
    0 234895   1071
    1    478    304
     truth
preds           0           1
    0 0.992173112 0.004523797
    1 0.002019024 0.001284066

Fold 1: MCC=0.2901114

Time: Mon Oct 03 2016 04:05:57 PM
Average of validation predictions:  0.005501214
Average of test predictions:  0.006808027
Average of rolling test predictions:  0.03404285
For 0386 rounds: train_auc: 0.955696 - test_auc: 0.793621
Confusion matrix:
     truth
preds      0      1
    0 234765   1050
    1    608    326
     truth
preds           0           1
    0 0.991619817 0.004435077
    1 0.002568121 0.001376986

Fold 2: MCC=0.2841623

Time: Mon Oct 03 2016 05:02:37 PM
Average of validation predictions:  0.005774886
Average of test predictions:  0.007150859
Average of rolling test predictions:  0.03461333
For 0300 rounds: train_auc: 0.934613 - test_auc: 0.781894
Confusion matrix:
     truth
preds      0      1
    0 235066   1128
    1    308    248
     truth
preds           0           1
    0 0.992887012 0.004764520
    1 0.001300950 0.001047518

Fold 3: MCC=0.2809864

Time: Mon Oct 03 2016 06:33:41 PM
Average of validation predictions:  0.005447133
Average of test predictions:  0.006639208
Average of rolling test predictions:  0.03425901
For 0523 rounds: train_auc: 0.973628 - test_auc: 0.78294
Confusion matrix:
     truth
preds      0      1
    0 234907   1097
    1    467    279
     truth
preds           0           1
    0 0.992215417 0.004633580
    1 0.001972545 0.001178458

Fold 4: MCC=0.2723169

Time: Mon Oct 03 2016 07:32:09 PM
Average of validation predictions:  0.006093835
Average of test predictions:  0.007575938
Average of rolling test predictions:  0.03498315
For 0270 rounds: train_auc: 0.926108 - test_auc: 0.774487
Confusion matrix:
     truth
preds      0      1
    0 234909   1087
    1    465    289
     truth
preds           0           1
    0 0.992223865 0.004591341
    1 0.001964097 0.001220697

Fold 5: MCC=0.2806891
> 
> predictions2 <- predictions2 / 5
> write.csv(predictions2, file = "Laurae/20161003_xgb_duplicates/predictions_test_mean.csv", row.names = FALSE)
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
Fold 1: MCC=0.2901114 | rolling average: 0.2901114
Fold 2: MCC=0.2841623 | rolling average: 0.2871369
Fold 3: MCC=0.2809864 | rolling average: 0.2850867
Fold 4: MCC=0.2723169 | rolling average: 0.2818942
Fold 5: MCC=0.2806891 | rolling average: 0.2816532
> cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
MCC: 0.2816532 + 0.006449394
> 
> best_mcc <- 0
> for (j in 1:5) {
+   
+   temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
+   best_mcc <- best_mcc + 0.2 * temp_mcc
+   cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
+   
+ }
Fold 1: threshold=0.1053738 | rolling average: 0.1053738
Fold 2: threshold=0.08154434 | rolling average: 0.09345909
Fold 3: threshold=0.1704341 | rolling average: 0.1191174
Fold 4: threshold=0.1232537 | rolling average: 0.1201515
Fold 5: threshold=0.117045 | rolling average: 0.1195302
> 
> submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission1$Response <- as.numeric(predictions2 > best_mcc)
> print(sum(submission1$Response == 1))
[1] 3699
> write.csv(submission1, file = "Laurae/20161003_xgb_duplicates/submission1.csv", row.names = FALSE)
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
Fold 1: threshold=0.1053738 | rolling average: 0.003685751
Fold 2: threshold=0.08154434 | rolling average: 0.004236121
Fold 3: threshold=0.1704341 | rolling average: 0.003629151
Fold 4: threshold=0.1232537 | rolling average: 0.003538126
Fold 5: threshold=0.117045 | rolling average: 0.003483174
> 
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 5)
> print(sum(submission2$Response == 1))
[1] 2241
> write.csv(submission2, file = "Laurae/20161003_xgb_duplicates/submission2_5.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 4)
> print(sum(submission2$Response == 1))
[1] 2909
> write.csv(submission2, file = "Laurae/20161003_xgb_duplicates/submission2_4.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 3)
> print(sum(submission2$Response == 1))
[1] 3566
> write.csv(submission2, file = "Laurae/20161003_xgb_duplicates/submission2_3.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 2)
> print(sum(submission2$Response == 1))
[1] 4648
> write.csv(submission2, file = "Laurae/20161003_xgb_duplicates/submission2_2.csv", row.names = FALSE)
> 
> submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission2$Response <- as.numeric(best_mcc >= 1)
> print(sum(submission2$Response == 1))
[1] 7252
> write.csv(submission2, file = "Laurae/20161003_xgb_duplicates/submission2_1.csv", row.names = FALSE)
> 
> 
> submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
> print(sum(submission3$Response == 1))
[1] 7252
> write.csv(submission3, file = "Laurae/20161003_xgb_duplicates/submission3.csv", row.names = FALSE)
> 
> 
> submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
> submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
> print(sum(submission4$Response == 1))
[1] 3699
> write.csv(submission4, file = "Laurae/20161003_xgb_duplicates/submission4.csv", row.names = FALSE)






Fold 1

[1]	train-auc:0.726971	test-auc:0.724884 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 100 rounds.

[2]	train-auc:0.726956	test-auc:0.724875 
[3]	train-auc:0.727578	test-auc:0.725793 
[4]	train-auc:0.729093	test-auc:0.726998 
[5]	train-auc:0.728999	test-auc:0.726945 
[6]	train-auc:0.729204	test-auc:0.727026 
[7]	train-auc:0.729204	test-auc:0.727024 
[8]	train-auc:0.729715	test-auc:0.727393 
[9]	train-auc:0.729720	test-auc:0.727395 
[10]	train-auc:0.729721	test-auc:0.727396 
[11]	train-auc:0.729731	test-auc:0.727404 
[12]	train-auc:0.729768	test-auc:0.727437 
[13]	train-auc:0.729773	test-auc:0.727441 
[14]	train-auc:0.729775	test-auc:0.727443 
[15]	train-auc:0.730167	test-auc:0.727722 
[16]	train-auc:0.730179	test-auc:0.727730 
[17]	train-auc:0.730589	test-auc:0.727891 
[18]	train-auc:0.730602	test-auc:0.727884 
[19]	train-auc:0.730724	test-auc:0.727945 
[20]	train-auc:0.730750	test-auc:0.727953 
[21]	train-auc:0.730750	test-auc:0.727955 
[22]	train-auc:0.730749	test-auc:0.727948 
[23]	train-auc:0.730762	test-auc:0.727952 
[24]	train-auc:0.730767	test-auc:0.727946 
[25]	train-auc:0.731332	test-auc:0.728503 
[26]	train-auc:0.731333	test-auc:0.728499 
[27]	train-auc:0.731572	test-auc:0.729115 
[28]	train-auc:0.731727	test-auc:0.729119 
[29]	train-auc:0.731724	test-auc:0.729109 
[30]	train-auc:0.731725	test-auc:0.729107 
[31]	train-auc:0.731918	test-auc:0.729092 
[32]	train-auc:0.731930	test-auc:0.729132 
[33]	train-auc:0.731934	test-auc:0.729138 
[34]	train-auc:0.731941	test-auc:0.729138 
[35]	train-auc:0.731950	test-auc:0.729137 
[36]	train-auc:0.732086	test-auc:0.729135 
[37]	train-auc:0.732107	test-auc:0.729131 
[38]	train-auc:0.732109	test-auc:0.729131 
[39]	train-auc:0.732244	test-auc:0.729152 
[40]	train-auc:0.732251	test-auc:0.729158 
[41]	train-auc:0.732417	test-auc:0.729179 
[42]	train-auc:0.732437	test-auc:0.729180 
[43]	train-auc:0.732448	test-auc:0.729181 
[44]	train-auc:0.744826	test-auc:0.740739 
[45]	train-auc:0.744747	test-auc:0.740734 
[46]	train-auc:0.744751	test-auc:0.740743 
[47]	train-auc:0.744750	test-auc:0.740743 
[48]	train-auc:0.744981	test-auc:0.740809 
[49]	train-auc:0.745018	test-auc:0.740824 
[50]	train-auc:0.745154	test-auc:0.740854 
[51]	train-auc:0.745202	test-auc:0.740853 
[52]	train-auc:0.745236	test-auc:0.740857 
[53]	train-auc:0.745264	test-auc:0.740869 
[54]	train-auc:0.745421	test-auc:0.741064 
[55]	train-auc:0.745509	test-auc:0.741150 
[56]	train-auc:0.745523	test-auc:0.741150 
[57]	train-auc:0.745793	test-auc:0.741162 
[58]	train-auc:0.745829	test-auc:0.741188 
[59]	train-auc:0.745885	test-auc:0.741215 
[60]	train-auc:0.745897	test-auc:0.741219 
[61]	train-auc:0.746001	test-auc:0.741228 
[62]	train-auc:0.746150	test-auc:0.741213 
[63]	train-auc:0.746192	test-auc:0.741217 
[64]	train-auc:0.746337	test-auc:0.741298 
[65]	train-auc:0.747383	test-auc:0.741766 
[66]	train-auc:0.747615	test-auc:0.741936 
[67]	train-auc:0.747669	test-auc:0.741946 
[68]	train-auc:0.747752	test-auc:0.741899 
[69]	train-auc:0.748531	test-auc:0.741816 
[70]	train-auc:0.748564	test-auc:0.741783 
[71]	train-auc:0.748578	test-auc:0.741773 
[72]	train-auc:0.748605	test-auc:0.741789 
[73]	train-auc:0.748646	test-auc:0.741791 
[74]	train-auc:0.749112	test-auc:0.741768 
[75]	train-auc:0.749251	test-auc:0.741760 
[76]	train-auc:0.749532	test-auc:0.741750 
[77]	train-auc:0.750176	test-auc:0.741848 
[78]	train-auc:0.750345	test-auc:0.741837 
[79]	train-auc:0.750371	test-auc:0.741821 
[80]	train-auc:0.750409	test-auc:0.741834 
[81]	train-auc:0.750464	test-auc:0.741826 
[82]	train-auc:0.751485	test-auc:0.742767 
[83]	train-auc:0.752049	test-auc:0.743222 
[84]	train-auc:0.752203	test-auc:0.743229 
[85]	train-auc:0.752252	test-auc:0.743211 
[86]	train-auc:0.752495	test-auc:0.743378 
[87]	train-auc:0.752518	test-auc:0.743358 
[88]	train-auc:0.752577	test-auc:0.743556 
[89]	train-auc:0.756966	test-auc:0.748584 
[90]	train-auc:0.757067	test-auc:0.748645 
[91]	train-auc:0.757387	test-auc:0.748955 
[92]	train-auc:0.757540	test-auc:0.748950 
[93]	train-auc:0.758141	test-auc:0.749153 
[94]	train-auc:0.762664	test-auc:0.753942 
[95]	train-auc:0.763300	test-auc:0.753560 
[96]	train-auc:0.763724	test-auc:0.753960 
[97]	train-auc:0.763927	test-auc:0.753782 
[98]	train-auc:0.765229	test-auc:0.753898 
[99]	train-auc:0.765530	test-auc:0.753893 
[100]	train-auc:0.766456	test-auc:0.753852 
[101]	train-auc:0.766787	test-auc:0.753845 
[102]	train-auc:0.769468	test-auc:0.757059 
[103]	train-auc:0.770128	test-auc:0.757942 
[104]	train-auc:0.770407	test-auc:0.757835 
[105]	train-auc:0.770808	test-auc:0.757622 
[106]	train-auc:0.771093	test-auc:0.757647 
[107]	train-auc:0.772721	test-auc:0.758426 
[108]	train-auc:0.773585	test-auc:0.758688 
[109]	train-auc:0.773794	test-auc:0.758672 
[110]	train-auc:0.774476	test-auc:0.758763 
[111]	train-auc:0.774575	test-auc:0.758766 
[112]	train-auc:0.774886	test-auc:0.758679 
[113]	train-auc:0.775652	test-auc:0.758629 
[114]	train-auc:0.778902	test-auc:0.760381 
[115]	train-auc:0.779578	test-auc:0.760220 
[116]	train-auc:0.783132	test-auc:0.761650 
[117]	train-auc:0.784382	test-auc:0.762746 
[118]	train-auc:0.784801	test-auc:0.763135 
[119]	train-auc:0.785063	test-auc:0.763343 
[120]	train-auc:0.785321	test-auc:0.763448 
[121]	train-auc:0.786422	test-auc:0.763659 
[122]	train-auc:0.788232	test-auc:0.764275 
[123]	train-auc:0.789060	test-auc:0.764254 
[124]	train-auc:0.789432	test-auc:0.764406 
[125]	train-auc:0.789577	test-auc:0.764397 
[126]	train-auc:0.789991	test-auc:0.764480 
[127]	train-auc:0.790392	test-auc:0.764426 
[128]	train-auc:0.790864	test-auc:0.764533 
[129]	train-auc:0.791589	test-auc:0.764954 
[130]	train-auc:0.792369	test-auc:0.764954 
[131]	train-auc:0.792621	test-auc:0.765075 
[132]	train-auc:0.793195	test-auc:0.765683 
[133]	train-auc:0.794810	test-auc:0.766867 
[134]	train-auc:0.796648	test-auc:0.767661 
[135]	train-auc:0.798164	test-auc:0.768685 
[136]	train-auc:0.798940	test-auc:0.769023 
[137]	train-auc:0.799415	test-auc:0.769371 
[138]	train-auc:0.800143	test-auc:0.769400 
[139]	train-auc:0.801353	test-auc:0.769563 
[140]	train-auc:0.802119	test-auc:0.769684 
[141]	train-auc:0.802902	test-auc:0.770472 
[142]	train-auc:0.803447	test-auc:0.770900 
[143]	train-auc:0.804264	test-auc:0.771534 
[144]	train-auc:0.804554	test-auc:0.771719 
[145]	train-auc:0.804846	test-auc:0.771965 
[146]	train-auc:0.805301	test-auc:0.772316 
[147]	train-auc:0.805822	test-auc:0.773132 
[148]	train-auc:0.806186	test-auc:0.773170 
[149]	train-auc:0.806416	test-auc:0.773372 
[150]	train-auc:0.807016	test-auc:0.773376 
[151]	train-auc:0.807624	test-auc:0.773866 
[152]	train-auc:0.808134	test-auc:0.774135 
[153]	train-auc:0.808571	test-auc:0.774371 
[154]	train-auc:0.809637	test-auc:0.775237 
[155]	train-auc:0.810526	test-auc:0.775394 
[156]	train-auc:0.811222	test-auc:0.775406 
[157]	train-auc:0.811839	test-auc:0.775575 
[158]	train-auc:0.812502	test-auc:0.775040 
[159]	train-auc:0.813574	test-auc:0.775324 
[160]	train-auc:0.814410	test-auc:0.775909 
[161]	train-auc:0.815130	test-auc:0.776135 
[162]	train-auc:0.815753	test-auc:0.776077 
[163]	train-auc:0.816804	test-auc:0.776327 
[164]	train-auc:0.817963	test-auc:0.776598 
[165]	train-auc:0.818893	test-auc:0.776484 
[166]	train-auc:0.819607	test-auc:0.776475 
[167]	train-auc:0.821153	test-auc:0.776335 
[168]	train-auc:0.821970	test-auc:0.776380 
[169]	train-auc:0.822872	test-auc:0.776137 
[170]	train-auc:0.823914	test-auc:0.776842 
[171]	train-auc:0.825336	test-auc:0.776780 
[172]	train-auc:0.825905	test-auc:0.776849 
[173]	train-auc:0.827086	test-auc:0.776758 
[174]	train-auc:0.828121	test-auc:0.777037 
[175]	train-auc:0.828826	test-auc:0.776723 
[176]	train-auc:0.830456	test-auc:0.776814 
[177]	train-auc:0.831654	test-auc:0.776891 
[178]	train-auc:0.832711	test-auc:0.777088 
[179]	train-auc:0.833762	test-auc:0.777326 
[180]	train-auc:0.835191	test-auc:0.777794 
[181]	train-auc:0.836312	test-auc:0.777900 
[182]	train-auc:0.838678	test-auc:0.778060 
[183]	train-auc:0.839448	test-auc:0.778143 
[184]	train-auc:0.840437	test-auc:0.778399 
[185]	train-auc:0.842012	test-auc:0.779061 
[186]	train-auc:0.843055	test-auc:0.779354 
[187]	train-auc:0.843785	test-auc:0.779612 
[188]	train-auc:0.845693	test-auc:0.779922 
[189]	train-auc:0.847024	test-auc:0.780299 
[190]	train-auc:0.848525	test-auc:0.780942 
[191]	train-auc:0.849429	test-auc:0.781064 
[192]	train-auc:0.851936	test-auc:0.781492 
[193]	train-auc:0.852883	test-auc:0.781832 
[194]	train-auc:0.853898	test-auc:0.781994 
[195]	train-auc:0.854798	test-auc:0.781860 
[196]	train-auc:0.856162	test-auc:0.782180 
[197]	train-auc:0.857686	test-auc:0.782396 
[198]	train-auc:0.858951	test-auc:0.782702 
[199]	train-auc:0.859707	test-auc:0.782943 
[200]	train-auc:0.861578	test-auc:0.783605 
[201]	train-auc:0.862503	test-auc:0.783634 
[202]	train-auc:0.864328	test-auc:0.784353 
[203]	train-auc:0.865598	test-auc:0.784642 
[204]	train-auc:0.866860	test-auc:0.785280 
[205]	train-auc:0.868016	test-auc:0.786033 
[206]	train-auc:0.869826	test-auc:0.786472 
[207]	train-auc:0.870496	test-auc:0.787024 
[208]	train-auc:0.871937	test-auc:0.787227 
[209]	train-auc:0.873086	test-auc:0.787534 
[210]	train-auc:0.874338	test-auc:0.787507 
[211]	train-auc:0.875287	test-auc:0.787635 
[212]	train-auc:0.876076	test-auc:0.787787 
[213]	train-auc:0.877696	test-auc:0.787990 
[214]	train-auc:0.878675	test-auc:0.788067 
[215]	train-auc:0.879434	test-auc:0.788075 
[216]	train-auc:0.880678	test-auc:0.788162 
[217]	train-auc:0.881334	test-auc:0.788252 
[218]	train-auc:0.882759	test-auc:0.788353 
[219]	train-auc:0.884054	test-auc:0.788678 
[220]	train-auc:0.885767	test-auc:0.788719 
[221]	train-auc:0.886854	test-auc:0.788952 
[222]	train-auc:0.888286	test-auc:0.789058 
[223]	train-auc:0.889599	test-auc:0.789285 
[224]	train-auc:0.890700	test-auc:0.789732 
[225]	train-auc:0.891438	test-auc:0.789962 
[226]	train-auc:0.891890	test-auc:0.789926 
[227]	train-auc:0.892626	test-auc:0.790105 
[228]	train-auc:0.892953	test-auc:0.789925 
[229]	train-auc:0.894037	test-auc:0.789710 
[230]	train-auc:0.895179	test-auc:0.789593 
[231]	train-auc:0.896842	test-auc:0.789645 
[232]	train-auc:0.897668	test-auc:0.789874 
[233]	train-auc:0.898691	test-auc:0.789805 
[234]	train-auc:0.899047	test-auc:0.789944 
[235]	train-auc:0.900248	test-auc:0.790094 
[236]	train-auc:0.901641	test-auc:0.790115 
[237]	train-auc:0.902349	test-auc:0.790157 
[238]	train-auc:0.903921	test-auc:0.790288 
[239]	train-auc:0.905227	test-auc:0.790103 
[240]	train-auc:0.906343	test-auc:0.790267 
[241]	train-auc:0.907267	test-auc:0.790263 
[242]	train-auc:0.908314	test-auc:0.790163 
[243]	train-auc:0.909261	test-auc:0.790509 
[244]	train-auc:0.910299	test-auc:0.790463 
[245]	train-auc:0.911299	test-auc:0.790417 
[246]	train-auc:0.912168	test-auc:0.790243 
[247]	train-auc:0.913415	test-auc:0.790555 
[248]	train-auc:0.914233	test-auc:0.790598 
[249]	train-auc:0.915241	test-auc:0.790958 
[250]	train-auc:0.915843	test-auc:0.790799 
[251]	train-auc:0.916573	test-auc:0.790862 
[252]	train-auc:0.917285	test-auc:0.790831 
[253]	train-auc:0.918201	test-auc:0.790728 
[254]	train-auc:0.918742	test-auc:0.790488 
[255]	train-auc:0.919190	test-auc:0.790480 
[256]	train-auc:0.919768	test-auc:0.790518 
[257]	train-auc:0.920424	test-auc:0.790399 
[258]	train-auc:0.920943	test-auc:0.790243 
[259]	train-auc:0.921676	test-auc:0.790426 
[260]	train-auc:0.922420	test-auc:0.790517 
[261]	train-auc:0.922845	test-auc:0.790699 
[262]	train-auc:0.923771	test-auc:0.791002 
[263]	train-auc:0.924305	test-auc:0.790933 
[264]	train-auc:0.924626	test-auc:0.790964 
[265]	train-auc:0.924888	test-auc:0.790971 
[266]	train-auc:0.925068	test-auc:0.790939 
[267]	train-auc:0.925503	test-auc:0.790862 
[268]	train-auc:0.925860	test-auc:0.790898 
[269]	train-auc:0.926288	test-auc:0.791007 
[270]	train-auc:0.926778	test-auc:0.790758 
[271]	train-auc:0.927246	test-auc:0.790853 
[272]	train-auc:0.927926	test-auc:0.790863 
[273]	train-auc:0.928366	test-auc:0.790795 
[274]	train-auc:0.928689	test-auc:0.790871 
[275]	train-auc:0.929251	test-auc:0.790779 
[276]	train-auc:0.929501	test-auc:0.790849 
[277]	train-auc:0.929714	test-auc:0.790751 
[278]	train-auc:0.929960	test-auc:0.790625 
[279]	train-auc:0.930300	test-auc:0.790412 
[280]	train-auc:0.930477	test-auc:0.790432 
[281]	train-auc:0.930559	test-auc:0.790463 
[282]	train-auc:0.931276	test-auc:0.790566 
[283]	train-auc:0.931415	test-auc:0.790785 
[284]	train-auc:0.931674	test-auc:0.790722 
[285]	train-auc:0.932221	test-auc:0.790730 
[286]	train-auc:0.932531	test-auc:0.790664 
[287]	train-auc:0.932765	test-auc:0.790620 
[288]	train-auc:0.933097	test-auc:0.790595 
[289]	train-auc:0.933356	test-auc:0.790623 
[290]	train-auc:0.933647	test-auc:0.790694 
[291]	train-auc:0.933865	test-auc:0.790687 
[292]	train-auc:0.934080	test-auc:0.790675 
[293]	train-auc:0.934436	test-auc:0.790615 
[294]	train-auc:0.934779	test-auc:0.790647 
[295]	train-auc:0.935017	test-auc:0.790796 
[296]	train-auc:0.935159	test-auc:0.790736 
[297]	train-auc:0.935458	test-auc:0.790875 
[298]	train-auc:0.935649	test-auc:0.790761 
[299]	train-auc:0.935771	test-auc:0.790690 
[300]	train-auc:0.935982	test-auc:0.790731 
[301]	train-auc:0.936157	test-auc:0.790743 
[302]	train-auc:0.936400	test-auc:0.790695 
[303]	train-auc:0.936893	test-auc:0.790773 
[304]	train-auc:0.937052	test-auc:0.790832 
[305]	train-auc:0.937401	test-auc:0.790865 
[306]	train-auc:0.937591	test-auc:0.790805 
[307]	train-auc:0.937751	test-auc:0.790854 
[308]	train-auc:0.938043	test-auc:0.790764 
[309]	train-auc:0.938263	test-auc:0.790755 
[310]	train-auc:0.938453	test-auc:0.790771 
[311]	train-auc:0.938718	test-auc:0.790824 
[312]	train-auc:0.939190	test-auc:0.790996 
[313]	train-auc:0.939373	test-auc:0.791001 
[314]	train-auc:0.939513	test-auc:0.791063 
[315]	train-auc:0.939762	test-auc:0.791140 
[316]	train-auc:0.940084	test-auc:0.791241 
[317]	train-auc:0.940226	test-auc:0.791268 
[318]	train-auc:0.940382	test-auc:0.791271 
[319]	train-auc:0.940543	test-auc:0.791303 
[320]	train-auc:0.940819	test-auc:0.791224 
[321]	train-auc:0.941003	test-auc:0.791225 
[322]	train-auc:0.941236	test-auc:0.791197 
[323]	train-auc:0.941328	test-auc:0.791305 
[324]	train-auc:0.941435	test-auc:0.791321 
[325]	train-auc:0.941559	test-auc:0.791313 
[326]	train-auc:0.941705	test-auc:0.791227 
[327]	train-auc:0.941939	test-auc:0.791261 
[328]	train-auc:0.942108	test-auc:0.791332 
[329]	train-auc:0.942313	test-auc:0.791402 
[330]	train-auc:0.942357	test-auc:0.791395 
[331]	train-auc:0.942664	test-auc:0.791396 
[332]	train-auc:0.942804	test-auc:0.791394 
[333]	train-auc:0.943033	test-auc:0.791430 
[334]	train-auc:0.943073	test-auc:0.791466 
[335]	train-auc:0.943256	test-auc:0.791461 
[336]	train-auc:0.943379	test-auc:0.791366 
[337]	train-auc:0.943410	test-auc:0.791351 
[338]	train-auc:0.943514	test-auc:0.791400 
[339]	train-auc:0.943634	test-auc:0.791384 
[340]	train-auc:0.943778	test-auc:0.791297 
[341]	train-auc:0.943914	test-auc:0.791303 
[342]	train-auc:0.944040	test-auc:0.791294 
[343]	train-auc:0.944397	test-auc:0.791207 
[344]	train-auc:0.944579	test-auc:0.791149 
[345]	train-auc:0.944843	test-auc:0.791125 
[346]	train-auc:0.945006	test-auc:0.791063 
[347]	train-auc:0.945403	test-auc:0.791194 
[348]	train-auc:0.945475	test-auc:0.791165 
[349]	train-auc:0.945622	test-auc:0.791152 
[350]	train-auc:0.945789	test-auc:0.791134 
[351]	train-auc:0.945850	test-auc:0.791178 
[352]	train-auc:0.946202	test-auc:0.791104 
[353]	train-auc:0.946314	test-auc:0.791130 
[354]	train-auc:0.946446	test-auc:0.791159 
[355]	train-auc:0.946540	test-auc:0.791201 
[356]	train-auc:0.946641	test-auc:0.791164 
[357]	train-auc:0.946856	test-auc:0.791250 
[358]	train-auc:0.947086	test-auc:0.791227 
[359]	train-auc:0.947185	test-auc:0.791194 
[360]	train-auc:0.947518	test-auc:0.791180 
[361]	train-auc:0.947619	test-auc:0.791125 
[362]	train-auc:0.947694	test-auc:0.791224 
[363]	train-auc:0.947824	test-auc:0.791166 
[364]	train-auc:0.948359	test-auc:0.791320 
[365]	train-auc:0.948538	test-auc:0.791265 
[366]	train-auc:0.948751	test-auc:0.791321 
[367]	train-auc:0.948842	test-auc:0.791347 
[368]	train-auc:0.949000	test-auc:0.791348 
[369]	train-auc:0.949238	test-auc:0.791262 
[370]	train-auc:0.949417	test-auc:0.791330 
[371]	train-auc:0.949543	test-auc:0.791377 
[372]	train-auc:0.949652	test-auc:0.791377 
[373]	train-auc:0.949918	test-auc:0.791438 
[374]	train-auc:0.949964	test-auc:0.791423 
[375]	train-auc:0.950250	test-auc:0.791313 
[376]	train-auc:0.950475	test-auc:0.791287 
[377]	train-auc:0.950555	test-auc:0.791258 
[378]	train-auc:0.950697	test-auc:0.791180 
[379]	train-auc:0.950778	test-auc:0.791216 
[380]	train-auc:0.950901	test-auc:0.791220 
[381]	train-auc:0.951034	test-auc:0.791137 
[382]	train-auc:0.951082	test-auc:0.791169 
[383]	train-auc:0.951228	test-auc:0.791280 
[384]	train-auc:0.951281	test-auc:0.791314 
[385]	train-auc:0.951456	test-auc:0.791402 
[386]	train-auc:0.951508	test-auc:0.791432 
[387]	train-auc:0.951547	test-auc:0.791414 
[388]	train-auc:0.951654	test-auc:0.791455 
[389]	train-auc:0.951741	test-auc:0.791419 
[390]	train-auc:0.951905	test-auc:0.791529 
[391]	train-auc:0.951942	test-auc:0.791541 
[392]	train-auc:0.952088	test-auc:0.791499 
[393]	train-auc:0.952166	test-auc:0.791463 
[394]	train-auc:0.952252	test-auc:0.791466 
[395]	train-auc:0.952372	test-auc:0.791544 
[396]	train-auc:0.952437	test-auc:0.791553 
[397]	train-auc:0.952519	test-auc:0.791530 
[398]	train-auc:0.952673	test-auc:0.791492 
[399]	train-auc:0.952811	test-auc:0.791512 
[400]	train-auc:0.952904	test-auc:0.791552 
[401]	train-auc:0.952978	test-auc:0.791506 
[402]	train-auc:0.953036	test-auc:0.791529 
[403]	train-auc:0.953072	test-auc:0.791449 
[404]	train-auc:0.953393	test-auc:0.791395 
[405]	train-auc:0.953521	test-auc:0.791399 
[406]	train-auc:0.953682	test-auc:0.791351 
[407]	train-auc:0.953707	test-auc:0.791371 
[408]	train-auc:0.953878	test-auc:0.791350 
[409]	train-auc:0.954105	test-auc:0.791253 
[410]	train-auc:0.954385	test-auc:0.791227 
[411]	train-auc:0.954505	test-auc:0.791266 
[412]	train-auc:0.954557	test-auc:0.791251 
[413]	train-auc:0.954797	test-auc:0.791303 
[414]	train-auc:0.954931	test-auc:0.791280 
[415]	train-auc:0.954982	test-auc:0.791178 
[416]	train-auc:0.955144	test-auc:0.791195 
[417]	train-auc:0.955465	test-auc:0.791228 
[418]	train-auc:0.955795	test-auc:0.791238 
[419]	train-auc:0.955823	test-auc:0.791259 
[420]	train-auc:0.955934	test-auc:0.791197 
[421]	train-auc:0.956026	test-auc:0.791125 
[422]	train-auc:0.956140	test-auc:0.791185 
[423]	train-auc:0.956271	test-auc:0.791157 
[424]	train-auc:0.956471	test-auc:0.791207 
[425]	train-auc:0.956527	test-auc:0.791219 
[426]	train-auc:0.956574	test-auc:0.791102 
[427]	train-auc:0.956612	test-auc:0.791049 
[428]	train-auc:0.956937	test-auc:0.791234 
[429]	train-auc:0.956964	test-auc:0.791242 
[430]	train-auc:0.957198	test-auc:0.791314 
[431]	train-auc:0.957431	test-auc:0.791400 
[432]	train-auc:0.957450	test-auc:0.791477 
[433]	train-auc:0.957519	test-auc:0.791490 
[434]	train-auc:0.957616	test-auc:0.791427 
[435]	train-auc:0.957766	test-auc:0.791374 
[436]	train-auc:0.957807	test-auc:0.791289 
[437]	train-auc:0.957990	test-auc:0.791293 
[438]	train-auc:0.958014	test-auc:0.791277 
[439]	train-auc:0.958118	test-auc:0.791271 
[440]	train-auc:0.958275	test-auc:0.791341 
[441]	train-auc:0.958443	test-auc:0.791150 
[442]	train-auc:0.958456	test-auc:0.791178 
[443]	train-auc:0.958536	test-auc:0.791163 
[444]	train-auc:0.958672	test-auc:0.791149 
[445]	train-auc:0.958718	test-auc:0.791124 
[446]	train-auc:0.958898	test-auc:0.791040 
[447]	train-auc:0.958964	test-auc:0.790986 
[448]	train-auc:0.959005	test-auc:0.791016 
[449]	train-auc:0.959098	test-auc:0.790898 
[450]	train-auc:0.959294	test-auc:0.790820 
[451]	train-auc:0.959396	test-auc:0.790813 
[452]	train-auc:0.959787	test-auc:0.790859 
[453]	train-auc:0.959879	test-auc:0.790898 
[454]	train-auc:0.959906	test-auc:0.790900 
[455]	train-auc:0.960019	test-auc:0.790903 
[456]	train-auc:0.960263	test-auc:0.790927 
[457]	train-auc:0.960329	test-auc:0.790945 
[458]	train-auc:0.960539	test-auc:0.790822 
[459]	train-auc:0.960585	test-auc:0.790832 
[460]	train-auc:0.960614	test-auc:0.790800 
[461]	train-auc:0.960785	test-auc:0.790756 
[462]	train-auc:0.960857	test-auc:0.790849 
[463]	train-auc:0.960880	test-auc:0.790823 
[464]	train-auc:0.961065	test-auc:0.790835 
[465]	train-auc:0.961097	test-auc:0.790777 
[466]	train-auc:0.961446	test-auc:0.790891 
[467]	train-auc:0.961553	test-auc:0.790897 
[468]	train-auc:0.961595	test-auc:0.790959 
[469]	train-auc:0.961805	test-auc:0.790995 
[470]	train-auc:0.961835	test-auc:0.790987 
[471]	train-auc:0.961901	test-auc:0.790937 
[472]	train-auc:0.961947	test-auc:0.790956 
[473]	train-auc:0.961963	test-auc:0.790935 
[474]	train-auc:0.962078	test-auc:0.790902 
[475]	train-auc:0.962134	test-auc:0.790875 
[476]	train-auc:0.962275	test-auc:0.790875 
[477]	train-auc:0.962292	test-auc:0.790872 
[478]	train-auc:0.962348	test-auc:0.790929 
[479]	train-auc:0.962402	test-auc:0.790962 
[480]	train-auc:0.962485	test-auc:0.791054 
[481]	train-auc:0.962646	test-auc:0.790942 
[482]	train-auc:0.962782	test-auc:0.790916 
[483]	train-auc:0.962838	test-auc:0.790880 
[484]	train-auc:0.962854	test-auc:0.790861 
[485]	train-auc:0.963031	test-auc:0.790844 
[486]	train-auc:0.963062	test-auc:0.790747 
[487]	train-auc:0.963098	test-auc:0.790711 
[488]	train-auc:0.963192	test-auc:0.790669 
[489]	train-auc:0.963276	test-auc:0.790627 
[490]	train-auc:0.963337	test-auc:0.790572 
[491]	train-auc:0.963457	test-auc:0.790445 
[492]	train-auc:0.963484	test-auc:0.790457 
[493]	train-auc:0.963673	test-auc:0.790432 
[494]	train-auc:0.963705	test-auc:0.790360 
[495]	train-auc:0.963728	test-auc:0.790343 
[496]	train-auc:0.963898	test-auc:0.790330 
Stopping. Best iteration:
[396]	train-auc:0.952437	test-auc:0.791553




Fold 2

[1]	train-auc:0.725800	test-auc:0.730249 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 100 rounds.

[2]	train-auc:0.725802	test-auc:0.730258 
[3]	train-auc:0.725984	test-auc:0.730730 
[4]	train-auc:0.725973	test-auc:0.730733 
[5]	train-auc:0.726245	test-auc:0.730721 
[6]	train-auc:0.726274	test-auc:0.730706 
[7]	train-auc:0.726752	test-auc:0.731318 
[8]	train-auc:0.726754	test-auc:0.731319 
[9]	train-auc:0.726754	test-auc:0.731323 
[10]	train-auc:0.726887	test-auc:0.731486 
[11]	train-auc:0.726885	test-auc:0.731483 
[12]	train-auc:0.726909	test-auc:0.731434 
[13]	train-auc:0.726913	test-auc:0.731436 
[14]	train-auc:0.727013	test-auc:0.731486 
[15]	train-auc:0.727012	test-auc:0.731479 
[16]	train-auc:0.727060	test-auc:0.731534 
[17]	train-auc:0.727061	test-auc:0.731533 
[18]	train-auc:0.727063	test-auc:0.731532 
[19]	train-auc:0.727064	test-auc:0.731532 
[20]	train-auc:0.727067	test-auc:0.731535 
[21]	train-auc:0.727244	test-auc:0.731303 
[22]	train-auc:0.728929	test-auc:0.732987 
[23]	train-auc:0.729263	test-auc:0.733215 
[24]	train-auc:0.729270	test-auc:0.733220 
[25]	train-auc:0.729292	test-auc:0.733258 
[26]	train-auc:0.729373	test-auc:0.733318 
[27]	train-auc:0.729461	test-auc:0.733259 
[28]	train-auc:0.729489	test-auc:0.733273 
[29]	train-auc:0.729492	test-auc:0.733265 
[30]	train-auc:0.729498	test-auc:0.733264 
[31]	train-auc:0.729517	test-auc:0.733259 
[32]	train-auc:0.729555	test-auc:0.733298 
[33]	train-auc:0.729558	test-auc:0.733292 
[34]	train-auc:0.729557	test-auc:0.733294 
[35]	train-auc:0.730223	test-auc:0.734055 
[36]	train-auc:0.730228	test-auc:0.734055 
[37]	train-auc:0.730274	test-auc:0.734108 
[38]	train-auc:0.730503	test-auc:0.734262 
[39]	train-auc:0.730500	test-auc:0.734259 
[40]	train-auc:0.730511	test-auc:0.734268 
[41]	train-auc:0.730518	test-auc:0.734268 
[42]	train-auc:0.730534	test-auc:0.734274 
[43]	train-auc:0.730550	test-auc:0.734279 
[44]	train-auc:0.730588	test-auc:0.734312 
[45]	train-auc:0.730594	test-auc:0.734313 
[46]	train-auc:0.730817	test-auc:0.734365 
[47]	train-auc:0.730956	test-auc:0.734359 
[48]	train-auc:0.731091	test-auc:0.734356 
[49]	train-auc:0.731468	test-auc:0.734766 
[50]	train-auc:0.731483	test-auc:0.734765 
[51]	train-auc:0.731495	test-auc:0.734762 
[52]	train-auc:0.731526	test-auc:0.734767 
[53]	train-auc:0.731729	test-auc:0.734755 
[54]	train-auc:0.731732	test-auc:0.735162 
[55]	train-auc:0.731732	test-auc:0.735168 
[56]	train-auc:0.731741	test-auc:0.735170 
[57]	train-auc:0.731747	test-auc:0.735176 
[58]	train-auc:0.731767	test-auc:0.735178 
[59]	train-auc:0.731776	test-auc:0.735168 
[60]	train-auc:0.744397	test-auc:0.745486 
[61]	train-auc:0.744408	test-auc:0.745485 
[62]	train-auc:0.744650	test-auc:0.745299 
[63]	train-auc:0.745526	test-auc:0.745503 
[64]	train-auc:0.745637	test-auc:0.745604 
[65]	train-auc:0.745686	test-auc:0.745665 
[66]	train-auc:0.745706	test-auc:0.745467 
[67]	train-auc:0.745880	test-auc:0.745311 
[68]	train-auc:0.745878	test-auc:0.745293 
[69]	train-auc:0.745888	test-auc:0.745316 
[70]	train-auc:0.746737	test-auc:0.745904 
[71]	train-auc:0.746742	test-auc:0.745891 
[72]	train-auc:0.746763	test-auc:0.745894 
[73]	train-auc:0.748111	test-auc:0.745795 
[74]	train-auc:0.749325	test-auc:0.746052 
[75]	train-auc:0.749386	test-auc:0.746088 
[76]	train-auc:0.749534	test-auc:0.746054 
[77]	train-auc:0.749665	test-auc:0.746052 
[78]	train-auc:0.749913	test-auc:0.745826 
[79]	train-auc:0.749994	test-auc:0.745799 
[80]	train-auc:0.750160	test-auc:0.745775 
[81]	train-auc:0.750251	test-auc:0.745722 
[82]	train-auc:0.750309	test-auc:0.745764 
[83]	train-auc:0.752265	test-auc:0.745531 
[84]	train-auc:0.752375	test-auc:0.745514 
[85]	train-auc:0.752871	test-auc:0.745470 
[86]	train-auc:0.753627	test-auc:0.745382 
[87]	train-auc:0.753748	test-auc:0.745431 
[88]	train-auc:0.755439	test-auc:0.745728 
[89]	train-auc:0.755506	test-auc:0.746401 
[90]	train-auc:0.755591	test-auc:0.746407 
[91]	train-auc:0.755805	test-auc:0.746351 
[92]	train-auc:0.756145	test-auc:0.746643 
[93]	train-auc:0.756466	test-auc:0.746689 
[94]	train-auc:0.763267	test-auc:0.754418 
[95]	train-auc:0.763990	test-auc:0.755335 
[96]	train-auc:0.764198	test-auc:0.755652 
[97]	train-auc:0.764457	test-auc:0.756184 
[98]	train-auc:0.766231	test-auc:0.758527 
[99]	train-auc:0.766320	test-auc:0.758572 
[100]	train-auc:0.766693	test-auc:0.759067 
[101]	train-auc:0.766772	test-auc:0.759115 
[102]	train-auc:0.767346	test-auc:0.759386 
[103]	train-auc:0.769603	test-auc:0.759297 
[104]	train-auc:0.772993	test-auc:0.763419 
[105]	train-auc:0.773833	test-auc:0.763897 
[106]	train-auc:0.774402	test-auc:0.763893 
[107]	train-auc:0.774789	test-auc:0.763816 
[108]	train-auc:0.775201	test-auc:0.763771 
[109]	train-auc:0.775456	test-auc:0.763737 
[110]	train-auc:0.775712	test-auc:0.764172 
[111]	train-auc:0.776104	test-auc:0.764278 
[112]	train-auc:0.776219	test-auc:0.764313 
[113]	train-auc:0.777342	test-auc:0.764013 
[114]	train-auc:0.777938	test-auc:0.764055 
[115]	train-auc:0.778347	test-auc:0.764455 
[116]	train-auc:0.778532	test-auc:0.764540 
[117]	train-auc:0.779065	test-auc:0.764658 
[118]	train-auc:0.779199	test-auc:0.764507 
[119]	train-auc:0.779452	test-auc:0.764502 
[120]	train-auc:0.780827	test-auc:0.765069 
[121]	train-auc:0.781205	test-auc:0.765187 
[122]	train-auc:0.783620	test-auc:0.765133 
[123]	train-auc:0.784127	test-auc:0.765396 
[124]	train-auc:0.784502	test-auc:0.765340 
[125]	train-auc:0.785131	test-auc:0.765466 
[126]	train-auc:0.785589	test-auc:0.765393 
[127]	train-auc:0.786372	test-auc:0.766078 
[128]	train-auc:0.786865	test-auc:0.766224 
[129]	train-auc:0.787548	test-auc:0.767141 
[130]	train-auc:0.788236	test-auc:0.767163 
[131]	train-auc:0.788354	test-auc:0.767236 
[132]	train-auc:0.789023	test-auc:0.767584 
[133]	train-auc:0.789657	test-auc:0.767923 
[134]	train-auc:0.790292	test-auc:0.768589 
[135]	train-auc:0.790366	test-auc:0.768700 
[136]	train-auc:0.790566	test-auc:0.769050 
[137]	train-auc:0.790954	test-auc:0.768867 
[138]	train-auc:0.791275	test-auc:0.768954 
[139]	train-auc:0.791531	test-auc:0.769539 
[140]	train-auc:0.791929	test-auc:0.769736 
[141]	train-auc:0.792106	test-auc:0.769624 
[142]	train-auc:0.792567	test-auc:0.769681 
[143]	train-auc:0.794930	test-auc:0.770532 
[144]	train-auc:0.796949	test-auc:0.770789 
[145]	train-auc:0.798714	test-auc:0.771388 
[146]	train-auc:0.800000	test-auc:0.771624 
[147]	train-auc:0.800908	test-auc:0.771898 
[148]	train-auc:0.801932	test-auc:0.771607 
[149]	train-auc:0.802796	test-auc:0.771996 
[150]	train-auc:0.803335	test-auc:0.772344 
[151]	train-auc:0.804018	test-auc:0.772705 
[152]	train-auc:0.805524	test-auc:0.772826 
[153]	train-auc:0.806076	test-auc:0.773239 
[154]	train-auc:0.806797	test-auc:0.773279 
[155]	train-auc:0.807867	test-auc:0.773525 
[156]	train-auc:0.809257	test-auc:0.773852 
[157]	train-auc:0.809620	test-auc:0.774153 
[158]	train-auc:0.810559	test-auc:0.774443 
[159]	train-auc:0.811927	test-auc:0.775123 
[160]	train-auc:0.813350	test-auc:0.775099 
[161]	train-auc:0.814379	test-auc:0.775502 
[162]	train-auc:0.815272	test-auc:0.775553 
[163]	train-auc:0.816526	test-auc:0.776169 
[164]	train-auc:0.817670	test-auc:0.776373 
[165]	train-auc:0.818935	test-auc:0.776556 
[166]	train-auc:0.820081	test-auc:0.776542 
[167]	train-auc:0.821194	test-auc:0.776677 
[168]	train-auc:0.822195	test-auc:0.776966 
[169]	train-auc:0.822847	test-auc:0.777175 
[170]	train-auc:0.823770	test-auc:0.777360 
[171]	train-auc:0.824826	test-auc:0.777829 
[172]	train-auc:0.825504	test-auc:0.777970 
[173]	train-auc:0.826551	test-auc:0.778190 
[174]	train-auc:0.827973	test-auc:0.778445 
[175]	train-auc:0.829084	test-auc:0.778671 
[176]	train-auc:0.830095	test-auc:0.778591 
[177]	train-auc:0.832354	test-auc:0.779828 
[178]	train-auc:0.834053	test-auc:0.780128 
[179]	train-auc:0.835158	test-auc:0.780389 
[180]	train-auc:0.836253	test-auc:0.780169 
[181]	train-auc:0.838606	test-auc:0.780514 
[182]	train-auc:0.839902	test-auc:0.780529 
[183]	train-auc:0.840867	test-auc:0.780795 
[184]	train-auc:0.841983	test-auc:0.781013 
[185]	train-auc:0.843193	test-auc:0.781195 
[186]	train-auc:0.844554	test-auc:0.781451 
[187]	train-auc:0.846073	test-auc:0.781528 
[188]	train-auc:0.847398	test-auc:0.781818 
[189]	train-auc:0.848575	test-auc:0.782194 
[190]	train-auc:0.849724	test-auc:0.782485 
[191]	train-auc:0.850794	test-auc:0.782854 
[192]	train-auc:0.851908	test-auc:0.782867 
[193]	train-auc:0.852681	test-auc:0.782816 
[194]	train-auc:0.853706	test-auc:0.782944 
[195]	train-auc:0.854865	test-auc:0.783186 
[196]	train-auc:0.855916	test-auc:0.783593 
[197]	train-auc:0.857033	test-auc:0.783875 
[198]	train-auc:0.858139	test-auc:0.784140 
[199]	train-auc:0.859293	test-auc:0.784355 
[200]	train-auc:0.860421	test-auc:0.784636 
[201]	train-auc:0.861951	test-auc:0.784883 
[202]	train-auc:0.862755	test-auc:0.785317 
[203]	train-auc:0.863877	test-auc:0.785603 
[204]	train-auc:0.864489	test-auc:0.785988 
[205]	train-auc:0.865754	test-auc:0.786327 
[206]	train-auc:0.866722	test-auc:0.786706 
[207]	train-auc:0.867470	test-auc:0.787095 
[208]	train-auc:0.868167	test-auc:0.787589 
[209]	train-auc:0.869461	test-auc:0.787666 
[210]	train-auc:0.870031	test-auc:0.787843 
[211]	train-auc:0.871169	test-auc:0.787947 
[212]	train-auc:0.871702	test-auc:0.787947 
[213]	train-auc:0.872465	test-auc:0.788054 
[214]	train-auc:0.873277	test-auc:0.788081 
[215]	train-auc:0.874370	test-auc:0.788185 
[216]	train-auc:0.874730	test-auc:0.788163 
[217]	train-auc:0.875376	test-auc:0.788448 
[218]	train-auc:0.875919	test-auc:0.788392 
[219]	train-auc:0.876633	test-auc:0.788614 
[220]	train-auc:0.877089	test-auc:0.788644 
[221]	train-auc:0.878224	test-auc:0.788773 
[222]	train-auc:0.879507	test-auc:0.788963 
[223]	train-auc:0.880484	test-auc:0.789006 
[224]	train-auc:0.881622	test-auc:0.789048 
[225]	train-auc:0.881987	test-auc:0.789113 
[226]	train-auc:0.882984	test-auc:0.788986 
[227]	train-auc:0.883990	test-auc:0.789099 
[228]	train-auc:0.884470	test-auc:0.789089 
[229]	train-auc:0.885280	test-auc:0.789266 
[230]	train-auc:0.886375	test-auc:0.789490 
[231]	train-auc:0.887301	test-auc:0.789398 
[232]	train-auc:0.887756	test-auc:0.789418 
[233]	train-auc:0.888994	test-auc:0.789451 
[234]	train-auc:0.890137	test-auc:0.789649 
[235]	train-auc:0.891194	test-auc:0.789748 
[236]	train-auc:0.891582	test-auc:0.789893 
[237]	train-auc:0.892600	test-auc:0.789778 
[238]	train-auc:0.894155	test-auc:0.789921 
[239]	train-auc:0.894366	test-auc:0.789733 
[240]	train-auc:0.896071	test-auc:0.790174 
[241]	train-auc:0.897502	test-auc:0.790218 
[242]	train-auc:0.898617	test-auc:0.790518 
[243]	train-auc:0.899944	test-auc:0.790607 
[244]	train-auc:0.901126	test-auc:0.790587 
[245]	train-auc:0.902306	test-auc:0.790657 
[246]	train-auc:0.903257	test-auc:0.790628 
[247]	train-auc:0.903559	test-auc:0.790652 
[248]	train-auc:0.904693	test-auc:0.790623 
[249]	train-auc:0.905941	test-auc:0.790399 
[250]	train-auc:0.906366	test-auc:0.790530 
[251]	train-auc:0.907474	test-auc:0.790602 
[252]	train-auc:0.908398	test-auc:0.790535 
[253]	train-auc:0.908588	test-auc:0.790371 
[254]	train-auc:0.909372	test-auc:0.790436 
[255]	train-auc:0.910353	test-auc:0.790523 
[256]	train-auc:0.911019	test-auc:0.790544 
[257]	train-auc:0.911753	test-auc:0.790409 
[258]	train-auc:0.912714	test-auc:0.790474 
[259]	train-auc:0.913546	test-auc:0.790508 
[260]	train-auc:0.914458	test-auc:0.790289 
[261]	train-auc:0.915240	test-auc:0.790491 
[262]	train-auc:0.916142	test-auc:0.790287 
[263]	train-auc:0.917287	test-auc:0.790280 
[264]	train-auc:0.917851	test-auc:0.790274 
[265]	train-auc:0.918638	test-auc:0.790253 
[266]	train-auc:0.919668	test-auc:0.790373 
[267]	train-auc:0.920378	test-auc:0.790214 
[268]	train-auc:0.921128	test-auc:0.790364 
[269]	train-auc:0.921915	test-auc:0.790398 
[270]	train-auc:0.922653	test-auc:0.790689 
[271]	train-auc:0.923363	test-auc:0.790693 
[272]	train-auc:0.924307	test-auc:0.790717 
[273]	train-auc:0.924910	test-auc:0.790988 
[274]	train-auc:0.926191	test-auc:0.790962 
[275]	train-auc:0.926809	test-auc:0.791045 
[276]	train-auc:0.927369	test-auc:0.791132 
[277]	train-auc:0.927768	test-auc:0.791226 
[278]	train-auc:0.928172	test-auc:0.791279 
[279]	train-auc:0.928713	test-auc:0.791286 
[280]	train-auc:0.929264	test-auc:0.791387 
[281]	train-auc:0.930392	test-auc:0.791597 
[282]	train-auc:0.930710	test-auc:0.791653 
[283]	train-auc:0.931719	test-auc:0.791555 
[284]	train-auc:0.931853	test-auc:0.791578 
[285]	train-auc:0.932196	test-auc:0.791699 
[286]	train-auc:0.932279	test-auc:0.791655 
[287]	train-auc:0.932494	test-auc:0.791646 
[288]	train-auc:0.933529	test-auc:0.791925 
[289]	train-auc:0.933669	test-auc:0.791887 
[290]	train-auc:0.934106	test-auc:0.792000 
[291]	train-auc:0.934188	test-auc:0.792078 
[292]	train-auc:0.934563	test-auc:0.792097 
[293]	train-auc:0.935492	test-auc:0.792190 
[294]	train-auc:0.935875	test-auc:0.792240 
[295]	train-auc:0.936726	test-auc:0.792131 
[296]	train-auc:0.936823	test-auc:0.792163 
[297]	train-auc:0.936948	test-auc:0.792197 
[298]	train-auc:0.937333	test-auc:0.792436 
[299]	train-auc:0.938022	test-auc:0.792503 
[300]	train-auc:0.938210	test-auc:0.792570 
[301]	train-auc:0.939092	test-auc:0.792582 
[302]	train-auc:0.939427	test-auc:0.792468 
[303]	train-auc:0.939902	test-auc:0.792511 
[304]	train-auc:0.940095	test-auc:0.792569 
[305]	train-auc:0.940439	test-auc:0.792647 
[306]	train-auc:0.940519	test-auc:0.792705 
[307]	train-auc:0.940876	test-auc:0.792862 
[308]	train-auc:0.941034	test-auc:0.792894 
[309]	train-auc:0.941336	test-auc:0.792863 
[310]	train-auc:0.941445	test-auc:0.792832 
[311]	train-auc:0.941632	test-auc:0.792848 
[312]	train-auc:0.941972	test-auc:0.792795 
[313]	train-auc:0.942427	test-auc:0.792863 
[314]	train-auc:0.942774	test-auc:0.792912 
[315]	train-auc:0.942991	test-auc:0.792870 
[316]	train-auc:0.943122	test-auc:0.792807 
[317]	train-auc:0.943374	test-auc:0.792839 
[318]	train-auc:0.943502	test-auc:0.792857 
[319]	train-auc:0.943653	test-auc:0.792833 
[320]	train-auc:0.943936	test-auc:0.792922 
[321]	train-auc:0.944086	test-auc:0.792876 
[322]	train-auc:0.944149	test-auc:0.792869 
[323]	train-auc:0.944256	test-auc:0.792954 
[324]	train-auc:0.944387	test-auc:0.792995 
[325]	train-auc:0.944584	test-auc:0.792993 
[326]	train-auc:0.944903	test-auc:0.793005 
[327]	train-auc:0.945202	test-auc:0.792942 
[328]	train-auc:0.945305	test-auc:0.792911 
[329]	train-auc:0.945775	test-auc:0.792960 
[330]	train-auc:0.946127	test-auc:0.793064 
[331]	train-auc:0.946333	test-auc:0.793024 
[332]	train-auc:0.946553	test-auc:0.792989 
[333]	train-auc:0.946839	test-auc:0.792969 
[334]	train-auc:0.946934	test-auc:0.792930 
[335]	train-auc:0.947127	test-auc:0.793096 
[336]	train-auc:0.947229	test-auc:0.793075 
[337]	train-auc:0.947501	test-auc:0.793073 
[338]	train-auc:0.947606	test-auc:0.793054 
[339]	train-auc:0.947883	test-auc:0.793116 
[340]	train-auc:0.948069	test-auc:0.793116 
[341]	train-auc:0.948349	test-auc:0.793052 
[342]	train-auc:0.948596	test-auc:0.793110 
[343]	train-auc:0.948686	test-auc:0.793124 
[344]	train-auc:0.948848	test-auc:0.793066 
[345]	train-auc:0.949143	test-auc:0.793176 
[346]	train-auc:0.949360	test-auc:0.793272 
[347]	train-auc:0.949547	test-auc:0.793282 
[348]	train-auc:0.949640	test-auc:0.793238 
[349]	train-auc:0.949713	test-auc:0.793337 
[350]	train-auc:0.949968	test-auc:0.793369 
[351]	train-auc:0.950218	test-auc:0.793232 
[352]	train-auc:0.950304	test-auc:0.793206 
[353]	train-auc:0.950565	test-auc:0.793244 
[354]	train-auc:0.950642	test-auc:0.793305 
[355]	train-auc:0.950821	test-auc:0.793349 
[356]	train-auc:0.950893	test-auc:0.793332 
[357]	train-auc:0.951122	test-auc:0.793366 
[358]	train-auc:0.951441	test-auc:0.793428 
[359]	train-auc:0.951689	test-auc:0.793456 
[360]	train-auc:0.951738	test-auc:0.793455 
[361]	train-auc:0.951794	test-auc:0.793555 
[362]	train-auc:0.951996	test-auc:0.793570 
[363]	train-auc:0.952061	test-auc:0.793599 
[364]	train-auc:0.952173	test-auc:0.793559 
[365]	train-auc:0.952336	test-auc:0.793492 
[366]	train-auc:0.952443	test-auc:0.793418 
[367]	train-auc:0.952613	test-auc:0.793488 
[368]	train-auc:0.952655	test-auc:0.793431 
[369]	train-auc:0.952771	test-auc:0.793402 
[370]	train-auc:0.952940	test-auc:0.793374 
[371]	train-auc:0.953236	test-auc:0.793429 
[372]	train-auc:0.953477	test-auc:0.793352 
[373]	train-auc:0.953677	test-auc:0.793314 
[374]	train-auc:0.953915	test-auc:0.793381 
[375]	train-auc:0.954093	test-auc:0.793425 
[376]	train-auc:0.954302	test-auc:0.793492 
[377]	train-auc:0.954438	test-auc:0.793460 
[378]	train-auc:0.954555	test-auc:0.793559 
[379]	train-auc:0.954797	test-auc:0.793552 
[380]	train-auc:0.954907	test-auc:0.793577 
[381]	train-auc:0.955145	test-auc:0.793556 
[382]	train-auc:0.955221	test-auc:0.793546 
[383]	train-auc:0.955336	test-auc:0.793564 
[384]	train-auc:0.955451	test-auc:0.793570 
[385]	train-auc:0.955520	test-auc:0.793595 
[386]	train-auc:0.955696	test-auc:0.793621 
[387]	train-auc:0.955741	test-auc:0.793534 
[388]	train-auc:0.955811	test-auc:0.793484 
[389]	train-auc:0.955896	test-auc:0.793450 
[390]	train-auc:0.956103	test-auc:0.793505 
[391]	train-auc:0.956171	test-auc:0.793539 
[392]	train-auc:0.956320	test-auc:0.793575 
[393]	train-auc:0.956374	test-auc:0.793492 
[394]	train-auc:0.956440	test-auc:0.793388 
[395]	train-auc:0.956483	test-auc:0.793306 
[396]	train-auc:0.956573	test-auc:0.793377 
[397]	train-auc:0.956636	test-auc:0.793368 
[398]	train-auc:0.956970	test-auc:0.793369 
[399]	train-auc:0.957074	test-auc:0.793305 
[400]	train-auc:0.957153	test-auc:0.793261 
[401]	train-auc:0.957214	test-auc:0.793216 
[402]	train-auc:0.957249	test-auc:0.793186 
[403]	train-auc:0.957319	test-auc:0.793077 
[404]	train-auc:0.957502	test-auc:0.793040 
[405]	train-auc:0.957641	test-auc:0.793085 
[406]	train-auc:0.957740	test-auc:0.793102 
[407]	train-auc:0.957766	test-auc:0.792976 
[408]	train-auc:0.957830	test-auc:0.792939 
[409]	train-auc:0.958077	test-auc:0.792956 
[410]	train-auc:0.958203	test-auc:0.792945 
[411]	train-auc:0.958336	test-auc:0.792979 
[412]	train-auc:0.958485	test-auc:0.793036 
[413]	train-auc:0.958506	test-auc:0.792997 
[414]	train-auc:0.958599	test-auc:0.793026 
[415]	train-auc:0.958683	test-auc:0.792997 
[416]	train-auc:0.958783	test-auc:0.793044 
[417]	train-auc:0.958832	test-auc:0.793023 
[418]	train-auc:0.958886	test-auc:0.793034 
[419]	train-auc:0.959045	test-auc:0.793108 
[420]	train-auc:0.959098	test-auc:0.793061 
[421]	train-auc:0.959290	test-auc:0.793038 
[422]	train-auc:0.959423	test-auc:0.793056 
[423]	train-auc:0.959500	test-auc:0.793061 
[424]	train-auc:0.959570	test-auc:0.793107 
[425]	train-auc:0.959668	test-auc:0.793037 
[426]	train-auc:0.959772	test-auc:0.792952 
[427]	train-auc:0.959808	test-auc:0.792967 
[428]	train-auc:0.959881	test-auc:0.793020 
[429]	train-auc:0.959974	test-auc:0.793059 
[430]	train-auc:0.960114	test-auc:0.793010 
[431]	train-auc:0.960165	test-auc:0.792994 
[432]	train-auc:0.960278	test-auc:0.792998 
[433]	train-auc:0.960316	test-auc:0.792996 
[434]	train-auc:0.960436	test-auc:0.792980 
[435]	train-auc:0.960678	test-auc:0.793052 
[436]	train-auc:0.960767	test-auc:0.793131 
[437]	train-auc:0.961002	test-auc:0.793120 
[438]	train-auc:0.961075	test-auc:0.793117 
[439]	train-auc:0.961138	test-auc:0.793188 
[440]	train-auc:0.961244	test-auc:0.793182 
[441]	train-auc:0.961353	test-auc:0.793190 
[442]	train-auc:0.961383	test-auc:0.793213 
[443]	train-auc:0.961407	test-auc:0.793169 
[444]	train-auc:0.961464	test-auc:0.793195 
[445]	train-auc:0.961560	test-auc:0.793175 
[446]	train-auc:0.961652	test-auc:0.793062 
[447]	train-auc:0.961689	test-auc:0.793123 
[448]	train-auc:0.961814	test-auc:0.793160 
[449]	train-auc:0.961847	test-auc:0.793175 
[450]	train-auc:0.961883	test-auc:0.793178 
[451]	train-auc:0.961938	test-auc:0.793152 
[452]	train-auc:0.962088	test-auc:0.793192 
[453]	train-auc:0.962107	test-auc:0.793108 
[454]	train-auc:0.962197	test-auc:0.793163 
[455]	train-auc:0.962301	test-auc:0.793244 
[456]	train-auc:0.962403	test-auc:0.793334 
[457]	train-auc:0.962560	test-auc:0.793411 
[458]	train-auc:0.962630	test-auc:0.793322 
[459]	train-auc:0.962764	test-auc:0.793272 
[460]	train-auc:0.962943	test-auc:0.793258 
[461]	train-auc:0.963017	test-auc:0.793281 
[462]	train-auc:0.963054	test-auc:0.793241 
[463]	train-auc:0.963121	test-auc:0.793268 
[464]	train-auc:0.963200	test-auc:0.793247 
[465]	train-auc:0.963308	test-auc:0.793381 
[466]	train-auc:0.963381	test-auc:0.793406 
[467]	train-auc:0.963464	test-auc:0.793369 
[468]	train-auc:0.963696	test-auc:0.793391 
[469]	train-auc:0.963762	test-auc:0.793359 
[470]	train-auc:0.963782	test-auc:0.793383 
[471]	train-auc:0.963869	test-auc:0.793380 
[472]	train-auc:0.963934	test-auc:0.793280 
[473]	train-auc:0.963988	test-auc:0.793311 
[474]	train-auc:0.964063	test-auc:0.793293 
[475]	train-auc:0.964353	test-auc:0.793233 
[476]	train-auc:0.964505	test-auc:0.793266 
[477]	train-auc:0.964982	test-auc:0.793264 
[478]	train-auc:0.965052	test-auc:0.793262 
[479]	train-auc:0.965081	test-auc:0.793290 
[480]	train-auc:0.965141	test-auc:0.793264 
[481]	train-auc:0.965243	test-auc:0.793194 
[482]	train-auc:0.965392	test-auc:0.793161 
[483]	train-auc:0.965584	test-auc:0.793146 
[484]	train-auc:0.965673	test-auc:0.793127 
[485]	train-auc:0.965770	test-auc:0.793120 
[486]	train-auc:0.965840	test-auc:0.793051 
Stopping. Best iteration:
[386]	train-auc:0.955696	test-auc:0.793621




Fold 3

[1]	train-auc:0.725973	test-auc:0.737116 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 100 rounds.

[2]	train-auc:0.726443	test-auc:0.737244 
[3]	train-auc:0.726431	test-auc:0.737259 
[4]	train-auc:0.726435	test-auc:0.737274 
[5]	train-auc:0.727822	test-auc:0.737901 
[6]	train-auc:0.728125	test-auc:0.737712 
[7]	train-auc:0.728136	test-auc:0.737698 
[8]	train-auc:0.728135	test-auc:0.737694 
[9]	train-auc:0.728898	test-auc:0.737819 
[10]	train-auc:0.728898	test-auc:0.737820 
[11]	train-auc:0.728899	test-auc:0.737818 
[12]	train-auc:0.728904	test-auc:0.737813 
[13]	train-auc:0.728905	test-auc:0.737812 
[14]	train-auc:0.728904	test-auc:0.737813 
[15]	train-auc:0.728978	test-auc:0.737821 
[16]	train-auc:0.728976	test-auc:0.737817 
[17]	train-auc:0.728988	test-auc:0.737814 
[18]	train-auc:0.728988	test-auc:0.737814 
[19]	train-auc:0.728990	test-auc:0.737815 
[20]	train-auc:0.728989	test-auc:0.737813 
[21]	train-auc:0.728991	test-auc:0.737807 
[22]	train-auc:0.728991	test-auc:0.737807 
[23]	train-auc:0.729162	test-auc:0.737560 
[24]	train-auc:0.729161	test-auc:0.737555 
[25]	train-auc:0.729176	test-auc:0.737555 
[26]	train-auc:0.729319	test-auc:0.737702 
[27]	train-auc:0.729318	test-auc:0.737701 
[28]	train-auc:0.729338	test-auc:0.737704 
[29]	train-auc:0.729347	test-auc:0.737701 
[30]	train-auc:0.729352	test-auc:0.737698 
[31]	train-auc:0.729354	test-auc:0.737698 
[32]	train-auc:0.729359	test-auc:0.737692 
[33]	train-auc:0.729369	test-auc:0.737690 
[34]	train-auc:0.729371	test-auc:0.737691 
[35]	train-auc:0.729365	test-auc:0.737653 
[36]	train-auc:0.729369	test-auc:0.737652 
[37]	train-auc:0.729389	test-auc:0.737653 
[38]	train-auc:0.729395	test-auc:0.737657 
[39]	train-auc:0.729418	test-auc:0.737639 
[40]	train-auc:0.729533	test-auc:0.737635 
[41]	train-auc:0.729537	test-auc:0.737621 
[42]	train-auc:0.729530	test-auc:0.737627 
[43]	train-auc:0.729544	test-auc:0.737627 
[44]	train-auc:0.729547	test-auc:0.737629 
[45]	train-auc:0.729565	test-auc:0.737639 
[46]	train-auc:0.729564	test-auc:0.737631 
[47]	train-auc:0.729568	test-auc:0.737629 
[48]	train-auc:0.729575	test-auc:0.737646 
[49]	train-auc:0.729946	test-auc:0.738017 
[50]	train-auc:0.730458	test-auc:0.738540 
[51]	train-auc:0.730466	test-auc:0.738559 
[52]	train-auc:0.730491	test-auc:0.738571 
[53]	train-auc:0.739635	test-auc:0.743716 
[54]	train-auc:0.739775	test-auc:0.743618 
[55]	train-auc:0.739966	test-auc:0.743614 
[56]	train-auc:0.747485	test-auc:0.748289 
[57]	train-auc:0.747640	test-auc:0.748294 
[58]	train-auc:0.747886	test-auc:0.747059 
[59]	train-auc:0.747937	test-auc:0.747054 
[60]	train-auc:0.747961	test-auc:0.747071 
[61]	train-auc:0.747975	test-auc:0.747077 
[62]	train-auc:0.748076	test-auc:0.747240 
[63]	train-auc:0.748048	test-auc:0.746868 
[64]	train-auc:0.748133	test-auc:0.746988 
[65]	train-auc:0.748239	test-auc:0.747035 
[66]	train-auc:0.748250	test-auc:0.747044 
[67]	train-auc:0.748330	test-auc:0.747043 
[68]	train-auc:0.753201	test-auc:0.749073 
[69]	train-auc:0.753331	test-auc:0.749094 
[70]	train-auc:0.753337	test-auc:0.749109 
[71]	train-auc:0.755018	test-auc:0.749538 
[72]	train-auc:0.755196	test-auc:0.749556 
[73]	train-auc:0.755305	test-auc:0.749934 
[74]	train-auc:0.756104	test-auc:0.750558 
[75]	train-auc:0.757218	test-auc:0.750448 
[76]	train-auc:0.757301	test-auc:0.750426 
[77]	train-auc:0.756892	test-auc:0.750828 
[78]	train-auc:0.757037	test-auc:0.750796 
[79]	train-auc:0.757432	test-auc:0.750842 
[80]	train-auc:0.758283	test-auc:0.751073 
[81]	train-auc:0.758451	test-auc:0.751038 
[82]	train-auc:0.758608	test-auc:0.751164 
[83]	train-auc:0.758631	test-auc:0.750947 
[84]	train-auc:0.758956	test-auc:0.751074 
[85]	train-auc:0.759218	test-auc:0.751241 
[86]	train-auc:0.759419	test-auc:0.751284 
[87]	train-auc:0.759556	test-auc:0.751313 
[88]	train-auc:0.759614	test-auc:0.751097 
[89]	train-auc:0.759693	test-auc:0.751336 
[90]	train-auc:0.759746	test-auc:0.751304 
[91]	train-auc:0.759765	test-auc:0.751298 
[92]	train-auc:0.761128	test-auc:0.751177 
[93]	train-auc:0.761351	test-auc:0.751184 
[94]	train-auc:0.761815	test-auc:0.751202 
[95]	train-auc:0.767398	test-auc:0.756726 
[96]	train-auc:0.767985	test-auc:0.757025 
[97]	train-auc:0.768124	test-auc:0.757121 
[98]	train-auc:0.768495	test-auc:0.757436 
[99]	train-auc:0.768816	test-auc:0.757797 
[100]	train-auc:0.770597	test-auc:0.757952 
[101]	train-auc:0.770972	test-auc:0.758443 
[102]	train-auc:0.771117	test-auc:0.758606 
[103]	train-auc:0.771439	test-auc:0.758664 
[104]	train-auc:0.772473	test-auc:0.759111 
[105]	train-auc:0.772653	test-auc:0.759628 
[106]	train-auc:0.772808	test-auc:0.759910 
[107]	train-auc:0.773044	test-auc:0.759988 
[108]	train-auc:0.774131	test-auc:0.760386 
[109]	train-auc:0.774771	test-auc:0.760275 
[110]	train-auc:0.776498	test-auc:0.760426 
[111]	train-auc:0.777599	test-auc:0.760508 
[112]	train-auc:0.779690	test-auc:0.760941 
[113]	train-auc:0.780421	test-auc:0.760944 
[114]	train-auc:0.780711	test-auc:0.761230 
[115]	train-auc:0.781416	test-auc:0.761475 
[116]	train-auc:0.782022	test-auc:0.761757 
[117]	train-auc:0.782442	test-auc:0.761628 
[118]	train-auc:0.782920	test-auc:0.761658 
[119]	train-auc:0.783301	test-auc:0.761514 
[120]	train-auc:0.785379	test-auc:0.762080 
[121]	train-auc:0.786026	test-auc:0.761954 
[122]	train-auc:0.786288	test-auc:0.761781 
[123]	train-auc:0.786601	test-auc:0.761409 
[124]	train-auc:0.786948	test-auc:0.761303 
[125]	train-auc:0.787428	test-auc:0.761369 
[126]	train-auc:0.787626	test-auc:0.761232 
[127]	train-auc:0.788643	test-auc:0.761392 
[128]	train-auc:0.789184	test-auc:0.761704 
[129]	train-auc:0.789446	test-auc:0.761692 
[130]	train-auc:0.791427	test-auc:0.761696 
[131]	train-auc:0.792341	test-auc:0.761868 
[132]	train-auc:0.793148	test-auc:0.762464 
[133]	train-auc:0.794208	test-auc:0.762746 
[134]	train-auc:0.795164	test-auc:0.763291 
[135]	train-auc:0.796310	test-auc:0.763439 
[136]	train-auc:0.797715	test-auc:0.763583 
[137]	train-auc:0.798183	test-auc:0.763738 
[138]	train-auc:0.798766	test-auc:0.763908 
[139]	train-auc:0.799286	test-auc:0.763876 
[140]	train-auc:0.800866	test-auc:0.764224 
[141]	train-auc:0.801520	test-auc:0.764160 
[142]	train-auc:0.802125	test-auc:0.764190 
[143]	train-auc:0.803710	test-auc:0.765377 
[144]	train-auc:0.804653	test-auc:0.765510 
[145]	train-auc:0.805549	test-auc:0.766484 
[146]	train-auc:0.805921	test-auc:0.766570 
[147]	train-auc:0.806747	test-auc:0.766670 
[148]	train-auc:0.807005	test-auc:0.766389 
[149]	train-auc:0.807842	test-auc:0.766514 
[150]	train-auc:0.808149	test-auc:0.766448 
[151]	train-auc:0.808625	test-auc:0.766478 
[152]	train-auc:0.809216	test-auc:0.766389 
[153]	train-auc:0.810164	test-auc:0.766409 
[154]	train-auc:0.810352	test-auc:0.766569 
[155]	train-auc:0.810876	test-auc:0.766994 
[156]	train-auc:0.811556	test-auc:0.767191 
[157]	train-auc:0.812079	test-auc:0.767174 
[158]	train-auc:0.813093	test-auc:0.767224 
[159]	train-auc:0.814186	test-auc:0.767342 
[160]	train-auc:0.815065	test-auc:0.767538 
[161]	train-auc:0.815790	test-auc:0.767346 
[162]	train-auc:0.817281	test-auc:0.767504 
[163]	train-auc:0.817803	test-auc:0.767179 
[164]	train-auc:0.818462	test-auc:0.767500 
[165]	train-auc:0.819559	test-auc:0.767115 
[166]	train-auc:0.821492	test-auc:0.768406 
[167]	train-auc:0.822162	test-auc:0.768189 
[168]	train-auc:0.822621	test-auc:0.768134 
[169]	train-auc:0.823801	test-auc:0.768236 
[170]	train-auc:0.824787	test-auc:0.767856 
[171]	train-auc:0.826245	test-auc:0.768348 
[172]	train-auc:0.826718	test-auc:0.768174 
[173]	train-auc:0.827583	test-auc:0.768379 
[174]	train-auc:0.828737	test-auc:0.768625 
[175]	train-auc:0.829644	test-auc:0.768622 
[176]	train-auc:0.830506	test-auc:0.768612 
[177]	train-auc:0.831036	test-auc:0.768620 
[178]	train-auc:0.831583	test-auc:0.768402 
[179]	train-auc:0.832310	test-auc:0.768170 
[180]	train-auc:0.832949	test-auc:0.768348 
[181]	train-auc:0.835987	test-auc:0.768759 
[182]	train-auc:0.838407	test-auc:0.769272 
[183]	train-auc:0.839983	test-auc:0.769950 
[184]	train-auc:0.841551	test-auc:0.770473 
[185]	train-auc:0.843178	test-auc:0.771008 
[186]	train-auc:0.845466	test-auc:0.771406 
[187]	train-auc:0.847064	test-auc:0.771632 
[188]	train-auc:0.848641	test-auc:0.771725 
[189]	train-auc:0.849854	test-auc:0.771681 
[190]	train-auc:0.851373	test-auc:0.771498 
[191]	train-auc:0.852896	test-auc:0.771235 
[192]	train-auc:0.853879	test-auc:0.771176 
[193]	train-auc:0.854938	test-auc:0.770872 
[194]	train-auc:0.856258	test-auc:0.770831 
[195]	train-auc:0.857522	test-auc:0.770549 
[196]	train-auc:0.858712	test-auc:0.771189 
[197]	train-auc:0.859842	test-auc:0.771276 
[198]	train-auc:0.860656	test-auc:0.771327 
[199]	train-auc:0.862892	test-auc:0.771809 
[200]	train-auc:0.864004	test-auc:0.771917 
[201]	train-auc:0.864949	test-auc:0.772185 
[202]	train-auc:0.866740	test-auc:0.772490 
[203]	train-auc:0.867613	test-auc:0.772599 
[204]	train-auc:0.869217	test-auc:0.772783 
[205]	train-auc:0.870484	test-auc:0.773374 
[206]	train-auc:0.871442	test-auc:0.773616 
[207]	train-auc:0.872337	test-auc:0.773715 
[208]	train-auc:0.873423	test-auc:0.774084 
[209]	train-auc:0.874398	test-auc:0.774190 
[210]	train-auc:0.874920	test-auc:0.774528 
[211]	train-auc:0.875275	test-auc:0.774567 
[212]	train-auc:0.875960	test-auc:0.774840 
[213]	train-auc:0.876611	test-auc:0.774991 
[214]	train-auc:0.877443	test-auc:0.775044 
[215]	train-auc:0.878207	test-auc:0.775290 
[216]	train-auc:0.879196	test-auc:0.775166 
[217]	train-auc:0.880363	test-auc:0.775501 
[218]	train-auc:0.881269	test-auc:0.775561 
[219]	train-auc:0.882081	test-auc:0.775676 
[220]	train-auc:0.882971	test-auc:0.775706 
[221]	train-auc:0.883735	test-auc:0.775917 
[222]	train-auc:0.884300	test-auc:0.775973 
[223]	train-auc:0.884926	test-auc:0.776509 
[224]	train-auc:0.885407	test-auc:0.776659 
[225]	train-auc:0.885826	test-auc:0.776713 
[226]	train-auc:0.886599	test-auc:0.776604 
[227]	train-auc:0.887186	test-auc:0.776765 
[228]	train-auc:0.888203	test-auc:0.777116 
[229]	train-auc:0.890111	test-auc:0.777378 
[230]	train-auc:0.890609	test-auc:0.777345 
[231]	train-auc:0.891530	test-auc:0.777581 
[232]	train-auc:0.892039	test-auc:0.777510 
[233]	train-auc:0.892577	test-auc:0.777405 
[234]	train-auc:0.893762	test-auc:0.777632 
[235]	train-auc:0.894335	test-auc:0.777799 
[236]	train-auc:0.894824	test-auc:0.777913 
[237]	train-auc:0.895279	test-auc:0.777848 
[238]	train-auc:0.896269	test-auc:0.778035 
[239]	train-auc:0.896802	test-auc:0.778032 
[240]	train-auc:0.897359	test-auc:0.777996 
[241]	train-auc:0.898204	test-auc:0.778026 
[242]	train-auc:0.898788	test-auc:0.778253 
[243]	train-auc:0.899654	test-auc:0.778389 
[244]	train-auc:0.900370	test-auc:0.778224 
[245]	train-auc:0.900875	test-auc:0.778491 
[246]	train-auc:0.901513	test-auc:0.778524 
[247]	train-auc:0.902198	test-auc:0.778483 
[248]	train-auc:0.903149	test-auc:0.778387 
[249]	train-auc:0.904466	test-auc:0.778479 
[250]	train-auc:0.905626	test-auc:0.778641 
[251]	train-auc:0.906292	test-auc:0.778779 
[252]	train-auc:0.907030	test-auc:0.778804 
[253]	train-auc:0.907721	test-auc:0.778946 
[254]	train-auc:0.908548	test-auc:0.778964 
[255]	train-auc:0.909189	test-auc:0.778999 
[256]	train-auc:0.910015	test-auc:0.779030 
[257]	train-auc:0.910645	test-auc:0.778974 
[258]	train-auc:0.911237	test-auc:0.779246 
[259]	train-auc:0.912024	test-auc:0.779132 
[260]	train-auc:0.912683	test-auc:0.779087 
[261]	train-auc:0.913452	test-auc:0.779232 
[262]	train-auc:0.914629	test-auc:0.779361 
[263]	train-auc:0.915199	test-auc:0.779585 
[264]	train-auc:0.916381	test-auc:0.779662 
[265]	train-auc:0.917818	test-auc:0.779900 
[266]	train-auc:0.918471	test-auc:0.779894 
[267]	train-auc:0.919335	test-auc:0.780190 
[268]	train-auc:0.920186	test-auc:0.780318 
[269]	train-auc:0.920931	test-auc:0.780417 
[270]	train-auc:0.921843	test-auc:0.780443 
[271]	train-auc:0.922772	test-auc:0.780467 
[272]	train-auc:0.923524	test-auc:0.780555 
[273]	train-auc:0.923726	test-auc:0.780628 
[274]	train-auc:0.924452	test-auc:0.780675 
[275]	train-auc:0.924974	test-auc:0.780777 
[276]	train-auc:0.925139	test-auc:0.780758 
[277]	train-auc:0.925893	test-auc:0.780759 
[278]	train-auc:0.926136	test-auc:0.780859 
[279]	train-auc:0.926416	test-auc:0.780916 
[280]	train-auc:0.927370	test-auc:0.780985 
[281]	train-auc:0.928112	test-auc:0.780825 
[282]	train-auc:0.928778	test-auc:0.780952 
[283]	train-auc:0.929014	test-auc:0.781016 
[284]	train-auc:0.929495	test-auc:0.781062 
[285]	train-auc:0.929800	test-auc:0.781111 
[286]	train-auc:0.930268	test-auc:0.781283 
[287]	train-auc:0.930593	test-auc:0.781269 
[288]	train-auc:0.931149	test-auc:0.781278 
[289]	train-auc:0.931416	test-auc:0.781362 
[290]	train-auc:0.931795	test-auc:0.781444 
[291]	train-auc:0.931988	test-auc:0.781481 
[292]	train-auc:0.932143	test-auc:0.781501 
[293]	train-auc:0.932333	test-auc:0.781414 
[294]	train-auc:0.932624	test-auc:0.781445 
[295]	train-auc:0.933424	test-auc:0.781551 
[296]	train-auc:0.933490	test-auc:0.781611 
[297]	train-auc:0.933809	test-auc:0.781638 
[298]	train-auc:0.934061	test-auc:0.781780 
[299]	train-auc:0.934518	test-auc:0.781847 
[300]	train-auc:0.934613	test-auc:0.781894 
[301]	train-auc:0.934940	test-auc:0.781771 
[302]	train-auc:0.935164	test-auc:0.781810 
[303]	train-auc:0.935308	test-auc:0.781859 
[304]	train-auc:0.935404	test-auc:0.781742 
[305]	train-auc:0.935615	test-auc:0.781739 
[306]	train-auc:0.935820	test-auc:0.781745 
[307]	train-auc:0.936014	test-auc:0.781775 
[308]	train-auc:0.936118	test-auc:0.781711 
[309]	train-auc:0.936262	test-auc:0.781674 
[310]	train-auc:0.936325	test-auc:0.781668 
[311]	train-auc:0.936348	test-auc:0.781578 
[312]	train-auc:0.936547	test-auc:0.781521 
[313]	train-auc:0.936795	test-auc:0.781571 
[314]	train-auc:0.936902	test-auc:0.781538 
[315]	train-auc:0.937058	test-auc:0.781515 
[316]	train-auc:0.937146	test-auc:0.781467 
[317]	train-auc:0.937231	test-auc:0.781475 
[318]	train-auc:0.937645	test-auc:0.781320 
[319]	train-auc:0.937816	test-auc:0.781283 
[320]	train-auc:0.937950	test-auc:0.781348 
[321]	train-auc:0.938187	test-auc:0.781287 
[322]	train-auc:0.938233	test-auc:0.781216 
[323]	train-auc:0.938348	test-auc:0.781203 
[324]	train-auc:0.938502	test-auc:0.781374 
[325]	train-auc:0.938696	test-auc:0.781389 
[326]	train-auc:0.938921	test-auc:0.781289 
[327]	train-auc:0.938992	test-auc:0.781230 
[328]	train-auc:0.939058	test-auc:0.781211 
[329]	train-auc:0.939121	test-auc:0.781125 
[330]	train-auc:0.939376	test-auc:0.781184 
[331]	train-auc:0.939642	test-auc:0.781231 
[332]	train-auc:0.939798	test-auc:0.781265 
[333]	train-auc:0.940273	test-auc:0.781170 
[334]	train-auc:0.940940	test-auc:0.781082 
[335]	train-auc:0.941113	test-auc:0.781075 
[336]	train-auc:0.941250	test-auc:0.781030 
[337]	train-auc:0.941613	test-auc:0.780960 
[338]	train-auc:0.941794	test-auc:0.780910 
[339]	train-auc:0.941939	test-auc:0.780920 
[340]	train-auc:0.942241	test-auc:0.780957 
[341]	train-auc:0.942292	test-auc:0.780962 
[342]	train-auc:0.942471	test-auc:0.780909 
[343]	train-auc:0.942728	test-auc:0.780930 
[344]	train-auc:0.943278	test-auc:0.780933 
[345]	train-auc:0.943614	test-auc:0.780917 
[346]	train-auc:0.943760	test-auc:0.780934 
[347]	train-auc:0.943912	test-auc:0.781012 
[348]	train-auc:0.944022	test-auc:0.781073 
[349]	train-auc:0.944047	test-auc:0.781082 
[350]	train-auc:0.944718	test-auc:0.780961 
[351]	train-auc:0.944860	test-auc:0.781011 
[352]	train-auc:0.944982	test-auc:0.781081 
[353]	train-auc:0.945270	test-auc:0.781115 
[354]	train-auc:0.945449	test-auc:0.781080 
[355]	train-auc:0.945583	test-auc:0.781042 
[356]	train-auc:0.945633	test-auc:0.780954 
[357]	train-auc:0.945704	test-auc:0.781003 
[358]	train-auc:0.945844	test-auc:0.781058 
[359]	train-auc:0.945953	test-auc:0.780973 
[360]	train-auc:0.946128	test-auc:0.781023 
[361]	train-auc:0.946236	test-auc:0.781046 
[362]	train-auc:0.946819	test-auc:0.781124 
[363]	train-auc:0.946871	test-auc:0.781118 
[364]	train-auc:0.947026	test-auc:0.781062 
[365]	train-auc:0.947410	test-auc:0.781065 
[366]	train-auc:0.947437	test-auc:0.781054 
[367]	train-auc:0.947633	test-auc:0.781026 
[368]	train-auc:0.947708	test-auc:0.781025 
[369]	train-auc:0.947817	test-auc:0.780991 
[370]	train-auc:0.948142	test-auc:0.781047 
[371]	train-auc:0.948229	test-auc:0.781091 
[372]	train-auc:0.948347	test-auc:0.781138 
[373]	train-auc:0.948751	test-auc:0.781038 
[374]	train-auc:0.948870	test-auc:0.780925 
[375]	train-auc:0.949051	test-auc:0.780896 
[376]	train-auc:0.949161	test-auc:0.781054 
[377]	train-auc:0.949554	test-auc:0.780995 
[378]	train-auc:0.949613	test-auc:0.781096 
[379]	train-auc:0.949970	test-auc:0.781073 
[380]	train-auc:0.950069	test-auc:0.781049 
[381]	train-auc:0.950142	test-auc:0.780991 
[382]	train-auc:0.950278	test-auc:0.780977 
[383]	train-auc:0.950323	test-auc:0.780998 
[384]	train-auc:0.950482	test-auc:0.781033 
[385]	train-auc:0.950542	test-auc:0.780954 
[386]	train-auc:0.950550	test-auc:0.780989 
[387]	train-auc:0.950601	test-auc:0.781040 
[388]	train-auc:0.950623	test-auc:0.781064 
[389]	train-auc:0.950841	test-auc:0.780976 
[390]	train-auc:0.951095	test-auc:0.781057 
[391]	train-auc:0.951378	test-auc:0.781131 
[392]	train-auc:0.951545	test-auc:0.781183 
[393]	train-auc:0.951588	test-auc:0.781209 
[394]	train-auc:0.951654	test-auc:0.781223 
[395]	train-auc:0.951664	test-auc:0.781165 
[396]	train-auc:0.951878	test-auc:0.781193 
[397]	train-auc:0.951949	test-auc:0.781231 
[398]	train-auc:0.952128	test-auc:0.781244 
[399]	train-auc:0.952435	test-auc:0.781163 
[400]	train-auc:0.952579	test-auc:0.781238 
Stopping. Best iteration:
[300]	train-auc:0.934613	test-auc:0.781894




Fold 4

[1]	train-auc:0.730435	test-auc:0.719013 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 100 rounds.

[2]	train-auc:0.730204	test-auc:0.719229 
[3]	train-auc:0.733154	test-auc:0.721234 
[4]	train-auc:0.733153	test-auc:0.721234 
[5]	train-auc:0.733153	test-auc:0.721233 
[6]	train-auc:0.733656	test-auc:0.721653 
[7]	train-auc:0.733990	test-auc:0.721981 
[8]	train-auc:0.733991	test-auc:0.721981 
[9]	train-auc:0.734003	test-auc:0.721978 
[10]	train-auc:0.734649	test-auc:0.721687 
[11]	train-auc:0.734829	test-auc:0.721046 
[12]	train-auc:0.734826	test-auc:0.721042 
[13]	train-auc:0.734928	test-auc:0.721153 
[14]	train-auc:0.734930	test-auc:0.721152 
[15]	train-auc:0.735192	test-auc:0.720991 
[16]	train-auc:0.735560	test-auc:0.720948 
[17]	train-auc:0.735563	test-auc:0.720949 
[18]	train-auc:0.735564	test-auc:0.720950 
[19]	train-auc:0.735662	test-auc:0.720948 
[20]	train-auc:0.735668	test-auc:0.720942 
[21]	train-auc:0.735685	test-auc:0.720961 
[22]	train-auc:0.735687	test-auc:0.720961 
[23]	train-auc:0.735745	test-auc:0.721139 
[24]	train-auc:0.735750	test-auc:0.721207 
[25]	train-auc:0.735759	test-auc:0.721191 
[26]	train-auc:0.735794	test-auc:0.721187 
[27]	train-auc:0.735951	test-auc:0.721199 
[28]	train-auc:0.735985	test-auc:0.721236 
[29]	train-auc:0.736024	test-auc:0.721226 
[30]	train-auc:0.736046	test-auc:0.721207 
[31]	train-auc:0.736025	test-auc:0.721187 
[32]	train-auc:0.736025	test-auc:0.721184 
[33]	train-auc:0.736077	test-auc:0.721178 
[34]	train-auc:0.736093	test-auc:0.721174 
[35]	train-auc:0.736110	test-auc:0.721154 
[36]	train-auc:0.736113	test-auc:0.721154 
[37]	train-auc:0.736115	test-auc:0.721175 
[38]	train-auc:0.736135	test-auc:0.721175 
[39]	train-auc:0.736155	test-auc:0.721176 
[40]	train-auc:0.736376	test-auc:0.721371 
[41]	train-auc:0.736379	test-auc:0.721389 
[42]	train-auc:0.736563	test-auc:0.721526 
[43]	train-auc:0.736604	test-auc:0.721546 
[44]	train-auc:0.736755	test-auc:0.721547 
[45]	train-auc:0.737193	test-auc:0.723059 
[46]	train-auc:0.737485	test-auc:0.723143 
[47]	train-auc:0.746289	test-auc:0.729888 
[48]	train-auc:0.746540	test-auc:0.730190 
[49]	train-auc:0.746548	test-auc:0.730189 
[50]	train-auc:0.746562	test-auc:0.730187 
[51]	train-auc:0.746571	test-auc:0.730205 
[52]	train-auc:0.752213	test-auc:0.734804 
[53]	train-auc:0.752228	test-auc:0.734803 
[54]	train-auc:0.752498	test-auc:0.734818 
[55]	train-auc:0.752496	test-auc:0.734823 
[56]	train-auc:0.752763	test-auc:0.734794 
[57]	train-auc:0.752786	test-auc:0.734781 
[58]	train-auc:0.752824	test-auc:0.734789 
[59]	train-auc:0.753031	test-auc:0.734779 
[60]	train-auc:0.753023	test-auc:0.734775 
[61]	train-auc:0.753211	test-auc:0.734416 
[62]	train-auc:0.753511	test-auc:0.734381 
[63]	train-auc:0.753534	test-auc:0.734394 
[64]	train-auc:0.753525	test-auc:0.734421 
[65]	train-auc:0.757914	test-auc:0.740244 
[66]	train-auc:0.757968	test-auc:0.740261 
[67]	train-auc:0.758105	test-auc:0.740283 
[68]	train-auc:0.758393	test-auc:0.740786 
[69]	train-auc:0.758532	test-auc:0.740798 
[70]	train-auc:0.758577	test-auc:0.740792 
[71]	train-auc:0.758589	test-auc:0.740800 
[72]	train-auc:0.758761	test-auc:0.740832 
[73]	train-auc:0.758904	test-auc:0.740733 
[74]	train-auc:0.758962	test-auc:0.740691 
[75]	train-auc:0.758999	test-auc:0.740691 
[76]	train-auc:0.759131	test-auc:0.740675 
[77]	train-auc:0.760261	test-auc:0.740937 
[78]	train-auc:0.760779	test-auc:0.740891 
[79]	train-auc:0.760902	test-auc:0.740844 
[80]	train-auc:0.760940	test-auc:0.740778 
[81]	train-auc:0.761174	test-auc:0.740782 
[82]	train-auc:0.761263	test-auc:0.740755 
[83]	train-auc:0.763865	test-auc:0.742519 
[84]	train-auc:0.764376	test-auc:0.743464 
[85]	train-auc:0.765433	test-auc:0.743653 
[86]	train-auc:0.769266	test-auc:0.746586 
[87]	train-auc:0.769370	test-auc:0.746935 
[88]	train-auc:0.769882	test-auc:0.746912 
[89]	train-auc:0.770357	test-auc:0.747444 
[90]	train-auc:0.771200	test-auc:0.747462 
[91]	train-auc:0.771488	test-auc:0.747717 
[92]	train-auc:0.771954	test-auc:0.747888 
[93]	train-auc:0.772302	test-auc:0.748009 
[94]	train-auc:0.772839	test-auc:0.748889 
[95]	train-auc:0.774430	test-auc:0.749565 
[96]	train-auc:0.774960	test-auc:0.749967 
[97]	train-auc:0.774962	test-auc:0.749424 
[98]	train-auc:0.776044	test-auc:0.750041 
[99]	train-auc:0.776553	test-auc:0.750006 
[100]	train-auc:0.777955	test-auc:0.749793 
[101]	train-auc:0.778176	test-auc:0.749791 
[102]	train-auc:0.778342	test-auc:0.750155 
[103]	train-auc:0.778414	test-auc:0.750517 
[104]	train-auc:0.778892	test-auc:0.750754 
[105]	train-auc:0.778849	test-auc:0.750643 
[106]	train-auc:0.779893	test-auc:0.750791 
[107]	train-auc:0.780844	test-auc:0.751374 
[108]	train-auc:0.781703	test-auc:0.752147 
[109]	train-auc:0.782180	test-auc:0.752521 
[110]	train-auc:0.782559	test-auc:0.752764 
[111]	train-auc:0.783319	test-auc:0.753656 
[112]	train-auc:0.783691	test-auc:0.753655 
[113]	train-auc:0.783897	test-auc:0.753934 
[114]	train-auc:0.784825	test-auc:0.754800 
[115]	train-auc:0.785185	test-auc:0.754713 
[116]	train-auc:0.785289	test-auc:0.754560 
[117]	train-auc:0.786032	test-auc:0.754886 
[118]	train-auc:0.786675	test-auc:0.755423 
[119]	train-auc:0.786951	test-auc:0.755468 
[120]	train-auc:0.787220	test-auc:0.755588 
[121]	train-auc:0.788954	test-auc:0.755388 
[122]	train-auc:0.789959	test-auc:0.755333 
[123]	train-auc:0.790587	test-auc:0.755887 
[124]	train-auc:0.791157	test-auc:0.756812 
[125]	train-auc:0.791515	test-auc:0.756651 
[126]	train-auc:0.791797	test-auc:0.756943 
[127]	train-auc:0.792204	test-auc:0.757482 
[128]	train-auc:0.792445	test-auc:0.757693 
[129]	train-auc:0.793314	test-auc:0.758059 
[130]	train-auc:0.794808	test-auc:0.759945 
[131]	train-auc:0.795111	test-auc:0.759895 
[132]	train-auc:0.797296	test-auc:0.760766 
[133]	train-auc:0.798536	test-auc:0.760917 
[134]	train-auc:0.799519	test-auc:0.761164 
[135]	train-auc:0.799891	test-auc:0.761190 
[136]	train-auc:0.800241	test-auc:0.761132 
[137]	train-auc:0.800868	test-auc:0.761263 
[138]	train-auc:0.801444	test-auc:0.761027 
[139]	train-auc:0.802170	test-auc:0.760933 
[140]	train-auc:0.803143	test-auc:0.760826 
[141]	train-auc:0.803741	test-auc:0.760789 
[142]	train-auc:0.804644	test-auc:0.760603 
[143]	train-auc:0.805519	test-auc:0.760574 
[144]	train-auc:0.806352	test-auc:0.760387 
[145]	train-auc:0.806953	test-auc:0.760036 
[146]	train-auc:0.807624	test-auc:0.760391 
[147]	train-auc:0.809057	test-auc:0.760513 
[148]	train-auc:0.810002	test-auc:0.760787 
[149]	train-auc:0.811128	test-auc:0.760898 
[150]	train-auc:0.811906	test-auc:0.761341 
[151]	train-auc:0.812537	test-auc:0.761025 
[152]	train-auc:0.812888	test-auc:0.760982 
[153]	train-auc:0.813362	test-auc:0.761144 
[154]	train-auc:0.813790	test-auc:0.761199 
[155]	train-auc:0.814263	test-auc:0.761055 
[156]	train-auc:0.816243	test-auc:0.762100 
[157]	train-auc:0.816518	test-auc:0.762176 
[158]	train-auc:0.816973	test-auc:0.762165 
[159]	train-auc:0.818051	test-auc:0.762373 
[160]	train-auc:0.818242	test-auc:0.762383 
[161]	train-auc:0.818935	test-auc:0.762404 
[162]	train-auc:0.819530	test-auc:0.762437 
[163]	train-auc:0.820873	test-auc:0.763616 
[164]	train-auc:0.821491	test-auc:0.763671 
[165]	train-auc:0.823282	test-auc:0.764592 
[166]	train-auc:0.823582	test-auc:0.764834 
[167]	train-auc:0.824122	test-auc:0.764941 
[168]	train-auc:0.825446	test-auc:0.765241 
[169]	train-auc:0.826810	test-auc:0.765664 
[170]	train-auc:0.827664	test-auc:0.766059 
[171]	train-auc:0.829389	test-auc:0.766126 
[172]	train-auc:0.830940	test-auc:0.766395 
[173]	train-auc:0.832134	test-auc:0.766358 
[174]	train-auc:0.833060	test-auc:0.766496 
[175]	train-auc:0.835355	test-auc:0.766957 
[176]	train-auc:0.836395	test-auc:0.766866 
[177]	train-auc:0.836962	test-auc:0.766744 
[178]	train-auc:0.838351	test-auc:0.766756 
[179]	train-auc:0.838893	test-auc:0.766971 
[180]	train-auc:0.840674	test-auc:0.767558 
[181]	train-auc:0.841201	test-auc:0.767275 
[182]	train-auc:0.841962	test-auc:0.767213 
[183]	train-auc:0.843442	test-auc:0.767368 
[184]	train-auc:0.844157	test-auc:0.767376 
[185]	train-auc:0.844850	test-auc:0.767451 
[186]	train-auc:0.846532	test-auc:0.767899 
[187]	train-auc:0.847367	test-auc:0.767897 
[188]	train-auc:0.848637	test-auc:0.768777 
[189]	train-auc:0.849849	test-auc:0.769060 
[190]	train-auc:0.850655	test-auc:0.769221 
[191]	train-auc:0.852449	test-auc:0.770092 
[192]	train-auc:0.853485	test-auc:0.770459 
[193]	train-auc:0.854719	test-auc:0.770976 
[194]	train-auc:0.856285	test-auc:0.771343 
[195]	train-auc:0.857603	test-auc:0.771661 
[196]	train-auc:0.858621	test-auc:0.771766 
[197]	train-auc:0.859975	test-auc:0.772250 
[198]	train-auc:0.861523	test-auc:0.772301 
[199]	train-auc:0.862537	test-auc:0.772745 
[200]	train-auc:0.863511	test-auc:0.772913 
[201]	train-auc:0.864619	test-auc:0.773388 
[202]	train-auc:0.865915	test-auc:0.773703 
[203]	train-auc:0.867051	test-auc:0.773930 
[204]	train-auc:0.868013	test-auc:0.774503 
[205]	train-auc:0.869525	test-auc:0.774767 
[206]	train-auc:0.871060	test-auc:0.775116 
[207]	train-auc:0.872352	test-auc:0.775160 
[208]	train-auc:0.873699	test-auc:0.775533 
[209]	train-auc:0.874695	test-auc:0.775812 
[210]	train-auc:0.875539	test-auc:0.775753 
[211]	train-auc:0.876855	test-auc:0.775820 
[212]	train-auc:0.878770	test-auc:0.776030 
[213]	train-auc:0.880056	test-auc:0.776137 
[214]	train-auc:0.881129	test-auc:0.776080 
[215]	train-auc:0.882077	test-auc:0.775913 
[216]	train-auc:0.883223	test-auc:0.775348 
[217]	train-auc:0.884916	test-auc:0.775456 
[218]	train-auc:0.885822	test-auc:0.775009 
[219]	train-auc:0.887122	test-auc:0.775028 
[220]	train-auc:0.888373	test-auc:0.774948 
[221]	train-auc:0.889330	test-auc:0.774892 
[222]	train-auc:0.890717	test-auc:0.774828 
[223]	train-auc:0.891495	test-auc:0.774886 
[224]	train-auc:0.892357	test-auc:0.775266 
[225]	train-auc:0.893364	test-auc:0.775291 
[226]	train-auc:0.894595	test-auc:0.775525 
[227]	train-auc:0.895282	test-auc:0.775475 
[228]	train-auc:0.896132	test-auc:0.775384 
[229]	train-auc:0.897097	test-auc:0.775500 
[230]	train-auc:0.897871	test-auc:0.775794 
[231]	train-auc:0.898799	test-auc:0.775684 
[232]	train-auc:0.899730	test-auc:0.775690 
[233]	train-auc:0.901111	test-auc:0.775944 
[234]	train-auc:0.901658	test-auc:0.776053 
[235]	train-auc:0.902532	test-auc:0.775928 
[236]	train-auc:0.903840	test-auc:0.776088 
[237]	train-auc:0.904702	test-auc:0.776234 
[238]	train-auc:0.905670	test-auc:0.776241 
[239]	train-auc:0.906557	test-auc:0.776448 
[240]	train-auc:0.907388	test-auc:0.776364 
[241]	train-auc:0.908369	test-auc:0.776193 
[242]	train-auc:0.909007	test-auc:0.776347 
[243]	train-auc:0.910102	test-auc:0.775912 
[244]	train-auc:0.910862	test-auc:0.775859 
[245]	train-auc:0.911711	test-auc:0.775846 
[246]	train-auc:0.912640	test-auc:0.776145 
[247]	train-auc:0.913240	test-auc:0.776153 
[248]	train-auc:0.914011	test-auc:0.776167 
[249]	train-auc:0.914713	test-auc:0.776221 
[250]	train-auc:0.915629	test-auc:0.776193 
[251]	train-auc:0.916041	test-auc:0.776140 
[252]	train-auc:0.916509	test-auc:0.776108 
[253]	train-auc:0.917392	test-auc:0.776159 
[254]	train-auc:0.917867	test-auc:0.776302 
[255]	train-auc:0.918432	test-auc:0.776400 
[256]	train-auc:0.919065	test-auc:0.776469 
[257]	train-auc:0.919690	test-auc:0.776315 
[258]	train-auc:0.920064	test-auc:0.776524 
[259]	train-auc:0.920829	test-auc:0.776552 
[260]	train-auc:0.921363	test-auc:0.776717 
[261]	train-auc:0.921969	test-auc:0.776815 
[262]	train-auc:0.922431	test-auc:0.776704 
[263]	train-auc:0.923164	test-auc:0.776655 
[264]	train-auc:0.923636	test-auc:0.776723 
[265]	train-auc:0.924454	test-auc:0.776861 
[266]	train-auc:0.924798	test-auc:0.776947 
[267]	train-auc:0.925491	test-auc:0.776848 
[268]	train-auc:0.925753	test-auc:0.776919 
[269]	train-auc:0.926183	test-auc:0.777023 
[270]	train-auc:0.926574	test-auc:0.776968 
[271]	train-auc:0.927103	test-auc:0.777068 
[272]	train-auc:0.927981	test-auc:0.777075 
[273]	train-auc:0.928313	test-auc:0.777196 
[274]	train-auc:0.929078	test-auc:0.777466 
[275]	train-auc:0.929914	test-auc:0.777332 
[276]	train-auc:0.930280	test-auc:0.777518 
[277]	train-auc:0.930652	test-auc:0.777681 
[278]	train-auc:0.930940	test-auc:0.777579 
[279]	train-auc:0.931392	test-auc:0.777519 
[280]	train-auc:0.931857	test-auc:0.777554 
[281]	train-auc:0.932451	test-auc:0.777561 
[282]	train-auc:0.933385	test-auc:0.777579 
[283]	train-auc:0.933754	test-auc:0.777733 
[284]	train-auc:0.934186	test-auc:0.777703 
[285]	train-auc:0.934408	test-auc:0.777691 
[286]	train-auc:0.934871	test-auc:0.777665 
[287]	train-auc:0.935375	test-auc:0.777686 
[288]	train-auc:0.935930	test-auc:0.778225 
[289]	train-auc:0.936430	test-auc:0.778349 
[290]	train-auc:0.936694	test-auc:0.778357 
[291]	train-auc:0.937270	test-auc:0.778313 
[292]	train-auc:0.937523	test-auc:0.778345 
[293]	train-auc:0.937704	test-auc:0.778288 
[294]	train-auc:0.939000	test-auc:0.778284 
[295]	train-auc:0.939343	test-auc:0.778191 
[296]	train-auc:0.939978	test-auc:0.778416 
[297]	train-auc:0.940191	test-auc:0.778478 
[298]	train-auc:0.940542	test-auc:0.778568 
[299]	train-auc:0.941279	test-auc:0.778511 
[300]	train-auc:0.941740	test-auc:0.778521 
[301]	train-auc:0.941946	test-auc:0.778485 
[302]	train-auc:0.942437	test-auc:0.778745 
[303]	train-auc:0.942625	test-auc:0.778928 
[304]	train-auc:0.943171	test-auc:0.779134 
[305]	train-auc:0.943626	test-auc:0.779392 
[306]	train-auc:0.943863	test-auc:0.779439 
[307]	train-auc:0.944454	test-auc:0.779462 
[308]	train-auc:0.944645	test-auc:0.779409 
[309]	train-auc:0.944942	test-auc:0.779604 
[310]	train-auc:0.945456	test-auc:0.779591 
[311]	train-auc:0.945590	test-auc:0.779718 
[312]	train-auc:0.945839	test-auc:0.779938 
[313]	train-auc:0.946577	test-auc:0.780063 
[314]	train-auc:0.946754	test-auc:0.780065 
[315]	train-auc:0.946840	test-auc:0.780051 
[316]	train-auc:0.947100	test-auc:0.780133 
[317]	train-auc:0.947296	test-auc:0.780101 
[318]	train-auc:0.947676	test-auc:0.780170 
[319]	train-auc:0.947812	test-auc:0.780156 
[320]	train-auc:0.947867	test-auc:0.780082 
[321]	train-auc:0.948048	test-auc:0.780320 
[322]	train-auc:0.948228	test-auc:0.780387 
[323]	train-auc:0.948393	test-auc:0.780424 
[324]	train-auc:0.948681	test-auc:0.780446 
[325]	train-auc:0.949035	test-auc:0.780414 
[326]	train-auc:0.949561	test-auc:0.780350 
[327]	train-auc:0.949646	test-auc:0.780310 
[328]	train-auc:0.949695	test-auc:0.780267 
[329]	train-auc:0.950083	test-auc:0.780288 
[330]	train-auc:0.950179	test-auc:0.780154 
[331]	train-auc:0.950430	test-auc:0.780263 
[332]	train-auc:0.950613	test-auc:0.780263 
[333]	train-auc:0.950925	test-auc:0.780165 
[334]	train-auc:0.951190	test-auc:0.780255 
[335]	train-auc:0.951198	test-auc:0.780281 
[336]	train-auc:0.951375	test-auc:0.780288 
[337]	train-auc:0.951509	test-auc:0.780333 
[338]	train-auc:0.951628	test-auc:0.780345 
[339]	train-auc:0.952085	test-auc:0.780282 
[340]	train-auc:0.952278	test-auc:0.780273 
[341]	train-auc:0.952410	test-auc:0.780418 
[342]	train-auc:0.952596	test-auc:0.780494 
[343]	train-auc:0.952702	test-auc:0.780506 
[344]	train-auc:0.953064	test-auc:0.780547 
[345]	train-auc:0.953128	test-auc:0.780516 
[346]	train-auc:0.953419	test-auc:0.780589 
[347]	train-auc:0.953785	test-auc:0.780449 
[348]	train-auc:0.954098	test-auc:0.780412 
[349]	train-auc:0.954296	test-auc:0.780391 
[350]	train-auc:0.954466	test-auc:0.780526 
[351]	train-auc:0.954551	test-auc:0.780528 
[352]	train-auc:0.954594	test-auc:0.780486 
[353]	train-auc:0.954991	test-auc:0.780504 
[354]	train-auc:0.955130	test-auc:0.780527 
[355]	train-auc:0.955249	test-auc:0.780582 
[356]	train-auc:0.955778	test-auc:0.780613 
[357]	train-auc:0.955894	test-auc:0.780763 
[358]	train-auc:0.956256	test-auc:0.780708 
[359]	train-auc:0.956357	test-auc:0.780795 
[360]	train-auc:0.956382	test-auc:0.780762 
[361]	train-auc:0.956510	test-auc:0.780783 
[362]	train-auc:0.956655	test-auc:0.780723 
[363]	train-auc:0.956787	test-auc:0.780821 
[364]	train-auc:0.956860	test-auc:0.780757 
[365]	train-auc:0.956985	test-auc:0.780828 
[366]	train-auc:0.957116	test-auc:0.780907 
[367]	train-auc:0.957181	test-auc:0.780900 
[368]	train-auc:0.957470	test-auc:0.780841 
[369]	train-auc:0.957541	test-auc:0.780756 
[370]	train-auc:0.957622	test-auc:0.780847 
[371]	train-auc:0.957688	test-auc:0.780932 
[372]	train-auc:0.957770	test-auc:0.780939 
[373]	train-auc:0.958018	test-auc:0.780879 
[374]	train-auc:0.958076	test-auc:0.780961 
[375]	train-auc:0.958293	test-auc:0.780987 
[376]	train-auc:0.958436	test-auc:0.780961 
[377]	train-auc:0.958579	test-auc:0.780951 
[378]	train-auc:0.958669	test-auc:0.781003 
[379]	train-auc:0.958722	test-auc:0.781004 
[380]	train-auc:0.958802	test-auc:0.781044 
[381]	train-auc:0.958914	test-auc:0.781017 
[382]	train-auc:0.958966	test-auc:0.781057 
[383]	train-auc:0.959065	test-auc:0.781051 
[384]	train-auc:0.959122	test-auc:0.781004 
[385]	train-auc:0.959186	test-auc:0.780989 
[386]	train-auc:0.959326	test-auc:0.781081 
[387]	train-auc:0.959422	test-auc:0.781135 
[388]	train-auc:0.959542	test-auc:0.781015 
[389]	train-auc:0.959704	test-auc:0.781053 
[390]	train-auc:0.959879	test-auc:0.781083 
[391]	train-auc:0.959904	test-auc:0.781058 
[392]	train-auc:0.959984	test-auc:0.781132 
[393]	train-auc:0.960044	test-auc:0.781165 
[394]	train-auc:0.960078	test-auc:0.781194 
[395]	train-auc:0.960370	test-auc:0.781007 
[396]	train-auc:0.960630	test-auc:0.781037 
[397]	train-auc:0.960885	test-auc:0.780985 
[398]	train-auc:0.961076	test-auc:0.781054 
[399]	train-auc:0.961133	test-auc:0.781036 
[400]	train-auc:0.961197	test-auc:0.780981 
[401]	train-auc:0.961417	test-auc:0.781025 
[402]	train-auc:0.961460	test-auc:0.780978 
[403]	train-auc:0.961477	test-auc:0.780963 
[404]	train-auc:0.961690	test-auc:0.780973 
[405]	train-auc:0.961759	test-auc:0.780950 
[406]	train-auc:0.961816	test-auc:0.780903 
[407]	train-auc:0.961885	test-auc:0.780943 
[408]	train-auc:0.962012	test-auc:0.780995 
[409]	train-auc:0.962213	test-auc:0.780997 
[410]	train-auc:0.962401	test-auc:0.781028 
[411]	train-auc:0.962500	test-auc:0.781168 
[412]	train-auc:0.962713	test-auc:0.781168 
[413]	train-auc:0.962784	test-auc:0.781189 
[414]	train-auc:0.962844	test-auc:0.781214 
[415]	train-auc:0.963054	test-auc:0.781292 
[416]	train-auc:0.963274	test-auc:0.781372 
[417]	train-auc:0.963609	test-auc:0.781350 
[418]	train-auc:0.963635	test-auc:0.781403 
[419]	train-auc:0.963691	test-auc:0.781459 
[420]	train-auc:0.963803	test-auc:0.781548 
[421]	train-auc:0.963874	test-auc:0.781633 
[422]	train-auc:0.963930	test-auc:0.781573 
[423]	train-auc:0.964010	test-auc:0.781536 
[424]	train-auc:0.964188	test-auc:0.781553 
[425]	train-auc:0.964250	test-auc:0.781512 
[426]	train-auc:0.964388	test-auc:0.781594 
[427]	train-auc:0.964465	test-auc:0.781607 
[428]	train-auc:0.964520	test-auc:0.781652 
[429]	train-auc:0.964564	test-auc:0.781684 
[430]	train-auc:0.964701	test-auc:0.781773 
[431]	train-auc:0.964885	test-auc:0.781748 
[432]	train-auc:0.964931	test-auc:0.781797 
[433]	train-auc:0.965153	test-auc:0.781741 
[434]	train-auc:0.965250	test-auc:0.781729 
[435]	train-auc:0.965285	test-auc:0.781777 
[436]	train-auc:0.965387	test-auc:0.781749 
[437]	train-auc:0.965507	test-auc:0.781783 
[438]	train-auc:0.965808	test-auc:0.781895 
[439]	train-auc:0.965934	test-auc:0.781787 
[440]	train-auc:0.965972	test-auc:0.781786 
[441]	train-auc:0.966094	test-auc:0.781768 
[442]	train-auc:0.966129	test-auc:0.781763 
[443]	train-auc:0.966272	test-auc:0.781869 
[444]	train-auc:0.966304	test-auc:0.781946 
[445]	train-auc:0.966478	test-auc:0.781818 
[446]	train-auc:0.966684	test-auc:0.781899 
[447]	train-auc:0.966715	test-auc:0.781848 
[448]	train-auc:0.967006	test-auc:0.781935 
[449]	train-auc:0.967075	test-auc:0.781976 
[450]	train-auc:0.967128	test-auc:0.781936 
[451]	train-auc:0.967193	test-auc:0.781959 
[452]	train-auc:0.967308	test-auc:0.781987 
[453]	train-auc:0.967393	test-auc:0.782040 
[454]	train-auc:0.967401	test-auc:0.781986 
[455]	train-auc:0.967506	test-auc:0.782109 
[456]	train-auc:0.967561	test-auc:0.782126 
[457]	train-auc:0.967649	test-auc:0.782215 
[458]	train-auc:0.967677	test-auc:0.782168 
[459]	train-auc:0.967718	test-auc:0.782131 
[460]	train-auc:0.967768	test-auc:0.782099 
[461]	train-auc:0.967952	test-auc:0.782010 
[462]	train-auc:0.967980	test-auc:0.782058 
[463]	train-auc:0.968083	test-auc:0.782130 
[464]	train-auc:0.968099	test-auc:0.782111 
[465]	train-auc:0.968258	test-auc:0.782022 
[466]	train-auc:0.968278	test-auc:0.782037 
[467]	train-auc:0.968437	test-auc:0.782006 
[468]	train-auc:0.968545	test-auc:0.782007 
[469]	train-auc:0.968838	test-auc:0.782179 
[470]	train-auc:0.969060	test-auc:0.782395 
[471]	train-auc:0.969444	test-auc:0.782396 
[472]	train-auc:0.969632	test-auc:0.782519 
[473]	train-auc:0.969888	test-auc:0.782593 
[474]	train-auc:0.970091	test-auc:0.782531 
[475]	train-auc:0.970232	test-auc:0.782667 
[476]	train-auc:0.970260	test-auc:0.782604 
[477]	train-auc:0.970383	test-auc:0.782580 
[478]	train-auc:0.970421	test-auc:0.782578 
[479]	train-auc:0.970631	test-auc:0.782577 
[480]	train-auc:0.970868	test-auc:0.782615 
[481]	train-auc:0.970913	test-auc:0.782664 
[482]	train-auc:0.970983	test-auc:0.782642 
[483]	train-auc:0.971142	test-auc:0.782645 
[484]	train-auc:0.971210	test-auc:0.782651 
[485]	train-auc:0.971305	test-auc:0.782633 
[486]	train-auc:0.971368	test-auc:0.782634 
[487]	train-auc:0.971392	test-auc:0.782574 
[488]	train-auc:0.971446	test-auc:0.782587 
[489]	train-auc:0.971463	test-auc:0.782535 
[490]	train-auc:0.971513	test-auc:0.782644 
[491]	train-auc:0.971563	test-auc:0.782646 
[492]	train-auc:0.971623	test-auc:0.782654 
[493]	train-auc:0.971670	test-auc:0.782668 
[494]	train-auc:0.971691	test-auc:0.782574 
[495]	train-auc:0.971734	test-auc:0.782577 
[496]	train-auc:0.971755	test-auc:0.782628 
[497]	train-auc:0.971821	test-auc:0.782629 
[498]	train-auc:0.971945	test-auc:0.782636 
[499]	train-auc:0.972007	test-auc:0.782601 
[500]	train-auc:0.972109	test-auc:0.782564 
[501]	train-auc:0.972160	test-auc:0.782500 
[502]	train-auc:0.972194	test-auc:0.782557 
[503]	train-auc:0.972249	test-auc:0.782605 
[504]	train-auc:0.972418	test-auc:0.782637 
[505]	train-auc:0.972589	test-auc:0.782696 
[506]	train-auc:0.972640	test-auc:0.782739 
[507]	train-auc:0.972721	test-auc:0.782736 
[508]	train-auc:0.972770	test-auc:0.782891 
[509]	train-auc:0.972796	test-auc:0.782892 
[510]	train-auc:0.972841	test-auc:0.782881 
[511]	train-auc:0.972858	test-auc:0.782920 
[512]	train-auc:0.972876	test-auc:0.782866 
[513]	train-auc:0.972906	test-auc:0.782860 
[514]	train-auc:0.973031	test-auc:0.782873 
[515]	train-auc:0.973041	test-auc:0.782863 
[516]	train-auc:0.973121	test-auc:0.782830 
[517]	train-auc:0.973165	test-auc:0.782897 
[518]	train-auc:0.973183	test-auc:0.782919 
[519]	train-auc:0.973245	test-auc:0.782890 
[520]	train-auc:0.973311	test-auc:0.782922 
[521]	train-auc:0.973368	test-auc:0.782898 
[522]	train-auc:0.973431	test-auc:0.782895 
[523]	train-auc:0.973628	test-auc:0.782940 
[524]	train-auc:0.973659	test-auc:0.782930 
[525]	train-auc:0.973700	test-auc:0.782920 
[526]	train-auc:0.973792	test-auc:0.782880 
[527]	train-auc:0.973818	test-auc:0.782855 
[528]	train-auc:0.973840	test-auc:0.782839 
[529]	train-auc:0.973857	test-auc:0.782823 
[530]	train-auc:0.973922	test-auc:0.782775 
[531]	train-auc:0.973941	test-auc:0.782782 
[532]	train-auc:0.973978	test-auc:0.782757 
[533]	train-auc:0.974010	test-auc:0.782788 
[534]	train-auc:0.974051	test-auc:0.782699 
[535]	train-auc:0.974105	test-auc:0.782823 
[536]	train-auc:0.974118	test-auc:0.782803 
[537]	train-auc:0.974125	test-auc:0.782786 
[538]	train-auc:0.974144	test-auc:0.782728 
[539]	train-auc:0.974160	test-auc:0.782669 
[540]	train-auc:0.974203	test-auc:0.782663 
[541]	train-auc:0.974264	test-auc:0.782625 
[542]	train-auc:0.974285	test-auc:0.782615 
[543]	train-auc:0.974337	test-auc:0.782558 
[544]	train-auc:0.974511	test-auc:0.782586 
[545]	train-auc:0.974526	test-auc:0.782575 
[546]	train-auc:0.974537	test-auc:0.782655 
[547]	train-auc:0.974551	test-auc:0.782714 
[548]	train-auc:0.974585	test-auc:0.782645 
[549]	train-auc:0.974597	test-auc:0.782693 
[550]	train-auc:0.974609	test-auc:0.782719 
[551]	train-auc:0.974630	test-auc:0.782694 
[552]	train-auc:0.974726	test-auc:0.782628 
[553]	train-auc:0.974782	test-auc:0.782753 
[554]	train-auc:0.974797	test-auc:0.782780 
[555]	train-auc:0.974910	test-auc:0.782784 
[556]	train-auc:0.974953	test-auc:0.782821 
[557]	train-auc:0.974998	test-auc:0.782808 
[558]	train-auc:0.975031	test-auc:0.782800 
[559]	train-auc:0.975082	test-auc:0.782858 
[560]	train-auc:0.975097	test-auc:0.782898 
[561]	train-auc:0.975299	test-auc:0.782813 
[562]	train-auc:0.975395	test-auc:0.782734 
[563]	train-auc:0.975428	test-auc:0.782684 
[564]	train-auc:0.975492	test-auc:0.782739 
[565]	train-auc:0.975501	test-auc:0.782693 
[566]	train-auc:0.975524	test-auc:0.782625 
[567]	train-auc:0.975534	test-auc:0.782584 
[568]	train-auc:0.975541	test-auc:0.782605 
[569]	train-auc:0.975590	test-auc:0.782651 
[570]	train-auc:0.975606	test-auc:0.782661 
[571]	train-auc:0.975657	test-auc:0.782693 
[572]	train-auc:0.975707	test-auc:0.782733 
[573]	train-auc:0.975769	test-auc:0.782718 
[574]	train-auc:0.975776	test-auc:0.782674 
[575]	train-auc:0.975857	test-auc:0.782575 
[576]	train-auc:0.975867	test-auc:0.782552 
[577]	train-auc:0.975910	test-auc:0.782561 
[578]	train-auc:0.975919	test-auc:0.782525 
[579]	train-auc:0.975927	test-auc:0.782561 
[580]	train-auc:0.975989	test-auc:0.782553 
[581]	train-auc:0.976120	test-auc:0.782555 
[582]	train-auc:0.976175	test-auc:0.782570 
[583]	train-auc:0.976279	test-auc:0.782626 
[584]	train-auc:0.976356	test-auc:0.782537 
[585]	train-auc:0.976377	test-auc:0.782576 
[586]	train-auc:0.976403	test-auc:0.782614 
[587]	train-auc:0.976443	test-auc:0.782664 
[588]	train-auc:0.976497	test-auc:0.782654 
[589]	train-auc:0.976593	test-auc:0.782642 
[590]	train-auc:0.976744	test-auc:0.782622 
[591]	train-auc:0.976799	test-auc:0.782622 
[592]	train-auc:0.976806	test-auc:0.782552 
[593]	train-auc:0.976842	test-auc:0.782556 
[594]	train-auc:0.976996	test-auc:0.782515 
[595]	train-auc:0.977001	test-auc:0.782573 
[596]	train-auc:0.977022	test-auc:0.782588 
[597]	train-auc:0.977085	test-auc:0.782511 
[598]	train-auc:0.977101	test-auc:0.782527 
[599]	train-auc:0.977136	test-auc:0.782478 
[600]	train-auc:0.977215	test-auc:0.782447 
[601]	train-auc:0.977227	test-auc:0.782391 
[602]	train-auc:0.977243	test-auc:0.782376 
[603]	train-auc:0.977459	test-auc:0.782417 
[604]	train-auc:0.977471	test-auc:0.782408 
[605]	train-auc:0.977521	test-auc:0.782319 
[606]	train-auc:0.977547	test-auc:0.782210 
[607]	train-auc:0.977686	test-auc:0.782195 
[608]	train-auc:0.977694	test-auc:0.782209 
[609]	train-auc:0.977789	test-auc:0.782156 
[610]	train-auc:0.977862	test-auc:0.782137 
[611]	train-auc:0.977911	test-auc:0.782174 
[612]	train-auc:0.977934	test-auc:0.782254 
[613]	train-auc:0.977974	test-auc:0.782218 
[614]	train-auc:0.977990	test-auc:0.782239 
[615]	train-auc:0.978011	test-auc:0.782269 
[616]	train-auc:0.978073	test-auc:0.782274 
[617]	train-auc:0.978205	test-auc:0.782170 
[618]	train-auc:0.978222	test-auc:0.782178 
[619]	train-auc:0.978240	test-auc:0.782124 
[620]	train-auc:0.978276	test-auc:0.782124 
[621]	train-auc:0.978283	test-auc:0.782069 
[622]	train-auc:0.978298	test-auc:0.782078 
[623]	train-auc:0.978323	test-auc:0.782083 
Stopping. Best iteration:
[523]	train-auc:0.973628	test-auc:0.782940




Fold 5

[1]	train-auc:0.728837	test-auc:0.719234 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 100 rounds.

[2]	train-auc:0.729229	test-auc:0.719018 
[3]	train-auc:0.729224	test-auc:0.719017 
[4]	train-auc:0.729985	test-auc:0.719701 
[5]	train-auc:0.730008	test-auc:0.719719 
[6]	train-auc:0.730023	test-auc:0.719708 
[7]	train-auc:0.730026	test-auc:0.719701 
[8]	train-auc:0.730027	test-auc:0.719701 
[9]	train-auc:0.730033	test-auc:0.719706 
[10]	train-auc:0.730034	test-auc:0.719706 
[11]	train-auc:0.730044	test-auc:0.719718 
[12]	train-auc:0.730213	test-auc:0.720122 
[13]	train-auc:0.731328	test-auc:0.720744 
[14]	train-auc:0.731330	test-auc:0.720747 
[15]	train-auc:0.731681	test-auc:0.720728 
[16]	train-auc:0.731719	test-auc:0.720719 
[17]	train-auc:0.732080	test-auc:0.721320 
[18]	train-auc:0.732726	test-auc:0.721484 
[19]	train-auc:0.732777	test-auc:0.721529 
[20]	train-auc:0.732816	test-auc:0.721563 
[21]	train-auc:0.732921	test-auc:0.721557 
[22]	train-auc:0.732923	test-auc:0.721558 
[23]	train-auc:0.733754	test-auc:0.722026 
[24]	train-auc:0.733759	test-auc:0.722026 
[25]	train-auc:0.733810	test-auc:0.722037 
[26]	train-auc:0.734214	test-auc:0.722140 
[27]	train-auc:0.734334	test-auc:0.722133 
[28]	train-auc:0.734353	test-auc:0.722138 
[29]	train-auc:0.734379	test-auc:0.722145 
[30]	train-auc:0.734422	test-auc:0.722139 
[31]	train-auc:0.734431	test-auc:0.722131 
[32]	train-auc:0.734483	test-auc:0.722129 
[33]	train-auc:0.734487	test-auc:0.722129 
[34]	train-auc:0.734495	test-auc:0.722127 
[35]	train-auc:0.734546	test-auc:0.722157 
[36]	train-auc:0.734570	test-auc:0.722170 
[37]	train-auc:0.734575	test-auc:0.722162 
[38]	train-auc:0.734675	test-auc:0.722568 
[39]	train-auc:0.734780	test-auc:0.722564 
[40]	train-auc:0.734809	test-auc:0.722593 
[41]	train-auc:0.734833	test-auc:0.722591 
[42]	train-auc:0.734858	test-auc:0.722574 
[43]	train-auc:0.734875	test-auc:0.722577 
[44]	train-auc:0.734911	test-auc:0.722601 
[45]	train-auc:0.734948	test-auc:0.722636 
[46]	train-auc:0.734970	test-auc:0.722646 
[47]	train-auc:0.734966	test-auc:0.722633 
[48]	train-auc:0.735005	test-auc:0.722651 
[49]	train-auc:0.735048	test-auc:0.722685 
[50]	train-auc:0.735054	test-auc:0.722684 
[51]	train-auc:0.735037	test-auc:0.722671 
[52]	train-auc:0.735077	test-auc:0.722685 
[53]	train-auc:0.735219	test-auc:0.722681 
[54]	train-auc:0.735358	test-auc:0.722663 
[55]	train-auc:0.735496	test-auc:0.722660 
[56]	train-auc:0.735677	test-auc:0.722573 
[57]	train-auc:0.735750	test-auc:0.722592 
[58]	train-auc:0.735769	test-auc:0.722584 
[59]	train-auc:0.735832	test-auc:0.722583 
[60]	train-auc:0.735991	test-auc:0.722849 
[61]	train-auc:0.736002	test-auc:0.722834 
[62]	train-auc:0.744533	test-auc:0.731357 
[63]	train-auc:0.744553	test-auc:0.731376 
[64]	train-auc:0.744562	test-auc:0.731384 
[65]	train-auc:0.744700	test-auc:0.731368 
[66]	train-auc:0.744727	test-auc:0.731381 
[67]	train-auc:0.744938	test-auc:0.731428 
[68]	train-auc:0.744955	test-auc:0.731767 
[69]	train-auc:0.744950	test-auc:0.731755 
[70]	train-auc:0.744979	test-auc:0.731755 
[71]	train-auc:0.753906	test-auc:0.741180 
[72]	train-auc:0.753919	test-auc:0.741183 
[73]	train-auc:0.754531	test-auc:0.741605 
[74]	train-auc:0.754589	test-auc:0.741601 
[75]	train-auc:0.758116	test-auc:0.744281 
[76]	train-auc:0.758347	test-auc:0.744266 
[77]	train-auc:0.758720	test-auc:0.744264 
[78]	train-auc:0.758767	test-auc:0.744262 
[79]	train-auc:0.758814	test-auc:0.744269 
[80]	train-auc:0.759122	test-auc:0.744213 
[81]	train-auc:0.759504	test-auc:0.744220 
[82]	train-auc:0.760185	test-auc:0.744529 
[83]	train-auc:0.760462	test-auc:0.744486 
[84]	train-auc:0.760727	test-auc:0.744444 
[85]	train-auc:0.760836	test-auc:0.744473 
[86]	train-auc:0.760933	test-auc:0.744460 
[87]	train-auc:0.761566	test-auc:0.744478 
[88]	train-auc:0.763096	test-auc:0.746681 
[89]	train-auc:0.767201	test-auc:0.750327 
[90]	train-auc:0.767483	test-auc:0.750381 
[91]	train-auc:0.767764	test-auc:0.750484 
[92]	train-auc:0.768092	test-auc:0.750545 
[93]	train-auc:0.768119	test-auc:0.750519 
[94]	train-auc:0.768914	test-auc:0.750798 
[95]	train-auc:0.769370	test-auc:0.751176 
[96]	train-auc:0.771546	test-auc:0.752489 
[97]	train-auc:0.773877	test-auc:0.752478 
[98]	train-auc:0.775281	test-auc:0.752899 
[99]	train-auc:0.776524	test-auc:0.753211 
[100]	train-auc:0.776774	test-auc:0.753372 
[101]	train-auc:0.777226	test-auc:0.753450 
[102]	train-auc:0.777831	test-auc:0.754486 
[103]	train-auc:0.778434	test-auc:0.754670 
[104]	train-auc:0.778990	test-auc:0.755001 
[105]	train-auc:0.779793	test-auc:0.754898 
[106]	train-auc:0.780413	test-auc:0.755162 
[107]	train-auc:0.780683	test-auc:0.755276 
[108]	train-auc:0.780872	test-auc:0.755749 
[109]	train-auc:0.781568	test-auc:0.755700 
[110]	train-auc:0.782058	test-auc:0.755703 
[111]	train-auc:0.782524	test-auc:0.755835 
[112]	train-auc:0.782593	test-auc:0.755587 
[113]	train-auc:0.782959	test-auc:0.755369 
[114]	train-auc:0.783547	test-auc:0.754721 
[115]	train-auc:0.784828	test-auc:0.755793 
[116]	train-auc:0.785092	test-auc:0.755448 
[117]	train-auc:0.785787	test-auc:0.755074 
[118]	train-auc:0.785863	test-auc:0.754822 
[119]	train-auc:0.786344	test-auc:0.754679 
[120]	train-auc:0.787921	test-auc:0.755674 
[121]	train-auc:0.789297	test-auc:0.755822 
[122]	train-auc:0.789755	test-auc:0.756128 
[123]	train-auc:0.790208	test-auc:0.756034 
[124]	train-auc:0.790536	test-auc:0.755871 
[125]	train-auc:0.792288	test-auc:0.756926 
[126]	train-auc:0.792805	test-auc:0.757095 
[127]	train-auc:0.793552	test-auc:0.757313 
[128]	train-auc:0.793704	test-auc:0.757341 
[129]	train-auc:0.794422	test-auc:0.758786 
[130]	train-auc:0.794772	test-auc:0.758090 
[131]	train-auc:0.795177	test-auc:0.758532 
[132]	train-auc:0.795815	test-auc:0.758768 
[133]	train-auc:0.796404	test-auc:0.758971 
[134]	train-auc:0.796491	test-auc:0.758637 
[135]	train-auc:0.797011	test-auc:0.758654 
[136]	train-auc:0.797501	test-auc:0.758544 
[137]	train-auc:0.798000	test-auc:0.758491 
[138]	train-auc:0.798438	test-auc:0.758340 
[139]	train-auc:0.799695	test-auc:0.758800 
[140]	train-auc:0.800366	test-auc:0.758842 
[141]	train-auc:0.802071	test-auc:0.759457 
[142]	train-auc:0.803768	test-auc:0.759498 
[143]	train-auc:0.804592	test-auc:0.759680 
[144]	train-auc:0.805583	test-auc:0.760481 
[145]	train-auc:0.807480	test-auc:0.761295 
[146]	train-auc:0.808880	test-auc:0.761390 
[147]	train-auc:0.810041	test-auc:0.761507 
[148]	train-auc:0.811024	test-auc:0.761532 
[149]	train-auc:0.811318	test-auc:0.761260 
[150]	train-auc:0.812319	test-auc:0.761211 
[151]	train-auc:0.812633	test-auc:0.761172 
[152]	train-auc:0.812802	test-auc:0.761360 
[153]	train-auc:0.813221	test-auc:0.761242 
[154]	train-auc:0.813541	test-auc:0.761303 
[155]	train-auc:0.816317	test-auc:0.762122 
[156]	train-auc:0.818067	test-auc:0.762799 
[157]	train-auc:0.818587	test-auc:0.762940 
[158]	train-auc:0.819601	test-auc:0.762593 
[159]	train-auc:0.820460	test-auc:0.762507 
[160]	train-auc:0.820899	test-auc:0.762807 
[161]	train-auc:0.822299	test-auc:0.763177 
[162]	train-auc:0.823178	test-auc:0.763516 
[163]	train-auc:0.823851	test-auc:0.763725 
[164]	train-auc:0.824501	test-auc:0.764240 
[165]	train-auc:0.825319	test-auc:0.764484 
[166]	train-auc:0.826193	test-auc:0.764794 
[167]	train-auc:0.827323	test-auc:0.764999 
[168]	train-auc:0.828969	test-auc:0.765141 
[169]	train-auc:0.830234	test-auc:0.765277 
[170]	train-auc:0.831107	test-auc:0.765252 
[171]	train-auc:0.832371	test-auc:0.765157 
[172]	train-auc:0.832838	test-auc:0.764665 
[173]	train-auc:0.834453	test-auc:0.764916 
[174]	train-auc:0.835038	test-auc:0.765064 
[175]	train-auc:0.836103	test-auc:0.765451 
[176]	train-auc:0.836573	test-auc:0.765428 
[177]	train-auc:0.837844	test-auc:0.765311 
[178]	train-auc:0.838389	test-auc:0.765335 
[179]	train-auc:0.839827	test-auc:0.765559 
[180]	train-auc:0.840846	test-auc:0.765486 
[181]	train-auc:0.841810	test-auc:0.765607 
[182]	train-auc:0.842770	test-auc:0.765399 
[183]	train-auc:0.843567	test-auc:0.765651 
[184]	train-auc:0.845031	test-auc:0.765908 
[185]	train-auc:0.846115	test-auc:0.765638 
[186]	train-auc:0.847079	test-auc:0.765326 
[187]	train-auc:0.847898	test-auc:0.765128 
[188]	train-auc:0.848478	test-auc:0.765070 
[189]	train-auc:0.851098	test-auc:0.765605 
[190]	train-auc:0.851987	test-auc:0.765338 
[191]	train-auc:0.853090	test-auc:0.765739 
[192]	train-auc:0.853778	test-auc:0.765603 
[193]	train-auc:0.855319	test-auc:0.766141 
[194]	train-auc:0.855952	test-auc:0.765931 
[195]	train-auc:0.856632	test-auc:0.765949 
[196]	train-auc:0.858025	test-auc:0.766556 
[197]	train-auc:0.858724	test-auc:0.766833 
[198]	train-auc:0.859440	test-auc:0.766986 
[199]	train-auc:0.860699	test-auc:0.767448 
[200]	train-auc:0.861571	test-auc:0.767272 
[201]	train-auc:0.863088	test-auc:0.767351 
[202]	train-auc:0.864440	test-auc:0.767711 
[203]	train-auc:0.865983	test-auc:0.767998 
[204]	train-auc:0.867108	test-auc:0.768139 
[205]	train-auc:0.868190	test-auc:0.767965 
[206]	train-auc:0.869604	test-auc:0.768553 
[207]	train-auc:0.870991	test-auc:0.768876 
[208]	train-auc:0.872215	test-auc:0.769053 
[209]	train-auc:0.873531	test-auc:0.769274 
[210]	train-auc:0.874384	test-auc:0.769337 
[211]	train-auc:0.875440	test-auc:0.769679 
[212]	train-auc:0.876733	test-auc:0.770106 
[213]	train-auc:0.877768	test-auc:0.770241 
[214]	train-auc:0.879944	test-auc:0.770556 
[215]	train-auc:0.881408	test-auc:0.770868 
[216]	train-auc:0.881931	test-auc:0.771133 
[217]	train-auc:0.882977	test-auc:0.771326 
[218]	train-auc:0.884954	test-auc:0.771588 
[219]	train-auc:0.885907	test-auc:0.771556 
[220]	train-auc:0.886850	test-auc:0.771806 
[221]	train-auc:0.888334	test-auc:0.771906 
[222]	train-auc:0.888826	test-auc:0.771874 
[223]	train-auc:0.889749	test-auc:0.772319 
[224]	train-auc:0.891377	test-auc:0.772274 
[225]	train-auc:0.892158	test-auc:0.772317 
[226]	train-auc:0.893289	test-auc:0.772356 
[227]	train-auc:0.894195	test-auc:0.772363 
[228]	train-auc:0.894633	test-auc:0.772388 
[229]	train-auc:0.895168	test-auc:0.772370 
[230]	train-auc:0.896340	test-auc:0.772360 
[231]	train-auc:0.896651	test-auc:0.772464 
[232]	train-auc:0.897791	test-auc:0.772657 
[233]	train-auc:0.898562	test-auc:0.772780 
[234]	train-auc:0.899826	test-auc:0.773043 
[235]	train-auc:0.900455	test-auc:0.773151 
[236]	train-auc:0.901444	test-auc:0.773286 
[237]	train-auc:0.902178	test-auc:0.773081 
[238]	train-auc:0.902927	test-auc:0.773186 
[239]	train-auc:0.904331	test-auc:0.773255 
[240]	train-auc:0.905101	test-auc:0.773204 
[241]	train-auc:0.906010	test-auc:0.773430 
[242]	train-auc:0.907510	test-auc:0.773637 
[243]	train-auc:0.908382	test-auc:0.773758 
[244]	train-auc:0.908820	test-auc:0.773700 
[245]	train-auc:0.909593	test-auc:0.773769 
[246]	train-auc:0.910609	test-auc:0.773796 
[247]	train-auc:0.911109	test-auc:0.773768 
[248]	train-auc:0.911991	test-auc:0.773924 
[249]	train-auc:0.912933	test-auc:0.773904 
[250]	train-auc:0.914353	test-auc:0.773955 
[251]	train-auc:0.914833	test-auc:0.773926 
[252]	train-auc:0.915560	test-auc:0.773923 
[253]	train-auc:0.916515	test-auc:0.774187 
[254]	train-auc:0.917404	test-auc:0.773811 
[255]	train-auc:0.917870	test-auc:0.773946 
[256]	train-auc:0.918318	test-auc:0.774130 
[257]	train-auc:0.918951	test-auc:0.774163 
[258]	train-auc:0.919535	test-auc:0.774118 
[259]	train-auc:0.920361	test-auc:0.773936 
[260]	train-auc:0.921050	test-auc:0.774116 
[261]	train-auc:0.921679	test-auc:0.774085 
[262]	train-auc:0.922232	test-auc:0.774185 
[263]	train-auc:0.922681	test-auc:0.774228 
[264]	train-auc:0.922902	test-auc:0.774193 
[265]	train-auc:0.923523	test-auc:0.774265 
[266]	train-auc:0.924217	test-auc:0.774389 
[267]	train-auc:0.924827	test-auc:0.774235 
[268]	train-auc:0.925626	test-auc:0.774423 
[269]	train-auc:0.925832	test-auc:0.774441 
[270]	train-auc:0.926108	test-auc:0.774487 
[271]	train-auc:0.926489	test-auc:0.774338 
[272]	train-auc:0.927057	test-auc:0.774195 
[273]	train-auc:0.927636	test-auc:0.774263 
[274]	train-auc:0.927831	test-auc:0.774210 
[275]	train-auc:0.928094	test-auc:0.774202 
[276]	train-auc:0.928243	test-auc:0.774032 
[277]	train-auc:0.928581	test-auc:0.773943 
[278]	train-auc:0.928723	test-auc:0.773879 
[279]	train-auc:0.929009	test-auc:0.773879 
[280]	train-auc:0.929604	test-auc:0.774004 
[281]	train-auc:0.929719	test-auc:0.774004 
[282]	train-auc:0.929813	test-auc:0.774019 
[283]	train-auc:0.929886	test-auc:0.773981 
[284]	train-auc:0.930207	test-auc:0.773881 
[285]	train-auc:0.930256	test-auc:0.773795 
[286]	train-auc:0.930366	test-auc:0.773733 
[287]	train-auc:0.931015	test-auc:0.773715 
[288]	train-auc:0.931305	test-auc:0.773754 
[289]	train-auc:0.931421	test-auc:0.773685 
[290]	train-auc:0.931589	test-auc:0.773602 
[291]	train-auc:0.932883	test-auc:0.773633 
[292]	train-auc:0.932996	test-auc:0.773550 
[293]	train-auc:0.933110	test-auc:0.773471 
[294]	train-auc:0.933581	test-auc:0.773370 
[295]	train-auc:0.933700	test-auc:0.773315 
[296]	train-auc:0.935073	test-auc:0.773321 
[297]	train-auc:0.935192	test-auc:0.773315 
[298]	train-auc:0.935384	test-auc:0.773352 
[299]	train-auc:0.935697	test-auc:0.773349 
[300]	train-auc:0.935916	test-auc:0.773298 
[301]	train-auc:0.936748	test-auc:0.773241 
[302]	train-auc:0.936971	test-auc:0.773244 
[303]	train-auc:0.937837	test-auc:0.773328 
[304]	train-auc:0.938746	test-auc:0.773219 
[305]	train-auc:0.939300	test-auc:0.773092 
[306]	train-auc:0.939626	test-auc:0.773150 
[307]	train-auc:0.939965	test-auc:0.773132 
[308]	train-auc:0.940660	test-auc:0.773157 
[309]	train-auc:0.940824	test-auc:0.772995 
[310]	train-auc:0.940893	test-auc:0.772973 
[311]	train-auc:0.941542	test-auc:0.772910 
[312]	train-auc:0.941894	test-auc:0.772884 
[313]	train-auc:0.942206	test-auc:0.772754 
[314]	train-auc:0.942499	test-auc:0.772704 
[315]	train-auc:0.942957	test-auc:0.772786 
[316]	train-auc:0.943221	test-auc:0.772726 
[317]	train-auc:0.943432	test-auc:0.772687 
[318]	train-auc:0.943844	test-auc:0.772744 
[319]	train-auc:0.943982	test-auc:0.772784 
[320]	train-auc:0.944046	test-auc:0.772707 
[321]	train-auc:0.944316	test-auc:0.772794 
[322]	train-auc:0.944617	test-auc:0.772985 
[323]	train-auc:0.944714	test-auc:0.772881 
[324]	train-auc:0.944947	test-auc:0.772970 
[325]	train-auc:0.944984	test-auc:0.772915 
[326]	train-auc:0.945428	test-auc:0.772932 
[327]	train-auc:0.945518	test-auc:0.772760 
[328]	train-auc:0.945682	test-auc:0.772839 
[329]	train-auc:0.946600	test-auc:0.773146 
[330]	train-auc:0.946799	test-auc:0.773005 
[331]	train-auc:0.947070	test-auc:0.772921 
[332]	train-auc:0.947289	test-auc:0.773002 
[333]	train-auc:0.947509	test-auc:0.773025 
[334]	train-auc:0.947635	test-auc:0.773145 
[335]	train-auc:0.948012	test-auc:0.773181 
[336]	train-auc:0.948283	test-auc:0.773165 
[337]	train-auc:0.948384	test-auc:0.773228 
[338]	train-auc:0.948469	test-auc:0.773255 
[339]	train-auc:0.948546	test-auc:0.773190 
[340]	train-auc:0.948731	test-auc:0.773264 
[341]	train-auc:0.949151	test-auc:0.773244 
[342]	train-auc:0.949292	test-auc:0.773240 
[343]	train-auc:0.949446	test-auc:0.773270 
[344]	train-auc:0.949556	test-auc:0.773233 
[345]	train-auc:0.949896	test-auc:0.773211 
[346]	train-auc:0.949969	test-auc:0.773287 
[347]	train-auc:0.950128	test-auc:0.773465 
[348]	train-auc:0.950243	test-auc:0.773465 
[349]	train-auc:0.950459	test-auc:0.773437 
[350]	train-auc:0.950864	test-auc:0.773311 
[351]	train-auc:0.951067	test-auc:0.773424 
[352]	train-auc:0.951210	test-auc:0.773405 
[353]	train-auc:0.951302	test-auc:0.773409 
[354]	train-auc:0.951581	test-auc:0.773430 
[355]	train-auc:0.951909	test-auc:0.773413 
[356]	train-auc:0.951987	test-auc:0.773451 
[357]	train-auc:0.952041	test-auc:0.773441 
[358]	train-auc:0.952289	test-auc:0.773474 
[359]	train-auc:0.952377	test-auc:0.773446 
[360]	train-auc:0.952518	test-auc:0.773446 
[361]	train-auc:0.952607	test-auc:0.773460 
[362]	train-auc:0.952955	test-auc:0.773449 
[363]	train-auc:0.953078	test-auc:0.773496 
[364]	train-auc:0.953134	test-auc:0.773485 
[365]	train-auc:0.953234	test-auc:0.773434 
[366]	train-auc:0.953382	test-auc:0.773344 
[367]	train-auc:0.953440	test-auc:0.773344 
[368]	train-auc:0.953541	test-auc:0.773344 
[369]	train-auc:0.953623	test-auc:0.773371 
[370]	train-auc:0.953747	test-auc:0.773399 
Stopping. Best iteration:
[270]	train-auc:0.926108	test-auc:0.774487

