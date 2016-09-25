# Libraries

library(data.table)

setwd("E:/")


# Load numeric data

# 25.5 MB
gc()
# Read 1183747 rows and 970 (of 970) columns from 1.993 GB file in 00:02:52
train_numeric <- fread("datasets/train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970))
# 8786.1 MB
gc()
saveRDS(train_numeric, file = "datasets/train_numeric.rds", compress = TRUE)
# 8786.1 MB
gc()
# Read 1183748 rows and 969 (of 969) columns from 1.991 GB file in 00:02:51
test_numeric <- fread("datasets/test_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 969))
# 17537.5 MB
gc()
saveRDS(test_numeric, file = "datasets/test_numeric.rds", compress = TRUE)
rm(list = ls()) # clear all stuff


# Load categorical data

# 25.6 MB
gc()
# Read 1183747 rows and 2141 (of 2141) columns from 2.494 GB file in 00:05:16
train_categorical <- fread("datasets/train_categorical.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE, colClasses = c("numeric", rep("character", 2140)))
# 29026.0 MB
gc()
saveRDS(train_categorical, file = "datasets/train_categorical.rds", compress = TRUE)
# 9699.4 MB (gc bug?)
gc()
test_categorical <- fread("datasets/test_categorical.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE, colClasses = c("numeric", rep("character", 2140)))
# 38789.2 MB (gc bug?)
gc()
saveRDS(test_categorical, file = "datasets/test_categorical.rds", compress = TRUE)
rm(list = ls()) # clear all stuff

# Load date data

# 25.6 MB
gc()
# Read 1183747 rows and 1157 (of 1157) columns from 2.695 GB file in 00:03:22
train_date <- fread("datasets/train_date.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 1157))
# 10475.1 MB
gc()
saveRDS(train_date, file = "datasets/train_date.rds", compress = TRUE)
rm(list = ls()) # clear all stuff
# 10475.1 MB
gc()
# Read 1183748 rows and 1157 (of 1157) columns from 2.695 GB file in 00:03:22
test_date <- fread("datasets/test_date.csv", header = TRUE, sep = ",", stringsAsFactors = TRUE, colClasses = rep("numeric", 1157))
# 10475.2 MB
gc()
saveRDS(test_date, file = "datasets/test_date.rds", compress = TRUE)
rm(list = ls()) # clear all stuff

# 25.9 MB
gc()
