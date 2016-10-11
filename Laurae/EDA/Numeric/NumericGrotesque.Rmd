---
title: "Numeric Clustering"
author: "Laurae"
date: "October 06, 2016"
output:
  html_document: default
  html_notebook:
    pandoc_args:
    - +RTS
    - -K3584m
    - -RTS
    self_contained: no
---

# Introduction

This prints the tableplots in grotesque (20 bins), hyper-accurate (200 bins), and extreme (500 bins) modes. There are six pictures per plot (3 for numeric-sorted, 3 for date-sorted).

Make sure you use the not self_contained version of the document. It loads much faster without all the useless things.

# Plot interpretation

For the grotesque tableplots:

* Observations are sorted vertically by the feature indicated with a triangle
* Each vertical part of 5% represents a bin (of approximately 59,187 observations)
* Each horizontal part of each subplot is the horizontal mean of the bin of the variable
* Red horizontal lines on a bin are missing values
* Full horizontal stripes are fully missing values for the bin
* A typical "Response" average value per bin should be 5.7e-3 (more accuractely: 0.005724916)

For the hyper-accurate tableplots

* Observations are sorted vertically by the feature indicated with a triangle
* Each vertical part of 0.5% represents a bin (of approximately 5,919 observations)
* Each horizontal part of each subplot is the horizontal mean of the bin of the variable
* Red horizontal lines on a bin are missing values
* Full horizontal stripes are fully missing values for the bin
* A typical "Response" average value per bin should be 0.57e-2 (more accuractely: 0.005724916)

For the extreme tableplots

* Observations are sorted vertically by the feature indicated with a triangle
* Each vertical part of 0.2% represents a bin (of approximately 2,367 observations)
* Each horizontal part of each subplot is the horizontal mean of the bin of the variable
* Red horizontal lines on a bin are missing values
* Full horizontal stripes are fully missing values for the bin
* A typical "Response" average value per bin should be 0.57e-2 (more accuractely: 0.005724916)

The structural difference between the grotesque and hyper-accurate plots:

* The grotesque plot is heavily prone to underfitting data visually
* The hyper-accurate plot is prone to overfitting data visually
* The extreme plot is heavily prone to overfitting data visually

Therefore, you better play with both before jumping in a conclusion!

# Setting up work

```{r}
# Load libraries
library(data.table)
library(tabplot)

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
```

# Plotting madness =)

```{r, fig.width = 14, fig.height = 8, results="asis"}

pb <- winProgressBar(title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Preparing computation...", sep = ""), min = 0, max = 6776, initial = 0, width = 520)

for (i in 1:968) {
  
  cat("  \n  \n##Feature ", sprintf("%03d", i), ": ", colnames(train)[i + 1], "  \n  \n", sep = "")
  
  cat("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", sprintf("%03d", i), " (", colnames(train)[i + 1], ")...  \n", sep = "")
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 6, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 6) / 6776), "%), preprocessing...", sep = ""))
  mini_all <- as.data.frame(cbind(train[, c(colnames(train)[i + 1], "Response"), with = FALSE], date = date[1:1183747, get(paste("S", feature_names$Station[which(colnames(train)[i + 1] == feature_names$Feature)], "_Min", sep = ""))]))
  gc(verbose = FALSE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 5, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 5) / 6776), "%), plot 1 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 1,
               nBins = 20,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Numeric: Grotesque mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 4, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 4) / 6776), "%), plot 2 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 3,
               nBins = 20,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Date: Grotesque mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 3, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 3) / 6776), "%), plot 3 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 1,
               nBins = 200,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Numeric: Accurate mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 2, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 2) / 6776), "%), plot 4 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 3,
               nBins = 200,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Date: Accurate mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 1, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 1) / 6776), "%), plot 5 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 1,
               nBins = 500,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Numeric: Extreme mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  
  setWinProgressBar(pb, value = (i * 7) - 0, title = "Tableplot Plotting", label = paste("[", format(Sys.time(), "%a %b %d %Y %X"), "] Doing feature ", colnames(train)[i + 1], " (", sprintf("%03d", i), " / 968 = ", sprintf("%05.2f", 100 * (i * 7 - 0) / 6776), "%), plot 6 of 6...", sep = ""))
  plot(tableplot(as.data.frame(mini_all),
               select = 1:3,
               sortCol = 3,
               nBins = 500,
               plot = FALSE),
     fontsize = 12,
     legend.lines = 8,
     title = paste("Tableplot of ", colnames(train)[i + 1], " (Date: Extreme mode)"),
     showTitle = TRUE,
     showNumAxes = TRUE)
  
  
  gc(verbose = FALSE)
  
}

close(pb)

```
