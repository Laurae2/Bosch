i <- 0
format.eval.string <- function(iter, eval_res, eval_err=NULL) {
  if (length(eval_res) == 0)
    stop('no evaluation results')
  enames <- names(eval_res)
  if (is.null(enames))
    stop('evaluation results must have names')
  iter <- sprintf('[%d]\t', iter)
  if (!is.null(eval_err)) {
    if (length(eval_res) != length(eval_err))
      stop('eval_res & eval_err lengths mismatch')
    res <- paste0(sprintf("%s:%f+%f", enames, eval_res, eval_err), collapse='\t')
  } else {
    res <- paste0(sprintf("%s:%f", enames, eval_res), collapse='\t')
  }
  return(paste0(iter, res))
}


NVL <- function(x, val) {
  if (is.null(x))
    return(val)
  if (is.vector(x)) {
    x[is.na(x)] <- val
    return(x)
  }
  if (typeof(x) == 'closure')
    return(x)
  stop("typeof(x) == ", typeof(x), " is not supported by NVL")
}

cb.early.stop <- function(stopping_rounds, maximize=FALSE, 
                          metric_name=NULL, verbose=TRUE) {
  # state variables
  best_iteration <- -1
  best_ntreelimit <- -1
  best_score <- Inf
  best_msg <- NULL
  metric_idx <- 1
  
  init <- function(env) {
    if (length(env$bst_evaluation) == 0)
      stop("For early stopping, watchlist must have at least one element")
    
    eval_names <- gsub('-', '_', names(env$bst_evaluation))
    if (!is.null(metric_name)) {
      metric_idx <<- which(gsub('-', '_', metric_name) == eval_names)
      if (length(metric_idx) == 0)
        stop("'metric_name' for early stopping is not one of the following:\n",
             paste(eval_names, collapse=' '), '\n')
    }
    
    metric_name <<- eval_names[metric_idx]
    
    best_iteration <<- 1
    if (maximize) best_score <<- -Inf
    
    env$stop_condition <- FALSE
    
    if (!is.null(env$bst)) {
      if (class(env$bst) != 'xgb.Booster')
        stop("'bst' in the parent frame must be an 'xgb.Booster'")
      if (!is.null(best_score <- xgb.attr(env$bst$handle, 'best_score'))) {
        best_score <<- as.numeric(best_score)
        best_iteration <<- as.numeric(xgb.attr(env$bst$handle, 'best_iteration')) + 1
        best_msg <<- as.numeric(xgb.attr(env$bst$handle, 'best_msg'))
      } else {
        xgb.attributes(env$bst$handle) <- list(best_iteration = best_iteration - 1,
                                               best_score = best_score)
      }
    } else if (is.null(env$bst_folds) || is.null(env$basket)) {
      stop("Parent frame has neither 'bst' nor ('bst_folds' and 'basket')")
    }
  }
  
  finalizer <- function(env) {
    if (!is.null(env$bst)) {
      attr_best_score = as.numeric(xgb.attr(env$bst$handle, 'best_score'))
      if (!((best_score < (attr_best_score + 1e-12)) & (best_score > (attr_best_score - 1e-12))))
        stop("Inconsistent 'best_score' values between the closure state: ", best_score,
             " and the xgb.attr: ", attr_best_score)
      env$bst$best_iteration = best_iteration
      env$bst$best_ntreelimit = best_ntreelimit
      env$bst$best_score = best_score
    } else {
      env$basket$best_iteration <- best_iteration
      env$basket$best_ntreelimit <- best_ntreelimit
    }
  }
  
  callback <- function(env = parent.frame(), finalize = FALSE) {
    if (best_iteration < 0)
      init(env)
    
    if (finalize)
      return(finalizer(env))
    
    i <- env$iteration
    score = env$bst_evaluation[metric_idx]
    
    if (( maximize && score > best_score) ||
        (!maximize && score < best_score)) {
      
      best_msg <<- format.eval.string(i, env$bst_evaluation, env$bst_evaluation_err)
      best_score <<- score
      best_iteration <<- i
      best_ntreelimit <<- best_iteration * env$num_parallel_tree
      # save the property to attributes, so they will occur in checkpoint
      if (!is.null(env$bst)) {
        xgb.attributes(env$bst) <- list(
          best_iteration = best_iteration - 1, # convert to 0-based index
          best_score = best_score,
          best_msg = best_msg,
          best_ntreelimit = best_ntreelimit)
      }
    } else if (i - best_iteration >= stopping_rounds) {
      env$stop_condition <- TRUE
      env$end_iteration <- i
      if (verbose && NVL(env$rank, 0) == 0)
        cat("Stopping. Best iteration:\n", best_msg, "\n\n", sep = '')
    }
  }
  attr(callback, 'call') <- match.call()
  attr(callback, 'name') <- 'cb.early.stop'
  callback
}

mcc_eval_pred <- function(y_prob, y_true) {
  y_true <- y_true
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  return(DT[['y_prob']][which.max(DT[['mcc_v']])]) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
}





mcc_eval_print <- function(y_prob, y_true) {
  y_true <- y_true
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  return(max(DT[['mcc_v']])) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
}


mcc <- function(TP, FP, FN, TN)
{
  num <- (TP * TN) - (FP * FN)
  den <- (TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)
  return(ifelse(den == 0, 0, num / sqrt(den)))
}

eval_mmcDT <- function(y_true, y_prob, show = FALSE) {
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  i <<- i + 1
  if ((i %% 50) == 0) {gc(verbose = FALSE)}
  
  return(max(DT[['mcc_v']]))
  
}

mcc_eval <- function(pred, dtrain) {
  y_true <- getinfo(dtrain, "label")
  
  DT <- data.table(y_true = y_true, y_prob = pred, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  #if ((i %% 10) == 0) {print(DT[['y_prob']][which.max(DT[['mcc_v']])]); j <- 0} else {j <<- j + 0.2*DT[['y_prob']][which.max(DT[['mcc_v']])]} #comment for no prob output
  
  return(list(metric = "mcc", value = max(DT[['mcc_v']])))
  
}



mcc_eval_nofail <- function(pred, dtrain) {
  y_true <- getinfo(dtrain, "label")
  
  DT <- data.table(y_true = y_true, y_prob = pred, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := cumsum(y_true == 0)]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  i <<- i + 1
  if ((i %% 40) == 0) {gc(verbose = FALSE)}
  
  return(list(metric = "mcc", value = ifelse(i < 21, 0.005*i, round(max(DT[['mcc_v']]), digits = 12)))) #makes xgboost blinds for 10 training rounds or 4 rounds of 5-fold CV
  
}


my_exp1<-function(d1, vn1, vn2, y, vnp, filter, cred_k, r_k=.3){
  d2<-d1[, c(vn1, vn2, y, vnp)]
  names(d2)<-c("f1", "f2", "a", "p")
  d2$filter<-filter
  sum1<-sqldf("select f1, f2, sum(1) as cnt, sum(p) as sump, sum(a) as suma from d2 where filter=1 group by 1,2")
  tmp1<-sqldf("select a.p, b.cnt, b.sump, b.suma from d2 a left join sum1 b on a.f1=b.f1 and a.f2=b.f2")
  tmp1$cnt[is.na(tmp1$cnt)]<-0
  tmp1$avgp<-with(tmp1, sump/cnt)
  tmp1$avgp[is.na(tmp1$avgp)]<-0
  tmp1$suma[is.na(tmp1$suma)]<-0
  tmp1$cnt[filter]<-tmp1$cnt[filter]-1
  tmp1$suma[filter]<-tmp1$suma[filter]-d1$y[filter]
  tmp1$exp_a<-with(tmp1, suma/cnt)
  tmp1$adj_a<-with(tmp1, (suma+p*cred_k)/(cnt+cred_k))
  tmp1$exp_a[is.na(tmp1$exp_a)]<-tmp1$p[is.na(tmp1$exp_a)]
  tmp1$adj_a[is.na(tmp1$adj_a)]<-tmp1$p[is.na(tmp1$adj_a)]
  tmp1$adj_a[filter]<-tmp1$adj_a[filter]*(1+(runif(sum(filter))-0.5)*r_k)
  return(tmp1)
}

auc_cal <- function(pred,actual){
  r <- as.numeric(rank(pred))
  actual = train_numeric_sparse$Response
  n_pos <- as.numeric(sum(actual == 1))
  n_neg <- as.numeric(length(actual) - n_pos)
  auc <- (sum(r[actual == 1]) - n_pos * (n_pos + 1)/2)/(n_pos *  n_neg)
  auc
}


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