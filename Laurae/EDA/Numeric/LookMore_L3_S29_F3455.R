# Load libraries
library(data.table)
#devtools:::install_github("cran/discretization")
#library(discretization)
library(tabplot)
library(cluster)
library(tclust)

# Set your working directory there =)
setwd("E:/")

# Load data
train <- readRDS("datasets/train_numeric.rds")
date <- readRDS("Laurae/DateFeaturesMore/Min_features.rds")
feature_names <- fread("Laurae/date_feat_lut_V2.txt", header = TRUE)
feature_names <- feature_names[!name_num == "", ]
feature_names <- feature_names[, c("name_num", "station_V2"), with = FALSE]
colnames(feature_names) <- c("Feature", "Station")
gc(verbose = TRUE)

mini_all <- as.data.frame(cbind(train[, c("L3_S29_F3455", "Response"), with = FALSE], date = date[1:1183747, get(paste("S", feature_names$Station[which("L3_S29_F3455" == feature_names$Feature)], "_Min", sep = ""))]))

temp_NA <- sum(is.na(mini_all$L3_S29_F3455))
plot(sort(mini_all$L3_S29_F3455, na.last = TRUE), (1:1183747)/1183747,
     type = "s",
     ylim = c(0, 1),
     main = paste("Single Empirical Cumulative Density Function (sECDF) of Response vs L3_S29_F3455\nNA = ", temp_NA, " (Missing: ", sprintf("%05.2f", 100 * temp_NA / 1183747), "% -> Response: ", sprintf("%05.2f", 100 * sum(mini_all$Response[is.na(mini_all$L3_S29_F3455)]) / 6879), "%)", sep = ""),
     xlab = "L3_S29_F3455",
     ylab = "f(Response)")
plot(sort(rank(mini_all$L3_S29_F3455, na.last = NA)), (1:(1183747 - temp_NA))/(1183747 - temp_NA),
     type = "s",
     ylim = c(0, 1),
     main = paste("Dual Empirical Cumulative Density Function (dECDF) of Response vs L3_S29_F3455\nNA = ", temp_NA, " (Missing: ", sprintf("%05.2f", 100 * temp_NA / 1183747), "% -> Response: ", sprintf("%05.2f", 100 * sum(mini_all$Response[is.na(mini_all$L3_S29_F3455)]) / 6879), "%)", sep = ""),
     xlab = "L3_S29_F3455",
     ylab = "f(Response)")

gc(verbose = FALSE)

mini_disc <- data.table(mini_all[, c("L3_S29_F3455", "date")])
fwrite(mini_disc, "Laurae/NumericDiscretize/L3_S29_F3455_date.csv")

mini_disc <- as.matrix(cbind(mini_all[, c("L3_S29_F3455", "date")], order = 1:1183747, Response = mini_all$Response))[!is.na(mini_all$L3_S29_F3455), ]

#mini_discretized <- disc.Topdown(mini_disc, method = 1)


## Ignore all this

set.seed(1111)
mini_kmeans <- kmeans(x = mini_disc[, 1:2], centers = 4, trace = 2)

mini_clustered <- as.data.frame(cbind(mini_disc, cluster = mini_kmeans$cluster))
mini_clustered$cluster <- as.factor(mini_clustered$cluster)
tableplot(mini_clustered, select = 1:4, sortCol = 4, nBins = 100)


set.seed(11111)
mini_tclust <- tclust(mini_disc[, 1:2], k = 4, alpha = 0.05, nstart = 10, iter.max = 10, drop.empty.clust = TRUE, trace = 2, warnings = 2)
discrimination <- DiscrFact(mini_tclust)
plot(discrimination)

mini_clustered <- as.data.frame(cbind(mini_disc, cluster = mini_tclust$cluster))
mini_clustered$cluster <- as.factor(mini_clustered$cluster)
tableplot(mini_clustered, select = 1:4, sortCol = 4, nBins = 100)


set.seed(11111)
mini_tkmeans <- tkmeans(mini_disc[, 1:2], k = 10, alpha = 0.05, nstart = 5, iter.max = 20, drop.empty.clust = TRUE, trace = 2, warnings = 2)
discrimination <- DiscrFact(mini_tkmeans)
plot(discrimination)

mini_clustered <- as.data.frame(cbind(mini_disc, cluster = mini_tkmeans$cluster))
mini_clustered$cluster <- as.factor(mini_clustered$cluster)
tableplot(mini_clustered, select = 1:5, sortCol = 5, nBins = 100)

max_k <- 10
max_alpha <- 10
mini_control <- data.frame(matrix(nrow = max_k * max_alpha, ncol = 3))
colnames(mini_control) <- c("k", "alpha", "loss")
for (i in 1:max_k) {
  for (j in 1:max_alpha) {
    cat("Doing k = ", sprintf("%02d", i), " & alpha = ", sprintf("%.2f", (j - 1) / 50), ": ", sep = "")
    mini_control[((i - 1) * max_k) + j, "k"] <- i
    mini_control[((i - 1) * max_k) + j, "alpha"] <- (j - 1) / 50
    gc(verbose = FALSE)
    set.seed(11111)
    mini_control[((i - 1) * max_k) + j, "loss"] <- -tkmeans(mini_disc[, 1:2], k = i, alpha = (j - 1) / 50, nstart = 5, iter.max = 20, drop.empty.clust = TRUE, trace = 0, warnings = 0)$obj
    cat("loss=", sprintf("%12.0f", mini_control[((i - 1) * max_k) + j, "loss"]), " [best found so far: k=", sprintf("%02d", mini_control[which.min(mini_control$loss)[1], "k"]), " & alpha=", sprintf("%.2f", mini_control[which.min(mini_control$loss)[1], "alpha"]), " with loss=", sprintf("%12.0f", min(mini_control[((i - 1) * max_k) + j, "loss"], na.rm = TRUE)), "]\n", sep = "")
  }
}



## This is more good

# current best
set.seed(11111)
mini_tkmeans <- tkmeans(mini_disc[, 1:2], k = 10, alpha = 0.18, nstart = 5, iter.max = 20, drop.empty.clust = TRUE, trace = 2, warnings = 2)
discrimination <- DiscrFact(mini_tkmeans)
plot(discrimination)

mini_clustered <- as.data.frame(cbind(mini_disc, cluster = mini_tkmeans$cluster))
mini_clustered$cluster <- as.factor(mini_clustered$cluster)
tableplot(mini_clustered, select = 1:5, sortCol = 5, nBins = 100)
