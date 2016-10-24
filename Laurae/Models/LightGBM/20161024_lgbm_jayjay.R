# Libraries

library(data.table)
library(Matrix)
library(recommenderlab)
library(Laurae)
library(fastdigest)
library(pbapply)
library(ggplot2)
library(R.utils)
library(stringi)

setwd("E:/")

my_script_is_using <- "E:/Laurae/20161024_lgbm_jayjay"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- strsplit(gsub("/", "\\\\", my_script_is_using), "\\\\")
my_script_subbed <- my_script_subbed[[1]][length(my_script_subbed[[1]])]


# Load from RDS

train <- readRDS("jayjay/train.rds")
test <- readRDS("jayjay/test.rds")
extra_var_v1 <- readRDS("jayjay/extra_var_v1.rds")
extra_var_v1_S34 <- readRDS("jayjay/extra_var_v1_S34.rds")
extra_var_v2 <- readRDS("jayjay/extra_var_v2.rds")
extra_var_v4 <- readRDS("jayjay/extra_var_v4.rds")
extra_var_v4bis <- readRDS("jayjay/extra_var_v4bis.rds")


strange <- numeric()
for (i in colnames(train)) {
  cat(i, " checked.\n")
  if (!is.numeric(train[[i]])) {print(i); strange <- c(strange, which(i == colnames(train)))}
  gc()
}

# 92, 526, 573, 645
# "CATEGORICAL_Last_____1" "CATEGORICAL_Last_____2" "CATEGORICAL_Max______1" "CATEGORICAL_Max______3"
colnames(train)[strange]

for (i in colnames(train)[strange]) {
  train[[i]] <- as.numeric(train[[i]])
  test[[i]] <- as.numeric(test[[i]])
}

# Character column already on design matrix
extra_var_v4[, 2] <- NULL

dupped_1 <- which(!colnames(extra_var_v1) %in% colnames(train))
dupped_2 <- which(!colnames(extra_var_v1_S34) %in% colnames(train))
dupped_3 <- which(!colnames(extra_var_v2) %in% colnames(train))
dupped_4 <- which(!colnames(extra_var_v4) %in% colnames(train))
dupped_5 <- which(!colnames(extra_var_v4bis) %in% colnames(train))


colnames(extra_var_v1) <- c("Id", "L0_Max", "L0_Min", "L0_Mean", "L0_Range", "L0_Unique_count", 
                            "L1_Min", "L1_Max", "L1_Range", "L1_Unique_count", "L2_Min", 
                            "L2_Max", "L2_Range", "L2_Unique_count", "L3_Min", "L3_Max", 
                            "L3_Range", "L3_Unique_count", "Max", "Min", "Mean", "Range", 
                            "Unique_count", "Kurtosis", "Response_Minus1", "GF0", "sameL0", 
                            "sameL1", "sameL2", "sameL3", "ResponseMinus1_Number1", "GF1", "sameL0_Number1", 
                            "sameL1_Number1", "sameL2_Number1", "sameL3_Number1", "FOR165_LAG_Sum_ResponseMinus1", 
                            "FOR165_LAG_Missing_Value_Count_ResponseMinus1", "FOR165_LAG_Count_Mult_ResponseMinus1", 
                            "FOR165_LAG_log_lag", "FOR165_LAG3_Sum_ResponseMinus1", "FOR165_LAG3_Missing_Value_Count_ResponseMinus1", 
                            "FOR165_LAG3_Count_Mult_ResponseMinus1", "FOR165_LAG3_log_lag", "FOR165_LAG2_Sum_ResponseMinus1", 
                            "FOR165_LAG2_Missing_Value_Count_ResponseMinus1", "FOR165_LAG2_Count_Mult_ResponseMinus1", 
                            "FOR165_LAG2_log_lag", "FOR165_LAG1_Sum_ResponseMinus1", "FOR165_LAG1_Missing_Value_Count_ResponseMinus1", 
                            "FOR165_LAG1_Count_Mult_ResponseMinus1", "FOR165_LAG1_log_lag", "FOR165_LAG0_Sum_ResponseMinus1", 
                            "FOR165_LAG0_Missing_Value_Count_ResponseMinus1", "FOR165_LAG0_Count_Mult_ResponseMinus1", 
                            "FOR165_LAG0_log_lag", "FOR165_Sum", "BAC165_LAG_Sum_ResponseMinus1", 
                            "BAC165_LAG_Missing_Value_Count_ResponseMinus1", "BAC165_LAG_Count_Mult_ResponseMinus1", 
                            "BAC165_LAG_log_lag", "BAC165_LAG3_Sum_ResponseMinus1", "BAC165_LAG3_Missing_Value_Count_ResponseMinus1", 
                            "BAC165_LAG3_Count_Mult_ResponseMinus1", "BAC165_LAG3_log_lag", "BAC165_LAG2_Sum_ResponseMinus1", 
                            "BAC165_LAG2_Missing_Value_Count_ResponseMinus1", "BAC165_LAG2_Count_Mult_ResponseMinus1", 
                            "BAC165_LAG2_log_lag", "BAC165_LAG1_Sum_ResponseMinus1", "BAC165_LAG1_Missing_Value_Count_ResponseMinus1", 
                            "BAC165_LAG1_Count_Mult_ResponseMinus1", "BAC165_LAG1_log_lag", "BAC165_LAG0_Sum_ResponseMinus1", 
                            "BAC165_LAG0_Missing_Value_Count_ResponseMinus1", "BAC165_LAG0_Count_Mult_ResponseMinus1", 
                            "BAC165_LAG0_log_lag", "BAC165_Sum", "FOR100_LAG_Sum_ResponseMinus1", 
                            "FOR100_LAG_Missing_Value_Count_ResponseMinus1", "FOR100_LAG_Count_Mult_ResponseMinus1", 
                            "FOR100_LAG_log_lag", "FOR100_LAG3_Sum_ResponseMinus1", "FOR100_LAG3_Missing_Value_Count_ResponseMinus1", 
                            "FOR100_LAG3_Count_Mult_ResponseMinus1", "FOR100_LAG3_log_lag", "FOR100_LAG2_Sum_ResponseMinus1", 
                            "FOR100_LAG2_Missing_Value_Count_ResponseMinus1", "FOR100_LAG2_Count_Mult_ResponseMinus1", 
                            "FOR100_LAG2_log_lag", "FOR100_LAG1_Sum_ResponseMinus1", "FOR100_LAG1_Missing_Value_Count_ResponseMinus1", 
                            "FOR100_LAG1_Count_Mult_ResponseMinus1", "FOR100_LAG1_log_lag", "FOR100_LAG0_Sum_ResponseMinus1", 
                            "FOR100_LAG0_Missing_Value_Count_ResponseMinus1", "FOR100_LAG0_Count_Mult_ResponseMinus1", 
                            "FOR100_LAG0_log_lag", "FOR100_Sum", "BAC100_LAG_Sum_ResponseMinus1", 
                            "BAC100_LAG_Missing_Value_Count_ResponseMinus1", "BAC100_LAG_Count_Mult_ResponseMinus1", 
                            "BAC100_LAG_log_lag", "BAC100_LAG3_Sum_ResponseMinus1", "BAC100_LAG3_Missing_Value_Count_ResponseMinus1", 
                            "BAC100_LAG3_Count_Mult_ResponseMinus1", "BAC100_LAG3_log_lag", "BAC100_LAG2_Sum_ResponseMinus1", 
                            "BAC100_LAG2_Missing_Value_Count_ResponseMinus1", "BAC100_LAG2_Count_Mult_ResponseMinus1", 
                            "BAC100_LAG2_log_lag", "BAC100_LAG1_Sum_ResponseMinus1", "BAC100_LAG1_Missing_Value_Count_ResponseMinus1", 
                            "BAC100_LAG1_Count_Mult_ResponseMinus1", "BAC100_LAG1_log_lag", "BAC100_LAG0_Sum_ResponseMinus1", 
                            "BAC100_LAG0_Missing_Value_Count_ResponseMinus1", "BAC100_LAG0_Count_Mult_ResponseMinus1", 
                            "BAC100_LAG0_log_lag", "BAC100_Sum")

colnames(train) <- c("Id", "Response", "ratio", "FOR100_Sum", "L3_S33_F3857", "FOR165_Sum", 
                     "BAC165_Sum", "BAC100_Sum", "sameL0_Number1", "L3_S30_F3754", "L3_S30_F3809", 
                     "FOR165_log_lag_L2", "L3_S30_F3744", "BAC100_log_lag_L3", "DATE_L3kurt", 
                     "sameL3", "sameL3_Number1", "FOR100_log_lag_L3", "FOR165_log_lag", 
                     "BAC165_log_lag", "L3_S30_F3774", "sameL1_Number1", "L3_S33_F3859", 
                     "L3_S30_F3494", "L3_S29_F3333", "BAC165_log_lag_L3", "L3_S30_F3759", 
                     "L0_S1_F28", "L3_S29_F3373", "Range", "Kurtosis", "L3_S33_F3865", 
                     "BAC30_Sum_S", "DATE_S33max", "FOR165_log_lag_L3", "FOR60_Sum_S3", 
                     "L3_S29_F3348", "sameL2_Number1", "L0_Max", "L3_S30_F3769", "Response_Minus1", 
                     "L3_S30_F3749", "BAC100_log_lag", "L3_S29_F3351", "L3_S36_F3920", 
                     "FOR100_log_lag", "BAC165_log_lag_L2", "BAC60_Sum_S3", "L3_S29_F3339", 
                     "L3_S30_F3804", "L3max_L0min", "L3_S29_F3379", "L3_S29_F3479", 
                     "FOR100_log_lag_L2", "BAC165_log_lag_L1", "BAC165_log_lag_L0", 
                     "FOR30_Sum_S", "BAC100_log_lag_L2", "L3_S29_F3342", "L3_S29_F3327", 
                     "L0_S2_F44", "L3_S30_F3604", "L0_S3_F100", "L3_S30_F3534", "L3_S29_F3354", 
                     "L3_S30_F3574", "L1_S24_F1844", "L0_S0_F20_Mult_L0_S0_F20", "L3_S30_F3639", 
                     "FOR165_log_lag_L1", "FOR100_log_lag_L1", "FOR165_log_lag_L0", 
                     "L3_S30_F3504", "L3_S30_F3609", "L0_S7_F138", "L3_S29_F3321", 
                     "L3_Min", "L3_S29_F3336", "Response_Minus1_Number1", "L0max_L3max", 
                     "BAC100_log_lag_L1", "L3_S30_F3709", "L3_S30_F3829", "FOR60_log_lag_S33", 
                     "L3_S29_F3315", "L0_S0_F18", "L3_S30_F3544", "L3_S29_F3330", 
                     "L0_S1_F24", "L0_S5_F116", "L3_S29_F3324", "CATEGORICAL_Last_____1", 
                     "FOR60_log_lag_S30", "L0_S0_F0", "L0_S4_F109", "L0_S9_F180", 
                     "L3_S35_F3889", "L1_S24_F1581", "CATEGORICAL_out_out_L3_S32_F3854_class2", 
                     "L2_Min", "L0_S0_F20", "L0_S6_F132", "L1_S24_F1516", "L3_S30_F3554", 
                     "L3_S29_F3473", "DATE_S34max", "L3_S30_F3784", "L3_S30_F3689", 
                     "L3_S30_F3514", "DATE_S37max", "L1_S24_F1672", "L2_S26_F3106", 
                     "L3_S30_F3799", "BAC30_log_lag_S34", "FOR100_log_lag_L0", "GF0", 
                     "L3_S30_F3624", "L3_S30_F3579", "L3_S30_F3564", "L3_S30_F3684", 
                     "L3_Max", "L0_S4_F104", "L3_S29_F3345", "L3_S29_F3427", "L3_S30_F3764", 
                     "L2_S26_F3051", "L0_S0_F2", "L3_S30_F3524", "DATE_S35max", "L3_S30_F3519", 
                     "BAC60_log_lag_S33", "L3_S30_F3499", "L0_S2_F64", "L3_S30_F3794", 
                     "L3_S29_F3318", "L0_S9_F195", "DATE_S36max", "L0_S11_F286", "L3_S29_F3376", 
                     "DATE_S38max", "L0_S2_F36", "L1_S24_F1850", "L3_S30_F3509", "L0_S11_F326", 
                     "L0_S10_F244", "DATE_S32max", "L2_S27_F3199", "L3_S30_F3584", 
                     "S37min_S34min", "BAC100_log_lag_L0", "L0_S0_F16", "L0_S2_F60", 
                     "L2_S27_F3210", "L1_S24_F1846", "L3_S30_F3669", "L0_S11_F314_Mult_L0_S0_F20", 
                     "L0_S5_F114", "L3_S30_F3704", "L2_S26_F3062", "FOR30_log_lag_S34", 
                     "L1_S24_F1842", "L3max_S26max", "L1_S24_F1578", "L3_S30_F3629", 
                     "L0_S3_F72", "L2max_S37max", "L1_S24_F1514", "L1_S24_F1518", 
                     "L3_S29_F3433", "L0_S11_F294", "L0_S3_F80", "DATE_L1kurt", "L3_S29_F3357", 
                     "sameL0", "L0_S11_F318", "L2_S27_F3214", "L0_S10_F219", "DATE_S30max", 
                     "L1_S24_F1575", "L1_Min", "L0_S9_F155", "CATEGORICAL_Unique_Count", 
                     "L0_S6_F122", "L0_S10_F254", "L0_S2_F48", "L3_S29_F3388", "L0_S3_F84", 
                     "L0_S15_F406", "L3_Range", "L1_S24_F1814", "L0_S11_F310", "L2_S26_F3073", 
                     "L3_S30_F3819", "S33max_S29min", "Unique_Count", "L3_S29_F3382", 
                     "L3_S38_F3960", "L2_S27_F3129", "L0_S15_F397", "L1_S24_F1812", 
                     "L3_S29_F3424", "L3_S29_F3430", "L3_S30_F3589", "L0_S0_F12", 
                     "L0_Min", "S33min_S37min", "L3_S30_F3649", "DATE_S7_max", "L3_S29_F3395", 
                     "DATE_S2_max", "L0_S0_F22", "L3_S32_F3850", "L0_Range", "L2_S26_F3121", 
                     "L0_S3_F96", "L0_S9_F210", "L3_S29_F3476", "DATE_S6_max", "L0_Mean", 
                     "L2_S27_F3206", "L1_S25_F2126", "L0_S11_F306", "S36max_S29min", 
                     "L0_S11_F314_Mult_L0_S11_F314", "S33min_S30min", "L0_S13_F356", 
                     "S29min_S32min", "BAC30_log_lag_S33", "L1_S24_F1637", "FOR30_log_lag_S30", 
                     "L2_S26_F3047", "DATE_S4_max", "L3_S30_F3664", "L0_S11_F282", 
                     "L2_S27_F3162", "L3_S29_F3452", "BAC60_log_lag_S34", "L2_S26_F3113", 
                     "L3_S30_F3644", "L3_S47_F4163", "S30min_S37min", "L0_S11_F322", 
                     "L0_S19_F455", "L1_S24_F1773", "L1_Range", "L1_S24_F1803", "L1_S24_F1700", 
                     "BAC30_log_lag_S30", "L1_S24_F1632", "L0_S0_F4", "L0_S9_F200", 
                     "L0_S18_F439", "L0_S17_F433", "L0_S9_F190", "L1_S24_F1685", "S29min_S37min", 
                     "BAC60_log_lag_S30", "L1_S24_F1609", "L3_S29_F3421", "S33min_S36min", 
                     "FOR60_log_lag_S34", "L0_S23_F643", "S29min_S34min", "L1_S24_F1798", 
                     "L3_S29_F3436", "GF1", "L1_S24_F1831", "L1_S24_F1667", "L1_S24_F1520", 
                     "L0_S9_F170", "L3_S29_F3385", "S35min_L1min", "L0_S0_F8", "L0_S15_F403", 
                     "L3_S29_F3458", "L3_S35_F3896", "L0_S11_F302", "L1_S24_F1723", 
                     "L1_S24_F1728", "L3_S29_F3461", "L0_S23_F623", "L0_S7_F142", 
                     "L0_S10_F234", "DATE_S19max", "Min", "L2_S27_F3144", "L3max_S30max", 
                     "L0_S15_F415", "DATE_S3_max", "L0_S11_F290", "L1_Max", "L3_S29_F3455", 
                     "L2_S26_F3036", "L1_S24_F1571", "L0_S9_F185", "L0_S21_F472", 
                     "L1_S24_F1758", "L2_S26_F3069", "L0_S21_F537", "DATE_S0_max", 
                     "CATEGORICAL_Missing_Value_Count", "L0_S12_F332", "L3_S45_F4124", 
                     "FOR30_log_lag_S33", "Mean", "L0_S10_F249", "L3_S29_F3367", "L3_S29_F3407", 
                     "L0_S0_F6", "L3_S30_F3569", "L0_S10_F229", "L3_Unique_Count", 
                     "DATE_S24max", "S13min_S33min", "L0_S23_F659", "L3_S41_F4000", 
                     "L3_S30_F3634", "L0_S9_F175", "L1_S24_F1778", "L1_S24_F1512", 
                     "L3_S30_F3679", "L0_S15_F418", "L1_S25_F2116", "L3_S30_F3539", 
                     "L0_S10_F259", "S32max_S37min", "L0_S9_F165", "L3_S30_F3529", 
                     "L1_S25_F2161", "L0_S10_F224", "L3_S36_F3924", "L0_S10_F264", 
                     "L0_S21_F482", "L0_S14_F386", "L3_S29_F3370", "L1_S25_F2056", 
                     "L0_Unique_Count", "L0_S21_F497", "L1_S24_F1743", "L0_S14_F362", 
                     "S26min_S37min", "DATE_S26max", "L1_S24_F1567", "L1_S24_F1565", 
                     "L0_S18_F449", "L2_S27_F3155", "L1_S25_F2147", "DATE_S44max", 
                     "L2_Max", "L3_S30_F3549", "L1_S25_F1992", "L0_S22_F576", "S33min_S35min", 
                     "DATE_S10max", "L3_S47_F4153", "L3_S29_F3401", "L3max_S34min", 
                     "L0_S12_F350", "L3_S30_F3559", "L0_S16_F421", "L1_S24_F1544", 
                     "Max", "L1_S24_F1002", "L0_S22_F591", "L0_S12_F330", "L1_S24_F1810", 
                     "L2_S27_F3133", "L3_L3_Unique_Count", "L0_S10_F274", "L1_S25_F1892", 
                     "DATE_S11max", "L0_S23_F667", "DATE_S8_max", "L2_S27_F3140", 
                     "L3_S33_F3855", "L0_S14_F390", "L0_S13_F354", "L3_S29_F3449", 
                     "L1_S24_F1793", "L2_S26_F3040", "L3_S29_F3439", "L0_S9_F160", 
                     "L1_S24_F1662", "DATE_S27max", "L0_S17_F431", "L1_S25_F1855", 
                     "L3_S35_F3894", "L1_S24_F1829", "L1_S24_F1822", "L1_S24_F1783", 
                     "L3_S29_F3412", "L0_S22_F551", "L0_S12_F346", "L3_S38_F3952", 
                     "L0_S22_F596", "L1_S24_F1818", "L1_S24_F1788", "S26min_S24min", 
                     "L1_S24_F1026", "L1_S24_F1599", "L1_S24_F1652", "L0_S16_F426", 
                     "L0_S12_F348", "L3_S30_F3674", "L1_S24_F1763", "L3_S41_F4006", 
                     "L1_S25_F1869", "L1_S24_F1594", "S30min_S35min", "L3_S36_F3918", 
                     "L1_S24_F1816", "DATE_S25max", "L1_S24_F948", "L0_S21_F522", 
                     "DATE_S9_max", "L1_S24_F983", "L1_S24_F1848", "L3_S40_F3982", 
                     "L3_S36_F3938", "L3_S29_F3360", "L0_S2_F40", "L3_S48_F4202", 
                     "L3_S41_F4020", "L2_S26_F3117", "L0_S22_F556", "DATE_S24min", 
                     "L1_S24_F1820", "L1_S24_F1539", "L1_S25_F2176", "L3_S44_F4118", 
                     "L3_S38_F3956", "L0_S22_F561", "S33min_S34min", "L3_S41_F4008", 
                     "L3_S47_F4143", "L1_S24_F1041", "L0_S19_F459", "L0_S22_F571", 
                     "L0_S23_F639", "L1_S25_F1900", "S27min_S32min", "L0_S21_F517", 
                     "L1_S24_F1808", "DATE_S13max", "L1_S25_F2111", "L0_S21_F477", 
                     "L0_S21_F532", "DATE_L0max", "L3_S29_F3404", "L1_S24_F1622", 
                     "L1_S24_F1718", "L1_S24_F1573", "sameL2", "L0_S22_F601", "DATE_S1_max", 
                     "L3_S29_F3467", "L0_S23_F655", "L1_S25_F2131", "L1_S24_F1463", 
                     "L1_S25_F2136", "S34min_S35min", "L0_S11_F314", "L0_S21_F527", 
                     "L3_S34_F3882", "S32min_S30min", "L3_S47_F4158", "L0_S14_F374", 
                     "L3_S41_F4014", "L0_S23_F671", "L0_S23_F631", "DATE_S10min", 
                     "L0_S22_F546", "S29max_S35max", "L1_S24_F1713", "L0_S0_F10", 
                     "sameL1", "L1_S24_F1824", "L0_S12_F352", "L1_S24_F1647", "L2_Range", 
                     "L3_S47_F4138", "L0_S21_F487", "L0_S23_F651", "L3_S41_F4004", 
                     "L0_S12_F334", "DATE_S20max", "L1_S24_F691", "L3_S44_F4115", 
                     "L0_S23_F663", "L1_S24_F1406", "S26max_S32max", "L3_S29_F3488", 
                     "L1_S25_F2021", "L1_S25_F1978", "L0_S14_F370", "L1_S24_F1202", 
                     "S32min_S34min", "L1_S24_F1336", "L1_S24_F1569", "L3_S40_F3980", 
                     "L2_S28_F3255", "L3_S43_F4090", "L3_S48_F4198", "L3_S41_F4026", 
                     "DATE_S23max", "L1_S24_F1494", "L0_S0_F14", "L1_S25_F2051", "L1_Unique_Count", 
                     "L0_S23_F619", "L1_S25_F2173", "L0_S12_F342", "L1_S24_F1642", 
                     "L0_S23_F627", "L1_S24_F1834", "L0_S2_F32", "L3_S44_F4121", "L1_S25_F2144", 
                     "L1_S25_F2061", "DATE_S50max", "L1_S24_F1733", "L0_S6_F118", 
                     "L3_S50_F4243", "L3_S30_F3734", "DATE_S28max", "CATEGORICAL_Last_____2", 
                     "L3_L3_Missing_Value_Count", "L1_S25_F2026", "L1_S24_F988", "L1_S25_F2158", 
                     "L0_S12_F338", "L3_S41_F4016", "L1_S24_F1381", "L1_S25_F1938", 
                     "L1_S24_F973", "L2_S28_F3311", "L1_S24_F1836", "L0_S22_F611", 
                     "DATE_S49max", "L1_S24_F1748", "L3_S29_F3491", "L3_S43_F4085", 
                     "L0_S21_F502", "L1_S25_F2167", "CATEGORICAL_out_L3_S32_F3854_class1", 
                     "L1_S24_F1235", "L2_S27_F3166", "L0_S9_F205", "L1_S24_F1498", 
                     "L0_S22_F586", "L1_S24_F1490", "L1_L1_Missing_Value_Count", "L2_L2_Unique_Count", 
                     "L1_S24_F963", "L1_S24_F1122", "L1_S24_F1431", "L1_S24_F1451", 
                     "L0_S21_F512", "L0_S12_F344", "L1_S25_F1914", "L1_S24_F1768", 
                     "L3_S47_F4148", "L0_S12_F336", "L2_S28_F3299", "L1_S25_F2441", 
                     "L1_S25_F2086", "L1_S25_F1958", "L2_S26_F3077", "L1_S25_F2106", 
                     "L0_S8_F144", "L0_S10_F239", "L2_S28_F3248", "CATEGORICAL_Max______1", 
                     "L1_S24_F802", "L1_S24_F808", "L3_S43_F4095", "L1_S24_F1293", 
                     "L3_S29_F3482", "L1_S24_F1102", "L1_S25_F1873", "L1_S24_F1184", 
                     "L1_S25_F2152", "L3_S39_F3968", "L3_S29_F3442", "L1_S25_F1858", 
                     "L1_S25_F2081", "L3_S40_F3984", "L0_S3_F68", "L0_S21_F492", "L3_S36_F3934", 
                     "L1_S24_F814", "L1_S24_F1838", "L3_S41_F4023", "L1_S24_F1441", 
                     "L1_S25_F1968", "L1_S24_F1321", "L3_S43_F4080", "L1_S25_F2164", 
                     "L1_S24_F1657", "L1_S24_F1627", "L1_S25_F2297", "L1_S24_F1738", 
                     "L3_S41_F4011", "L3_S40_F3986", "L1_S24_F1240", "L1_S25_F2220", 
                     "L0_S22_F606", "L1_S24_F1056", "L1_S24_F1166", "L3_S48_F4196", 
                     "L1_S25_F2312", "L1_S25_F1973", "L1_S25_F3034", "DATE_S20min", 
                     "L1_S24_F700", "L1_S24_F1753", "L1_S24_F1006", "L1_S25_F2007", 
                     "L1_S25_F2170", "L1_S25_F2071", "DATE_S40max", "L0_S2_F56", "L3_S33_F3861", 
                     "L3_S33_F3867", "L1_S25_F2408", "L1_S25_F2960", "L1_S24_F1004", 
                     "L1_S24_F829", "L1_S24_F1506", "L1_S25_F2031", "L0_S15_F400", 
                     "L1_S25_F2101", "L1_S24_F998", "L3_S37_F3950", "L3_S35_F3884", 
                     "L1_S24_F1180", "L1_S25_F2443", "L1_S25_F1890", "L1_S25_F3009", 
                     "L1_S25_F2433", "L3_S44_F4112", "L1_S24_F1255", "L0_S20_F461", 
                     "L3_S34_F3876", "CATEGORICAL_Max______3", "L1_S24_F800", "L1_S24_F1690", 
                     "L1_S25_F2770", "L1_S24_F1172", "L2_Unique_Count", "L1_S24_F728", 
                     "L3_S31_F3842", "L3_S30_F3724", "L3_S49_F4231", "L3_S29_F3398", 
                     "DATE_S45min", "L3_S47_F4183", "L1_S24_F1197", "L1_S25_F2155", 
                     "L1_S24_F935", "S25max_S32min", "DATE_S43max", "DATE_S41max", 
                     "L1_S24_F1331", "L1_S25_F2278", "L1_S25_F2423", "L1_S25_F2837", 
                     "L0_S7_F136", "L1_S24_F1245", "L1_S24_F978", "L1_S24_F812", "L1_S24_F810", 
                     "L1_S25_F2743", "L3_S49_F4211", "L1_S24_F1068", "L1_S25_F3026", 
                     "L1_S25_F1909", "L1_S24_F968", "L1_S25_F2016", "L1_S25_F1963", 
                     "L0_S21_F507", "L0_S14_F366", "DATE_S8_min", "L1_S24_F1416", 
                     "L3_S33_F3873", "L1_S24_F1303", "L1_S25_F2791", "L1_S25_F2797", 
                     "L1_S24_F1401", "L1_S24_F1012", "L1_S24_F1016", "L1_S24_F1391", 
                     "L1_S25_F1929", "L1_S25_F2046", "L0_S3_F76", "DATE_S13min", "L2_S28_F3307", 
                     "L3_S36_F3922", "L3_S36_F3926", "DATE_S47max", "L1_S25_F1877", 
                     "DATE_S12max", "L1_S25_F2041", "L0_S10_F269", "L1_S25_F2317", 
                     "L1_S24_F1356", "S22min_S32min", "L1_S25_F2258", "L1_S24_F877", 
                     "L1_S25_F2915", "L1_S24_F683", "DATE_S23min", "L3_S43_F4065", 
                     "S32min_S10min", "L1_S25_F1953", "L0_S8_F146", "L2_S26_F3125", 
                     "L3_S31_F3846", "L0_S3_F92", "L1_S25_F2091", "L0_S12_F340", "L3_S33_F3863", 
                     "L1_S24_F958", "L1_S24_F733", "L1_S25_F3017", "S22max_S32min", 
                     "L1_S24_F1482", "DATE_S25min", "L1_S24_F1000", "L1_S24_F1366", 
                     "L1_S25_F2322", "L1_S25_F1919")

colnames(test) <- colnames(train)

colnames(extra_var_v4) <- c("Id", "Cluster18", "Cluster21", "Cluster20", "Cluster22", "Cluster14", "Cluster8", "Cluster17", "Cluster7", "Cluster0", "Cluster4", "Cluster5", "Cluster13", "Cluster10", "Cluster23", "Cluster24", "Cluster19", "Cluster16", "Cluster9", "Cluster11", "Cluster15", "Cluster2", "Cluster3", "Cluster12", "Cluster6", "Cluster1")


# Remove duplicates on extra_var_v1
non_dup <- c(37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 
             49, 50, 51, 52, 53, 54, 55, 56, 58, 59, 60, 61, 62, 
             63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 
             76, 77, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 
             90, 91, 92, 93, 94, 95, 96, 97, 98, 100, 101, 102, 
             103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 
             114, 115, 116, 117, 118, 119)
DTcolsample(extra_var_v1, non_dup, remove = FALSE)

# Remove duplicates on extra_var_v1_S34
non_dup <- c(7, 8, 9, 12, 13, 14, 15, 16, 17, 19, 20, 21, 25, 
             26, 27, 28, 29, 31, 33, 35, 37, 39, 40, 41, 43, 45, 
             47, 49, 51, 53, 55, 57, 59, 60, 62, 63, 65, 67, 69, 
             70, 71, 73, 75, 76, 77, 78, 79, 81, 82, 83, 87, 92, 
             93, 95, 97, 98, 99, 101, 103, 105, 106, 107, 109, 
             110, 112, 114, 115)
DTcolsample(extra_var_v1_S34, non_dup, remove = FALSE)

# Remove duplicates on extra_var_v2
non_dup <- c(4, 17, 24, 25, 26, 28, 29, 30, 32, 34, 40, 45)
DTcolsample(extra_var_v2, non_dup, remove = FALSE)

# Remove duplicates on extra_var_v4
non_dup <- 2:26
DTcolsample(extra_var_v4, non_dup, remove = FALSE)

train <- DTcbind(train, extra_var_v1[1:1183747, ], low_mem = FALSE, collect = 20, silent = FALSE)
train <- DTcbind(train, extra_var_v1_S34[1:1183747, ], low_mem = FALSE, collect = 20, silent = FALSE)
train <- DTcbind(train, extra_var_v2[1:1183747, ], low_mem = FALSE, collect = 20, silent = FALSE)
#train <- DTcbind(train, extra_var_v4bis[1:1183747, ], low_mem = FALSE, collect = 20, silent = FALSE)
test <- DTcbind(test, extra_var_v1[1183748:2367495, ], low_mem = FALSE, collect = 20, silent = FALSE)
test <- DTcbind(test, extra_var_v1_S34[1183748:2367495, ], low_mem = FALSE, collect = 20, silent = FALSE)
test <- DTcbind(test, extra_var_v2[1183748:2367495, ], low_mem = FALSE, collect = 20, silent = FALSE)
#test <- DTcbind(test, extra_var_v4bis[1183748:2367495, ], low_mem = FALSE, collect = 20, silent = FALSE)

# train <- DTcbind(train, train_data, low_mem = FALSE, collect = 20, silent = FALSE)
# test <- DTcbind(test, test_data, low_mem = FALSE, collect = 20, silent = FALSE)

rm(extra_var_v1, extra_var_v1_S34, extra_var_v2, extra_var_v4, extra_var_v4bis, dupped_1, dupped_2, dupped_3, dupped_4, dupped_5, non_dup, strange)
gc()

#train <- merge(train, extra_var_v1, by = "Id", all.x = TRUE)

label <- train$Response

train[, Response := NULL]
test[, Response := NULL]

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

folds <- StratifiedCV(label, 5, 11111)


# Real cannon is here

temp_model <- lgbm.cv(y_train = label,
                      x_train = train,
                      x_test = test,
                      data_has_label = TRUE,
                      NA_value = "nan",
                      lgbm_path = my_lgbm_is_at,
                      workingdir = my_script_is_using,
                      files_exist = FALSE,
                      save_binary = FALSE,
                      validation = TRUE,
                      folds = folds,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = 12,
                      application = "binary",
                      learning_rate = 0.05,
                      num_iterations = 50000,
                      early_stopping_rounds = 150,
                      num_leaves = 511,
                      min_data_in_leaf = 100,
                      min_sum_hessian_in_leaf = 10,
                      max_bin = 255,
                      feature_fraction = 1,
                      bagging_fraction = 1,
                      bagging_freq = 0,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)

gc()
# Not exactly identical
summary((temp_model$Testing[[2]][[1]] + temp_model$Testing[[2]][[2]] + temp_model$Testing[[2]][[3]] + temp_model$Testing[[2]][[4]] + temp_model$Testing[[2]][[5]])/5 - temp_model$Testing[[1]])



#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))



mcc_fixed <- function(y_prob, y_true, prob) {
  
  positives <- as.logical(y_true) # label to boolean
  counter <- sum(positives) # get the amount of positive labels
  tp <- as.numeric(sum(y_prob[positives] > prob))
  fp <- as.numeric(sum(y_prob[!positives] > prob))
  tn <- as.numeric(length(y_true) - counter - fp) # avoid computing he opposite
  fn <- as.numeric(counter - tp) # avoid computing the opposite
  mcc <- (tp * tn - fp * fn) / (sqrt((tp + fp) * (tp + fn) * (tn + fp) * (tn + fn)))
  mcc <- ifelse(is.na(mcc), -1, mcc)
  return(mcc)
  
}

mcc_eval_print <- function(y_prob, y_true) {
  y_true <- y_true
  
  DT <- data.table(y_true = y_true, y_prob = y_prob, key = "y_prob")
  
  nump <- sum(y_true)
  numn <- length(y_true) - nump
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
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
  
  DT[, tn_v := as.numeric(cumsum(y_true == 0))]
  DT[, fp_v := cumsum(y_true == 1)]
  DT[, fn_v := numn - tn_v]
  DT[, tp_v := nump - fp_v]
  DT[, tp_v := nump - fp_v]
  DT[, mcc_v := (tp_v * tn_v - fp_v * fn_v) / sqrt((tp_v + fp_v) * (tp_v + fn_v) * (tn_v + fp_v) * (tn_v + fn_v))]
  DT[, mcc_v := ifelse(!is.finite(mcc_v), 0, mcc_v)]
  
  return(DT[['y_prob']][which.max(DT[['mcc_v']])])
  
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


jpeg(filename = file.path(my_script_is_using, "importance_log_small.jpg"), width = 760, height = 894, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 50, no_log = FALSE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()
jpeg(filename = file.path(my_script_is_using, "importance_nonlog_small.jpg"), width = 760, height = 894, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 50, no_log = TRUE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()

jpeg(filename = file.path(my_script_is_using, "importance_log_big.jpg"), width = 760, height = 1788, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 100, no_log = FALSE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()
jpeg(filename = file.path(my_script_is_using, "importance_nonlog_big.jpg"), width = 760, height = 1788, units = "px", pointsize = 12)
lgbm.fi.plot(temp_model, n_best = 100, no_log = TRUE, is.cv = TRUE, multipresence = TRUE, plot = TRUE)
dev.off()


# Know what is inside

sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = FALSE, split = TRUE)

temp_iter <- numeric(5)
best_iter <- 0
for (j in 1:5) {
  temp_iter[j] <- temp_model$Models[[j]]$Best
  best_iter <- best_iter + 0.2 * temp_iter[j]
  cat("Fold ", j, " converged after ", temp_iter[j], " iterations.\n", sep = "")
}
cat("Iterations: ", mean(temp_iter), " + ", sd(temp_iter), "\n\n\n", sep = "")

cat("Cross-validated best features list (top 1-50):\n")
mini_model <- copy(temp_model$FeatureImp)
#mini_model <- mini_model[Freq == 5, ]
dput(mini_model$Feature[1:50])

cat("\n\nCross-validated best features list (top 51-100):\n")
dput(mini_model$Feature[51:100])

cat("\n\nCross-validated best features list (top 101-150):\n")
dput(mini_model$Feature[101:150])

cat("\n\nCross-validated best features list (top 151-200):\n")
dput(mini_model$Feature[151:200])
cat("\nSee the screenshots for more accuracy about the gain\n\n\n")

temp_auc <- numeric(5)
best_auc <- 0
for (j in 1:5) {
  temp_auc[j] <- FastROC(y = label[folds[[j]]], x = temp_model$Validation[folds[[j]]])
  best_auc <- best_auc + 0.2 * temp_auc[j]
  cat("Fold ", j, ": AUC=", temp_auc[j], "\n", sep = "")
}
cat("AUC: ", mean(temp_auc), " + ", sd(temp_auc), "\n", sep = "")
cat("Average AUC using all data: ", FastROC(y = label, x = temp_model$Validation), "\n\n\n", sep = "")

temp_mcc <- numeric(5)
temp_thresh <- numeric(5)
best_mcc <- 0
for (j in 1:5) {
  
  temp_mcc[j] <- mcc_eval_print(y_prob = temp_model$Validation[folds[[j]]], y_true = label[folds[[j]]])
  temp_thresh[j] <- mcc_eval_pred(y_prob = temp_model$Validation[folds[[j]]], y_true = label[folds[[j]]])
  best_mcc <- best_mcc + 0.2 * temp_mcc[j]
  cat("Fold ", j, ": MCC=", temp_mcc[j], ", threshold=", temp_thresh[j], "\n", sep = "")
  
}
cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
cat("Average MCC on all data (5 fold): ", mcc_fixed(y_prob = temp_model$Validation, y_true = label, prob = mean(temp_mcc)), ", threshold=", mean(temp_mcc), "\n", sep = "")
cat("Average MCC using all data: ", mcc_eval_print(y_prob = temp_model$Validation, y_true = label), ", threshold=", mcc_eval_pred(y_prob = temp_model$Validation, y_true = label), "\n\n\n", sep = "")

best_mcc1 <- mcc_eval_pred(y_prob = temp_model$Validation, y_true = label)
submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ov$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc1)
best_count1 <- sum(submission0_ov$Response == 1)
cat("Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)

best_mcc2 <- best_mcc
submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc2)
best_count2 <- sum(submission0$Response == 1)
cat("Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
write.csv(submission0, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc2), "_", best_count2, ".csv", sep = "")), row.names = FALSE)

best_mcc3 <- (best_mcc1 + best_mcc2) / 2
submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ex$Response <- as.numeric(temp_model$Testing[[1]] > best_mcc3)
best_count3 <- sum(submission0_ex$Response == 1)
cat("Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
write.csv(submission0_ex, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc3), "_", best_count3, ".csv", sep = "")), row.names = FALSE)

sink()

write.csv(temp_model$Validation, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY.csv"), row.names = FALSE)
write.csv(temp_model$Testing[[1]], file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY.csv"), row.names = FALSE)





best_model <- lgbm.train(y_train = label,
                         x_train = train,
                         x_test = test,
                         data_has_label = TRUE,
                         NA_value = "nan",
                         lgbm_path = my_lgbm_is_at,
                         workingdir = my_script_is_using,
                         files_exist = FALSE,
                         save_binary = FALSE,
                         predictions = TRUE,
                         importance = TRUE,
                         full_quiet = FALSE,
                         verbose = TRUE,
                         num_threads = 12,
                         application = "binary",
                         learning_rate = 0.05,
                         num_iterations = floor(best_iter * 1.2),
                         num_leaves = 511,
                         min_data_in_leaf = 100,
                         min_sum_hessian_in_leaf = 10,
                         max_bin = 255,
                         feature_fraction = 1,
                         bagging_fraction = 1,
                         bagging_freq = 0,
                         is_unbalance = FALSE,
                         metric = "auc",
                         is_training_metric = TRUE)

saveRDS(best_model, file.path(my_script_is_using, "aaa_LightGBM_full.rds"), compress = TRUE)



sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = TRUE, split = TRUE)

best_mcc1_all <- best_mcc1
submission0_ov_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ov_all$Response <- as.numeric(best_model$Testing > best_mcc1_all)
best_count1_all <- sum(submission0_ov_all$Response == 1)
cat("Submission with all data overfitted threshold on all MCC positives: ", best_count1_all, ". Threshold=", best_mcc1_all, "\n\n", sep = "")
write.csv(submission0_ov_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc1_all), "_", best_count1_all, ".csv", sep = "")), row.names = FALSE)

best_mcc2_all <- best_mcc2
submission0_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_all$Response <- as.numeric(best_model$Testing > best_mcc2_all)
best_count2_all <- sum(submission0_all$Response == 1)
cat("Submission with all data average validated threshold on all MCC positives: ", best_count2_all, ". Threshold=", best_mcc2_all, "\n\n", sep = "")
write.csv(submission0_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc2_all), "_", best_count2_all, ".csv", sep = "")), row.names = FALSE)

best_mcc3_all <- best_mcc3
submission0_ex_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ex_all$Response <- as.numeric(best_model$Testing > best_mcc3_all)
best_count3_all <- sum(submission0_ex_all$Response == 1)
cat("Submission with all data average of overfit+validated threshold positives: ", best_count3_all, ". Threshold=", best_mcc3_all, "\n\n", sep = "")
write.csv(submission0_ex_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc3_all), "_", best_count3_all, ".csv", sep = "")), row.names = FALSE)



mini_preds <- best_model$Testing
mini_preds <- mini_preds[order(mini_preds, decreasing = TRUE)]

best_mcc1_all_val <- mini_preds[best_count1 + 1]
submission0_ov_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ov_all_val$Response <- as.numeric(best_model$Testing > best_mcc1_all_val)
best_count1_all_val <- sum(submission0_ov_all_val$Response == 1)
cat("Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: ", best_count1_all_val, ". Threshold=", best_mcc1_all_val, "\n\n", sep = "")
write.csv(submission0_ov_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc1_all_val), "_", best_count1_all_val, ".csv", sep = "")), row.names = FALSE)

best_mcc2_all_val <- mini_preds[best_count2 + 1]
submission0_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_all_val$Response <- as.numeric(best_model$Testing > best_mcc2_all_val)
best_count2_all_val <- sum(submission0_all_val$Response == 1)
cat("Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: ", best_count2_all_val, ". Threshold=", best_mcc2_all_val, "\n\n", sep = "")
write.csv(submission0_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc2_all_val), "_", best_count2_all_val, ".csv", sep = "")), row.names = FALSE)

best_mcc3_all_val <- mini_preds[best_count3 + 1]
submission0_ex_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
submission0_ex_all_val$Response <- as.numeric(best_model$Testing > best_mcc3_all_val)
best_count3_all_val <- sum(submission0_ex_all_val$Response == 1)
cat("Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: ", best_count3_all_val, ". Threshold=", best_mcc3_all_val, "\n\n", sep = "")
write.csv(submission0_ex_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc3_all_val), "_", best_count3_all_val, ".csv", sep = "")), row.names = FALSE)

sink()
