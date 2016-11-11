```r
Fold 1: AUC=0.9195454
Fold 2: AUC=0.9255311
Fold 3: AUC=0.9247044
Fold 4: AUC=0.9249482
Fold 5: AUC=0.9220735
AUC: 0.9233605 + 0.0025125
Average AUC using all data: 0.9051450


Fold 1: MCC=0.4843855 (0483 [35.13%] positives), threshold=0.4367919 => True positives = 81.988%
Fold 2: MCC=0.4858801 (0547 [39.75%] positives), threshold=0.3547577 => True positives = 77.331%
Fold 3: MCC=0.4986087 (0542 [39.39%] positives), threshold=0.3779408 => True positives = 79.705%
Fold 4: MCC=0.4844070 (0653 [47.46%] positives), threshold=0.1436114 => True positives = 70.597%
Fold 5: MCC=0.4956660 (0616 [44.77%] positives), threshold=0.1439855 => True positives = 74.351%
MCC: 0.4897895 + 0.0068149
Threshold: 0.2914175 + 0.1380351
Positives: 568.20 + 066.84
Detection Rate %: 41.299 + 04.849
True positives %: 76.794 + 04.475
Undetected positives: 0941.80 + 0026.45
Average MCC on all data (5 fold): 0.4650207, threshold=0.2914175
Average MCC using all data: 0.4689496, threshold=0.3570301


Submission overfitted threshold on all MCC positives: 2360

Submission average validated threshold on all MCC positives: 2841

Submission average of overfit+validated threshold positives: 2607

Submission with all data overfitted threshold on all MCC positives: 3117. Threshold=0.3570301

Submission with all data average validated threshold on all MCC positives: 3697. Threshold=0.2914175

Submission with all data average of overfit+validated threshold positives: 3382. Threshold=0.3242238

Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: 2360. Threshold=0.4819945

Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: 2841. Threshold=0.4038062

Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: 2607. Threshold=0.4435776

Submission with all data by taking the sum of positives of validated positives: 2841. Threshold=0.4038062

Submission on selected amount of positives: 3164. Threshold=0.351241
It needs 01.49% TP to hold true.

```
