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
> # Do the same on categorical non-sparse data
> 
> 
> sparsed <- readRDS("datasets/train_numeric.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1655782   88.5    2637877   140.9    2637877   140.9
Vcells 1149880836 8772.9 1700176144 12971.4 1917727329 14631.1
> 
> spooky <- numeric(ncol(sparsed) - 1)
> for (i in 1:(ncol(sparsed) - 1)) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 500 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
> 
> write.csv(spooky, "numeric_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, c(which(!duplicated(spooky)), ncol(sparsed))], file = "datasets/train_numeric_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1676541   89.6    2637877   140.9    2637877   140.9
Vcells 1150133332 8774.9 1700176144 12971.4 1917727329 14631.1
> sparsed <- readRDS("datasets/test_numeric.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1671836   89.3    2637877   140.9    2637877   140.9
Vcells 1148734344 8764.2 2449805328 18690.6 2296972007 17524.6
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_numeric_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1671846   89.3    2637877   140.9    2637877   140.9
Vcells 1148734804 8764.2 2449805328 18690.6 2296972007 17524.6
> 
> 
> 
> 
> 
> 
> sparsed <- readRDS("datasets/train_categorical.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1682833   89.9    2637877   140.9    2637877   140.9
Vcells 1269491945 9685.5 2449805328 18690.6 2416549318 18436.9
> 
> spooky <- numeric(ncol(sparsed))
> for (i in 1:ncol(sparsed)) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 500 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 1000 ---
Done 1100 Spooky hashes.
Done 1200 Spooky hashes.
Done 1300 Spooky hashes.
Done 1400 Spooky hashes.
Done 1500 Spooky hashes.
 --- Uniques: 1500 ---
Done 1600 Spooky hashes.
Done 1700 Spooky hashes.
Done 1800 Spooky hashes.
Done 1900 Spooky hashes.
Done 2000 Spooky hashes.
 --- Uniques: 2000 ---
Done 2100 Spooky hashes.
> 
> write.csv(spooky, "categorical_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_categorical_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1685428   90.1    2637877   140.9    2637877   140.9
Vcells 1269567818 9686.1 2449805328 18690.6 2416549318 18436.9
> sparsed <- readRDS("datasets/test_categorical.rds")
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1684011   90.0    2637877   140.9    2637877   140.9
Vcells 1269502622 9685.6 2940631572 22435.3 2537312645 19358.2
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_categorical_dedup.rds", compress = TRUE)
> gc()
             used   (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1684021   90.0    2637877   140.9    2637877   140.9
Vcells 1269503082 9685.6 2940631572 22435.3 2537312645 19358.2
> 
> 
> 
> 
> sparsed <- readRDS("datasets/train_date.rds")
> 
> spooky <- numeric(ncol(sparsed))
> for (i in 1:ncol(sparsed)) {
+   spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
+   if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
+   if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
+ }
Done 100 Spooky hashes.
Done 200 Spooky hashes.
Done 300 Spooky hashes.
Done 400 Spooky hashes.
Done 500 Spooky hashes.
 --- Uniques: 500 ---
Done 600 Spooky hashes.
Done 700 Spooky hashes.
Done 800 Spooky hashes.
Done 900 Spooky hashes.
Done 1000 Spooky hashes.
 --- Uniques: 1000 ---
Done 1100 Spooky hashes.
> 
> write.csv(spooky, "date_spooky.csv", row.names = FALSE, quote = FALSE)
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_date_dedup.rds", compress = TRUE)
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1673983    89.5    2637877   140.9    2637877   140.9
Vcells 1371353128 10462.6 2940631572 22435.3 2641144013 20150.4
> sparsed <- readRDS("datasets/test_date.rds")
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1672400    89.4    2637877   140.9    2637877   140.9
Vcells 1371281600 10462.1 2940631572 22435.3 2740953289 20911.9
> saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_date_dedup.rds", compress = TRUE)
> gc()
             used    (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells    1672410    89.4    2637877   140.9    2637877   140.9
Vcells 1371282060 10462.1 2940631572 22435.3 2740953289 20911.9
> rm(sparsed)
> gc()
          used (Mb) gc trigger    (Mb)   max used    (Mb)
Ncells 1670083 89.2    2637877   140.9    2637877   140.9
Vcells 1679392 12.9 2352505257 17948.2 2740953289 20911.9
```
