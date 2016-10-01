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


dupped1 <- duplicated(data_numeric)
sum(dupped1) # how many duplicates? (without their unique counterpart)

data_dupped1 <- data_numeric[, dupping := dupped1 | c(tail(dupped1, -1L), FALSE)]$dupping
sum(data_dupped1) # how many duplicates including their unique counterpart?
sum(data_dupped1[1:1183747])
sum(data_dupped1[1183748:2367495])
table(Y[data_dupped1[1:1183747]]) # table of Y by train




train_categorical <- readRDS("datasets/train_categorical.rds")
test_categorical <- readRDS("datasets/test_categorical.rds")


data_categorical <- rbind(train_categorical[, 2:2141, with = FALSE], test_categorical[, 2:2141, with = FALSE])
gc()

rm(train_categorical, test_categorical)
gc()


dupped2 <- duplicated(data_categorical)
sum(dupped2) # how many duplicates? (without their unique counterpart)

data_dupped2 <- data_categorical[, dupping := dupped2 | c(tail(dupped2, -1L), FALSE)]$dupping
sum(data_dupped2) # how many duplicates including their unique counterpart?
sum(data_dupped2[1:1183747])
sum(data_dupped2[1183748:2367495])
table(Y[data_dupped2[1:1183747]]) # table of Y by train




train_date <- readRDS("datasets/train_date.rds")
test_date <- readRDS("datasets/test_date.rds")


data_date <- rbind(train_date[, 2:2141, with = FALSE], test_date[, 2:2141, with = FALSE])
gc()

rm(train_date, test_date)
gc()


dupped3 <- duplicated(data_date)
sum(dupped3) # how many duplicates? (without their unique counterpart)

data_dupped3 <- data_date[, dupping := dupped3 | c(tail(dupped3, -1L), FALSE)]$dupping
sum(data_dupped3) # how many duplicates including their unique counterpart?
sum(data_dupped3[1:1183747])
sum(data_dupped3[1183748:2367495])
table(Y[data_dupped3[1:1183747]]) # table of Y by train



dupped4 <- dupped1 & dupped2 & dupped3
data_dupped4 <- data_dupped1 & data_dupped2 & data_dupped3
sum(data_dupped4) # how many duplicates including their unique counterpart?
sum(data_dupped4[1:1183747])
sum(data_dupped4[1183748:2367495])
table(Y[data_dupped4[1:1183747]]) # table of Y by train

write.csv(dupped4, "Laurae/dupped4.csv", row.names = FALSE)
write.csv(data_dupped4, "Laurae/data_dupped4.csv", row.names = FALSE)
