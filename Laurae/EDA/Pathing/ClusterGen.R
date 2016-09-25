# Load libraries
library(data.table)
library(tabplot)

# Set your working directory there =)
setwd("D:/Data Science/Bosch")

# Load Joost Bloom's data
paths <- fread("path_unique_string_per_station.csv", header = TRUE, colClasses = c("numeric", "character"))

# Convert single string to numeric as a post-processing
for (i in 1:52) {
  paths[[paste("V", sprintf("%02d", i), sep = "")]] <- as.numeric(substr(paths$string, i, i))
}
paths <- paths[, string := NULL]

data <- as.matrix(paths[, 2:53, with = FALSE])

# Save the post-processed data
write.csv(data, file = "path_unique_string_per_station_parsed.csv")

# Setup things for tableplot
colorlist <- list()
factored <- as.data.frame(data)
for (i in 1:52) {
  factored[[i]] <- as.factor(factored[[i]])
  colorlist[[colnames(factored)[i]]] <- "Set5"
}

# Compute the hierarchical clustering
gc()
distances <- dist(data, "binary")
clustered <- hclust(distances)
plot(clustered)

# Cut the tree to depth 7
clustered_cu <- cutree(clustered, 7)
temp_data <- cbind(cluster = as.character(clustered_cu), factored)

# Output to JPEG as a gigantic plot
jpeg(filename = "plot.jpg", width = 5740, height = 1320, units = "px", pointsize = 6)
tableplot(temp_data, select = 1:53, sortCol = 1, pals = colorlist, nBins = 400)
dev.off()

# Output to file
write.csv(clustered_cu, file = "path_unique_string_per_station_7clusters.csv", quote = FALSE)
