Detailed:

| Date | Model | Data | Parameters | Rounds | Train(M/SD) | Test(M/SD) | LB |
| :---: | --- | --- | --- | :---: | :---: | :---: | :---: |
| yes | yes | yes | yes | yes | yes | yes | yes |
| 09/29/2016 | 20160929 <br> xgb<br>superlarge.R | Mini num <br> Mini cat <br> Date 0927 <br> ƒt=337 <br> ƒr=102 <br> ƒe=235 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 11 | 311 <br> 384 <br> 277 <br> 378 <br> 333 | AUC <br> f1 0.959304 <br> f2 0.970204 <br> f3 0.940093 <br> f4 0.970141 <br> f5 0.953742 | AUC <br> f1 0.756335 <br> f2 0.762150 <br> f3 0.748110 <br> f4 0.750379 <br> f5 0.750467 <br> <br> MCC <br> f1 0.2905034 <br> f2 0.270387 <br> f3 0.2756896 <br> f4 0.2702875 <br> f5 0.2713472 | 1 ? <br> 2 ? <br> 3 ? <br> 4 ? |
| 09/28/2016 | 20160928 <br> xgb<br>superlarge.R | Mini num <br> Mini cat <br> Date 0927 <br> ƒt=336 <br> ƒr=101 <br> ƒe=235 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 11 | 319 <br> 438 <br> 507 <br> 412 <br> 314 | AUC <br> f1 0.958258 <br> f2 0.973816 <br> f3 0.973514 <br> f4 0.971696 <br> f5 0.948632 | AUC <br> f1 0.759470 <br> f2 0.761541 <br> f3 0.750555 <br> f4 0.754177 <br> f5 0.750378 <br> <br> MCC <br> f1 0.2927757 <br> f2 0.2708237 <br> f3 0.2793473 <br> f4 0.2707781 <br> f5 0.2736898 | 1 **0.26912** <br> 2 ? <br> 3 ? <br> 4 ? |
| 09/27/2016 | 20160927 <br> xgb_first.R | Mini num <br> Mini cat <br> Date 0927 <br> ƒt=330 <br> ƒr=105 <br> ƒe=225 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 11 | 319 <br> 392 <br> 284 <br> 358 <br> 279 | AUC <br> f1 0.957097 <br> f2 0.960476 <br> f3 0.940905 <br> f4 0.962042 <br> f5 0.939429 | AUC <br> f1 0.757806 <br> f2 0.760574 <br> f3 0.745697 <br> f4 0.754109 <br> f5 0.750973 <br> <br> MCC <br> f1 0.2938706 <br> f2 0.2711243 <br> f3 0.2765231 <br> f4 0.2685868 <br> f5 0.2736996 | 1 **0.26818** <br> 2 0.26021 <br> 3 0.26773 <br> 4 ? |
| 09/26/2016 | 20160925 <br> xgb_first.R | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 10 | 241 <br> 392 <br> 332 <br> 291 <br> 352 | AUC <br> f1 0.890908 <br> f2 0.946415 <br> f3 0.930391 <br> f4 0.926381 <br> f5 0.935947 | AUC <br> f1 0.748642 <br> f2 0.757684 <br> f3 0.738047 <br> f4 0.738045 <br> f5 0.740936 <br> <br> MCC <br> f1 0.2729738 <br> f2 0.2489975 <br> f3 0.2462972 <br> f4 0.2509157 <br> f5 0.2519139 | **1 0.25325** <br> 2 0.25170 <br> **3 0.25325** <br> 4 0.25181 |
| 09/25/2016 | 5cv<br>raw_all<br>fold<br>10depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 10 | 241 <br> 392 <br> 30 <br> 291 <br> 37 | Need retraining | Need retraining | None |
| 09/24/2016 | 5cv<br>raw_all<br>8depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 8 | 131 | MCC <br> 0.377849 <br> 0.003956 | MCC <br> 0.254204 <br> 0.007502 | None |
| 09/24/2016 | 5cv<br>raw_all<br>12depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 12 | 131 | MCC <br>  0.443671 <br> 0.002146 |  MCC <br> 0.253824 <br> 0.009940 | None |
| 09/24/2016 | 5cv<br>raw_all<br>15depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 15 | 61 <br> (Stop.) | MCC <br>  0.430237 <br> 0.002979 | MCC <br>  0.238813 <br> 0.012041 | None |
| 09/24/2016 | 5cv<br>raw_all<br>10depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 10 | 141 | MCC <br>  0.421739 <br> 0.004081 | MCC <br>  0.256067 <br> 0.008422 | None |
| 09/24/2016 | 5cv<br>raw_all<br>5depth | All cleaned <br> ƒt=~1100 <br> ƒr=~1100 <br> ƒe=0 | CV = 5-fold <br> Eta = 0.025 <br> Depth = 5 | 47 | MCC <br>  0.242187 <br> 0.002459 | MCC <br>  0.236419 <br> 0.008560 | None |

Summary:

| Date | Name | Output |
| --- | --- | --- ||
| 09/29/2016 | 20160929_xgb_superlarge.md | MCC: 0.2756429 + 0.008596407, **LB: ?** |
| 09/28/2016 | 20160928_xgb_superlarge.md | MCC: 0.2774829 + 0.009233539, **LB: 0.26912** |
| 09/27/2016 | 20160927_xgb_first.md | MCC: 0.2767609 + 0.01000946, **LB: 0.26818** |
| 09/26/2016 | 20160926_xgb_first_errored.md | MCC: 0.2492977 + 0.01117867 **optimizer code error** |
| 09/26/2016 | 20160925_xgb_first.md | mcc: 0.25981296 + 0.01070031, **LB: 0.25325** |
| 09/25/2016 | 5cv_raw_all_fold_10depth.md | Need retraining of fold 3 and fold 5 |
| 09/24/2016 | 5cv_raw_all_8depth.md | [172]	train-mcc:0.377849+0.003956	test-mcc:0.254204+0.007502 |
| 09/24/2016 | 5cv_raw_all_12depth.md | [131]	train-mcc:0.443671+0.002146	test-mcc:0.253824+0.009940 |
| 09/24/2016 | 5cv_raw_all_15depth.md | [61]	train-mcc:0.430237+0.002979	test-mcc:0.238813+0.012041  |
| 09/24/2016 | 5cv_raw_all_10depth.md | [141]   train-mcc:0.421739+0.004081 test-mcc:0.256067+0.008422 |
| 09/24/2016 | 5cv_raw_all_5depth.md | [47]    train-mcc:0.242187+0.002459 test-mcc:0.236419+0.008560 |
