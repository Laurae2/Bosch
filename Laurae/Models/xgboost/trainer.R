# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(xgboost)
library(Laurae)
library(fastdigest)
library(pbapply)
library(ggplot2)

setwd("E:/")

#### SET ALL file directories appropriately
#### Search for the following keywords to find all the lines with a hardcoded directory: Laurae, datasets



################# LOAD YOUR FEATURES THERE AND SET THEM TO Laurae_feat
#### They will get merged automatically with the other sets during the pre-processing
#### Or if you already have the RDS files, cbind the sparse matrices (dgCMatrix)

Laurae_feat <- as.matrix(Laurae_feat)
gc()
Laurae_feat <- Matrix(Laurae_feat, sparse = TRUE)
gc()




# Load small set


category_features <- c("L3_S32_F3854", "L3_S32_F3851", "L1_S24_F1523", "L1_S24_F1525", "L2_S26_F3038", "L1_S24_F1530",
                       "L1_S24_F819",  "L2_S27_F3131", "L3_S29_F3475", "L3_S29_F3317")
# Uncommon is L3_S32_F3854:T65536

gc()
train_categorical <- readRDS("datasets/train_categorical.rds")
print(format(object.size(train_categorical), units = "MB"))
train_categorical <- train_categorical[, category_features, with = FALSE]

gc()
test_categorical <- readRDS("datasets/test_categorical.rds")
print(format(object.size(test_categorical), units = "MB"))
test_categorical <- test_categorical[, category_features, with = FALSE]

data_categorical <- rbind(train_categorical, test_categorical)
gc()

temp_sparse <- cbind(t(fac2sparse(data_categorical[["L3_S32_F3851"]])),
                     t(fac2sparse(data_categorical[["L1_S24_F1523"]])),
                     t(fac2sparse(data_categorical[["L2_S26_F3038"]])),
                     t(fac2sparse(data_categorical[["L1_S24_F819"]])),
                     t(fac2sparse(data_categorical[["L2_S27_F3131"]])),
                     t(fac2sparse(data_categorical[["L3_S29_F3475"]])),
                     t(fac2sparse(data_categorical[["L3_S29_F3317"]])))
temp_sparse <- temp_sparse[, c(2, 4, 6, 8, 10, 12, 14)]
temp_sparse@Dimnames[[2]] <- c("L3_S32_F3851:T1", "L1_S24_F1523:T1", "L2_S26_F3038:T1", "L1_S24_F819:T1", "L2_S27_F3131:T1", "L3_S29_F3475:T1", "L3_S29_F3317:T1")
temp_sparse2 <- cbind(sparse.model.matrix(~ .-1, data = data_categorical[, 1, with = FALSE]),
                      sparse.model.matrix(~ .-1, data = data_categorical[, 4, with = FALSE]),
                      sparse.model.matrix(~ .-1, data = data_categorical[, 6, with = FALSE]))
temp_sparse2@Dimnames[[2]] <- gsub("T", ":T", temp_sparse2@Dimnames[[2]])
temp_sparse2 <- temp_sparse2[, c(1:30, 32:44)]
data_categorical_sparse <- cbind(temp_sparse, temp_sparse2)
rm(temp_sparse, temp_sparse2)
rm(train_categorical, test_categorical, data_categorical, category_features)



numeric_features <- c("L3_S32_F3850", "L3_S29_F3412", "L1_S24_F1723", "L3_S33_F3865", "L1_S24_F1846", "L1_S24_F1695",
                      "L3_S33_F3859", "L3_S30_F3519", "L3_S33_F3873", "L3_S29_F3407", "L1_S24_F1632", "L3_S30_F3724",
                      "L3_S30_F3809", "L3_S29_F3382", "L1_S24_F1604", "L3_S30_F3704", "L1_S24_F1844", "L1_S24_F1498",
                      "L3_S38_F3956", "L3_S38_F3960", "L3_S33_F3867", "L3_S33_F3857", "L3_S29_F3351", "L3_S38_F3952",
                      "L1_S24_F867",  "L3_S29_F3339", "L3_S33_F3855", "L0_S0_F20",    "L3_S30_F3744", "L3_S30_F3554",
                      "L3_S34_F3880", "L2_S26_F3040", "L3_S29_F3395", "L3_S30_F3754", "L3_S29_F3479", "L3_S29_F3458",
                      "L2_S27_F3166", "L3_S30_F3804", "L1_S24_F1609", "L3_S30_F3759", "L1_S24_F1842", "L0_S0_F22",   
                      "L3_S36_F3920", "L0_S1_F24",    "L0_S4_F104",   "L3_S29_F3348", "L3_S33_F3861", "L1_S24_F1758",
                      "L0_S12_F350",  "L3_S29_F3336", "L3_S34_F3876", "L3_S30_F3769", "L3_S30_F3774", "L1_S24_F1578",
                      "L0_S1_F28")

gc()
train_numeric_sparse <- readRDS("datasets/train_numeric_sparse.rds")
Y <- train_numeric_sparse[, train_numeric_sparse@Dim[2]]
train_numeric_sparse <- train_numeric_sparse[, numeric_features]
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))


gc()
test_numeric_sparse <- readRDS("datasets/test_numeric_sparse.rds")
test_numeric_sparse <- test_numeric_sparse[, numeric_features]
print(test_numeric_sparse@Dim[2])
print(format(object.size(test_numeric_sparse), units = "MB"))


train_mini <- cbind(train_numeric_sparse, data_categorical_sparse[1:1183747, ])
gc()
test_mini <- cbind(test_numeric_sparse, data_categorical_sparse[1183748:2367495, ])
gc()

rm(train_numeric_sparse, test_numeric_sparse, data_categorical_sparse)
rm(numeric_features)





# Load initial data

train_categorical_sparse <- readRDS("datasets/train_categorical_sparse_dedup.rds")
print(train_categorical_sparse@Dim[2])
print(format(object.size(train_categorical_sparse), units = "MB"))

gc()
train_numeric_sparse <- readRDS("datasets/train_numeric_sparse_decor.rds")
print(train_numeric_sparse@Dim[2])
print(format(object.size(train_numeric_sparse), units = "MB"))

#gc()
#train_date_sparse <- readRDS("datasets/train_date_sparse_decor.rds")
#print(train_date_sparse@Dim[2])
#print(format(object.size(train_date_sparse), units = "MB"))


gc()
test_categorical_sparse <- readRDS("datasets/test_categorical_sparse_dedup.rds")
print(test_categorical_sparse@Dim[2])
print(format(object.size(test_categorical_sparse), units = "MB"))

gc()
test_numeric_sparse <- readRDS("datasets/test_numeric_sparse_decor.rds")
print(test_numeric_sparse@Dim[2])
print(format(object.size(test_numeric_sparse), units = "MB"))

#gc()
#test_date_sparse <- readRDS("datasets/test_date_sparse_decor.rds")
#print(test_date_sparse@Dim[2])
#print(format(object.size(test_date_sparse), units = "MB"))


Y <- train_numeric_sparse[, train_numeric_sparse@Dim[2]]
train_numeric_sparse <- train_numeric_sparse[, c(2:(train_numeric_sparse@Dim[2] - 1))]
gc()
train_categorical_sparse <- train_categorical_sparse[, c(2:train_categorical_sparse@Dim[2])]
gc()
#train_date_sparse <- train_date_sparse[, c(2:train_date_sparse@Dim[2])]
#gc()
test_numeric_sparse <- test_numeric_sparse[, c(2:test_numeric_sparse@Dim[2])]
gc()
test_categorical_sparse <- test_categorical_sparse[, c(2:test_categorical_sparse@Dim[2])]
gc()
#test_date_sparse <- test_date_sparse[, c(2:test_date_sparse@Dim[2])]
#gc()

#train <- cbind(train_numeric_sparse, train_categorical_sparse, train_date_sparse)
train <- cbind(train_numeric_sparse, train_categorical_sparse)
gc()
#test <- cbind(test_numeric_sparse, test_categorical_sparse, test_date_sparse)
test <- cbind(test_numeric_sparse, test_categorical_sparse)
gc()

#rm(train_numeric_sparse, train_categorical_sparse, train_date_sparse, test_numeric_sparse, test_categorical_sparse, test_date_sparse)
rm(train_numeric_sparse, train_categorical_sparse, test_numeric_sparse, test_categorical_sparse)

gc()

# All features = -0.004 AUC
# 113 best features = -0.005 AUC

kept_columns <- c("L3_S32_F3854:T2", "L3_S32_F3854:T2", "L1_S24_F1695", "L3_S33_F3859", "L3_S32_F3851:T1", "L3_S33_F3865",
                  "L1_S24_F1604", "L3_S33_F3855", "L3_S32_F3854:T4", "L3_S38_F3952", "L3_S33_F3857", "L3_S30_F3754",
                  "L3_S36_F3920", "L3_S30_F3759", "L3_S30_F3744", "L3_S30_F3774", "L3_S38_F3956", "L3_S30_F3749")
# "L3_S30_F3769", "L3_S30_F3494", "L3_S30_F3804", "L3_S30_F3809", "L3_S29_F3351", "L3_S29_F3327",
# "L3_S30_F3829", "L3_S29_F3479", "L3_S29_F3348", "L0_S12_F350", "L3_S29_F3336", "L3_S30_F3554",
# "L3_S30_F3704", "L3_S30_F3609", "L3_S30_F3574", "L3_S29_F3373", "L3_S30_F3534", "L3_S29_F3339",
# "L3_S29_F3354", "L3_S38_F3960", "L3_S29_F3345", "L3_S30_F3604", "L3_S29_F3333", "L3_S30_F3794",
# "L3_S29_F3330", "L3_S32_F3854:T16", "L3_S35_F3889", "L3_S29_F3376", "L3_S30_F3514", "L3_S30_F3519",
# "L3_S29_F3324", "L3_S29_F3379", "L3_S30_F3639", "L2_S26_F3117", "L3_S29_F3382", "L0_S2_F44", "L3_S29_F3473",
# "L0_S4_F109", "L3_S29_F3427", "L2_S26_F3040", "L3_S30_F3629", "L2_S26_F3113", "L3_S29_F3342", "L3_S35_F3896",
# "L3_S29_F3321", "L0_S13_F356", "L3_S30_F3669", "L3_S30_F3799", "L3_S30_F3819", "L0_S2_F60", "L0_S2_F36",
# "L1_S24_F1298", "L3_S30_F3764", "L3_S30_F3784", "L3_S30_F3524", "L2_S26_F3036", "L3_S29_F3318",
# "L3_S29_F3315", "L2_S27_F3166", "L2_S26_F3069", "L2_S26_F3106", "L0_S12_F346", "L3_S30_F3709",
# "L3_S29_F3407", "L3_S30_F3509", "L2_S26_F3121", "L3_S30_F3544", "L3_S30_F3624", "L3_S30_F3504",
# "L0_S10_F229", "L2_S27_F3199", "L2_S26_F3051", "L0_S16_F426", "L0_S11_F282", "L3_S34_F3882",
# "L0_S11_F286", "L0_S13_F354", "L3_S30_F3579", "L2_S26_F3047", "L0_S12_F348", "L3_S29_F3357", "L0_S11_F318",
# "L2_S26_F3073", "L3_S29_F3476", "L3_S32_F3854:T48", "L0_S11_F326", "L1_S24_F1207", "L3_S29_F3436",
# "L3_S29_F3430", "L3_S29_F3461", "L2_S27_F3162", "L0_S11_F294")
# "L2_S27_F3210", "L2_S27_F3144", "L0_S2_F48",
# "L2_S26_F3062", "L3_S30_F3634", "L0_S11_F314", "L0_S9_F175", "L0_S11_F302", "L0_S10_F254", "L3_S30_F3664",
# "L2_S27_F3155", "L3_S32_F3850", "L0_S11_F306", "L0_S10_F234", "L0_S11_F322", "L0_S15_F403", "L0_S12_F330",
# "L0_S15_F415", "L0_S16_F421", "L3_S29_F3433", "L0_S11_F310", "L3_S47_F4158", "L0_S15_F397", "L0_S12_F334",
# "L3_S34_F3876", "L3_S30_F3644", "L1_S24_F1822", "L0_S11_F290", "L0_S21_F477", "L2_S27_F3214", "L1_S24_F1812",
# "L0_S12_F332", "L3_S30_F3584", "L0_S12_F336", "L3_S49_F4217:T1", "L1_S24_F1818", "L0_S23_F643", "L0_S23_F623",
# "L2_S27_F3129", "L3_S35_F3899:T1", "L3_S30_F3689", "L3_S41_F4008", "L1_S24_F1808", "L3_S30_F3569", "L3_S30_F3589",
# "L3_S45_F4124", "L0_S23_F663", "L3_S30_F3674", "L3_S36_F3918", "L3_S40_F3982", "L3_S35_F3894", "L0_S21_F517",
# "L2_S27_F3133", "L3_S29_F3360", "L0_S22_F566", "L3_S36_F3938", "L0_S15_F406", "L0_S23_F631", "L3_S32_F3854:T8",
# "L3_S33_F3873", "L1_S24_F691", "L0_S12_F342", "L2_S27_F3140", "L3_S40_F3984", "L3_S48_F4196", "L3_S47_F4153",
# "L1_S24_F1816", "L1_S24_F1824", "L0_S12_F352", "L3_S47_F4163", "L3_S41_F4006", "L0_S23_F627", "L3_S49_F4211",
# "L3_S41_F4014", "L0_S23_F659", "L3_S30_F3564", "L1_S24_F1814", "L0_S12_F344", "L0_S21_F537", "L1_S24_F1820",
# "L3_S29_F3488", "L3_S35_F3902:T2", "L3_S41_F4018", "L3_S30_F3684", "L3_S40_F3986", "L1_S25_F2346", "L0_S7_F136",
# "L3_S29_F3482", "L3_S41_F4016", "L2_S26_F3125", "L0_S10_F239", "L2_S27_F3206", "L1_S24_F733", "L3_S30_F3679",
# "L3_S40_F3980", "L3_S41_F4020", "L1_S25_F2136", "L1_S25_F3009", "L0_S23_F619", "L0_S21_F507", "L1_S24_F1235",
# "L1_S25_F1973", "L1_S25_F2046", "L0_S23_F651", "L1_S24_F1810", "L1_S25_F2167", "L0_S23_F667", "L3_S47_F4138",
# "L1_S24_F800", "L3_S50_F4243", "L0_S12_F338", "L1_S25_F2161", "L1_S25_F2091", "L1_S24_F808", "L3_S41_F4004",
# "L0_S23_F639", "L3_S44_F4118", "L0_S23_F655", "L1_S25_F1892", "L0_S12_F340", "L3_S48_F4198", "L0_S3_F76",
# "L1_S24_F1270", "L1_S25_F2158", "L1_S25_F2155", "L3_S47_F4143", "L3_S41_F4026", "L1_S24_F683", "L2_S28_F3255",
# "L1_S24_F687", "L3_S33_F3871", "L3_S44_F4115", "L1_S25_F1855", "L0_S8_F144", "L1_S24_F1212", "L1_S25_F2797",
# "L1_S25_F2176", "L3_S44_F4112", "L1_S25_F3017", "L1_S25_F2144", "L3_S43_F4090", "L1_S25_F2152", "L1_S25_F1858",
# "L1_S25_F1958", "L2_S28_F3248", "L3_S41_F4011", "L3_S29_F3317:", "L2_S28_F3303", "L3_S43_F4080", "L0_S9_F205",
# "L3_S36_F3930", "L1_S25_F1978", "L1_S25_F2147", "L3_S32_F3854:T128", "L1_S25_F2925", "L1_S25_F2066",
# "L3_S43_F4095", "L3_S41_F4023", "L1_S25_F3024", "L1_S25_F3026", "L1_S25_F2086", "L1_S25_F3007", "L0_S2_F40",
# "L1_S25_F2016", "L1_S25_F2997", "L1_S25_F2164", "L1_S25_F2787", "L1_S25_F2773", "L1_S25_F1968", "L1_S25_F2385",
# "L1_S25_F3005", "L0_S20_F461", "L1_S25_F2036", "L2_S26_F3077", "L1_S25_F2999", "L2_S26_F3055", "L0_S2_F56",
# "L1_S25_F2945", "L0_S2_F32", "L3_S43_F4085", "L2_S28_F3259", "L3_S44_F4121", "L1_S24_F1197", "L1_S25_F2487",
# "L3_S37_F3950", "L1_S25_F2970", "L1_S24_F1250", "L1_S25_F1885", "L1_S25_F2170", "L1_S25_F2007", "L1_S25_F1900",
# "L1_S25_F1938", "L1_S25_F2021", "L1_S25_F2447:T3", "L3_S33_F3867", "L1_S24_F814", "L3_S29_F3475:",
# "L3_S35_F3913", "L1_S25_F2026", "L1_S24_F1137:T2", "L1_S25_F2920", "L1_S25_F2808", "L1_S25_F2061",
# "L1_S25_F2990", "L1_S25_F2770", "L1_S24_F1486", "L3_S36_F3934", "L0_S11_F298", "L1_S25_F2886", "L1_S25_F2081",
# "L2_S28_F3307", "L1_S25_F2767", "L1_S25_F2395", "L1_S25_F2758", "L1_S25_F1869", "L1_S24_F1202", "L0_S18_F435",
# "L1_S25_F2915", "L1_S24_F1161", "L3_S33_F3869", "L1_S25_F2783", "L0_S19_F453", "L1_S25_F2896", "L1_S25_F1919",
# "L1_S25_F2437", "L1_S25_F2950", "L1_S25_F1929", "L2_S28_F3299", "L1_S25_F3028", "L1_S25_F3003", "L1_S25_F2828",
# "L3_S31_F3834", "L1_S25_F2837", "L1_S25_F1997", "L2_S28_F3292", "L3_S31_F3842", "L2_S28_F3226", "L1_S24_F1185:T1",
# "L3_S49_F4220:T2", "L2_S28_F3233", "L1_S25_F2051", "L1_S24_F1316", "L1_S25_F2789", "L1_S25_F1909", "L1_S25_F3001",
# "L3_S30_F3724", "L1_S25_F3015", "L1_S25_F2041", "L1_S25_F2490", "L3_S41_F4000", "L1_S24_F1255", "L1_S25_F2995",
# "L2_S28_F3222", "L1_S25_F2872", "L1_S25_F2229:", "L1_S25_F2980", "L1_S24_F1184", "L1_S25_F2484", "L3_S49_F4236",
# "L1_S25_F1894", "L3_S30_F3499", "L1_S24_F1351", "L3_S48_F4193", "L2_S27_F3218", "L1_S25_F2781", "L1_S25_F3034",
# "L3_S32_F3854:T256", "L1_S25_F2955", "L1_S25_F1953", "L1_S24_F810", "L1_S25_F1896", "L1_S25_F1963", "L0_S23_F635",
# "L1_S25_F2336", "L1_S24_F1525:T2", "L1_S25_F1992", "L1_S25_F2791", "L1_S25_F1943", "L3_S30_F3649", "L1_S25_F2847",
# "L3_S35_F3898", "L3_S36_F3926", "L1_S25_F1987", "L1_S24_F1225", "L1_S24_F1265", "L3_S32_F3854:T-2147483648",
# "L3_S49_F4206", "L1_S25_F2960", "L3_S35_F3884", "L0_S10_F269", "L1_S25_F2677", "L0_S8_F149", "L1_S25_F2930",
# "L0_S14_F378", "L3_S35_F3908", "L3_S30_F3739", "L1_S25_F2799", "L3_S32_F3854:T-2147482432", "L1_S25_F2370",
# "L1_S25_F3030", "L1_S25_F2891", "L1_S25_F1948", "L1_S24_F1840", "L1_S25_F1914", "L1_S24_F1240", "L1_S25_F2877",
# "L1_S25_F2749", "L3_S50_F4253", "L3_S34_F3880", "L1_S25_F1881", "L1_S25_F2341", "L2_S28_F3237", "L1_S25_F2935",
# "L3_S44_F4106", "L3_S35_F3903", "L1_S25_F2667", "L1_S25_F2356", "L3_S30_F3734", "L1_S24_F710:T2", "L1_S25_F2613",
# "L1_S25_F2400", "L1_S24_F1510:T2", "L1_S24_F1510:T3", "L1_S25_F2867", "L1_S25_F2672", "L1_S25_F2793",
# "L1_S25_F2327", "L3_S31_F3846", "L1_S25_F2940", "L1_S25_F2985", "L1_S25_F2707", "L1_S25_F2514", "L1_S24_F1245",
# "L1_S25_F2508", "L1_S25_F2390", "L1_S25_F1865", "L1_S25_F2443", "L3_S29_F3491", "L1_S25_F2608", "L1_S25_F2439",
# "L3_S32_F3854:T1", "L1_S24_F1525:T3", "L1_S25_F2662", "L1_S25_F2652", "L1_S25_F2818", "L2_S27_F3148",
# "L1_S25_F2229:T4", "L1_S24_F1230", "L3_S37_F3948", "L1_S25_F2975", "L1_S25_F2380", "L1_S25_F2002",
# "L1_S25_F1852:T4", "L1_S24_F675:T2", "L1_S25_F3020", "L1_S25_F2498", "L1_S25_F2965", "L1_S25_F2031",
# "L1_S25_F2252:T1", "L1_S24_F1114:T3", "L1_S25_F2431", "L1_S25_F2732", "L1_S25_F1852:T5", "L3_S29_F3464",
# "L1_S25_F2906", "L1_S25_F2647", "L0_S8_F146", "L1_S24_F1559:T1", "L3_S47_F4148", "L3_S49_F4231", "L1_S25_F2433",
# "L1_S25_F2603", "L1_S25_F2504", "L3_S39_F3972", "L1_S25_F2755", "L1_S24_F1530:T2", "L1_S25_F2472",
# "L1_S25_F2099:T1", "L1_S25_F2506", "L1_S25_F2751", "L1_S25_F2173", "L3_S29_F3485", "L1_S25_F2375",
# "L1_S25_F2435", "L1_S25_F2220", "L1_S24_F1137:T3", "L1_S24_F806", "L1_S25_F2862", "L2_S27_F3170",
# "L1_S25_F2852", "L3_S50_F4249", "L1_S25_F2813", "L1_S25_F2842", "L1_S25_F2223", "L3_S50_F4241", "L1_S24_F1510:T4", "L3_S43_F4070")

train <- train[, kept_columns]
test <- test[, kept_columns]

rm(kept_columns)

gc() # Peak: 11GB


NA_features <- readRDS("Laurae/DateFeaturesMore/NA_features.rds")
Mean_features <- readRDS("Laurae/DateFeaturesMore/Mean_features.rds")
#Min_features <- readRDS("Laurae/DateFeaturesMore/Min_features.rds")
MinMin_features <- readRDS("Laurae/DateFeaturesMore/MinMin_features.rds")
Max_features <- readRDS("Laurae/DateFeaturesMore/Max_features.rds")
MaxMax_features <- readRDS("Laurae/DateFeaturesMore/MaxMax_features.rds")
Time0_features <- readRDS("Laurae/DateFeaturesMore/Time0_features.rds")
FirstLast_features <- readRDS("Laurae/DateFeaturesMore/StationFirstLast_features.rds")
Timing_features <- readRDS("Laurae/DateFeaturesMore/StationTiming_features.rds")
TimeToExitStation_features <- readRDS("Laurae/DateFeaturesMore/TimeToExitStation_features.rds")
TimeToExitProduction_features <- readRDS("Laurae/DateFeaturesMore/TimeToExitProduction_features.rds")


temp_NAs <- pbapply(Mean_features[1:1183747, ], 2, function(x) {1183747 - sum(is.na(x))})
Mean_features <- Mean_features[, which(temp_NAs > 32), with = FALSE]
gc()

temp_NAs <- pbapply(Max_features[1:1183747, ], 2, function(x) {1183747 - sum(is.na(x))})
Max_features <- Max_features[, which(temp_NAs > 32), with = FALSE]
gc()

temp_NAs <- pbapply(Time0_features[1:1183747, ], 2, function(x) {1183747 - sum(is.na(x))})
Time0_features <- Time0_features[, which(temp_NAs > 32), with = FALSE]
gc()

temp_NAs <- pbapply(Timing_features[1:1183747, ], 2, function(x) {1183747 - sum(is.na(x))})
Timing_features <- Timing_features[, which(temp_NAs > 32), with = FALSE]
gc()

temp_NAs <- pbapply(TimeToExitStation_features[1:1183747, ], 2, function(x) {1183747 - sum(is.na(x))})
TimeToExitStation_features <- TimeToExitStation_features[, which(temp_NAs > 32), with = FALSE]
gc()



rm(temp_NAs)
gc()

# Peak 34GB (751 features)
Date_features <- cbind(NA_features,
                       Mean_features,
                       #Min_features,
                       MinMin_features,
                       Max_features,
                       MaxMax_features,
                       Time0_features,
                       Timing_features,
                       TimeToExitStation_features,
                       TimeToExitProduction_features)

rm(NA_features,
   Mean_features,
   #Min_features,
   MinMin_features,
   Max_features,
   MaxMax_features,
   Time0_features,
   Timing_features,
   TimeToExitStation_features,
   TimeToExitProduction_features)
gc()

spooky <- numeric(ncol(Date_features))
for (i in 1:ncol(Date_features)) {
  spooky[i] <- fastdigest(Date_features[[i]][1:1183747]) # Compute hash only on training data... obviously
  cat("Iteration ", i, " --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = "")
}
Date_features <- Date_features[, which(!duplicated(spooky)), with = FALSE]
gc() #38GB peak

spooky <- pbapply(Date_features, 2, function(x) {r <- ifelse((min(x, na.rm = TRUE) == max(x, na.rm = TRUE)), TRUE, FALSE); gc(verbose = FALSE); r})
gc() #40GB peak
Date_features <- Date_features[, which(!spooky), with = FALSE] # 607 features left
gc()


# Prepare station one-hot encoding
FirstLast_features_fact <- FirstLast_features
FirstLast_features_fact$FirstStation <- as.factor(FirstLast_features$FirstStation)
FirstLast_features_fact$LastStation <- as.factor(FirstLast_features$LastStation)

# temp_sparse <- Matrix(temp_sparse[1:1183747, ], sparse = TRUE)
# temp_names <- temp_sparse@Dimnames[[2]][(temp_sparse@p[2:58] - temp_sparse@p[1:57]) > 500] #store columns
# gc()

temp_sparse <- cbind(model.matrix(~ .-1, data = model.frame(FirstLast_features_fact[, 1, with = FALSE], na.action = na.pass)),
                     model.matrix(~ .-1, data = model.frame(FirstLast_features_fact[, 2, with = FALSE], na.action = na.pass)))
gc()
temp_sparse <- Matrix(temp_sparse, sparse = TRUE)

# temp_sparse <- cbind(sparse.model.matrix(~ .-1, data = FirstLast_features_fact[, 1, with = FALSE]),
#                      sparse.model.matrix(~ .-1, data = FirstLast_features_fact[, 2, with = FALSE]))

gc()
# temp_sparse <- temp_sparse[, temp_names]
# gc()

rm(FirstLast_features, FirstLast_features_fact)
gc()

#rm(spooky, i, temp_names)
rm(spooky, i)
gc()

# Date_features <- cbind(Date_features, temp_sparse)
# rm(temp_sparse)
# gc()

Date_features_train <- as.matrix(Date_features[1:1183747, ]) #5.4GB, 607 features
gc()
Date_features_train <- dropNA(Date_features_train) #2.4GB
gc() #40GB peak
Date_features_train <- cbind(Date_features_train, temp_sparse[1:1183747, ], Laurae_feat[1:1183747, ]) #2.6GB, 736 features
gc()
Date_features_test <- as.matrix(Date_features[1183748:2367495, ]) #5.4GB, 607 features
gc()
Date_features_test <- dropNA(Date_features_test) #2.4GB
gc() #40GB peak
Date_features_test <- cbind(Date_features_test, temp_sparse[1183748:2367495, ], Laurae_feat[1183748:2367495, ]) #2.6GB, 736 features
gc()

rm(temp_sparse, Laurae_feat)
gc() #19GB used

train <- cbind(train, train_mini, Date_features_train) #3.2GB, 860 features
gc()

spooky <- numeric(train@Dim[2])
for (i in 1:train@Dim[2]) {
  spooky[i] <- fastdigest(train[, i])
  cat("Iteration ", i, " --- Uniques: ", length(unique(spooky[1:i])), " ---\n", sep = "")
  if (i %% 20) {gc(verbose = FALSE)}
}
train <- train[, which(!duplicated(spooky))] #2.9GB, 746 features
gc()
saveRDS(train, "Laurae/20161015_xgb_embedcv/train_sparse.rds", compress = TRUE)

test <- cbind(test, test_mini, Date_features_test) #3.2GB, 789 features
gc()
test <- test[, which(!duplicated(spooky))] #2.9GB, 746 features
saveRDS(test, "Laurae/20161015_xgb_embedcv/test_sparse.rds", compress = TRUE)

rm(Date_features_train, Date_features_test)
gc()

rm(Date_features)
gc()

rm(train_mini, test_mini, spooky, boundsofLaurae, boundsofLaurae2, whereisLaurae)
gc() #5.8GB only

StratifiedCV <- function(Y, folds, seed) {
  folded <- list()
  folded1 <- list()
  folded2 <- list()
  set.seed(seed)
  temp_Y0 <- which(Y == 0)
  temp_Y1 <- which(Y == 1)
  for (i in 1:folds) {
    folded1[[i]] <- sample(temp_Y0, floor(length(temp_Y0) / ((folds + 1) - i)))
    temp_Y0 <- temp_Y0[!temp_Y0 %in% folded1[[i]]]
    folded2[[i]] <- sample(temp_Y1, floor(length(temp_Y1) / ((folds + 1) - i)))
    temp_Y1 <- temp_Y1[!temp_Y1 %in% folded2[[i]]]
    folded[[i]] <- c(folded1[[i]], folded2[[i]])
  }
  return(folded)
}

folded <- StratifiedCV(Y, 5, 11111)
folded_extra <- list()
folded_extra[[1]] <- StratifiedCV(Y[folded[[1]]], 5, 11111)
folded_extra[[2]] <- StratifiedCV(Y[folded[[2]]], 5, 11111)
folded_extra[[3]] <- StratifiedCV(Y[folded[[3]]], 5, 11111)
folded_extra[[4]] <- StratifiedCV(Y[folded[[4]]], 5, 11111)
folded_extra[[5]] <- StratifiedCV(Y[folded[[5]]], 5, 11111)


i <- 0

mcc <- function(TP, FP, FN, TN) {
  num <- (TP * TN) - (FP * FN)
  den <- (TP + FP) * (TP + FN) * (TN + FP) * (TN + FN)
  return(ifelse(den == 0, 0, num / sqrt(den)))
}

FastROC <- function(y, x) {
  
  # y = actual
  # x = predicted
  x1 = as.numeric(x[y == 1])
  n1 = as.numeric(length(x1))
  x2 = as.numeric(x[y == 0])
  n2 = as.numeric(length(x2))
  r = rank(c(x1,x2))
  return((sum(r[1:n1]) - n1 * (n1 + 1) / 2) / (n1 * n2))
  
}


gc()
dtrain <- xgb.DMatrix(data = train, label = Y)
gc()
dtest <- xgb.DMatrix(data = test)
gc()

max_better <- function(cp) {
  
  return(max(cp, na.rm = TRUE))
  
}

mcc_eval_nofail_cv <- function(pred, dtrain) {
  
  # Requires to start from i=0
  y_true <- getinfo(dtrain, "label")
  
  if (i %% 2) {
    
    # Fold computation
    output <- 0
    j <- (((i - 1) %% 10)) / 2 + 1
    for (k in 1:length(folded_extra[[j]])) {
      
      # Get best threshold on a train fold
      fold_y_true <- y_true[-folded_extra[[j]][[k]]]
      fold_pred <- pred[-folded_extra[[j]][[k]]]
      temp_thresh <- mcc_eval_pred(y_prob = fold_pred, y_true = fold_y_true)
      
      # Predict on test fold using threshold of train
      fold_y_true <- y_true[folded_extra[[j]][[k]]]
      fold_pred <- pred[folded_extra[[j]][[k]]]
      positives <- as.logical(fold_y_true) # label to boolean
      counter <- sum(positives) # get the amount of positive labels
      tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
      fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
      tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
      fn <- as.numeric(counter - tp) # avoid computing the opposite
      mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
      mcc <- ifelse(is.na(mcc), -1, mcc)
      output <- ((1 / length(folded_extra[[j]])) * mcc) + output
      
    }
    
    cat(ifelse(j == 1, paste("[", i %/% 10, "]  Fold ", sep = ""), " - Fold "), j, ": ", sprintf("%.06f", output), ifelse(j == 5, "\n", ""), sep = "")
    df[((i %/% 10) * 6) + j, "Fold"] <<- as.character(j)
    df[((i %/% 10) * 6) + j, "Iteration"] <<- (i %/% 10) + 1
    df[((i %/% 10) * 6) + j, "MCC"] <<- output
    
    if (j == 5) {
      
      df[((i %/% 10) * 6) + 6, "Fold"] <<- "Mean"
      df[((i %/% 10) * 6) + 6, "Iteration"] <<- (i %/% 10) + 1
      df[((i %/% 10) * 6) + 6, "MCC"] <<- mean(df[(((i %/% 10) * 6) + 1):(((i %/% 10) * 6) + 6), "MCC"], na.rm = TRUE)
      
      jpeg(filename = paste("Laurae/20161015_xgb_embedcv/cv_depth", sprintf("%02d", global_depth), ".jpg", sep = ""), width = 540, height = 540, units = "px")
      print(ggplot(data = df, aes(x = Iteration, y = MCC, group = Fold, color = Fold)) + geom_line() + geom_point() + theme_bw() + labs(title = paste("Depth ", sprintf("%02d", global_depth), "'s best MCC: [", which.max(df[df$Fold == "Mean", "MCC"]), "] ", sprintf("%.06f", max(df[df$Fold == "Mean", "MCC"])), sep = "")))
      dev.off()
      
    }
    
  } else {
    
    # AUC
    output <- FastROC(y = y_true, x = pred)
    
  }
  i <<- i + 1
  if ((i %% 10) == 0) {gc(verbose = FALSE)}
  
  return(list(metric = "mcc", value = round(ifelse((grace_period > (((i - 1) %/% 10) + 1)) & ((i - 1) %% 2), output * (((i - 1) %/% 10) + 1) / grace_period), digits = 12)))
  
}

mcc_eval_nofail_fold <- function(pred, dtrain) {
  
  # Requires "j" to be set to the fold
  # Requires to start from i=0
  
  y_true <- getinfo(dtrain, "label")
  
  if (i %% 2) {
    
    # Fold computation
    output <- 0
    for (k in 1:length(folded_extra[[j]])) {
      
      # Get best threshold on a train fold
      fold_y_true <- y_true[-folded_extra[[j]][[k]]]
      fold_pred <- pred[-folded_extra[[j]][[k]]]
      temp_thresh <- mcc_eval_pred(y_prob = fold_pred, y_true = fold_y_true)
      
      # Predict on test fold using threshold of train
      fold_y_true <- y_true[folded_extra[[j]][[k]]]
      fold_pred <- pred[folded_extra[[j]][[k]]]
      positives <- as.logical(fold_y_true) # label to boolean
      counter <- sum(positives) # get the amount of positive labels
      tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
      fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
      tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
      fn <- as.numeric(counter - tp) # avoid computing the opposite
      mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
      mcc <- ifelse(is.na(mcc), -1, mcc)
      output <- ((1 / length(folded_extra[[j]])) * mcc) + output
      cat(ifelse(k == 1, paste("[", (i %/% 2) + 1, "]  Fold ", sep = ""), " - Fold "), k, ": ", sprintf("%.06f", mcc), ifelse(k == 5, "\n", ""), sep = "")
      df[((i %/% 2) * 6) + k, "Fold"] <<- as.character(k)
      df[((i %/% 2) * 6) + k, "Iteration"] <<- (i %/% 2) + 1
      df[((i %/% 2) * 6) + k, "MCC"] <<- mcc
      
    }
    
    df[((i %/% 2) * 6) + 6, "Fold"] <<- "Mean"
    df[((i %/% 2) * 6) + 6, "Iteration"] <<- (i %/% 2) + 1
    df[((i %/% 2) * 6) + 6, "MCC"] <<- output
    
    jpeg(filename = paste("Laurae/20161015_xgb_embedcv/fold_", j, ".jpg", sep = ""), width = 540, height = 540, units = "px")
    print(ggplot(data = df, aes(x = Iteration, y = MCC, group = Fold, color = Fold)) + geom_line() + geom_point() + theme_bw() + labs(title = paste("Fold ", j, "'s best MCC: [", which.max(df[df$Fold == "Mean", "MCC"]), "] ", sprintf("%.06f", max(df[df$Fold == "Mean", "MCC"])), sep = "")))
    dev.off()
    
  } else {
    
    # AUC
    output <- FastROC(y = y_true, x = pred)
    
  }
  
  i <<- i + 1
  if ((i %% 10) == 0) {gc(verbose = FALSE)}
  
  return(list(metric = "mcc", value = round(ifelse((grace_period > (((i - 1) %/% 2) + 1)) & ((i - 1) %% 2), output * (((i - 1) %/% 2) + 1) / grace_period, output), digits = 12)))
  
}



my_learner <- function(depth) {
  
  sink(file = "Laurae/20161015_xgb_embedcv/log.txt", append = TRUE, split = FALSE)
  cat("\n\n\nDepth ", depth, "\n\n", sep = "")
  global_depth <<- depth
  gc()
  set.seed(11111)
  temp_model <- xgb.cv(data = dtrain,
                       nthread = 6,
                       folds = folded,
                       nrounds = 100000,
                       max_depth = depth,
                       eta = 0.05,
                       #gamma = 0.1,
                       subsample = 1.0,
                       colsample_bytree = 1.0,
                       booster = "gbtree",
                       #eval_metric = "auc",
                       eval_metric = mcc_eval_nofail_cv,
                       maximize = TRUE,
                       early_stopping_rounds = 25,
                       objective = "binary:logistic",
                       verbose = TRUE
                       #base_score = 0.005811208
  )
  sink()
  i <<- 0
  return(c(temp_model$evaluation_log[[4]][temp_model$best_iteration], temp_model$evaluation_log[[5]][temp_model$best_iteration], temp_model$best_iteration))
  
}

xgb.opt.depth.callback <- function(i, learner, better, sd_effect) {
  
  cat("\nExploring depth ", sprintf("%02d", Laurae.xgb.opt.depth.iter[i, "Depth"]), ": ")
  Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], c("mean", "sd", "nrounds")] <<- learner(Laurae.xgb.opt.depth.iter[i, "Depth"])
  Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"] <<- Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"] + (Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "sd"] * sd_effect)
  Laurae.xgb.opt.depth.iter[i, "Score"] <<- Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"]
  Laurae.xgb.opt.depth.iter[i, "Best"] <<- better(Laurae.xgb.opt.depth.df[, "score"])
  Laurae.xgb.opt.depth.best <<- which(Laurae.xgb.opt.depth.df[, "score"] == Laurae.xgb.opt.depth.iter[i, "Best"])[1]
  cat("[",
      sprintf("%05d", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "nrounds"]),
      "] ",
      sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"]),
      ifelse(is.na(Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "mean"]) == TRUE, "", paste("+", sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "sd"]), sep = "")),
      " (Score: ",
      sprintf("%.08f", Laurae.xgb.opt.depth.df[Laurae.xgb.opt.depth.iter[i, "Depth"], "score"]),
      ifelse(Laurae.xgb.opt.depth.iter[i, "Best"] == Laurae.xgb.opt.depth.iter[i, "Score"], " <<<)", "    )"),
      " - best is: ",
      Laurae.xgb.opt.depth.best,
      " - ",
      format(Sys.time(), "%a %b %d %Y %X"),
      sep = "")
  
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
  gc(verbose = FALSE)
  
  return(max(DT[['mcc_v']]))
  
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
  
  return(DT[['y_prob']][which.max(DT[['mcc_v']])])
  
}

mcc_eval_pred_valid_all <- function(y_prob, y_true) {
  
  # Fold computation
  output <- 0
  for (k in 1:length(folded)) {
    
    # Get best threshold on a train fold
    fold_y_true <- y_true[-folded[[k]]]
    fold_pred <- y_prob[-folded[[k]]]
    temp_thresh <- mcc_eval_pred(y_prob = fold_pred, y_true = fold_y_true)
    positives <- as.logical(fold_y_true) # label to boolean
    counter <- sum(positives) # get the amount of positive labels
    tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
    fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
    tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
    fn <- as.numeric(counter - tp) # avoid computing the opposite
    mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
    mcc_train <- ifelse(is.na(mcc), -1, mcc)
    
    fold_y_true <- y_true[folded[[k]]]
    fold_pred <- y_prob[folded[[k]]]
    positives <- as.logical(fold_y_true) # label to boolean
    counter <- sum(positives) # get the amount of positive labels
    tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
    fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
    tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
    fn <- as.numeric(counter - tp) # avoid computing the opposite
    mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
    mcc_test <- ifelse(is.na(mcc), -1, mcc)
    
    cat("Fold ", k, ": threhsold=", sprintf("%.07f", temp_thresh), " - Train MCC=", sprintf("%.06f", mcc_train), " - Test MCC=", sprintf("%.06f", mcc_test), "\n", sep = "")
    
    output <- ((1 / length(folded)) * temp_thresh) + output
    
  }
  
  
  fold_y_true <- y_true
  fold_pred <- y_prob
  positives <- as.logical(fold_y_true) # label to boolean
  counter <- sum(positives) # get the amount of positive labels
  tp <- as.numeric(sum(fold_pred[positives] > output))
  fp <- as.numeric(sum(fold_pred[!positives] > output))
  tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
  fn <- as.numeric(counter - tp) # avoid computing the opposite
  mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
  mcc <- ifelse(is.na(mcc), -1, mcc)
  
  cat("Final threshold: ", sprintf("%.07f", output), " - MCC=", sprintf("%.06f", mcc), "\n", sep = "")
  
  return(output)
  
}


mcc_eval_pred_valid <- function(y_prob, y_true) {
  
  # Feed all data, not by fold
  
  
  # Fold computation
  output <- 0
  
  # 5-fold CV level 1 extra-no-leakage
  for (k in 1:length(folded)) {
    
    temp_thresh2 <- 0
    
    # Exclude the testing fold (CV Level 1)
    unexcluded_lv1 <- which(! c(1, 2, 3, 4, 5) %in% k)
    
    # 4-fold CV level 2 extra-no-leakage
    for (l in unexcluded_lv1) {
      
      # Exclude the testing fold (CV Level 2)
      unexcluded_lv2 <- which(! c(1, 2, 3, 4, 5) %in% c(l, k))
      
      train_fold <- integer(0)
      test_fold <- integer(0)
      for (m in unexcluded_lv2) {
        train_fold <- c(train_fold, folded[[m]])
      }
      test_fold <- c(folded[[l]])
      
      # Get best threshold on a train fold
      fold_y_true <- y_true[train_fold]
      fold_pred <- y_prob[train_fold]
      temp_thresh <- mcc_eval_pred(y_prob = fold_pred, y_true = fold_y_true)
      positives <- as.logical(fold_y_true) # label to boolean
      counter <- sum(positives) # get the amount of positive labels
      tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
      fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
      tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
      fn <- as.numeric(counter - tp) # avoid computing the opposite
      mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
      mcc_train <- ifelse(is.na(mcc), -1, mcc)
      
      fold_y_true <- y_true[test_fold]
      fold_pred <- y_prob[test_fold]
      positives <- as.logical(fold_y_true) # label to boolean
      counter <- sum(positives) # get the amount of positive labels
      tp <- as.numeric(sum(fold_pred[positives] > temp_thresh))
      fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh))
      tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
      fn <- as.numeric(counter - tp) # avoid computing the opposite
      mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
      mcc_test <- ifelse(is.na(mcc), -1, mcc)
      
      cat("Fold ", k, "-", l, ": threhsold=", temp_thresh, " - Train MCC=", sprintf("%.06f", mcc_train), " - Test MCC=", sprintf("%.06f", mcc_test), "\n", sep = "")
      temp_thresh2 <- ((1 / (length(folded) - 1)) * temp_thresh) + temp_thresh2
      
    }
    
    output <- ((1 / length(folded)) * temp_thresh2) + output
    
    fold_y_true <- y_true
    fold_pred <- y_prob
    positives <- as.logical(fold_y_true) # label to boolean
    counter <- sum(positives) # get the amount of positive labels
    tp <- as.numeric(sum(fold_pred[positives] > temp_thresh2))
    fp <- as.numeric(sum(fold_pred[!positives] > temp_thresh2))
    tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
    fn <- as.numeric(counter - tp) # avoid computing the opposite
    mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
    mcc <- ifelse(is.na(mcc), -1, mcc)
    
    cat("Validation Fold ", k, " threshold: ", sprintf("%.07f", temp_thresh2), " - MCC=", sprintf("%.06f", mcc), "\n", sep = "")
    
  }
  
  
  fold_y_true <- y_true
  fold_pred <- y_prob
  positives <- as.logical(fold_y_true) # label to boolean
  counter <- sum(positives) # get the amount of positive labels
  tp <- as.numeric(sum(fold_pred[positives] > output))
  fp <- as.numeric(sum(fold_pred[!positives] > output))
  tn <- as.numeric(length(fold_y_true) - counter - fp) # avoid computing he opposite
  fn <- as.numeric(counter - tp) # avoid computing the opposite
  mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
  mcc <- ifelse(is.na(mcc), -1, mcc)
  
  cat("Final threshold: ", sprintf("%.07f", output), " - MCC=", sprintf("%.06f", mcc), "\n", sep = "")
  
  return(output)
  
}


i <- 0
grace_period <- 40
df <- data.frame(matrix(nrow = 0, ncol = 3))
colnames(df) <- c("Fold", "Iteration", "MCC")
format(Sys.time(), "%a %b %d %Y %X")
xgb.opt.depth(initial = 10, min_depth = 1, max_depth = 20, patience = 2, sd_effect = 0, worst_score = 0, learner = my_learner, better = max_better)

sink(file = "Laurae/20161015_xgb_embedcv/logs_ex.txt", append = TRUE, split = TRUE)
cat("Starting modeling... on ", format(Sys.time(), "%a %b %d %Y %X"), "\n\n\n", sep = "")
Laurae.xgb.opt.depth.best <- 10

features <- list()

predictions1 <- numeric(1183747)
predictions2 <- numeric(1183748)
predictions3 <- data.frame(matrix(rep(0, 1183748*5), nrow = 1183748))

for (j in 1:5) {
  
  gc(verbose = FALSE)
  dval1 <- dtrain[(1:1183747)[-folded[[j]]]]
  gc(verbose = FALSE)
  dval2 <- dtrain[(1:1183747)[folded[[j]]]]
  
  i <- 0
  grace_period <- 40
  df <- data.frame(matrix(nrow = 0, ncol = 3))
  colnames(df) <- c("Fold", "Iteration", "MCC")
  cat("\n\n\nLearning ", j, " on ", format(Sys.time(), "%a %b %d %Y %X"), "\n\n", sep = "")
  sink(file = "Laurae/20161015_xgb_embedcv/logs.txt", append = TRUE, split = FALSE)
  cat("\n\n\nLearning ", j, " on ", format(Sys.time(), "%a %b %d %Y %X"), "\n\n", sep = "")
  gc()
  set.seed(11111)
  try(temp_model <- xgb.train(data = dval1,
                              nthread = 6,
                              nrounds = 1000000,
                              max_depth = Laurae.xgb.opt.depth.best,
                              eta = 0.05,
                              #gamma = 20,
                              subsample = 1.0,
                              colsample_bytree = 1.0,
                              booster = "gbtree",
                              feval = mcc_eval_nofail_fold,
                              #eval_metric = "auc",
                              maximize = TRUE,
                              early_stopping_rounds = 75,
                              objective = "binary:logistic",
                              verbose = TRUE,
                              prediction = TRUE,
                              watchlist = list(train = dval1, test = dval2)
                              #base_score = 0.005811208 # fast learning
                              # ,callbacks = list(cb.early.stop(stopping_rounds = 25,
                              #                                maximize = TRUE,
                              #                                verbose = TRUE))
  )
  )
  sink()
  cat("\nTime: ", format(Sys.time(), "%a %b %d %Y %X"), sep = "")
  gc(verbose = FALSE)
  predictions1[folded[[j]]] <- predict(temp_model, dval2, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of validation predictions: ", mean(predictions1[folded[[j]]]))
  gc(verbose = FALSE)
  predictions3[, j] <- predict(temp_model, dtest, ntreelimit = temp_model$best_iteration)
  cat("\nAverage of test predictions: ", mean(predictions3[, j]))
  predictions2 <- predictions3[, j] + predictions2
  cat("\nAverage of rolling test predictions: ", mean(predictions2) * (5 / j))
  gc(verbose = FALSE)
  features[[j]] <- xgb.importance(feature_names = train@Dimnames[[2]], model = temp_model)
  gc(verbose = FALSE)
  cat("\nFor ", sprintf("%04d", temp_model$best_iteration), " rounds: ", colnames(temp_model$evaluation_log)[2], ": ", temp_model$evaluation_log[[2]][temp_model$best_iteration], " - ", colnames(temp_model$evaluation_log)[3], ": ", temp_model$evaluation_log[[3]][temp_model$best_iteration], sep = "")
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  temp_preds <- as.numeric(predictions1[folded[[j]]] > temp_mcc)
  cat("\nConfusion matrix:\n")
  print(table(data.frame(preds = temp_preds, truth = Y[folded[[j]]])))
  print(table(data.frame(preds = temp_preds, truth = Y[folded[[j]]]))/length(folded[[j]]))
  cat("Fold ", j, ": MCC=", mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]]), "\n", sep = "")
  write.csv(predictions1, file = "Laurae/20161015_xgb_embedcv/predictions_oof.csv", row.names = FALSE)
  write.csv(predictions3, file = "Laurae/20161015_xgb_embedcv/predictions_test_raw.csv", row.names = FALSE)
  write.csv(features[[j]], file = paste("Laurae/20161015_xgb_embedcv/best_features", j, ".csv", sep = ""), row.names = FALSE)
  
}

predictions2 <- predictions2 / 5
write.csv(predictions2, file = "Laurae/20161015_xgb_embedcv/predictions_test_mean.csv", row.names = FALSE)



cat("\n\n\nPreparing submissions and MCC behavior analysis... on ", format(Sys.time(), "%a %b %d %Y %X"), "\n\n\n", sep = "")

temp_mcc <- numeric(5)
best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc[j]
  cat("Fold ", j, ": MCC=", temp_mcc[j], " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}
cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")


cat("\n\nCreating submissions... on ", format(Sys.time(), "%a %b %d %Y %X"), "\n\n\n", sep = "")


best_mcc <- mcc_eval_pred(y_prob = predictions1, y_true = Y)
submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0$Response <- as.numeric(predictions2 > best_mcc)
cat("Submission 0 positives: ", sum(submission0$Response == 1), "\n\n", sep = "")
write.csv(submission0, file = "Laurae/20161015_xgb_embedcv/submission0.csv", row.names = FALSE)


best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", best_mcc * (5 / j), "\n", sep = "")
  
}

submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions2 > best_mcc)
cat("Submission 1 positives: ", sum(submission1$Response == 1), "\n\n", sep = "")
write.csv(submission1, file = "Laurae/20161015_xgb_embedcv/submission1.csv", row.names = FALSE)


best_mcc <- numeric(1183748)

for (j in 1:5) {
  
  temp_mcc <- mcc_eval_pred(y_prob = predictions1[folded[[j]]], y_true = Y[folded[[j]]])
  best_mcc <- best_mcc + as.numeric(predictions3[, j] > temp_mcc)
  cat("Fold ", j, ": threshold=", temp_mcc, " | rolling average: ", mean(best_mcc) / j, "\n", sep = "")
  
}


submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 5)
cat("Submission 2_5 positives: ", sum(submission2$Response == 1), "\n", sep = "")
write.csv(submission2, file = "Laurae/20161015_xgb_embedcv/submission2_5.csv", row.names = FALSE)

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 4)
cat("Submission 2_4 positives: ", sum(submission2$Response == 1), "\n", sep = "")
write.csv(submission2, file = "Laurae/20161015_xgb_embedcv/submission2_4.csv", row.names = FALSE)

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 2)
cat("Submission 2_2 positives: ", sum(submission2$Response == 1), "\n", sep = "")
write.csv(submission2, file = "Laurae/20161015_xgb_embedcv/submission2_2.csv", row.names = FALSE)

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 1)
cat("Submission 2_1 positives: ", sum(submission2$Response == 1), "\n", sep = "")
write.csv(submission2, file = "Laurae/20161015_xgb_embedcv/submission2_1.csv", row.names = FALSE)

submission2 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission2$Response <- as.numeric(best_mcc >= 3)
cat("Submission 2_3 positives: ", sum(submission2$Response == 1), "\n", sep = "")
write.csv(submission2, file = "Laurae/20161015_xgb_embedcv/submission2_3.csv", row.names = FALSE)


submission3 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission3$Response <- as.numeric((submission1$Response + submission2$Response) >= 1) # 0.5 to 1
cat("Submission 3 positives: ", sum(submission3$Response == 1), "\n\n", sep = "")
write.csv(submission3, file = "Laurae/20161015_xgb_embedcv/submission3.csv", row.names = FALSE)


submission4 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission4$Response <- as.numeric((submission1$Response + submission2$Response) > 1) # 0.5 to 0
cat("Submission 4 positives: ", sum(submission4$Response == 1), "\n\n", sep = "")
write.csv(submission4, file = "Laurae/20161015_xgb_embedcv/submission4.csv", row.names = FALSE)


rm(submission0, submission1, submission2, submission3, submission4)


cat("Validated CV (Train folds vs Test folds)\n")
best_mcc <- mcc_eval_pred_valid_all(y_prob = predictions1, y_true = Y)
submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0$Response <- as.numeric(predictions2 > best_mcc)
cat("Validated Submission 0 positives: ", sum(submission0$Response == 1), "\n\n", sep = "")
write.csv(submission0, file = "Laurae/20161015_xgb_embedcv/submission0_valid.csv", row.names = FALSE)


best_mcc <- mcc_eval_pred_valid(y_prob = predictions1, y_true = Y)
submission1 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission1$Response <- as.numeric(predictions2 > best_mcc)
cat("Validated Submission 1 positives: ", sum(submission1$Response == 1), "\n\n", sep = "")
write.csv(submission1, file = "Laurae/20161015_xgb_embedcv/submission1_valid.csv", row.names = FALSE)

rm(submission0, submission1)





sink()
