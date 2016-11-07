```r
Fold 1: AUC=0.9144546
Fold 2: AUC=0.9203187
Fold 3: AUC=0.9190574
Fold 4: AUC=0.9213011
Fold 5: AUC=0.9113431
AUC: 0.9172950 + 0.0042364
Average AUC using all data: 0.8677158


Fold 1: MCC=0.4705996 (0491 [35.71%] positives), threshold=0.4001370 => True positives = 79.022%
Fold 2: MCC=0.4791950 (0498 [36.19%] positives), threshold=0.4030400 => True positives = 79.920%
Fold 3: MCC=0.4925062 (0605 [43.97%] positives), threshold=0.3300030 => True positives = 74.545%
Fold 4: MCC=0.4826072 (0704 [51.16%] positives), threshold=0.2595420 => True positives = 67.756%
Fold 5: MCC=0.4735661 (0674 [48.98%] positives), threshold=0.2982960 => True positives = 67.953%
MCC: 0.4796948 + 0.0085608
Threshold: 0.3382036 + 0.0630219
Positives: 594.40 + 098.04
Detection Rate %: 43.203 + 07.118
True positives %: 73.839 + 05.831
Undetected positives: 0941.40 + 0038.84
Average MCC on all data (5 fold): 0.4731041, threshold=0.3382036
Average MCC using all data: 0.4754932, threshold=0.4032560


Submission overfitted threshold on all MCC positives: 2385

Submission average validated threshold on all MCC positives: 2784

Submission average of overfit+validated threshold positives: 2565

Submission with all data overfitted threshold on all MCC positives: 2406. Threshold=0.403256

Submission with all data average validated threshold on all MCC positives: 2778. Threshold=0.3382036

Submission with all data average of overfit+validated threshold positives: 2596. Threshold=0.3707298

Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: 2385. Threshold=0.409369

Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: 2784. Threshold=0.337607

Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: 2565. Threshold=0.375619

Submission with all data by taking the sum of positives of validated positives: 2972. Threshold=0.313431

```
