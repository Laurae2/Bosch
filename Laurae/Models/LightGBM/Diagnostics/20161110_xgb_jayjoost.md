```r
Fold 1: AUC=0.9059004
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9185143
Fold 5: AUC=0.9216729
AUC: 0.9181579 + 0.0071323
Average AUC using all data: 0.8903005


Fold 1: MCC=0.4781677 (0493 [35.85%] positives), threshold=0.2803099 => True positives = 80.122%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.3097825 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.3104649 => True positives = 77.215%
Fold 4: MCC=0.4751952 (0445 [32.34%] positives), threshold=0.3769010 => True positives = 83.820%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.3006321 => True positives = 75.731%
MCC: 0.4820415 + 0.0066234
Threshold: 0.3156181 + 0.0363574
Positives: 529.20 + 058.43
Detection Rate %: 38.465 + 04.242
True positives %: 78.256 + 03.770
Undetected positives: 0963.40 + 0027.43
Average MCC on all data (5 fold): 0.4754338, threshold=0.3156181
Average MCC using all data: 0.4771954, threshold=0.3006712


Submission overfitted threshold on all MCC positives: 2857

Submission average validated threshold on all MCC positives: 2725

Submission average of overfit+validated threshold positives: 2790




Analzying and ranking predictions...

Fold 1: preds=0.02985862+0.03277164 => ranked=0.4996309+0.2748344
Fold 2: preds=0.006092059+0.03786933 => ranked=0.5037339+0.2871901
Fold 3: preds=0.006160648+0.03790016 => ranked=0.5026694+0.2885502
Fold 4: preds=0.01122234+0.03661458 => ranked=0.5020836+0.2877377
Fold 5: preds=0.005722469+0.0390358 => ranked=0.5029434+0.2890951
Fold 1: AUC=0.9059004
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9185143
Fold 5: AUC=0.9216729
AUC: 0.9181579 + 0.0071323
Average AUC using all data: 0.9182306


Fold 1: MCC=0.4781677 (0493 [35.85%] positives), threshold=0.9978163 => True positives = 80.122%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.9975023 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.9975868 => True positives = 77.215%
Fold 4: MCC=0.4751952 (0445 [32.34%] positives), threshold=0.9980549 => True positives = 83.820%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.9974227 => True positives = 75.731%
MCC: 0.4820415 + 0.0066234
Threshold: 0.9976766 + 0.0002576
Positives: 529.20 + 058.43
Detection Rate %: 38.465 + 04.242
True positives %: 78.256 + 03.770
Undetected positives: 0963.40 + 0027.43
Average MCC on all data (5 fold): 0.4750198, threshold=0.9976766
Average MCC using all data: 0.4766139, threshold=0.9976248


Scaled Submission overfitted threshold on all MCC positives: 2739

Scaled Submission average validated threshold on all MCC positives: 2661

Scaled Submission average of overfit+validated threshold positives: 2700

```
