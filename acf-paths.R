library(data.table)
df <- fread("C:/Users/Admin/AppData/Roaming/Skype/My Skype Received Files/Responses.csv")
id_to_paths <- fread("D:/Kaggle/Bosch/eda_product_flow_unique_paths_station.csv", colClasses = c("integer", "character"))
df$lag1 <- lag(df$Response)
acf(df$Response, lag.max = 10, type = "correlation", plot = F)

unique_paths <- fread("D:/Kaggle/Bosch/eda_product_flow_sample_paths_station.csv")

df2 <- merge(df, unique_paths, by.x = "Id", by.y = "id", all.x = T, all.y = F)
df2$lag1_path <- lag(df2$u_arr_ix)
df2$lag1_id <- lag(df2$Id)
df2 %>% filter(Response == 1 & lag1 == 1)

df3 <- merge(df2, id_to_paths, by.x = "Id", by.y = "id", all.X = T, all.y = F)
df3 <- merge(df3, id_to_paths, by.x = "lag1_id", by.y = "id", all.x = T, all.y = F)
df4 <- df3 %>% 
    select(-u_arr_ix, -lag1_path) %>% 
    filter(Response == 1 & as.integer(lag1) == 1) %>% 
    melt(id.vars = c("Id", "lag1_id", "Response", "lag1"),
         measure.vars = c("u_str.x","u_str.y"))


for(v in unique(df2$u_arr_ix)[1:5]){
    print(acf(df2$Response[df2$u_arr_ix == v], plot = F)$acf[2])
}


paths <- unique(df2$u_arr_ix)
correlation_lag1 <- sapply(paths, function(x) acf(df2$Response[df2$u_arr_ix == x], plot = F)$acf[2])
qplot(1:11270, correlation_lag1)
