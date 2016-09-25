```r
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1443987   77.2    2164898   115.7    2164898   115.7
Vcells 708677518 5406.8 2063167967 15740.8 1546747816 11800.8
> set.seed(11111)
> temp_model <- xgb.cv(data = dtrain,
+                      nthread = 6,
+                      nfold = 6,
+                      nrounds = 1000000,
+                      max_depth = 5,
+                      eta = 0.025,
+                      #gamma = 20,
+                      subsample = 1.0,
+                      colsample_bytree = 1.0,
+                      booster = "gbtree",
+                      eval_metric = mcc_eval,
+                      maximize = TRUE,
+                      early_stopping_rounds = 25,
+                      objective = "binary:logistic",
+                      verbose = TRUE,
+                      prediction = TRUE)
[1]	train-mcc:0.231710+0.003472	test-mcc:0.228046+0.010808 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 25 rounds.

[2]	train-mcc:0.232272+0.003657	test-mcc:0.228430+0.010551 
[3]	train-mcc:0.232705+0.003605	test-mcc:0.228789+0.010695 
[4]	train-mcc:0.232719+0.003547	test-mcc:0.229262+0.010902 
[5]	train-mcc:0.232925+0.003797	test-mcc:0.228642+0.010902 
[6]	train-mcc:0.233260+0.003809	test-mcc:0.228993+0.010984 
[7]	train-mcc:0.233381+0.003842	test-mcc:0.229318+0.011151 
[8]	train-mcc:0.234610+0.001864	test-mcc:0.230169+0.009119 
[9]	train-mcc:0.234463+0.002387	test-mcc:0.230151+0.009236 
[10]	train-mcc:0.234593+0.002841	test-mcc:0.230336+0.008945 
[11]	train-mcc:0.234944+0.002906	test-mcc:0.230305+0.008874 
[12]	train-mcc:0.234955+0.002880	test-mcc:0.229991+0.008997 
[13]	train-mcc:0.234974+0.002896	test-mcc:0.230359+0.009113 
[14]	train-mcc:0.234922+0.003024	test-mcc:0.230923+0.009328 
[15]	train-mcc:0.234919+0.002989	test-mcc:0.230899+0.009337 
[16]	train-mcc:0.234986+0.003006	test-mcc:0.230905+0.009261 
[17]	train-mcc:0.234998+0.003001	test-mcc:0.230850+0.009216 
[18]	train-mcc:0.235105+0.002790	test-mcc:0.230827+0.009241 
[19]	train-mcc:0.235236+0.002734	test-mcc:0.230845+0.009339 
[20]	train-mcc:0.235221+0.002696	test-mcc:0.231370+0.008333 
[21]	train-mcc:0.235811+0.002941	test-mcc:0.231312+0.008815 
[22]	train-mcc:0.235753+0.002921	test-mcc:0.231378+0.008767 
[23]	train-mcc:0.236651+0.003003	test-mcc:0.231719+0.008763 
[24]	train-mcc:0.236825+0.002892	test-mcc:0.232101+0.008633 
[25]	train-mcc:0.237182+0.002438	test-mcc:0.232792+0.008593 
[26]	train-mcc:0.237335+0.002616	test-mcc:0.232829+0.008332 
[27]	train-mcc:0.237604+0.002764	test-mcc:0.232963+0.008206 
[28]	train-mcc:0.237984+0.002885	test-mcc:0.233622+0.008049 
[29]	train-mcc:0.238233+0.002896	test-mcc:0.233825+0.007883 
[30]	train-mcc:0.238672+0.002805	test-mcc:0.234231+0.007850 
[31]	train-mcc:0.238849+0.003089	test-mcc:0.234207+0.007861 
[32]	train-mcc:0.239566+0.003051	test-mcc:0.234441+0.007812 
[33]	train-mcc:0.239454+0.003267	test-mcc:0.234658+0.007722 
[34]	train-mcc:0.239897+0.003807	test-mcc:0.234907+0.008122 
[35]	train-mcc:0.240756+0.002918	test-mcc:0.235029+0.008188 
[36]	train-mcc:0.240970+0.002752	test-mcc:0.235306+0.008348 
[37]	train-mcc:0.241042+0.002781	test-mcc:0.235430+0.008644 
[38]	train-mcc:0.240906+0.002919	test-mcc:0.235362+0.008463 
[39]	train-mcc:0.240969+0.003170	test-mcc:0.235633+0.008429 
[40]	train-mcc:0.241448+0.002771	test-mcc:0.236043+0.008601 
[41]	train-mcc:0.241423+0.002804	test-mcc:0.236110+0.008565 
[42]	train-mcc:0.241555+0.002772	test-mcc:0.236198+0.008679 
[43]	train-mcc:0.241604+0.002801	test-mcc:0.236228+0.008583 
[44]	train-mcc:0.241471+0.002691	test-mcc:0.236305+0.008516 
[45]	train-mcc:0.241837+0.002545	test-mcc:0.236138+0.008508 
[46]	train-mcc:0.241852+0.002418	test-mcc:0.236353+0.008630 
[47]	train-mcc:0.242187+0.002459	test-mcc:0.236419+0.008560 
[48]	train-mcc:0.242179+0.002325	test-mcc:0.236205+0.008601 
[49]	train-mcc:0.242422+0.002149	test-mcc:0.235934+0.008479 
[50]	train-mcc:0.242322+0.001741	test-mcc:0.236092+0.008585 
[51]	train-mcc:0.242421+0.001898	test-mcc:0.235789+0.008662 
[52]	train-mcc:0.243594+0.002159	test-mcc:0.236246+0.008729 
[53]	train-mcc:0.243633+0.002107	test-mcc:0.235927+0.008962 
[54]	train-mcc:0.244261+0.002152	test-mcc:0.236126+0.008966 
[55]	train-mcc:0.244517+0.002419	test-mcc:0.236352+0.008960 
[56]	train-mcc:0.244826+0.002589	test-mcc:0.236099+0.009035 
[57]	train-mcc:0.244951+0.002537	test-mcc:0.235910+0.008731 
[58]	train-mcc:0.245374+0.003019	test-mcc:0.236305+0.008979 
[59]	train-mcc:0.245424+0.002973	test-mcc:0.236325+0.008368 
[60]	train-mcc:0.245296+0.002906	test-mcc:0.236290+0.008534 
[61]	train-mcc:0.246015+0.003279	test-mcc:0.236279+0.008430 
[62]	train-mcc:0.246452+0.003516	test-mcc:0.236161+0.008140 
[63]	train-mcc:0.247165+0.003530	test-mcc:0.236407+0.008575 
[64]	train-mcc:0.247663+0.003747	test-mcc:0.236073+0.008549 
[65]	train-mcc:0.247682+0.003982	test-mcc:0.236194+0.008603 
[66]	train-mcc:0.248240+0.004117	test-mcc:0.236033+0.008597 
[67]	train-mcc:0.248578+0.003893	test-mcc:0.235874+0.008474 
[68]	train-mcc:0.248956+0.004109	test-mcc:0.236052+0.008881 
[69]	train-mcc:0.249402+0.004474	test-mcc:0.236076+0.008540 
[70]	train-mcc:0.249874+0.004617	test-mcc:0.235915+0.008600 
[71]	train-mcc:0.250694+0.004287	test-mcc:0.235848+0.008645 
[72]	train-mcc:0.250958+0.004316	test-mcc:0.235965+0.008509 
Stopping. Best iteration:
[47]	train-mcc:0.242187+0.002459	test-mcc:0.236419+0.008560
