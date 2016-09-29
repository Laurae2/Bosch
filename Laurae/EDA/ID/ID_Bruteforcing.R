# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(xgboost)
library(pbapply)
library(tabplot)

setwd("E:/")

# Load data

train_numeric_sparse <- readRDS("datasets/train_numeric_sparse.rds")
Y <- train_numeric_sparse[, 970]
train <- data.table(cbind(Id = train_numeric_sparse[, 1], type = rep(1, 1183747), Response = Y))

gc()
test_numeric_sparse <- readRDS("datasets/test_numeric_sparse.rds")
test <- data.table(cbind(Id = test_numeric_sparse[, 1], type = rep(-1, 1183748), Response = rep(-1, 1183748)))


# Combine train & test

data <- rbind(train, test)
data <- data[order(rank(Id)), ]


# Brute force appproach, too lazy to use Run-Length Encoding
# If we find Response = 0 or -1 (unknown), assign value i while adding 1 afterwards
# If we find Response = 1, assign value i while resetting i to 1 afterwards
# When we have only access to the current vector: we store the previous value (we assume previous_0 = 0)
# To avoid leakage, we presume Response=0 to assign i (it's why we reset afterwards and not before)
# 
# if (x == 1) {assign r=i, set i=1, return r}
# if (x < 1) {assign r=i, set i=i+1, return r}

i <- 1 # setup temporary counter
#j <- 0 # previous value
data_feat <- pbapply(data, 1, function(x) {r <- i; i <<- ifelse(x[3] == 1, 1, i + 1); return(r)})

data_temp <- as.data.frame(cbind(Feature = data_feat[data$type == 1], Response = data$Response[data$type == 1]))
#data_temp$Response <- as.factor(data_temp$Response)
tableplot(data_temp, select = 1:2, sortCol = 1, nBins = 172)



# Test a model

StratifiedCV <- function(Y, i, seed) {
  folded <- list()
  folded1 <- list()
  folded2 <- list()
  set.seed(seed)
  temp_Y0 <- which(Y == 0)
  temp_Y1 <- which(Y == 1)
  for (i in 1:5) {
    folded1[[i]] <- sample(temp_Y0, floor(length(temp_Y0) / (6 - i)))
    temp_Y0 <- temp_Y0[!temp_Y0 %in% folded1[[i]]]
    folded2[[i]] <- sample(temp_Y1, floor(length(temp_Y1) / (6 - i)))
    temp_Y1 <- temp_Y1[!temp_Y1 %in% folded2[[i]]]
    folded[[i]] <- c(folded1[[i]], folded2[[i]])
  }
  return(folded)
}

folded <- StratifiedCV(Y, 5, 11111)


data_mini <- as.matrix(data_temp$Feature)


data_xgb <- xgb.DMatrix(data = data_mini, label = data_temp$Response)

gc(verbose = FALSE) #frees up RAM
set.seed(11111) #ensures reproducibility
modelization.cv <- xgb.cv(data = data_xgb,
                          nthread = 2,
                          folds = folded,
                          max_depth = 10,
                          eta = 0.1,
                          gamma = 0,
                          subsample = 1.00,
                          colsample_bytree = 1.00,
                          nrounds = 100000,
                          booster = "gbtree",
                          objective = "binary:logistic",
                          eval_metric = "auc",
                          verbose = TRUE,
                          early_stopping_rounds = 50,
                          maximize = TRUE)




# Joost's feature

joost <- fread("Laurae/feature_set_ID.csv", header = FALSE)
colnames(joost) <- c("Id", "joost")
joosted <- merge(joost, train, by = "Id", all.y = TRUE)

data_xgb <- xgb.DMatrix(data = as.matrix(joosted$joost), label = joosted$Response)

gc(verbose = FALSE) #frees up RAM
set.seed(11111) #ensures reproducibility
modelization.cv <- xgb.cv(data = data_xgb,
                          nthread = 2,
                          folds = folded,
                          max_depth = 10,
                          eta = 0.1,
                          gamma = 0,
                          subsample = 1.00,
                          colsample_bytree = 1.00,
                          nrounds = 100000,
                          booster = "gbtree",
                          objective = "binary:logistic",
                          eval_metric = "auc",
                          verbose = TRUE,
                          early_stopping_rounds = 50,
                          maximize = TRUE)
