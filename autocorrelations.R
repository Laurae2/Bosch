library(data.table)
library(dplyr)
library(ggplot2)
library(Cairo)


# Import Data -------------------------------------------------------------

response <- fread("data/train_numeric.csv", nrows = -1, select = c("Id", "Response"))
id_to_path_number <- fread("data/eda_product_flow_sample_paths_station.csv")
path_number_to_real_path <- fread("data/eda_product_flow_unique_paths_station.csv", colClasses = c("integer", "character"))
clusters <- fread("data/eda_product_flow_unique_paths_station_extra_10clusters.csv",
                  col.names = c("path_number", "cluster")) %>% mutate(path_number = path_number-1)

id_to_real_path <- merge(id_to_path_number, path_number_to_real_path, by.x = "u_arr_ix", by.y = "id")
df <- id_to_real_path %>% 
    merge(response, by.x = "id", by.y = "Id", all = T) %>%
    merge(clusters, by.x = "u_arr_ix", by.y = "path_number", all.x = T)




# Auto-correlations -------------------------------------------------------
lag_max = 200
acf_path_ordered <- df %>% filter(!is.na(Response)) %>% arrange(u_arr_ix) %>% '[['('Response') %>% acf(plot = F, lag.max = lag_max)
acf_id_ordered <- df %>% filter(!is.na(Response)) %>% arrange(id) %>% '[['('Response') %>% acf(plot = F, lag.max = lag_max)
data.table(n = 0:lag_max, path = acf_path_ordered$acf, id = acf_id_ordered$acf) %>% 
    filter(n>0) %>% 
    melt(measure.vars = c("path", "id"),
         variable.name = "type",
         value.name = "correlation") %>% 
    ggplot(aes(n, correlation, fill = type)) +
    geom_bar(stat = "identity", position = "dodge") +
    ggtitle("Auto-correlation of response when ordered by path (red) or id (blue)") +
    xlab("Lag") + ylab("Correlation") +
    scale_x_continuous(breaks = seq(0,lag_max,10)) + ggsave(type = "cairo-png", filename = "acf-path-id.png")







# Hamming distances -------------------------------------------------------

df_small <- df[,]

hamming_distance <- function(strings, step = 1) {
    strings_splitted <- strsplit(strings, "")
    logicals <- sapply(strings_splitted, as.integer)

    
    local_hamming_distance <- function(i) {
        sum((logicals[,i] + logicals[,i-step]) %% 2)
    }
    
    c(rep(NA,step), sapply((1+step):ncol(logicals), local_hamming_distance))
    
}

df_small <- df_small %>% 
    mutate(initial_order = hamming_distance(u_str),
           shuffled = hamming_distance(u_str[sample.int(nrow(df_small))])
           ) %>% 
    melt(measure.vars = c("initial_order", "shuffled"),
         variable.name = "shuffling",
         value.name = "hamming_distance")

ggplot(df_small, aes(hamming_distance, fill = shuffling)) + 
    geom_histogram(binwidth = 1, position = "dodge") +
    ggtitle("Distribution of the hamming distances of consecutive IDs")

ggplot(df_small, aes(hamming_distance, fill = shuffling)) + 
    geom_histogram(binwidth = 1, position = "fill", color = "black") +
    ggtitle("Distribution of the hamming distances of consecutive IDs") +
    coord_cartesian(xlim = c(0,40))


select_r_with_min_hd <- function(hd1, hd2, hd3, hd4, r1, r2, r3, r4) {
    position_of_min <- which.min(c(hd1, hd2, hd3, hd4))
    best_r <- c(r1,r2,r3,r4)[position_of_min]
    best_r
}

# We look at the last 4 values and choose the response minimizing the hamming distance
# It yields an even better correlation !
df_only_train <- df[,] %>% 
    filter(!is.na(Response)) %>%
    arrange(id) %>% 
    mutate(hd1 = hamming_distance(u_str,1),
           hd2 = hamming_distance(u_str,2),
           hd3 = hamming_distance(u_str,3),
           hd4 = hamming_distance(u_str,4),
           r1 = lag(Response, 1),
           r2 = lag(Response, 2),
           r3 = lag(Response, 3),
           r4 = lag(Response, 4)
           )

df_only_train$r_with_lowest_hd = c(NA,sapply(2:nrow(df_only_train), 
    function(x) select_r_with_min_hd(df_only_train$hd1[x],
                                     df_only_train$hd2[x],
                                     df_only_train$hd3[x],
                                     df_only_train$hd4[x],
                                     df_only_train$r1[x],
                                     df_only_train$r2[x],
                                     df_only_train$r3[x],
                                     df_only_train$r4[x])) %>% unlist())
cor(df_only_train$Response, df_only_train$r1, use = "complete.obs")
cor(df_only_train$Response, df_only_train$r2, use = "complete.obs")
cor(df_only_train$Response, df_only_train$r3, use = "complete.obs")
cor(df_only_train$Response, df_only_train$r4, use = "complete.obs")
cor(df_only_train$Response, df_only_train$r_with_lowest_hd, use = "complete.obs")



