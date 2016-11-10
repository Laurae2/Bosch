```r
Fold 1: AUC=0.9139547
Fold 2: AUC=0.9224534
Fold 3: AUC=0.9190571
Fold 4: AUC=0.9199518
Fold 5: AUC=0.9180267
AUC: 0.9186887 + 0.0031126
Average AUC using all data: 0.9033333


Fold 1: MCC=0.4779532 (0534 [38.84%] positives), threshold=0.3657650 => True positives = 76.966%
Fold 2: MCC=0.4779200 (0440 [31.98%] positives), threshold=0.4881340 => True positives = 84.773%
Fold 3: MCC=0.4821510 (0558 [40.55%] positives), threshold=0.3502290 => True positives = 75.986%
Fold 4: MCC=0.4768381 (0565 [41.06%] positives), threshold=0.3611900 => True positives = 74.690%
Fold 5: MCC=0.4794780 (0551 [40.04%] positives), threshold=0.3457830 => True positives = 76.044%
MCC: 0.4788680 + 0.0020619
Threshold: 0.3822202 + 0.0597534
Positives: 529.60 + 051.39
Detection Rate %: 38.494 + 03.736
True positives %: 77.692 + 04.041
Undetected positives: 0966.00 + 0021.18
Average MCC on all data (5 fold): 0.4739485, threshold=0.3822202
Average MCC using all data: 0.4768958, threshold=0.3558260


Submission overfitted threshold on all MCC positives: 2828

Submission average validated threshold on all MCC positives: 2658

Submission average of overfit+validated threshold positives: 2741




Analzying and ranking predictions...

Fold 1: preds=0.005137836+0.04012469 => ranked=0.5130801+0.2847845
Fold 2: preds=0.007063114+0.03913873 => ranked=0.5032543+0.2874493
Fold 3: preds=0.00876905+0.03904218 => ranked=0.5041053+0.2854243
Fold 4: preds=0.007444741+0.04005168 => ranked=0.5045307+0.2884149
Fold 5: preds=0.007106651+0.03948432 => ranked=0.502077+0.28751
Fold 1: AUC=0.9139547
Fold 2: AUC=0.9224534
Fold 3: AUC=0.9190571
Fold 4: AUC=0.9199518
Fold 5: AUC=0.9180267
AUC: 0.9186887 + 0.0031126
Average AUC using all data: 0.9188582


Fold 1: MCC=0.4779532 (0534 [38.84%] positives), threshold=0.9976670 => True positives = 76.966%
Fold 2: MCC=0.4779200 (0440 [31.98%] positives), threshold=0.9981000 => True positives = 84.773%
Fold 3: MCC=0.4821510 (0558 [40.55%] positives), threshold=0.9975466 => True positives = 75.986%
Fold 4: MCC=0.4768381 (0565 [41.06%] positives), threshold=0.9975903 => True positives = 74.690%
Fold 5: MCC=0.4794780 (0551 [40.04%] positives), threshold=0.9975727 => True positives = 76.044%
MCC: 0.4788680 + 0.0020619
Threshold: 0.9976953 + 0.0002306
Positives: 529.60 + 051.39
Detection Rate %: 38.494 + 03.736
True positives %: 77.692 + 04.041
Undetected positives: 0966.00 + 0021.18
Average MCC on all data (5 fold): 0.4745700, threshold=0.9976953
Average MCC using all data: 0.4773795, threshold=0.9975825


Scaled Submission overfitted threshold on all MCC positives: 2732

Scaled Submission average validated threshold on all MCC positives: 2608

Scaled Submission average of overfit+validated threshold positives: 2679

```
