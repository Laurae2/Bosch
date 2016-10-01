# Libraries

library(data.table)
library(Matrix)
library(matrixStats)
library(recommenderlab)
library(tabplot)
library(pbapply)

setwd("E:/")


train_numeric <- readRDS("datasets/train_numeric.rds")
test_numeric <- readRDS("datasets/test_numeric.rds")
Y <- fread("datasets/train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970), select = 970)$Response
Y_fact <- as.factor(Y)
gc()


data_numeric <- rbind(train_numeric[, 2:969, with = FALSE], test_numeric[, 2:969, with = FALSE])
gc()

rm(train_numeric, test_numeric)
gc()


dupped <- duplicated(data_numeric)
sum(dupped) # how many duplicates? (without their unique counterpart)

data_dupped <- data_numeric[, dupping := dupped | c(tail(dupped, -1L), FALSE)]$dupping
sum(data_dupped) # how many duplicates including their unique counterpart?
sum(data_dupped[1:1183747])
sum(data_dupped[1183748:2367495])
table(Y[data_dupped[1:1183747]]) # table of Y by train
