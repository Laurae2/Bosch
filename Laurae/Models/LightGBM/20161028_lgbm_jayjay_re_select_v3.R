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

my_script_is_using <- "E:/Laurae/20161028_lgbm_jayjay_re_select_v3"
my_lgbm_is_at <- "C:/Compiled/LightGBM/windows/x64/Release/lightgbm.exe"
my_script_subbed <- basename(my_script_is_using)
threads <- 12
leaves <- 255
eta <- 0.05
min_sample <- 100
min_hess <- 10
subsample <- 1.0
colsample <- 1.0
sampling_freq <- ifelse(subsample == 1, 0, 1)


# Load from RDS

train <- readRDS("Laurae/jayjay_clean/train.rds")
test <- readRDS("Laurae/jayjay_clean/test.rds")
label <- readRDS("datasets/labels.rds")

train[, Id := NULL]
test[, Id := NULL]
gc()

# Only >0.01% relative gain

to_keep <- which(colnames(train) %in% c("sameL0_Number1", "sameL1_Number1", "CATEGORICAL_Last_____1", 
                                        "GF1", "sameL3_Number1", "GF0", "sameL3", "BAC60_Sum_S3", "FOR60_Sum_S3", 
                                        "L1_S24_F1723", "DATE_S33max", "DATE_L3kurt", "FOR30_Sum_S", 
                                        "BAC30_Sum_S", "BAC100_Sum", "FOR100_Sum", "Kurtosis", "FOR165_log_lag", 
                                        "FOR100_log_lag_L3", "L1_S24_F1632", "BAC100_log_lag_L3", "L3_S33_F3857", 
                                        "FOR165_Sum", "L3_S30_F3754", "L0_Max", "L0max_L3max", "BAC100_log_lag", 
                                        "FOR165_log_lag_L3", "L3_S33_F3859", "L3_S30_F3744", "Range", 
                                        "L3max_L0min", "DATE_S32max", "S33max_S29min", "L3_L3_Unique_Count", 
                                        "L1_S24_F1844", "L3_S30_F3759", "FOR100_log_lag", "BAC165_log_lag", 
                                        "L3_S33_F3865", "BAC165_Sum", "BAC165_log_lag_L3", "L3_S30_F3749", 
                                        "L3_S29_F3351", "L3_S30_F3774", "Response_Minus1", "CATEGORICAL_Last_____2", 
                                        "L3_S30_F3809", "L3_S30_F3804", "DATE_S34max", "L3_S29_F3348", 
                                        "L3_S30_F3704", "L3_S29_F3345", "L3_S29_F3373", "L3_S29_F3321", 
                                        "L0_S1_F28", "L3_S30_F3554", "L3_S29_F3324", "L3_S30_F3769", 
                                        "L3_S29_F3427", "L0_S0_F20_Mult_L0_S0_F20", "L3_S30_F3829", "L3_S30_F3494", 
                                        "L0_Mean", "L3_S29_F3342", "L3_S29_F3354", "L3_S29_F3379", "S33min_S30min", 
                                        "L3_S36_F3920", "L1_S24_F1846", "Response_Minus1_Number1", "L0_Min", 
                                        "sameL0", "L3_S29_F3339", "L3_S29_F3315", "L3_S29_F3333", "L3_S29_F3479", 
                                        "BAC60_log_lag_S34", "L3_S29_F3327", "L3_S30_F3574", "L3_S30_F3609", 
                                        "L0_S1_F24", "FOR60_log_lag_S34", "L3_S30_F3794", "L3_S30_F3534", 
                                        "L3_S30_F3544", "L3_S30_F3604", "L3_S29_F3336", "L3_S29_F3382", 
                                        "L0_S9_F180", "L0_S0_F20", "L3_S29_F3376", "L3_S30_F3784", "DATE_S35max", 
                                        "L0_S0_F18", "FOR165_log_lag_L2", "L3_S29_F3330", "L3_S30_F3514", 
                                        "L3_S30_F3819", "L3_S30_F3519", "L3_Max", "BAC165_log_lag_L2", 
                                        "L2_Min", "L0_S0_F0", "L0_S0_F16", "L3_S30_F3524", "L3_S29_F3407", 
                                        "BAC165_log_lag_L1", "L3_S30_F3639", "DATE_S36max", "L3_S29_F3318", 
                                        "L2max_S37max", "L3_S30_F3709", "DATE_S30max", "L0_S4_F104", 
                                        "L3_S29_F3433", "DATE_S37max", "L3_S30_F3629", "L3_S30_F3509", 
                                        "BAC60_log_lag_S33", "BAC165_log_lag_L0", "FOR30_log_lag_S34", 
                                        "L3_S30_F3504", "L3_S30_F3624", "L3_S30_F3764", "L0_S10_F244", 
                                        "BAC165_LAG2_Missing_Value_Count_ResponseMinus1", "L0_S0_F2", 
                                        "L3_S29_F3473", "L0_S3_F100", "L3_S29_F3436", "L3max_S30max", 
                                        "L3_S30_F3799", "L0_S2_F36", "L3_Range", "BAC100_log_lag_L1", 
                                        "FOR165_log_lag_L1", "L3_S29_F3430", "L3_S30_F3579", "FOR165_log_lag_L0", 
                                        "BAC30_log_lag_S30", "L0_S5_F114", "S29min_S37min", "BAC100_LAG_Missing_Value_Count_ResponseMinus1", 
                                        "FOR165_LAG_Missing_Value_Count_ResponseMinus1", "L3_Min", "Min", 
                                        "FOR165_LAG_Count_Mult_ResponseMinus1", "BAC30_log_lag_S33", 
                                        "L3_S29_F3461", "CATEGORICAL_Unique_Count", "FOR165_LAG3_Missing_Value_Count_ResponseMinus1", 
                                        "FOR60_log_lag_S33", "FOR100_LAG_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S11_F322", "L0_S2_F44", "FOR165_LAG3_Count_Mult_ResponseMinus1", 
                                        "FOR165_LAG1_Missing_Value_Count_ResponseMinus1", "FOR100_LAG_Count_Mult_ResponseMinus1", 
                                        "S30min_S37min", "BAC165_LAG_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S6_F132", "L0_S7_F138", "BAC100_LAG3_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S2_F60", "CATEGORICAL_out_out_L3_S32_F3854_class2", "FOR60_log_lag_S30", 
                                        "BAC100_LAG_Count_Mult_ResponseMinus1", "BAC165_LAG2_Count_Mult_ResponseMinus1", 
                                        "BAC165_LAG_Count_Mult_ResponseMinus1", "L0_S11_F310", "L3_S30_F3669", 
                                        "FOR165_LAG2_Count_Mult_ResponseMinus1", "L0_S5_F116", "BAC30_log_lag_S34", 
                                        "FOR100_LAG3_Missing_Value_Count_ResponseMinus1", "FOR165_LAG1_Count_Mult_ResponseMinus1", 
                                        "FOR100_LAG2_Missing_Value_Count_ResponseMinus1", "FOR165_LAG2_Missing_Value_Count_ResponseMinus1", 
                                        "L3_S29_F3357", "Mean", "DATE_S6_max", "L0_S2_F64", "FOR100_log_lag_L2", 
                                        "FOR100_LAG2_Count_Mult_ResponseMinus1", "BAC165_LAG1_Count_Mult_ResponseMinus1", 
                                        "FOR100_LAG0_Missing_Value_Count_ResponseMinus1", "L0_Range", 
                                        "BAC165_LAG1_Missing_Value_Count_ResponseMinus1", "BAC165_LAG0_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S4_F109", "FOR100_LAG1_Missing_Value_Count_ResponseMinus1", 
                                        "CATEGORICAL_Missing_Value_Count", "L3_S35_F3896", "FOR100_LAG3_Count_Mult_ResponseMinus1", 
                                        "Unique_Count", "L1_Min", "L3_S30_F3589", "FOR165_LAG0_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S3_F72", "BAC165_LAG3_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S3_F96", "BAC100_log_lag_L2", "DATE_L1kurt", "L0_S0_F8", 
                                        "BAC100_LAG2_Missing_Value_Count_ResponseMinus1", "L2_S26_F3106", 
                                        "DATE_S0_max", "L3_S35_F3889", "FOR100_log_lag_L1", "BAC100_LAG0_Count_Mult_ResponseMinus1", 
                                        "L3_S30_F3684", "BAC100_LAG1_Missing_Value_Count_ResponseMinus1", 
                                        "L0_S6_F122", "DATE_S5_max", "S36max_S29min", "L3_S29_F3476", 
                                        "L3_S30_F3644", "FOR165_LAG0_Count_Mult_ResponseMinus1", "BAC100_LAG3_Count_Mult_ResponseMinus1", 
                                        "BAC100_LAG0_Missing_Value_Count_ResponseMinus1", "L0_S3_F80", 
                                        "L2_S26_F3062", "BAC165_LAG3_Count_Mult_ResponseMinus1", "L0_S7_F142", 
                                        "BAC165_LAG0_Count_Mult_ResponseMinus1", "L0_S0_F6", "DATE_S7_max", 
                                        "L0_S11_F326", "FOR30_log_lag_S33", "L0_S0_F22", "FOR30_log_lag_S30", 
                                        "L0_S10_F254", "S33min_S37min", "L0_S0_F4", "FOR100_LAG1_Count_Mult_ResponseMinus1", 
                                        "S29min_S34min", "BAC100_LAG2_Count_Mult_ResponseMinus1", "L0_S11_F302", 
                                        "BAC60_log_lag_S30", "BAC100_log_lag_L0", "L0_S10_F259", "BAC100_LAG1_Count_Mult_ResponseMinus1", 
                                        "L3_S30_F3569", "L0_S21_F497", "L3_S30_F3674", "L0_S9_F165", 
                                        "DATE_S3_max", "L2_S26_F3069", "FOR100_log_lag_L0", "FOR100_LAG0_Count_Mult_ResponseMinus1", 
                                        "L1_Max", "L0_S9_F170", "DATE_S2_max", "DATE_S24max", "CATEGORICAL_out_L3_S32_F3854_class1", 
                                        "L0_S9_F185", "L0_S0_F10", "L0_S9_F155", "DATE_S29max", "L0_S0_F14", 
                                        "L3_S30_F3689", "L0_S13_F354", "L1_S24_F1578", "DATE_S4_max", 
                                        "L2_S27_F3129", "L3_S30_F3564", "S29min_S32min", "L3_S30_F3584", 
                                        "L3_S30_F3664", "DATE_S38max", "L0_S11_F294", "L0_S10_F229", 
                                        "S37min_S34min", "L0_S9_F190", "L3max_S34min", "L1_Range", "L0_S10_F224", 
                                        "L0_S9_F160", "L0_S12_F332", "L0_S11_F290", "L3_S30_F3634", "L0_S11_F286", 
                                        "L1_S24_F1850", "L0_S12_F348", "L0_S13_F356", "S29max_S35max", 
                                        "L0_S11_F306", "L2_S26_F3117", "L0_S10_F249", "DATE_S8_max", 
                                        "sameL2", "L0_S11_F318", "L0_S9_F195", "L0_S23_F643", "L0_S10_F219", 
                                        "S30min_S35min", "DATE_S24min", "L1_S24_F1516", "L3_S30_F3679", 
                                        "L0_S11_F314", "L2_S27_F3210", "L0_S0_F12", "L0_S11_F282", "L0_S12_F350", 
                                        "S13min_S33min", "DATE_S10max", "L0_S12_F330", "L2_S26_F3036", 
                                        "L0_S12_F346", "L0_Unique_Count", "L3_Unique_Count", "L0_S10_F234", 
                                        "L3_S29_F3360", "L0_S11_F314_Mult_L0_S0_F20", "DATE_S26max", 
                                        "L2_S27_F3199", "L0_S3_F84", "DATE_S1_max", "L2_S26_F3040", "L3max_S26max", 
                                        "L0_S23_F667", "L3_S32_F3850", "L0_S8_F144", "S35min_L1min", 
                                        "L3_S35_F3894", "L2_S26_F3073", "L2_S26_F3113", "L0_S18_F439", 
                                        "L2_S26_F3121", "L0_S11_F314_Mult_L0_S11_F314", "L1_S24_F1667", 
                                        "L0_S9_F200", "DATE_S18max", "L1_S24_F1758", "L2_S27_F3162", 
                                        "S33min_S36min", "L3_S41_F4008", "sameL1", "L0_S17_F433", "L2_S26_F3047", 
                                        "L1_S24_F1494", "DATE_S16max", "DATE_S9_max", "L3_S33_F3855", 
                                        "L0_S16_F426", "L2_S27_F3155", "L0_S2_F48", "L0_S23_F639", "L3_S38_F3960", 
                                        "L2_S27_F3214", "DATE_S13max", "DATE_S11max", "L2_S27_F3133", 
                                        "L2_Max", "S33min_S35min", "L3_L3_Missing_Value_Count", "L0_S10_F239", 
                                        "L0_S10_F264", "S26max_S32max", "L0_S14_F386", "L0_S14_F370", 
                                        "L1_S24_F1672", "S34min_S35min", "L1_S24_F1514", "L2_S27_F3206", 
                                        "L1_S24_F1463", "L1_S24_F1773", "L2_S26_F3051", "L0_S21_F532", 
                                        "L1_S24_F1831", "L1_S24_F1581", "L1_S24_F1662", "DATE_S14max", 
                                        "L0_S15_F415", "L0_S14_F362", "L3_S41_F4011", "L0_S14_F390", 
                                        "L0_S22_F576", "L3_S36_F3918", "L1_S24_F1520", "L1_S24_F1788", 
                                        "DATE_S19max", "L1_S24_F1783", "L0_S19_F455", "FOR165_LAG3_Sum_ResponseMinus1", 
                                        "DATE_S27max", "L0_S9_F210", "L0_S23_F671", "L1_S24_F1842", "L0_S16_F421", 
                                        "L0_S21_F482", "CATEGORICAL_Max______3", "L2_S27_F3144", "L1_S24_F1544", 
                                        "DATE_S22max", "L0_S22_F591", "L0_S22_F606", "L0_S22_F571", "L3_S48_F4198", 
                                        "DATE_S15max", "DATE_S21max", "S26min_S24min", "L2_S27_F3166", 
                                        "S27min_S32min", "L1_S25_F2161", "L0_S15_F418", "L1_S24_F1518", 
                                        "L0_S12_F336", "L1_S24_F1637", "L3_S29_F3482", "L1_S24_F1565", 
                                        "L1_S24_F1700", "L1_S24_F1573", "L0_S12_F344", "L0_S19_F459", 
                                        "L2_S27_F3140", "L0_S15_F403", "L0_S12_F342", "L3_S45_F4124", 
                                        "S33min_S34min", "L1_S24_F1824", "L0_S10_F274", "L1_S25_F2116", 
                                        "DATE_S17max", "L3_S47_F4163", "L0_S21_F502", "L0_S12_F334", 
                                        "L1_S24_F1763", "L1_S24_F1778", "L0_S21_F492", "L0_S14_F374", 
                                        "L0_S15_F397", "L3_S41_F4026", "L0_S21_F522", "L0_S12_F338", 
                                        "L3_S41_F4004", "DATE_S23max", "L0_S18_F449", "L1_S24_F1652", 
                                        "L0_S23_F619", "S26min_S37min", "L0_S12_F352", "L0_S17_F431", 
                                        "L0_S15_F406", "L1_S24_F1575", "L3_S47_F4153", "L0_S23_F651", 
                                        "L1_S24_F1685", "L1_S25_F1958", "L1_S24_F1498", "L1_S24_F1571", 
                                        "L1_S24_F1848", "L0_S9_F175", "L1_S25_F2176", "L0_S23_F659", 
                                        "L0_S2_F56", "L0_S22_F556", "L0_S2_F32", "L1_S24_F1798", "L0_S23_F655", 
                                        "L1_S24_F1567", "L0_S21_F507", "L0_S3_F76", "DATE_S20max", "L0_S21_F487", 
                                        "L0_S12_F340", "L0_S21_F517", "L3_S41_F4020", "L1_Unique_Count", 
                                        "L1_S24_F1599", "L1_S24_F1812", "L0_S21_F477", "L1_S24_F1829", 
                                        "DATE_S25max", "L3_S48_F4196", "L1_L1_Missing_Value_Count", "L0_S23_F631", 
                                        "L0_S22_F586", "L0_S21_F472", "L3_S41_F4006", "L0_S22_F601", 
                                        "L3_S43_F4090", "L0_S21_F537", "L3_S40_F3986", "L0_S23_F623", 
                                        "L3_S47_F4158", "L1_S24_F1609", "L0_S3_F68", "L3_S41_F4014", 
                                        "L3_S40_F3984", "L1_S24_F1539", "L3_S38_F3956", "L1_S25_F2136", 
                                        "L0_S22_F551", "L0_S21_F527", "L1_S24_F1808", "L0_S21_F512", 
                                        "L1_S24_F1738", "L0_S23_F663", "BAC100_LAG3_Sum_ResponseMinus1", 
                                        "DATE_S12max", "L1_S24_F1728", "L1_S24_F1753", "L3_S40_F3982", 
                                        "L1_S25_F2158", "DATE_S25min", "L1_S24_F1512", "DATE_S44max", 
                                        "BAC100_LAG_Sum_ResponseMinus1", "L1_S24_F1718", "L3_S47_F4138", 
                                        "L0_S22_F596", "L1_S24_F1122", "DATE_S40max", "BAC165_LAG3_Sum_ResponseMinus1", 
                                        "L0_S20_F461", "L0_S15_F400", "L1_S24_F1713", "L1_S24_F1814", 
                                        "DATE_S48max", "L3_S44_F4115", "L1_S25_F1892", "L0_S6_F118", 
                                        "L0_S7_F136", "L1_S25_F2101", "L1_S25_F2170", "L1_S24_F829", 
                                        "L1_S24_F1822", "L1_S24_F1803", "FOR165_LAG0_Sum_ResponseMinus1", 
                                        "L3_S47_F4143", "BAC100_LAG1_Sum_ResponseMinus1", "L3_S41_F4000", 
                                        "L3_S49_F4211", "L1_S24_F1816", "L3_S44_F4112", "L1_S24_F1743", 
                                        "FOR100_LAG2_Sum_ResponseMinus1", "FOR100_LAG_Sum_ResponseMinus1", 
                                        "S32max_S37min", "L0_S23_F627", "L0_S2_F40", "FOR165_LAG_Sum_ResponseMinus1", 
                                        "L1_S24_F1647", "BAC165_LAG1_Sum_ResponseMinus1", "L0_S22_F546", 
                                        "L1_S24_F1818", "L1_S24_F1748", "L0_S3_F92", "L1_S24_F1627", 
                                        "DATE_S43max", "BAC165_LAG_Sum_ResponseMinus1", "L3_S41_F4016", 
                                        "L1_S25_F2106", "L1_S25_F2111", "L1_S25_F1938", "L1_S25_F2155", 
                                        "L1_S25_F1973", "FOR100_LAG3_Sum_ResponseMinus1", "L1_S25_F2051", 
                                        "L3_S30_F3649", "L1_S25_F2131", "S32min_S30min", "L3_S36_F3938", 
                                        "L1_S24_F1733", "DATE_S41max", "L0_S14_F366", "L1_S25_F2126", 
                                        "L1_S25_F2147", "L1_S24_F1622", "S32max_S25min", "L2_L2_Unique_Count", 
                                        "L1_S24_F983", "L1_S25_F1855", "L1_S24_F1690", "L3_S41_F4023", 
                                        "DATE_S47max", "sameL2_Number1", "FOR100_LAG1_Sum_ResponseMinus1", 
                                        "L1_S24_F1490", "DATE_S50max", "DATE_S45min", "DATE_S51max", 
                                        "L1_S25_F1992", "L1_S25_F2091", "L1_S24_F1657", "L3_S44_F4118", 
                                        "L1_S25_F1900", "L1_S24_F1642", "S32min_S10min", "L3_S40_F3980", 
                                        "L1_S24_F948", "L0_S10_F269", "L1_S24_F1594", "DATE_S28max", 
                                        "L1_S24_F1838", "BAC165_LAG0_Sum_ResponseMinus1", "L3_S29_F3488", 
                                        "L1_S25_F1909", "BAC100_LAG0_Sum_ResponseMinus1", "L1_S24_F1834", 
                                        "L1_S24_F1820", "L0_S22_F561", "L1_S24_F1793", "L1_S24_F1041", 
                                        "L1_S24_F963"))

train <- DTcolsample(train, to_keep)
test <- DTcolsample(test, to_keep)
gc()

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
                      num_threads = threads,
                      application = "binary",
                      learning_rate = eta,
                      num_iterations = 500,
                      early_stopping_rounds = 75,
                      num_leaves = leaves,
                      min_data_in_leaf = min_sample,
                      min_sum_hessian_in_leaf = min_hess,
                      max_bin = 255,
                      feature_fraction = colsample,
                      bagging_fraction = subsample,
                      bagging_freq = sampling_freq,
                      is_unbalance = FALSE,
                      metric = "auc",
                      is_training_metric = TRUE)

saveRDS(temp_model, file.path(my_script_is_using, "aaa_LightGBM_cv.rds"), compress = TRUE)

gc()

#temp_model <- readRDS(file.path(my_script_is_using, "aaa_LightGBM_cv.rds"))

best_iter <- 0
for (j in 1:5) {
  best_iter <- best_iter + 0.2 * temp_model$Models[[j]]$Best
}

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
                         is_training_metric = TRUE)

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
  
  if (length(lgbm) > 1) {
    
    # Get iteration information
    temp_iter <- numeric(5)
    best_iter <- 0
    for (j in 1:5) {
      temp_iter[j] <- lgbm$Models[[j]]$Best
      best_iter <- best_iter + (temp_iter[j] / length(folds))
      cat("Fold ", j, " converged after ", temp_iter[j], " iterations.\n", sep = "")
    }
    cat("Iterations: ", mean(temp_iter), " + ", sd(temp_iter), "\n\n\n", sep = "")
    
  }
  
  # Get AUC metric information
  temp_auc <- numeric(length(folds))
  best_auc <- 0
  for (j in 1:length(folds)) {
    temp_auc[j] <- FastROC(y = label[folds[[j]]], x = validationValues[folds[[j]]])
    best_auc <- best_auc + (temp_auc[j] / length(folds))
    cat("Fold ", j, ": AUC=", temp_auc[j], "\n", sep = "")
  }
  cat("AUC: ", mean(temp_auc), " + ", sd(temp_auc), "\n", sep = "")
  cat("Average AUC using all data: ", FastROC(y = label, x = validationValues), "\n\n\n", sep = "")
  
  
  # Get MCC metric information
  temp_mcc <- numeric(length(folds))
  temp_thresh <- numeric(length(folds))
  temp_positives <- numeric(length(folds))
  temp_detection <- numeric(length(folds))
  best_mcc <- 0
  for (j in 1:length(folds)) {
    
    temp_mcc[j] <- mcc_eval_print(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_thresh[j] <- mcc_eval_pred(y_prob = validationValues[folds[[j]]], y_true = label[folds[[j]]])
    temp_positives[j] <- sum(validationValues[folds[[j]]] > temp_thresh[[j]])
    temp_detection[j] <- temp_positives[j] / sum(label[folds[[j]]])
    best_mcc <- best_mcc + (temp_mcc[j] / length(folds))
    cat("Fold ", j, ": MCC=", temp_mcc[j], " (", temp_positives[j], " [", sprintf("%05.2f", temp_detection[j] * 100), "%] positives), threshold=", temp_thresh[j], "\n", sep = "")
    
  }
  cat("MCC: ", mean(temp_mcc), " + ", sd(temp_mcc), "\n", sep = "")
  cat("Positives: ", mean(temp_positives), " + ", sd(temp_positives), "\n", sep = "")
  cat("Detection Rate: ", mean(temp_detection), " + ", sd(temp_detection), "\n", sep = "")
  cat("Average MCC on all data (5 fold): ", mcc_fixed(y_prob = validationValues, y_true = label, prob = mean(temp_mcc)), ", threshold=", mean(temp_mcc), "\n", sep = "")
  cat("Average MCC using all data: ", mcc_eval_print(y_prob = validationValues, y_true = label), ", threshold=", mcc_eval_pred(y_prob = validationValues, y_true = label), "\n\n\n", sep = "")
  
  
  if (length(predictedValuesCV) > 1) {
    
    # Create overfitted submission from all data
    best_mcc1 <- mcc_eval_pred(y_prob = validationValues, y_true = label)
    submission0_ov <- fread("datasets/sample_submission.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
    submission0_ov$Response <- as.numeric(predictedValuesCV > best_mcc1)
    best_count1 <- sum(submission0_ov$Response == 1)
    cat("Submission overfitted threshold on all MCC positives: ", best_count1, "\n\n", sep = "")
    write.csv(submission0_ov, file = file.path(my_script_is_using, paste(my_script_subbed, "_val_", sprintf("%.06f", best_mcc1), "_", best_count1, ".csv", sep = "")), row.names = FALSE)
    
    # Create CV submission from validation
    best_mcc2 <- best_mcc
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
    cat("\n\nSee the screenshots for more accuracy about the gain\n\n\n")
    
  }
  
  sink()
  
  return("Done")
  
}


AnalysisFunc(lgbm = temp_model,
             label = label,
             folds = folds,
             validationValues = temp_model$Validation[[1]],
             predictedValuesCV = temp_model$Testing[[1]],
             predictedValues = best_model$Testing)
