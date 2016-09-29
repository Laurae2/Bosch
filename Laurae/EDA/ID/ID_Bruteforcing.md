```r
> data_temp <- as.data.frame(cbind(Feature = data_feat[data$type == 1], Response = as.factor(Y)))
> tableplot(data_temp, select = 1:2, sortCol = 1, nBins = 172)
> data_temp <- as.data.frame(cbind(Feature = data_feat[data$type == 1], Response = as.factor(data$Response[data$type == 1])))
> data_temp$Response <- as.factor(data_temp$Response)
> tableplot(data_temp, select = 1:2, sortCol = 1, nBins = 172)
> ?tableplot
> data_temp <- as.data.frame(cbind(Feature = data_feat[data$type == 1], Response = data$Response[data$type == 1]))
> tableplot(data_temp, select = 1:2, sortCol = 1, nBins = 172)
> data_mini <- as.matrix(data_temp$Feature)
> data_xgb <- xgb.DMatrix(data = data_mini, label = data_temp$Response)
> StratifiedCV <- function(Y, i, seed) {
+   folded <- list()
+   folded1 <- list()
+   folded2 <- list()
+   set.seed(seed)
+   temp_Y0 <- which(Y == 0)
+   temp_Y1 <- which(Y == 1)
+   for (i in 1:5) {
+     folded1[[i]] <- sample(temp_Y0, floor(length(temp_Y0) / (6 - i)))
+     temp_Y0 <- temp_Y0[!temp_Y0 %in% folded1[[i]]]
+     folded2[[i]] <- sample(temp_Y1, floor(length(temp_Y1) / (6 - i)))
+     temp_Y1 <- temp_Y1[!temp_Y1 %in% folded2[[i]]]
+     folded[[i]] <- c(folded1[[i]], folded2[[i]])
+   }
+   return(folded)
+ }
> 
> folded <- StratifiedCV(Y, 5, 11111)
> gc(verbose = FALSE) #frees up RAM
            used   (Mb) gc trigger   (Mb)  max used   (Mb)
Ncells   1522847   81.4    7681500  410.3  12002346  641.0
Vcells 678689033 5178.0 1143268102 8722.5 899476061 6862.5
> set.seed(11111) #ensures reproducibility
> modelization.cv <- xgb.cv(data = data_xgb,
+                           nthread = 2,
+                           folds = folded,
+                           max_depth = 10,
+                           eta = 0.1,
+                           gamma = 0,
+                           subsample = 1.00,
+                           colsample_bytree = 1.00,
+                           nrounds = 100000,
+                           booster = "gbtree",
+                           objective = "binary:logistic",
+                           eval_metric = "auc",
+                           verbose = TRUE,
+                           early_stopping_rounds = 50,
+                           maximize = TRUE)
[1]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[3]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[4]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[5]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[6]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[7]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[8]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[9]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[10]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[11]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[12]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[13]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[14]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[15]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[16]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[17]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[18]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[19]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[20]	train-auc:0.523840+0.000659	test-auc:0.523767+0.002662 
[21]	train-auc:0.524064+0.000851	test-auc:0.523792+0.002653 
[22]	train-auc:0.524275+0.001115	test-auc:0.523873+0.002529 
[23]	train-auc:0.524480+0.000910	test-auc:0.523973+0.002687 
[24]	train-auc:0.525051+0.001948	test-auc:0.524342+0.002212 
[25]	train-auc:0.525051+0.001948	test-auc:0.524342+0.002212 
[26]	train-auc:0.525052+0.001949	test-auc:0.524342+0.002211 
[27]	train-auc:0.525052+0.001949	test-auc:0.524342+0.002211 
[28]	train-auc:0.525773+0.001933	test-auc:0.525042+0.002769 
[29]	train-auc:0.530886+0.005307	test-auc:0.524275+0.005183 
[30]	train-auc:0.533525+0.005974	test-auc:0.523187+0.005251 
[31]	train-auc:0.535327+0.005419	test-auc:0.523882+0.003951 
[32]	train-auc:0.535336+0.005420	test-auc:0.523926+0.003933 
[33]	train-auc:0.536619+0.005932	test-auc:0.523540+0.004219 
[34]	train-auc:0.542201+0.008794	test-auc:0.523196+0.004687 
[35]	train-auc:0.543023+0.009201	test-auc:0.523119+0.004523 
[36]	train-auc:0.546299+0.007704	test-auc:0.522393+0.006549 
[37]	train-auc:0.546918+0.007979	test-auc:0.522300+0.006906 
[38]	train-auc:0.547698+0.008502	test-auc:0.522122+0.007142 
[39]	train-auc:0.549749+0.006683	test-auc:0.522111+0.007389 
[40]	train-auc:0.553959+0.005200	test-auc:0.521027+0.006809 
[41]	train-auc:0.555189+0.005550	test-auc:0.520146+0.005791 
[42]	train-auc:0.556908+0.006773	test-auc:0.521973+0.007460 
[43]	train-auc:0.558262+0.007614	test-auc:0.521639+0.006413 
[44]	train-auc:0.559123+0.007580	test-auc:0.521288+0.006420 
[45]	train-auc:0.562385+0.009554	test-auc:0.521819+0.005894 
[46]	train-auc:0.563556+0.009359	test-auc:0.521644+0.006038 
[47]	train-auc:0.567974+0.009647	test-auc:0.521923+0.007011 
[48]	train-auc:0.571604+0.008698	test-auc:0.521880+0.005777 
[49]	train-auc:0.573198+0.008778	test-auc:0.522099+0.005170 
[50]	train-auc:0.575110+0.008914	test-auc:0.521701+0.006520 



# Joost feature
> gc(verbose = FALSE) #frees up RAM
            used   (Mb) gc trigger   (Mb)  max used   (Mb)
Ncells   1547469   82.7    6145200  328.2  12002346  641.0
Vcells 687023048 5241.6 1143268102 8722.5 899476061 6862.5
> data_xgb <- xgb.DMatrix(data = as.matrix(joosted$joost), label = joosted$Response)
> gc(verbose = FALSE) #frees up RAM
            used   (Mb) gc trigger   (Mb)  max used   (Mb)
Ncells   1547323   82.7    4916160  262.6  12002346  641.0
Vcells 687019576 5241.6 1143268102 8722.5 899476061 6862.5
> set.seed(11111) #ensures reproducibility
> modelization.cv <- xgb.cv(data = data_xgb,
+                           nthread = 2,
+                           folds = folded,
+                           max_depth = 10,
+                           eta = 0.1,
+                           gamma = 0,
+                           subsample = 1.00,
+                           colsample_bytree = 1.00,
+                           nrounds = 100000,
+                           booster = "gbtree",
+                           objective = "binary:logistic",
+                           eval_metric = "auc",
+                           verbose = TRUE,
+                           early_stopping_rounds = 50,
+                           maximize = TRUE)
[1]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
Multiple eval metrics are present. Will use test_auc for early stopping.
Will train until test_auc hasn't improved in 50 rounds.

[2]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[3]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[4]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[5]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[6]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[7]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[8]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[9]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[10]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[11]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[12]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[13]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[14]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[15]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[16]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[17]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[18]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[19]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
[20]	train-auc:0.523769+0.000665	test-auc:0.523768+0.002662 
