```r
Fold 1: AUC=0.9147429
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9185143
Fold 5: AUC=0.9216729
AUC: 0.9199264 + 0.0035093
Average AUC using all data: 0.9056814


Fold 1: MCC=0.4805645 (0424 [30.84%] positives), threshold=0.4263045 => True positives = 86.792%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.3097825 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.3104649 => True positives = 77.215%
Fold 4: MCC=0.4751952 (0445 [32.34%] positives), threshold=0.3769010 => True positives = 83.820%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.3006321 => True positives = 75.731%
MCC: 0.4825209 + 0.0063542
Threshold: 0.3448170 + 0.0548393
Positives: 515.40 + 074.94
Detection Rate %: 37.461 + 05.439
True positives %: 79.590 + 05.416
Undetected positives: 0968.80 + 0033.50
Average MCC on all data (5 fold): 0.4743282, threshold=0.3448170
Average MCC using all data: 0.4777558, threshold=0.3097825


Submission overfitted threshold on all MCC positives: 6438

Submission average validated threshold on all MCC positives: 4675

Submission average of overfit+validated threshold positives: 5398




Analzying and ranking predictions...

Fold 1: preds=0.006712789+0.03738636 => ranked=0.5008984+0.2875025
Fold 2: preds=0.006092059+0.03786933 => ranked=0.5037339+0.2871901
Fold 3: preds=0.006160648+0.03790016 => ranked=0.5026694+0.2885502
Fold 4: preds=0.01122234+0.03661458 => ranked=0.5020836+0.2877377
Fold 5: preds=0.005722469+0.0390358 => ranked=0.5029434+0.2890951
Fold 1: AUC=0.9147429
Fold 2: AUC=0.9240228
Fold 3: AUC=0.9206791
Fold 4: AUC=0.9185143
Fold 5: AUC=0.9216729
AUC: 0.9199264 + 0.0035093
Average AUC using all data: 0.9199196


Fold 1: MCC=0.4805645 (0424 [30.84%] positives), threshold=0.9981105 => True positives = 86.792%
Fold 2: MCC=0.4786843 (0574 [41.72%] positives), threshold=0.9975023 => True positives = 74.390%
Fold 3: MCC=0.4878073 (0553 [40.19%] positives), threshold=0.9975868 => True positives = 77.215%
Fold 4: MCC=0.4751952 (0445 [32.34%] positives), threshold=0.9980549 => True positives = 83.820%
Fold 5: MCC=0.4903530 (0581 [42.22%] positives), threshold=0.9974227 => True positives = 75.731%
MCC: 0.4825209 + 0.0063542
Threshold: 0.9977354 + 0.0003229
Positives: 515.40 + 074.94
Detection Rate %: 37.461 + 05.439
True positives %: 79.590 + 05.416
Undetected positives: 0968.80 + 0033.50
Average MCC on all data (5 fold): 0.4748932, threshold=0.9977354
Average MCC using all data: 0.4770232, threshold=0.9976163


Scaled Submission overfitted threshold on all MCC positives: 2775

Scaled Submission average validated threshold on all MCC positives: 2629

Scaled Submission average of overfit+validated threshold positives: 2691

```
