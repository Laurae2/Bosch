# Libraries

library(data.table)
library(feather)

setwd("E:/")

# Train Numeric

# 28.5 MB
gc()
train_numeric <- readRDS("datasets/train_numeric.rds")
write_feather(train_numeric, "datasets/train_numeric_feather")
rm(train_numeric)
gc()
train_numeric <- read_feather("datasets/train_numeric_feather")
