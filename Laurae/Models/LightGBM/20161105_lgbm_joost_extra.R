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

my_script_is_using <- "E:/Laurae/20161105_lgbm_joost_extra"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
leaves <- 255
eta <- 0.01
min_sample <- 100
min_hess <- 10
subsample <- 1.0
colsample <- 1.0
sampling_freq <- ifelse(subsample == 1, 0, 1)


# Load from RDS

train <- readRDS("Laurae/jayjay_clean/train.rds")
test <- readRDS("Laurae/jayjay_clean/test.rds")
label <- readRDS("datasets/labels.rds")

train_numeric <- data.table(Id = train[, Id])
test_numeric <- data.table(Id = test[, Id])
train[, Id := NULL]
test[, Id := NULL]
gc()

to_keep <- which(colnames(train) %in% c("sameL0_Number1", "sameL1_Number1", "CATEGORICAL_Last_____1", 
                                        "GF1", "sameL3_Number1", "GF0", "sameL3", "BAC60_Sum_S3", "FOR60_Sum_S3", 
                                        "L1_S24_F1723", "DATE_S33max", "DATE_L3kurt", "FOR30_Sum_S", 
                                        "BAC30_Sum_S", "BAC100_Sum", "FOR100_Sum", "Kurtosis", "FOR165_log_lag", 
                                        "FOR100_log_lag_L3", "L1_S24_F1632", "BAC100_log_lag_L3", "L3_S33_F3857", 
                                        "FOR165_Sum", "L0max_L3max", "L0_Max", "L3_S30_F3754", "BAC100_log_lag", 
                                        "Range", "L3_S33_F3859", "FOR165_log_lag_L3", "L3max_L0min", 
                                        "L3_S30_F3744", "DATE_S32max", "S33max_S29min", "L3_L3_Unique_Count", 
                                        "L1_S24_F1844", "FOR100_log_lag", "L3_S30_F3759", "BAC165_log_lag", 
                                        "L3_S33_F3865", "BAC165_Sum", "BAC165_log_lag_L3", "L3_S30_F3749", 
                                        "CATEGORICAL_Last_____2", "Response_Minus1", "L3_S30_F3774", 
                                        "L3_S29_F3351", "L3_S30_F3809", "DATE_S34max", "L3_S30_F3804", 
                                        "L3_S30_F3704", "L3_S29_F3348", "L3_S29_F3345", "L3_S29_F3321", 
                                        "L3_S29_F3373", "L0_S1_F28", "L3_S29_F3324", "L3_S30_F3769", 
                                        "L3_S30_F3554", "L3_S29_F3427", "L0_S0_F20_Mult_L0_S0_F20", "L0_Mean", 
                                        "L3_S30_F3829", "L3_S30_F3494", "L3_S29_F3342", "L3_S29_F3354", 
                                        "S33min_S30min", "L1_S24_F1846", "sameL0", "L3_S36_F3920", "L3_S29_F3379", 
                                        "L0_Min", "Response_Minus1_Number1", "L3_S29_F3339", "L3_S29_F3315", 
                                        "L3_S29_F3333", "L3_S29_F3479", "L3_S29_F3327", "BAC60_log_lag_S34", 
                                        "L3_S30_F3609", "FOR60_log_lag_S34", "L3_S30_F3574", "L3_S30_F3794", 
                                        "L0_S1_F24", "L3_S30_F3534", "L3_S30_F3544", "L0_S9_F180", "L3_S29_F3336", 
                                        "L3_S29_F3382", "L3_S30_F3604", "L0_S0_F20", "L3_S29_F3376", 
                                        "L3_S30_F3784", "DATE_S35max", "L3_S29_F3330", "L0_S0_F18", "FOR165_log_lag_L2", 
                                        "L3_Max", "L2_Min", "L3_S30_F3514", "L3_S30_F3524", "L3_S30_F3819", 
                                        "L0_S0_F0", "L3_S30_F3519", "L0_S0_F16", "L3_S29_F3407", "BAC165_log_lag_L2", 
                                        "BAC165_log_lag_L1", "DATE_S30max", "L2max_S37max", "L3_S29_F3433", 
                                        "DATE_S37max", "L3_S29_F3318", "DATE_S36max", "L3_S30_F3639", 
                                        "L0_S4_F104", "L3_S30_F3709", "FOR30_log_lag_S34", "BAC165_log_lag_L0", 
                                        "L3_S30_F3764", "L3_S30_F3504", "BAC60_log_lag_S33", "L3_S30_F3629", 
                                        "L3_S30_F3509", "L3_S30_F3624", "L0_S10_F244", "L0_S0_F2", "L3_S29_F3473", 
                                        "L3max_S30max", "BAC165_LAG2_Missing_Value_Count_ResponseMinus1", 
                                        "BAC100_log_lag_L1", "L3_Range", "L0_S2_F36", "FOR165_log_lag_L1", 
                                        "L3_S29_F3436", "L0_S3_F100", "L3_S30_F3799", "L3_S29_F3430", 
                                        "BAC30_log_lag_S30", "L0_S5_F114", "S29min_S37min", "FOR165_log_lag_L0", 
                                        "L3_Min", "BAC100_LAG_Missing_Value_Count_ResponseMinus1", "CATEGORICAL_Unique_Count", 
                                        "L3_S30_F3579", "BAC30_log_lag_S33", "Min", "FOR165_LAG_Missing_Value_Count_ResponseMinus1", 
                                        "FOR60_log_lag_S33", "FOR165_LAG_Count_Mult_ResponseMinus1", 
                                        "L3_S29_F3461", "FOR165_LAG3_Count_Mult_ResponseMinus1", "S30min_S37min", 
                                        "FOR165_LAG3_Missing_Value_Count_ResponseMinus1", "L0_S11_F322", 
                                        "FOR100_LAG_Missing_Value_Count_ResponseMinus1", "FOR165_LAG1_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S6_F132", "L0_S2_F44", "FOR100_LAG_Count_Mult_ResponseMinus1", 
                                        "BAC100_LAG3_Missing_Value_Count_ResponseMinus1", "BAC165_LAG_Missing_Value_Count_ResponseMinus1", 
                                        "CATEGORICAL_out_out_L3_S32_F3854_class2", "FOR60_log_lag_S30", 
                                        "BAC165_LAG2_Count_Mult_ResponseMinus1", "L0_S11_F310", "BAC165_LAG_Count_Mult_ResponseMinus1", 
                                        "BAC100_LAG_Count_Mult_ResponseMinus1", "L3_S30_F3669", "L0_S7_F138", 
                                        "BAC30_log_lag_S34", "L0_S2_F60", "L0_S5_F116", "FOR100_LAG2_Missing_Value_Count_ResponseMinus1", 
                                        "Mean", "FOR165_LAG2_Count_Mult_ResponseMinus1", "FOR165_LAG1_Count_Mult_ResponseMinus1", 
                                        "L3_S29_F3357", "FOR100_LAG3_Missing_Value_Count_ResponseMinus1", 
                                        "FOR165_LAG2_Missing_Value_Count_ResponseMinus1", "DATE_S6_max", 
                                        "FOR100_LAG0_Missing_Value_Count_ResponseMinus1", "FOR100_LAG2_Count_Mult_ResponseMinus1", 
                                        "FOR100_LAG1_Missing_Value_Count_ResponseMinus1", "BAC165_LAG0_Missing_Value_Count_ResponseMinus1", 
                                        "L0_Range", "FOR165_LAG0_Missing_Value_Count_ResponseMinus1", 
                                        "FOR100_log_lag_L2", "BAC165_LAG1_Missing_Value_Count_ResponseMinus1", 
                                        "L3_S35_F3896", "BAC165_LAG1_Count_Mult_ResponseMinus1", "L0_S2_F64", 
                                        "L0_S3_F72", "CATEGORICAL_Missing_Value_Count", "Unique_Count", 
                                        "L0_S0_F8", "DATE_S0_max", "L0_S3_F96", "L0_S4_F109", "L3_S30_F3589", 
                                        "L1_Min", "BAC100_log_lag_L2", "BAC165_LAG3_Missing_Value_Count_ResponseMinus1", 
                                        "BAC100_LAG2_Missing_Value_Count_ResponseMinus1", "DATE_L1kurt", 
                                        "FOR100_LAG3_Count_Mult_ResponseMinus1", "L3_S30_F3684", "L3_S35_F3889", 
                                        "L2_S26_F3106", "FOR100_log_lag_L1", "S36max_S29min", "FOR165_LAG0_Count_Mult_ResponseMinus1", 
                                        "DATE_S5_max", "BAC100_LAG1_Missing_Value_Count_ResponseMinus1", 
                                        "BAC100_LAG0_Count_Mult_ResponseMinus1", "L3_S29_F3476", "L3_S30_F3644", 
                                        "BAC100_LAG3_Count_Mult_ResponseMinus1", "L0_S6_F122", "BAC100_LAG0_Missing_Value_Count_ResponseMinus1", 
                                        "BAC165_LAG0_Count_Mult_ResponseMinus1", "BAC165_LAG3_Count_Mult_ResponseMinus1", 
                                        "L0_S3_F80", "L2_S26_F3062", "L0_S10_F254", "DATE_S7_max", "L0_S0_F6", 
                                        "FOR30_log_lag_S30", "L0_S0_F4", "FOR30_log_lag_S33", "L0_S7_F142", 
                                        "L0_S11_F326", "FOR100_LAG1_Count_Mult_ResponseMinus1", "L0_S0_F22", 
                                        "S33min_S37min", "S29min_S34min", "BAC100_LAG2_Count_Mult_ResponseMinus1", 
                                        "BAC100_log_lag_L0", "BAC60_log_lag_S30", "BAC100_LAG1_Count_Mult_ResponseMinus1", 
                                        "L0_S11_F302", "L3_S30_F3569", "L0_S10_F259", "L3_S30_F3674", 
                                        "DATE_S24max", "FOR100_log_lag_L0", "L1_Max", "L0_S21_F497", 
                                        "DATE_S3_max", "FOR100_LAG0_Count_Mult_ResponseMinus1", "L0_S9_F170", 
                                        "L0_S0_F10", "DATE_S29max", "L0_S9_F165", "L0_S9_F185", "L2_S26_F3069", 
                                        "DATE_S2_max", "L0_S0_F14", "L0_S9_F155", "S29min_S32min", "L2_S27_F3129", 
                                        "DATE_S4_max", "L0_S13_F354", "L1_S24_F1578", "L3_S30_F3689", 
                                        "L3_S30_F3584", "L3_S30_F3564", "L3_S30_F3664", "DATE_S38max", 
                                        "L1_Range", "S37min_S34min", "L3max_S34min", "L0_S9_F160", "L0_S10_F229", 
                                        "L0_S9_F190", "L0_S11_F294", "L0_S11_F290", "L0_S12_F332", "L0_S10_F224", 
                                        "L0_S11_F286", "DATE_S8_max", "S29max_S35max", "L0_S11_F318", 
                                        "L3_S30_F3634", "sameL2", "L1_S24_F1850", "L0_S12_F348", "L2_S26_F3117", 
                                        "L0_S11_F306", "L0_S10_F249", "L0_S13_F356", "L0_S23_F643", "DATE_S24min", 
                                        "L0_S10_F219", "S30min_S35min", "L0_S9_F195", "L2_S27_F3210", 
                                        "L1_S24_F1516", "L3_S30_F3679", "L0_S12_F350", "S13min_S33min", 
                                        "L0_S11_F282", "L0_S12_F330", "L0_S0_F12", "L2_S26_F3036", "DATE_S10max", 
                                        "L0_S11_F314", "L0_Unique_Count", "L3_S29_F3360", "L3_Unique_Count", 
                                        "L0_S12_F346", "L3_S32_F3850", "L0_S8_F144", "L3max_S26max", 
                                        "DATE_S26max", "DATE_S1_max", "L0_S11_F314_Mult_L0_S0_F20", "L3_S35_F3894", 
                                        "L0_S18_F439", "L2_S26_F3073", "L0_S23_F667", "L2_S26_F3113", 
                                        "L2_S26_F3040", "S35min_L1min", "L0_S10_F234", "L0_S11_F314_Mult_L0_S11_F314", 
                                        "L2_S26_F3121", "L1_S24_F1758", "L2_S27_F3162", "sameL1", "L0_S3_F84", 
                                        "S33min_S36min", "L1_S24_F1667", "DATE_S18max", "L2_S27_F3199", 
                                        "L3_S33_F3855", "L1_S24_F1494", "DATE_S16max", "L2_S26_F3047", 
                                        "L0_S2_F48", "L2_Max", "L3_S38_F3960", "DATE_S13max", "L2_S27_F3133", 
                                        "L0_S9_F200", "L3_L3_Missing_Value_Count", "L2_S27_F3155", "DATE_S11max", 
                                        "DATE_S9_max", "L3_S41_F4008", "L0_S10_F239", "S33min_S35min", 
                                        "L0_S23_F639", "L0_S17_F433", "S26max_S32max", "L0_S16_F426", 
                                        "L0_S10_F264", "L2_S27_F3214", "L1_S24_F1672", "S34min_S35min", 
                                        "L0_S14_F386", "L0_S21_F532", "L2_S27_F3206", "L1_S24_F1831", 
                                        "L0_S14_F370", "L2_S26_F3051", "L1_S24_F1514", "L1_S24_F1463", 
                                        "L1_S24_F1773", "L3_S41_F4011", "DATE_S14max", "L3_S36_F3918", 
                                        "L1_S24_F1581", "DATE_S27max", "L1_S24_F1662", "FOR165_LAG3_Sum_ResponseMinus1", 
                                        "DATE_S19max", "L0_S14_F362", "L0_S14_F390", "L0_S22_F576", "L0_S15_F415", 
                                        "CATEGORICAL_Max______3", "L1_S24_F1520", "L0_S23_F671", "L0_S19_F455", 
                                        "L1_S24_F1783", "L2_S27_F3144", "L1_S24_F1842", "L1_S24_F1788", 
                                        "L0_S22_F606", "L0_S21_F482", "L1_S24_F1544", "L0_S22_F591", 
                                        "L0_S9_F210", "S26min_S24min", "L3_S29_F3482", "L1_S24_F1565", 
                                        "S27min_S32min", "L1_S24_F1518", "L0_S16_F421", "L1_S25_F2161", 
                                        "L0_S15_F418", "L0_S12_F336", "L0_S22_F571", "L3_S48_F4198", 
                                        "L0_S12_F344", "DATE_S22max", "L1_S25_F2116", "DATE_S15max", 
                                        "L1_S24_F1824", "L0_S12_F342", "L0_S12_F334", "L2_S27_F3140", 
                                        "L3_S47_F4163", "DATE_S17max", "L0_S21_F502", "L0_S15_F403", 
                                        "S33min_S34min", "L2_S27_F3166", "L1_S24_F1637", "L1_S24_F1763", 
                                        "L0_S10_F274", "L3_S45_F4124", "L1_S24_F1700", "L0_S19_F459", 
                                        "L0_S14_F374", "L1_S24_F1573", "L0_S21_F492", "L3_S41_F4004", 
                                        "L1_S24_F1778", "L0_S15_F397", "L0_S21_F522", "L0_S12_F338", 
                                        "L3_S41_F4026", "S26min_S37min", "L0_S17_F431", "L0_S15_F406", 
                                        "L0_S18_F449", "L0_S23_F619", "DATE_S21max", "L1_S24_F1575", 
                                        "L1_S24_F1685", "L3_S47_F4153", "L1_S24_F1498", "L0_S23_F659", 
                                        "L0_S12_F352", "L0_S9_F175", "DATE_S23max", "L0_S23_F651", "L1_S24_F1571", 
                                        "L0_S2_F56", "L1_S24_F1652", "L1_S24_F1848", "L0_S22_F556", "L1_S25_F1958", 
                                        "L0_S21_F507", "L0_S2_F32", "DATE_S20max", "L0_S12_F340", "L3_S41_F4020", 
                                        "L1_Unique_Count", "L0_S3_F76", "L0_S23_F655", "L0_S21_F487", 
                                        "L1_S25_F2176", "L1_L1_Missing_Value_Count", "L0_S21_F517", "L0_S22_F586", 
                                        "L1_S24_F1829", "L1_S24_F1567", "DATE_S25max", "L3_S48_F4196", 
                                        "L0_S21_F477", "L1_S24_F1798", "L0_S23_F631", "L0_S22_F601", 
                                        "L3_S41_F4006", "L3_S43_F4090", "L0_S21_F472", "L0_S23_F623", 
                                        "L1_S24_F1599", "L0_S3_F68", "L3_S41_F4014", "L3_S40_F3986", 
                                        "L1_S25_F2136", "L3_S40_F3984", "L0_S21_F527", "L1_S24_F1808", 
                                        "L3_S47_F4158", "L1_S24_F1539", "L0_S21_F537", "L0_S22_F551", 
                                        "BAC100_LAG3_Sum_ResponseMinus1", "DATE_S12max", "L1_S24_F1728", 
                                        "L1_S25_F2158", "L1_S24_F1738", "L3_S38_F3956", "L1_S24_F1512", 
                                        "L0_S21_F512", "L0_S23_F663", "DATE_S44max", "BAC100_LAG_Sum_ResponseMinus1", 
                                        "L1_S24_F1753", "L3_S47_F4138", "L3_S40_F3982", "L1_S24_F1609", 
                                        "BAC165_LAG3_Sum_ResponseMinus1", "L0_S15_F400", "DATE_S40max", 
                                        "L0_S22_F596", "L1_S24_F1713", "DATE_S25min", "L0_S20_F461", 
                                        "DATE_S48max", "L3_S44_F4115", "L1_S24_F1122", "L1_S24_F1814", 
                                        "L0_S7_F136", "L0_S6_F118", "L1_S24_F1822", "L1_S24_F1803", "L1_S25_F2101", 
                                        "BAC100_LAG1_Sum_ResponseMinus1", "FOR165_LAG0_Sum_ResponseMinus1", 
                                        "L3_S41_F4000", "L1_S24_F829", "L3_S49_F4211", "L3_S44_F4112", 
                                        "L1_S24_F1816", "L3_S47_F4143", "FOR100_LAG2_Sum_ResponseMinus1", 
                                        "L1_S24_F1743", "CATEGORICAL_out_L3_S32_F3854_class1", "FOR100_LAG_Sum_ResponseMinus1", 
                                        "S32max_S37min", "L0_S2_F40", "L0_S23_F627", "FOR165_LAG_Sum_ResponseMinus1", 
                                        "L1_S24_F1647", "BAC165_LAG1_Sum_ResponseMinus1", "L1_S24_F1812", 
                                        "L1_S24_F1627", "L0_S3_F92", "L1_S24_F1718", "L0_S22_F546", "BAC165_LAG_Sum_ResponseMinus1", 
                                        "L3_S41_F4016", "L1_S25_F2106", "L1_S24_F1748", "L1_S25_F1973", 
                                        "FOR100_LAG3_Sum_ResponseMinus1", "L1_S25_F1938", "L3_S30_F3649", 
                                        "L3_S36_F3938", "L1_S25_F2131", "L1_S25_F2111", "L1_S24_F1733", 
                                        "L0_S14_F366", "L1_S25_F2147", "DATE_S41max", "L1_S25_F2126", 
                                        "L1_S25_F1892", "L1_S25_F2170", "L1_S24_F1622", "L2_L2_Unique_Count", 
                                        "L1_S25_F1855", "L1_S24_F1690", "L3_S41_F4023", "sameL2_Number1", 
                                        "L1_S24_F983", "DATE_S47max", "FOR100_LAG1_Sum_ResponseMinus1", 
                                        "L1_S24_F1490", "DATE_S45min", "DATE_S50max", "L3_S43_F4085", 
                                        "L1_S25_F2056", "L3_S38_F3952", "L1_S25_F1869", "L3_S43_F4080", 
                                        "DATE_S39max", "BAC165_LAG2_Sum_ResponseMinus1", "L1_S24_F1506", 
                                        "L1_S25_F1968", "DATE_S43max", "L3_S44_F4118", "L1_S25_F2091", 
                                        "L1_S25_F1900", "L1_S24_F1642", "L1_S25_F2155", "S32min_S10min", 
                                        "L3_S40_F3980", "L1_S25_F2051", "S32min_S30min", "L1_S24_F948", 
                                        "L1_S25_F1992", "L1_S24_F1818", "S32max_S25min", "DATE_S28max", 
                                        "L0_S10_F269", "L1_S24_F1838", "BAC165_LAG0_Sum_ResponseMinus1", 
                                        "L3_S29_F3488", "L1_S25_F1909", "BAC100_LAG0_Sum_ResponseMinus1", 
                                        "DATE_S51max", "L1_S24_F1836", "BAC100_LAG2_Sum_ResponseMinus1", 
                                        "Max", "FOR100_LAG0_Sum_ResponseMinus1", "L1_S24_F1820", "FOR165_LAG2_Sum_ResponseMinus1", 
                                        "L1_S25_F2173", "L1_S24_F1768", "L1_S25_F2016", "L3_S50_F4243", 
                                        "L2_S26_F3125", "L1_S25_F2061", "L1_S24_F1166", "L1_S25_F2797", 
                                        "L1_S24_F810", "L1_S25_F1858", "L1_S25_F2167", "L1_S25_F2152", 
                                        "L1_S24_F1657", "L1_S24_F1793", "L1_S24_F1041", "L1_S24_F1594", 
                                        "L3_S43_F4095", "L1_S25_F2144", "L1_S24_F1834", "L3_S44_F4121", 
                                        "L1_S25_F1978", "DATE_S49max", "FOR165_LAG1_Sum_ResponseMinus1", 
                                        "L1_S24_F1202", "L0_S22_F611", "L1_S24_F1006", "S25max_S32min", 
                                        "L1_S24_F1180", "L1_S25_F1919", "L1_S24_F988", "L1_S24_F1336", 
                                        "L1_S24_F1391", "L1_S24_F1240", "L0_S9_F205", "L1_S24_F1810", 
                                        "L1_S25_F2071", "L1_S25_F2164", "L1_S25_F2086", "L1_S24_F958", 
                                        "L1_S24_F733", "DATE_S31max", "L1_S24_F1056", "L1_S25_F1953", 
                                        "L3_S30_F3499", "L3_S47_F4148", "L1_S25_F2031", "L1_S24_F814", 
                                        "L0_S22_F561", "L1_S24_F1366", "L1_S24_F963", "CATEGORICAL_Max______1", 
                                        "L1_S24_F1002", "L3_S31_F3842", "L1_S24_F1303", "L2_S28_F3307", 
                                        "L2_S26_F3077", "L1_S24_F1356", "L3_S34_F3882", "L3_S30_F3734", 
                                        "L1_S24_F683", "L1_S24_F1482", "L1_S24_F1000", "L1_S24_F1197", 
                                        "L1_S25_F1877", "L1_S24_F1245", "L1_S24_F1321", "L1_S24_F1331", 
                                        "L1_S24_F1172", "L1_S25_F2041", "L1_S24_F700", "L1_S25_F2007", 
                                        "L2_S28_F3248", "L1_S24_F1293", "L1_S25_F1963", "L1_S24_F691", 
                                        "L1_S25_F2837", "L1_S25_F2081", "L3_S37_F3950"))

train <- DTcolsample(train, to_keep)
test <- DTcolsample(test, to_keep)
gc()

# Load extra data
train_numeric <- readRDS("Laurae/20161031_xgb_stationlearner/xgb_train.rds")
test_numeric <- readRDS("Laurae/20161031_xgb_stationlearner/xgb_test.rds")

train_numeric[, Id := NULL]
test_numeric[, Id := NULL]

train <- DTcbind(train, train_numeric, low_mem = TRUE, collect = 50, silent = FALSE)
test <- DTcbind(test, test_numeric, low_mem = TRUE, collect = 50, silent = FALSE)
rm(train_numeric, test_numeric)
gc()


# Feature Set
destination_joost <- fread("Joost/feat_set_destination_station_S32.csv")
ids <- data.table(ID = destination_joost$ID)
destination_joost[, ID := NULL]
destination_joost[, "S32_dest_-1.0" := NULL]
date_joost <- fread("Joost/feat_set_date_all_compressed.csv")
date_joost <- DTcolsample(date_joost, kept = c(14, 15, 16, 20))
destination_joost <- DTcbind(destination_joost, date_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(date_joost)
gc()
destination_joost$tdeltadevrel_block1a[(!is.finite(destination_joost$tdeltadevrel_block1a) & !is.na(destination_joost$tdeltadevrel_block1a))] <- 65535 # Max = 7760
DTfillNA(destination_joost, value = -1, low_mem = TRUE, collect = 1, silent = FALSE)
#destination_joost <- destination_joost + 1


train_joost <- destination_joost[1:1183747, ]
test_joost <- destination_joost[1183748:2367495, ]
rm(destination_joost)
gc()

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(train_joost, test_joost)
gc()


# Feature Set
jayjay_joost <- fread("Joost/feat_set_jayjay_same_L_new.csv")
jayjay_joost <- merge(ids, jayjay_joost, by = "ID", all.x = TRUE, sort = FALSE)
jayjay_joost[, ID := NULL]


train_joost <- jayjay_joost[1:1183747, ]
test_joost <- jayjay_joost[1183748:2367495, ]

train[, c("sameL0_Number1", "sameL1_Number1", "sameL3_Number1", "sameL3", "sameL0", "sameL2", "sameL1", "sameL2_Number1") := NULL]
test[, c("sameL0_Number1", "sameL1_Number1", "sameL3_Number1", "sameL3", "sameL0", "sameL2", "sameL1", "sameL2_Number1") := NULL]

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(train_joost, test_joost, jayjay_joost)
gc()


# Feature Set
delay_joost <- fread("Joost/feat_set_date_station.csv")
delay_joost <- DTcolsample(delay_joost, 130:257, remove = FALSE)
DTfillNA(delay_joost, value = -1, low_mem = TRUE, collect = 32, silent = FALSE)
#delay_joost <- delay_joost + 1

train_joost <- delay_joost[1:1183747, ]
test_joost <- delay_joost[1183748:2367495, ]

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 32, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 32, silent = FALSE)
rm(train_joost, test_joost, delay_joost)
gc()


# Feature Set
rel_date_joost <- fread("Joost/feat_set_date_station_rel_n50.csv")
rel_date_joost[, ID := NULL]
DTfillNA(rel_date_joost, value = -1, low_mem = TRUE, collect = 32, silent = FALSE)
rel_date_joost[, "d_rel_d_0.0" := NULL] # only NAs
#rel_date_joost <- rel_date_joost + 1

train_joost <- rel_date_joost[1:1183747, ]
test_joost <- rel_date_joost[1183748:2367495, ]

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 32, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 32, silent = FALSE)
rm(train_joost, test_joost, rel_date_joost)
gc()


# Feature Set
fixed_jayjay <- fread("Joost/feat_set_gf0_gf1_OHE.csv")
fixed_jayjay <- merge(ids, fixed_jayjay, by = "ID", all.x = TRUE, sort = FALSE)
fixed_jayjay[, ID := NULL]

train_joost <- fixed_jayjay[1:1183747, ]
test_joost <- fixed_jayjay[1183748:2367495, ]

train[, GF0 := 0]
train[, GF1 := 0]
test[, GF0 := 0]
test[, GF1 := 0]
train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(train_joost, test_joost, fixed_jayjay)
gc()


# Feature Set
joost_fix_jayjay <- fread("Joost/feat_set_V2_same_L_new_0.csv")
joost_fix_jayjay <- merge(ids, joost_fix_jayjay, by = "ID", all.x = TRUE, sort = FALSE)
joost_fix_jayjay[, ID := NULL]

train_joost <- joost_fix_jayjay[1:1183747, ]
test_joost <- joost_fix_jayjay[1183748:2367495, ]

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(train_joost, test_joost, joost_fix_jayjay)


# Feature Set
combo_joost1 <- fread("Joost/feat_set_comb_station_S24.311.csv")
combo_joost2 <- fread("Joost/feat_set_comb_station_S27.0.csv")
combo_joost3 <- fread("Joost/feat_set_comb_station_S29.0.csv")
combo_joost4 <- fread("Joost/feat_set_comb_station_S30.0.csv")
combo_joost5 <- fread("Joost/feat_set_comb_station_S32.0.csv")
combo_joost6 <- fread("Joost/feat_set_comb_station_S34.0.csv")
combo_joost7 <- fread("Joost/feat_set_comb_station_S35.0.csv")
combo_joost8 <- fread("Joost/feat_set_comb_station_S36.0.csv")
combo_joost9 <- fread("Joost/feat_set_comb_station_S37.0.csv")
combo_joost1[, ID := NULL]
combo_joost2[, ID := NULL]
combo_joost3[, ID := NULL]
combo_joost4[, ID := NULL]
combo_joost5[, ID := NULL]
combo_joost6[, ID := NULL]
combo_joost7[, ID := NULL]
combo_joost8[, ID := NULL]
combo_joost9[, ID := NULL]
combo_joost <- cbind(combo_joost1, combo_joost2, combo_joost3, combo_joost4, combo_joost5, combo_joost6, combo_joost7, combo_joost8, combo_joost9)
rm(combo_joost1, combo_joost2, combo_joost3, combo_joost4, combo_joost5, combo_joost6, combo_joost7, combo_joost8, combo_joost9)

train_joost <- combo_joost[1:1183747, ]
test_joost <- combo_joost[1183748:2367495, ]

train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
rm(train_joost, test_joost, combo_joost)


# # Feature Set
# tmax_joost <- fread("Joost/feat_set_cluster_tmax_loo.csv")
# tmax_joost[, ID := NULL]
# colnames(tmax_joost) <- paste("tmax_", colnames(tmax_joost), sep = "")
# 
# train_joost <- tmax_joost[1:1183747, ]
# test_joost <- tmax_joost[1183748:2367495, ]
# 
# train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# rm(train_joost, test_joost, tmax_joost)
# 
# 
# # Feature Set
# upath_joost <- fread("Joost/feat_set_cluster_upath_loo.csv")
# upath_joost[, ID := NULL]
# colnames(upath_joost) <- paste("upathmax_", colnames(upath_joost), sep = "")
# 
# train_joost <- upath_joost[1:1183747, ]
# test_joost <- upath_joost[1183748:2367495, ]
# 
# train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# rm(train_joost, test_joost, upath_joost)
# 
# 
# # Feature Set
# n500_joost <- fread("Joost/feat_set_cluster_n500_loo.csv")
# n500_joost[, ID := NULL]
# colnames(n500_joost) <- paste("upathmax_", colnames(n500_joost), sep = "")
# 
# train_joost <- n500_joost[1:1183747, ]
# test_joost <- n500_joost[1183748:2367495, ]
# 
# train <- DTcbind(train, train_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# test <- DTcbind(test, test_joost, low_mem = TRUE, collect = 1, silent = FALSE)
# rm(train_joost, test_joost, n500_joost)



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


temp_data <- lgbm.cv.prep(y_train = label,
                          x_train = train,
                          x_test = test,
                          data_has_label = TRUE,
                          NA_value = "nan",
                          workingdir = my_script_is_using,
                          folds = folds)

temp_model <- lgbm.cv(y_train = label,
                      x_train = train,
                      x_test = test,
                      data_has_label = TRUE,
                      NA_value = "nan",
                      lgbm_path = my_lgbm_is_at,
                      workingdir = my_script_is_using,
                      files_exist = TRUE,
                      save_binary = FALSE,
                      validation = TRUE,
                      folds = folds,
                      predictions = TRUE,
                      importance = TRUE,
                      full_quiet = FALSE,
                      verbose = FALSE,
                      num_threads = threads,
                      application = "binary",
                      learning_rate = eta,
                      num_iterations = 2500,
                      early_stopping_rounds = 500,
                      num_leaves = leaves,
                      min_data_in_leaf = min_sample,
                      min_sum_hessian_in_leaf = min_hess,
                      max_bin = 255,
                      feature_fraction = colsample,
                      bagging_fraction = subsample,
                      bagging_freq = sampling_freq,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE,
                      is_sparse = FALSE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)

gc()

#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))

best_iter <- 0
for (j in 1:5) {
  best_iter <- best_iter + 0.2 * temp_model$Models[[j]]$Best
}

cat("Going for ", best_iter, " rounds.  \n", sep = "")

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
                         num_threads = threads,
                         application = "binary",
                         learning_rate = eta,
                         num_iterations = floor(best_iter * 1.1),
                         num_leaves = leaves,
                         min_data_in_leaf = min_sample,
                         min_sum_hessian_in_leaf = min_hess,
                         max_bin = 255,
                         feature_fraction = colsample,
                         bagging_fraction = subsample,
                         bagging_freq = sampling_freq,
                         is_unbalance = FALSE,
                         metric = "auc",
                         is_training_metric = TRUE,
                         is_sparse = FALSE)

saveRDS(best_model, file.path(my_script_is_using, "aaa_LightGBM_full.rds"), compress = TRUE)



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




# Know what is inside


AnalysisFunc <- function(lgbm, label, folds, validationValues, predictedValuesCV, predictedValues) {
  # lgbm = your LightGBM cross-validated model (set as "NA" if it is not a LGBM model)
  # Label = your label
  # Folds = your fold list
  # validationValues = your validation values (out of fold predictions)
  # predictedValuesCV = your predicted values (on test data) from CV (set as "NA" if you don't have any)
  # predictedValues = your prediction values (on test data) on a model trained on all data (set as "NA" if you don't have any)
  
  if (length(lgbm) > 1) {
    
    # Print feature importance to file
    
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
    
  }
  
  # Setup tee
  sink(file = file.path(my_script_is_using, "diagnostics.txt"), append = FALSE, split = TRUE)
  cat("```r\n")
  
  if (length(lgbm) > 1) {
    
    # Get iteration information
    temp_iter <- numeric(5)
    best_iter <- 0
    for (j in 1:5) {
      temp_iter[j] <- lgbm$Models[[j]]$Best
      best_iter <- best_iter + (temp_iter[j] / length(folds))
      cat("Fold ", j, " converged after ", sprintf("%04d", temp_iter[j]), " iterations.\n", sep = "")
    }
    cat("Iterations: ", sprintf("%06.2f", mean(temp_iter)), " + ", sprintf("%06.3f", sd(temp_iter)), "\n\n\n", sep = "")
    
  }
  
  # Get AUC metric information
  temp_auc <- numeric(length(folds))
  best_auc <- 0
  for (j in 1:length(folds)) {
    temp_auc[j] <- FastROC(y = label[folds[[j]]], x = validationValues[folds[[j]]])
    best_auc <- best_auc + (temp_auc[j] / length(folds))
    cat("Fold ", j, ": AUC=", sprintf("%.07f", temp_auc[j]), "\n", sep = "")
  }
  cat("AUC: ", sprintf("%.07f", mean(temp_auc)), " + ", sprintf("%.07f", sd(temp_auc)), "\n", sep = "")
  cat("Average AUC using all data: ", sprintf("%.07f", FastROC(y = label, x = validationValues)), "\n\n\n", sep = "")
  
  
  # Get MCC metric information
  temp_mcc <- numeric(length(folds))
  temp_thresh <- numeric(length(folds))
  temp_positives <- numeric(length(folds))
  temp_detection <- numeric(length(folds))
  temp_true <- numeric(length(folds))
  temp_undetect <- numeric(length(folds))
  best_mcc <- 0
  for (j in 1:length(folds)) {
    
    temp_mcc[j] <- mcc_eval_print(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_thresh[j] <- mcc_eval_pred(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    mini_preds <- validationValues[folds[[j]]] > temp_thresh[[j]]
    temp_positives[j] <- sum(mini_preds)
    temp_detection[j] <- 100 * temp_positives[j] / sum(label[folds[[j]]])
    temp_true[j] <- sum((mini_preds[mini_preds == TRUE] == label[folds[[j]]][mini_preds == TRUE]))
    temp_undetect[j] <- sum(label[folds[[j]]]) - temp_true[j]
    temp_true[j] <- 100 * temp_true[j] / sum(length(mini_preds[mini_preds == TRUE]))
    best_mcc <- best_mcc + (temp_mcc[j] / length(folds))
    cat("Fold ", j, ": MCC=", sprintf("%.07f", temp_mcc[j]), " (", sprintf("%04d", temp_positives[j]), " [", sprintf("%05.2f", temp_detection[j]), "%] positives), threshold=", sprintf("%.07f", temp_thresh[j]), " => True positives = ", sprintf("%06.3f", temp_true[j]), "%\n", sep = "")
    
  }
  cat("MCC: ", sprintf("%.07f", mean(temp_mcc)), " + ", sprintf("%.07f", sd(temp_mcc)), "\n", sep = "")
  cat("Threshold: ", sprintf("%.07f", mean(temp_thresh)), " + ", sprintf("%.07f", sd(temp_thresh)), "\n", sep = "")
  cat("Positives: ", sprintf("%06.2f", mean(temp_positives)), " + ", sprintf("%06.2f", sd(temp_positives)), "\n", sep = "")
  cat("Detection Rate %: ", sprintf("%06.3f", mean(temp_detection)), " + ", sprintf("%06.3f", sd(temp_detection)), "\n", sep = "")
  cat("True positives %: ", sprintf("%06.3f", mean(temp_true)), " + ", sprintf("%06.3f", sd(temp_true)), "\n", sep = "")
  cat("Undetected positives: ", sprintf("%07.2f", mean(temp_undetect)), " + ", sprintf("%07.2f", sd(temp_undetect)), "\n", sep = "")
  cat("Average MCC on all data (5 fold): ", sprintf("%.07f", mcc_fixed(y_prob = validationValues, y_true = label, prob = mean(temp_thresh))), ", threshold=", sprintf("%.07f", mean(temp_thresh)), "\n", sep = "")
  cat("Average MCC using all data: ", sprintf("%.07f", mcc_eval_print(y_prob = validationValues, y_true = label)), ", threshold=", sprintf("%.07f", mcc_eval_pred(y_prob = validationValues, y_true = label)), "\n\n\n", sep = "")
  
  
  if (length(predictedValuesCV) > 1) {
    
    # Create overfitted submission from all data
    best_mcc1 <- mcc_eval_pred(y_prob = validationValues, y_true = label)
    submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov$Response <- as.numeric(predictedValuesCV > best_mcc1)
    best_count1 <- sum(submission0_ov$Response == 1)
    cat("Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
    write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation
    best_mcc2 <- mean(temp_thresh)
    submission0 <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0$Response <- as.numeric(predictedValuesCV > best_mcc2)
    best_count2 <- sum(submission0$Response == 1)
    cat("Submission average validated threshold on all MCC positives: ", best_count2, "\n\n", sep = "")
    write.csv(submission0, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc2), "_", best_count2, ".csv", sep = "")), row.names = FALSE)
    
    # Create average of the two previous submissions
    best_mcc3 <- (best_mcc1 + best_mcc2) / 2
    submission0_ex <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex$Response <- as.numeric(predictedValuesCV > best_mcc3)
    best_count3 <- sum(submission0_ex$Response == 1)
    cat("Submission average of overfit+validated threshold positives: ", best_count3, "\n\n", sep = "")
    write.csv(submission0_ex, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc3), "_", best_count3, ".csv", sep = "")), row.names = FALSE)
    
    # Create files for stacker
    write.csv(validationValues, file = file.path(my_script_is_using, "aaa_stacker_preds_train_headerY.csv"), row.names = FALSE)
    write.csv(predictedValuesCV, file = file.path(my_script_is_using, "aaa_stacker_preds_test_headerY.csv"), row.names = FALSE)
    
  }
  
  
  if (length(predictedValues) > 1) {
    
    # Create overfitted submission from all data using full trained model
    best_mcc1_all <- best_mcc1
    submission0_ov_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov_all$Response <- as.numeric(predictedValues > best_mcc1_all)
    best_count1_all <- sum(submission0_ov_all$Response == 1)
    cat("Submission with all data overfitted threshold on all MCC positives: ", best_count1_all, ". Threshold=", best_mcc1_all, "\n\n", sep = "")
    write.csv(submission0_ov_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc1_all), "_", best_count1_all, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation using full trained model
    best_mcc2_all <- best_mcc2
    submission0_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_all$Response <- as.numeric(predictedValues > best_mcc2_all)
    best_count2_all <- sum(submission0_all$Response == 1)
    cat("Submission with all data average validated threshold on all MCC positives: ", best_count2_all, ". Threshold=", best_mcc2_all, "\n\n", sep = "")
    write.csv(submission0_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc2_all), "_", best_count2_all, ".csv", sep = "")), row.names = FALSE)
    
    # Create average of the two previous submissions using full trained model
    best_mcc3_all <- best_mcc3
    submission0_ex_all <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex_all$Response <- as.numeric(predictedValues > best_mcc3_all)
    best_count3_all <- sum(submission0_ex_all$Response == 1)
    cat("Submission with all data average of overfit+validated threshold positives: ", best_count3_all, ". Threshold=", best_mcc3_all, "\n\n", sep = "")
    write.csv(submission0_ex_all, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_", sprintf("%.06f", best_mcc3_all), "_", best_count3_all, ".csv", sep = "")), row.names = FALSE)
    
    
    
    mini_preds <- predictedValues
    mini_preds <- mini_preds[order(mini_preds, decreasing = TRUE)]
    
    # Create overfitted submission from all data using full trained model using respective positive count
    best_mcc1_all_val <- mini_preds[best_count1 + 1]
    submission0_ov_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov_all_val$Response <- as.numeric(predictedValues > best_mcc1_all_val)
    best_count1_all_val <- sum(submission0_ov_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: ", best_count1_all_val, ". Threshold=", best_mcc1_all_val, "\n\n", sep = "")
    write.csv(submission0_ov_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc1_all_val), "_", best_count1_all_val, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation using full trained model using respective positive count
    best_mcc2_all_val <- mini_preds[best_count2 + 1]
    submission0_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_all_val$Response <- as.numeric(predictedValues > best_mcc2_all_val)
    best_count2_all_val <- sum(submission0_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: ", best_count2_all_val, ". Threshold=", best_mcc2_all_val, "\n\n", sep = "")
    write.csv(submission0_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc2_all_val), "_", best_count2_all_val, ".csv", sep = "")), row.names = FALSE)
    
    # Create average of the two previous submissions using full trained model using respective positive count
    best_mcc3_all_val <- mini_preds[best_count3 + 1]
    submission0_ex_all_val <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ex_all_val$Response <- as.numeric(predictedValues > best_mcc3_all_val)
    best_count3_all_val <- sum(submission0_ex_all_val$Response == 1)
    cat("Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: ", best_count3_all_val, ". Threshold=", best_mcc3_all_val, "\n\n", sep = "")
    write.csv(submission0_ex_all_val, file = file.path(my_script_is_using, paste(my_script_subbed, "_all_val_", sprintf("%.06f", best_mcc3_all_val), "_", best_count3_all_val, ".csv", sep = "")), row.names = FALSE)
    
    # Create submissions using full trained model using total validated positive count
    best_mcc_extra <- mini_preds[sum(temp_positives) + 1]
    submission0_extra <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_extra$Response <- as.numeric(predictedValues > best_mcc_extra)
    best_count_extra <- sum(submission0_extra$Response == 1)
    cat("Submission with all data by taking the sum of positives of validated positives: ", best_count_extra, ". Threshold=", best_mcc_extra, "\n\n", sep = "")
    write.csv(submission0_extra, file = file.path(my_script_is_using, paste(my_script_subbed, "_extra_", sprintf("%.06f", best_mcc_extra), "_", best_count_extra, ".csv", sep = "")), row.names = FALSE)
    
  }
  
  
  if (length(lgbm) > 1) {
    
    # Do best feature listing
    cat("Cross-validated used features list (all used features to copy & paste):\n\n")
    mini_model <- copy(lgbm$FeatureImp)
    dput(mini_model$Feature)
    cat("\n\nCross-validated multipresence used features list (all used features to copy & paste):\n\n")
    mini_model <- mini_model[Freq == length(folds), ]
    dput(mini_model$Feature)
    
  }
  
  cat("```")
  sink()
  
}


AnalysisFunc(lgbm = temp_model,
             label = label,
             folds = folds,
             validationValues = temp_model$Validation[[1]],
             predictedValuesCV = temp_model$Testing[[1]],
             predictedValues = best_model$Testing)

