# Large-scale benchmark: https://www.kaggle.com/laurae2/bosch-production-line-performance/r-implementation-of-mcc-optimization-from-rohan/

mcc <- function(TP, FP, FN, TN)
{
    num <- (TP*TN) - (FP*FN)
    den <- (TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)
    return(ifelse(den == 0, 0, num/sqrt(den)))
}

eval_mmc <- function(y_true, y_prob, show=F) {
  idx <- order(y_prob)
  y_prob_sort <- y_prob[idx]
  y_true_sort <- y_true[idx]
  n <- length(y_true)
  nump <- sum(y_true)
  numn <- n- nump

  tn_v <- cumsum(y_true_sort == 0)
  fp_v <- cumsum(y_true_sort == 1)
  fn_v <- numn - tn_v
  tp_v <- nump - fp_v
  sup_v <- tp_v * tn_v - fp_v * fn_v
  inf_v <- sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))
  mcc_v <- sup_v/inf_v
  mcc_v[!is.finite(mcc_v)] <- 0
  best_id <- which.max(mcc_v)
  best_mcc <- mcc_v[best_id]
  best_proba <- y_prob_sort[best_id]

  if (show) {
    y_pred <- as.numeric(y_prob > best_proba)
    score <- mcc(y_true, y_pred)
    cat("\n",score, best_mcc)
    return(list(best_proba, best_mcc, y_pred))
  } else {
    return(best_mcc)
  }
}
