# Rescales predictions
# Folds must be a list containing in each vector of the list the indexes of the folds
# Please input CV_Preds = CV predictions in a list like LightGBM output: [[1]]=fold1 preds, [[2]]=fold2 preds...
# CV Vector sizes: 236748, 237649, 236750, 236750, 236750
# Please input Test_Preds = Per-fold predictions in a list like LightGBM output: [[1]]=fold1 preds, [[2]]=fold2 preds...
# Test Vector sizes: 1183748, 1183748, 1183748, 1183748, 1183748
# Returns in a list CV + Test predictions.
# my_preds <- Rescaler(folds, temp_model$Validation[[2]], temp_model$Testing[[2]])
# my_CV <- my_preds[["CV"]]
# my_Test <- my_preds[["Test"]]
# fwrite(my_CV, "aaa_stacker_preds_train_headerY.csv", row.names = FALSE)
# fwrite(my_Test, "aaa_stacker_preds_test_headerY.csv", row.names = FALSE)

Rescaler <- function(folds, CV_Preds, Test_Preds) {
  All_Scale <- list()
  CV_All <- numeric(1183747)
  Test_Scale <- numeric(1183748)
  for (i in 1:length(folds)) {
    All_Scale[[i]] <- c(CV_Preds[[i]], Test_Preds[[i]])
    All_Scale[[i]] <- rank(All_Scale[[i]], ties.method = "average") / length(All_Scale[[i]])
    CV_Preds[[i]] <- All_Scale[[i]][1:length(CV_Preds[[i]])]
    CV_All[folds[[i]]] <- CV_Preds[[i]]
    Test_Preds[[i]] <- All_Scale[[i]][(length(CV_Preds[[i]]) + 1):length(All_Scale[[i]])]
    Test_Scale <- Test_Scale + (Test_Preds[[i]] / length(folds))
  }
  returned <- list()
  returned[["CV"]] <- CV_All
  returned[["CV_Fold"]] <- CV_Preds
  returned[["Test"]] <- Test_Scale
  returned[["Test_Fold"]] <- Test_Preds
  
  return(returned)
}
