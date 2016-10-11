# Load libraries
library(data.table)
#library(tabplot)
#library(RSKC)
#library(sparcl)
library(cluster)
#library(tclust)
library(propagate)
library(recommenderlab)
library(pbapply)

# Set your working directory there =)
setwd("E:/")

# Install old package
install.packages("https://cran.r-project.org/src/contrib/Archive/tabplot/tabplot_1.1.tar.gz", repos=NULL, type="source")
library(tabplot)

# gc()
# train_numeric <- readRDS("datasets/train_numeric.rds")
# test_numeric <- readRDS("datasets/test_numeric.rds")
# 
# Y <- train_numeric$Response
# ID <- c(train_numeric$Id, test_numeric$Id)
# train_numeric <- train_numeric[, c(2:969), with = FALSE]
# test_numeric <- test_numeric[, c(2:969), with = FALSE]
# gc()
# 
# # Merge data
# data_numeric <- rbind(train_numeric, test_numeric)
# gc()
# 
# # Some cleanup
# rm(train_numeric, test_numeric)
# gc()
# 
# #[1:1183747, ]
# #[1183748:2367495, ]
# 
# 
# # Some non sense
# # DF <- matrix(rnorm(100), ncol = 10)
# # row.names(DF) <- paste("r", 1:10, sep = "")
# # DF[3,] <- NA
# # res <- kmeans(na.omit(DF), 3)$cluster
# # res
# # DF <- cbind(DF, 'clus' = NA)
# # DF[names(res),][,11] <- res
# # print(DF[,11])
# 
# 
# 
# 
# # Do semi-supervised clustering... require first to transpose data
# data_numeric <- t(data_numeric) # to matrix - memory 54GB
# gc()
# 
# #data_numeric <- dropNA(data_numeric) # to sparse
# 
# 
# # Trying 3 clusters
# 
# #w_best <- KMeansSparseCluster.permute(data_numeric, K = 5, nperms = 25, wbounds = NULL, silent = FALSE, nvals = 10, centers = NULL)
# #clustering <- KMeansSparseCluster(data_numeric, K = 5, wbounds = 12, nstart = 10, silent = FALSE, maxiter = 6, centers = NULL)
# 
# distance_matrix <- daisy(x = data_numeric, metric = "euclidean")





# New method: use only train_numeric

gc()
data <- readRDS("datasets/train_numeric.rds")
#data2 <- readRDS("datasets/test_numeric.rds")
Y <- data$Response
ID <- data$Id
#ID <- c(data$Id, data2$Id)
data <- data[, 2:969, with = FALSE]
#data2 <- data2[, 2:969, with = FALSE]
gc()
# data <- rbind(data, data2)
# rm(data2)
# data2 <- is.na(data)
gc()
columns <- colnames(data)

# Compute the 969x969 dissimilarity matrix on 8.5GB data...
#distance_matrix <- daisy(x = data, metric = "euclidean", stand = FALSE)

# Don't forget to restart everytime

# Compute the correlation matrix - Part 1
rm(data)
gc()
data <- readRDS("datasets/train_numeric.rds")[, 2:969, with = FALSE]
gc()
data[is.na(data)] <- -2
gc()
data <- data + 1
gc()
cor_store1 <- bigcor(data, fun = "cor", size = 242, verbose = TRUE, method = "pearson")
cor_table1 <- cor_store1[1:968, 1:968]
gc()
saveRDS(cor_table1, "Laurae/NumericCluster/pearsonPos.rds", compress = TRUE)

# Compute the correlation matrix - Part 2
rm(data)
gc()
data <- readRDS("datasets/train_numeric.rds")[, 2:969, with = FALSE]
gc()
data[is.na(data)] <- 2
gc()
data <- data - 1
gc()
cor_store2 <- bigcor(data, fun = "cor", size = 242, verbose = TRUE, method = "pearson")
cor_table2 <- cor_store2[1:968, 1:968]
gc()
saveRDS(cor_table2, "Laurae/NumericCluster/pearsonNeg.rds", compress = TRUE)


# Compute the association matrix - Part 1
rm(data)
gc()
data <- readRDS("datasets/train_numeric.rds")[, 2:969, with = FALSE]
gc()
data <- pbapply(data, 2, function(x) {rank(x, na.last = FALSE, ties.method = "average")})
gc()
cor_store3 <- bigcor(data, fun = "cor", size = 242, verbose = TRUE, method = "pearson")
cor_table3 <- cor_store3[1:968, 1:968]
gc()
saveRDS(cor_table3, "Laurae/NumericCluster/kendallPos.rds", compress = TRUE)

# Compute the association matrix - Part 2
rm(data)
gc()
data <- readRDS("datasets/train_numeric.rds")[, 2:969, with = FALSE]
gc()
data <- pbapply(data, 2, function(x) {rank(x, na.last = TRUE, ties.method = "average")})
gc()
cor_store4 <- bigcor(data, fun = "cor", size = 242, verbose = TRUE, method = "pearson")
cor_table4 <- cor_store4[1:968, 1:968]
gc()
saveRDS(cor_table4, "Laurae/NumericCluster/kendallNeg.rds", compress = TRUE)

rm(data)
gc()




# Work on correlation matrices


data <- readRDS("datasets/train_numeric.rds")
data <- as.matrix(data)
gc()
cor_table1 <- readRDS("Laurae/NumericCluster/pearsonPos.rds")
cor_table2 <- readRDS("Laurae/NumericCluster/pearsonNeg.rds")
cor_table3 <- readRDS("Laurae/NumericCluster/kendallPos.rds")
cor_table4 <- readRDS("Laurae/NumericCluster/kendallNeg.rds")

cor_pearson <- (1 - ((cor_table1 + cor_table2) / 2)) / 2 # Merge missing values and convert to dissimilarity matrix
cor_kendall <- (1 - ((cor_table3 + cor_table4) / 2)) / 2 # Merge missing values and convert to dissimilarity matrix
gc()

good_k <- 72
cor_used <- cor_pearson
metric_type <- "manhattan" # either manhattan or euclidean
super_fast <- TRUE # keep TRUE for permutation method
grad_method <- 2 # keep 2

set.seed(11111) # k-medoids is deterministic by nature, no "randomness" so this line is not needed but still
clustering <- pam(x = cor_used, k = good_k, diss = TRUE, metric = metric_type, stand = FALSE, do.swap = super_fast, pamonce = grad_method, trace.lev = 2)
plot(clustering, dist = cor_used, which.plots = 1)
silhouettes <- silhouette(clustering$clustering, dist = cor_used)
plot(silhouettes)

silhouettes <- data.frame(matrix(nrow = 0, ncol = 2))
colnames(silhouettes) <- c("Clusters", "Width")
j <- 1
for (i in 2:150) {
  set.seed(11111) # k-medoids is deterministic by nature, no "randomness" so this line is not needed but still
  silhouettes[j, ] <- c(i, pam(x = cor_used, k = i, diss = TRUE, metric = metric_type, stand = FALSE, do.swap = super_fast, pamonce = grad_method, trace.lev = 1)$silinfo$avg.width)
  gc(verbose = FALSE)
  j <- j + 1
}
best_k <- silhouettes$Clusters[which.max(silhouettes$Width)]
cat("silhouette-optimal number of clusters: ", best_k, "\n", sep = "")
silhouettes

plot(silhouettes$Clusters, silhouettes$Width, type = "h", main = "Clustering assessment", xlab = "k-clusters", ylab = "Average silhouette width")
axis(1, best_k, paste("best", best_k, sep = "\n"), col = "red", col.axis = "red")

for (i in 1:best_k) {
  
  medoids <- which(clustering$clustering == i)
  mini_data <- as.data.frame(data[, c(1, medoids + 1, 970)])
  #mini_data$Response <- as.factor(mini_data$Response)
  colnames(mini_data) <- paste("v", sub("F", "", sub("S", "", sub("L", "", colnames(mini_data)))), sep = "")
  gc(verbose = FALSE)
  #limits <- pbapply(mini_data[, -ncol(mini_data)], 2, function(x) {range(x, na.rm = TRUE)})
  #limits <- as.list(as.data.frame(limits))
  plotted <- tableplot(mini_data, select = (1:(length(medoids) + 2)), sortCol = (which(medoids == clustering$medoids[i]) + 1), nBins = 43, scales = "lin", bias_brokenX = 1, plot = FALSE)
  #plotted <- tableplot(mini_data, select = (1:(length(medoids) + 2)), sortCol = (clustering$medoids[i] + 1), nBins = 43, scales = "lin", bias_brokenX = 1, limitsX = limits, plot = FALSE)
  print(plot(plotted, title = paste("Cluster ", i, " (sorted by ", colnames(mini_data)[(which(medoids == clustering$medoids[i]) + 1)], ")", sep = ""), showTitle = TRUE, fontsize = 7, rotateNames = 75, legend.lines = 6))
  gc(verbose = FALSE)
  
}
