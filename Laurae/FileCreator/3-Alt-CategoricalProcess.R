# Libraries

library(data.table)
library(Matrix)
library(matrixStats)
library(fastdigest)

setwd("E:/")


# ~~~~~~ Part 0: redo spooky hashes because there were columns missing...


# Load data

gc()
train_categorical <- readRDS("datasets/train_categorical.rds")
print(ncol(train_categorical))
print(format(object.size(train_categorical), units = "MB"))

test_categorical <- readRDS("datasets/test_categorical.rds")
print(ncol(test_categorical))
print(format(object.size(test_categorical), units = "MB"))


# Compute hashes

gc()
spooky <- numeric(ncol(train_categorical))
for (i in 1:ncol(train_categorical)) {
  spooky[i] <- fastdigest(train_categorical[[i]]) # Compute hash only on training data... obviously
  if ((i %% 10) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 100) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

# Select by unique hashes
write.csv(spooky, "datasets/categorical_spooky.csv", row.names = FALSE, quote = FALSE)
train_categorical <- train_categorical[, which(!duplicated(spooky)), with = FALSE]
gc()
test_categorical <- test_categorical[, which(!duplicated(spooky)), with = FALSE]
gc()



# ~~~~~~ Part 1: find common factors between train and test by column

based <-  Matrix(as.matrix(c(train_categorical$Id, test_categorical$Id)), sparse = TRUE)
based@Dimnames[[2]] <- "Id"
#based <- data.table(data.frame(Id = train_categorical$Id))
columns <- colnames(train_categorical)
diff <- list()
diff[["count"]] <- data.frame(name = numeric(228), common = numeric(228), train = numeric(228), test = numeric(228), clean = numeric(228))
diff[["what"]] <- list()
diff[["what"]][["Id"]] <- character(0)
diff[["count"]][1, "name"] <- "Id"
diff[["count"]][1, "clean"] <- FALSE

for (i in 2:228) {
  diff[["what"]][[columns[i]]] <- levels(train_categorical[[i]])[levels(train_categorical[[i]]) %in% levels(test_categorical[[i]])]
  diff[["count"]][i, "name"] <- columns[i]
  diff[["count"]][i, "common"] <- length(diff[["what"]][[columns[i]]])
  diff[["count"]][i, "train"] <- length(levels(train_categorical[[i]]))
  diff[["count"]][i, "test"] <- length(levels(test_categorical[[i]]))
  diff[["count"]][i, "clean"] <- diff[["count"]]$common[i] < max(diff[["count"]]$train[i], diff[["count"]]$test[i])
  cat("[", sprintf("%03d", i), " / 228] Feature ", columns[i], " has ", diff[["count"]][i, "common"], " / ", diff[["count"]][i, "train"], " / ", diff[["count"]][i, "test"], " values (Common / Train / Test).\n", sep = "")
}

# Bind train and test for faster processing
gc()
data <- rbind(train_categorical, test_categorical)

# Convert common factors to a sparse matrix with appropriate column names
sparsed <- based
for (i in 2:228) {
  
  cat("[", sprintf("%03d", i), " / 228] ", sep = "")
  
  if (diff[["count"]][i, "common"] <= 1) {
    # do nothing, constant column
    cat("Column ", i, " has no adequate common values.")
    
  } else {
    
    if (diff[["count"]][i, "common"] == 2) {
      cat("Column ", i, " has two common factors. Coercing to one factor.")
      mini_data <- t(fac2sparse(data[[i]])) # single columnar
      
      # Requires cleaning unknown factors?
      if (diff[["count"]]$clean[i] == TRUE) {
        mini_data <- mini_data[, which(mini_data@Dimnames[[2]] %in% diff[["what"]][[columns[i]]])]
      } else {
        # do nothing
      }
      
      # Keep the maximum number of zeroes for binary encoding
      tabulation <- colSums(mini_data)
      if (tabulation[1] > tabulation[2]) {
        based <- cbind(based, mini_data[, 2])
        based@Dimnames[[2]][based@Dim[2]] <- paste(columns[i], ":", mini_data@Dimnames[[2]][2], collapse = "", sep = "")
      } else {
        based <- cbind(based, mini_data[, 1])
        based@Dimnames[[2]][based@Dim[2]] <- paste(columns[i], ":", mini_data@Dimnames[[2]][1], collapse = "", sep = "")
      }
      gc(verbose = FALSE)
      
    } else {
      
      cat("Column ", i, " has ", diff[["count"]][i, "common"], " common factors. One-hot encoding the factors.", sep = "")
      mini_data <- t(fac2sparse(data[[i]])) # pure one-hot encoding requiring transposition
      
      # Requires cleaning unknown factors?
      if (diff[["count"]]$clean[i] == TRUE) {
        mini_data <- mini_data[, which(mini_data@Dimnames[[2]] %in% diff[["what"]][[columns[i]]])]
      } else {
        # do nothing
      }
      mini_data@Dimnames[[2]] <- paste(columns[i], ":", mini_data@Dimnames[[2]], sep = "")
      
      based <- cbind(based, mini_data)
      gc(verbose = FALSE)
      
    }
    
  }
  
  # Concatenate the full sparse matrix with the temp sparse every 25 iterations, only if new things have to be added
  if (((((i %% 25) == 0)) | (i == 228)) & (based@Dim[2] > 1)) {
    sparsed <- cbind(sparsed, based[, 2:based@Dim[2]])
    
    if (based@Dim[2] == 2) {
      sparsed@Dimnames[[2]][sparsed@Dim[2]] <- based@Dimnames[[2]][2]
    }
    #sparsed@Dimnames[[2]][(sparsed@Dim[2] - based@Dim[2] + 2):sparsed@Dim[2]] <- based@Dimnames[[2]][-1]
    based <-  Matrix(as.matrix(c(train_categorical$Id, test_categorical$Id)), sparse = TRUE)
    based@Dimnames[[2]] <- "Id"
    gc(verbose = FALSE)
  }
  
  cat(" - Currently ", sparsed@Dim[2] + based@Dim[2] - 1, " sparse columns.\n")
  
}

# Save to RDS
saveRDS(sparsed[1:1183747, ], file = "datasets/train_categorical_sparse_dedup.rds", compress = TRUE)
saveRDS(sparsed[1183748:2367495, ], file = "datasets/test_categorical_sparse_dedup.rds", compress = TRUE)


# ~~~~~~ Part 2: get rid of perfectly correlated features

# Sparse to Dense
densed <- as.matrix(sparsed)
gc()

# Takes about 1 minute
#library("HiClimR")
#doom <- fastCor(densed[1:1183747, ], verbose = TRUE)
# sum(doom == 1) == 0 because of BLAS acceleration =(

# Takes some minutes for the very exact computation
doom <- cor(densed[1:1183747, ])
# sum(doom == 1) # (1023-613)/2 = up to 205 occurrences
# sum(doom > (1 - 1e-16)) gives the same
saveRDS(doom, file = "datasets/train_categorical_correlation.rds")

doomed_tri <- doom
doomed_tri[lower.tri(doomed_tri, diag = TRUE)] <- 0
doomed <- (apply(doomed_tri, 1, function(x) {sum(x == 1)}) - 1) > 0 # count all 1. If the count is higher than 1, then it has an existing duplicate.
# finds 60 perfectly correlated factors

#library(caret) # to iteration the best removals to maintain the lowest correlation while removing only perfect correlations (does not make sense literatlly but it's just to remove duplicates properly)
#doomed_out <- findCorrelation(doom, cutoff = (1 - 1e-16), verbose = TRUE, names = FALSE, exact = TRUE)
gc()

# Make selection in the features: 16 removed
doomed_out <- character()
for (i in (1:614)[doomed]) {

  doomed_temp <- names(which(doomed_tri[, i] == 1))
  doomed_out <- unique(c(doomed_out, doomed_temp))

}

densed <- densed[, -which(colnames(doom) %in% doomed_out)]

# saveRDS(densed[1:1183747, ], file = "datasets/train_categorical_dedup.rds", compress = TRUE)
# saveRDS(densed[1183748:2367495, ], file = "datasets/test_categorical_dedup.rds", compress = TRUE)

gc()
sparsed <- Matrix(densed, sparse = TRUE)
gc()
saveRDS(sparsed[1:1183747, ], file = "datasets/train_categorical_sparse_dedup.rds", compress = TRUE)
saveRDS(sparsed[1183748:2367495, ], file = "datasets/test_categorical_sparse_dedup.rds", compress = TRUE)
