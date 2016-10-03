#running a model with the id duplicate trick from shubin and laurae:

library(data.table)
library(ggplot2)
library(dplyr)
library(xgboost)
library(caret)


train_numeric_sparse <- readRDS("/Users/alexpapiu/Documents/Data/Bosh/train_numeric.rds")
dupped = fread('https://raw.githubusercontent.com/apapiu/bosh/master/data_dupped4.csv?token=AM_Q2W0L8C-Q-i01v2YlE_eDB7agj7DMks5X-fvIwA%3D%3D')

dupped_train = dupped[1:nrow(train_numeric_sparse)]$x


numeric_features <- c("L3_S32_F3850", "L3_S29_F3412", "L1_S24_F1723", "L3_S33_F3865", "L1_S24_F1846", "L1_S24_F1695",
                      "L3_S33_F3859", "L3_S30_F3519", "L3_S33_F3873", "L3_S29_F3407", "L1_S24_F1632", "L3_S30_F3724",
                      "L3_S30_F3809", "L3_S29_F3382", "L1_S24_F1604", "L3_S30_F3704", "L1_S24_F1844", "L1_S24_F1498",
                      "L3_S38_F3956", "L3_S38_F3960", "L3_S33_F3867", "L3_S33_F3857", "L3_S29_F3351", "L3_S38_F3952",
                      "L1_S24_F867",  "L3_S29_F3339", "L3_S33_F3855", "L0_S0_F20",    "L3_S30_F3744", "L3_S30_F3554",
                      "L3_S34_F3880", "L2_S26_F3040", "L3_S29_F3395", "L3_S30_F3754", "L3_S29_F3479", "L3_S29_F3458",
                      "L2_S27_F3166", "L3_S30_F3804", "L1_S24_F1609", "L3_S30_F3759", "L1_S24_F1842", "L0_S0_F22",   
                      "L3_S36_F3920", "L0_S1_F24",    "L0_S4_F104",   "L3_S29_F3348", "L3_S33_F3861", "L1_S24_F1758",
                      "L0_S12_F350",  "L3_S29_F3336", "L3_S34_F3876", "L3_S30_F3769", "L3_S30_F3774", "L1_S24_F1578",
                      "L0_S1_F28")

numeric_features_id <- c(numeric_features, "Id", "Response")

train_numeric_sparse[,numeric_features, with = FALSE] -> sm_train


sm_train$dupped = dupped_train

#adding the id helps a bit.
sm_train$id = train_numeric_sparse$Id/nrow(train_numeric_sparse)

y = train_numeric_sparse$Response

#just writing the data for aws:
#train_num_aws = train_numeric_sparse[,numeric_features_id, with = FALSE]
#train_num_aws$dupped = dupped_train
#saveRDS(train_num_aws, "/Users/alexpapiu/Documents/Data/Bosh/train_num_aws.rds", compress = TRUE)


#model building:
set.seed(134)
tr_index = createDataPartition(as.factor(y), p = 0.9, list = FALSE) #this is stratified

sm_val = sm_train[-tr_index]
sm_train = sm_train[tr_index]

y_train = y[tr_index]
y_val = y[-tr_index]

system.time(
dtrain <- xgb.DMatrix(sm_train %>% as.matrix(), 
                     label = y_train,
                     missing ="NAN"))


dval = xgb.DMatrix(sm_val %>% as.matrix(), 
                     label = y_val,
                     missing ="NAN")

model_num <- xgb.train(data = dtrain, 
                      watchlist = list(val = dval, train = dtrain),
                      nrounds = 5,
                      max_depth = 5,
                      eta = 0.3,
                      subsample = 0.8,
                      eval_metric = "auc",
                      objective = "binary:logistic", 
                      early.stop.round = 12,
                      maximize = TRUE)


#imp = xgb.importance(feature_names = names(sm_train),model = model_num) 
#xgb.plot.importance(imp)

preds_num = predict(model_num, dval)

sapply(seq(0.01, 0.5, by = 0.01),USE.NAMES = TRUE, function(tresh){ 
    preds = 1*(preds_num > tresh)
    mcc(table(preds, y_val))
}) -> mccs

plot(seq(0.01, 0.5, by = 0.01), mccs)

max(mccs)
which.max(mccs)


plot(1:10)
