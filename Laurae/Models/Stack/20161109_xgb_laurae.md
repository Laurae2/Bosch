```r
Fold 1: AUC=0.9129105
Fold 2: AUC=0.9241193
Fold 3: AUC=0.9211747
Fold 4: AUC=0.9215586
Fold 5: AUC=0.9233108
AUC: 0.9206148 + 0.0044752
Average AUC using all data: 0.8340672


Fold 1: MCC=0.4839821 (0526 [38.25%] positives), threshold=0.0990049 => True positives = 78.517%
Fold 2: MCC=0.4878644 (0505 [36.70%] positives), threshold=0.4081620 => True positives = 80.792%
Fold 3: MCC=0.4972573 (0555 [40.33%] positives), threshold=0.3740273 => True positives = 78.559%
Fold 4: MCC=0.4835930 (0658 [47.82%] positives), threshold=0.1139461 => True positives = 70.213%
Fold 5: MCC=0.4905407 (0459 [33.36%] positives), threshold=0.4308281 => True positives = 85.185%
MCC: 0.4886475 + 0.0056045
Threshold: 0.2851937 + 0.1644795
Positives: 540.60 + 074.38
Detection Rate %: 39.293 + 05.404
True positives %: 78.653 + 05.443
Undetected positives: 0953.80 + 0027.46
Average MCC on all data (5 fold): 0.3698785, threshold=0.2851937
Average MCC using all data: 0.4078421, threshold=0.1172604


Submission overfitted threshold on all MCC positives: 6876

Submission average validated threshold on all MCC positives: 2652

Submission average of overfit+validated threshold positives: 3689

Submission with all data overfitted threshold on all MCC positives: 11142. Threshold=0.1172604

Submission with all data average validated threshold on all MCC positives: 3701. Threshold=0.2851937

Submission with all data average of overfit+validated threshold positives: 5077. Threshold=0.201227

Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: 6876. Threshold=0.1589625

Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: 2652. Threshold=0.4191997

Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: 3689. Threshold=0.2865594

Submission with all data by taking the sum of positives of validated positives: 2703. Threshold=0.4113261

```
