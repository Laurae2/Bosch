## DON'T RUN THIS BLINDLY
## Just check what you can do with
## Tons of mini scripts for starting stuff
## Not optimized for performance/speed

paste("DON'T RUN THIS BLINDLY")
for (i in 1:9999) {
  quit()
}




library(data.table)


setwd("D:/Data Science/Bosch")

train_numeric <- fread("train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970))
train_categorical <- fread("train_categorical.csv")
train_date <- fread("train_date.csv")

labels <- train_numeric$Response
write.csv(labels, file="labels.csv", row.names=FALSE)







# Work on numeric data

library(data.table)
#library(FFTrees)
library(xgboost)

setwd("D:/Data Science/Bosch")



train_numeric <- fread("train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970), data.table = FALSE)



labels <- read.csv("labels.csv")$x
labeled <- (labels == 1)
positives <- (labels == 1)



weights <- rep(0, 1183747)
weights[!labeled] <- 1
weights[labeled] <- length(labeled)/sum(labeled)

#missing_values <- data.frame(missing = rep(0, 1183747))

# Get column names
columns <- fread(input = "train_numeric.csv",
                 header = TRUE,
                 nrows = 0,
                 sep = ",",
                 stringsAsFactors = FALSE,
                 colClasses = rep("numeric", 970),
                 data.table = FALSE)
columns <- data.frame(columns = colnames(columns), appearance = rep(0, ncol(columns)), selection = rep(0, ncol(columns)), hit = rep(0, ncol(columns)), average_hit = rep(0, ncol(columns)), average_gain = rep(0, ncol(columns)), average_gain_hit = rep(0, ncol(columns)), stringsAsFactors = FALSE)
best_features <- character()

set.seed(11111)

train_numeric <- fread(input = "train_numeric.csv",
                       select = sample(2:969, 20), #picks 20 random variables
                       header = TRUE,
                       sep = ",",
                       stringsAsFactors = FALSE,
                       colClasses = rep("numeric", 970),
                       data.table = FALSE)

#print(colnames(train_numeric))

cat("I selected the following features to test: {", paste(colnames(train_numeric), collapse = ", "), "}\n", sep = "")

#missing_values$missing <- apply(train_numeric, 1, function(x) {sum(is.na(x))})
# mean(missing_values$missing[labeled]) # Positive
# mean(missing_values$missing[!labeled]) # Negative
missing_values <- apply(train_numeric, 1, function(x) {sum(is.na(x))})
cat("For a positive label, the missing value average is ", mean(missing_values[labeled]), ".\n", sep = "")
cat("For a negative label, the missing value average is ", mean(missing_values[!labeled]), ".\n", sep = "")


# For NA: if NA is good, then whether it is on left and right it is always good and makes the feature always showing up

MCC_objective <- function(preds, dtrain) {
  
  labels <- getinfo(dtrain, "label")
  positives <- (labels == 1)
  negatives <- (labels == 0)
  
  all_preds <- unique(preds)
  all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
  
  for (i in 1:nrow(all_preds)) {
    all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
    all_preds[i, "TN"] <- sum(preds[negatives] <= all_preds[i, "pred"])
    all_preds[i, "FP"] <- sum(preds[negatives] > all_preds[i, "pred"])
    all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
    all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
    all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
    all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
  }
  
  err <- max(all_preds[, "MCC"])
  return(list(metric = "mcc", value = err))
}

# Do left side of NA: negative
# train_temp <- cbind(train_numeric, missing = missing_values, label = labels)
# train_temp[is.na(train_temp)] <- -9999
# set.seed(11111)
# temp_model <- fft(formula = label ~ .,
#                   data = train_temp,
#                   train.p = 1,
#                   verbose = TRUE,
#                   max.levels = 4,
#                   hr.weight = 0.5,
#                   do.cart = FALSE,
#                   do.lr = FALSE)
# set.seed(11111)
# temp_model <- grow.ffts(formula = label ~ .,
#                         data.train = train_temp,
#                         verbose = TRUE,
#                         max.levels = 4,
#                         hr.weight = 0.5)
# 
# plot(temp_model)
# print(temp_model)
# summary(temp_model)




train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, cbind(train_numeric, missing = missing_values), na.action = "na.pass")), label = labels)
gc()
set.seed(11111)
temp_model <- xgb.train(data = train_temp,
                        nrounds = 1,
                        watchlist = list(train = train_temp),
                        max_depth = 5,
                        eta = 1,
                        eval_metric = MCC_objective,
                        objective = "binary:logistic",
                        verbose = FALSE)

preds <- predict(temp_model, newdata = train_temp)
positives <- (labels == 1)
negatives <- (labels == 0)
all_preds <- sort(unique(preds))
all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
for (i in 1:nrow(all_preds)) {
  all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
  all_preds[i, "TN"] <- sum(preds[negatives] <= all_preds[i, "pred"])
  all_preds[i, "FP"] <- sum(preds[negatives] > all_preds[i, "pred"])
  all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
  all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
  all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
  all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
}
cat("Maximum MCC reached: ", max(all_preds$MCC), "\n", sep = "")
plot(x = all_preds$pred, y = all_preds$MCC, type = "o", main = "MCC vs Prediction Threshold", xlab = "Prediction Threshold", ylab = "MCC")


importance <- as.data.frame(xgb.importance(model = temp_model, feature_names = c(colnames(train_numeric), "missing")))
best_features <- unique(c(best_features, importance[importance$Gain > 0.25, "Feature"]))

for (i in colnames(train_numeric)) {
  
  temp_id <- which(i == columns$columns)
  columns$appearance[temp_id] <- columns$appearance[temp_id] + 1
  columns$selection[temp_id] <- ifelse(i %in% importance$Feature, columns$selection[temp_id] + 1, columns$selection[temp_id])
  columns$hit[temp_id] <- ifelse(i %in% importance$Feature[importance$Gain > 0.25], columns$hit[temp_id] + 1, columns$hit[temp_id])
  columns$average_hit[temp_id] <- columns$hit[temp_id]/columns$appearance[temp_id]
  columns$average_gain[temp_id] <- ifelse(i %in% importance$Feature, (max(columns$hit[temp_id], 1) - 1)*columns$selection[temp_id] + importance$Gain[which(i == importance$Feature)] / columns$appearance[temp_id], columns$average_gain[temp_id])
  columns$average_gain_hit[temp_id] <- ifelse(i %in% importance$Feature[importance$Gain > 0.25], (columns$appearance[temp_id] - 1)*columns$selection[temp_id] + importance$Gain[which(i == importance$Feature)] / columns$appearance[temp_id], columns$average_gain_hit[temp_id])
  
}


# xgb.plot.tree(feature_names = c(colnames(train_numeric), "missing"), model = temp_model, n_first_tree = 1)
# xgb.plot.importance(importance_matrix = xgb.importance(model = temp_model, feature_names = c(colnames(train_numeric), "missing")))
# xgb.plot.multi.trees(feature_names = c(colnames(train_numeric), "missing"), model = temp_model, n_first_tree = 1)

InitializeParser <- function() {
  
  library(data.table)
  library(xgboost)
  library(R.utils)
  
  setwd("D:/Data Science/Bosch")
  
  MCC_objective <<- function(preds, dtrain) {
    
    labels <- getinfo(dtrain, "label")
    
    all_preds <- unique(preds)
    all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
    
    for (i in 1:nrow(all_preds)) {
      all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
      all_preds[i, "TN"] <- sum(preds[!positives] <= all_preds[i, "pred"])
      all_preds[i, "FP"] <- sum(preds[!positives] > all_preds[i, "pred"])
      all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
      all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
      all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
      all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
    }
    
    err <- max(all_preds[, "MCC"])
    return(list(metric = "mcc", value = err))
  }
  
  columns <<- fread(input = "train_numeric.csv",
                    header = TRUE,
                    nrows = 0,
                    sep = ",",
                    stringsAsFactors = FALSE,
                    colClasses = rep("numeric", 970),
                    data.table = FALSE)
  columns <<- data.frame(columns = colnames(columns), appearance = rep(0, ncol(columns)), selection = rep(0, ncol(columns)), hit = rep(0, ncol(columns)), average_hit = rep(0, ncol(columns)), average_gain = rep(0, ncol(columns)), average_gain_hit = rep(0, ncol(columns)), stringsAsFactors = FALSE)
  best_features <<- character()
  
  return(read.csv("labels.csv")$x)
  
}

InitializeLabels <- function(labels) {
  
  labeled <<- (labels == 1)
  positives <<- (labels == 1)
  return(labels)
  
}

AutomaticParser <- function(filename, featureIds, colClasses, tries = 10, batch = 50, batch_iter = 10, sampling = 20, min_gain = 0.25, min_mcc = 0.00, seed_load = 11111, seed_xgb = 11111, read = FALSE, unbatched_data = NA) {
  
  gc()
  
  time <- System$currentTimeMillis()
  
  for (j in 1:tries) {
    
    cat("[", format(Sys.time(), "%H:%M:%S"), " | ", sprintf("%7.3f", (System$currentTimeMillis() - time) / (1000 * (j-1))), " seconds/iteration] Run ", sprintf(paste("%", floor(log10(tries)+1), "d", sep = ""), j), " out of ", tries, "  |  Load", sep = "")
    
    set.seed(seed_load + j)
    
    if (read == FALSE) {
      
      # Using read from data directly fully loaded into memory
      train_data <- unbatched_data[, sample(2:969, sampling)]
      gc()
      train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels)
      
    } else {
      
      if (batch <= 1) {
        
        # Batch size = 1: load into memory only the required features
        train_data <- fread(input = filename,
                            select = sample(2:969, sampling),
                            header = TRUE,
                            sep = ",",
                            stringsAsFactors = FALSE,
                            colClasses = rep("numeric", 970),
                            data.table = FALSE,
                            verbose = FALSE,
                            showProgress = FALSE)
        train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels)
        
      } else {
        
        # Batch size > 1: load into memory lot of features, but only use them for a specified amount of iterations
        if (((j-1) %% batch_iter) == 0) {
          
          train_data_temp <- fread(input = filename,
                                   select = sample(2:969, batch),
                                   header = TRUE,
                                   sep = ",",
                                   stringsAsFactors = FALSE,
                                   colClasses = rep("numeric", 970),
                                   data.table = FALSE,
                                   verbose = FALSE,
                                   showProgress = FALSE)
          train_data <- train_data_temp[, sample(1:batch, sampling)]
          gc()
          train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels)
          
        } else {
          
          # Out of batch size > 1: use loaded data for this iteration only
          train_data <- train_data_temp[, sample(1:batch, sampling)]
          gc()
          train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels)
          
        }
        
      }
      
    }
    
    cat("ed  |  ", sep = "")
    
    gc()
    set.seed(seed_xgb)
    temp_model <- xgb.train(data = train_temp,
                            nrounds = 1,
                            watchlist = list(train = train_temp),
                            max_depth = 5,
                            eta = 1,
                            eval_metric = MCC_objective,
                            objective = "binary:logistic",
                            verbose = FALSE,
                            callbacks = list(cb.evaluation.log()))
    
    if (temp_model$evaluation_log$train_mcc > min_mcc) {
      
      # preds <- predict(temp_model, newdata = train_temp)
      # gc()
      # 
      # all_preds <- sort(unique(preds))
      # all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
      # for (i in 1:nrow(all_preds)) {
      #   all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
      #   all_preds[i, "TN"] <- sum(preds[!positives] <= all_preds[i, "pred"])
      #   all_preds[i, "FP"] <- sum(preds[!positives] > all_preds[i, "pred"])
      #   all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
      #   all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
      #   all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
      #   all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
      # }
      cat("Maximum MCC reached: ", sprintf("%10.8f", temp_model$evaluation_log$train_mcc), "  |  ", sep = "")
      #plot(x = all_preds$pred, y = all_preds$MCC, type = "o", main = "MCC vs Prediction Threshold", xlab = "Prediction Threshold", ylab = "MCC")
      
      importance <- as.data.frame(xgb.importance(model = temp_model, feature_names = c(colnames(train_data), "missing")))
      old_features <- length(best_features)
      best_features <<- unique(c(best_features, importance[importance$Gain > min_gain, "Feature"]))
      cat("Currently: ", sprintf("%03d", length(best_features)), " features (+", length(best_features) - old_features, ifelse((length(best_features) - old_features) > 0, "*", ""), ")\n", sep = "")
      
      for (i in colnames(train_data)) {
        
        temp_id <- which(i == columns$columns)
        columns$appearance[temp_id] <<- columns$appearance[temp_id] + 1
        columns$selection[temp_id] <<- ifelse(i %in% importance$Feature, columns$selection[temp_id] + 1, columns$selection[temp_id])
        columns$hit[temp_id] <<- ifelse(i %in% importance$Feature[importance$Gain > min_gain], columns$hit[temp_id] + 1, columns$hit[temp_id])
        columns$average_hit[temp_id] <<- columns$hit[temp_id]/columns$appearance[temp_id]
        columns$average_gain[temp_id] <<- ifelse(i %in% importance$Feature, ((max(columns$selection[temp_id], 1) - 1)*columns$average_gain[temp_id] + importance$Gain[which(i == importance$Feature)]) / columns$selection[temp_id], columns$average_gain[temp_id])
        columns$average_gain_hit[temp_id] <<- ifelse(i %in% importance$Feature[importance$Gain > min_gain], ((columns$hit[temp_id] - 1)*columns$average_gain[temp_id] + importance$Gain[which(i == importance$Feature)]) / columns$hit[temp_id], columns$average_gain_hit[temp_id])
        
      }
      
    } else {
      
      cat("No features found during this iteration (MCC = ", sprintf("%10.8f", temp_model$evaluation_log$train_mcc), " < ", min_mcc, ")\n", sep = "")
      
      for (i in colnames(train_data)) {
        
        temp_id <- which(i == columns$columns)
        columns$appearance[temp_id] <<- columns$appearance[temp_id] + 1
        columns$selection[temp_id] <<- columns$selection[temp_id]
        columns$hit[temp_id] <<- columns$hit[temp_id]
        columns$average_hit[temp_id] <<- columns$hit[temp_id]/columns$appearance[temp_id]
        columns$average_gain[temp_id] <<- columns$average_gain[temp_id]
        columns$average_gain_hit[temp_id] <<- columns$average_gain_hit[temp_id]
        
      }
      
    }
    
    gc()
    
  }
  
  return(columns)
  
}

labels <- InitializeLabels(InitializeParser())

#train_numeric <- fread("train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970), data.table = FALSE)


columned <- AutomaticParser(filename = "train_numeric.csv", featureIds = 2:969, colClasses = rep("numeric", 970))
columned <- AutomaticParser(filename = "train_numeric.csv", featureIds = 2:969, colClasses = rep("numeric", 970),
                            tries = 20, batch = 50, batch_iter = 5, sampling = 20,
                            min_gain = 1/3, min_mcc = 0.05, seed_load = 11111, seed_xgb = 11111, read = TRUE)
columned <- AutomaticParser(filename = "train_numeric.csv", featureIds = 2:969, colClasses = rep("numeric", 970),
                            tries = 2000, batch = NA, batch_iter = NA, sampling = 20,
                            min_gain = 0.4, min_mcc = 0.05, seed_load = 11111, seed_xgb = 11111, read = FALSE, unbatched_data = train_numeric)

write.csv(best_features, file = "features_numeric.csv", row.names = FALSE)
write.csv(columned, file = "features_numeric_analysis.csv", row.names = FALSE)





# Better work on numeric data with selected features

library(data.table)
library(xgboost)

setwd("D:/Data Science/Bosch")

labels <- read.csv("labels.csv")$x
labeled <- (labels == 1)
weights <- rep(0, 1183747)
weights[!labeled] <- 1
weights[labeled] <- length(labeled)/sum(labeled)

best_features <- as.character(read.csv("features_numeric.csv")$x)
best_numeric <- read.csv("features_numeric_analysis.csv", stringsAsFactors = FALSE)

train_data <- fread(input = "train_numeric.csv",
                    select = best_features,
                    header = TRUE,
                    sep = ",",
                    stringsAsFactors = FALSE,
                    colClasses = rep("numeric", 970),
                    data.table = FALSE)

apply(train_data, 2, function(x) {sum(is.na(x))}) # get how many NAs

write.csv(cbind(Response = labels, train_data), file = "better_train_numeric.csv", row.names = FALSE, na = "")


mini_sample <- (1:1183747)[!labeled]
mini_selection <- sample(mini_sample, sum(labeled))

train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data[c((1:1183747)[labeled], mini_selection), ], na.action = "na.pass")), label = labels[c((1:1183747)[labeled], mini_selection)])


train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels)
#train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data, na.action = "na.pass")), label = labels, weight = weights)
gc()
set.seed(11111)
temp_model <- xgb.cv(data = train_temp,
                     nthread = 2,
                     nfold = 4,
                     nrounds = 1000000,
                     max_depth = 5,
                     eta = 0.02,
                     #gamma = 20,
                     subsample = 0.7,
                     colsample_bytree = 0.7,
                     booster = "gbtree",
                     eval_metric = "error",
                     maximize = FALSE,
                     early_stopping_rounds = 20,
                     objective = "binary:logistic",
                     verbose = TRUE,
                     prediction = TRUE)


Mini_MCC <- function(preds, dtrain, threshold = NA) {
  
  if (typeof(dtrain) == "externalptr") {
    labels <- getinfo(dtrain, "label")
  } else {
    labels <- dtrain
  }
  
  positives <- (labels == 1)
  negatives <- (labels == 0)
  
  if (is.na(threshold)) {
    
    all_preds <- unique(preds)
    all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
    all_preds[, 2:6] <- apply(all_preds, 1, function(x) {
      TP <- as.numeric(sum(preds[positives] >= 0.5))
      TN <- as.numeric(sum(preds[negatives] < 0.5))
      FP <- as.numeric(sum(preds[negatives] >= 0.5))
      FN <- as.numeric(sum(preds[positives] < 0.5))
      MCC <- (TP * TN) - (FP * FN)
      MCC <- MCC / sqrt((TP + FP)*(TP + FN)*(TN + FP)*(TN + FN))
      return(c(TP, TN, FP, FN, MCC))
    })
    
    # for (i in 1:nrow(all_preds)) {
    #   all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
    #   all_preds[i, "TN"] <- sum(preds[negatives] <= all_preds[i, "pred"])
    #   all_preds[i, "FP"] <- sum(preds[negatives] > all_preds[i, "pred"])
    #   all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
    #   all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
    #   all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
    #   all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
    # }
    
    threshold <- all_preds[which.max(all_preds[, "MCC"])[1], "pred"]
    err <- max(all_preds[, "MCC"])
    
  } else {
    
    TP <- as.numeric(sum(preds[positives] >= threshold))
    TN <- as.numeric(sum(preds[negatives] < threshold))
    FP <- as.numeric(sum(preds[negatives] >= threshold))
    FN <- as.numeric(sum(preds[positives] < threshold))
    MCC <- (TP * TN) - (FP * FN)
    MCC <- MCC / sqrt((TP + FP)*(TP + FN)*(TN + FP)*(TN + FN))
    err <- ifelse(is.na(MCC), 0, MCC)
    
  }
  
  return(list(metric = "mcc", value = err, threshold = threshold))
  
}

Mini_MCC(temp_model$pred, train_temp)


valid_sample <- (1:1183747)[-mini_selection]
valid_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data[valid_sample, ], na.action = "na.pass")), label = labels[valid_sample])

preds_all <- rep(0, 1183747)


for (i in 1:length(temp_model$folds)) {
  
  train_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data[c((1:1183747)[labeled], mini_selection)[-temp_model$folds[[i]]], ], na.action = "na.pass")), label = labels[c((1:1183747)[labeled], mini_selection)[-temp_model$folds[[i]]]])
  test_temp <- xgb.DMatrix(data = data.matrix(model.frame(~.-1, train_data[c((1:1183747)[labeled], mini_selection)[temp_model$folds[[i]]], ], na.action = "na.pass")), label = labels[c((1:1183747)[labeled], mini_selection)[temp_model$folds[[i]]]])
  
  gc()
  set.seed(11111)
  temp_model_mini <- xgb.train(data = train_temp,
                       nthread = 2,
                       nrounds = 1000000,
                       max_depth = 5,
                       eta = 0.02,
                       #gamma = 20,
                       subsample = 0.7,
                       colsample_bytree = 0.7,
                       booster = "gbtree",
                       eval_metric = "error",
                       maximize = FALSE,
                       early_stopping_rounds = 20,
                       objective = "binary:logistic",
                       verbose = TRUE,
                       watchlist = list(train = train_temp, test = test_temp))
  preds1 <- predict(temp_model_mini, newdata = test_temp)
  preds2 <- predict(temp_model_mini, newdata = valid_temp)
  preds_all[c((1:1183747)[labeled], mini_selection)[temp_model$folds[[i]]]] <- preds1
  preds_all[valid_sample] <- preds2 + preds2/4
  
}


Mini_MCC(preds_all, labels, threshold = 0.77)$value
Mini_MCC(preds_all, labels)





# SVD testing

library(data.table)
library(recommenderlab)
library(irlba)

setwd("D:/Data Science/Bosch")
train_numeric <- fread("train_numeric.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, colClasses = rep("numeric", 970), data.table = FALSE)
train_numeric2 <- as.matrix(train_numeric[, 1:97])
train_numeric2 <- dropNA(train_numeric2)
gc()
train_numeric3 <- as.matrix(train_numeric[, 98:194])
train_numeric3 <- dropNA(train_numeric3)
gc()
train_numeric4 <- cbind(train_numeric2, train_numeric3)


# 8GB RAM VERSION

# Train Numeric
for (i in 1:10) {
  
  cat("Loading ", i, "th part.\n", sep = "")
  train_data_temp <- fread(input = "train_numeric.csv",
                           select = (97*(i-1)+1):(97*i),
                           header = TRUE,
                           sep = ",",
                           stringsAsFactors = FALSE,
                           colClasses = rep("numeric", 970),
                           data.table = TRUE)
  gc(verbose = FALSE)
  if (i > 1) {
    cat("Coercing to matrix.\n", sep = "")
    train_numeric_temp <- as.matrix(train_data_temp)
    rm(train_data_temp)
    gc(verbose = FALSE)
    cat("Coercing into dgCMatrix with NA as blank.\n", sep = "")
    train_numeric_temp <- dropNA(train_numeric_temp)
    gc(verbose = FALSE)
    cat("Column binding the full matrix with the newly created matrix.\n", sep = "")
    train_numeric <- cbind(train_numeric, train_numeric_temp)
    rm(train_numeric_temp)
    gc(verbose = FALSE)
  } else {
    cat("Coercing to matrix.\n", sep = "")
    train_numeric_temp <- as.matrix(train_data_temp)
    rm(train_data_temp)
    gc(verbose = FALSE)
    cat("Coercing into dgCMatrix with NA as blank.\n", sep = "")
    train_numeric <- dropNA(train_numeric_temp)
    gc(verbose = FALSE)
  }
  
}



# LOW RAM VERSION


# Train Numeric
for (i in 1:97) {
  
  cat("Loading ", i, "th part.\n", sep = "")
  train_data_temp <- fread(input = "train_numeric.csv",
                           select = (10*(i-1)+1):(10*i),
                           header = TRUE,
                           sep = ",",
                           stringsAsFactors = FALSE,
                           colClasses = rep("numeric", 970),
                           data.table = TRUE)
  gc(verbose = FALSE)
  if (i > 1) {
    cat("Coercing to matrix.\n", sep = "")
    train_numeric_temp <- as.matrix(train_data_temp)
    rm(train_data_temp)
    gc(verbose = FALSE)
    cat("Coercing into dgCMatrix with NA as blank.\n", sep = "")
    train_numeric_temp <- dropNA(train_numeric_temp)
    gc(verbose = FALSE)
    cat("Column binding the full matrix with the newly created matrix.\n", sep = "")
    train_numeric <- cbind(train_numeric, train_numeric_temp)
    rm(train_numeric_temp)
    gc(verbose = FALSE)
  } else {
    cat("Coercing to matrix.\n", sep = "")
    train_numeric_temp <- as.matrix(train_data_temp)
    rm(train_data_temp)
    gc(verbose = FALSE)
    cat("Coercing into dgCMatrix with NA as blank.\n", sep = "")
    train_numeric <- dropNA(train_numeric_temp)
    gc(verbose = FALSE)
  }
  
}

gc()

plot(x = 1:970, y = train_numeric@p[2:971] - train_numeric@p[1:970], type = "h", main = paste("Sparse matrix: memory req. per feature (Sum=", format(as.numeric(object.size(train_numeric)), big.mark = ","), " bytes)", sep = ""), xlab = "Feature ID", ylab = "Size in memory")

#####

gc()

saveRDS(train_numeric, file = "train_numeric.rds")

train <- readRDS(file = "train_numeric.rds")

identical(train, train_numeric) #TRUE


library(Matrix)
library(irlba)
library(xgboost)
library(recommenderlab)
#library(RSpectra)

setwd("D:/Data Science/Bosch")
train_numeric <- readRDS(file = "train_numeric.rds")[, -c(1, 970)] # Remove id and Response

# train_numeric <- readRDS(file = "train_numeric.rds")
# feature_select <- read.csv("features_numeric_analysis.csv", stringsAsFactors = FALSE)
# feature_best <- c("Response", feature_select[feature_select$hit > 0, "columns"])
# train_data <- train_numeric[, feature_best]
# train_export <- dropNA2matrix(train_data) # For NA -> NA
# train_export <- as.matrix(train_data) # For NA -> 0
# write.csv(train_export, file = "better_train_numeric_154only.csv", row.names = FALSE, na = "")

set.seed(11111)
temp_svd <- irlba(train_numeric, nv = 50, verbose = TRUE, tol = 1e-10, maxit = 100, work = 55)
#temp_svd <- svds(A = train_numeric, k = 50, opts = list(tol = 1e-10, maxitr = 100))
gc()
train_data <- temp_svd$u
summary(train_data)
gc()

write.csv(cbind(Response = labels, train_data), file = "svd_train_numeric.csv", row.names = FALSE, na = "")

labels <- read.csv("labels.csv")$x

train_temp <- xgb.DMatrix(data = train_data, label = labels)
#train_temp <- xgb.DMatrix(data = train_numeric, label = labels)


Mini_MCC <- function(preds, dtrain, threshold = NA) {
  
  if (typeof(dtrain) == "externalptr") {
    labels <- getinfo(dtrain, "label")
  } else {
    labels <- dtrain
  }
  
  positives <- (labels == 1)
  #negatives <- (labels == 0)
  
  if (is.na(threshold)[1]) {
    
    all_preds <- unique(preds)
    all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
    all_preds[, 2:6] <- t(apply(all_preds, 1, preds = preds, positives = positives, function(x, preds, positives) {
      TP <- as.numeric(sum(preds[positives] >= x[1]))
      TN <- as.numeric(sum(preds[!positives] < x[1]))
      FP <- as.numeric(sum(preds[!positives] >= x[1]))
      FN <- as.numeric(sum(preds[positives] < x[1]))
      MCC <- (TP * TN) - (FP * FN)
      MCC <- MCC / sqrt((TP + FP)*(TP + FN)*(TN + FP)*(TN + FN))
      MCC <- ifelse(is.na(MCC), 0, MCC)
      return(c(TP, TN, FP, FN, MCC))
    }))
    
    # for (i in 1:nrow(all_preds)) {
    #   all_preds[i, "TP"] <- sum(preds[positives] > all_preds[i, "pred"])
    #   all_preds[i, "TN"] <- sum(preds[negatives] <= all_preds[i, "pred"])
    #   all_preds[i, "FP"] <- sum(preds[negatives] > all_preds[i, "pred"])
    #   all_preds[i, "FN"] <- sum(preds[positives] <= all_preds[i, "pred"])
    #   all_preds[i, "MCC"] <- (((all_preds[i, "TP"] * all_preds[i, "TN"])) - ((all_preds[i, "FP"]) * all_preds[i, "FN"]))
    #   all_preds[i, "MCC"] <- all_preds[i, "MCC"] / sqrt((all_preds[i, "TP"] + all_preds[i, "FP"])*(all_preds[i, "TP"] + all_preds[i, "FN"])*(all_preds[i, "TN"] + all_preds[i, "FP"])*(all_preds[i, "TN"] + all_preds[i, "FN"]))
    #   all_preds[i, "MCC"] <- ifelse(is.na(all_preds[i, "MCC"]), 0, all_preds[i, "MCC"])
    # }
    
    threshold <- all_preds[which.max(all_preds[, "MCC"])[1], "pred"]
    err <- max(all_preds[, "MCC"])
    
  } else {
    
    
    # TP <- as.numeric(sum(preds[positives] >= threshold))
    # TN <- as.numeric(sum(preds[!positives] < threshold))
    # FP <- as.numeric(sum(preds[!positives] >= threshold))
    # FN <- as.numeric(sum(preds[positives] < threshold))
    # MCC <- (TP * TN) - (FP * FN)
    # MCC <- MCC / sqrt((TP + FP)*(TP + FN)*(TN + FP)*(TN + FN))
    # err <- ifelse(is.na(MCC), 0, MCC)
    
    all_preds <- unique(threshold)
    all_preds <- data.frame(pred = all_preds, TP = all_preds, TN = all_preds, FP = all_preds, FN = all_preds, MCC = all_preds)
    all_preds[, 2:6] <- t(apply(all_preds, 1, preds = preds, positives = positives, function(x, preds, positives) {
      TP <- as.numeric(sum(preds[positives] >= x[1]))
      TN <- as.numeric(sum(preds[!positives] < x[1]))
      FP <- as.numeric(sum(preds[!positives] >= x[1]))
      FN <- as.numeric(sum(preds[positives] < x[1]))
      MCC <- (TP * TN) - (FP * FN)
      MCC <- MCC / sqrt((TP + FP)*(TP + FN)*(TN + FP)*(TN + FN))
      MCC <- ifelse(is.na(MCC), 0, MCC)
      return(c(TP, TN, FP, FN, MCC))
    }))
    
    threshold <- all_preds[which.max(all_preds[, "MCC"])[1], "pred"]
    err <- max(all_preds[, "MCC"])
    
  }
  
  return(list(metric = "mcc", value = err, threshold = threshold))
  
}

# On ALL numeric features

# depth 10
# [12]	train-auc:0.794382+0.004076	test-auc:0.697689+0.000391
# 
# depth 9
# [13]	train-auc:0.794202+0.006823	test-auc:0.697651+0.002017
# 
# depth 8
# [12]	train-auc:0.757116+0.007195	test-auc:0.698040+0.005588
# 
# depth 7
# [12]	train-auc:0.746514+0.001336	test-auc:0.698240+0.003446
# 
# depth 6
# [15]	train-auc:0.757257+0.008499	test-auc:0.696623+0.002748
# 
# depth 5
# [14]	train-auc:0.730828+0.003357	test-auc:0.694776+0.002576

gc()
set.seed(11111)
temp_model <- xgb.cv(data = train_temp,
                     nthread = 1,
                     nfold = 2,
                     nrounds = 1000000,
                     max_depth = 9,
                     eta = 0.4,
                     #gamma = 20,
                     subsample = 0.7,
                     colsample_bytree = 0.7,
                     booster = "gbtree",
                     eval_metric = "auc",
                     maximize = TRUE,
                     early_stopping_rounds = 5,
                     objective = "binary:logistic",
                     verbose = TRUE,
                     prediction = TRUE)

Mini_MCC(temp_model$pred, train_temp)
Mini_MCC(temp_model$pred, train_temp, threshold = (1:1000)/1000)
Mini_MCC(temp_model$pred, train_temp, threshold = 0.0236343)






# T-SNE missing values

library(data.table)
library(propagate)
library(Rtsne)
library(ggplot2)
library(ggrepel)

setwd("D:/Data Science/Bosch")

train_data <- fread(input = "train_numeric.csv",
                    header = TRUE,
                    sep = ",",
                    stringsAsFactors = FALSE,
                    colClasses = rep("numeric", 970),
                    data.table = FALSE)

#train_data <- readRDS(file = "train_numeric.rds")

gc()

for (i in 1:969) {
  cat("\rStep ", i, "\n", sep = "")
  train_data[!is.na(train_data[, i]), i] <- 1
  train_data[is.na(train_data[, i]), i] <- 0
  if (i %% 10) {gc(verbose = FALSE)}
}
gc(verbose = FALSE)

cor_table <- bigcor(train_data, fun = "cor", size = 194, verbose = TRUE)
cor_out <- cor_table[1:970, 1:970]

colnames(cor_out) <- colnames(train_data)
cor_out <- cor_out[2:970, 2:970] # Remove ID

write.csv(cor_out, file = "cor_train_numeric.csv", row.names = FALSE)

#cor_out <- as.matrix(fread("cor_train_numeric.csv", header = TRUE, sep = ","))

gc(verbose = FALSE)
set.seed(78)
tsne_model <- Rtsne(data.frame(cor_out),
                    dims = 2,
                    #initial_dims = 50,
                    initial_dims = ncol(cor_out),
                    perplexity = 322, #floor((ncol(cor_out)-1)/3)
                    theta = 0.00,
                    check_duplicates = FALSE,
                    pca = FALSE,
                    max_iter = 1350,
                    verbose = TRUE,
                    is_distance = FALSE)
#which.min(tsne_model$itercosts)
#[Seed 78 | Iteration 1350: perplexity 322]: Sum of Squared Errors = 0.099456712




tsne_grid <- function(initial_diag, dims, perplexity_range = c(1, floor((ncol(initial_diag)-1)/3)), tries = 10, iterations = 10000, theta = 0.00, check_duplicates = FALSE, pca = FALSE, is_distance = FALSE) {
  
  best_cost <- 99999999
  
  for (i in perplexity_range[1]:perplexity_range[2]) {
    
    for (j in 1:tries) {
      
      set.seed(j)
      tsne_model <- Rtsne(initial_diag,
                          dims = dims,
                          initial_dims = ncol(initial_diag),
                          perplexity = i,
                          theta = theta,
                          check_duplicates = check_duplicates,
                          pca = pca,
                          max_iter = iterations,
                          verbose = FALSE,
                          is_distance = is_distance)
      
      cat("[Grid Search: perplexity ", sprintf(paste("%", floor(log10(perplexity_range[2]))+1, "d", sep = ""), i), "/", perplexity_range[2], ", ", sprintf(paste("%", floor(log10(tries))+1, "d", sep = ""), j), " out of ", tries, "]: Sum of Squared Errors = ", sprintf("%11.9f", min(tsne_model$itercosts)), sep = "")
      
      if (best_cost > min(tsne_model$itercosts)) {
        best_run <- j
        best_perp <- i
        best_cost <- min(tsne_model$itercosts)
        best_iter <- which.min(tsne_model$itercosts)[1]
        cat(" - Best is now ", sprintf("%11.9f", best_cost), " @ perplexity ", best_perp, " (***)\n", sep = "")
      } else {
        cat(" -    Best was ", sprintf("%11.9f", best_cost), " @ perplexity ", best_perp, " - NULL\n", sep = "")
      }
      
    }
    
  }
  
  cat("\nRunning best T-SNE\n")
  gc(verbose = FALSE)
  set.seed(best_run)
  best <- Rtsne(initial_diag,
                dims = dims,
                initial_dims = ncol(initial_diag),
                perplexity = best_perp,
                theta = theta,
                check_duplicates = check_duplicates,
                pca = pca,
                max_iter = best_iter*50,
                verbose = FALSE,
                is_distance = is_distance)
  cat("[Seed ", best_run, " | Iteration ", best_iter*50, ": perplexity ", best_perp, "]: Sum of Squared Errors = ", sprintf("%11.9f", min(best$itercosts)), "\nReturning best model...", sep = "")
  
  return(best)
  
}

tsne_model <- tsne_grid(initial_diag = data.frame(cor_out),
                        dims = 2,
                        perplexity_range = c(floor((ncol(cor_out)-1)/3), floor((ncol(cor_out)-1)/3)),
                        tries = 100,
                        iterations = 1500,
                        theta = 0.0,
                        check_duplicates = FALSE,
                        pca = FALSE,
                        is_distance = FALSE)

corMatrix_out <- as.data.frame(tsne_model$Y)
cor_kmeans <- kmeans(corMatrix_out, centers = 5, iter.max = 10, nstart = 3)
corMatrix_outclust <- as.factor(c(cor_kmeans$cluster[1:968], 6))
corMatrix_names <- colnames(cor_out)
ggplot(corMatrix_out, aes(x = V1, y = V2, color = corMatrix_outclust, shape = corMatrix_outclust)) + geom_point(size = 2.5) + geom_rug() + stat_ellipse(type = "norm") + ggtitle("T-SNE of Features") + xlab("X") + ylab("Y") + labs(color = "Cluster", shape = "Cluster") + geom_text_repel(aes(x = V1, y = V2, label = corMatrix_names), size = 2.8)
