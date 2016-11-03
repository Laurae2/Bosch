```r
Fold 1: AUC=0.9139023
Fold 2: AUC=0.9224098
Fold 3: AUC=0.9189595
Fold 4: AUC=0.9198933
Fold 5: AUC=0.9182152
AUC: 0.9186760 + 0.0031026
Average AUC using all data: 0.9026481


Fold 1: MCC=0.4755268 (0529 [38.47%] positives), threshold=0.3832710 => True positives = 76.938%
Fold 2: MCC=0.4764341 (0457 [33.21%] positives), threshold=0.4765030 => True positives = 82.932%
Fold 3: MCC=0.4802754 (0589 [42.81%] positives), threshold=0.3298140 => True positives = 73.684%
Fold 4: MCC=0.4763470 (0545 [39.61%] positives), threshold=0.3716300 => True positives = 75.963%
Fold 5: MCC=0.4826824 (0624 [45.35%] positives), threshold=0.3042710 => True positives = 71.955%
MCC: 0.4782532 + 0.0030856
Threshold: 0.3730978 + 0.0659714
Positives: 548.80 + 063.45
Detection Rate %: 39.889 + 04.609
True positives %: 76.294 + 04.190
Undetected positives: 0959.20 + 0026.68
Average MCC on all data (5 fold): 0.4741576, threshold=0.3730978
Average MCC using all data: 0.4757086, threshold=0.3301850


Submission with all data overfitted threshold on all MCC positives: 1266. Threshold=0.330185

Submission with all data average validated threshold on all MCC positives: 972. Threshold=0.3730978

Submission with all data average of overfit+validated threshold positives: 1118. Threshold=0.3516414

Submission with all data by taking the sum of positives of validated positives: 2744. Threshold=0.207841

```
