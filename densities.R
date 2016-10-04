library(dplyr)
library(data.table)
library(ggplot2)
library(stringr)
library(caret)
library(Cairo)
library(FNN)

# Read datas --------------------------------------------------------------

response = fread("../input/train_numeric.csv", header = TRUE, sep = ",", 
                 stringsAsFactors = FALSE, colClasses = rep("numeric", 970), select = 970)$Response
chunk_size = 100000
iterations <- floor(1183747/chunk_size) + 1
list_responses <- vector("list", length = iterations)
for(i in 0:(iterations-1)){
    print(i)
    
    
    dates.raw <- fread("../input/train_date.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE, 
                       colClasses = rep("numeric", 1157), nrows = chunk_size, skip = chunk_size*i)
    dates.raw$response = response[(chunk_size*i+1):(chunk_size*(i+1))]
    
    if(i==0){
        names_dates <- names(dates.raw)
    } else {
        names(dates.raw) <- names_dates
    }
    
    responses <- dates.raw %>% 
        melt(id.vars = c("Id", "response")) %>% 
        group_by(Id) %>% 
        summarise(time = min(value, na.rm = T), response = response[1])
    list_responses[[i+1]] <- responses
    gc()
}
responses <- bind_rows(list_responses)

# Plots of densities ------------------------------------------------------


ggplot(responses, aes(time)) + 
    geom_density(fill = "dodgerblue1", alpha = 0.3, adjust = 0.2) + 
    facet_grid(response~.)

ggplot(responses, aes(time, fill = factor(response), col = factor(response))) + 
    geom_density(alpha = 0.3, adjust = 0.2) +
    scale_x_continuous(breaks = seq(0,1720,100)) +
    scale_y_continuous(minor_breaks = NULL) +
    scale_fill_manual(values = c("dodgerblue1", "firebrick1")) +
    scale_color_manual(values = c("dodgerblue1", "firebrick1")) + 
    theme_minimal() +
    ggtitle("Densities of 1 and 0") +
    xlab("Time of entry") +
    ylab("Density") +
    ggsave("images/densities.png", type = "cairo-png", dpi = 150)


# Density estimations -----------------------------------------------------

get_densities <- function(x, labels, from, to){
    densities <- vector("list", 2)
    for(i in 1:2){
        densities[[i]] <- density(x, bw = "nrd0", adjust = 1, weights = as.numeric(labels == i-1) / sum(as.numeric(labels == i-1)),
                             kernel = "gaussian", n = 2048, from = from, to = to, cut = 3, na.rm = T)
    }
    rate <- data.frame(x = densities[[1]]$x, density_0 = densities[[1]]$y, density_1 = densities[[2]]$y) %>% 
        mutate(y = density_1 / (density_1 + density_0)) %>% data.table()
}

# Densities for the whole dataset
rate <- get_densities(responses$time, responses$response, 0, 1720)
rate %>% ggplot(aes(x, y)) + geom_area() + coord_cartesian(ylim = c(0,1))



# Feature generations, using folds ----------------------------------------

responses$fold_number <- NA
folds <- vector("list", length = 5)
for(i in 1:5){
    folds[[i]] <- fread(paste0("../input/folds/folds0", as.character(i), ".csv"))
    responses$fold_number[folds[[i]]$x] <- i     
}

# Densities of each folds
rate_folds <- vector("list", 5)
for(i in 1:5){
    rate_folds[[i]] <- get_densities(responses$time[responses$fold_number == i], responses$response[responses$fold_number == i], 0, 1720)
    rate_folds[[i]]$fold_number <- i
}
bind_rows(rate_folds) %>% 
    ggplot(aes(x, y, col = factor(fold_number))) + 
    geom_line(size = 1, alpha = 0.9) + 
    ggsave(type = "cairo-png", filename = "../densities_by_folds.png", dpi = 150)

responses$rate_estimation <- NA
for(i in 1:5){
    print(i)
    testing_fold <- responses %>% filter(fold_number == i)
    training_fold <- responses %>% filter(fold_number != i)
    stopifnot(nrow(testing_fold) + nrow(training_fold) == 1183747)
    
    rate <- get_densities(training_fold$time, training_fold$response, 0, 1720)
    #(rate %>% ggplot(aes(x, y)) + geom_line() + coord_cartesian(ylim = c(0,1))) %>% print()
    
    get_rate <- function(time){
        if(is.na(time)) return(NA)
        estimation <- rate[abs(x-time) < 1.01*1717/4096,y][1]
        if(length(estimation) != 1) browser()
        estimation
    }
    responses$rate_estimation[responses$fold_number == i] <- responses$time[responses$fold_number==i] %>% 
        Vectorize(get_rate)() %>% 
        unlist()
    
    (responses %>% filter(!is.na(rate_estimation)) %>% ggplot(aes(time, rate_estimation)) + geom_point()) %>% print()
}