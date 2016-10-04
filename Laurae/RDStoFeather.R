# Libraries

#install.packages(c("data.table", "feather")) # if you need to install the required packages to convert to Feather
library(data.table) # because all my files contain objects as data.table (mostly)
library(feather) # the load/save as Feather format

# Set your working directory
setwd("E:/")

# Do the conversion
some_data <- readRDS("datasets/some_data.rds") # load the RDS file in R
write_feather(some_data, "datasets/some_data.feather") # store the object as feather file to load in Python
rm(some_data) # clear up the object
gc() # garbage collect to cleanup unused R memory
#some_data <- read_feather("datasets/some_data.feather") # if you want to look at the feather file in R
