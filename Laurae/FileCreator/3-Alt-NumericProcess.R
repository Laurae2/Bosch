# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(propagate)

setwd("E:/")

# Numeric process
train_numeric <- readRDS("datasets/train_numeric_dedup.rds")

# Remove labels
Y <- data.table(data.frame(Response = train_numeric[, Response]))
train_numeric <- train_numeric[, Response := NULL]

# doom <- cor(train_numeric, use = "pairwise.complete.obs")
# Do correlation by chunks (4+3+2+1)
cor_table <- bigcor(train_numeric, fun = "cor", size = 232, verbose = TRUE, use = "pairwise.complete.obs")
doom <- cor_table[1:928, 1:928]

colnames(doom) <- colnames(train_numeric)
rownames(doom) <- colnames(train_numeric)

# sum(doom == 1) # (1023-613)/2 = up to 205 occurrences
# sum(doom > (1 - 1e-16)) gives the same
saveRDS(doom, file = "datasets/train_numeric_correlation.rds")


doomed_tri <- doom
doomed_tri[lower.tri(doomed_tri, diag = TRUE)] <- 0
doomed <- (apply(doomed_tri, 1, function(x) {sum(x == 1, na.rm = TRUE)}) - 1) > 0 # count all 1. If the count is higher than 1, then it has an existing duplicate.
# finds 423 perfectly correlated factors

gc()

# Make selection in the features: 323 removed
doomed_out <- character()
for (i in (1:928)[doomed]) {
  
  doomed_temp <- names(which(doomed_tri[, i] == 1))
  doomed_out <- unique(c(doomed_out, doomed_temp))
  
}

test_numeric <- readRDS("datasets/test_numeric_dedup.rds")
densed <- as.data.frame(rbind(train_numeric, test_numeric))
densed <- densed[, (1:928)[-which(colnames(doom) %in% doomed_out)]]
print(format(object.size(densed), units = "MB"))

saveRDS(cbind(train_numeric, Response = Y$Response), file = "datasets/train_numeric_decor.rds", compress = TRUE)
saveRDS(test_numeric, file = "datasets/test_numeric_decor.rds", compress = TRUE)

densed <- as.matrix(densed)
gc()
#sparsed <- dropNA(densed)
#gc()



# Libraries

library(data.table)
library(recommenderlab)

setwd("E:/")

# Numeric process - done manually because of a bug...

# Make correlation
doom <- readRDS("datasets/train_numeric_correlation.rds")

# colnames(doom) <- colnames(train_numeric)
# rownames(doom) <- colnames(train_numeric)

# sum(doom == 1) # (1023-613)/2 = up to 205 occurrences
# sum(doom > (1 - 1e-16)) gives the same
# saveRDS(doom, file = "datasets/train_numeric_correlation.rds")


doomed_tri <- doom
doomed_tri[lower.tri(doomed_tri, diag = TRUE)] <- 0
doomed <- (apply(doomed_tri, 1, function(x) {sum(x == 1, na.rm = TRUE)}) - 1) > 0 # count all 1. If the count is higher than 1, then it has an existing duplicate.
# finds 423 perfectly correlated factors

gc()

# Make selection in the features: 323 removed
doomed_out <- character()
for (i in (1:928)[doomed]) {
  
  doomed_temp <- names(which(doomed_tri[, i] == 1))
  doomed_out <- unique(c(doomed_out, doomed_temp))
  
}

densed <- densed[, (1:928)[-which(colnames(doom) %in% doomed_out)]]
print(format(object.size(densed), units = "MB"))

# Do saving stuff

train_numeric <- readRDS("datasets/train_numeric_decor.rds")
train_numeric <- train_numeric[, c((1:928)[-which(colnames(doom) %in% doomed_out)], 929), with = FALSE]
saveRDS(train_numeric, file = "datasets/train_numeric_decor.rds", compress = TRUE)
gc()
train_numeric <- as.matrix(train_numeric)
gc()
train_numeric <- dropNA(train_numeric)
gc()
saveRDS(train_numeric, file = "datasets/train_numeric_sparse_decor.rds", compress = TRUE)

rm(train_numeric)
gc()
test_numeric <- readRDS("datasets/test_numeric_decor.rds")
test_numeric <- test_numeric[, (1:928)[-which(colnames(doom) %in% doomed_out)], with = FALSE]
saveRDS(test_numeric, file = "datasets/test_numeric_decor.rds", compress = TRUE)
gc()
test_numeric <- as.matrix(test_numeric)
gc()
test_numeric <- dropNA(test_numeric)
gc()

saveRDS(test_numeric, file = "datasets/test_numeric_sparse_decor.rds", compress = TRUE)
