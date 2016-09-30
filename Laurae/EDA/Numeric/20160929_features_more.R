# REQUIRES 54GB RAM AT LEAST, YOU WERE WARNED BEFORE RUNNING THIS

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


# Setup column names
columns <- colnames(data_numeric)
station <- strsplit(columns, split = "_")
station <- t(matrix(unlist(station), byrow = FALSE, nrow = 3))
station <- as.integer(substr(station[, 2], 2, 99))

listing <- list()
for (i in 0:51) {
  listing[[i + 1]] <- (which(station == i))
  print(columns[listing[[i + 1]]])
}


# Get rid of data.table uselessness
data_numeric <- as.matrix(data_numeric)
gc()



# Create sum of rows: 36GB RAM
sum_feature <- rowSums(data_numeric, na.rm = TRUE)
#sum_feature <- pbapply(data_numeric, 1, function(x) {sum(x, na.rm = TRUE)})
gc()
saveRDS(sum_feature, "Laurae/NumericFeatures/sum_features.rds")

temporary <- as.data.frame(cbind(label = Y, sum = sum_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")


# Create sum of rows per station: 36GB RAM
sum_station_NA <- data.table(data.frame(matrix(nrow = 2367495, ncol = 50)))

gc()
colorlist <- list()
j <- 0
for (i in 1:52) {
  if (length(listing[[i]]) > 0) {
    j <- j + 1
    colnames(sum_station_NA)[j] <- paste("S", i, "_SumNumeric", sep = "")
    cat(colnames(sum_station_NA)[j])
    colorlist[[colnames(sum_station_NA)[j]]] <- "Set5"
    sum_station_NA[[j]] <- rowSums(data_numeric[, listing[[i]]], na.rm = TRUE)
    gc(verbose = FALSE)
    k <- sum(sum_station_NA[[j]] == 0)
    cat(": ", k, " (", k/2367495 * 100, "%)\n", sep = "")
  }
}
saveRDS(sum_station_NA, "Laurae/NumericFeatures/sum_station_NA.rds")

temporary <- as.data.frame(cbind(label = Y, sum = sum_station_NA[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")


# Create sum of positive rows: 54GB RAM
sum_positive_feature <- pbapply(data_numeric, 1, function(x) {sum(x[(!is.na(x)) & (x > 0)])})
gc()
saveRDS(sum_positive_feature, "Laurae/NumericFeatures/sum_positive_features.rds")

temporary <- as.data.frame(cbind(label = Y, sum = sum_positive_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")


# Create sum of positive rows per station: 36GB RAM
positive_sum_station_NA <- data.table(data.frame(matrix(nrow = 2367495, ncol = 50)))

gc()
colorlist <- list()
j <- 0
for (i in 1:52) {
  if (length(listing[[i]]) > 0) {
    j <- j + 1
    colnames(positive_sum_station_NA)[j] <- paste("S", i, "_StationPositiveSumNumeric", sep = "")
    cat(colnames(positive_sum_station_NA)[j])
    colorlist[[colnames(positive_sum_station_NA)[j]]] <- "Set5"
    mini_data <- as.matrix(data_numeric[, listing[[i]]])
    mini_data[(is.na(mini_data)) | (mini_data < 0)] <- 0
    positive_sum_station_NA[[j]] <- rowSums(mini_data, na.rm = TRUE)
    gc(verbose = FALSE)
    k <- sum(positive_sum_station_NA[[j]] == 0)
    cat(": ", k, " (", k/2367495 * 100, "%)\n", sep = "")
  }
}
saveRDS(positive_sum_station_NA, "Laurae/NumericFeatures/positive_sum_station_NA.rds")

temporary <- as.data.frame(cbind(label = Y, sum = positive_sum_station_NA[1:1183747, ]))
plot(tableplot(temporary, select = 1:51, sortCol = 1, nBins = 172, scales = "lin"), numMode = "mb-ml")



# Create sum of negative rows: 54GB RAM
sum_negative_feature <- pbapply(data_numeric, 1, function(x) {sum(x[(!is.na(x)) & (x < 0)])})
gc()
saveRDS(sum_negative_feature, "Laurae/NumericFeatures/sum_negative_features.rds")

temporary <- as.data.frame(cbind(label = Y, sum = sum_negative_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")


# Create sum of negative rows per station: 36GB RAM
negative_sum_station_NA <- data.table(data.frame(matrix(nrow = 2367495, ncol = 50)))

gc()
colorlist <- list()
j <- 0
for (i in 1:52) {
  if (length(listing[[i]]) > 0) {
    j <- j + 1
    colnames(negative_sum_station_NA)[j] <- paste("S", i, "_StationNegativeSumNumeric", sep = "")
    cat(colnames(negative_sum_station_NA)[j])
    colorlist[[colnames(negative_sum_station_NA)[j]]] <- "Set5"
    mini_data <- as.matrix(data_numeric[, listing[[i]]])
    mini_data[(is.na(mini_data)) | (mini_data > 0)] <- 0
    negative_sum_station_NA[[j]] <- rowSums(mini_data, na.rm = TRUE)
    gc(verbose = FALSE)
    k <- sum(negative_sum_station_NA[[j]] == 0)
    cat(": ", k, " (", k/2367495 * 100, "%)\n", sep = "")
  }
}
saveRDS(negative_sum_station_NA, "Laurae/NumericFeatures/negative_sum_station_NA.rds")

temporary <- as.data.frame(cbind(label = Y, sum = negative_sum_station_NA[1:1183747, ]))
plot(tableplot(temporary, select = 1:51, sortCol = 1, nBins = 172, scales = "lin"), numMode = "mb-ml")




# Create row product of observations without NA and zeroes: 54GB RAM
product_feature <- pbapply(data_numeric, 1, function(x) {prod(x[(!is.na(x)) & (!x == 0)])})
gc()
saveRDS(product_feature, "Laurae/NumericFeatures/product_features.rds")

temporary <- as.data.frame(cbind(label = Y, product = product_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")





# Create row product of observations without NA and zeroes per station: 54GB RAM
product_station_feature <- data.table(data.frame(matrix(nrow = 2367495, ncol = 50)))

gc()
colorlist <- list()
j <- 0
for (i in 1:52) {
  if (length(listing[[i]]) > 0) {
    j <- j + 1
    colnames(product_station_feature)[j] <- paste("S", i, "_ProductStationNumeric", sep = "")
    cat(colnames(product_station_feature)[j])
    colorlist[[colnames(product_station_feature)[j]]] <- "Set5"
    mini_data <- as.matrix(data_numeric[, listing[[i]]])
    mini_data[is.na(mini_data)] <- 0
    product_station_feature[[j]] <- rowProds(mini_data, na.rm = FALSE)
    gc(verbose = FALSE)
    k <- sum(product_station_feature[[j]] == 0)
    cat(": ", k, " (", k/2367495 * 100, "%)\n", sep = "")
  }
}
gc()
saveRDS(product_station_feature, "Laurae/NumericFeatures/product_station_features.rds")

temporary <- as.data.frame(cbind(label = Y, product = product_station_feature[1:1183747, ]))
plot(tableplot(temporary, select = 1:51, sortCol = 1, nBins = 172, scales = "lin"), numMode = "mb-ml")




# Create the sum of sign features: 54GB RAM
f <- function(x) {
  return(sum(sign(x[1][!is.na(x[1])])))
}
sum_sign_feature <- pbapply(data_numeric, 1, function(x) {sum(sign(x[!is.na(x)]))})
gc()
saveRDS(sum_sign_feature, "Laurae/NumericFeatures/sum_sign_feature.rds")

temporary <- as.data.frame(cbind(label = Y, sign = sum_sign_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")


# Count NAs of rows: 54GB RAM
sum_NA_feature <- rowSums(is.na(data_numeric))
#sum_feature <- pbapply(data_numeric, 1, function(x) {sum(x, na.rm = TRUE)})
gc()
saveRDS(sum_NA_feature, "Laurae/NumericFeatures/sum_na_features.rds")

temporary <- as.data.frame(cbind(label = Y, sum = sum_NA_feature[1:1183747]))
plot(tableplot(temporary, select = 1:2, sortCol = 2, nBins = 172, scales = "lin"), numMode = "mb-ml")



# Count of NA observations per station: 54GB RAM
NA_station_feature <- data.table(data.frame(matrix(nrow = 2367495, ncol = 50)))

gc()
colorlist <- list()
j <- 0
for (i in 1:52) {
  if (length(listing[[i]]) > 0) {
    j <- j + 1
    colnames(NA_station_feature)[j] <- paste("S", i, "_ProductStationNumeric", sep = "")
    cat(colnames(NA_station_feature)[j])
    colorlist[[colnames(NA_station_feature)[j]]] <- "Set5"
    mini_data <- as.matrix(is.na(data_numeric[, listing[[i]]]))
    NA_station_feature[[j]] <- rowSums(mini_data, na.rm = FALSE)
    gc(verbose = FALSE)
    k <- sum(NA_station_feature[[j]] == length(listing[[i]]))
    cat(": ", k, " (", k/2367495 * 100, "%)\n", sep = "")
  }
}
gc()
saveRDS(NA_station_feature, "Laurae/NumericFeatures/NA_station_features.rds")

temporary <- as.data.frame(cbind(label = Y, product = NA_station_feature[1:1183747, ]))
plot(tableplot(temporary, select = 1:51, sortCol = 1, nBins = 172, scales = "lin"), numMode = "mb-ml")

