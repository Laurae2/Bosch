## 3-DataToSparse

DataToSparse does the specific following things (if interpretation is needed):

* Create the sparse matrices of Numeric / Date
* One-hot encode Categorical > 2 features
* Binary encode Categorical = 2 features
* Drop Categorical = 1 feature

Also, it computes the SpookyHash v2 of each column and compare to each other columns. However, it does not seem to work on dense matrices properly (results are way different).

Final matrix dimensions (row ID & Label excluded):

* train_numeric_sparse = 927 columns (2070.1 MB)
* train_categorical_sparse = 501 columns (838.9 MB)
* train_data_sparse = 161 columns (319.3 MB)
* train_numeric_sparse = 927 columns (8390.2 MB) <= agreement
* train_categorical_sparse = 227 columns (1034.2 MB) <= does not agree because it was not converted to a design matrix obviously
* train_data_sparse = 161 columns (1463.1 MB) <= agreement


The log of 3-DataToSparse.R:

```r
> rm(list = ls())
> library(fastdigest)
> 
> sparsed <- readRDS("datasets/train_categorical_sparse.rds")
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1653772   88.4    2637877   140.9    2637877   140.9
Vcells 863280841 6586.4 1917940664 14632.8 1768943889 13496.0
> # as.numeric(sparsed@Dim[1])*as.numeric(sparsed@Dim[2])*8 = 44385777512 bytes = 42.329 GB
> 
> # dedup <- sparsed@p[2:4688] - sparsed@p[1:4687]
> # dedup_table <- table(dedup)
> # 
> # better <- as.matrix(sparsed[1:50000, ])
> 
> # Single threaded but we want to monitor
> spooky <- numeric(sparsed@Dim[2])
> for (i in 1:sparsed@Dim[2]) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 79 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 135 ---
Done 1100 Spooky hashes.
Done 1200 Spooky hashes.
Done 1300 Spooky hashes.
Done 1400 Spooky hashes.
Done 1500 Spooky hashes.
 --- Uniques: 189 ---
Done 1600 Spooky hashes.
Done 1700 Spooky hashes.
Done 1800 Spooky hashes.
Done 1900 Spooky hashes.
Done 2000 Spooky hashes.
 --- Uniques: 247 ---
Done 2100 Spooky hashes.
Done 2200 Spooky hashes.
Done 2300 Spooky hashes.
Done 2400 Spooky hashes.
Done 2500 Spooky hashes.
 --- Uniques: 291 ---
Done 2600 Spooky hashes.
Done 2700 Spooky hashes.
Done 2800 Spooky hashes.
Done 2900 Spooky hashes.
Done 3000 Spooky hashes.
 --- Uniques: 344 ---
Done 3100 Spooky hashes.
Done 3200 Spooky hashes.
Done 3300 Spooky hashes.
Done 3400 Spooky hashes.
Done 3500 Spooky hashes.
 --- Uniques: 376 ---
Done 3600 Spooky hashes.
Done 3700 Spooky hashes.
Done 3800 Spooky hashes.
Done 3900 Spooky hashes.
Done 4000 Spooky hashes.
 --- Uniques: 424 ---
Done 4100 Spooky hashes.
Done 4200 Spooky hashes.
Done 4300 Spooky hashes.
Done 4400 Spooky hashes.
Done 4500 Spooky hashes.
 --- Uniques: 473 ---
Done 4600 Spooky hashes.
> 
> write.csv(spooky, "categorical_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_categorical_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1654281   88.4    2637877   140.9    2637877   140.9
Vcells 863289550 6586.4 1917940664 14632.8 1917727329 14631.1
> sparsed <- readRDS("datasets/test_categorical_sparse.rds")
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1654278   88.4    2637877   140.9    2637877   140.9
Vcells 863289545 6586.4 1917940664 14632.8 1917727329 14631.1
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_categorical_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1654278   88.4    2637877   140.9    2637877   140.9
Vcells 863289545 6586.4 1917940664 14632.8 1917727329 14631.1
> 
> 
> # Do the same for numeric
> 
> sparsed <- readRDS("datasets/train_numeric_sparse.rds")
> gc()
            used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells   1655158   88.4    2637877   140.9    2637877   140.9
Vcells 330315180 2520.2 1534352531 11706.2 1917727329 14631.1
> 
> spooky <- numeric((sparsed@Dim[2]) - 1)
> for (i in 1:(sparsed@Dim[2] - 1)) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 499 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
> 
> write.csv(spooky, "numeric_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, c(which(!duplicated(spooky)), sparsed@Dim[2])], file = "datasets/train_numeric_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655588   88.5    2637877  140.9    2637877   140.9
Vcells 330314875 2520.2  981985619 7492.0 1917727329 14631.1
> sparsed <- readRDS("datasets/test_numeric_sparse.rds")
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655584   88.5    2637877  140.9    2637877   140.9
Vcells 328467958 2506.1  981985619 7492.0 1917727329 14631.1
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_numeric_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655584   88.5    2637877  140.9    2637877   140.9
Vcells 328467958 2506.1  981985619 7492.0 1917727329 14631.1
> 
> 
> 
> # Do the same for date
> 
> sparsed <- readRDS("datasets/train_date_sparse.rds")
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655772   88.5    2637877  140.9    2637877   140.9
Vcells 367897579 2806.9  981985619 7492.0 1917727329 14631.1
> 
> spooky <- numeric(sparsed@Dim[2])
> for (i in 1:sparsed@Dim[2]) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 85 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 134 ---
Done 1100 Spooky hashes.
> 
> write.csv(spooky, "date_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_date_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655009   88.4    2637877  140.9    2637877   140.9
Vcells 367891644 2806.8  981985619 7492.0 1917727329 14631.1
> sparsed <- readRDS("datasets/test_date_sparse.rds")
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655006   88.4    2637877  140.9    2637877   140.9
Vcells 367788541 2806.1  981985619 7492.0 1917727329 14631.1
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_date_sparse_dedup.rds", compress = TRUE)
> gc()
            used   (Mb) gc trigger   (Mb)   max used    (Mb)
Ncells   1655006   88.4    2637877  140.9    2637877   140.9
Vcells 367788541 2806.1  981985619 7492.0 1917727329 14631.1
> 
> 
> 
> 
```

Fixed run for non-sparse data (due to data.table stupidity, was run separately):

```r
> # Do the same on categorical non-sparse data
> rm(list = ls())
> gc()
          used (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells 1712672 91.5    2637877   140.9    2637877   140.9
Vcells 1676867 12.8 2083719268 15897.6 2740953289 20911.9
> sparsed <- readRDS("datasets/train_numeric.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1714627   91.6    2637877   140.9    2637877   140.9
Vcells 1149916314 8773.2 2083719268 15897.6 2740953289 20911.9
> 
> spooky <- numeric(ncol(sparsed) - 1)
> for (i in 1:(ncol(sparsed) - 1)) {
+   spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 499 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
> 
> write.csv(spooky, "datasets/numeric_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, c(which(!duplicated(spooky)), ncol(sparsed)), with = FALSE], file = "datasets/train_numeric_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715564   91.7    2637877   140.9    2637877   140.9
Vcells 1149925795 8773.3 2500954590 19080.8 2740953289 20911.9
> sparsed <- readRDS("datasets/test_numeric.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715581   91.7    2637877   140.9    2637877   140.9
Vcells 1148741961 8764.3 2500954590 19080.8 2740953289 20911.9
> saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_numeric_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715606   91.7    2637877   140.9    2637877   140.9
Vcells 1148743080 8764.3 2500954590 19080.8 2740953289 20911.9
> 
> 
> 
> 
> 
> 
> sparsed <- readRDS("datasets/train_categorical.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1726559   92.3    2637877   140.9    2637877   140.9
Vcells 1269499530 9685.6 2500954590 19080.8 2740953289 20911.9
> 
> spooky <- numeric(ncol(sparsed))
> for (i in 1:ncol(sparsed)) {
+   spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 75 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 126 ---
Done 1100 Spooky hashes.
Done 1200 Spooky hashes.
Done 1300 Spooky hashes.
Done 1400 Spooky hashes.
Done 1500 Spooky hashes.
 --- Uniques: 175 ---
Done 1600 Spooky hashes.
Done 1700 Spooky hashes.
Done 1800 Spooky hashes.
Done 1900 Spooky hashes.
Done 2000 Spooky hashes.
 --- Uniques: 205 ---
Done 2100 Spooky hashes.
> 
> write.csv(spooky, "datasets/categorical_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/train_categorical_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1725867   92.2    2637877   140.9    2637877   140.9
Vcells 1269495493 9685.5 2500954590 19080.8 2740953289 20911.9
> sparsed <- readRDS("datasets/test_categorical.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1725865   92.2    2637877   140.9    2637877   140.9
Vcells 1269495231 9685.5 3001704485 22901.2 2740953289 20911.9
> saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_categorical_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1725870   92.2    2637877   140.9    2637877   140.9
Vcells 1269495617 9685.5 3001704485 22901.2 2740953289 20911.9
> 
> 
> 
> 
> sparsed <- readRDS("datasets/train_date.rds")
> 
> spooky <- numeric(ncol(sparsed))
> for (i in 1:ncol(sparsed)) {
+   spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 85 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 134 ---
Done 1100 Spooky hashes.
> 
> write.csv(spooky, "datasets/date_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/train_date_dedup.rds", compress = TRUE)
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715180    91.7    2637877   140.9    2637877   140.9
Vcells 1371280721 10462.1 3001704485 22901.2 2740953289 20911.9
> sparsed <- readRDS("datasets/test_date.rds")
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715172    91.7    2637877   140.9    2637877   140.9
Vcells 1371281553 10462.1 3001704485 22901.2 2740953289 20911.9
> saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_date_dedup.rds", compress = TRUE)
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1715177    91.7    2637877   140.9    2637877   140.9
Vcells 1371281873 10462.1 3001704485 22901.2 2740953289 20911.9
> rm(sparsed)
> gc()
          used (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells 1712853 91.5    2637877   140.9    2637877   140.9
Vcells 1679341 12.9 2401363588 18321.0 2740953289 20911.9
```
