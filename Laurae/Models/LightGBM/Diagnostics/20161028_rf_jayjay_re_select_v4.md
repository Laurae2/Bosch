```r
Model Details:
==============

H2OBinomialModel: drf
Model Key:  DRF_model_R_1477681382149_1 
Model Summary: 
  number_of_trees number_of_internal_trees model_size_in_bytes min_depth max_depth mean_depth min_leaves max_leaves mean_leaves
1             200                      200              421659        10        10   10.00000         90        264   163.87500

H2OBinomialMetrics: drf
** Reported on training data. **
** Metrics reported on Out-Of-Bag training samples **

MSE:  0.00489192
RMSE:  0.06994226
LogLoss:  0.02427776
Mean Per-Class Error:  0.3722638
AUC:  0.9087777
Gini:  0.8175555

Confusion Matrix for F1-optimal threshold:
             0    1    Error           Rate
0      1175738 1130 0.000960  =1130/1176868
1         5115 1764 0.743567     =5115/6879
Totals 1180853 2894 0.005276  =6245/1183747

Maximum Metrics: Maximum metrics at their respective thresholds
                        metric threshold    value idx
1                       max f1  0.152014 0.360995 153
2                       max f2  0.037828 0.334787 251
3                 max f0point5  0.227303 0.511623 123
4                 max accuracy  0.230211 0.995098 122
5                max precision  0.881160 1.000000   0
6                   max recall  0.001023 1.000000 399
7              max specificity  0.881160 1.000000   0
8             max absolute_mcc  0.227303 0.408030 123
9   max min_per_class_accuracy  0.006514 0.844309 344
10 max mean_per_class_accuracy  0.009180 0.856210 329

Gains/Lift Table: Extract with `h2o.gainsLift(<model>, <data>)` or `h2o.gainsLift(<model>, valid=<T/F>, xval=<T/F>)`

H2OBinomialMetrics: drf
** Reported on cross-validation data. **
** 5-fold cross-validation on training data (Metrics computed for combined holdout predictions) **

MSE:  0.004905181
RMSE:  0.070037
LogLoss:  0.02433118
Mean Per-Class Error:  0.3729315
AUC:  0.9091827
Gini:  0.8183654

Confusion Matrix for F1-optimal threshold:
             0    1    Error           Rate
0      1175706 1162 0.000987  =1162/1176868
1         5124 1755 0.744876     =5124/6879
Totals 1180830 2917 0.005310  =6286/1183747

Maximum Metrics: Maximum metrics at their respective thresholds
                        metric threshold    value idx
1                       max f1  0.152173 0.358310 154
2                       max f2  0.036121 0.329458 257
3                 max f0point5  0.238677 0.510071 119
4                 max accuracy  0.238677 0.995104 119
5                max precision  0.850323 1.000000   0
6                   max recall  0.001081 1.000000 399
7              max specificity  0.850323 1.000000   0
8             max absolute_mcc  0.238677 0.406623 119
9   max min_per_class_accuracy  0.006617 0.846430 344
10 max mean_per_class_accuracy  0.009258 0.858165 329

Gains/Lift Table: Extract with `h2o.gainsLift(<model>, <data>)` or `h2o.gainsLift(<model>, valid=<T/F>, xval=<T/F>)`
Cross-Validation Metrics Summary: 
                                mean           sd   cv_1_valid  cv_2_valid   cv_3_valid   cv_4_valid   cv_5_valid
accuracy                   0.9947379 1.1968301E-4    0.9946019   0.9949018    0.9944752    0.9948807      0.99483
auc                        0.9093102 0.0035041026    0.9087483   0.8999014    0.9129417    0.9119037   0.91305614
err                      0.005262104 1.1968301E-4 0.0053980993 0.005098248 0.0055248383  0.005119324 0.0051700105
err_count                     1245.8    28.335136       1278.0      1207.0       1308.0       1212.0       1224.0
f0point5                  0.48031983  0.014407468   0.46811223   0.5020979   0.44642857   0.49448955   0.49047086
f1                        0.36141068 0.0064129485   0.36481112    0.372987   0.34534535   0.36008447   0.36382535
f2                          0.289886  0.004918858   0.29885992  0.29669422   0.28158668   0.28312853    0.2891606
lift_top_group             36.770725   0.56126785     36.83815   36.646496     35.89343    36.256878    38.218674
logloss                  0.024331177  9.293634E-5  0.024325082 0.024464801  0.024461273  0.024298197   0.02410653
max_per_class_error        0.7438574  0.004878944    0.7332849  0.73890907   0.74927324    0.7521802   0.74563956
mcc                       0.39487585  0.009777933    0.3900154  0.41081858   0.37057567   0.40194842    0.4010212
mean_per_class_accuracy    0.6275989  0.002420052   0.63278615   0.6301397   0.62477493    0.6235339   0.62675965
mean_per_class_error      0.37240115  0.002420052   0.36721388   0.3698603   0.37522507   0.37646613   0.37324038
mse                     0.0049051815 1.0191514E-5 0.0048984317 0.004882799 0.0049257204 0.0049135624  0.004905393
precision                  0.6162842  0.029887136     0.577044  0.65272725    0.5546624    0.6583012    0.6386861
r2                        0.15097684 0.0016339438   0.15226498  0.15436657   0.14754593    0.1496464    0.1510603
recall                     0.2561426  0.004878944    0.2667151   0.2610909   0.25072673   0.24781977   0.25436047
rmse                     0.070036925  7.276634E-5  0.069988795  0.06987703   0.07018348  0.070096806   0.07003851
specificity               0.99905515 1.2599876E-4   0.99885714  0.99918854   0.99882317     0.999248    0.9991588

Scoring History: 
             timestamp     duration number_of_trees training_rmse training_logloss training_auc training_lift training_classification_error
1  2016-10-28 21:26:00  2:18:32.584               0                                                                                        
2  2016-10-28 21:28:42  2:21:14.395              17       0.07090          0.02633      0.87613      35.52683                       0.00607
3  2016-10-28 21:31:58  2:24:30.425              37       0.07028          0.02500      0.90166      37.88172                       0.00533
4  2016-10-28 21:35:39  2:28:11.314              60       0.06997          0.02449      0.90627      39.43711                       0.00513
5  2016-10-28 21:39:32  2:32:03.750              84       0.06992          0.02440      0.90723      39.91681                       0.00525
6  2016-10-28 21:43:19  2:35:51.061             108       0.06990          0.02427      0.90813      40.87620                       0.00518
7  2016-10-28 21:47:29  2:40:01.606             134       0.06990          0.02428      0.90856      40.46919                       0.00531
8  2016-10-28 21:52:00  2:44:32.651             162       0.06993          0.02430      0.90858      40.16392                       0.00526
9  2016-10-28 21:56:54  2:49:26.446             193       0.06992          0.02426      0.90887      39.90227                       0.00529
10 2016-10-28 21:58:28  2:50:59.852             200       0.06994          0.02428      0.90878      39.71330                       0.00528

Variable Importances: (Extract with `h2o.varimp`) 
=================================================

Variable Importances: 
                                 variable relative_importance scaled_importance percentage
1                          sameL0_Number1        12493.697266          1.000000   0.116993
2                                     GF1         6015.967773          0.481520   0.056335
3                          sameL3_Number1         4925.621582          0.394249   0.046124
4 CATEGORICAL_out_out_L3_S32_F3854_class2         3549.116211          0.284073   0.033235
5                  CATEGORICAL_Last_____1         2807.025635          0.224675   0.026285

---
        variable relative_importance scaled_importance percentage
855 L1_S24_F1391            0.019414          0.000002   0.000000
856 L3_S41_F4000            0.000000          0.000000   0.000000
857 L1_S24_F1202            0.000000          0.000000   0.000000
858 L3_S37_F3950            0.000000          0.000000   0.000000
859 L1_S25_F1909            0.000000          0.000000   0.000000
860 L1_S25_F2041            0.000000          0.000000   0.000000


Fold 1: AUC=0.8999039
Fold 2: AUC=0.9128266
Fold 3: AUC=0.9118182
Fold 4: AUC=0.9130653
Fold 5: AUC=0.9089576
AUC: 0.9093143 + 0.005508142
Average AUC using all data: 0.9091711


Fold 1: MCC=0.4286653 (361 [26.25%] positives), threshold=0.2300147
Fold 2: MCC=0.395651 (351 [25.51%] positives), threshold=0.2269448
Fold 3: MCC=0.4142212 (386 [28.05%] positives), threshold=0.2180384
Fold 4: MCC=0.4081681 (454 [32.99%] positives), threshold=0.1784959
Fold 5: MCC=0.4125435 (423 [30.74%] positives), threshold=0.1958189
MCC: 0.4118498 + 0.01188298
Positives: 395 + 43.12192
Detection Rate: 0.2871021 + 0.03130109
Average MCC on all data (5 fold): 0.2282159, threshold=0.4118498
Average MCC using all data: 0.4067412, threshold=0.2373816


Submission overfitted threshold on all MCC positives: 1802

Submission average validated threshold on all MCC positives: 482

Submission average of overfit+validated threshold positives: 988

```
