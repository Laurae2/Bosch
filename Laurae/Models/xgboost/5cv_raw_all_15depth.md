```r
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1445674   77.3    2637877   140.9    2164898   115.7
Vcells 710457630 5420.4 2063167967 15740.8 1546747816 11800.8
> set.seed(11111)
> temp_model <- xgb.cv(data = dtrain,
+                      nthread = 6,
+                      nfold = 6,
+                      nrounds = 1000000,
+                      max_depth = 15,
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
[1]	train-mcc:0.358102+0.007303	test-mcc:0.227369+0.011153 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 25 rounds.

[2]	train-mcc:0.366562+0.006788	test-mcc:0.229255+0.012317 
[3]	train-mcc:0.369794+0.005252	test-mcc:0.228113+0.011907 
[4]	train-mcc:0.373621+0.005097	test-mcc:0.228882+0.010097 
[5]	train-mcc:0.375907+0.004871	test-mcc:0.230800+0.008794 
[6]	train-mcc:0.377878+0.004646	test-mcc:0.230464+0.008000 
[7]	train-mcc:0.379511+0.003969	test-mcc:0.230710+0.009015 
[8]	train-mcc:0.382370+0.003722	test-mcc:0.230497+0.008712 
[9]	train-mcc:0.384771+0.004118	test-mcc:0.231751+0.008024 
[10]	train-mcc:0.387396+0.004296	test-mcc:0.231239+0.007366 
[11]	train-mcc:0.390585+0.003778	test-mcc:0.230895+0.007961 
[12]	train-mcc:0.391928+0.003751	test-mcc:0.231814+0.007906 
[13]	train-mcc:0.393908+0.003747	test-mcc:0.232332+0.007040 
[14]	train-mcc:0.396217+0.004176	test-mcc:0.232302+0.007977 
[15]	train-mcc:0.397191+0.004044	test-mcc:0.232710+0.008070 
[16]	train-mcc:0.398489+0.003989	test-mcc:0.232641+0.007485 
[17]	train-mcc:0.400045+0.003917	test-mcc:0.232207+0.007009 
[18]	train-mcc:0.401747+0.004055	test-mcc:0.232235+0.008011 
[19]	train-mcc:0.402837+0.003693	test-mcc:0.232905+0.008861 
[20]	train-mcc:0.403656+0.003501	test-mcc:0.232768+0.008525 
[21]	train-mcc:0.404733+0.003684	test-mcc:0.232885+0.008208 
[22]	train-mcc:0.405892+0.003821	test-mcc:0.233286+0.007883 
[23]	train-mcc:0.406850+0.003414	test-mcc:0.233446+0.008641 
[24]	train-mcc:0.407597+0.003735	test-mcc:0.232807+0.009035 
[25]	train-mcc:0.408559+0.003838	test-mcc:0.232355+0.008908 
[26]	train-mcc:0.409228+0.003723	test-mcc:0.232277+0.009319 
[27]	train-mcc:0.410418+0.004107	test-mcc:0.232705+0.009223 
[28]	train-mcc:0.411217+0.004042	test-mcc:0.232890+0.009136 
[29]	train-mcc:0.411980+0.004144	test-mcc:0.233488+0.009407 
[30]	train-mcc:0.412881+0.003966	test-mcc:0.233564+0.010122 
[31]	train-mcc:0.413638+0.003979	test-mcc:0.233844+0.010078 
[32]	train-mcc:0.414494+0.003930	test-mcc:0.234592+0.011024 
[33]	train-mcc:0.415315+0.003682	test-mcc:0.234474+0.009962 
[34]	train-mcc:0.415955+0.003710	test-mcc:0.234481+0.011096 
[35]	train-mcc:0.416814+0.003740	test-mcc:0.234218+0.011025 
[36]	train-mcc:0.417386+0.003381	test-mcc:0.234714+0.011235 
[37]	train-mcc:0.417821+0.003335	test-mcc:0.235788+0.011945 
[38]	train-mcc:0.418435+0.003280	test-mcc:0.235973+0.011671 
[39]	train-mcc:0.418821+0.003424	test-mcc:0.235852+0.012323 
[40]	train-mcc:0.419454+0.003192	test-mcc:0.235663+0.012690 
[41]	train-mcc:0.419847+0.003076	test-mcc:0.235628+0.012777 
[42]	train-mcc:0.420181+0.003103	test-mcc:0.235665+0.012342 
[43]	train-mcc:0.420690+0.002919	test-mcc:0.236078+0.012680 
[44]	train-mcc:0.421223+0.003123	test-mcc:0.236194+0.012522 
[45]	train-mcc:0.421688+0.002825	test-mcc:0.235768+0.012196 
[46]	train-mcc:0.422258+0.002810	test-mcc:0.237019+0.012988 
[47]	train-mcc:0.422581+0.002840	test-mcc:0.236689+0.012486 
[48]	train-mcc:0.423322+0.002795	test-mcc:0.236794+0.012303 
[49]	train-mcc:0.423849+0.002678	test-mcc:0.237048+0.012348 
[50]	train-mcc:0.424398+0.002399	test-mcc:0.236431+0.012148 
[51]	train-mcc:0.424831+0.002464	test-mcc:0.237147+0.011831 
[52]	train-mcc:0.425400+0.002491	test-mcc:0.236728+0.012123 
[53]	train-mcc:0.425762+0.002532	test-mcc:0.237447+0.011753 
[54]	train-mcc:0.426277+0.002493	test-mcc:0.237153+0.011669 
[55]	train-mcc:0.426936+0.002356	test-mcc:0.237893+0.011963 
[56]	train-mcc:0.427624+0.002360	test-mcc:0.237885+0.011782 
[57]	train-mcc:0.427867+0.002306	test-mcc:0.238130+0.012401 
[58]	train-mcc:0.428403+0.002199	test-mcc:0.237718+0.012311 
[59]	train-mcc:0.428933+0.002249	test-mcc:0.237733+0.012056 
[60]	train-mcc:0.429913+0.002958	test-mcc:0.237799+0.012318 
[61]	train-mcc:0.430237+0.002979	test-mcc:0.238813+0.012041
