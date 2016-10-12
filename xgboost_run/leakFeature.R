library(data.table)
library(Matrix)
library(matrixStats)
library(recommenderlab)
library(tabplot)
library(pbapply)
library(data.table)
library(recommenderlab)

setwd("~/kaggle/Bosche/code")

# Date process
train_numeric <- readRDS("datasets/train_numeric.rds")
train_date <- readRDS("datasets/train_date_dedup.rds")
test_numeric <- readRDS("datasets/test_numeric.rds")
Y = train_numeric[,"Response",with = F]$Response
train_numeric[,Response:=NULL]
#1:1183747
data <- rbind(train_numeric, test_numeric)
###################################################
#station
#################################################
columns <- colnames(data)
station <- strsplit(columns[-1], split = "_")
station <- t(matrix(unlist(station), byrow = FALSE, nrow = 3))
station <- as.integer(substr(station[, 2], 2, 99))
listing <- list()
for (i in 0:51) {
  listing[[i + 1]] <- (which(station == i) + 1)
  print(columns[listing[[i + 1]]])
}
na_data <- !is.na(data) #20GB RAM
na_data <- na_data * 1
na_data <- as.data.table(na_data)
na_data[,path:= do.call(paste,c(na_data[,2:dim(na_data)[2],with = F],sep = ""))]
na_data[,path:= as.numeric(as.factor(path))]
na_data[,prev_path:= c(-999,na_data$path[2:dim(na_data)[1]] - na_data$path[1:(dim(na_data)[1]-1)])]
na_data[,next_path:= c(na_data$path[1:(dim(na_data)[1]-1)] - na_data$path[2:(dim(na_data)[1])],-999)]
na_data[,prev_pathId:=interpolateFun(Id),by = path]
na_data[,next_pathId:=interpolateFun1(Id),by = path]

interpolateFun <- function(x){
  return(c(-99999999,x[-1]  - x[-length(x)]))
}

interpolateFun1 <- function(x){
  return(c(x[-length(x)]-x[-1],-99999999))
}

interpolateFun2 <- function(x){
  return(c(x[-length(x)],-99999999))
}

a = na_data[2:10,]
a[,prev_pathId:=interpolateFun(Id),by = path]
saveRDS(na_data,'datasets/na_data.rds')

na_data = na_data[,c('Id','path'),with = F]
startTime = readRDS('datasets/MinMin_features.rds')
na_data[,startTime:=startTime]
na_data = na_data[order(na_data$startTime),]
na_data[,prev_path:= c(-999,na_data$path[2:dim(na_data)[1]] - na_data$path[1:(dim(na_data)[1]-1)])]
na_data[,next_path:= c(na_data$path[1:(dim(na_data)[1]-1)] - na_data$path[2:(dim(na_data)[1])],-999)]
na_data[,prev_pathId:=interpolateFun(Id),by = path]
na_data[,next_pathId:=interpolateFun1(Id),by = path]
saveRDS(na_data,'datasets/na_data.rds')


na_data = readRDS('datasets/na_data.rds')
na_data = na_data[order(na_data$startTime,na_data$Id),]
na_data[,prev_path:= c(-999,na_data$path[2:dim(na_data)[1]] - na_data$path[1:(dim(na_data)[1]-1)])]
na_data[,next_path:= c(na_data$path[1:(dim(na_data)[1]-1)] - na_data$path[2:(dim(na_data)[1])],-999)]
na_data[,next_path_actual:=interpolateFun2(Id),by = path]
na_data[,prev_pathId:=interpolateFun(Id),by = path]
na_data[,next_pathId:=interpolateFun1(Id),by = path]
saveRDS(na_data,'datasets/na_data2.rds')


