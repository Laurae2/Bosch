library(data.table)

setwd("E:/")


train_numeric <- readRDS("Laurae/jayjay_clean/train.rds")
train_numeric <- data.table(Id = train_numeric[, Id])
test_numeric <- readRDS("Laurae/jayjay_clean/test.rds")
test_numeric <- data.table(Id = test_numeric[, Id])

feature_names <- fread("Laurae/date_feat_lut_V2.txt", header = TRUE)
feature_names <- feature_names[, c("name_num", "station_V2")]
feature_names <- feature_names[!(feature_names$name_num == ""), ]
feature_names <- unique(feature_names$station_V2)

for (i in feature_names) {
  j <- paste("S", i, sep = "")
  train_numeric[, (j) := fread(paste("Laurae/20161031_xgb_stationlearner/xgb_train_S", i, "_val.csv", sep = ""))$x]
  test_numeric[, (j) := (fread(paste("Laurae/20161031_xgb_stationlearner/xgb_test_S", i, "_val.csv", sep = ""))$x / 5)]
  cat("Loaded " ,j, "\n" , sep = "")
}

saveRDS(train_numeric, "Laurae/20161031_xgb_stationlearner/xgb_train.rds", compress = TRUE)
saveRDS(test_numeric, "Laurae/20161031_xgb_stationlearner/xgb_test.rds", compress = TRUE)
