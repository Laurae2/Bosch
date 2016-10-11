# Load libraries
library(data.table)
library(recommenderlab)
library(pbapply)


# Set your working directory there =)
setwd("E:/")


# Load data
data <- readRDS("datasets/train_numeric.rds")


for (i in 1:969) {
  
  #ecdfed <- ecdf(data[[i]])
  #plot(ecdfed)
  temp_NA <- sum(is.na(data[[i]]))
  if ((min(data[[i]], na.rm = TRUE) == max(data[[i]], na.rm = TRUE)) | (sum(is.na(data[[i]])) == 1183747)) {
    # do nothing
  } else {
    plot(sort(data[[i]], na.last = TRUE), (1:1183747)/1183747,
         type = "s",
         ylim = c(0, 1),
         main = paste("Empirical Cumulative Density Function (ECDF) of Response vs ", colnames(data)[i], "\nNA = ", temp_NA, " (Missing: ", sprintf("%05.2f", 100 * temp_NA / 1183747), "% -> Response: ", sprintf("%05.2f", 100 * sum(data$Response[is.na(data[[i]])]) / 6879), "%)", sep = ""),
         xlab = colnames(data)[i],
         ylab = "f(Response)"
    )
  }
  gc(verbose = FALSE)
  
}
