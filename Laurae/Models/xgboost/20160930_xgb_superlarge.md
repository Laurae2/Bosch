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





Depth 10

[1]	train-auc:0.608758+0.023423	test-auc:0.605257+0.019723 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.633978+0.027898	test-auc:0.629022+0.028359 
[3]	train-auc:0.657442+0.001400	test-auc:0.654051+0.004967 
[4]	train-auc:0.660678+0.002070	test-auc:0.655594+0.004595 
[5]	train-auc:0.662296+0.001727	test-auc:0.657016+0.004838 
[6]	train-auc:0.662859+0.001860	test-auc:0.657756+0.004841 
[7]	train-auc:0.663357+0.001698	test-auc:0.658539+0.005206 
[8]	train-auc:0.675364+0.006702	test-auc:0.669637+0.008056 
[9]	train-auc:0.679091+0.008151	test-auc:0.672988+0.011165 
[10]	train-auc:0.683693+0.003187	test-auc:0.676281+0.009635 
[11]	train-auc:0.687494+0.005224	test-auc:0.679618+0.012325 
[12]	train-auc:0.695875+0.007231	test-auc:0.686618+0.010285 
[13]	train-auc:0.709433+0.004912	test-auc:0.693470+0.007715 
[14]	train-auc:0.717414+0.004535	test-auc:0.696861+0.006325 
[15]	train-auc:0.728263+0.002016	test-auc:0.702972+0.008168 
[16]	train-auc:0.736340+0.003394	test-auc:0.706620+0.008165 
[17]	train-auc:0.744851+0.001306	test-auc:0.709045+0.007889 
[18]	train-auc:0.753428+0.003410	test-auc:0.712154+0.006308 
[19]	train-auc:0.764357+0.004074	test-auc:0.715230+0.007059 
[20]	train-auc:0.777191+0.003923	test-auc:0.719895+0.007713 
[21]	train-auc:0.789478+0.004119	test-auc:0.722044+0.007855 
[22]	train-auc:0.803014+0.003977	test-auc:0.725874+0.008349 
[23]	train-auc:0.813481+0.004284	test-auc:0.727505+0.008631 
[24]	train-auc:0.826814+0.003587	test-auc:0.730156+0.008816 
[25]	train-auc:0.833941+0.004007	test-auc:0.731185+0.008354 
[26]	train-auc:0.844669+0.005848	test-auc:0.731799+0.007853 
[27]	train-auc:0.854319+0.005383	test-auc:0.732252+0.007931 
[28]	train-auc:0.864018+0.004702	test-auc:0.733752+0.008227 
[29]	train-auc:0.873371+0.001837	test-auc:0.734312+0.007391 
[30]	train-auc:0.882239+0.002598	test-auc:0.735058+0.006710 
[31]	train-auc:0.890021+0.002194	test-auc:0.735263+0.006928 
[32]	train-auc:0.898311+0.003484	test-auc:0.735496+0.006641 
[33]	train-auc:0.904625+0.002990	test-auc:0.735294+0.006851 
[34]	train-auc:0.910332+0.003963	test-auc:0.734837+0.005969 
[35]	train-auc:0.915418+0.003403	test-auc:0.735003+0.005503 
[36]	train-auc:0.920027+0.005228	test-auc:0.735577+0.005532 
[37]	train-auc:0.923492+0.004922	test-auc:0.735797+0.005460 
[38]	train-auc:0.925661+0.004631	test-auc:0.735649+0.005596 
[39]	train-auc:0.928832+0.004360	test-auc:0.735114+0.005779 
[40]	train-auc:0.931727+0.004478	test-auc:0.735273+0.006232 
[41]	train-auc:0.933933+0.005229	test-auc:0.734522+0.006593 
[42]	train-auc:0.935144+0.005264	test-auc:0.734890+0.006585 
[43]	train-auc:0.937453+0.005403	test-auc:0.734179+0.006328 
[44]	train-auc:0.939440+0.005148	test-auc:0.733863+0.006056 
[45]	train-auc:0.941621+0.005278	test-auc:0.733767+0.005750 
[46]	train-auc:0.943587+0.004717	test-auc:0.733917+0.005948 
[47]	train-auc:0.945087+0.004461	test-auc:0.733469+0.005660 
Stopping. Best iteration:
[37]	train-auc:0.923492+0.004922	test-auc:0.735797+0.005460




Depth 8

[1]	train-auc:0.594774+0.001049	test-auc:0.593519+0.003926 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.595639+0.000939	test-auc:0.593609+0.004207 
[3]	train-auc:0.608514+0.023213	test-auc:0.604251+0.025344 
[4]	train-auc:0.621619+0.028440	test-auc:0.615210+0.028787 
[5]	train-auc:0.645197+0.021906	test-auc:0.641161+0.024437 
[6]	train-auc:0.659666+0.000618	test-auc:0.655482+0.005706 
[7]	train-auc:0.660350+0.000891	test-auc:0.656162+0.005516 
[8]	train-auc:0.661116+0.000899	test-auc:0.657119+0.005970 
[9]	train-auc:0.661286+0.000879	test-auc:0.657316+0.006094 
[10]	train-auc:0.662332+0.001147	test-auc:0.658099+0.005981 
[11]	train-auc:0.667104+0.007494	test-auc:0.662172+0.005121 
[12]	train-auc:0.676089+0.006799	test-auc:0.670954+0.009122 
[13]	train-auc:0.684257+0.003600	test-auc:0.678884+0.010929 
[14]	train-auc:0.700893+0.004600	test-auc:0.688361+0.010525 
[15]	train-auc:0.712157+0.001654	test-auc:0.697681+0.008249 
[16]	train-auc:0.718146+0.003074	test-auc:0.700044+0.007399 
[17]	train-auc:0.726190+0.002901	test-auc:0.703608+0.006442 
[18]	train-auc:0.734544+0.002441	test-auc:0.708113+0.006328 
[19]	train-auc:0.740525+0.003143	test-auc:0.709708+0.006243 
[20]	train-auc:0.749151+0.003229	test-auc:0.712479+0.005804 
[21]	train-auc:0.757601+0.003081	test-auc:0.715508+0.005205 
[22]	train-auc:0.767792+0.004732	test-auc:0.721332+0.003508 
[23]	train-auc:0.776863+0.003141	test-auc:0.725149+0.004733 
[24]	train-auc:0.784573+0.003980	test-auc:0.728173+0.006902 
[25]	train-auc:0.793945+0.003815	test-auc:0.729940+0.006512 
[26]	train-auc:0.800982+0.003854	test-auc:0.731648+0.005454 
[27]	train-auc:0.808554+0.004399	test-auc:0.733018+0.004474 
[28]	train-auc:0.815207+0.003397	test-auc:0.733316+0.005066 
[29]	train-auc:0.824524+0.003342	test-auc:0.734501+0.004868 
[30]	train-auc:0.832842+0.004499	test-auc:0.734932+0.004722 
[31]	train-auc:0.840526+0.004832	test-auc:0.734500+0.005021 
[32]	train-auc:0.847135+0.004158	test-auc:0.734817+0.004664 
[33]	train-auc:0.852975+0.004413	test-auc:0.735609+0.004875 
[34]	train-auc:0.859006+0.003871	test-auc:0.735743+0.005250 
[35]	train-auc:0.863067+0.004400	test-auc:0.736756+0.005312 
[36]	train-auc:0.867268+0.004571	test-auc:0.737012+0.005921 
[37]	train-auc:0.869904+0.003732	test-auc:0.737087+0.006480 
[38]	train-auc:0.874257+0.003425	test-auc:0.736807+0.006673 
[39]	train-auc:0.876892+0.003523	test-auc:0.736422+0.006666 
[40]	train-auc:0.879890+0.003730	test-auc:0.736351+0.006802 
[41]	train-auc:0.882071+0.003470	test-auc:0.736287+0.007047 
[42]	train-auc:0.884454+0.002659	test-auc:0.736343+0.006804 
[43]	train-auc:0.886049+0.002541	test-auc:0.736340+0.007223 
[44]	train-auc:0.888242+0.002658	test-auc:0.735904+0.006887 
[45]	train-auc:0.890144+0.003241	test-auc:0.736225+0.006703 
[46]	train-auc:0.892166+0.003888	test-auc:0.736016+0.006673 
[47]	train-auc:0.894108+0.003678	test-auc:0.735639+0.006738 
Stopping. Best iteration:
[37]	train-auc:0.869904+0.003732	test-auc:0.737087+0.006480




Depth 12

[1]	train-auc:0.633842+0.029488	test-auc:0.632512+0.028365 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.660503+0.001747	test-auc:0.656534+0.005096 
[3]	train-auc:0.662612+0.001406	test-auc:0.658557+0.005422 
[4]	train-auc:0.665758+0.006526	test-auc:0.661033+0.004473 
[5]	train-auc:0.666786+0.006604	test-auc:0.661291+0.004481 
[6]	train-auc:0.681839+0.003543	test-auc:0.675356+0.011498 
[7]	train-auc:0.684646+0.004004	test-auc:0.677925+0.012211 
[8]	train-auc:0.688272+0.005677	test-auc:0.682008+0.009964 
[9]	train-auc:0.693045+0.005296	test-auc:0.683342+0.010116 
[10]	train-auc:0.698969+0.005258	test-auc:0.687500+0.007222 
[11]	train-auc:0.707267+0.005653	test-auc:0.691557+0.005197 
[12]	train-auc:0.716732+0.005019	test-auc:0.695900+0.004742 
[13]	train-auc:0.724208+0.007042	test-auc:0.699847+0.004646 
[14]	train-auc:0.734823+0.006135	test-auc:0.703453+0.005217 
[15]	train-auc:0.746008+0.003100	test-auc:0.708535+0.008396 
[16]	train-auc:0.754950+0.003296	test-auc:0.712051+0.008449 
[17]	train-auc:0.763918+0.002382	test-auc:0.713814+0.007694 
[18]	train-auc:0.775080+0.003184	test-auc:0.715962+0.005832 
[19]	train-auc:0.787887+0.004338	test-auc:0.718007+0.006268 
[20]	train-auc:0.803906+0.003535	test-auc:0.721349+0.006523 
[21]	train-auc:0.816694+0.004034	test-auc:0.722442+0.007241 
[22]	train-auc:0.830843+0.005846	test-auc:0.724419+0.006734 
[23]	train-auc:0.844340+0.006692	test-auc:0.726789+0.006558 
[24]	train-auc:0.858589+0.005853	test-auc:0.729001+0.006987 
[25]	train-auc:0.872607+0.005688	test-auc:0.729649+0.006788 
[26]	train-auc:0.886122+0.005955	test-auc:0.732509+0.007451 
[27]	train-auc:0.896801+0.003834	test-auc:0.732825+0.007247 
[28]	train-auc:0.905293+0.005210	test-auc:0.733136+0.005652 
[29]	train-auc:0.916531+0.004353	test-auc:0.734535+0.006322 
[30]	train-auc:0.924817+0.004072	test-auc:0.734588+0.006363 
[31]	train-auc:0.934264+0.001975	test-auc:0.734679+0.006611 
[32]	train-auc:0.941046+0.003083	test-auc:0.734458+0.006460 
[33]	train-auc:0.945531+0.004421	test-auc:0.734106+0.006149 
[34]	train-auc:0.949173+0.004110	test-auc:0.734177+0.005655 
[35]	train-auc:0.953319+0.004590	test-auc:0.734184+0.005184 
[36]	train-auc:0.957174+0.004141	test-auc:0.733375+0.004041 
[37]	train-auc:0.959275+0.003630	test-auc:0.733304+0.004615 
[38]	train-auc:0.961398+0.003165	test-auc:0.732651+0.003384 
[39]	train-auc:0.963612+0.003787	test-auc:0.732079+0.003215 
[40]	train-auc:0.965545+0.004149	test-auc:0.731364+0.003659 
[41]	train-auc:0.967294+0.004411	test-auc:0.731095+0.003823 
Stopping. Best iteration:
[31]	train-auc:0.934264+0.001975	test-auc:0.734679+0.006611




Depth 9

[1]	train-auc:0.595493+0.001131	test-auc:0.594022+0.003890 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 10 rounds.

[2]	train-auc:0.608324+0.023667	test-auc:0.604285+0.020471 
[3]	train-auc:0.643797+0.023496	test-auc:0.640448+0.025433 
[4]	train-auc:0.657788+0.001438	test-auc:0.653565+0.005193 
[5]	train-auc:0.658962+0.001810	test-auc:0.654281+0.004599 
[6]	train-auc:0.660799+0.002407	test-auc:0.655580+0.004640 
[7]	train-auc:0.661106+0.002444	test-auc:0.656270+0.004693 
[8]	train-auc:0.662209+0.002167	test-auc:0.656997+0.004966 
[9]	train-auc:0.665680+0.007966	test-auc:0.660236+0.005101 
[10]	train-auc:0.672942+0.008274	test-auc:0.667723+0.011088 
[11]	train-auc:0.683310+0.004467	test-auc:0.677001+0.012141 
[12]	train-auc:0.686481+0.004699	test-auc:0.679384+0.011280 
[13]	train-auc:0.693898+0.007034	test-auc:0.684522+0.010878 
[14]	train-auc:0.707807+0.005977	test-auc:0.692321+0.010416 
[15]	train-auc:0.719520+0.003512	test-auc:0.700117+0.008834 
[16]	train-auc:0.728276+0.003963	test-auc:0.704294+0.006752 
[17]	train-auc:0.736794+0.002018	test-auc:0.707154+0.007921 
[18]	train-auc:0.743425+0.001578	test-auc:0.708782+0.007480 
[19]	train-auc:0.752528+0.001185	test-auc:0.712056+0.007457 
[20]	train-auc:0.763248+0.002872	test-auc:0.714077+0.008469 
[21]	train-auc:0.773696+0.001987	test-auc:0.718048+0.008962 
[22]	train-auc:0.783556+0.005414	test-auc:0.720081+0.008457 
[23]	train-auc:0.793969+0.005158	test-auc:0.724751+0.007324 
[24]	train-auc:0.803115+0.006157	test-auc:0.727305+0.007280 
[25]	train-auc:0.813210+0.005615	test-auc:0.729436+0.007399 
[26]	train-auc:0.823258+0.005211	test-auc:0.732453+0.006725 
[27]	train-auc:0.831360+0.005232	test-auc:0.733100+0.006444 
[28]	train-auc:0.841335+0.003799	test-auc:0.734716+0.006529 
[29]	train-auc:0.850774+0.004454	test-auc:0.736194+0.006756 
[30]	train-auc:0.860984+0.005059	test-auc:0.736996+0.006728 
[31]	train-auc:0.869569+0.003983	test-auc:0.737712+0.006044 
[32]	train-auc:0.876891+0.004190	test-auc:0.737631+0.005976 
[33]	train-auc:0.883164+0.003276	test-auc:0.737788+0.006665 
[34]	train-auc:0.887746+0.003625	test-auc:0.738086+0.006311 
[35]	train-auc:0.891486+0.003403	test-auc:0.738086+0.006468 
[36]	train-auc:0.895018+0.004057	test-auc:0.738238+0.006368 
[37]	train-auc:0.898539+0.004411	test-auc:0.737499+0.005569 
[38]	train-auc:0.901707+0.004360	test-auc:0.737638+0.005702 
[39]	train-auc:0.904183+0.004143	test-auc:0.737449+0.005836 
[40]	train-auc:0.907297+0.003283	test-auc:0.737468+0.005300 
[41]	train-auc:0.909031+0.002962	test-auc:0.737761+0.005544 
[42]	train-auc:0.912888+0.001729	test-auc:0.737153+0.005558 
[43]	train-auc:0.915003+0.002602	test-auc:0.737020+0.005343 
[44]	train-auc:0.918669+0.002112	test-auc:0.737310+0.004963 
[45]	train-auc:0.920352+0.001695	test-auc:0.736930+0.004683 
[46]	train-auc:0.922103+0.001824	test-auc:0.736578+0.004516 
Stopping. Best iteration:
[36]	train-auc:0.895018+0.004057	test-auc:0.738238+0.006368






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









Fold 1

[1]	train-auc:0.593572	test-auc:0.601625 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.594683	test-auc:0.601258 
[3]	train-auc:0.594690	test-auc:0.601261 
[4]	train-auc:0.594691	test-auc:0.601262 
[5]	train-auc:0.594694	test-auc:0.601263 
[6]	train-auc:0.594694	test-auc:0.601262 
[7]	train-auc:0.594696	test-auc:0.601264 
[8]	train-auc:0.594697	test-auc:0.601266 
[9]	train-auc:0.654313	test-auc:0.653820 
[10]	train-auc:0.654314	test-auc:0.653822 
[11]	train-auc:0.654887	test-auc:0.654755 
[12]	train-auc:0.654888	test-auc:0.654755 
[13]	train-auc:0.656579	test-auc:0.655801 
[14]	train-auc:0.658206	test-auc:0.655820 
[15]	train-auc:0.658204	test-auc:0.655820 
[16]	train-auc:0.658201	test-auc:0.655814 
[17]	train-auc:0.658203	test-auc:0.655814 
[18]	train-auc:0.659149	test-auc:0.656812 
[19]	train-auc:0.659457	test-auc:0.656786 
[20]	train-auc:0.659463	test-auc:0.656788 
[21]	train-auc:0.659460	test-auc:0.656781 
[22]	train-auc:0.659455	test-auc:0.656779 
[23]	train-auc:0.659456	test-auc:0.656779 
[24]	train-auc:0.662331	test-auc:0.660459 
[25]	train-auc:0.662332	test-auc:0.660460 
[26]	train-auc:0.662340	test-auc:0.660468 
[27]	train-auc:0.662456	test-auc:0.660731 
[28]	train-auc:0.662455	test-auc:0.660727 
[29]	train-auc:0.662456	test-auc:0.660728 
[30]	train-auc:0.662629	test-auc:0.660725 
[31]	train-auc:0.662620	test-auc:0.660699 
[32]	train-auc:0.662620	test-auc:0.660699 
[33]	train-auc:0.662604	test-auc:0.660679 
[34]	train-auc:0.662603	test-auc:0.660680 
[35]	train-auc:0.662601	test-auc:0.660680 
[36]	train-auc:0.662766	test-auc:0.660674 
[37]	train-auc:0.662751	test-auc:0.660661 
[38]	train-auc:0.662795	test-auc:0.661023 
[39]	train-auc:0.662796	test-auc:0.661020 
[40]	train-auc:0.662795	test-auc:0.661020 
[41]	train-auc:0.662785	test-auc:0.660999 
[42]	train-auc:0.663072	test-auc:0.661578 
[43]	train-auc:0.663071	test-auc:0.661570 
[44]	train-auc:0.663524	test-auc:0.661990 
[45]	train-auc:0.663526	test-auc:0.661992 
[46]	train-auc:0.663763	test-auc:0.662583 
[47]	train-auc:0.663763	test-auc:0.662585 
[48]	train-auc:0.663761	test-auc:0.662582 
[49]	train-auc:0.663759	test-auc:0.662582 
[50]	train-auc:0.663755	test-auc:0.662577 
[51]	train-auc:0.663759	test-auc:0.662577 
[52]	train-auc:0.663752	test-auc:0.662569 
[53]	train-auc:0.663754	test-auc:0.662572 
[54]	train-auc:0.663757	test-auc:0.662574 
[55]	train-auc:0.663754	test-auc:0.662573 
[56]	train-auc:0.663754	test-auc:0.662573 
[57]	train-auc:0.663754	test-auc:0.662571 
[58]	train-auc:0.663748	test-auc:0.662547 
[59]	train-auc:0.663741	test-auc:0.662542 
[60]	train-auc:0.663736	test-auc:0.662542 
[61]	train-auc:0.663735	test-auc:0.662542 
[62]	train-auc:0.663734	test-auc:0.662540 
[63]	train-auc:0.663730	test-auc:0.662537 
[64]	train-auc:0.663730	test-auc:0.662539 
[65]	train-auc:0.663720	test-auc:0.662523 
[66]	train-auc:0.663711	test-auc:0.662516 
[67]	train-auc:0.663711	test-auc:0.662517 
[68]	train-auc:0.663704	test-auc:0.662508 
[69]	train-auc:0.663704	test-auc:0.662507 
[70]	train-auc:0.663694	test-auc:0.662494 
[71]	train-auc:0.663698	test-auc:0.662495 
[72]	train-auc:0.663698	test-auc:0.662495 
[73]	train-auc:0.663695	test-auc:0.662492 
[74]	train-auc:0.663701	test-auc:0.662493 
[75]	train-auc:0.664821	test-auc:0.663633 
[76]	train-auc:0.665195	test-auc:0.663574 
[77]	train-auc:0.681910	test-auc:0.677417 
[78]	train-auc:0.681849	test-auc:0.677486 
[79]	train-auc:0.681836	test-auc:0.677470 
[80]	train-auc:0.681837	test-auc:0.677468 
[81]	train-auc:0.681719	test-auc:0.677523 
[82]	train-auc:0.681703	test-auc:0.677519 
[83]	train-auc:0.687779	test-auc:0.685623 
[84]	train-auc:0.687769	test-auc:0.685608 
[85]	train-auc:0.687770	test-auc:0.685611 
[86]	train-auc:0.687837	test-auc:0.685773 
[87]	train-auc:0.688027	test-auc:0.685768 
[88]	train-auc:0.688444	test-auc:0.685754 
[89]	train-auc:0.688383	test-auc:0.685908 
[90]	train-auc:0.688692	test-auc:0.686198 
[91]	train-auc:0.688690	test-auc:0.686201 
[92]	train-auc:0.689489	test-auc:0.687092 
[93]	train-auc:0.691143	test-auc:0.687835 
[94]	train-auc:0.692143	test-auc:0.688632 
[95]	train-auc:0.692906	test-auc:0.689094 
[96]	train-auc:0.692896	test-auc:0.689070 
[97]	train-auc:0.695668	test-auc:0.691675 
[98]	train-auc:0.699902	test-auc:0.695516 
[99]	train-auc:0.700435	test-auc:0.695665 
[100]	train-auc:0.700477	test-auc:0.695589 
[101]	train-auc:0.700675	test-auc:0.695584 
[102]	train-auc:0.701717	test-auc:0.695951 
[103]	train-auc:0.701772	test-auc:0.695803 
[104]	train-auc:0.702251	test-auc:0.695782 
[105]	train-auc:0.702779	test-auc:0.696216 
[106]	train-auc:0.704239	test-auc:0.696261 
[107]	train-auc:0.708056	test-auc:0.698549 
[108]	train-auc:0.708606	test-auc:0.698572 
[109]	train-auc:0.711900	test-auc:0.699250 
[110]	train-auc:0.716499	test-auc:0.703972 
[111]	train-auc:0.717235	test-auc:0.704262 
[112]	train-auc:0.719267	test-auc:0.704781 
[113]	train-auc:0.719783	test-auc:0.705664 
[114]	train-auc:0.721145	test-auc:0.706430 
[115]	train-auc:0.721899	test-auc:0.706592 
[116]	train-auc:0.722439	test-auc:0.707021 
[117]	train-auc:0.723394	test-auc:0.706760 
[118]	train-auc:0.723581	test-auc:0.706957 
[119]	train-auc:0.724002	test-auc:0.707354 
[120]	train-auc:0.724735	test-auc:0.707218 
[121]	train-auc:0.725431	test-auc:0.707387 
[122]	train-auc:0.726618	test-auc:0.709195 
[123]	train-auc:0.726569	test-auc:0.709054 
[124]	train-auc:0.726802	test-auc:0.709018 
[125]	train-auc:0.728517	test-auc:0.709816 
[126]	train-auc:0.728892	test-auc:0.709780 
[127]	train-auc:0.728851	test-auc:0.709890 
[128]	train-auc:0.729775	test-auc:0.711070 
[129]	train-auc:0.732878	test-auc:0.711778 
[130]	train-auc:0.735462	test-auc:0.712051 
[131]	train-auc:0.737935	test-auc:0.713070 
[132]	train-auc:0.739102	test-auc:0.713713 
[133]	train-auc:0.740222	test-auc:0.714365 
[134]	train-auc:0.740712	test-auc:0.714885 
[135]	train-auc:0.741543	test-auc:0.715142 
[136]	train-auc:0.741821	test-auc:0.715443 
[137]	train-auc:0.742244	test-auc:0.715467 
[138]	train-auc:0.742585	test-auc:0.715326 
[139]	train-auc:0.743084	test-auc:0.715469 
[140]	train-auc:0.743847	test-auc:0.715462 
[141]	train-auc:0.746206	test-auc:0.717368 
[142]	train-auc:0.747137	test-auc:0.718224 
[143]	train-auc:0.747965	test-auc:0.718415 
[144]	train-auc:0.749333	test-auc:0.718508 
[145]	train-auc:0.750123	test-auc:0.718955 
[146]	train-auc:0.750594	test-auc:0.718914 
[147]	train-auc:0.751220	test-auc:0.718993 
[148]	train-auc:0.751732	test-auc:0.719315 
[149]	train-auc:0.752511	test-auc:0.719845 
[150]	train-auc:0.753006	test-auc:0.719740 
[151]	train-auc:0.753513	test-auc:0.720615 
[152]	train-auc:0.754537	test-auc:0.721188 
[153]	train-auc:0.755636	test-auc:0.722149 
[154]	train-auc:0.758139	test-auc:0.722351 
[155]	train-auc:0.760531	test-auc:0.723832 
[156]	train-auc:0.761665	test-auc:0.724553 
[157]	train-auc:0.762598	test-auc:0.725656 
[158]	train-auc:0.765065	test-auc:0.726008 
[159]	train-auc:0.767709	test-auc:0.728126 
[160]	train-auc:0.768219	test-auc:0.728194 
[161]	train-auc:0.771357	test-auc:0.729347 
[162]	train-auc:0.771892	test-auc:0.729599 
[163]	train-auc:0.772398	test-auc:0.729648 
[164]	train-auc:0.775380	test-auc:0.730377 
[165]	train-auc:0.776051	test-auc:0.730292 
[166]	train-auc:0.778155	test-auc:0.731727 
[167]	train-auc:0.779123	test-auc:0.731962 
[168]	train-auc:0.781645	test-auc:0.732175 
[169]	train-auc:0.783176	test-auc:0.732393 
[170]	train-auc:0.784013	test-auc:0.732535 
[171]	train-auc:0.784547	test-auc:0.732872 
[172]	train-auc:0.785248	test-auc:0.732695 
[173]	train-auc:0.786459	test-auc:0.733063 
[174]	train-auc:0.787593	test-auc:0.733074 
[175]	train-auc:0.789201	test-auc:0.734079 
[176]	train-auc:0.790879	test-auc:0.734857 
[177]	train-auc:0.792424	test-auc:0.735771 
[178]	train-auc:0.793712	test-auc:0.736071 
[179]	train-auc:0.794804	test-auc:0.736239 
[180]	train-auc:0.796524	test-auc:0.736497 
[181]	train-auc:0.797903	test-auc:0.736436 
[182]	train-auc:0.799357	test-auc:0.736548 
[183]	train-auc:0.800545	test-auc:0.736438 
[184]	train-auc:0.801457	test-auc:0.736568 
[185]	train-auc:0.802370	test-auc:0.736749 
[186]	train-auc:0.803588	test-auc:0.736846 
[187]	train-auc:0.804292	test-auc:0.737025 
[188]	train-auc:0.805062	test-auc:0.737197 
[189]	train-auc:0.806238	test-auc:0.737174 
[190]	train-auc:0.807151	test-auc:0.737305 
[191]	train-auc:0.808533	test-auc:0.737897 
[192]	train-auc:0.809602	test-auc:0.738271 
[193]	train-auc:0.811299	test-auc:0.738866 
[194]	train-auc:0.812838	test-auc:0.739259 
[195]	train-auc:0.814458	test-auc:0.739526 
[196]	train-auc:0.815893	test-auc:0.739242 
[197]	train-auc:0.817850	test-auc:0.740190 
[198]	train-auc:0.819100	test-auc:0.740532 
[199]	train-auc:0.820474	test-auc:0.741279 
[200]	train-auc:0.822097	test-auc:0.741432 
[201]	train-auc:0.823265	test-auc:0.741852 
[202]	train-auc:0.824186	test-auc:0.741772 
[203]	train-auc:0.825406	test-auc:0.741855 
[204]	train-auc:0.826393	test-auc:0.741879 
[205]	train-auc:0.828470	test-auc:0.742065 
[206]	train-auc:0.830557	test-auc:0.742672 
[207]	train-auc:0.831739	test-auc:0.742747 
[208]	train-auc:0.833332	test-auc:0.742781 
[209]	train-auc:0.835273	test-auc:0.743167 
[210]	train-auc:0.837570	test-auc:0.743314 
[211]	train-auc:0.838719	test-auc:0.743260 
[212]	train-auc:0.840253	test-auc:0.743721 
[213]	train-auc:0.841487	test-auc:0.743763 
[214]	train-auc:0.842758	test-auc:0.743742 
[215]	train-auc:0.843951	test-auc:0.744351 
[216]	train-auc:0.845193	test-auc:0.744221 
[217]	train-auc:0.846971	test-auc:0.744808 
[218]	train-auc:0.847843	test-auc:0.745450 
[219]	train-auc:0.849400	test-auc:0.745290 
[220]	train-auc:0.850947	test-auc:0.745766 
[221]	train-auc:0.851967	test-auc:0.746001 
[222]	train-auc:0.853138	test-auc:0.746199 
[223]	train-auc:0.854118	test-auc:0.746554 
[224]	train-auc:0.855703	test-auc:0.746490 
[225]	train-auc:0.857462	test-auc:0.746590 
[226]	train-auc:0.858079	test-auc:0.746660 
[227]	train-auc:0.859102	test-auc:0.747163 
[228]	train-auc:0.860736	test-auc:0.747678 
[229]	train-auc:0.861595	test-auc:0.747918 
[230]	train-auc:0.862948	test-auc:0.748224 
[231]	train-auc:0.864090	test-auc:0.748281 
[232]	train-auc:0.865156	test-auc:0.748853 
[233]	train-auc:0.867045	test-auc:0.748754 
[234]	train-auc:0.868228	test-auc:0.749152 
[235]	train-auc:0.869493	test-auc:0.749418 
[236]	train-auc:0.871082	test-auc:0.749464 
[237]	train-auc:0.872581	test-auc:0.749425 
[238]	train-auc:0.873090	test-auc:0.749823 
[239]	train-auc:0.874418	test-auc:0.749873 
[240]	train-auc:0.875565	test-auc:0.750131 
[241]	train-auc:0.876652	test-auc:0.750224 
[242]	train-auc:0.877909	test-auc:0.750303 
[243]	train-auc:0.879131	test-auc:0.750569 
[244]	train-auc:0.880889	test-auc:0.750695 
[245]	train-auc:0.881727	test-auc:0.750821 
[246]	train-auc:0.882610	test-auc:0.750689 
[247]	train-auc:0.883758	test-auc:0.750813 
[248]	train-auc:0.884655	test-auc:0.750830 
[249]	train-auc:0.886109	test-auc:0.750930 
[250]	train-auc:0.886980	test-auc:0.750877 
[251]	train-auc:0.888273	test-auc:0.750778 
[252]	train-auc:0.888916	test-auc:0.750795 
[253]	train-auc:0.889971	test-auc:0.750704 
[254]	train-auc:0.891432	test-auc:0.750781 
[255]	train-auc:0.892127	test-auc:0.750998 
[256]	train-auc:0.892857	test-auc:0.750947 
[257]	train-auc:0.893683	test-auc:0.750815 
[258]	train-auc:0.894872	test-auc:0.750933 
[259]	train-auc:0.895675	test-auc:0.751036 
[260]	train-auc:0.896915	test-auc:0.751080 
[261]	train-auc:0.897531	test-auc:0.751080 
[262]	train-auc:0.898131	test-auc:0.751016 
[263]	train-auc:0.899448	test-auc:0.751123 
[264]	train-auc:0.899994	test-auc:0.751043 
[265]	train-auc:0.900524	test-auc:0.751135 
[266]	train-auc:0.901015	test-auc:0.751285 
[267]	train-auc:0.902077	test-auc:0.751288 
[268]	train-auc:0.903017	test-auc:0.751235 
[269]	train-auc:0.903640	test-auc:0.751143 
[270]	train-auc:0.904556	test-auc:0.751032 
[271]	train-auc:0.904943	test-auc:0.751156 
[272]	train-auc:0.905358	test-auc:0.750990 
[273]	train-auc:0.905892	test-auc:0.750982 
[274]	train-auc:0.906321	test-auc:0.750960 
[275]	train-auc:0.906737	test-auc:0.750930 
[276]	train-auc:0.907726	test-auc:0.751018 
[277]	train-auc:0.907986	test-auc:0.751170 
[278]	train-auc:0.908329	test-auc:0.751139 
[279]	train-auc:0.908645	test-auc:0.751167 
[280]	train-auc:0.909165	test-auc:0.751267 
[281]	train-auc:0.909314	test-auc:0.751238 
[282]	train-auc:0.910457	test-auc:0.751310 
[283]	train-auc:0.911098	test-auc:0.751313 
[284]	train-auc:0.911656	test-auc:0.751184 
[285]	train-auc:0.912187	test-auc:0.751285 
[286]	train-auc:0.913061	test-auc:0.751148 
[287]	train-auc:0.913247	test-auc:0.751034 
[288]	train-auc:0.913457	test-auc:0.750927 
[289]	train-auc:0.913952	test-auc:0.750760 
[290]	train-auc:0.914074	test-auc:0.750783 
[291]	train-auc:0.914229	test-auc:0.750800 
[292]	train-auc:0.914386	test-auc:0.750766 
[293]	train-auc:0.915167	test-auc:0.750804 
[294]	train-auc:0.915923	test-auc:0.750760 
[295]	train-auc:0.916176	test-auc:0.750744 
[296]	train-auc:0.916650	test-auc:0.750792 
[297]	train-auc:0.917154	test-auc:0.750699 
[298]	train-auc:0.917887	test-auc:0.750874 
[299]	train-auc:0.918077	test-auc:0.751046 
[300]	train-auc:0.918981	test-auc:0.751000 
[301]	train-auc:0.919807	test-auc:0.750960 
[302]	train-auc:0.920003	test-auc:0.750822 
[303]	train-auc:0.920366	test-auc:0.750691 
[304]	train-auc:0.920627	test-auc:0.750701 
[305]	train-auc:0.921281	test-auc:0.750618 
[306]	train-auc:0.921581	test-auc:0.750711 
[307]	train-auc:0.922118	test-auc:0.750980 
[308]	train-auc:0.922705	test-auc:0.751014 
[309]	train-auc:0.923026	test-auc:0.750787 
[310]	train-auc:0.923833	test-auc:0.750802 
[311]	train-auc:0.923942	test-auc:0.750830 
[312]	train-auc:0.924474	test-auc:0.750718 
[313]	train-auc:0.924789	test-auc:0.750785 
[314]	train-auc:0.925524	test-auc:0.750600 
[315]	train-auc:0.926012	test-auc:0.750701 
[316]	train-auc:0.926010	test-auc:0.750702 
[317]	train-auc:0.926450	test-auc:0.750586 
[318]	train-auc:0.926728	test-auc:0.750578 
[319]	train-auc:0.927247	test-auc:0.750792 
[320]	train-auc:0.927661	test-auc:0.750790 
[321]	train-auc:0.927770	test-auc:0.750719 
[322]	train-auc:0.928060	test-auc:0.750498 
[323]	train-auc:0.928500	test-auc:0.750419 
[324]	train-auc:0.929062	test-auc:0.750589 
[325]	train-auc:0.929361	test-auc:0.750426 
[326]	train-auc:0.929967	test-auc:0.750372 
[327]	train-auc:0.930250	test-auc:0.750415 
[328]	train-auc:0.930386	test-auc:0.750529 
[329]	train-auc:0.930630	test-auc:0.750349 
[330]	train-auc:0.930933	test-auc:0.750335 
[331]	train-auc:0.931179	test-auc:0.750291 
[332]	train-auc:0.931423	test-auc:0.750171 
[333]	train-auc:0.931595	test-auc:0.750220 
Stopping. Best iteration:
[283]	train-auc:0.911098	test-auc:0.751313




Fold 2

[1]	train-auc:0.596383	test-auc:0.592988 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.596392	test-auc:0.592995 
[3]	train-auc:0.596394	test-auc:0.592997 
[4]	train-auc:0.596397	test-auc:0.592996 
[5]	train-auc:0.596401	test-auc:0.593001 
[6]	train-auc:0.596401	test-auc:0.593002 
[7]	train-auc:0.596401	test-auc:0.593002 
[8]	train-auc:0.596402	test-auc:0.593002 
[9]	train-auc:0.596403	test-auc:0.593003 
[10]	train-auc:0.596404	test-auc:0.593004 
[11]	train-auc:0.596404	test-auc:0.593003 
[12]	train-auc:0.596770	test-auc:0.593321 
[13]	train-auc:0.596768	test-auc:0.593319 
[14]	train-auc:0.653323	test-auc:0.659775 
[15]	train-auc:0.654776	test-auc:0.661387 
[16]	train-auc:0.654777	test-auc:0.661386 
[17]	train-auc:0.654857	test-auc:0.661168 
[18]	train-auc:0.654858	test-auc:0.661167 
[19]	train-auc:0.654859	test-auc:0.661168 
[20]	train-auc:0.654920	test-auc:0.661174 
[21]	train-auc:0.654913	test-auc:0.661167 
[22]	train-auc:0.654922	test-auc:0.661174 
[23]	train-auc:0.655098	test-auc:0.661165 
[24]	train-auc:0.655099	test-auc:0.661164 
[25]	train-auc:0.655101	test-auc:0.661165 
[26]	train-auc:0.655275	test-auc:0.661148 
[27]	train-auc:0.655270	test-auc:0.661134 
[28]	train-auc:0.655273	test-auc:0.661135 
[29]	train-auc:0.656486	test-auc:0.661834 
[30]	train-auc:0.656663	test-auc:0.661833 
[31]	train-auc:0.656660	test-auc:0.661822 
[32]	train-auc:0.656661	test-auc:0.661823 
[33]	train-auc:0.656435	test-auc:0.661435 
[34]	train-auc:0.656418	test-auc:0.662136 
[35]	train-auc:0.657515	test-auc:0.663225 
[36]	train-auc:0.657947	test-auc:0.663227 
[37]	train-auc:0.658156	test-auc:0.663600 
[38]	train-auc:0.658153	test-auc:0.663594 
[39]	train-auc:0.658499	test-auc:0.663998 
[40]	train-auc:0.658497	test-auc:0.663990 
[41]	train-auc:0.658494	test-auc:0.663987 
[42]	train-auc:0.658494	test-auc:0.663986 
[43]	train-auc:0.658497	test-auc:0.663987 
[44]	train-auc:0.658495	test-auc:0.663989 
[45]	train-auc:0.658492	test-auc:0.663974 
[46]	train-auc:0.661683	test-auc:0.665661 
[47]	train-auc:0.661682	test-auc:0.665658 
[48]	train-auc:0.661684	test-auc:0.665659 
[49]	train-auc:0.673809	test-auc:0.680492 
[50]	train-auc:0.673806	test-auc:0.680493 
[51]	train-auc:0.673808	test-auc:0.680494 
[52]	train-auc:0.673809	test-auc:0.680488 
[53]	train-auc:0.673803	test-auc:0.680489 
[54]	train-auc:0.673804	test-auc:0.680491 
[55]	train-auc:0.673795	test-auc:0.680478 
[56]	train-auc:0.673787	test-auc:0.680476 
[57]	train-auc:0.673782	test-auc:0.680463 
[58]	train-auc:0.673792	test-auc:0.680480 
[59]	train-auc:0.673781	test-auc:0.680474 
[60]	train-auc:0.674106	test-auc:0.680802 
[61]	train-auc:0.674102	test-auc:0.680795 
[62]	train-auc:0.674620	test-auc:0.682062 
[63]	train-auc:0.675185	test-auc:0.682769 
[64]	train-auc:0.675169	test-auc:0.683185 
[65]	train-auc:0.675167	test-auc:0.683186 
[66]	train-auc:0.675164	test-auc:0.683182 
[67]	train-auc:0.675159	test-auc:0.683179 
[68]	train-auc:0.675159	test-auc:0.683180 
[69]	train-auc:0.675137	test-auc:0.683142 
[70]	train-auc:0.675149	test-auc:0.683166 
[71]	train-auc:0.675248	test-auc:0.683132 
[72]	train-auc:0.675234	test-auc:0.683104 
[73]	train-auc:0.675654	test-auc:0.683301 
[74]	train-auc:0.675642	test-auc:0.683637 
[75]	train-auc:0.683377	test-auc:0.690556 
[76]	train-auc:0.683376	test-auc:0.690540 
[77]	train-auc:0.683361	test-auc:0.690514 
[78]	train-auc:0.684410	test-auc:0.690582 
[79]	train-auc:0.684489	test-auc:0.690768 
[80]	train-auc:0.685285	test-auc:0.690665 
[81]	train-auc:0.685609	test-auc:0.690668 
[82]	train-auc:0.686147	test-auc:0.690562 
[83]	train-auc:0.686149	test-auc:0.690565 
[84]	train-auc:0.686126	test-auc:0.690868 
[85]	train-auc:0.686197	test-auc:0.690840 
[86]	train-auc:0.686193	test-auc:0.690835 
[87]	train-auc:0.691413	test-auc:0.697439 
[88]	train-auc:0.692078	test-auc:0.697564 
[89]	train-auc:0.692729	test-auc:0.697660 
[90]	train-auc:0.696579	test-auc:0.701067 
[91]	train-auc:0.696883	test-auc:0.701108 
[92]	train-auc:0.696891	test-auc:0.701114 
[93]	train-auc:0.697401	test-auc:0.701793 
[94]	train-auc:0.697402	test-auc:0.701799 
[95]	train-auc:0.697436	test-auc:0.701833 
[96]	train-auc:0.697912	test-auc:0.702324 
[97]	train-auc:0.697940	test-auc:0.702308 
[98]	train-auc:0.698173	test-auc:0.702280 
[99]	train-auc:0.698247	test-auc:0.702259 
[100]	train-auc:0.698269	test-auc:0.702269 
[101]	train-auc:0.700962	test-auc:0.703272 
[102]	train-auc:0.702484	test-auc:0.704206 
[103]	train-auc:0.702559	test-auc:0.704321 
[104]	train-auc:0.702567	test-auc:0.704212 
[105]	train-auc:0.702518	test-auc:0.704141 
[106]	train-auc:0.702496	test-auc:0.704038 
[107]	train-auc:0.703046	test-auc:0.704068 
[108]	train-auc:0.704215	test-auc:0.704034 
[109]	train-auc:0.705628	test-auc:0.704698 
[110]	train-auc:0.706275	test-auc:0.705234 
[111]	train-auc:0.706791	test-auc:0.706168 
[112]	train-auc:0.707513	test-auc:0.706072 
[113]	train-auc:0.708505	test-auc:0.706451 
[114]	train-auc:0.717100	test-auc:0.712967 
[115]	train-auc:0.718628	test-auc:0.714084 
[116]	train-auc:0.719813	test-auc:0.714630 
[117]	train-auc:0.720152	test-auc:0.714620 
[118]	train-auc:0.721260	test-auc:0.714462 
[119]	train-auc:0.721542	test-auc:0.714473 
[120]	train-auc:0.721642	test-auc:0.714367 
[121]	train-auc:0.721928	test-auc:0.714267 
[122]	train-auc:0.721966	test-auc:0.714181 
[123]	train-auc:0.722905	test-auc:0.714476 
[124]	train-auc:0.723860	test-auc:0.714617 
[125]	train-auc:0.724626	test-auc:0.714410 
[126]	train-auc:0.725101	test-auc:0.714473 
[127]	train-auc:0.725555	test-auc:0.714442 
[128]	train-auc:0.725718	test-auc:0.714412 
[129]	train-auc:0.728168	test-auc:0.715217 
[130]	train-auc:0.729830	test-auc:0.715899 
[131]	train-auc:0.733459	test-auc:0.718237 
[132]	train-auc:0.734190	test-auc:0.718062 
[133]	train-auc:0.735002	test-auc:0.718209 
[134]	train-auc:0.736018	test-auc:0.718391 
[135]	train-auc:0.736515	test-auc:0.718156 
[136]	train-auc:0.739404	test-auc:0.719013 
[137]	train-auc:0.740701	test-auc:0.719168 
[138]	train-auc:0.741753	test-auc:0.719403 
[139]	train-auc:0.742734	test-auc:0.719687 
[140]	train-auc:0.745075	test-auc:0.719841 
[141]	train-auc:0.746425	test-auc:0.719819 
[142]	train-auc:0.747659	test-auc:0.720308 
[143]	train-auc:0.748887	test-auc:0.720348 
[144]	train-auc:0.749244	test-auc:0.720454 
[145]	train-auc:0.750944	test-auc:0.720597 
[146]	train-auc:0.751597	test-auc:0.720468 
[147]	train-auc:0.752796	test-auc:0.721689 
[148]	train-auc:0.753517	test-auc:0.721478 
[149]	train-auc:0.754576	test-auc:0.722584 
[150]	train-auc:0.755946	test-auc:0.723203 
[151]	train-auc:0.757699	test-auc:0.723220 
[152]	train-auc:0.759158	test-auc:0.723620 
[153]	train-auc:0.760504	test-auc:0.724134 
[154]	train-auc:0.761662	test-auc:0.724359 
[155]	train-auc:0.763254	test-auc:0.724499 
[156]	train-auc:0.764916	test-auc:0.724703 
[157]	train-auc:0.766112	test-auc:0.725057 
[158]	train-auc:0.766891	test-auc:0.724972 
[159]	train-auc:0.767887	test-auc:0.725409 
[160]	train-auc:0.768790	test-auc:0.725439 
[161]	train-auc:0.769485	test-auc:0.726094 
[162]	train-auc:0.771909	test-auc:0.726310 
[163]	train-auc:0.774032	test-auc:0.726623 
[164]	train-auc:0.775297	test-auc:0.726524 
[165]	train-auc:0.775966	test-auc:0.727216 
[166]	train-auc:0.777204	test-auc:0.727501 
[167]	train-auc:0.778686	test-auc:0.727040 
[168]	train-auc:0.779148	test-auc:0.727053 
[169]	train-auc:0.780289	test-auc:0.726900 
[170]	train-auc:0.781113	test-auc:0.727307 
[171]	train-auc:0.781855	test-auc:0.727546 
[172]	train-auc:0.783970	test-auc:0.729213 
[173]	train-auc:0.785931	test-auc:0.730275 
[174]	train-auc:0.787447	test-auc:0.730287 
[175]	train-auc:0.788464	test-auc:0.730322 
[176]	train-auc:0.789917	test-auc:0.730690 
[177]	train-auc:0.790826	test-auc:0.731149 
[178]	train-auc:0.791287	test-auc:0.731134 
[179]	train-auc:0.793410	test-auc:0.731867 
[180]	train-auc:0.795594	test-auc:0.732348 
[181]	train-auc:0.797386	test-auc:0.732572 
[182]	train-auc:0.798900	test-auc:0.733125 
[183]	train-auc:0.799588	test-auc:0.733448 
[184]	train-auc:0.801897	test-auc:0.734540 
[185]	train-auc:0.802575	test-auc:0.734998 
[186]	train-auc:0.804567	test-auc:0.735756 
[187]	train-auc:0.805609	test-auc:0.736081 
[188]	train-auc:0.806959	test-auc:0.736344 
[189]	train-auc:0.807786	test-auc:0.736932 
[190]	train-auc:0.808965	test-auc:0.737443 
[191]	train-auc:0.810645	test-auc:0.737707 
[192]	train-auc:0.811162	test-auc:0.738112 
[193]	train-auc:0.812757	test-auc:0.738658 
[194]	train-auc:0.813782	test-auc:0.738616 
[195]	train-auc:0.814061	test-auc:0.739000 
[196]	train-auc:0.815349	test-auc:0.739062 
[197]	train-auc:0.816842	test-auc:0.739646 
[198]	train-auc:0.818020	test-auc:0.740127 
[199]	train-auc:0.819510	test-auc:0.740034 
[200]	train-auc:0.820817	test-auc:0.740431 
[201]	train-auc:0.822059	test-auc:0.740495 
[202]	train-auc:0.823387	test-auc:0.740576 
[203]	train-auc:0.824388	test-auc:0.740891 
[204]	train-auc:0.825636	test-auc:0.741097 
[205]	train-auc:0.826730	test-auc:0.741105 
[206]	train-auc:0.827538	test-auc:0.741361 
[207]	train-auc:0.828701	test-auc:0.741335 
[208]	train-auc:0.830055	test-auc:0.741592 
[209]	train-auc:0.830875	test-auc:0.741768 
[210]	train-auc:0.832130	test-auc:0.741806 
[211]	train-auc:0.833035	test-auc:0.741852 
[212]	train-auc:0.834445	test-auc:0.742076 
[213]	train-auc:0.835484	test-auc:0.742106 
[214]	train-auc:0.836136	test-auc:0.742178 
[215]	train-auc:0.837129	test-auc:0.742497 
[216]	train-auc:0.838023	test-auc:0.742665 
[217]	train-auc:0.838838	test-auc:0.742870 
[218]	train-auc:0.839588	test-auc:0.743040 
[219]	train-auc:0.840626	test-auc:0.743436 
[220]	train-auc:0.841462	test-auc:0.743930 
[221]	train-auc:0.844016	test-auc:0.744380 
[222]	train-auc:0.844811	test-auc:0.744530 
[223]	train-auc:0.846687	test-auc:0.744683 
[224]	train-auc:0.847871	test-auc:0.744902 
[225]	train-auc:0.848695	test-auc:0.745051 
[226]	train-auc:0.850655	test-auc:0.745540 
[227]	train-auc:0.851532	test-auc:0.745688 
[228]	train-auc:0.852187	test-auc:0.746017 
[229]	train-auc:0.853828	test-auc:0.746095 
[230]	train-auc:0.855185	test-auc:0.746715 
[231]	train-auc:0.856403	test-auc:0.746772 
[232]	train-auc:0.857797	test-auc:0.747276 
[233]	train-auc:0.858795	test-auc:0.747214 
[234]	train-auc:0.860497	test-auc:0.747491 
[235]	train-auc:0.861906	test-auc:0.747957 
[236]	train-auc:0.863044	test-auc:0.748235 
[237]	train-auc:0.864368	test-auc:0.748473 
[238]	train-auc:0.865711	test-auc:0.748603 
[239]	train-auc:0.867688	test-auc:0.748757 
[240]	train-auc:0.869368	test-auc:0.748853 
[241]	train-auc:0.870528	test-auc:0.748987 
[242]	train-auc:0.871647	test-auc:0.749537 
[243]	train-auc:0.873023	test-auc:0.749660 
[244]	train-auc:0.874041	test-auc:0.750070 
[245]	train-auc:0.875294	test-auc:0.749970 
[246]	train-auc:0.876758	test-auc:0.750079 
[247]	train-auc:0.877855	test-auc:0.750017 
[248]	train-auc:0.879373	test-auc:0.749998 
[249]	train-auc:0.880761	test-auc:0.750072 
[250]	train-auc:0.882296	test-auc:0.750222 
[251]	train-auc:0.883848	test-auc:0.750981 
[252]	train-auc:0.884898	test-auc:0.751066 
[253]	train-auc:0.886211	test-auc:0.751703 
[254]	train-auc:0.887522	test-auc:0.751626 
[255]	train-auc:0.889333	test-auc:0.752008 
[256]	train-auc:0.890366	test-auc:0.752221 
[257]	train-auc:0.891995	test-auc:0.752909 
[258]	train-auc:0.893314	test-auc:0.753308 
[259]	train-auc:0.894368	test-auc:0.753303 
[260]	train-auc:0.895480	test-auc:0.753818 
[261]	train-auc:0.896577	test-auc:0.753805 
[262]	train-auc:0.897632	test-auc:0.753729 
[263]	train-auc:0.898412	test-auc:0.753820 
[264]	train-auc:0.899000	test-auc:0.753577 
[265]	train-auc:0.900101	test-auc:0.753743 
[266]	train-auc:0.900722	test-auc:0.753750 
[267]	train-auc:0.902166	test-auc:0.753844 
[268]	train-auc:0.903114	test-auc:0.754111 
[269]	train-auc:0.903838	test-auc:0.754133 
[270]	train-auc:0.904462	test-auc:0.754174 
[271]	train-auc:0.905461	test-auc:0.753915 
[272]	train-auc:0.905739	test-auc:0.753906 
[273]	train-auc:0.906618	test-auc:0.753822 
[274]	train-auc:0.907453	test-auc:0.754295 
[275]	train-auc:0.908177	test-auc:0.754282 
[276]	train-auc:0.908651	test-auc:0.754583 
[277]	train-auc:0.909302	test-auc:0.754388 
[278]	train-auc:0.909512	test-auc:0.754451 
[279]	train-auc:0.909843	test-auc:0.754321 
[280]	train-auc:0.910184	test-auc:0.754126 
[281]	train-auc:0.910345	test-auc:0.754297 
[282]	train-auc:0.910545	test-auc:0.754266 
[283]	train-auc:0.910713	test-auc:0.754270 
[284]	train-auc:0.910997	test-auc:0.754338 
[285]	train-auc:0.911658	test-auc:0.754383 
[286]	train-auc:0.911882	test-auc:0.754458 
[287]	train-auc:0.912100	test-auc:0.754534 
[288]	train-auc:0.912660	test-auc:0.754691 
[289]	train-auc:0.912876	test-auc:0.754750 
[290]	train-auc:0.913027	test-auc:0.754638 
[291]	train-auc:0.913431	test-auc:0.754622 
[292]	train-auc:0.913875	test-auc:0.754628 
[293]	train-auc:0.914066	test-auc:0.754572 
[294]	train-auc:0.914233	test-auc:0.754688 
[295]	train-auc:0.914431	test-auc:0.754691 
[296]	train-auc:0.914771	test-auc:0.754877 
[297]	train-auc:0.915062	test-auc:0.754815 
[298]	train-auc:0.915856	test-auc:0.754914 
[299]	train-auc:0.915856	test-auc:0.754973 
[300]	train-auc:0.916194	test-auc:0.755140 
[301]	train-auc:0.917069	test-auc:0.755300 
[302]	train-auc:0.917196	test-auc:0.755272 
[303]	train-auc:0.917808	test-auc:0.755302 
[304]	train-auc:0.917960	test-auc:0.755378 
[305]	train-auc:0.918534	test-auc:0.755326 
[306]	train-auc:0.918650	test-auc:0.755288 
[307]	train-auc:0.919592	test-auc:0.755502 
[308]	train-auc:0.919994	test-auc:0.755634 
[309]	train-auc:0.920683	test-auc:0.755836 
[310]	train-auc:0.920808	test-auc:0.755795 
[311]	train-auc:0.921744	test-auc:0.755629 
[312]	train-auc:0.922023	test-auc:0.755627 
[313]	train-auc:0.922590	test-auc:0.755491 
[314]	train-auc:0.923124	test-auc:0.755679 
[315]	train-auc:0.923500	test-auc:0.755779 
[316]	train-auc:0.923706	test-auc:0.755820 
[317]	train-auc:0.923831	test-auc:0.755849 
[318]	train-auc:0.924178	test-auc:0.755639 
[319]	train-auc:0.924840	test-auc:0.755646 
[320]	train-auc:0.924959	test-auc:0.755582 
[321]	train-auc:0.925239	test-auc:0.755643 
[322]	train-auc:0.925820	test-auc:0.755721 
[323]	train-auc:0.926155	test-auc:0.755823 
[324]	train-auc:0.926528	test-auc:0.755932 
[325]	train-auc:0.926719	test-auc:0.756157 
[326]	train-auc:0.926928	test-auc:0.756248 
[327]	train-auc:0.926981	test-auc:0.756272 
[328]	train-auc:0.927128	test-auc:0.756278 
[329]	train-auc:0.927364	test-auc:0.756201 
[330]	train-auc:0.927549	test-auc:0.756297 
[331]	train-auc:0.927740	test-auc:0.756322 
[332]	train-auc:0.928053	test-auc:0.756237 
[333]	train-auc:0.928704	test-auc:0.756385 
[334]	train-auc:0.928964	test-auc:0.756486 
[335]	train-auc:0.929195	test-auc:0.756448 
[336]	train-auc:0.929405	test-auc:0.756411 
[337]	train-auc:0.929581	test-auc:0.756517 
[338]	train-auc:0.930091	test-auc:0.756529 
[339]	train-auc:0.930156	test-auc:0.756625 
[340]	train-auc:0.931538	test-auc:0.756657 
[341]	train-auc:0.931808	test-auc:0.756537 
[342]	train-auc:0.932065	test-auc:0.756515 
[343]	train-auc:0.932408	test-auc:0.756905 
[344]	train-auc:0.932538	test-auc:0.756947 
[345]	train-auc:0.932652	test-auc:0.756923 
[346]	train-auc:0.932742	test-auc:0.757000 
[347]	train-auc:0.933074	test-auc:0.757018 
[348]	train-auc:0.933431	test-auc:0.757011 
[349]	train-auc:0.933639	test-auc:0.756886 
[350]	train-auc:0.933800	test-auc:0.756759 
[351]	train-auc:0.934032	test-auc:0.756824 
[352]	train-auc:0.934103	test-auc:0.756771 
[353]	train-auc:0.934642	test-auc:0.756911 
[354]	train-auc:0.934827	test-auc:0.756860 
[355]	train-auc:0.934962	test-auc:0.756892 
[356]	train-auc:0.935489	test-auc:0.757055 
[357]	train-auc:0.935947	test-auc:0.757157 
[358]	train-auc:0.936101	test-auc:0.757157 
[359]	train-auc:0.936445	test-auc:0.757382 
[360]	train-auc:0.936788	test-auc:0.757516 
[361]	train-auc:0.936891	test-auc:0.757374 
[362]	train-auc:0.937065	test-auc:0.757284 
[363]	train-auc:0.937138	test-auc:0.757315 
[364]	train-auc:0.937513	test-auc:0.757373 
[365]	train-auc:0.937677	test-auc:0.757389 
[366]	train-auc:0.937930	test-auc:0.757242 
[367]	train-auc:0.938365	test-auc:0.757332 
[368]	train-auc:0.938476	test-auc:0.757199 
[369]	train-auc:0.938700	test-auc:0.757122 
[370]	train-auc:0.938841	test-auc:0.757144 
[371]	train-auc:0.939035	test-auc:0.757060 
[372]	train-auc:0.939205	test-auc:0.757056 
[373]	train-auc:0.939369	test-auc:0.757080 
[374]	train-auc:0.939638	test-auc:0.757034 
[375]	train-auc:0.940032	test-auc:0.757141 
[376]	train-auc:0.940111	test-auc:0.756989 
[377]	train-auc:0.940213	test-auc:0.756907 
[378]	train-auc:0.940679	test-auc:0.757041 
[379]	train-auc:0.940969	test-auc:0.757173 
[380]	train-auc:0.941147	test-auc:0.757155 
[381]	train-auc:0.941654	test-auc:0.757377 
[382]	train-auc:0.942015	test-auc:0.757407 
[383]	train-auc:0.942308	test-auc:0.757393 
[384]	train-auc:0.942580	test-auc:0.757571 
[385]	train-auc:0.942758	test-auc:0.757566 
[386]	train-auc:0.942863	test-auc:0.757477 
[387]	train-auc:0.943099	test-auc:0.757430 
[388]	train-auc:0.943220	test-auc:0.757406 
[389]	train-auc:0.943368	test-auc:0.757373 
[390]	train-auc:0.943570	test-auc:0.757303 
[391]	train-auc:0.943685	test-auc:0.757120 
[392]	train-auc:0.944065	test-auc:0.757201 
[393]	train-auc:0.944520	test-auc:0.757066 
[394]	train-auc:0.944838	test-auc:0.756894 
[395]	train-auc:0.944920	test-auc:0.756906 
[396]	train-auc:0.945106	test-auc:0.756919 
[397]	train-auc:0.945300	test-auc:0.756918 
[398]	train-auc:0.945546	test-auc:0.757034 
[399]	train-auc:0.945703	test-auc:0.757076 
[400]	train-auc:0.945784	test-auc:0.757151 
[401]	train-auc:0.945930	test-auc:0.757160 
[402]	train-auc:0.945999	test-auc:0.757142 
[403]	train-auc:0.946127	test-auc:0.757293 
[404]	train-auc:0.946311	test-auc:0.757256 
[405]	train-auc:0.946414	test-auc:0.757077 
[406]	train-auc:0.946486	test-auc:0.756988 
[407]	train-auc:0.946638	test-auc:0.756844 
[408]	train-auc:0.946675	test-auc:0.756840 
[409]	train-auc:0.946774	test-auc:0.756760 
[410]	train-auc:0.947020	test-auc:0.756712 
[411]	train-auc:0.947180	test-auc:0.756610 
[412]	train-auc:0.947440	test-auc:0.756557 
[413]	train-auc:0.947527	test-auc:0.756450 
[414]	train-auc:0.947669	test-auc:0.756403 
[415]	train-auc:0.947844	test-auc:0.756464 
[416]	train-auc:0.947979	test-auc:0.756398 
[417]	train-auc:0.948045	test-auc:0.756496 
[418]	train-auc:0.948109	test-auc:0.756510 
[419]	train-auc:0.948283	test-auc:0.756598 
[420]	train-auc:0.948466	test-auc:0.756522 
[421]	train-auc:0.948523	test-auc:0.756441 
[422]	train-auc:0.948590	test-auc:0.756433 
[423]	train-auc:0.948646	test-auc:0.756335 
[424]	train-auc:0.948924	test-auc:0.756386 
[425]	train-auc:0.948977	test-auc:0.756329 
[426]	train-auc:0.949037	test-auc:0.756259 
[427]	train-auc:0.949383	test-auc:0.756219 
[428]	train-auc:0.949400	test-auc:0.756221 
[429]	train-auc:0.949555	test-auc:0.756167 
[430]	train-auc:0.949659	test-auc:0.756090 
[431]	train-auc:0.949970	test-auc:0.756157 
[432]	train-auc:0.950119	test-auc:0.756168 
[433]	train-auc:0.950264	test-auc:0.756281 
[434]	train-auc:0.950434	test-auc:0.756217 
Stopping. Best iteration:
[384]	train-auc:0.942580	test-auc:0.757571




Fold 3

[1]	train-auc:0.596800	test-auc:0.591200 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.596800	test-auc:0.591201 
[3]	train-auc:0.596975	test-auc:0.591189 
[4]	train-auc:0.596974	test-auc:0.591191 
[5]	train-auc:0.596973	test-auc:0.591192 
[6]	train-auc:0.596974	test-auc:0.591195 
[7]	train-auc:0.596975	test-auc:0.591193 
[8]	train-auc:0.596968	test-auc:0.591195 
[9]	train-auc:0.596969	test-auc:0.591182 
[10]	train-auc:0.596969	test-auc:0.591183 
[11]	train-auc:0.596972	test-auc:0.591182 
[12]	train-auc:0.654130	test-auc:0.652522 
[13]	train-auc:0.654415	test-auc:0.652500 
[14]	train-auc:0.656044	test-auc:0.653607 
[15]	train-auc:0.656045	test-auc:0.653609 
[16]	train-auc:0.656045	test-auc:0.653609 
[17]	train-auc:0.656250	test-auc:0.653374 
[18]	train-auc:0.656246	test-auc:0.653369 
[19]	train-auc:0.656246	test-auc:0.653369 
[20]	train-auc:0.656308	test-auc:0.653370 
[21]	train-auc:0.657631	test-auc:0.653464 
[22]	train-auc:0.657393	test-auc:0.653114 
[23]	train-auc:0.657390	test-auc:0.653111 
[24]	train-auc:0.657531	test-auc:0.653102 
[25]	train-auc:0.657533	test-auc:0.653101 
[26]	train-auc:0.657770	test-auc:0.653444 
[27]	train-auc:0.657771	test-auc:0.653447 
[28]	train-auc:0.657765	test-auc:0.653441 
[29]	train-auc:0.657765	test-auc:0.653441 
[30]	train-auc:0.657767	test-auc:0.653441 
[31]	train-auc:0.657763	test-auc:0.653437 
[32]	train-auc:0.657756	test-auc:0.653423 
[33]	train-auc:0.657757	test-auc:0.653424 
[34]	train-auc:0.658725	test-auc:0.655695 
[35]	train-auc:0.658724	test-auc:0.655689 
[36]	train-auc:0.658725	test-auc:0.655689 
[37]	train-auc:0.658725	test-auc:0.655692 
[38]	train-auc:0.658724	test-auc:0.655693 
[39]	train-auc:0.658722	test-auc:0.655684 
[40]	train-auc:0.658722	test-auc:0.655681 
[41]	train-auc:0.658715	test-auc:0.655682 
[42]	train-auc:0.658714	test-auc:0.655679 
[43]	train-auc:0.659276	test-auc:0.655667 
[44]	train-auc:0.659278	test-auc:0.655670 
[45]	train-auc:0.659275	test-auc:0.655660 
[46]	train-auc:0.659272	test-auc:0.655661 
[47]	train-auc:0.659725	test-auc:0.656867 
[48]	train-auc:0.659723	test-auc:0.656868 
[49]	train-auc:0.659730	test-auc:0.656869 
[50]	train-auc:0.660041	test-auc:0.657514 
[51]	train-auc:0.660042	test-auc:0.657517 
[52]	train-auc:0.660041	test-auc:0.657507 
[53]	train-auc:0.660190	test-auc:0.657494 
[54]	train-auc:0.660189	test-auc:0.657496 
[55]	train-auc:0.660191	test-auc:0.657498 
[56]	train-auc:0.660190	test-auc:0.657497 
[57]	train-auc:0.660190	test-auc:0.657495 
[58]	train-auc:0.660190	test-auc:0.657493 
[59]	train-auc:0.660191	test-auc:0.657493 
[60]	train-auc:0.660193	test-auc:0.657499 
[61]	train-auc:0.660194	test-auc:0.657500 
[62]	train-auc:0.660191	test-auc:0.657485 
[63]	train-auc:0.660191	test-auc:0.657485 
[64]	train-auc:0.660182	test-auc:0.657473 
[65]	train-auc:0.660182	test-auc:0.657478 
[66]	train-auc:0.660177	test-auc:0.657473 
[67]	train-auc:0.660177	test-auc:0.657473 
[68]	train-auc:0.660178	test-auc:0.657474 
[69]	train-auc:0.660175	test-auc:0.657471 
[70]	train-auc:0.660158	test-auc:0.657457 
[71]	train-auc:0.660544	test-auc:0.657561 
[72]	train-auc:0.660645	test-auc:0.657546 
[73]	train-auc:0.661726	test-auc:0.657740 
[74]	train-auc:0.661721	test-auc:0.657741 
[75]	train-auc:0.661723	test-auc:0.657744 
[76]	train-auc:0.662273	test-auc:0.657859 
[77]	train-auc:0.677337	test-auc:0.670404 
[78]	train-auc:0.677339	test-auc:0.670392 
[79]	train-auc:0.677328	test-auc:0.670502 
[80]	train-auc:0.678011	test-auc:0.670003 
[81]	train-auc:0.678001	test-auc:0.670004 
[82]	train-auc:0.678137	test-auc:0.669992 
[83]	train-auc:0.678137	test-auc:0.669981 
[84]	train-auc:0.678392	test-auc:0.669965 
[85]	train-auc:0.678388	test-auc:0.669959 
[86]	train-auc:0.678576	test-auc:0.669948 
[87]	train-auc:0.678565	test-auc:0.670216 
[88]	train-auc:0.678487	test-auc:0.670259 
[89]	train-auc:0.678922	test-auc:0.670677 
[90]	train-auc:0.678914	test-auc:0.671046 
[91]	train-auc:0.679907	test-auc:0.671920 
[92]	train-auc:0.682375	test-auc:0.673904 
[93]	train-auc:0.682367	test-auc:0.673894 
[94]	train-auc:0.682387	test-auc:0.674266 
[95]	train-auc:0.682444	test-auc:0.674012 
[96]	train-auc:0.683049	test-auc:0.673958 
[97]	train-auc:0.683047	test-auc:0.673594 
[98]	train-auc:0.683065	test-auc:0.673583 
[99]	train-auc:0.683034	test-auc:0.673567 
[100]	train-auc:0.683471	test-auc:0.673720 
[101]	train-auc:0.699335	test-auc:0.683324 
[102]	train-auc:0.706268	test-auc:0.689826 
[103]	train-auc:0.706320	test-auc:0.689559 
[104]	train-auc:0.710197	test-auc:0.691080 
[105]	train-auc:0.710371	test-auc:0.690934 
[106]	train-auc:0.710541	test-auc:0.690908 
[107]	train-auc:0.710678	test-auc:0.690629 
[108]	train-auc:0.713339	test-auc:0.692744 
[109]	train-auc:0.714951	test-auc:0.693319 
[110]	train-auc:0.716936	test-auc:0.693860 
[111]	train-auc:0.717978	test-auc:0.694043 
[112]	train-auc:0.718620	test-auc:0.694697 
[113]	train-auc:0.719644	test-auc:0.695119 
[114]	train-auc:0.719640	test-auc:0.695016 
[115]	train-auc:0.719903	test-auc:0.694964 
[116]	train-auc:0.720322	test-auc:0.694946 
[117]	train-auc:0.720907	test-auc:0.696499 
[118]	train-auc:0.721374	test-auc:0.696792 
[119]	train-auc:0.721429	test-auc:0.696671 
[120]	train-auc:0.723788	test-auc:0.697319 
[121]	train-auc:0.724357	test-auc:0.696923 
[122]	train-auc:0.724991	test-auc:0.696876 
[123]	train-auc:0.726739	test-auc:0.696582 
[124]	train-auc:0.729149	test-auc:0.699269 
[125]	train-auc:0.729597	test-auc:0.699163 
[126]	train-auc:0.732113	test-auc:0.699899 
[127]	train-auc:0.732524	test-auc:0.700183 
[128]	train-auc:0.733037	test-auc:0.700451 
[129]	train-auc:0.733808	test-auc:0.700681 
[130]	train-auc:0.734657	test-auc:0.701155 
[131]	train-auc:0.735144	test-auc:0.701584 
[132]	train-auc:0.736553	test-auc:0.701919 
[133]	train-auc:0.737798	test-auc:0.701773 
[134]	train-auc:0.738917	test-auc:0.702130 
[135]	train-auc:0.739507	test-auc:0.702031 
[136]	train-auc:0.740408	test-auc:0.702781 
[137]	train-auc:0.741349	test-auc:0.703027 
[138]	train-auc:0.742668	test-auc:0.703206 
[139]	train-auc:0.743647	test-auc:0.703478 
[140]	train-auc:0.744629	test-auc:0.703724 
[141]	train-auc:0.745955	test-auc:0.703836 
[142]	train-auc:0.747991	test-auc:0.704624 
[143]	train-auc:0.749743	test-auc:0.705793 
[144]	train-auc:0.750535	test-auc:0.706507 
[145]	train-auc:0.751869	test-auc:0.707062 
[146]	train-auc:0.753441	test-auc:0.707782 
[147]	train-auc:0.755972	test-auc:0.709633 
[148]	train-auc:0.757121	test-auc:0.710199 
[149]	train-auc:0.757865	test-auc:0.710628 
[150]	train-auc:0.758375	test-auc:0.710805 
[151]	train-auc:0.759442	test-auc:0.710977 
[152]	train-auc:0.760149	test-auc:0.711315 
[153]	train-auc:0.760629	test-auc:0.711477 
[154]	train-auc:0.762289	test-auc:0.712096 
[155]	train-auc:0.762977	test-auc:0.712866 
[156]	train-auc:0.764283	test-auc:0.713223 
[157]	train-auc:0.764839	test-auc:0.713478 
[158]	train-auc:0.766615	test-auc:0.714958 
[159]	train-auc:0.771596	test-auc:0.716306 
[160]	train-auc:0.773494	test-auc:0.717528 
[161]	train-auc:0.776525	test-auc:0.717463 
[162]	train-auc:0.778327	test-auc:0.717869 
[163]	train-auc:0.779104	test-auc:0.716658 
[164]	train-auc:0.781638	test-auc:0.719405 
[165]	train-auc:0.784127	test-auc:0.719959 
[166]	train-auc:0.787637	test-auc:0.719877 
[167]	train-auc:0.789182	test-auc:0.720806 
[168]	train-auc:0.790817	test-auc:0.719166 
[169]	train-auc:0.791740	test-auc:0.719684 
[170]	train-auc:0.793769	test-auc:0.720468 
[171]	train-auc:0.795766	test-auc:0.722128 
[172]	train-auc:0.797150	test-auc:0.722407 
[173]	train-auc:0.798262	test-auc:0.722242 
[174]	train-auc:0.799526	test-auc:0.722707 
[175]	train-auc:0.801271	test-auc:0.721504 
[176]	train-auc:0.802752	test-auc:0.722256 
[177]	train-auc:0.804170	test-auc:0.722534 
[178]	train-auc:0.805465	test-auc:0.722097 
[179]	train-auc:0.807625	test-auc:0.722516 
[180]	train-auc:0.809129	test-auc:0.722581 
[181]	train-auc:0.810355	test-auc:0.723328 
[182]	train-auc:0.811022	test-auc:0.723159 
[183]	train-auc:0.811966	test-auc:0.723241 
[184]	train-auc:0.813581	test-auc:0.723041 
[185]	train-auc:0.814580	test-auc:0.723424 
[186]	train-auc:0.815339	test-auc:0.723473 
[187]	train-auc:0.816294	test-auc:0.723586 
[188]	train-auc:0.818425	test-auc:0.724765 
[189]	train-auc:0.819103	test-auc:0.724887 
[190]	train-auc:0.820227	test-auc:0.724653 
[191]	train-auc:0.821531	test-auc:0.724915 
[192]	train-auc:0.821974	test-auc:0.724781 
[193]	train-auc:0.822806	test-auc:0.725180 
[194]	train-auc:0.823613	test-auc:0.725600 
[195]	train-auc:0.825171	test-auc:0.726402 
[196]	train-auc:0.826961	test-auc:0.727534 
[197]	train-auc:0.828183	test-auc:0.727987 
[198]	train-auc:0.829588	test-auc:0.728915 
[199]	train-auc:0.830855	test-auc:0.729148 
[200]	train-auc:0.831874	test-auc:0.729605 
[201]	train-auc:0.833034	test-auc:0.729915 
[202]	train-auc:0.834676	test-auc:0.730129 
[203]	train-auc:0.835779	test-auc:0.730418 
[204]	train-auc:0.836695	test-auc:0.730609 
[205]	train-auc:0.837183	test-auc:0.730716 
[206]	train-auc:0.838314	test-auc:0.730867 
[207]	train-auc:0.839144	test-auc:0.731167 
[208]	train-auc:0.839915	test-auc:0.731021 
[209]	train-auc:0.841230	test-auc:0.731324 
[210]	train-auc:0.841913	test-auc:0.731613 
[211]	train-auc:0.842519	test-auc:0.731686 
[212]	train-auc:0.843821	test-auc:0.731842 
[213]	train-auc:0.844667	test-auc:0.731780 
[214]	train-auc:0.846006	test-auc:0.731929 
[215]	train-auc:0.846561	test-auc:0.731874 
[216]	train-auc:0.848029	test-auc:0.732043 
[217]	train-auc:0.849358	test-auc:0.732118 
[218]	train-auc:0.851332	test-auc:0.732217 
[219]	train-auc:0.851769	test-auc:0.732134 
[220]	train-auc:0.852354	test-auc:0.732287 
[221]	train-auc:0.854004	test-auc:0.732481 
[222]	train-auc:0.854698	test-auc:0.732473 
[223]	train-auc:0.855583	test-auc:0.732672 
[224]	train-auc:0.856393	test-auc:0.732457 
[225]	train-auc:0.858023	test-auc:0.732644 
[226]	train-auc:0.859095	test-auc:0.732727 
[227]	train-auc:0.860604	test-auc:0.732762 
[228]	train-auc:0.861315	test-auc:0.732939 
[229]	train-auc:0.862416	test-auc:0.732900 
[230]	train-auc:0.863435	test-auc:0.732942 
[231]	train-auc:0.864550	test-auc:0.732953 
[232]	train-auc:0.865392	test-auc:0.733240 
[233]	train-auc:0.866232	test-auc:0.733256 
[234]	train-auc:0.866993	test-auc:0.733460 
[235]	train-auc:0.867876	test-auc:0.733521 
[236]	train-auc:0.869193	test-auc:0.733796 
[237]	train-auc:0.870551	test-auc:0.734185 
[238]	train-auc:0.871586	test-auc:0.734400 
[239]	train-auc:0.872575	test-auc:0.734363 
[240]	train-auc:0.874797	test-auc:0.734698 
[241]	train-auc:0.875948	test-auc:0.734570 
[242]	train-auc:0.877410	test-auc:0.734618 
[243]	train-auc:0.878368	test-auc:0.734872 
[244]	train-auc:0.879802	test-auc:0.734703 
[245]	train-auc:0.881142	test-auc:0.734769 
[246]	train-auc:0.882360	test-auc:0.734854 
[247]	train-auc:0.883562	test-auc:0.734827 
[248]	train-auc:0.884273	test-auc:0.734958 
[249]	train-auc:0.884897	test-auc:0.735038 
[250]	train-auc:0.885847	test-auc:0.735052 
[251]	train-auc:0.886369	test-auc:0.735191 
[252]	train-auc:0.887553	test-auc:0.735426 
[253]	train-auc:0.888511	test-auc:0.735808 
[254]	train-auc:0.889148	test-auc:0.736214 
[255]	train-auc:0.889850	test-auc:0.736489 
[256]	train-auc:0.890487	test-auc:0.736599 
[257]	train-auc:0.891601	test-auc:0.736436 
[258]	train-auc:0.892328	test-auc:0.736736 
[259]	train-auc:0.893117	test-auc:0.736979 
[260]	train-auc:0.894317	test-auc:0.737049 
[261]	train-auc:0.895094	test-auc:0.736963 
[262]	train-auc:0.895866	test-auc:0.736767 
[263]	train-auc:0.896435	test-auc:0.736799 
[264]	train-auc:0.897569	test-auc:0.736993 
[265]	train-auc:0.898228	test-auc:0.736796 
[266]	train-auc:0.899179	test-auc:0.736973 
[267]	train-auc:0.899713	test-auc:0.737234 
[268]	train-auc:0.900252	test-auc:0.737252 
[269]	train-auc:0.900799	test-auc:0.737426 
[270]	train-auc:0.901011	test-auc:0.737404 
[271]	train-auc:0.901152	test-auc:0.737492 
[272]	train-auc:0.901892	test-auc:0.737337 
[273]	train-auc:0.902168	test-auc:0.737518 
[274]	train-auc:0.902296	test-auc:0.737562 
[275]	train-auc:0.902757	test-auc:0.737851 
[276]	train-auc:0.903438	test-auc:0.738008 
[277]	train-auc:0.903702	test-auc:0.737928 
[278]	train-auc:0.903777	test-auc:0.738081 
[279]	train-auc:0.904620	test-auc:0.738298 
[280]	train-auc:0.904694	test-auc:0.738325 
[281]	train-auc:0.905516	test-auc:0.738380 
[282]	train-auc:0.906011	test-auc:0.738418 
[283]	train-auc:0.906547	test-auc:0.738383 
[284]	train-auc:0.907180	test-auc:0.738584 
[285]	train-auc:0.907775	test-auc:0.738614 
[286]	train-auc:0.908149	test-auc:0.738475 
[287]	train-auc:0.908310	test-auc:0.738511 
[288]	train-auc:0.908855	test-auc:0.738535 
[289]	train-auc:0.909270	test-auc:0.738491 
[290]	train-auc:0.909672	test-auc:0.738380 
[291]	train-auc:0.910416	test-auc:0.738465 
[292]	train-auc:0.910431	test-auc:0.738510 
[293]	train-auc:0.910462	test-auc:0.738508 
[294]	train-auc:0.910998	test-auc:0.738415 
[295]	train-auc:0.911673	test-auc:0.738437 
[296]	train-auc:0.911794	test-auc:0.738379 
[297]	train-auc:0.912303	test-auc:0.738443 
[298]	train-auc:0.912501	test-auc:0.738414 
[299]	train-auc:0.912761	test-auc:0.738495 
[300]	train-auc:0.913355	test-auc:0.738546 
[301]	train-auc:0.913822	test-auc:0.738601 
[302]	train-auc:0.914391	test-auc:0.738574 
[303]	train-auc:0.914797	test-auc:0.738653 
[304]	train-auc:0.915091	test-auc:0.738578 
[305]	train-auc:0.915788	test-auc:0.738473 
[306]	train-auc:0.916054	test-auc:0.738586 
[307]	train-auc:0.916526	test-auc:0.738594 
[308]	train-auc:0.916879	test-auc:0.738690 
[309]	train-auc:0.917297	test-auc:0.738820 
[310]	train-auc:0.918268	test-auc:0.738862 
[311]	train-auc:0.918474	test-auc:0.738988 
[312]	train-auc:0.918653	test-auc:0.738969 
[313]	train-auc:0.919204	test-auc:0.738937 
[314]	train-auc:0.919586	test-auc:0.738836 
[315]	train-auc:0.919650	test-auc:0.738850 
[316]	train-auc:0.919873	test-auc:0.738797 
[317]	train-auc:0.920196	test-auc:0.738811 
[318]	train-auc:0.920660	test-auc:0.738710 
[319]	train-auc:0.921231	test-auc:0.739101 
[320]	train-auc:0.921336	test-auc:0.739169 
[321]	train-auc:0.921557	test-auc:0.739247 
[322]	train-auc:0.921888	test-auc:0.739175 
[323]	train-auc:0.922012	test-auc:0.739170 
[324]	train-auc:0.922296	test-auc:0.739202 
[325]	train-auc:0.922909	test-auc:0.738996 
[326]	train-auc:0.923115	test-auc:0.739015 
[327]	train-auc:0.923656	test-auc:0.739016 
[328]	train-auc:0.923861	test-auc:0.739104 
[329]	train-auc:0.924207	test-auc:0.738923 
[330]	train-auc:0.924856	test-auc:0.738838 
[331]	train-auc:0.924967	test-auc:0.738792 
[332]	train-auc:0.925199	test-auc:0.738836 
[333]	train-auc:0.925387	test-auc:0.738852 
[334]	train-auc:0.925584	test-auc:0.738895 
[335]	train-auc:0.925768	test-auc:0.738995 
[336]	train-auc:0.925873	test-auc:0.739036 
[337]	train-auc:0.925942	test-auc:0.739072 
[338]	train-auc:0.926283	test-auc:0.739079 
[339]	train-auc:0.926500	test-auc:0.739063 
[340]	train-auc:0.926747	test-auc:0.738945 
[341]	train-auc:0.926811	test-auc:0.738942 
[342]	train-auc:0.927136	test-auc:0.739028 
[343]	train-auc:0.927304	test-auc:0.738989 
[344]	train-auc:0.927722	test-auc:0.739026 
[345]	train-auc:0.928068	test-auc:0.738954 
[346]	train-auc:0.928273	test-auc:0.739001 
[347]	train-auc:0.928472	test-auc:0.739106 
[348]	train-auc:0.928608	test-auc:0.739122 
[349]	train-auc:0.928908	test-auc:0.739068 
[350]	train-auc:0.929099	test-auc:0.739197 
[351]	train-auc:0.929676	test-auc:0.739204 
[352]	train-auc:0.929855	test-auc:0.739069 
[353]	train-auc:0.929928	test-auc:0.739123 
[354]	train-auc:0.930198	test-auc:0.739132 
[355]	train-auc:0.930543	test-auc:0.739046 
[356]	train-auc:0.930712	test-auc:0.738979 
[357]	train-auc:0.931429	test-auc:0.739052 
[358]	train-auc:0.931635	test-auc:0.739043 
[359]	train-auc:0.931778	test-auc:0.739095 
[360]	train-auc:0.931831	test-auc:0.739064 
[361]	train-auc:0.932102	test-auc:0.738961 
[362]	train-auc:0.932096	test-auc:0.739044 
[363]	train-auc:0.932392	test-auc:0.738938 
[364]	train-auc:0.932567	test-auc:0.738783 
[365]	train-auc:0.932709	test-auc:0.738776 
[366]	train-auc:0.932944	test-auc:0.738797 
[367]	train-auc:0.933029	test-auc:0.738929 
[368]	train-auc:0.933204	test-auc:0.738955 
[369]	train-auc:0.933678	test-auc:0.738955 
[370]	train-auc:0.933737	test-auc:0.738961 
[371]	train-auc:0.934028	test-auc:0.739096 
Stopping. Best iteration:
[321]	train-auc:0.921557	test-auc:0.739247




Fold 4

[1]	train-auc:0.595066	test-auc:0.593101 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.594687	test-auc:0.593475 
[3]	train-auc:0.594688	test-auc:0.593474 
[4]	train-auc:0.594689	test-auc:0.593475 
[5]	train-auc:0.594694	test-auc:0.593478 
[6]	train-auc:0.594880	test-auc:0.593843 
[7]	train-auc:0.594882	test-auc:0.593844 
[8]	train-auc:0.655000	test-auc:0.645069 
[9]	train-auc:0.655002	test-auc:0.645071 
[10]	train-auc:0.655240	test-auc:0.644392 
[11]	train-auc:0.655631	test-auc:0.644296 
[12]	train-auc:0.655627	test-auc:0.644291 
[13]	train-auc:0.655627	test-auc:0.644292 
[14]	train-auc:0.655627	test-auc:0.644292 
[15]	train-auc:0.655628	test-auc:0.644292 
[16]	train-auc:0.655675	test-auc:0.644280 
[17]	train-auc:0.655676	test-auc:0.644281 
[18]	train-auc:0.655677	test-auc:0.644281 
[19]	train-auc:0.655780	test-auc:0.644274 
[20]	train-auc:0.655781	test-auc:0.644274 
[21]	train-auc:0.656101	test-auc:0.645359 
[22]	train-auc:0.656098	test-auc:0.645362 
[23]	train-auc:0.656154	test-auc:0.645361 
[24]	train-auc:0.656222	test-auc:0.644868 
[25]	train-auc:0.656223	test-auc:0.644870 
[26]	train-auc:0.656425	test-auc:0.644837 
[27]	train-auc:0.656525	test-auc:0.644828 
[28]	train-auc:0.660549	test-auc:0.645603 
[29]	train-auc:0.663499	test-auc:0.649671 
[30]	train-auc:0.664619	test-auc:0.651391 
[31]	train-auc:0.664856	test-auc:0.651080 
[32]	train-auc:0.664853	test-auc:0.651074 
[33]	train-auc:0.664857	test-auc:0.651078 
[34]	train-auc:0.664846	test-auc:0.651075 
[35]	train-auc:0.664847	test-auc:0.651076 
[36]	train-auc:0.664829	test-auc:0.651063 
[37]	train-auc:0.664828	test-auc:0.651063 
[38]	train-auc:0.664819	test-auc:0.651056 
[39]	train-auc:0.664823	test-auc:0.651057 
[40]	train-auc:0.665502	test-auc:0.653450 
[41]	train-auc:0.665546	test-auc:0.653562 
[42]	train-auc:0.665546	test-auc:0.653562 
[43]	train-auc:0.665547	test-auc:0.653562 
[44]	train-auc:0.665880	test-auc:0.653946 
[45]	train-auc:0.665880	test-auc:0.653948 
[46]	train-auc:0.665873	test-auc:0.653944 
[47]	train-auc:0.665867	test-auc:0.653937 
[48]	train-auc:0.665873	test-auc:0.653947 
[49]	train-auc:0.666156	test-auc:0.653944 
[50]	train-auc:0.666155	test-auc:0.653944 
[51]	train-auc:0.666151	test-auc:0.653936 
[52]	train-auc:0.666150	test-auc:0.653930 
[53]	train-auc:0.666153	test-auc:0.653931 
[54]	train-auc:0.679427	test-auc:0.665088 
[55]	train-auc:0.679420	test-auc:0.665081 
[56]	train-auc:0.679419	test-auc:0.665078 
[57]	train-auc:0.679422	test-auc:0.665081 
[58]	train-auc:0.679417	test-auc:0.665072 
[59]	train-auc:0.679426	test-auc:0.665084 
[60]	train-auc:0.679560	test-auc:0.665089 
[61]	train-auc:0.679556	test-auc:0.665090 
[62]	train-auc:0.679559	test-auc:0.665091 
[63]	train-auc:0.679564	test-auc:0.665092 
[64]	train-auc:0.679565	test-auc:0.665093 
[65]	train-auc:0.679563	test-auc:0.665094 
[66]	train-auc:0.680971	test-auc:0.665794 
[67]	train-auc:0.680965	test-auc:0.665796 
[68]	train-auc:0.682077	test-auc:0.667039 
[69]	train-auc:0.682072	test-auc:0.667025 
[70]	train-auc:0.682071	test-auc:0.667020 
[71]	train-auc:0.682073	test-auc:0.667024 
[72]	train-auc:0.682994	test-auc:0.667652 
[73]	train-auc:0.682968	test-auc:0.667616 
[74]	train-auc:0.683163	test-auc:0.667633 
[75]	train-auc:0.683155	test-auc:0.667623 
[76]	train-auc:0.683269	test-auc:0.667624 
[77]	train-auc:0.684284	test-auc:0.667667 
[78]	train-auc:0.684286	test-auc:0.667668 
[79]	train-auc:0.684274	test-auc:0.667668 
[80]	train-auc:0.684294	test-auc:0.667727 
[81]	train-auc:0.684499	test-auc:0.667747 
[82]	train-auc:0.695272	test-auc:0.680734 
[83]	train-auc:0.695276	test-auc:0.680714 
[84]	train-auc:0.695691	test-auc:0.680852 
[85]	train-auc:0.695914	test-auc:0.681116 
[86]	train-auc:0.696091	test-auc:0.681362 
[87]	train-auc:0.700980	test-auc:0.684763 
[88]	train-auc:0.701053	test-auc:0.684718 
[89]	train-auc:0.701774	test-auc:0.685289 
[90]	train-auc:0.701943	test-auc:0.685647 
[91]	train-auc:0.702097	test-auc:0.685648 
[92]	train-auc:0.702102	test-auc:0.685617 
[93]	train-auc:0.702007	test-auc:0.685448 
[94]	train-auc:0.702516	test-auc:0.685621 
[95]	train-auc:0.708038	test-auc:0.689601 
[96]	train-auc:0.708164	test-auc:0.689671 
[97]	train-auc:0.708279	test-auc:0.689618 
[98]	train-auc:0.709388	test-auc:0.691085 
[99]	train-auc:0.709499	test-auc:0.691109 
[100]	train-auc:0.709498	test-auc:0.691490 
[101]	train-auc:0.709867	test-auc:0.691668 
[102]	train-auc:0.712029	test-auc:0.692826 
[103]	train-auc:0.713397	test-auc:0.693509 
[104]	train-auc:0.715298	test-auc:0.694828 
[105]	train-auc:0.716325	test-auc:0.695620 
[106]	train-auc:0.716300	test-auc:0.695672 
[107]	train-auc:0.716614	test-auc:0.695596 
[108]	train-auc:0.719066	test-auc:0.697692 
[109]	train-auc:0.719881	test-auc:0.697672 
[110]	train-auc:0.722506	test-auc:0.698625 
[111]	train-auc:0.724630	test-auc:0.698786 
[112]	train-auc:0.725486	test-auc:0.698787 
[113]	train-auc:0.725939	test-auc:0.699272 
[114]	train-auc:0.726653	test-auc:0.699277 
[115]	train-auc:0.727002	test-auc:0.698967 
[116]	train-auc:0.726745	test-auc:0.699196 
[117]	train-auc:0.727063	test-auc:0.698916 
[118]	train-auc:0.727868	test-auc:0.698871 
[119]	train-auc:0.728022	test-auc:0.698890 
[120]	train-auc:0.728147	test-auc:0.698561 
[121]	train-auc:0.729594	test-auc:0.700937 
[122]	train-auc:0.729900	test-auc:0.701288 
[123]	train-auc:0.732904	test-auc:0.702329 
[124]	train-auc:0.736411	test-auc:0.702479 
[125]	train-auc:0.737597	test-auc:0.702517 
[126]	train-auc:0.738681	test-auc:0.702649 
[127]	train-auc:0.739759	test-auc:0.703259 
[128]	train-auc:0.739974	test-auc:0.703165 
[129]	train-auc:0.740759	test-auc:0.703398 
[130]	train-auc:0.741196	test-auc:0.703175 
[131]	train-auc:0.741885	test-auc:0.703348 
[132]	train-auc:0.741534	test-auc:0.703071 
[133]	train-auc:0.742018	test-auc:0.703287 
[134]	train-auc:0.742672	test-auc:0.703198 
[135]	train-auc:0.743457	test-auc:0.703067 
[136]	train-auc:0.744309	test-auc:0.703935 
[137]	train-auc:0.744664	test-auc:0.704170 
[138]	train-auc:0.744939	test-auc:0.704358 
[139]	train-auc:0.745437	test-auc:0.705008 
[140]	train-auc:0.746172	test-auc:0.705051 
[141]	train-auc:0.746239	test-auc:0.705023 
[142]	train-auc:0.747139	test-auc:0.705567 
[143]	train-auc:0.748236	test-auc:0.706099 
[144]	train-auc:0.748557	test-auc:0.705860 
[145]	train-auc:0.750142	test-auc:0.707215 
[146]	train-auc:0.750901	test-auc:0.707327 
[147]	train-auc:0.753776	test-auc:0.709247 
[148]	train-auc:0.754739	test-auc:0.709545 
[149]	train-auc:0.756543	test-auc:0.709935 
[150]	train-auc:0.757975	test-auc:0.710166 
[151]	train-auc:0.759652	test-auc:0.710596 
[152]	train-auc:0.760793	test-auc:0.710873 
[153]	train-auc:0.762263	test-auc:0.711526 
[154]	train-auc:0.763679	test-auc:0.712108 
[155]	train-auc:0.764968	test-auc:0.712346 
[156]	train-auc:0.766277	test-auc:0.712540 
[157]	train-auc:0.766959	test-auc:0.712891 
[158]	train-auc:0.768828	test-auc:0.713668 
[159]	train-auc:0.769991	test-auc:0.714534 
[160]	train-auc:0.770831	test-auc:0.714719 
[161]	train-auc:0.772527	test-auc:0.714956 
[162]	train-auc:0.773227	test-auc:0.714832 
[163]	train-auc:0.774947	test-auc:0.715376 
[164]	train-auc:0.775595	test-auc:0.715513 
[165]	train-auc:0.776027	test-auc:0.715262 
[166]	train-auc:0.777451	test-auc:0.715714 
[167]	train-auc:0.777986	test-auc:0.716224 
[168]	train-auc:0.779183	test-auc:0.716329 
[169]	train-auc:0.780782	test-auc:0.716775 
[170]	train-auc:0.782216	test-auc:0.717093 
[171]	train-auc:0.783666	test-auc:0.717400 
[172]	train-auc:0.785704	test-auc:0.719716 
[173]	train-auc:0.786872	test-auc:0.720056 
[174]	train-auc:0.787877	test-auc:0.720104 
[175]	train-auc:0.788269	test-auc:0.720059 
[176]	train-auc:0.788837	test-auc:0.720626 
[177]	train-auc:0.790707	test-auc:0.720390 
[178]	train-auc:0.791803	test-auc:0.720743 
[179]	train-auc:0.793146	test-auc:0.721219 
[180]	train-auc:0.794204	test-auc:0.721223 
[181]	train-auc:0.796510	test-auc:0.721308 
[182]	train-auc:0.798515	test-auc:0.721442 
[183]	train-auc:0.800407	test-auc:0.722204 
[184]	train-auc:0.801689	test-auc:0.722291 
[185]	train-auc:0.802850	test-auc:0.722722 
[186]	train-auc:0.804003	test-auc:0.723110 
[187]	train-auc:0.805519	test-auc:0.723438 
[188]	train-auc:0.806541	test-auc:0.723624 
[189]	train-auc:0.807934	test-auc:0.723336 
[190]	train-auc:0.809184	test-auc:0.723753 
[191]	train-auc:0.810380	test-auc:0.723635 
[192]	train-auc:0.811610	test-auc:0.724465 
[193]	train-auc:0.812867	test-auc:0.724806 
[194]	train-auc:0.813910	test-auc:0.725672 
[195]	train-auc:0.815063	test-auc:0.725495 
[196]	train-auc:0.815866	test-auc:0.725990 
[197]	train-auc:0.816905	test-auc:0.726327 
[198]	train-auc:0.818035	test-auc:0.727450 
[199]	train-auc:0.819332	test-auc:0.727608 
[200]	train-auc:0.820960	test-auc:0.729142 
[201]	train-auc:0.821866	test-auc:0.730044 
[202]	train-auc:0.824551	test-auc:0.731102 
[203]	train-auc:0.825698	test-auc:0.731390 
[204]	train-auc:0.827464	test-auc:0.731730 
[205]	train-auc:0.828914	test-auc:0.731899 
[206]	train-auc:0.830057	test-auc:0.731799 
[207]	train-auc:0.831849	test-auc:0.731964 
[208]	train-auc:0.832916	test-auc:0.732111 
[209]	train-auc:0.834306	test-auc:0.732373 
[210]	train-auc:0.835231	test-auc:0.732867 
[211]	train-auc:0.837261	test-auc:0.733270 
[212]	train-auc:0.838501	test-auc:0.733468 
[213]	train-auc:0.840234	test-auc:0.733647 
[214]	train-auc:0.841525	test-auc:0.734042 
[215]	train-auc:0.843037	test-auc:0.734575 
[216]	train-auc:0.844245	test-auc:0.734998 
[217]	train-auc:0.845863	test-auc:0.735350 
[218]	train-auc:0.846971	test-auc:0.735702 
[219]	train-auc:0.847909	test-auc:0.736287 
[220]	train-auc:0.849568	test-auc:0.736454 
[221]	train-auc:0.850748	test-auc:0.736550 
[222]	train-auc:0.851634	test-auc:0.736718 
[223]	train-auc:0.852412	test-auc:0.736862 
[224]	train-auc:0.853211	test-auc:0.736785 
[225]	train-auc:0.854231	test-auc:0.737246 
[226]	train-auc:0.856810	test-auc:0.737798 
[227]	train-auc:0.857793	test-auc:0.738347 
[228]	train-auc:0.860246	test-auc:0.738707 
[229]	train-auc:0.861060	test-auc:0.738898 
[230]	train-auc:0.861721	test-auc:0.738789 
[231]	train-auc:0.862583	test-auc:0.739292 
[232]	train-auc:0.864612	test-auc:0.739861 
[233]	train-auc:0.865886	test-auc:0.740231 
[234]	train-auc:0.867481	test-auc:0.740258 
[235]	train-auc:0.868903	test-auc:0.740513 
[236]	train-auc:0.869983	test-auc:0.740992 
[237]	train-auc:0.871101	test-auc:0.740896 
[238]	train-auc:0.872581	test-auc:0.741367 
[239]	train-auc:0.873861	test-auc:0.741567 
[240]	train-auc:0.874796	test-auc:0.741851 
[241]	train-auc:0.876057	test-auc:0.741804 
[242]	train-auc:0.877323	test-auc:0.741997 
[243]	train-auc:0.878539	test-auc:0.742558 
[244]	train-auc:0.879716	test-auc:0.742740 
[245]	train-auc:0.881230	test-auc:0.742947 
[246]	train-auc:0.882009	test-auc:0.743102 
[247]	train-auc:0.883161	test-auc:0.743137 
[248]	train-auc:0.884561	test-auc:0.743265 
[249]	train-auc:0.886330	test-auc:0.743411 
[250]	train-auc:0.887647	test-auc:0.743648 
[251]	train-auc:0.888730	test-auc:0.743693 
[252]	train-auc:0.890090	test-auc:0.743633 
[253]	train-auc:0.891242	test-auc:0.743916 
[254]	train-auc:0.892011	test-auc:0.744082 
[255]	train-auc:0.892685	test-auc:0.743992 
[256]	train-auc:0.893503	test-auc:0.744220 
[257]	train-auc:0.894175	test-auc:0.744388 
[258]	train-auc:0.894710	test-auc:0.744407 
[259]	train-auc:0.895382	test-auc:0.744584 
[260]	train-auc:0.896980	test-auc:0.744530 
[261]	train-auc:0.897364	test-auc:0.744525 
[262]	train-auc:0.898201	test-auc:0.744512 
[263]	train-auc:0.898829	test-auc:0.744344 
[264]	train-auc:0.899748	test-auc:0.744464 
[265]	train-auc:0.900353	test-auc:0.744705 
[266]	train-auc:0.901391	test-auc:0.744929 
[267]	train-auc:0.902005	test-auc:0.745127 
[268]	train-auc:0.902633	test-auc:0.745140 
[269]	train-auc:0.903325	test-auc:0.745235 
[270]	train-auc:0.904028	test-auc:0.745259 
[271]	train-auc:0.905091	test-auc:0.745424 
[272]	train-auc:0.905620	test-auc:0.745379 
[273]	train-auc:0.906104	test-auc:0.745434 
[274]	train-auc:0.906744	test-auc:0.745487 
[275]	train-auc:0.906868	test-auc:0.745592 
[276]	train-auc:0.907273	test-auc:0.745773 
[277]	train-auc:0.907473	test-auc:0.745882 
[278]	train-auc:0.907683	test-auc:0.746038 
[279]	train-auc:0.907940	test-auc:0.746134 
[280]	train-auc:0.908681	test-auc:0.746201 
[281]	train-auc:0.908813	test-auc:0.746265 
[282]	train-auc:0.909324	test-auc:0.746259 
[283]	train-auc:0.909724	test-auc:0.746293 
[284]	train-auc:0.909837	test-auc:0.746284 
[285]	train-auc:0.910520	test-auc:0.746386 
[286]	train-auc:0.910788	test-auc:0.746235 
[287]	train-auc:0.911008	test-auc:0.746381 
[288]	train-auc:0.911853	test-auc:0.746317 
[289]	train-auc:0.912172	test-auc:0.746388 
[290]	train-auc:0.912658	test-auc:0.746437 
[291]	train-auc:0.913356	test-auc:0.746305 
[292]	train-auc:0.913588	test-auc:0.746301 
[293]	train-auc:0.914170	test-auc:0.746391 
[294]	train-auc:0.914381	test-auc:0.746465 
[295]	train-auc:0.914924	test-auc:0.746444 
[296]	train-auc:0.915305	test-auc:0.746471 
[297]	train-auc:0.915850	test-auc:0.746634 
[298]	train-auc:0.916198	test-auc:0.746689 
[299]	train-auc:0.916642	test-auc:0.746737 
[300]	train-auc:0.916812	test-auc:0.746769 
[301]	train-auc:0.917142	test-auc:0.746798 
[302]	train-auc:0.917552	test-auc:0.746628 
[303]	train-auc:0.918157	test-auc:0.746526 
[304]	train-auc:0.918632	test-auc:0.746524 
[305]	train-auc:0.918785	test-auc:0.746635 
[306]	train-auc:0.919426	test-auc:0.746631 
[307]	train-auc:0.919755	test-auc:0.746639 
[308]	train-auc:0.920015	test-auc:0.746745 
[309]	train-auc:0.920253	test-auc:0.746792 
[310]	train-auc:0.920498	test-auc:0.746984 
[311]	train-auc:0.921094	test-auc:0.747000 
[312]	train-auc:0.921245	test-auc:0.746998 
[313]	train-auc:0.921909	test-auc:0.746962 
[314]	train-auc:0.922165	test-auc:0.747087 
[315]	train-auc:0.922355	test-auc:0.747016 
[316]	train-auc:0.923025	test-auc:0.747000 
[317]	train-auc:0.923380	test-auc:0.746959 
[318]	train-auc:0.924029	test-auc:0.746940 
[319]	train-auc:0.924304	test-auc:0.746993 
[320]	train-auc:0.924589	test-auc:0.747047 
[321]	train-auc:0.924722	test-auc:0.747008 
[322]	train-auc:0.924960	test-auc:0.747091 
[323]	train-auc:0.925117	test-auc:0.747100 
[324]	train-auc:0.925366	test-auc:0.747152 
[325]	train-auc:0.925865	test-auc:0.747130 
[326]	train-auc:0.926008	test-auc:0.747107 
[327]	train-auc:0.926240	test-auc:0.747096 
[328]	train-auc:0.926632	test-auc:0.747083 
[329]	train-auc:0.927247	test-auc:0.747102 
[330]	train-auc:0.927565	test-auc:0.747147 
[331]	train-auc:0.927769	test-auc:0.747096 
[332]	train-auc:0.927980	test-auc:0.747020 
[333]	train-auc:0.928628	test-auc:0.747016 
[334]	train-auc:0.928924	test-auc:0.747007 
[335]	train-auc:0.929255	test-auc:0.746845 
[336]	train-auc:0.929496	test-auc:0.746872 
[337]	train-auc:0.929672	test-auc:0.746893 
[338]	train-auc:0.929723	test-auc:0.746914 
[339]	train-auc:0.929990	test-auc:0.746787 
[340]	train-auc:0.930520	test-auc:0.746778 
[341]	train-auc:0.930747	test-auc:0.746743 
[342]	train-auc:0.931182	test-auc:0.746823 
[343]	train-auc:0.931248	test-auc:0.746937 
[344]	train-auc:0.931313	test-auc:0.747040 
[345]	train-auc:0.931472	test-auc:0.747053 
[346]	train-auc:0.931718	test-auc:0.747127 
[347]	train-auc:0.931824	test-auc:0.747146 
[348]	train-auc:0.932004	test-auc:0.747241 
[349]	train-auc:0.932567	test-auc:0.747270 
[350]	train-auc:0.932867	test-auc:0.747220 
[351]	train-auc:0.933340	test-auc:0.747345 
[352]	train-auc:0.933814	test-auc:0.747361 
[353]	train-auc:0.934029	test-auc:0.747361 
[354]	train-auc:0.934253	test-auc:0.747368 
[355]	train-auc:0.934460	test-auc:0.747367 
[356]	train-auc:0.934620	test-auc:0.747433 
[357]	train-auc:0.934704	test-auc:0.747393 
[358]	train-auc:0.934797	test-auc:0.747450 
[359]	train-auc:0.934963	test-auc:0.747459 
[360]	train-auc:0.935208	test-auc:0.747516 
[361]	train-auc:0.935497	test-auc:0.747557 
[362]	train-auc:0.935689	test-auc:0.747558 
[363]	train-auc:0.936399	test-auc:0.747651 
[364]	train-auc:0.936472	test-auc:0.747658 
[365]	train-auc:0.936634	test-auc:0.747755 
[366]	train-auc:0.936782	test-auc:0.747778 
[367]	train-auc:0.936838	test-auc:0.747786 
[368]	train-auc:0.936992	test-auc:0.747852 
[369]	train-auc:0.937527	test-auc:0.747845 
[370]	train-auc:0.937688	test-auc:0.747842 
[371]	train-auc:0.938502	test-auc:0.748023 
[372]	train-auc:0.938642	test-auc:0.747948 
[373]	train-auc:0.938715	test-auc:0.747926 
[374]	train-auc:0.938894	test-auc:0.747850 
[375]	train-auc:0.939061	test-auc:0.747932 
[376]	train-auc:0.939149	test-auc:0.747926 
[377]	train-auc:0.939387	test-auc:0.747868 
[378]	train-auc:0.939523	test-auc:0.748038 
[379]	train-auc:0.939669	test-auc:0.748031 
[380]	train-auc:0.939941	test-auc:0.748150 
[381]	train-auc:0.940050	test-auc:0.748199 
[382]	train-auc:0.940385	test-auc:0.748111 
[383]	train-auc:0.940629	test-auc:0.748116 
[384]	train-auc:0.940764	test-auc:0.748165 
[385]	train-auc:0.941181	test-auc:0.748315 
[386]	train-auc:0.941313	test-auc:0.748441 
[387]	train-auc:0.941589	test-auc:0.748311 
[388]	train-auc:0.941739	test-auc:0.748214 
[389]	train-auc:0.941827	test-auc:0.748207 
[390]	train-auc:0.941914	test-auc:0.748243 
[391]	train-auc:0.942003	test-auc:0.748197 
[392]	train-auc:0.942067	test-auc:0.748132 
[393]	train-auc:0.942130	test-auc:0.748116 
[394]	train-auc:0.942228	test-auc:0.748102 
[395]	train-auc:0.942251	test-auc:0.748120 
[396]	train-auc:0.942343	test-auc:0.748125 
[397]	train-auc:0.942423	test-auc:0.748185 
[398]	train-auc:0.942466	test-auc:0.748186 
[399]	train-auc:0.942538	test-auc:0.748207 
[400]	train-auc:0.942640	test-auc:0.748131 
[401]	train-auc:0.942715	test-auc:0.748176 
[402]	train-auc:0.942786	test-auc:0.748145 
[403]	train-auc:0.942994	test-auc:0.748116 
[404]	train-auc:0.943056	test-auc:0.748149 
[405]	train-auc:0.943213	test-auc:0.748141 
[406]	train-auc:0.943266	test-auc:0.748139 
[407]	train-auc:0.943525	test-auc:0.748003 
[408]	train-auc:0.943610	test-auc:0.748005 
[409]	train-auc:0.943677	test-auc:0.748060 
[410]	train-auc:0.943885	test-auc:0.747957 
[411]	train-auc:0.944005	test-auc:0.747966 
[412]	train-auc:0.944147	test-auc:0.747951 
[413]	train-auc:0.944374	test-auc:0.747995 
[414]	train-auc:0.944764	test-auc:0.747993 
[415]	train-auc:0.944916	test-auc:0.748022 
[416]	train-auc:0.945010	test-auc:0.747946 
[417]	train-auc:0.945080	test-auc:0.747951 
[418]	train-auc:0.945260	test-auc:0.747813 
[419]	train-auc:0.945467	test-auc:0.747781 
[420]	train-auc:0.945822	test-auc:0.747996 
[421]	train-auc:0.945904	test-auc:0.747933 
[422]	train-auc:0.945944	test-auc:0.747952 
[423]	train-auc:0.946621	test-auc:0.747938 
[424]	train-auc:0.946709	test-auc:0.747907 
[425]	train-auc:0.947268	test-auc:0.747890 
[426]	train-auc:0.947365	test-auc:0.747848 
[427]	train-auc:0.947416	test-auc:0.747845 
[428]	train-auc:0.947562	test-auc:0.747890 
[429]	train-auc:0.947829	test-auc:0.748044 
[430]	train-auc:0.948186	test-auc:0.747971 
[431]	train-auc:0.948320	test-auc:0.747914 
[432]	train-auc:0.948419	test-auc:0.748002 
[433]	train-auc:0.948498	test-auc:0.748092 
[434]	train-auc:0.948534	test-auc:0.748043 
[435]	train-auc:0.948579	test-auc:0.748083 
[436]	train-auc:0.948632	test-auc:0.748060 
Stopping. Best iteration:
[386]	train-auc:0.941313	test-auc:0.748441




Fold 5

[1]	train-auc:0.595646	test-auc:0.591197 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.595096	test-auc:0.590783 
[3]	train-auc:0.596084	test-auc:0.591483 
[4]	train-auc:0.596087	test-auc:0.591484 
[5]	train-auc:0.596624	test-auc:0.591897 
[6]	train-auc:0.596624	test-auc:0.591894 
[7]	train-auc:0.596624	test-auc:0.591894 
[8]	train-auc:0.596626	test-auc:0.591895 
[9]	train-auc:0.596622	test-auc:0.591890 
[10]	train-auc:0.596621	test-auc:0.591888 
[11]	train-auc:0.596622	test-auc:0.591887 
[12]	train-auc:0.596617	test-auc:0.591882 
[13]	train-auc:0.596919	test-auc:0.590751 
[14]	train-auc:0.596914	test-auc:0.590746 
[15]	train-auc:0.596915	test-auc:0.590746 
[16]	train-auc:0.596909	test-auc:0.590729 
[17]	train-auc:0.596906	test-auc:0.590723 
[18]	train-auc:0.599432	test-auc:0.592349 
[19]	train-auc:0.658705	test-auc:0.649950 
[20]	train-auc:0.659876	test-auc:0.651075 
[21]	train-auc:0.659878	test-auc:0.651078 
[22]	train-auc:0.659982	test-auc:0.651074 
[23]	train-auc:0.662691	test-auc:0.654476 
[24]	train-auc:0.662739	test-auc:0.654473 
[25]	train-auc:0.662740	test-auc:0.654473 
[26]	train-auc:0.662908	test-auc:0.654453 
[27]	train-auc:0.663557	test-auc:0.654936 
[28]	train-auc:0.663848	test-auc:0.654923 
[29]	train-auc:0.663845	test-auc:0.654925 
[30]	train-auc:0.663846	test-auc:0.654924 
[31]	train-auc:0.663847	test-auc:0.654922 
[32]	train-auc:0.664280	test-auc:0.654898 
[33]	train-auc:0.664280	test-auc:0.654897 
[34]	train-auc:0.664270	test-auc:0.654890 
[35]	train-auc:0.664434	test-auc:0.654869 
[36]	train-auc:0.664423	test-auc:0.654860 
[37]	train-auc:0.664425	test-auc:0.654863 
[38]	train-auc:0.664414	test-auc:0.654853 
[39]	train-auc:0.664414	test-auc:0.654853 
[40]	train-auc:0.664416	test-auc:0.654854 
[41]	train-auc:0.664413	test-auc:0.654851 
[42]	train-auc:0.664414	test-auc:0.654851 
[43]	train-auc:0.664395	test-auc:0.654840 
[44]	train-auc:0.664402	test-auc:0.654850 
[45]	train-auc:0.664410	test-auc:0.654848 
[46]	train-auc:0.664402	test-auc:0.654840 
[47]	train-auc:0.664394	test-auc:0.654827 
[48]	train-auc:0.665137	test-auc:0.655241 
[49]	train-auc:0.665136	test-auc:0.655238 
[50]	train-auc:0.665138	test-auc:0.655238 
[51]	train-auc:0.666022	test-auc:0.656166 
[52]	train-auc:0.666021	test-auc:0.656162 
[53]	train-auc:0.666020	test-auc:0.656155 
[54]	train-auc:0.666027	test-auc:0.656160 
[55]	train-auc:0.666026	test-auc:0.656160 
[56]	train-auc:0.666026	test-auc:0.656160 
[57]	train-auc:0.666026	test-auc:0.656160 
[58]	train-auc:0.666029	test-auc:0.656164 
[59]	train-auc:0.666031	test-auc:0.656165 
[60]	train-auc:0.666028	test-auc:0.656162 
[61]	train-auc:0.666025	test-auc:0.656153 
[62]	train-auc:0.666024	test-auc:0.656150 
[63]	train-auc:0.666025	test-auc:0.656151 
[64]	train-auc:0.666018	test-auc:0.656725 
[65]	train-auc:0.666018	test-auc:0.656717 
[66]	train-auc:0.666017	test-auc:0.656715 
[67]	train-auc:0.666012	test-auc:0.656709 
[68]	train-auc:0.667069	test-auc:0.657084 
[69]	train-auc:0.667357	test-auc:0.657117 
[70]	train-auc:0.667376	test-auc:0.657133 
[71]	train-auc:0.667365	test-auc:0.657124 
[72]	train-auc:0.667362	test-auc:0.657117 
[73]	train-auc:0.667361	test-auc:0.657113 
[74]	train-auc:0.667357	test-auc:0.657100 
[75]	train-auc:0.667352	test-auc:0.657094 
[76]	train-auc:0.667292	test-auc:0.656826 
[77]	train-auc:0.680917	test-auc:0.668720 
[78]	train-auc:0.680931	test-auc:0.668725 
[79]	train-auc:0.680950	test-auc:0.668778 
[80]	train-auc:0.680944	test-auc:0.668775 
[81]	train-auc:0.680936	test-auc:0.668773 
[82]	train-auc:0.680945	test-auc:0.668779 
[83]	train-auc:0.681059	test-auc:0.668988 
[84]	train-auc:0.682214	test-auc:0.671290 
[85]	train-auc:0.682522	test-auc:0.671665 
[86]	train-auc:0.682527	test-auc:0.671662 
[87]	train-auc:0.683105	test-auc:0.672192 
[88]	train-auc:0.683611	test-auc:0.671650 
[89]	train-auc:0.683759	test-auc:0.671828 
[90]	train-auc:0.683764	test-auc:0.671822 
[91]	train-auc:0.683750	test-auc:0.671819 
[92]	train-auc:0.684468	test-auc:0.671805 
[93]	train-auc:0.685000	test-auc:0.672512 
[94]	train-auc:0.685901	test-auc:0.673293 
[95]	train-auc:0.694190	test-auc:0.675778 
[96]	train-auc:0.696754	test-auc:0.677970 
[97]	train-auc:0.696812	test-auc:0.678023 
[98]	train-auc:0.696871	test-auc:0.677977 
[99]	train-auc:0.696913	test-auc:0.677973 
[100]	train-auc:0.697933	test-auc:0.678559 
[101]	train-auc:0.698629	test-auc:0.678497 
[102]	train-auc:0.698872	test-auc:0.678634 
[103]	train-auc:0.699344	test-auc:0.677997 
[104]	train-auc:0.699505	test-auc:0.677926 
[105]	train-auc:0.703842	test-auc:0.680755 
[106]	train-auc:0.704084	test-auc:0.680308 
[107]	train-auc:0.705172	test-auc:0.680490 
[108]	train-auc:0.707393	test-auc:0.681579 
[109]	train-auc:0.717655	test-auc:0.690851 
[110]	train-auc:0.718995	test-auc:0.691766 
[111]	train-auc:0.719392	test-auc:0.692026 
[112]	train-auc:0.720090	test-auc:0.692462 
[113]	train-auc:0.722520	test-auc:0.694066 
[114]	train-auc:0.722772	test-auc:0.693949 
[115]	train-auc:0.723303	test-auc:0.694250 
[116]	train-auc:0.724518	test-auc:0.695025 
[117]	train-auc:0.725630	test-auc:0.697432 
[118]	train-auc:0.727226	test-auc:0.698236 
[119]	train-auc:0.728418	test-auc:0.698709 
[120]	train-auc:0.731737	test-auc:0.701069 
[121]	train-auc:0.733545	test-auc:0.701961 
[122]	train-auc:0.734728	test-auc:0.702005 
[123]	train-auc:0.735379	test-auc:0.702722 
[124]	train-auc:0.735725	test-auc:0.703189 
[125]	train-auc:0.736209	test-auc:0.703317 
[126]	train-auc:0.736856	test-auc:0.703233 
[127]	train-auc:0.738317	test-auc:0.703783 
[128]	train-auc:0.738593	test-auc:0.703986 
[129]	train-auc:0.738950	test-auc:0.703963 
[130]	train-auc:0.739585	test-auc:0.703647 
[131]	train-auc:0.741227	test-auc:0.704228 
[132]	train-auc:0.741602	test-auc:0.704389 
[133]	train-auc:0.742645	test-auc:0.704851 
[134]	train-auc:0.743292	test-auc:0.705282 
[135]	train-auc:0.744047	test-auc:0.706016 
[136]	train-auc:0.744527	test-auc:0.706074 
[137]	train-auc:0.745215	test-auc:0.705997 
[138]	train-auc:0.746110	test-auc:0.705852 
[139]	train-auc:0.746546	test-auc:0.706763 
[140]	train-auc:0.748221	test-auc:0.707319 
[141]	train-auc:0.748571	test-auc:0.707181 
[142]	train-auc:0.749380	test-auc:0.708239 
[143]	train-auc:0.749902	test-auc:0.708696 
[144]	train-auc:0.750580	test-auc:0.709340 
[145]	train-auc:0.752975	test-auc:0.709052 
[146]	train-auc:0.754779	test-auc:0.709552 
[147]	train-auc:0.755906	test-auc:0.710021 
[148]	train-auc:0.756647	test-auc:0.710035 
[149]	train-auc:0.758478	test-auc:0.710075 
[150]	train-auc:0.759323	test-auc:0.710038 
[151]	train-auc:0.760100	test-auc:0.710423 
[152]	train-auc:0.761160	test-auc:0.710662 
[153]	train-auc:0.762102	test-auc:0.710970 
[154]	train-auc:0.763097	test-auc:0.711126 
[155]	train-auc:0.763730	test-auc:0.710889 
[156]	train-auc:0.764055	test-auc:0.710801 
[157]	train-auc:0.767441	test-auc:0.712640 
[158]	train-auc:0.768981	test-auc:0.712779 
[159]	train-auc:0.770043	test-auc:0.713351 
[160]	train-auc:0.770846	test-auc:0.713621 
[161]	train-auc:0.772476	test-auc:0.713712 
[162]	train-auc:0.772893	test-auc:0.714089 
[163]	train-auc:0.773816	test-auc:0.713904 
[164]	train-auc:0.774176	test-auc:0.713904 
[165]	train-auc:0.775110	test-auc:0.714015 
[166]	train-auc:0.775982	test-auc:0.714379 
[167]	train-auc:0.776874	test-auc:0.714864 
[168]	train-auc:0.778409	test-auc:0.715355 
[169]	train-auc:0.778957	test-auc:0.715314 
[170]	train-auc:0.779955	test-auc:0.715665 
[171]	train-auc:0.783792	test-auc:0.719287 
[172]	train-auc:0.785404	test-auc:0.719754 
[173]	train-auc:0.786418	test-auc:0.720678 
[174]	train-auc:0.788974	test-auc:0.722762 
[175]	train-auc:0.790735	test-auc:0.723772 
[176]	train-auc:0.792087	test-auc:0.724485 
[177]	train-auc:0.793565	test-auc:0.724667 
[178]	train-auc:0.795734	test-auc:0.725517 
[179]	train-auc:0.797096	test-auc:0.725582 
[180]	train-auc:0.798068	test-auc:0.725509 
[181]	train-auc:0.799332	test-auc:0.725487 
[182]	train-auc:0.800458	test-auc:0.725671 
[183]	train-auc:0.802017	test-auc:0.725584 
[184]	train-auc:0.803610	test-auc:0.725714 
[185]	train-auc:0.804608	test-auc:0.725637 
[186]	train-auc:0.805676	test-auc:0.725727 
[187]	train-auc:0.806508	test-auc:0.725751 
[188]	train-auc:0.807310	test-auc:0.725553 
[189]	train-auc:0.808388	test-auc:0.725723 
[190]	train-auc:0.809670	test-auc:0.726292 
[191]	train-auc:0.810424	test-auc:0.726639 
[192]	train-auc:0.811318	test-auc:0.726855 
[193]	train-auc:0.812415	test-auc:0.727481 
[194]	train-auc:0.813405	test-auc:0.727879 
[195]	train-auc:0.814608	test-auc:0.728530 
[196]	train-auc:0.815716	test-auc:0.728538 
[197]	train-auc:0.816474	test-auc:0.728472 
[198]	train-auc:0.817173	test-auc:0.728642 
[199]	train-auc:0.818164	test-auc:0.728657 
[200]	train-auc:0.819070	test-auc:0.728998 
[201]	train-auc:0.819526	test-auc:0.729242 
[202]	train-auc:0.820577	test-auc:0.729812 
[203]	train-auc:0.821292	test-auc:0.729791 
[204]	train-auc:0.823104	test-auc:0.730466 
[205]	train-auc:0.824190	test-auc:0.731197 
[206]	train-auc:0.825126	test-auc:0.731486 
[207]	train-auc:0.825804	test-auc:0.731851 
[208]	train-auc:0.827228	test-auc:0.732259 
[209]	train-auc:0.828469	test-auc:0.732842 
[210]	train-auc:0.829478	test-auc:0.732926 
[211]	train-auc:0.830945	test-auc:0.733447 
[212]	train-auc:0.832167	test-auc:0.733654 
[213]	train-auc:0.834107	test-auc:0.734121 
[214]	train-auc:0.835008	test-auc:0.734330 
[215]	train-auc:0.835987	test-auc:0.734891 
[216]	train-auc:0.837007	test-auc:0.734977 
[217]	train-auc:0.838008	test-auc:0.734993 
[218]	train-auc:0.839836	test-auc:0.734932 
[219]	train-auc:0.841758	test-auc:0.734897 
[220]	train-auc:0.842659	test-auc:0.735126 
[221]	train-auc:0.843735	test-auc:0.735289 
[222]	train-auc:0.845172	test-auc:0.735742 
[223]	train-auc:0.847463	test-auc:0.736079 
[224]	train-auc:0.848673	test-auc:0.736359 
[225]	train-auc:0.850293	test-auc:0.736880 
[226]	train-auc:0.851452	test-auc:0.737116 
[227]	train-auc:0.852784	test-auc:0.737048 
[228]	train-auc:0.853701	test-auc:0.737272 
[229]	train-auc:0.854618	test-auc:0.737489 
[230]	train-auc:0.855403	test-auc:0.737830 
[231]	train-auc:0.856642	test-auc:0.738079 
[232]	train-auc:0.857331	test-auc:0.738258 
[233]	train-auc:0.858676	test-auc:0.738456 
[234]	train-auc:0.860083	test-auc:0.738545 
[235]	train-auc:0.861729	test-auc:0.738807 
[236]	train-auc:0.862914	test-auc:0.739151 
[237]	train-auc:0.863965	test-auc:0.739401 
[238]	train-auc:0.865637	test-auc:0.739481 
[239]	train-auc:0.866832	test-auc:0.739772 
[240]	train-auc:0.867879	test-auc:0.739768 
[241]	train-auc:0.868883	test-auc:0.739678 
[242]	train-auc:0.870156	test-auc:0.739651 
[243]	train-auc:0.871124	test-auc:0.739539 
[244]	train-auc:0.872456	test-auc:0.739970 
[245]	train-auc:0.873607	test-auc:0.739960 
[246]	train-auc:0.874738	test-auc:0.740191 
[247]	train-auc:0.875919	test-auc:0.740204 
[248]	train-auc:0.877040	test-auc:0.740146 
[249]	train-auc:0.877891	test-auc:0.740176 
[250]	train-auc:0.878525	test-auc:0.740221 
[251]	train-auc:0.879401	test-auc:0.740466 
[252]	train-auc:0.880303	test-auc:0.740645 
[253]	train-auc:0.881673	test-auc:0.740887 
[254]	train-auc:0.882752	test-auc:0.740931 
[255]	train-auc:0.883832	test-auc:0.741154 
[256]	train-auc:0.885436	test-auc:0.740942 
[257]	train-auc:0.886584	test-auc:0.741157 
[258]	train-auc:0.887590	test-auc:0.741418 
[259]	train-auc:0.888487	test-auc:0.741604 
[260]	train-auc:0.889787	test-auc:0.741624 
[261]	train-auc:0.890211	test-auc:0.741860 
[262]	train-auc:0.891339	test-auc:0.742031 
[263]	train-auc:0.892788	test-auc:0.742244 
[264]	train-auc:0.894041	test-auc:0.742221 
[265]	train-auc:0.894370	test-auc:0.742454 
[266]	train-auc:0.894662	test-auc:0.742506 
[267]	train-auc:0.895236	test-auc:0.742576 
[268]	train-auc:0.895725	test-auc:0.742661 
[269]	train-auc:0.896408	test-auc:0.742587 
[270]	train-auc:0.896615	test-auc:0.742764 
[271]	train-auc:0.897433	test-auc:0.742853 
[272]	train-auc:0.897687	test-auc:0.742958 
[273]	train-auc:0.898134	test-auc:0.743143 
[274]	train-auc:0.898389	test-auc:0.743264 
[275]	train-auc:0.899301	test-auc:0.743400 
[276]	train-auc:0.899649	test-auc:0.743451 
[277]	train-auc:0.899857	test-auc:0.743564 
[278]	train-auc:0.900797	test-auc:0.743583 
[279]	train-auc:0.901129	test-auc:0.743575 
[280]	train-auc:0.901329	test-auc:0.743563 
[281]	train-auc:0.902125	test-auc:0.743656 
[282]	train-auc:0.902546	test-auc:0.743719 
[283]	train-auc:0.902807	test-auc:0.743642 
[284]	train-auc:0.902992	test-auc:0.743724 
[285]	train-auc:0.903571	test-auc:0.743674 
[286]	train-auc:0.903832	test-auc:0.743723 
[287]	train-auc:0.904183	test-auc:0.743689 
[288]	train-auc:0.904348	test-auc:0.743638 
[289]	train-auc:0.904675	test-auc:0.743660 
[290]	train-auc:0.905120	test-auc:0.743672 
[291]	train-auc:0.905324	test-auc:0.743728 
[292]	train-auc:0.905945	test-auc:0.743678 
[293]	train-auc:0.906944	test-auc:0.743638 
[294]	train-auc:0.907082	test-auc:0.743520 
[295]	train-auc:0.907452	test-auc:0.743413 
[296]	train-auc:0.908114	test-auc:0.743528 
[297]	train-auc:0.908340	test-auc:0.743493 
[298]	train-auc:0.909340	test-auc:0.743646 
[299]	train-auc:0.909809	test-auc:0.743633 
[300]	train-auc:0.910723	test-auc:0.743694 
[301]	train-auc:0.911012	test-auc:0.743699 
[302]	train-auc:0.911344	test-auc:0.743520 
[303]	train-auc:0.912579	test-auc:0.743597 
[304]	train-auc:0.913043	test-auc:0.743663 
[305]	train-auc:0.913346	test-auc:0.743670 
[306]	train-auc:0.913519	test-auc:0.743608 
[307]	train-auc:0.913645	test-auc:0.743641 
[308]	train-auc:0.914032	test-auc:0.743695 
[309]	train-auc:0.914235	test-auc:0.743652 
[310]	train-auc:0.914649	test-auc:0.743681 
[311]	train-auc:0.915108	test-auc:0.743809 
[312]	train-auc:0.915315	test-auc:0.743753 
[313]	train-auc:0.915709	test-auc:0.743684 
[314]	train-auc:0.915881	test-auc:0.743820 
[315]	train-auc:0.916213	test-auc:0.744023 
[316]	train-auc:0.916344	test-auc:0.743982 
[317]	train-auc:0.916752	test-auc:0.744209 
[318]	train-auc:0.917148	test-auc:0.744225 
[319]	train-auc:0.917384	test-auc:0.744283 
[320]	train-auc:0.918469	test-auc:0.744326 
[321]	train-auc:0.919553	test-auc:0.744446 
[322]	train-auc:0.919946	test-auc:0.744662 
[323]	train-auc:0.920409	test-auc:0.744708 
[324]	train-auc:0.920618	test-auc:0.744681 
[325]	train-auc:0.920846	test-auc:0.744713 
[326]	train-auc:0.921027	test-auc:0.744787 
[327]	train-auc:0.921174	test-auc:0.744721 
[328]	train-auc:0.921528	test-auc:0.744650 
[329]	train-auc:0.921755	test-auc:0.744594 
[330]	train-auc:0.922208	test-auc:0.744446 
[331]	train-auc:0.922848	test-auc:0.744321 
[332]	train-auc:0.923235	test-auc:0.744539 
[333]	train-auc:0.923602	test-auc:0.744611 
[334]	train-auc:0.923751	test-auc:0.744555 
[335]	train-auc:0.923994	test-auc:0.744657 
[336]	train-auc:0.924606	test-auc:0.744633 
[337]	train-auc:0.924766	test-auc:0.744619 
[338]	train-auc:0.925330	test-auc:0.744501 
[339]	train-auc:0.925528	test-auc:0.744416 
[340]	train-auc:0.925996	test-auc:0.744409 
[341]	train-auc:0.926345	test-auc:0.744498 
[342]	train-auc:0.926476	test-auc:0.744534 
[343]	train-auc:0.926562	test-auc:0.744591 
[344]	train-auc:0.926852	test-auc:0.744521 
[345]	train-auc:0.927700	test-auc:0.744509 
[346]	train-auc:0.927955	test-auc:0.744767 
[347]	train-auc:0.928057	test-auc:0.744722 
[348]	train-auc:0.928359	test-auc:0.744707 
[349]	train-auc:0.928755	test-auc:0.744718 
[350]	train-auc:0.929079	test-auc:0.744799 
[351]	train-auc:0.929223	test-auc:0.744688 
[352]	train-auc:0.929356	test-auc:0.744744 
[353]	train-auc:0.929528	test-auc:0.744751 
[354]	train-auc:0.929661	test-auc:0.744586 
[355]	train-auc:0.929993	test-auc:0.744601 
[356]	train-auc:0.930325	test-auc:0.744720 
[357]	train-auc:0.930625	test-auc:0.744818 
[358]	train-auc:0.930660	test-auc:0.744774 
[359]	train-auc:0.930772	test-auc:0.744807 
[360]	train-auc:0.931043	test-auc:0.744902 
[361]	train-auc:0.931118	test-auc:0.744907 
[362]	train-auc:0.931226	test-auc:0.744839 
[363]	train-auc:0.931374	test-auc:0.744771 
[364]	train-auc:0.931534	test-auc:0.744718 
[365]	train-auc:0.931854	test-auc:0.744745 
[366]	train-auc:0.932163	test-auc:0.744920 
[367]	train-auc:0.932234	test-auc:0.744926 
[368]	train-auc:0.932371	test-auc:0.744828 
[369]	train-auc:0.932706	test-auc:0.744867 
[370]	train-auc:0.933019	test-auc:0.744933 
[371]	train-auc:0.933680	test-auc:0.744747 
[372]	train-auc:0.934025	test-auc:0.744779 
[373]	train-auc:0.934452	test-auc:0.744544 
[374]	train-auc:0.934723	test-auc:0.744541 
[375]	train-auc:0.935109	test-auc:0.744359 
[376]	train-auc:0.935302	test-auc:0.744364 
[377]	train-auc:0.935438	test-auc:0.744325 
[378]	train-auc:0.935692	test-auc:0.744355 
[379]	train-auc:0.935948	test-auc:0.744246 
[380]	train-auc:0.936198	test-auc:0.744158 
[381]	train-auc:0.936263	test-auc:0.744162 
[382]	train-auc:0.936396	test-auc:0.744082 
[383]	train-auc:0.936458	test-auc:0.744098 
[384]	train-auc:0.936513	test-auc:0.744084 
[385]	train-auc:0.936777	test-auc:0.744222 
[386]	train-auc:0.936898	test-auc:0.744188 
[387]	train-auc:0.937105	test-auc:0.744097 
[388]	train-auc:0.937386	test-auc:0.744103 
[389]	train-auc:0.937666	test-auc:0.744068 
[390]	train-auc:0.937833	test-auc:0.744290 
[391]	train-auc:0.938351	test-auc:0.744064 
[392]	train-auc:0.938611	test-auc:0.744080 
[393]	train-auc:0.938894	test-auc:0.744072 
[394]	train-auc:0.939172	test-auc:0.744009 
[395]	train-auc:0.939529	test-auc:0.744001 
[396]	train-auc:0.939781	test-auc:0.744011 
[397]	train-auc:0.939887	test-auc:0.743946 
[398]	train-auc:0.940075	test-auc:0.743905 
[399]	train-auc:0.940195	test-auc:0.743959 
[400]	train-auc:0.940327	test-auc:0.743869 
[401]	train-auc:0.940655	test-auc:0.743840 
[402]	train-auc:0.940711	test-auc:0.743830 
[403]	train-auc:0.940908	test-auc:0.743859 
[404]	train-auc:0.941022	test-auc:0.743822 
[405]	train-auc:0.941079	test-auc:0.743789 
[406]	train-auc:0.941199	test-auc:0.743798 
[407]	train-auc:0.941275	test-auc:0.743712 
[408]	train-auc:0.941386	test-auc:0.743720 
[409]	train-auc:0.941514	test-auc:0.743694 
[410]	train-auc:0.941596	test-auc:0.743787 
[411]	train-auc:0.941956	test-auc:0.743780 
[412]	train-auc:0.942256	test-auc:0.743762 
[413]	train-auc:0.942496	test-auc:0.743647 
[414]	train-auc:0.942917	test-auc:0.743595 
[415]	train-auc:0.942956	test-auc:0.743580 
[416]	train-auc:0.943448	test-auc:0.743790 
[417]	train-auc:0.943680	test-auc:0.743742 
[418]	train-auc:0.944267	test-auc:0.743725 
[419]	train-auc:0.944454	test-auc:0.743845 
[420]	train-auc:0.944577	test-auc:0.743829 
Stopping. Best iteration:
[370]	train-auc:0.933019	test-auc:0.744933


