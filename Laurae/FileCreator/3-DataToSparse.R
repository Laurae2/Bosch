# Libraries

library(data.table)
library(recommenderlab)

setwd("E:/")

# Train Numeric

# 83.4 MB
gc()
train_numeric <- readRDS("datasets/train_numeric.rds")
write_feather(train_numeric, "datasets/train_numeric_feather.rds")
# 8843.8 MB
gc()
train_numeric <- as.matrix(train_numeric)
# 8844.9 MB
gc()
train_numeric <- dropNA(train_numeric)
# 2592.1 MB
gc()
saveRDS(train_numeric, file = "datasets/train_numeric_sparse.rds", compress = TRUE)
# 2592.1 MB
gc()


# Test Numeric

# 2592.1 MB
gc()
test_numeric <- readRDS("datasets/test_numeric.rds")
# 11343.6 MB
gc()
test_numeric <- as.matrix(test_numeric)
# 11343.5 MB
gc()
test_numeric <- dropNA(test_numeric)
# 5085.6 MB
gc()
saveRDS(test_numeric, file = "datasets/test_numeric_sparse.rds", compress = TRUE)
# 5085.6 MB
gc()
rm(list = ls()) # clear all stuff



# Train Date

# 84.6 MB
gc()
train_date <- readRDS("datasets/train_date.rds")
# 10533.9 MB
gc()
train_date <- as.matrix(train_date)
# 8844.9 MB
gc()
train_date <- dropNA(train_date)
# 2879.0 MB
gc()
saveRDS(train_date, file = "datasets/train_date_sparse.rds", compress = TRUE)
# 2879.0 MB
gc()
rm(list = ls()) # clear all stuff


# Test Date

# 2592.1 MB
gc()
test_date <- readRDS("datasets/test_date.rds")
# 10533.9 MB
gc()
test_date <- as.matrix(test_date)
# 10533.9 MB
gc()
test_date <- dropNA(test_date)
# 2878.2 MB
gc()
saveRDS(test_date, file = "datasets/test_date_sparse.rds", compress = TRUE)
# 2878.2 MB
gc()
rm(list = ls()) # clear all stuff



# Categorical - minimum 45GB RAM


# First part: creating the sparse matrices

library(Matrix)
data <- readRDS("datasets/train_categorical.rds")
gc()
data <- rbind(data, readRDS("datasets/train_categorical.rds"))
gc()
sparsed <- Matrix(as.matrix(data[[1]]), sparse = TRUE)
based <- sparsed
#sparse.model.matrix(data)

j <- 1
for (i in colnames(data)[-1]) {
  
  # Counter
  j <- j + 1
  cat("[", sprintf("%04d", j), " / 2141] ", sep = "")
  
  if (length(levels(data[[i]])) == 1) {
    # do nothing, constant column
    cat("Column ", i, " is empty.")
    
  } else {
    
    if (length(levels(data[[i]])) == 2) {
      cat("Column ", i, " has two factors. Coercing to one factor.")
      mini_data <- fac2sparse(data[[i]])[2, ] # single columnar
      based <- cbind(based, mini_data)
      gc(verbose = FALSE)
      
    } else {
      
      cat("Column ", i, " has ", length(levels(data[[i]])), " factors. One-hot encoding the factors.")
      mini_data <- t(fac2sparse(data[[i]])) # pure one-hot encoding requiring transposition
      based <- cbind(based, mini_data)
      gc(verbose = FALSE)
      
    }
    
  }
  
  # Concatenate the full sparse matrix with the temp sparse every 25 iterations, only if new things have to be added
  if (((((j %% 25) == 0)) | (j == 2141)) & (based@Dim[2] > 1)) {
    sparsed <- cbind(sparsed, based[, 2:based@Dim[2]])
    based <- Matrix(as.matrix(data[[1]]), sparse = TRUE)
    gc(verbose = FALSE)
  }
  
  data <- data[, (i) := NULL]
  cat(" - Currently ", sparsed@Dim[2] + based@Dim[2] - 1, " sparse columns.\n")
  
}

rm(based)
rm(data)


saveRDS(sparsed[1:1183747, ], file = "datasets/train_categorical_sparse.rds", compress = TRUE)
saveRDS(sparsed[1183748:2367494, ], file = "datasets/test_categorical_sparse.rds", compress = TRUE)


quit()


# Part 2 of categorical: probabilistic deduplication of columns
# Memory size is: ncol*nrow*8

# Overnight work

library(fastdigest)

sparsed <- readRDS("datasets/train_categorical_sparse.rds")
gc()
# as.numeric(sparsed@Dim[1])*as.numeric(sparsed@Dim[2])*8 = 44385777512 bytes = 42.329 GB

# dedup <- sparsed@p[2:4688] - sparsed@p[1:4687]
# dedup_table <- table(dedup)
# 
# better <- as.matrix(sparsed[1:50000, ])

# Single threaded but we want to monitor
spooky <- numeric(sparsed@Dim[2])
for (i in 1:sparsed@Dim[2]) {
  spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/categorical_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_categorical_sparse_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_categorical_sparse.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_categorical_sparse_dedup.rds", compress = TRUE)
gc()


# Do the same for numeric

sparsed <- readRDS("datasets/train_numeric_sparse.rds")
gc()

spooky <- numeric((sparsed@Dim[2]) - 1)
for (i in 1:(sparsed@Dim[2] - 1)) {
  spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/numeric_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, c(which(!duplicated(spooky)), sparsed@Dim[2])], file = "datasets/train_numeric_sparse_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_numeric_sparse.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_numeric_sparse_dedup.rds", compress = TRUE)
gc()



# Do the same for date

sparsed <- readRDS("datasets/train_date_sparse.rds")
gc()

spooky <- numeric(sparsed@Dim[2])
for (i in 1:sparsed@Dim[2]) {
  spooky[i] <- fastdigest(sparsed[, i]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/date_sparse_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/train_date_sparse_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_date_sparse.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky))], file = "datasets/test_date_sparse_dedup.rds", compress = TRUE)
gc()




# Do the same on categorical non-sparse data


sparsed <- readRDS("datasets/train_numeric.rds")
gc()

spooky <- numeric(ncol(sparsed) - 1)
for (i in 1:(ncol(sparsed) - 1)) {
  spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/numeric_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, c(which(!duplicated(spooky)), ncol(sparsed)), with = FALSE], file = "datasets/train_numeric_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_numeric.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_numeric_dedup.rds", compress = TRUE)
gc()






sparsed <- readRDS("datasets/train_categorical.rds")
gc()

spooky <- numeric(ncol(sparsed))
for (i in 1:ncol(sparsed)) {
  spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/categorical_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/train_categorical_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_categorical.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_categorical_dedup.rds", compress = TRUE)
gc()




sparsed <- readRDS("datasets/train_date.rds")

spooky <- numeric(ncol(sparsed))
for (i in 1:ncol(sparsed)) {
  spooky[i] <- fastdigest(sparsed[[i]]) # Compute hash only on training data... obviously
  if ((i %% 100) == 0) {cat("Done ", i," Spooky hashes.\n", sep = "")}
  if ((i %% 500) == 0) {cat(" --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = ""); gc(verbose = FALSE)}
}

write.csv(spooky, "datasets/date_spooky.csv", row.names = FALSE, quote = FALSE)
saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/train_date_dedup.rds", compress = TRUE)
gc()
sparsed <- readRDS("datasets/test_date.rds")
gc()
saveRDS(sparsed[, which(!duplicated(spooky)), with = FALSE], file = "datasets/test_date_dedup.rds", compress = TRUE)
gc()



# to get the object size:
# format(object.size(train_categorical_sparse), units = "MB")


rm(sparsed)
gc()
train_categorical_sparse <- readRDS("datasets/train_categorical_sparse_dedup.rds")
print(train_categorical_sparse@Dim[2])
print(format(object.size(train_categorical_sparse), units = "MB"))

train_numeric_sparse <- readRDS("datasets/train_numeric_sparse_dedup.rds")
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))

train_date_sparse <- readRDS("datasets/train_date_sparse_dedup.rds")
print(train_date_sparse@Dim[2])
print(format(object.size(train_date_sparse), units = "MB"))

gc()
train_categorical <- readRDS("datasets/train_categorical_dedup.rds")
print(ncol(train_categorical))
print(format(object.size(train_categorical), units = "MB"))

train_numeric <- readRDS("datasets/train_numeric_dedup.rds")
print(ncol(train_numeric))
print(format(object.size(train_numeric), units = "MB"))

train_date <- readRDS("datasets/train_date_dedup.rds")
print(ncol(train_date))
print(format(object.size(train_date), units = "MB"))
