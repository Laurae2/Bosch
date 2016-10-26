# Libraries

library(data.table)
library(Matrix)
library(Laurae)
library(pbapply)
library(R.utils)
library(matrixStats)
library(tabplot)

setwd("E:/")

train_date <- readRDS("datasets/train_date.rds")
test_date <- readRDS("datasets/test_date.rds")
label <- readRDS("datasets/labels.rds")

date <- rbindlist(list(train_date, test_date))

rm(train_date, test_date)
gc()

feature_names <- fread("Laurae/date_feat_lut_V2.txt", header = TRUE)
feature_names <- feature_names[!name_dat == "", ]

ids <- date$Id

table_out <- data.table(Id = ids)

date_L0 <- date[, grep("L0", colnames(date)), with = FALSE]
date_L0_min <- date_L0[, feat := rowMins(as.matrix(.SD), na.rm = TRUE)]$feat
date_L0_min[is.infinite(date_L0_min)] <- NA
gc()
date_L0_max <- date_L0[, feat := rowMaxs(as.matrix(.SD), na.rm = TRUE)]$feat
date_L0_max[is.infinite(date_L0_max)] <- NA
rm(date_L0)
gc()

date_L1 <- date[, grep("L1", colnames(date)), with = FALSE]
date_L1_min <- date_L1[, feat := rowMins(as.matrix(.SD), na.rm = TRUE)]$feat
date_L1_min[is.infinite(date_L1_min)] <- NA
gc()
date_L1_max <- date_L1[, feat := rowMaxs(as.matrix(.SD), na.rm = TRUE)]$feat
date_L1_max[is.infinite(date_L1_max)] <- NA
rm(date_L1)
gc()

date_L2 <- date[, grep("L2", colnames(date)), with = FALSE]
date_L2_min <- date_L2[, feat := rowMins(as.matrix(.SD), na.rm = TRUE)]$feat
date_L2_min[is.infinite(date_L2_min)] <- NA
gc()
date_L2_max <- date_L2[, feat := rowMaxs(as.matrix(.SD), na.rm = TRUE)]$feat
date_L2_max[is.infinite(date_L2_max)] <- NA
rm(date_L2)
gc()

date_L3 <- date[, grep("L3", colnames(date)), with = FALSE]
date_L3_min <- date_L3[, feat := rowMins(as.matrix(.SD), na.rm = TRUE)]$feat
date_L3_min[is.infinite(date_L3_min)] <- NA
gc()
date_L3_max <- date_L3[, feat := rowMaxs(as.matrix(.SD), na.rm = TRUE)]$feat
date_L3_max[is.infinite(date_L3_max)] <- NA
rm(date_L3)
gc()

date_Lall <- data.table(date_L0_min, date_L0_max, date_L1_min, date_L1_max, date_L2_min, date_L2_max, date_L3_min, date_L3_max)
date_Lall_min <- date_Lall[, feat := rowMins(as.matrix(.SD), na.rm = TRUE)]$feat
date_Lall_min[is.infinite(date_Lall_min)] <- NA
gc()
date_Lall_max <- date_Lall[, feat := rowMaxs(as.matrix(.SD), na.rm = TRUE)]$feat
date_Lall_max[is.infinite(date_Lall_max)] <- NA
rm(date_Lall)
gc()

WindowCreator <- function(Ids, Label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, ...) {
  
  if (browser) browser()
  
  StartingTime <- System$currentTimeMillis()
  # Prepare data
  my_features <- data.table(Id = Ids, ...)
  label_ids <- data.table(Id = Ids[1:1183747], Response = label)
  
  # Merge label
  my_features <- merge(my_features, label_ids, by = "Id", all.x = TRUE)
  
  # Do order
  my_features <- my_features[order(..., decreasing = !ascending)]
  
  # Create temp features
  if (type == "both") {
    my_names <- paste("uuu", 1:window, sep = "")
    my_features[, (my_names) := shift(Response, n = 1:window, fill = fill, type = "lag")]
    gc(verbose = FALSE)
    my_names <- paste("vvv", 1:window, sep = "")
    my_features[, (my_names) := shift(Response, n = 1:window, fill = fill, type = "lead")]
    gc(verbose = FALSE)
    my_names <- c(paste("uuu", 1:window, sep = ""), paste("vvv", 1:window, sep = ""))
  } else {
    my_names <- paste("uuu", 1:window, sep = "")
    my_features[, (my_names) := shift(Response, n = 1:window, fill = fill, type = type)]
    gc(verbose = FALSE)
  }
  
  # Compute window
  my_features[, Positives := rowSums(.SD, na.rm = TRUE), .SDcols = my_names]
  my_features[, Negatives := rowSums(!.SD, na.rm = TRUE), .SDcols = my_names]
  my_features[, Feature := log10(Positives / (Negatives + Positives) + 1)]
  
  if (std) {
    gc(verbose = FALSE)
    my_features <- data.table(Id = my_features$Id, Feature = my_features$Feature)
    
    if (type == "both") {
      my_names <- paste("uuu", 1:window, sep = "")
      my_features[, (my_names) := shift(Feature, n = 1:window, fill = fill, type = "lag")]
      gc(verbose = FALSE)
      my_names <- paste("vvv", 1:window, sep = "")
      my_features[, (my_names) := shift(Feature, n = 1:window, fill = fill, type = "lead")]
      gc(verbose = FALSE)
      my_names <- c(paste("uuu", 1:window, sep = ""), paste("vvv", 1:window, sep = ""))
    } else {
      my_names <- paste("uuu", 1:window, sep = "")
      my_features[, (my_names) := shift(Feature, n = 1:window, fill = fill, type = type)]
      gc(verbose = FALSE)
    }
    my_features[, Feature := sd(.SD, na.rm = TRUE), .SDcols = my_names]
    
  }
  
  # Get back original row form
  my_extra <- data.table(Id = Ids, Order = 1:2367495)
  my_features <- data.table(Id = my_features$Id, Feature = my_features$Feature)
  my_extra <- merge(my_extra, my_features, by = "Id", all.x = TRUE)
  my_extra <- my_extra[order(Order, decreasing = FALSE)]
  
  # Harvest data
  feature <- my_extra$Feature
  rm(my_features, my_extra, my_names, label_ids)
  gc(verbose = FALSE)
  
  cat("CPU time: ", sprintf("%05.2f", (System$currentTimeMillis() - StartingTime) / 1000), " seconds.\n", sep = "")
  
  return(feature)
  
}

CreateLots <- function(degree = 2, summarize = FALSE, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE) {
  
  table_out <- data.table(Id = ids)
  
  if (degree == 2) {
    
    table_out[, paste(toupper(type), "La", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_Lall_max, date_Lall_min)
    table_out[, paste(toupper(type), "L0", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L0_max, date_L0_min)
    table_out[, paste(toupper(type), "L1", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L1_max, date_L1_min)
    table_out[, paste(toupper(type), "L2", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L2_max, date_L2_min)
    table_out[, paste(toupper(type), "L3", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L3_max, date_L3_min)
    
    if (summarize) {
      table_out[, (paste(toupper(type), "M2", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := rowMeans(.SD, na.rm = TRUE), .SD = colnames(table_out)[2:6]]
      table_out[, (paste(toupper(type), "S2", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := sd(as.matrix(.SD), na.rm = TRUE), .SD = colnames(table_out)[2:6]]
    }
    
  } else {
    
    if (degree == 3) {
      
      table_out[, paste(toupper(type), "L1L0", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L1_max, date_L1_min, date_L0_max, date_L0_min)
      table_out[, paste(toupper(type), "L2L1", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L2_max, date_L2_min, date_L1_max, date_L1_min)
      table_out[, paste(toupper(type), "L3L2", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L3_max, date_L3_min, date_L2_max, date_L2_min)
      
      if (summarize) {
        table_out[, (paste(toupper(type), "M3", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := rowMeans(.SD, na.rm = TRUE), .SD = colnames(table_out)[2:4]]
        table_out[, (paste(toupper(type), "S3", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := sd(as.matrix(.SD), na.rm = TRUE), .SD = colnames(table_out)[2:4]]
      }
      
    } else {
      
      if (degree == 4) {
        
        table_out[, paste(toupper(type), "L2L1L0", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L2_max, date_L2_min, date_L1_max, date_L1_min, date_L0_max, date_L0_min)
        table_out[, paste(toupper(type), "L3L2L1", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L3_max, date_L3_min, date_L2_max, date_L2_min, date_L1_max, date_L1_min)
        
        if (summarize) {
          table_out[, (paste(toupper(type), "M4", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := rowMeans(.SD, na.rm = TRUE), .SD = colnames(table_out)[2:3]]
          table_out[, (paste(toupper(type), "S4", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")) := sd(as.matrix(.SD), na.rm = TRUE), .SD = colnames(table_out)[2:3]]
        }
        
      } else {
        
        if (degree == 5) {
          
          table_out[, paste(toupper(type), "L3L2L1L0", ifelse(std, "STD", "MEAN"), window, ifelse(ascending, "ASC", "DESC"), sep = "_")] <- WindowCreator(Ids = ids, Label = label, type = type, std = std, fill = fill, window = window, ascending = ascending, browser = FALSE, date_L3_max, date_L3_min, date_L2_max, date_L2_min, date_L1_max, date_L1_min, date_L0_max, date_L0_min)
          
        }
        
      }
      
    }
    
  }
  
  table_out$Id <- NULL
  return(table_out)
  
}

windowing <- 165
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)

windowing <- 100
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)

windowing <- 60
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)

windowing <- 30
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 2, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 3, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 4, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lag", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "lead", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)
table_out <- DTcbind(table_out, CreateLots(degree = 5, summarize = TRUE, type = "both", std = FALSE, fill = NA, window = windowing, ascending = TRUE), low_mem = FALSE, collect = 1, silent = FALSE)

fwrite(table_out, "Laurae/jayjay_features/Laurae_All_30_60_100_165.csv", verbose = TRUE)

# # Lag/Lead 100 Lall
# table_out[, "Lag_100_La_Max"] <- WindowCreator(Ids = ids, Label = label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_Lall_max, date_Lall_min)
# table_out$Lead_100_La_Max <- WindowCreator(Ids = ids, Label = label, type = "lead", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_Lall_max, date_Lall_min)
# table_out$LL_100_La_Max <- WindowCreator(Ids = ids, Label = label, type = "both", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_Lall_max, date_Lall_min)
# 
# # Lag/Lead 100 L0
# table_out$Lag_100_L0_Max <- WindowCreator(Ids = ids, Label = label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L0_max, date_L0_min)
# table_out$Lead_100_L0_Max <- WindowCreator(Ids = ids, Label = label, type = "lead", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L0_max, date_L0_min)
# table_out$LL_100_L0_Max <- WindowCreator(Ids = ids, Label = label, type = "both", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L0_max, date_L0_min)
# 
# # Lag/Lead 100 L1
# table_out$Lag_100_L1_Max <- WindowCreator(Ids = ids, Label = label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L1_max, date_L1_min)
# table_out$Lead_100_L1_Max <- WindowCreator(Ids = ids, Label = label, type = "lead", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L1_max, date_L1_min)
# table_out$LL_100_L1_Max <- WindowCreator(Ids = ids, Label = label, type = "both", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L1_max, date_L1_min)
# 
# # Lag/Lead 100 L2
# table_out$Lag_100_L2_Max <- WindowCreator(Ids = ids, Label = label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L2_max, date_L2_min)
# table_out$Lead_100_L2_Max <- WindowCreator(Ids = ids, Label = label, type = "lead", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L2_max, date_L2_min)
# table_out$LL_100_L2_Max <- WindowCreator(Ids = ids, Label = label, type = "both", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L2_max, date_L2_min)
# 
# # Lag/Lead 100 L3
# table_out$Lag_100_L3_Max <- WindowCreator(Ids = ids, Label = label, type = "lag", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L3_max, date_L3_min)
# table_out$Lead_100_L3_Max <- WindowCreator(Ids = ids, Label = label, type = "lead", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L3_max, date_L3_min)
# table_out$LL_100_L3_Max <- WindowCreator(Ids = ids, Label = label, type = "both", std = FALSE, fill = NA, window = 100, ascending = TRUE, browser = FALSE, date_L3_max, date_L3_min)
# 
# table_out_df <- copy(table_out)
# setDF(table_out_df)
# table_out_df <- table_out_df[1:1183747, ]
# table_out_df$Response <- label
# 
# tableplot(table_out_df, sortCol = 12, nBins = 200, scales = "lin")
# 
# temp <- WindowCreator(Ids = ids, Label = label, type = "lag", window = 100, ascending = TRUE, browser = FALSE, date_L3_max, date_L3_min, date_L2_max, date_L2_min, date_L1_max, date_L1_min, date_L0_max, date_L0_min)
# 
# my_features <- data.table(Id = ids, MinTime = MinMin_features, MaxTime = MaxMax_features)
# my_features <- merge(my_features, label_ids, by = "Id", all.x = TRUE)
# my_features <- my_features[order(MaxTime, MinTime, decreasing = FALSE)]
# my_features[, c(paste("cv.lag", 1:100, sep = "")) := shift(Response, n = 1:100, fill = 0, type = "lag")]
# gc()
# my_names <- paste("cv.lag", 1:100, sep = "")
# my_features[, Positives := rowSums(.SD, na.rm = TRUE), .SDcols = my_names]
# my_features[, Negatives := rowSums(!.SD, na.rm = TRUE), .SDcols = my_names]
# my_features[, Feature := log10(Positives / (Negatives + Positives) + 1)]
# 
# setkey(my_features, Id)
# my_features[c(4, 6, 7, 9, 11, 13, 14, 16, 18, 23, 26, 27, 28), list(Id, Feature)]
# data$Feature[which(data$Id == c(4, 6, 7, 9, 11, 13, 14, 16, 18, 23, 26, 27, 28))]
# gc()
