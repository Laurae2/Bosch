# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
#library(propagate)

setwd("E:/")

# Date process
train_date <- readRDS("datasets/train_date_dedup.rds")

doom <- cor(train_date, use = "pairwise.complete.obs")
saveRDS(doom, file = "datasets/train_date_correlation.rds")

doomed_tri <- doom
doomed_tri[lower.tri(doomed_tri, diag = TRUE)] <- 0
doomed <- (apply(doomed_tri, 1, function(x) {sum(x == 1, na.rm = TRUE)}) - 1) > 0 # count all 1. If the count is higher than 1, then it has an existing duplicate.
# finds 62 perfectly correlated factors

gc()

# Make selection in the features: 35 removed
doomed_out <- character()
for (i in (1:162)[doomed]) {
  
  doomed_temp <- names(which(doomed_tri[, i] == 1))
  if (length(doomed_temp) > 0) {print(c(colnames(train_date)[i], doomed_temp))}
  doomed_out <- unique(c(doomed_out, doomed_temp))
  
}

# unique(matrix(unlist(strsplit(colnames(train_date)[2:127], split = "_")), nrow = 126, byrow = TRUE)[, c(1,2)])
# table(matrix(unlist(strsplit(colnames(train_date)[2:127], split = "_")), nrow = 126, byrow = TRUE)[, c(1,2)])

train_date <- train_date[, (1:162)[-which(colnames(doom) %in% doomed_out)], with = FALSE]
saveRDS(train_date, file = "datasets/train_date_decor.rds", compress = TRUE)
gc()
train_date <- as.matrix(train_date)
gc()
train_date <- dropNA(train_date)
gc()
saveRDS(train_date, file = "datasets/train_date_sparse_decor.rds", compress = TRUE)

rm(train_date)
gc()
test_date <- readRDS("datasets/test_date_dedup.rds")
test_date <- test_date[, (1:162)[-which(colnames(doom) %in% doomed_out)], with = FALSE]
saveRDS(test_date, file = "datasets/test_date_decor.rds", compress = TRUE)
gc()
test_date <- as.matrix(test_date)
gc()
test_date <- dropNA(test_date)
gc()

saveRDS(test_date, file = "datasets/test_date_sparse_decor.rds", compress = TRUE)
