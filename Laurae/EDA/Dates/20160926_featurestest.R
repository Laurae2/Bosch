# Libraries

library(data.table)
library(Matrix)
library(matrixStats)
library(recommenderlab)
library(tabplot)
library(pbapply)

setwd("E:/")

# Load label
Y <- fread("datasets/train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970), select = 970)$Response
Y_fact <- as.factor(Y)

# Date process
train_date <- readRDS("datasets/train_date.rds")
test_date <- readRDS("datasets/test_date.rds")

#1:1183747

data <- rbind(train_date, test_date)
rm(train_date, test_date)

columns <- colnames(data)
listing <- list()
temp_name <- substr(columns[2], 1, 6)
many <- 1
j <- 2
for (i in 3:1157) {
  if (temp_name != substr(columns[i], 1, 6)) {
    temp_name <- substr(columns[i], 1, 6)
    listing[[many]] <- j:(i - 1)
    print(columns[listing[[many]]])
    many <- many + 1
    j <- i + 1
  }
}
listing[[52]] <- 1153:1157
gc()


# Compute missing values
na_data <- is.na(data) #20GB RAM
feature_NA <- data.table(data.frame(matrix(nrow = 2367495, ncol = 52)))

gc()
colorlist <- list()
for (i in 1:52) {
  colnames(feature_NA)[i] <- paste("S", i, "_NA", sep = "")
  cat(colnames(feature_NA)[i], "\n")
  colorlist[[colnames(feature_NA)[i]]] <- "Set5"
  feature_NA[[i]] <- matrixStats:::rowCounts(na_data, cols = listing[[i]], value = TRUE, na.rm = FALSE)
}

saveRDS(feature_NA, "Laurae/DateFeatures/NA_features.rds")

temporary <- as.data.frame(cbind(label = Y, feature_NA[1:1183747]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/NA_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()

rm(na_data)
gc()

# Compute Mean value
feature_Mean <- data.table(data.frame(matrix(nrow = 2367495, ncol = 52)))

gc()
colorlist <- list()
for (i in 1:52) {
  colnames(feature_Mean)[i] <- paste("S", i, "_Mean", sep = "")
  cat(colnames(feature_Mean)[i], "\n")
  colorlist[[colnames(feature_Mean)[i]]] <- "Set5"
  if (length(listing[[i]]) == 1) {
    feature_Mean[[i]] <- mean(data[, listing[[i]]], na.rm = FALSE)
  } else {
    feature_Mean[[i]] <- rowMeans(data[, listing[[i]], with = FALSE], na.rm = FALSE)
  }
  gc(verbose = FALSE)
}
saveRDS(feature_Mean, "Laurae/DateFeatures/Mean_features.rds")

temporary <- as.data.frame(cbind(label = Y, feature_Mean[1:1183747]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/Mean_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()


# Compute Minimum value
feature_Min <- data.table(data.frame(matrix(nrow = 2367495, ncol = 52)))

gc()
colorlist <- list()
for (i in 1:52) {
  colnames(feature_Min)[i] <- paste("S", i, "_Min", sep = "")
  cat(colnames(feature_Min)[i], "\n")
  colorlist[[colnames(feature_Min)[i]]] <- "Set5"
  if (length(listing[[i]]) == 1) {
    feature_Min[[i]] <- min(data[, listing[[i]]], na.rm = FALSE)
  } else {
    feature_Min[[i]] <- data[, my_min := do.call(pmin, c(.SD, na.rm = TRUE)), .SDcols = listing[[i]]]$my_min
  }
  gc(verbose = FALSE)
}
saveRDS(feature_Min, "Laurae/DateFeatures/Min_features.rds")

temporary <- as.data.frame(cbind(label = Y, feature_Min[1:1183747]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/Min_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()

feature_MinMin <- do.call(pmin, c(feature_Min, na.rm = TRUE))
saveRDS(feature_MinMin, "Laurae/DateFeatures/MinMin_features.rds")

# Compute Maximum value
feature_Max <- data.table(data.frame(matrix(nrow = 2367495, ncol = 52)))

gc()
colorlist <- list()
for (i in 1:52) {
  colnames(feature_Max)[i] <- paste("S", i, "_Max", sep = "")
  cat(colnames(feature_Max)[i], "\n")
  colorlist[[colnames(feature_Max)[i]]] <- "Set5"
  if (length(listing[[i]]) == 1) {
    feature_Max[[i]] <- max(data[, listing[[i]]], na.rm = FALSE)
  } else {
    feature_Max[[i]] <- data[, my_max := do.call(pmax, c(.SD, na.rm = TRUE)), .SDcols = listing[[i]]]$my_max
  }
  gc(verbose = FALSE)
}
saveRDS(feature_Max, "Laurae/DateFeatures/Max_features.rds")

temporary <- as.data.frame(cbind(label = Y, feature_Max[1:1183747]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/Max_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()

feature_MaxMax <- do.call(pmax, c(feature_Max, na.rm = TRUE))
saveRDS(feature_MaxMax, "Laurae/DateFeatures/MaxMax_features.rds")
gc()

# for (i in 1:52) {print(i);print(identical(feature_Min[[i]], feature_Max[[i]]))}


# Move minimum to 0 per row

feature_ZeroTimeMin <- data.table(sweep(feature_Min, 1, feature_MinMin, "-"))
for (i in 1:52) {
  colnames(feature_ZeroTimeMin)[i] <- paste("S", i, "_Time0", sep = "")
}
saveRDS(feature_ZeroTimeMin, "Laurae/DateFeatures/Time0_features.rds")
gc()



# Get time spent per station: 24, 25, 32

feature_StationTimer <- feature_Max - feature_Min
for (i in 1:52) {
  colnames(feature_StationTimer)[i] <- paste("S", i, "_TimeToExitStation", sep = "")
}
saveRDS(feature_StationTimer, "Laurae/DateFeatures/TimeToExitStation_features.rds")
gc()


# Get total time from entrance to exit

feature_FullTime <- feature_MaxMax - feature_MinMin
saveRDS(feature_FullTime, "Laurae/DateFeatures/TimeToExitProduction_features.rds")
gc()

temporary <- as.data.frame(cbind(label = Y, TotalTime = feature_FullTime[1:1183747], MinTime = feature_MinMin[1:1183747], MaxTime = feature_MaxMax[1:1183747]))

#tableplot(temporary, select = 1:4, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/Extremas_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:4, sortCol = 1, nBins = 172, scales = "lin")
dev.off()



# Get station order

feature_StationOrder <- data.table(t(pbapply(feature_ZeroTimeMin, 1, function(x) {r <- rank(x) / sum(!is.na(x)); r[is.na(x)] <- NA; r})))
for (i in 1:52) {
  colnames(feature_StationOrder)[i] <- paste("S", i, "_StationOrder", sep = "")
}
saveRDS(feature_StationOrder, "Laurae/DateFeatures/StationOrder_features.rds")
gc()
feature_StationOrderUnexact <- data.table(t(pbapply(feature_ZeroTimeMin, 1, function(x) {r <- rank(x, ties.method = "first") / sum(!is.na(x)); r[is.na(x)] <- NA; r * sum(!is.na(x))})))
for (i in 1:52) {
  colnames(feature_StationOrderUnexact)[i] <- paste("S", i, "_StationOrderUnexact", sep = "")
}
saveRDS(feature_StationOrderUnexact, "Laurae/DateFeatures/StationOrderUnexact_features.rds")
gc()
temporary <- as.data.frame(cbind(label = Y, feature_StationOrder[1:1183747, ]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/StationOrder_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()


# Get time spent to switch station

feature_StationSwitch <- data.table(t(pbapply(feature_ZeroTimeMin, 1, function(x) {r <- sort(x); r <- c(r[2:length(r)] - r[1:(length(r) - 1)], rep(NA, sum(is.na(x)) + 1))})))
for (i in 1:52) {
  colnames(feature_StationSwitch)[i] <- paste("S", i, "_StationSwitchSorted", sep = "")
}
saveRDS(feature_StationSwitch, "Laurae/DateFeatures/StationTimeSwitchSorted_features.rds")
gc()
temp_feature <- cbind(feature_StationSwitch, feature_StationOrderUnexact)
feature_StationSwitchOnStation <- data.table(t(pbapply(temp_feature, 1, function(x) {nas <- !is.na(x[53:104]); r <- rep(NA, 52); r[which(nas)[1:(sum(nas) - 1)]] <- x[1:52][1:(sum(nas) - 1)]; r})))
for (i in 1:52) {
  colnames(feature_StationSwitchOnStation)[i] <- paste("S", i, "_StationTimeSwitchOnStation", sep = "")
}
saveRDS(feature_StationSwitchOnStation, "Laurae/DateFeatures/StationTimeSwitchOnStation_features.rds")
gc()

temporary <- as.data.frame(cbind(label = Y, feature_StationSwitchOnStation[1:1183747, ]))

#tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")

jpeg(filename = "Laurae/DateFeatures/SwitchingStation_plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temporary, select = 1:53, sortCol = 1, nBins = 172, scales = "lin")
dev.off()


#x_2[which(!is.na(x_3))[1:(sum(!is.na(x_3)) - 1)]] <- x_4[1:(sum(!is.na(x_3)) - 1)]
#x_2 = rep(NA, 52)
#x_3 = StationOrderUnexact
#x_4 = StationSwitch
