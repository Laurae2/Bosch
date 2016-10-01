# Load libraries
library(data.table)
library(tabplot)

# Set your working directory there =)
setwd("D:/Data Science/Bosch")

# Load Joost Bloom's data
#paths <- fread("path_unique_string_per_station.csv", header = TRUE, colClasses = c("numeric", "character"))
#paths <- fread("eda_product_flow_unique_paths_station.csv", header = TRUE, colClasses = c("numeric", "character"))
paths <- fread("eda_product_flow_unique_paths_station_extra.csv", header = TRUE, colClasses = c("numeric", "character"))
colnames(paths) <- c("id", "string")
characters <- nchar(paths$string[1])

# Convert single string to numeric as a post-processing
for (i in 1:characters) {
  paths[[paste("V", sprintf("%03d", i), sep = "")]] <- as.numeric(substr(paths$string, i, i))
}
paths <- paths[, string := NULL]

data <- as.matrix(paths[, 2:(characters + 1), with = FALSE])

# Save the post-processed data
#write.csv(data, file = "path_unique_string_per_station_parsed.csv")
#write.csv(data, file = "eda_product_flow_unique_paths_station_parsed.csv")
write.csv(data, file = "eda_product_flow_unique_paths_station_extra_parsed.csv")

# Setup things for tableplot
colorlist <- list()
factored <- as.data.frame(data)
for (i in 1:characters) {
  factored[[i]] <- as.factor(factored[[i]])
  colorlist[[colnames(factored)[i]]] <- "Set5"
}

# Compute the hierarchical clustering
gc()
distances <- dist(data, "binary")
clustered <- hclust(distances)
plot(clustered)

# # Cut the tree to depth 4
# clustered_cu <- cutree(clustered, 4)
# temp_data <- cbind(cluster = as.character(clustered_cu), factored)
# 
# # Compute k-means
# clustered_cu <- kmeans(data, centers = 4, iter.max = 100, nstart = 100)
# temp_data <- cbind(cluster = as.character(clustered_cu$cluster), factored)


# Output to JPEG as a gigantic plot
# jpeg(filename = "plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
# tableplot(temp_data, select = 1:53, sortCol = 1, pals = colorlist, nBins = 400)
# dev.off()

# Output to file
#write.csv(clustered_cu, file = "path_unique_string_per_station_4clusters.csv", quote = FALSE)
#write.csv(clustered_cu, file = "eda_product_flow_unique_paths_station_4clusters.csv", quote = FALSE)

for (i in 3:30) {
  
  # Hierarchical Clustering
  # clustered_cu <- cutree(clustered, i)
  # temp_data <- cbind(cluster = as.character(clustered_cu), factored)
  
  # k-means
  cat("Doing clustering #", sprintf("%02d", i), " / 30\n", sep = "")
  gc(verbose = FALSE)
  set.seed(11111)
  clustered_cu <- kmeans(data, centers = i, iter.max = 100, nstart = 100)
  temp_data <- cbind(cluster = as.character(clustered_cu$cluster), factored)
  
  # Output to JPEG as a gigantic plot
  # jpeg(filename = paste("plot_", i, ".jpg", sep = ""), width = 5740, height = 1320, units = "px", pointsize = 6)
  # tableplot(temp_data, select = 1:(characters + 1), sortCol = 1, pals = colorlist, nBins = 400)
  # dev.off()
  
  write.csv(clustered_cu$cluster, file = paste("eda_product_flow_unique_paths_station_extra_", sprintf("%02d", i), "clusters.csv", sep = ""), quote = FALSE)
  
}
