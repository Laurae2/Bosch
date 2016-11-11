```r
Fold 1: AUC=0.9147429
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9237734
Fold 5: AUC=0.9216729
AUC: 0.9209782 + 0.0037594
Average AUC using all data: 0.9178914


Fold 1: MCC=0.4805645 (0424 [30.84%] positives), threshold=0.4263045 => True positives = 86.792%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.3097825 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.3104649 => True positives = 77.215%
Fold 4: MCC=0.4770994 (0647 [47.02%] positives), threshold=0.2747028 => True positives = 69.861%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.3006321 => True positives = 75.731%
MCC: 0.4829017 + 0.0058417
Threshold: 0.3243773 + 0.0587944
Positives: 555.80 + 081.64
Detection Rate %: 40.397 + 05.924
True positives %: 76.798 + 06.227
Undetected positives: 0953.00 + 0031.93
Average MCC on all data (5 fold): 0.4760334, threshold=0.3243773
Average MCC using all data: 0.4786433, threshold=0.3109376


Submission overfitted threshold on all MCC positives: 2944

Submission average validated threshold on all MCC positives: 2831

Submission average of overfit+validated threshold positives: 2894




Analzying and ranking predictions...

Fold 1: preds=0.006712789+0.03738636 => ranked=0.5008984+0.2875025
Fold 2: preds=0.006092059+0.03786933 => ranked=0.5037339+0.2871901
Fold 3: preds=0.006160648+0.03790016 => ranked=0.5026694+0.2885502
Fold 4: preds=0.005895216+0.03908479 => ranked=0.4985064+0.2907814
Fold 5: preds=0.005722469+0.0390358 => ranked=0.5029434+0.2890951
Fold 1: AUC=0.9147429
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9237734
Fold 5: AUC=0.9216729
AUC: 0.9209782 + 0.0037594
Average AUC using all data: 0.9209701


Fold 1: MCC=0.4805645 (0424 [30.84%] positives), threshold=0.9981105 => True positives = 86.792%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.9975023 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.9975868 => True positives = 77.215%
Fold 4: MCC=0.4770994 (0647 [47.02%] positives), threshold=0.9971637 => True positives = 69.861%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.9974227 => True positives = 75.731%
MCC: 0.4829017 + 0.0058417
Threshold: 0.9975572 + 0.0003475
Positives: 555.80 + 081.64
Detection Rate %: 40.397 + 05.924
True positives %: 76.798 + 06.227
Undetected positives: 0953.00 + 0031.93
Average MCC on all data (5 fold): 0.4768089, threshold=0.9975572
Average MCC using all data: 0.4771087, threshold=0.9975283


Scaled Submission overfitted threshold on all MCC positives: 2883

Scaled Submission average validated threshold on all MCC positives: 2846

Scaled Submission average of overfit+validated threshold positives: 2867

```
