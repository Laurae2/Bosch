

===




Iteration 1[1] on Thu Nov 10 2016 05:01:27 AM

depth=7, min_child_weight=7.84951, subsample=0.6390618, colsample_bytree=0.7565791, base_score=0.3805139
[1]	train-mcc:0.000000	test-mcc:0.465349 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472062 
[3]	train-mcc:0.000000	test-mcc:0.475469 
[4]	train-mcc:0.000000	test-mcc:0.479270 
[5]	train-mcc:0.000000	test-mcc:0.479487 
[6]	train-mcc:0.000000	test-mcc:0.480297 
[7]	train-mcc:0.000000	test-mcc:0.480104 
[8]	train-mcc:0.000000	test-mcc:0.481621 
[9]	train-mcc:0.000000	test-mcc:0.480182 
[10]	train-mcc:0.000000	test-mcc:0.479006 
[11]	train-mcc:0.000000	test-mcc:0.479850 
[12]	train-mcc:0.000000	test-mcc:0.479371 
[13]	train-mcc:0.000000	test-mcc:0.479823 
[14]	train-mcc:0.000000	test-mcc:0.479685 
[15]	train-mcc:0.000000	test-mcc:0.480565 
[16]	train-mcc:0.000000	test-mcc:0.479908 
[17]	train-mcc:0.000000	test-mcc:0.480676 
[18]	train-mcc:0.000000	test-mcc:0.477727 
[19]	train-mcc:0.000000	test-mcc:0.478089 
[20]	train-mcc:0.000000	test-mcc:0.477389 
[21]	train-mcc:0.000000	test-mcc:0.477944 
[22]	train-mcc:0.000000	test-mcc:0.477389 
[23]	train-mcc:0.000000	test-mcc:0.477340 
[24]	train-mcc:0.000000	test-mcc:0.476589 
[25]	train-mcc:0.000000	test-mcc:0.477996 
[26]	train-mcc:0.000000	test-mcc:0.478200 
[27]	train-mcc:0.000000	test-mcc:0.478872 
[28]	train-mcc:0.000000	test-mcc:0.478332 
[29]	train-mcc:0.000000	test-mcc:0.478087 
[30]	train-mcc:0.000000	test-mcc:0.478258 
[31]	train-mcc:0.000000	test-mcc:0.478258 
[32]	train-mcc:0.000000	test-mcc:0.478258 
[33]	train-mcc:0.000000	test-mcc:0.478581 
[34]	train-mcc:0.000000	test-mcc:0.479823 
[35]	train-mcc:0.000000	test-mcc:0.478679 
[36]	train-mcc:0.000000	test-mcc:0.478679 
[37]	train-mcc:0.000000	test-mcc:0.478679 
[38]	train-mcc:0.000000	test-mcc:0.479027 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.481621


Time: Thu Nov 10 2016 05:02:43 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4816209
Confusion matrix:
     truth
preds      0      1
    0 235258    964
    1    115    411
     truth
preds            0            1
    0 0.9937063882 0.0040718401
    1 0.0004857486 0.0017360231
Iteration 1 (base=0.3805139): MCC=0.4816209 | threshold=0.424705



Iteration 1[2] on Thu Nov 10 2016 05:02:44 AM

depth=7, min_child_weight=7.84951, subsample=0.6390618, colsample_bytree=0.7565791, base_score=0.3805139
[1]	train-mcc:0.000000	test-mcc:0.463066 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471863 
[3]	train-mcc:0.000000	test-mcc:0.477951 
[4]	train-mcc:0.000000	test-mcc:0.476986 
[5]	train-mcc:0.000000	test-mcc:0.478262 
[6]	train-mcc:0.000000	test-mcc:0.479755 
[7]	train-mcc:0.000000	test-mcc:0.477691 
[8]	train-mcc:0.000000	test-mcc:0.476425 
[9]	train-mcc:0.000000	test-mcc:0.477724 
[10]	train-mcc:0.000000	test-mcc:0.475736 
[11]	train-mcc:0.000000	test-mcc:0.477761 
[12]	train-mcc:0.000000	test-mcc:0.477619 
[13]	train-mcc:0.000000	test-mcc:0.479577 
[14]	train-mcc:0.000000	test-mcc:0.478305 
[15]	train-mcc:0.000000	test-mcc:0.478470 
[16]	train-mcc:0.000000	test-mcc:0.478283 
[17]	train-mcc:0.000000	test-mcc:0.477730 
[18]	train-mcc:0.000000	test-mcc:0.478283 
[19]	train-mcc:0.000000	test-mcc:0.476986 
[20]	train-mcc:0.000000	test-mcc:0.476986 
[21]	train-mcc:0.000000	test-mcc:0.476241 
[22]	train-mcc:0.000000	test-mcc:0.474949 
[23]	train-mcc:0.000000	test-mcc:0.475144 
[24]	train-mcc:0.000000	test-mcc:0.476611 
[25]	train-mcc:0.000000	test-mcc:0.476964 
[26]	train-mcc:0.000000	test-mcc:0.476518 
[27]	train-mcc:0.000000	test-mcc:0.477998 
[28]	train-mcc:0.000000	test-mcc:0.477750 
[29]	train-mcc:0.000000	test-mcc:0.479677 
[30]	train-mcc:0.000000	test-mcc:0.478466 
[31]	train-mcc:0.000000	test-mcc:0.477513 
[32]	train-mcc:0.000000	test-mcc:0.477013 
[33]	train-mcc:0.000000	test-mcc:0.477214 
[34]	train-mcc:0.000000	test-mcc:0.476598 
[35]	train-mcc:0.000000	test-mcc:0.477090 
[36]	train-mcc:0.000000	test-mcc:0.478051 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.479755


Time: Thu Nov 10 2016 05:04:00 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4797547
Confusion matrix:
     truth
preds      0      1
    0 235259    968
    1    114    408
     truth
preds            0            1
    0 0.9937064148 0.0040887184
    1 0.0004815226 0.0017233441
Iteration 1 (base=0.3805139): MCC=0.4797547 | threshold=0.4010698



Iteration 1[3] on Thu Nov 10 2016 05:04:01 AM

depth=7, min_child_weight=7.84951, subsample=0.6390618, colsample_bytree=0.7565791, base_score=0.3805139
[1]	train-mcc:0.000000	test-mcc:0.483565 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486603 
[3]	train-mcc:0.000000	test-mcc:0.489293 
[4]	train-mcc:0.000000	test-mcc:0.488145 
[5]	train-mcc:0.000000	test-mcc:0.489519 
[6]	train-mcc:0.000000	test-mcc:0.490224 
[7]	train-mcc:0.000000	test-mcc:0.487149 
[8]	train-mcc:0.000000	test-mcc:0.487293 
[9]	train-mcc:0.000000	test-mcc:0.488652 
[10]	train-mcc:0.000000	test-mcc:0.488960 
[11]	train-mcc:0.000000	test-mcc:0.487998 
[12]	train-mcc:0.000000	test-mcc:0.491742 
[13]	train-mcc:0.000000	test-mcc:0.492170 
[14]	train-mcc:0.000000	test-mcc:0.492599 
[15]	train-mcc:0.000000	test-mcc:0.492159 
[16]	train-mcc:0.000000	test-mcc:0.491512 
[17]	train-mcc:0.000000	test-mcc:0.493563 
[18]	train-mcc:0.000000	test-mcc:0.494261 
[19]	train-mcc:0.000000	test-mcc:0.494959 
[20]	train-mcc:0.000000	test-mcc:0.494676 
[21]	train-mcc:0.000000	test-mcc:0.495106 
[22]	train-mcc:0.000000	test-mcc:0.494261 
[23]	train-mcc:0.000000	test-mcc:0.495902 
[24]	train-mcc:0.000000	test-mcc:0.492436 
[25]	train-mcc:0.000000	test-mcc:0.491406 
[26]	train-mcc:0.000000	test-mcc:0.491824 
[27]	train-mcc:0.000000	test-mcc:0.492824 
[28]	train-mcc:0.000000	test-mcc:0.491721 
[29]	train-mcc:0.000000	test-mcc:0.492212 
[30]	train-mcc:0.000000	test-mcc:0.493360 
[31]	train-mcc:0.000000	test-mcc:0.494508 
[32]	train-mcc:0.000000	test-mcc:0.494508 
[33]	train-mcc:0.000000	test-mcc:0.493563 
[34]	train-mcc:0.000000	test-mcc:0.494015 
[35]	train-mcc:0.000000	test-mcc:0.493415 
[36]	train-mcc:0.000000	test-mcc:0.494308 
[37]	train-mcc:0.000000	test-mcc:0.495167 
[38]	train-mcc:0.000000	test-mcc:0.493739 
[39]	train-mcc:0.000000	test-mcc:0.495139 
[40]	train-mcc:0.000000	test-mcc:0.495139 
[41]	train-mcc:0.000000	test-mcc:0.495139 
[42]	train-mcc:0.000000	test-mcc:0.494439 
[43]	train-mcc:0.000000	test-mcc:0.494174 
[44]	train-mcc:0.000000	test-mcc:0.494174 
[45]	train-mcc:0.000000	test-mcc:0.493199 
[46]	train-mcc:0.000000	test-mcc:0.494414 
[47]	train-mcc:0.000000	test-mcc:0.493460 
[48]	train-mcc:0.000000	test-mcc:0.493892 
[49]	train-mcc:0.000000	test-mcc:0.491914 
[50]	train-mcc:0.000000	test-mcc:0.491027 
[51]	train-mcc:0.000000	test-mcc:0.491616 
[52]	train-mcc:0.000000	test-mcc:0.490346 
[53]	train-mcc:0.000000	test-mcc:0.490381 
Stopping. Best iteration:
[23]	train-mcc:0.000000	test-mcc:0.495902


Time: Thu Nov 10 2016 05:05:51 AM
For 0023 rounds: train_mcc: 0 - test_mcc: 0.495902
Confusion matrix:
     truth
preds      0      1
    0 235252    940
    1    122    436
     truth
preds            0            1
    0 0.9936726505 0.0039704329
    1 0.0005153115 0.0018416051
Iteration 1 (base=0.3805139): MCC=0.495902 | threshold=0.3804139



Iteration 1[4] on Thu Nov 10 2016 05:05:52 AM

depth=7, min_child_weight=7.84951, subsample=0.6390618, colsample_bytree=0.7565791, base_score=0.3805139
[1]	train-mcc:0.000000	test-mcc:0.454380 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.469238 
[3]	train-mcc:0.000000	test-mcc:0.473494 
[4]	train-mcc:0.000000	test-mcc:0.477495 
[5]	train-mcc:0.000000	test-mcc:0.478174 
[6]	train-mcc:0.000000	test-mcc:0.480260 
[7]	train-mcc:0.000000	test-mcc:0.481904 
[8]	train-mcc:0.000000	test-mcc:0.481599 
[9]	train-mcc:0.000000	test-mcc:0.481913 
[10]	train-mcc:0.000000	test-mcc:0.481260 
[11]	train-mcc:0.000000	test-mcc:0.480493 
[12]	train-mcc:0.000000	test-mcc:0.481188 
[13]	train-mcc:0.000000	test-mcc:0.482378 
[14]	train-mcc:0.000000	test-mcc:0.481144 
[15]	train-mcc:0.000000	test-mcc:0.481805 
[16]	train-mcc:0.000000	test-mcc:0.483593 
[17]	train-mcc:0.000000	test-mcc:0.481297 
[18]	train-mcc:0.000000	test-mcc:0.481986 
[19]	train-mcc:0.000000	test-mcc:0.483129 
[20]	train-mcc:0.000000	test-mcc:0.482965 
[21]	train-mcc:0.000000	test-mcc:0.483907 
[22]	train-mcc:0.000000	test-mcc:0.481929 
[23]	train-mcc:0.000000	test-mcc:0.481541 
[24]	train-mcc:0.000000	test-mcc:0.483056 
[25]	train-mcc:0.000000	test-mcc:0.481085 
[26]	train-mcc:0.000000	test-mcc:0.480818 
[27]	train-mcc:0.000000	test-mcc:0.480429 
[28]	train-mcc:0.000000	test-mcc:0.481108 
[29]	train-mcc:0.000000	test-mcc:0.480444 
[30]	train-mcc:0.000000	test-mcc:0.479676 
[31]	train-mcc:0.000000	test-mcc:0.480114 
[32]	train-mcc:0.000000	test-mcc:0.480245 
[33]	train-mcc:0.000000	test-mcc:0.479410 
[34]	train-mcc:0.000000	test-mcc:0.481085 
[35]	train-mcc:0.000000	test-mcc:0.480665 
[36]	train-mcc:0.000000	test-mcc:0.479541 
[37]	train-mcc:0.000000	test-mcc:0.479410 
[38]	train-mcc:0.000000	test-mcc:0.477549 
[39]	train-mcc:0.000000	test-mcc:0.477752 
[40]	train-mcc:0.000000	test-mcc:0.478147 
[41]	train-mcc:0.000000	test-mcc:0.479153 
[42]	train-mcc:0.000000	test-mcc:0.479153 
[43]	train-mcc:0.000000	test-mcc:0.479489 
[44]	train-mcc:0.000000	test-mcc:0.478466 
[45]	train-mcc:0.000000	test-mcc:0.478709 
[46]	train-mcc:0.000000	test-mcc:0.478484 
[47]	train-mcc:0.000000	test-mcc:0.478224 
[48]	train-mcc:0.000000	test-mcc:0.477976 
[49]	train-mcc:0.000000	test-mcc:0.479107 
[50]	train-mcc:0.000000	test-mcc:0.477691 
[51]	train-mcc:0.000000	test-mcc:0.478515 
Stopping. Best iteration:
[21]	train-mcc:0.000000	test-mcc:0.483907


Time: Thu Nov 10 2016 05:07:36 AM
For 0021 rounds: train_mcc: 0 - test_mcc: 0.4839067
Confusion matrix:
     truth
preds      0      1
    0 235231    944
    1    143    432
     truth
preds            0            1
    0 0.9935839493 0.0039873284
    1 0.0006040127 0.0018247096
Iteration 1 (base=0.3805139): MCC=0.4839067 | threshold=0.3434877



Iteration 1[5] on Thu Nov 10 2016 05:07:37 AM

depth=7, min_child_weight=7.84951, subsample=0.6390618, colsample_bytree=0.7565791, base_score=0.3805139
[1]	train-mcc:0.000000	test-mcc:0.476426 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482811 
[3]	train-mcc:0.000000	test-mcc:0.481304 
[4]	train-mcc:0.000000	test-mcc:0.483417 
[5]	train-mcc:0.000000	test-mcc:0.485311 
[6]	train-mcc:0.000000	test-mcc:0.488497 
[7]	train-mcc:0.000000	test-mcc:0.486439 
[8]	train-mcc:0.000000	test-mcc:0.486922 
[9]	train-mcc:0.000000	test-mcc:0.489715 
[10]	train-mcc:0.000000	test-mcc:0.490651 
[11]	train-mcc:0.000000	test-mcc:0.491850 
[12]	train-mcc:0.000000	test-mcc:0.492580 
[13]	train-mcc:0.000000	test-mcc:0.492340 
[14]	train-mcc:0.000000	test-mcc:0.490618 
[15]	train-mcc:0.000000	test-mcc:0.489352 
[16]	train-mcc:0.000000	test-mcc:0.488263 
[17]	train-mcc:0.000000	test-mcc:0.488691 
[18]	train-mcc:0.000000	test-mcc:0.490944 
[19]	train-mcc:0.000000	test-mcc:0.488320 
[20]	train-mcc:0.000000	test-mcc:0.488141 
[21]	train-mcc:0.000000	test-mcc:0.487550 
[22]	train-mcc:0.000000	test-mcc:0.486687 
[23]	train-mcc:0.000000	test-mcc:0.484609 
[24]	train-mcc:0.000000	test-mcc:0.486433 
[25]	train-mcc:0.000000	test-mcc:0.486656 
[26]	train-mcc:0.000000	test-mcc:0.485584 
[27]	train-mcc:0.000000	test-mcc:0.486413 
[28]	train-mcc:0.000000	test-mcc:0.488402 
[29]	train-mcc:0.000000	test-mcc:0.488422 
[30]	train-mcc:0.000000	test-mcc:0.488601 
[31]	train-mcc:0.000000	test-mcc:0.487396 
[32]	train-mcc:0.000000	test-mcc:0.487103 
[33]	train-mcc:0.000000	test-mcc:0.487361 
[34]	train-mcc:0.000000	test-mcc:0.486274 
[35]	train-mcc:0.000000	test-mcc:0.485350 
[36]	train-mcc:0.000000	test-mcc:0.485350 
[37]	train-mcc:0.000000	test-mcc:0.484321 
[38]	train-mcc:0.000000	test-mcc:0.485155 
[39]	train-mcc:0.000000	test-mcc:0.485301 
[40]	train-mcc:0.000000	test-mcc:0.486011 
[41]	train-mcc:0.000000	test-mcc:0.482913 
[42]	train-mcc:0.000000	test-mcc:0.482210 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.492580


Time: Thu Nov 10 2016 05:09:03 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4925796
Confusion matrix:
     truth
preds      0      1
    0 235257    948
    1    117    428
     truth
preds            0            1
    0 0.9936937698 0.0040042239
    1 0.0004941922 0.0018078141
Iteration 1 (base=0.3805139): MCC=0.4925796 | threshold=0.367993


===




Iteration 2[1] on Thu Nov 10 2016 05:09:12 AM

depth=11, min_child_weight=3.420967, subsample=0.6024163, colsample_bytree=0.6269928, base_score=0.3197737
[1]	train-mcc:0.000000	test-mcc:0.451000 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.463466 
[3]	train-mcc:0.000000	test-mcc:0.470928 
[4]	train-mcc:0.000000	test-mcc:0.467062 
[5]	train-mcc:0.000000	test-mcc:0.466131 
[6]	train-mcc:0.000000	test-mcc:0.466635 
[7]	train-mcc:0.000000	test-mcc:0.468440 
[8]	train-mcc:0.000000	test-mcc:0.470092 
[9]	train-mcc:0.000000	test-mcc:0.472368 
[10]	train-mcc:0.000000	test-mcc:0.469654 
[11]	train-mcc:0.000000	test-mcc:0.472344 
[12]	train-mcc:0.000000	test-mcc:0.471443 
[13]	train-mcc:0.000000	test-mcc:0.473848 
[14]	train-mcc:0.000000	test-mcc:0.472458 
[15]	train-mcc:0.000000	test-mcc:0.473139 
[16]	train-mcc:0.000000	test-mcc:0.473428 
[17]	train-mcc:0.000000	test-mcc:0.472820 
[18]	train-mcc:0.000000	test-mcc:0.472390 
[19]	train-mcc:0.000000	test-mcc:0.471828 
[20]	train-mcc:0.000000	test-mcc:0.471998 
[21]	train-mcc:0.000000	test-mcc:0.470673 
[22]	train-mcc:0.000000	test-mcc:0.471766 
[23]	train-mcc:0.000000	test-mcc:0.471766 
[24]	train-mcc:0.000000	test-mcc:0.473991 
[25]	train-mcc:0.000000	test-mcc:0.473053 
[26]	train-mcc:0.000000	test-mcc:0.472923 
[27]	train-mcc:0.000000	test-mcc:0.476097 
[28]	train-mcc:0.000000	test-mcc:0.474949 
[29]	train-mcc:0.000000	test-mcc:0.474257 
[30]	train-mcc:0.000000	test-mcc:0.475855 
[31]	train-mcc:0.000000	test-mcc:0.476844 
[32]	train-mcc:0.000000	test-mcc:0.476844 
[33]	train-mcc:0.000000	test-mcc:0.475676 
[34]	train-mcc:0.000000	test-mcc:0.475676 
[35]	train-mcc:0.000000	test-mcc:0.476230 
[36]	train-mcc:0.000000	test-mcc:0.475670 
[37]	train-mcc:0.000000	test-mcc:0.475983 
[38]	train-mcc:0.000000	test-mcc:0.476518 
[39]	train-mcc:0.000000	test-mcc:0.476340 
[40]	train-mcc:0.000000	test-mcc:0.476853 
[41]	train-mcc:0.000000	test-mcc:0.476853 
[42]	train-mcc:0.000000	test-mcc:0.477016 
[43]	train-mcc:0.000000	test-mcc:0.477016 
[44]	train-mcc:0.000000	test-mcc:0.477936 
[45]	train-mcc:0.000000	test-mcc:0.477366 
[46]	train-mcc:0.000000	test-mcc:0.477366 
[47]	train-mcc:0.000000	test-mcc:0.476053 
[48]	train-mcc:0.000000	test-mcc:0.476459 
[49]	train-mcc:0.000000	test-mcc:0.476944 
[50]	train-mcc:0.000000	test-mcc:0.475978 
[51]	train-mcc:0.000000	test-mcc:0.479610 
[52]	train-mcc:0.000000	test-mcc:0.478332 
[53]	train-mcc:0.000000	test-mcc:0.477054 
[54]	train-mcc:0.000000	test-mcc:0.479219 
[55]	train-mcc:0.000000	test-mcc:0.479219 
[56]	train-mcc:0.000000	test-mcc:0.478675 
[57]	train-mcc:0.000000	test-mcc:0.478612 
[58]	train-mcc:0.000000	test-mcc:0.478084 
[59]	train-mcc:0.000000	test-mcc:0.476207 
[60]	train-mcc:0.000000	test-mcc:0.476609 
[61]	train-mcc:0.000000	test-mcc:0.475997 
[62]	train-mcc:0.000000	test-mcc:0.476965 
[63]	train-mcc:0.000000	test-mcc:0.476029 
[64]	train-mcc:0.000000	test-mcc:0.474315 
[65]	train-mcc:0.000000	test-mcc:0.474602 
[66]	train-mcc:0.000000	test-mcc:0.474602 
[67]	train-mcc:0.000000	test-mcc:0.474603 
[68]	train-mcc:0.000000	test-mcc:0.474603 
[69]	train-mcc:0.000000	test-mcc:0.475251 
[70]	train-mcc:0.000000	test-mcc:0.473552 
[71]	train-mcc:0.000000	test-mcc:0.473408 
[72]	train-mcc:0.000000	test-mcc:0.473433 
[73]	train-mcc:0.000000	test-mcc:0.473795 
[74]	train-mcc:0.000000	test-mcc:0.474034 
[75]	train-mcc:0.000000	test-mcc:0.471983 
[76]	train-mcc:0.000000	test-mcc:0.472821 
[77]	train-mcc:0.000000	test-mcc:0.472062 
[78]	train-mcc:0.000000	test-mcc:0.473991 
[79]	train-mcc:0.000000	test-mcc:0.473991 
[80]	train-mcc:0.000000	test-mcc:0.473427 
[81]	train-mcc:0.000000	test-mcc:0.473631 
Stopping. Best iteration:
[51]	train-mcc:0.000000	test-mcc:0.479610


Time: Thu Nov 10 2016 05:13:33 AM
For 0051 rounds: train_mcc: 0 - test_mcc: 0.4796096
Confusion matrix:
     truth
preds      0      1
    0 235302    997
    1     71    378
     truth
preds            0            1
    0 0.9938922398 0.0042112288
    1 0.0002998969 0.0015966344
Iteration 2 (base=0.3197737): MCC=0.4796096 | threshold=0.586723



Iteration 2[2] on Thu Nov 10 2016 05:13:34 AM

depth=11, min_child_weight=3.420967, subsample=0.6024163, colsample_bytree=0.6269928, base_score=0.3197737
[1]	train-mcc:0.000000	test-mcc:0.447187 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.460344 
[3]	train-mcc:0.000000	test-mcc:0.462598 
[4]	train-mcc:0.000000	test-mcc:0.469691 
[5]	train-mcc:0.000000	test-mcc:0.475907 
[6]	train-mcc:0.000000	test-mcc:0.471884 
[7]	train-mcc:0.000000	test-mcc:0.470859 
[8]	train-mcc:0.000000	test-mcc:0.472171 
[9]	train-mcc:0.000000	test-mcc:0.479265 
[10]	train-mcc:0.000000	test-mcc:0.480300 
[11]	train-mcc:0.000000	test-mcc:0.477769 
[12]	train-mcc:0.000000	test-mcc:0.480170 
[13]	train-mcc:0.000000	test-mcc:0.476842 
[14]	train-mcc:0.000000	test-mcc:0.476271 
[15]	train-mcc:0.000000	test-mcc:0.474338 
[16]	train-mcc:0.000000	test-mcc:0.474775 
[17]	train-mcc:0.000000	test-mcc:0.475963 
[18]	train-mcc:0.000000	test-mcc:0.476147 
[19]	train-mcc:0.000000	test-mcc:0.476059 
[20]	train-mcc:0.000000	test-mcc:0.474749 
[21]	train-mcc:0.000000	test-mcc:0.474935 
[22]	train-mcc:0.000000	test-mcc:0.474459 
[23]	train-mcc:0.000000	test-mcc:0.477429 
[24]	train-mcc:0.000000	test-mcc:0.478552 
[25]	train-mcc:0.000000	test-mcc:0.476819 
[26]	train-mcc:0.000000	test-mcc:0.475565 
[27]	train-mcc:0.000000	test-mcc:0.476777 
[28]	train-mcc:0.000000	test-mcc:0.477014 
[29]	train-mcc:0.000000	test-mcc:0.476357 
[30]	train-mcc:0.000000	test-mcc:0.477026 
[31]	train-mcc:0.000000	test-mcc:0.477593 
[32]	train-mcc:0.000000	test-mcc:0.478015 
[33]	train-mcc:0.000000	test-mcc:0.478744 
[34]	train-mcc:0.000000	test-mcc:0.477805 
[35]	train-mcc:0.000000	test-mcc:0.476790 
[36]	train-mcc:0.000000	test-mcc:0.474028 
[37]	train-mcc:0.000000	test-mcc:0.474028 
[38]	train-mcc:0.000000	test-mcc:0.472937 
[39]	train-mcc:0.000000	test-mcc:0.473412 
[40]	train-mcc:0.000000	test-mcc:0.472148 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.480300


Time: Thu Nov 10 2016 05:15:24 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4803001
Confusion matrix:
     truth
preds      0      1
    0 235327   1016
    1     46    360
     truth
preds            0            1
    0 0.9939936388 0.0042914648
    1 0.0001942986 0.0015205978
Iteration 2 (base=0.3197737): MCC=0.4803001 | threshold=0.5191529



Iteration 2[3] on Thu Nov 10 2016 05:15:25 AM

depth=11, min_child_weight=3.420967, subsample=0.6024163, colsample_bytree=0.6269928, base_score=0.3197737
[1]	train-mcc:0.000000	test-mcc:0.477498 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485294 
[3]	train-mcc:0.000000	test-mcc:0.486473 
[4]	train-mcc:0.000000	test-mcc:0.487288 
[5]	train-mcc:0.000000	test-mcc:0.486228 
[6]	train-mcc:0.000000	test-mcc:0.485909 
[7]	train-mcc:0.000000	test-mcc:0.490326 
[8]	train-mcc:0.000000	test-mcc:0.490886 
[9]	train-mcc:0.000000	test-mcc:0.491633 
[10]	train-mcc:0.000000	test-mcc:0.491141 
[11]	train-mcc:0.000000	test-mcc:0.488083 
[12]	train-mcc:0.000000	test-mcc:0.487256 
[13]	train-mcc:0.000000	test-mcc:0.487695 
[14]	train-mcc:0.000000	test-mcc:0.492662 
[15]	train-mcc:0.000000	test-mcc:0.495253 
[16]	train-mcc:0.000000	test-mcc:0.491265 
[17]	train-mcc:0.000000	test-mcc:0.490736 
[18]	train-mcc:0.000000	test-mcc:0.487919 
[19]	train-mcc:0.000000	test-mcc:0.489926 
[20]	train-mcc:0.000000	test-mcc:0.491643 
[21]	train-mcc:0.000000	test-mcc:0.490850 
[22]	train-mcc:0.000000	test-mcc:0.491462 
[23]	train-mcc:0.000000	test-mcc:0.488119 
[24]	train-mcc:0.000000	test-mcc:0.489019 
[25]	train-mcc:0.000000	test-mcc:0.487887 
[26]	train-mcc:0.000000	test-mcc:0.487887 
[27]	train-mcc:0.000000	test-mcc:0.489818 
[28]	train-mcc:0.000000	test-mcc:0.487860 
[29]	train-mcc:0.000000	test-mcc:0.487630 
[30]	train-mcc:0.000000	test-mcc:0.489361 
[31]	train-mcc:0.000000	test-mcc:0.488265 
[32]	train-mcc:0.000000	test-mcc:0.487574 
[33]	train-mcc:0.000000	test-mcc:0.486764 
[34]	train-mcc:0.000000	test-mcc:0.487211 
[35]	train-mcc:0.000000	test-mcc:0.486725 
[36]	train-mcc:0.000000	test-mcc:0.486081 
[37]	train-mcc:0.000000	test-mcc:0.488265 
[38]	train-mcc:0.000000	test-mcc:0.488671 
[39]	train-mcc:0.000000	test-mcc:0.489486 
[40]	train-mcc:0.000000	test-mcc:0.489078 
[41]	train-mcc:0.000000	test-mcc:0.489747 
[42]	train-mcc:0.000000	test-mcc:0.488231 
[43]	train-mcc:0.000000	test-mcc:0.486141 
[44]	train-mcc:0.000000	test-mcc:0.486710 
[45]	train-mcc:0.000000	test-mcc:0.486131 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.495253


Time: Thu Nov 10 2016 05:17:32 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4952528
Confusion matrix:
     truth
preds      0      1
    0 235220    921
    1    154    455
     truth
preds            0            1
    0 0.9935374868 0.0038901795
    1 0.0006504752 0.0019218585
Iteration 2 (base=0.3197737): MCC=0.4952528 | threshold=0.3558705



Iteration 2[4] on Thu Nov 10 2016 05:17:34 AM

depth=11, min_child_weight=3.420967, subsample=0.6024163, colsample_bytree=0.6269928, base_score=0.3197737
[1]	train-mcc:0.000000	test-mcc:0.467496 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.465729 
[3]	train-mcc:0.000000	test-mcc:0.470277 
[4]	train-mcc:0.000000	test-mcc:0.468802 
[5]	train-mcc:0.000000	test-mcc:0.474821 
[6]	train-mcc:0.000000	test-mcc:0.473559 
[7]	train-mcc:0.000000	test-mcc:0.478853 
[8]	train-mcc:0.000000	test-mcc:0.482185 
[9]	train-mcc:0.000000	test-mcc:0.475559 
[10]	train-mcc:0.000000	test-mcc:0.473594 
[11]	train-mcc:0.000000	test-mcc:0.473443 
[12]	train-mcc:0.000000	test-mcc:0.472613 
[13]	train-mcc:0.000000	test-mcc:0.475545 
[14]	train-mcc:0.000000	test-mcc:0.475814 
[15]	train-mcc:0.000000	test-mcc:0.478129 
[16]	train-mcc:0.000000	test-mcc:0.477607 
[17]	train-mcc:0.000000	test-mcc:0.475203 
[18]	train-mcc:0.000000	test-mcc:0.478498 
[19]	train-mcc:0.000000	test-mcc:0.476457 
[20]	train-mcc:0.000000	test-mcc:0.476855 
[21]	train-mcc:0.000000	test-mcc:0.475699 
[22]	train-mcc:0.000000	test-mcc:0.477134 
[23]	train-mcc:0.000000	test-mcc:0.477134 
[24]	train-mcc:0.000000	test-mcc:0.476347 
[25]	train-mcc:0.000000	test-mcc:0.476246 
[26]	train-mcc:0.000000	test-mcc:0.476518 
[27]	train-mcc:0.000000	test-mcc:0.477681 
[28]	train-mcc:0.000000	test-mcc:0.476734 
[29]	train-mcc:0.000000	test-mcc:0.478397 
[30]	train-mcc:0.000000	test-mcc:0.476621 
[31]	train-mcc:0.000000	test-mcc:0.474911 
[32]	train-mcc:0.000000	test-mcc:0.475464 
[33]	train-mcc:0.000000	test-mcc:0.475024 
[34]	train-mcc:0.000000	test-mcc:0.475082 
[35]	train-mcc:0.000000	test-mcc:0.475082 
[36]	train-mcc:0.000000	test-mcc:0.475082 
[37]	train-mcc:0.000000	test-mcc:0.476558 
[38]	train-mcc:0.000000	test-mcc:0.476295 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.482185


Time: Thu Nov 10 2016 05:19:24 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4821852
Confusion matrix:
     truth
preds      0      1
    0 235187    921
    1    187    455
     truth
preds            0            1
    0 0.9933980993 0.0038901795
    1 0.0007898627 0.0019218585
Iteration 2 (base=0.3197737): MCC=0.4821852 | threshold=0.3201838



Iteration 2[5] on Thu Nov 10 2016 05:19:25 AM

depth=11, min_child_weight=3.420967, subsample=0.6024163, colsample_bytree=0.6269928, base_score=0.3197737
[1]	train-mcc:0.000000	test-mcc:0.467680 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475887 
[3]	train-mcc:0.000000	test-mcc:0.467455 
[4]	train-mcc:0.000000	test-mcc:0.474363 
[5]	train-mcc:0.000000	test-mcc:0.476055 
[6]	train-mcc:0.000000	test-mcc:0.476298 
[7]	train-mcc:0.000000	test-mcc:0.476526 
[8]	train-mcc:0.000000	test-mcc:0.474746 
[9]	train-mcc:0.000000	test-mcc:0.476702 
[10]	train-mcc:0.000000	test-mcc:0.475736 
[11]	train-mcc:0.000000	test-mcc:0.478869 
[12]	train-mcc:0.000000	test-mcc:0.479150 
[13]	train-mcc:0.000000	test-mcc:0.480636 
[14]	train-mcc:0.000000	test-mcc:0.478781 
[15]	train-mcc:0.000000	test-mcc:0.479830 
[16]	train-mcc:0.000000	test-mcc:0.481368 
[17]	train-mcc:0.000000	test-mcc:0.480924 
[18]	train-mcc:0.000000	test-mcc:0.479631 
[19]	train-mcc:0.000000	test-mcc:0.479915 
[20]	train-mcc:0.000000	test-mcc:0.480691 
[21]	train-mcc:0.000000	test-mcc:0.480660 
[22]	train-mcc:0.000000	test-mcc:0.480901 
[23]	train-mcc:0.000000	test-mcc:0.481813 
[24]	train-mcc:0.000000	test-mcc:0.484519 
[25]	train-mcc:0.000000	test-mcc:0.487414 
[26]	train-mcc:0.000000	test-mcc:0.485978 
[27]	train-mcc:0.000000	test-mcc:0.486696 
[28]	train-mcc:0.000000	test-mcc:0.488623 
[29]	train-mcc:0.000000	test-mcc:0.489783 
[30]	train-mcc:0.000000	test-mcc:0.489261 
[31]	train-mcc:0.000000	test-mcc:0.489443 
[32]	train-mcc:0.000000	test-mcc:0.489549 
[33]	train-mcc:0.000000	test-mcc:0.487685 
[34]	train-mcc:0.000000	test-mcc:0.486042 
[35]	train-mcc:0.000000	test-mcc:0.486671 
[36]	train-mcc:0.000000	test-mcc:0.487281 
[37]	train-mcc:0.000000	test-mcc:0.487487 
[38]	train-mcc:0.000000	test-mcc:0.486922 
[39]	train-mcc:0.000000	test-mcc:0.485437 
[40]	train-mcc:0.000000	test-mcc:0.485437 
[41]	train-mcc:0.000000	test-mcc:0.484956 
[42]	train-mcc:0.000000	test-mcc:0.485877 
[43]	train-mcc:0.000000	test-mcc:0.485877 
[44]	train-mcc:0.000000	test-mcc:0.487097 
[45]	train-mcc:0.000000	test-mcc:0.487825 
[46]	train-mcc:0.000000	test-mcc:0.489100 
[47]	train-mcc:0.000000	test-mcc:0.489100 
[48]	train-mcc:0.000000	test-mcc:0.486562 
[49]	train-mcc:0.000000	test-mcc:0.484759 
[50]	train-mcc:0.000000	test-mcc:0.484759 
[51]	train-mcc:0.000000	test-mcc:0.486603 
[52]	train-mcc:0.000000	test-mcc:0.485877 
[53]	train-mcc:0.000000	test-mcc:0.484485 
[54]	train-mcc:0.000000	test-mcc:0.483521 
[55]	train-mcc:0.000000	test-mcc:0.483521 
[56]	train-mcc:0.000000	test-mcc:0.484225 
[57]	train-mcc:0.000000	test-mcc:0.483836 
[58]	train-mcc:0.000000	test-mcc:0.484802 
[59]	train-mcc:0.000000	test-mcc:0.484802 
Stopping. Best iteration:
[29]	train-mcc:0.000000	test-mcc:0.489783


Time: Thu Nov 10 2016 05:22:22 AM
For 0029 rounds: train_mcc: 0 - test_mcc: 0.4897826
Confusion matrix:
     truth
preds      0      1
    0 235278    966
    1     96    410
     truth
preds           0           1
    0 0.993782471 0.004080253
    1 0.000405491 0.001731785
Iteration 2 (base=0.3197737): MCC=0.4897826 | threshold=0.4312443


===




Iteration 3[1] on Thu Nov 10 2016 05:22:31 AM

depth=5, min_child_weight=7.037223, subsample=0.6937541, colsample_bytree=0.6755467, base_score=0.151105
[1]	train-mcc:0.000000	test-mcc:0.462246 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.470815 
[3]	train-mcc:0.000000	test-mcc:0.471436 
[4]	train-mcc:0.000000	test-mcc:0.475808 
[5]	train-mcc:0.000000	test-mcc:0.475518 
[6]	train-mcc:0.000000	test-mcc:0.477358 
[7]	train-mcc:0.000000	test-mcc:0.477619 
[8]	train-mcc:0.000000	test-mcc:0.477917 
[9]	train-mcc:0.000000	test-mcc:0.479129 
[10]	train-mcc:0.000000	test-mcc:0.479931 
[11]	train-mcc:0.000000	test-mcc:0.479172 
[12]	train-mcc:0.000000	test-mcc:0.476064 
[13]	train-mcc:0.000000	test-mcc:0.476579 
[14]	train-mcc:0.000000	test-mcc:0.476024 
[15]	train-mcc:0.000000	test-mcc:0.476750 
[16]	train-mcc:0.000000	test-mcc:0.476750 
[17]	train-mcc:0.000000	test-mcc:0.478405 
[18]	train-mcc:0.000000	test-mcc:0.478405 
[19]	train-mcc:0.000000	test-mcc:0.477512 
[20]	train-mcc:0.000000	test-mcc:0.476321 
[21]	train-mcc:0.000000	test-mcc:0.476064 
[22]	train-mcc:0.000000	test-mcc:0.475855 
[23]	train-mcc:0.000000	test-mcc:0.475081 
[24]	train-mcc:0.000000	test-mcc:0.475081 
[25]	train-mcc:0.000000	test-mcc:0.475652 
[26]	train-mcc:0.000000	test-mcc:0.476115 
[27]	train-mcc:0.000000	test-mcc:0.476115 
[28]	train-mcc:0.000000	test-mcc:0.476844 
[29]	train-mcc:0.000000	test-mcc:0.476097 
[30]	train-mcc:0.000000	test-mcc:0.476300 
[31]	train-mcc:0.000000	test-mcc:0.476300 
[32]	train-mcc:0.000000	test-mcc:0.476300 
[33]	train-mcc:0.000000	test-mcc:0.475808 
[34]	train-mcc:0.000000	test-mcc:0.476533 
[35]	train-mcc:0.000000	test-mcc:0.476750 
[36]	train-mcc:0.000000	test-mcc:0.475339 
[37]	train-mcc:0.000000	test-mcc:0.475808 
[38]	train-mcc:0.000000	test-mcc:0.476215 
[39]	train-mcc:0.000000	test-mcc:0.475838 
[40]	train-mcc:0.000000	test-mcc:0.475267 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.479931


Time: Thu Nov 10 2016 05:23:33 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4799307
Confusion matrix:
     truth
preds      0      1
    0 235259    967
    1    114    408
     truth
preds            0            1
    0 0.9937106121 0.0040845118
    1 0.0004815247 0.0017233514
Iteration 3 (base=0.151105): MCC=0.4799307 | threshold=0.4213476



Iteration 3[2] on Thu Nov 10 2016 05:23:34 AM

depth=5, min_child_weight=7.037223, subsample=0.6937541, colsample_bytree=0.6755467, base_score=0.151105
[1]	train-mcc:0.000000	test-mcc:0.472125 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478466 
[3]	train-mcc:0.000000	test-mcc:0.474469 
[4]	train-mcc:0.000000	test-mcc:0.475168 
[5]	train-mcc:0.000000	test-mcc:0.476929 
[6]	train-mcc:0.000000	test-mcc:0.477976 
[7]	train-mcc:0.000000	test-mcc:0.475703 
[8]	train-mcc:0.000000	test-mcc:0.476340 
[9]	train-mcc:0.000000	test-mcc:0.476754 
[10]	train-mcc:0.000000	test-mcc:0.476635 
[11]	train-mcc:0.000000	test-mcc:0.476519 
[12]	train-mcc:0.000000	test-mcc:0.478045 
[13]	train-mcc:0.000000	test-mcc:0.476923 
[14]	train-mcc:0.000000	test-mcc:0.476923 
[15]	train-mcc:0.000000	test-mcc:0.478106 
[16]	train-mcc:0.000000	test-mcc:0.478106 
[17]	train-mcc:0.000000	test-mcc:0.480474 
[18]	train-mcc:0.000000	test-mcc:0.480221 
[19]	train-mcc:0.000000	test-mcc:0.479501 
[20]	train-mcc:0.000000	test-mcc:0.479755 
[21]	train-mcc:0.000000	test-mcc:0.480362 
[22]	train-mcc:0.000000	test-mcc:0.480401 
[23]	train-mcc:0.000000	test-mcc:0.481520 
[24]	train-mcc:0.000000	test-mcc:0.480913 
[25]	train-mcc:0.000000	test-mcc:0.482682 
[26]	train-mcc:0.000000	test-mcc:0.482408 
[27]	train-mcc:0.000000	test-mcc:0.481511 
[28]	train-mcc:0.000000	test-mcc:0.481492 
[29]	train-mcc:0.000000	test-mcc:0.481511 
[30]	train-mcc:0.000000	test-mcc:0.481435 
[31]	train-mcc:0.000000	test-mcc:0.482384 
[32]	train-mcc:0.000000	test-mcc:0.482197 
[33]	train-mcc:0.000000	test-mcc:0.483373 
[34]	train-mcc:0.000000	test-mcc:0.482577 
[35]	train-mcc:0.000000	test-mcc:0.482974 
[36]	train-mcc:0.000000	test-mcc:0.482974 
[37]	train-mcc:0.000000	test-mcc:0.482577 
[38]	train-mcc:0.000000	test-mcc:0.482874 
[39]	train-mcc:0.000000	test-mcc:0.482874 
[40]	train-mcc:0.000000	test-mcc:0.483373 
[41]	train-mcc:0.000000	test-mcc:0.482974 
[42]	train-mcc:0.000000	test-mcc:0.483109 
[43]	train-mcc:0.000000	test-mcc:0.483109 
[44]	train-mcc:0.000000	test-mcc:0.483883 
[45]	train-mcc:0.000000	test-mcc:0.483673 
[46]	train-mcc:0.000000	test-mcc:0.483109 
[47]	train-mcc:0.000000	test-mcc:0.483496 
[48]	train-mcc:0.000000	test-mcc:0.483883 
[49]	train-mcc:0.000000	test-mcc:0.483972 
[50]	train-mcc:0.000000	test-mcc:0.484272 
[51]	train-mcc:0.000000	test-mcc:0.484272 
[52]	train-mcc:0.000000	test-mcc:0.484960 
[53]	train-mcc:0.000000	test-mcc:0.485648 
[54]	train-mcc:0.000000	test-mcc:0.485648 
[55]	train-mcc:0.000000	test-mcc:0.484872 
[56]	train-mcc:0.000000	test-mcc:0.483331 
[57]	train-mcc:0.000000	test-mcc:0.483715 
[58]	train-mcc:0.000000	test-mcc:0.484486 
[59]	train-mcc:0.000000	test-mcc:0.484184 
[60]	train-mcc:0.000000	test-mcc:0.484184 
[61]	train-mcc:0.000000	test-mcc:0.483583 
[62]	train-mcc:0.000000	test-mcc:0.484363 
[63]	train-mcc:0.000000	test-mcc:0.484363 
[64]	train-mcc:0.000000	test-mcc:0.485345 
[65]	train-mcc:0.000000	test-mcc:0.487230 
[66]	train-mcc:0.000000	test-mcc:0.486523 
[67]	train-mcc:0.000000	test-mcc:0.486523 
[68]	train-mcc:0.000000	test-mcc:0.487211 
[69]	train-mcc:0.000000	test-mcc:0.486523 
[70]	train-mcc:0.000000	test-mcc:0.486037 
[71]	train-mcc:0.000000	test-mcc:0.486037 
[72]	train-mcc:0.000000	test-mcc:0.484574 
[73]	train-mcc:0.000000	test-mcc:0.485052 
[74]	train-mcc:0.000000	test-mcc:0.485450 
[75]	train-mcc:0.000000	test-mcc:0.484654 
[76]	train-mcc:0.000000	test-mcc:0.485345 
[77]	train-mcc:0.000000	test-mcc:0.486072 
[78]	train-mcc:0.000000	test-mcc:0.486764 
[79]	train-mcc:0.000000	test-mcc:0.486310 
[80]	train-mcc:0.000000	test-mcc:0.484949 
[81]	train-mcc:0.000000	test-mcc:0.484486 
[82]	train-mcc:0.000000	test-mcc:0.484486 
[83]	train-mcc:0.000000	test-mcc:0.484486 
[84]	train-mcc:0.000000	test-mcc:0.485559 
[85]	train-mcc:0.000000	test-mcc:0.486228 
[86]	train-mcc:0.000000	test-mcc:0.485540 
[87]	train-mcc:0.000000	test-mcc:0.485260 
[88]	train-mcc:0.000000	test-mcc:0.484872 
[89]	train-mcc:0.000000	test-mcc:0.485173 
[90]	train-mcc:0.000000	test-mcc:0.485311 
[91]	train-mcc:0.000000	test-mcc:0.485614 
[92]	train-mcc:0.000000	test-mcc:0.487410 
[93]	train-mcc:0.000000	test-mcc:0.487318 
[94]	train-mcc:0.000000	test-mcc:0.487318 
[95]	train-mcc:0.000000	test-mcc:0.486931 
[96]	train-mcc:0.000000	test-mcc:0.485774 
[97]	train-mcc:0.000000	test-mcc:0.485946 
[98]	train-mcc:0.000000	test-mcc:0.485559 
[99]	train-mcc:0.000000	test-mcc:0.485089 
[100]	train-mcc:0.000000	test-mcc:0.485089 
[101]	train-mcc:0.000000	test-mcc:0.483636 
[102]	train-mcc:0.000000	test-mcc:0.482523 
[103]	train-mcc:0.000000	test-mcc:0.481958 
[104]	train-mcc:0.000000	test-mcc:0.481805 
[105]	train-mcc:0.000000	test-mcc:0.481805 
[106]	train-mcc:0.000000	test-mcc:0.481805 
[107]	train-mcc:0.000000	test-mcc:0.482893 
[108]	train-mcc:0.000000	test-mcc:0.482876 
[109]	train-mcc:0.000000	test-mcc:0.482876 
[110]	train-mcc:0.000000	test-mcc:0.483017 
[111]	train-mcc:0.000000	test-mcc:0.483017 
[112]	train-mcc:0.000000	test-mcc:0.482442 
[113]	train-mcc:0.000000	test-mcc:0.480901 
[114]	train-mcc:0.000000	test-mcc:0.480866 
[115]	train-mcc:0.000000	test-mcc:0.482158 
[116]	train-mcc:0.000000	test-mcc:0.481853 
[117]	train-mcc:0.000000	test-mcc:0.481853 
[118]	train-mcc:0.000000	test-mcc:0.484002 
[119]	train-mcc:0.000000	test-mcc:0.483283 
[120]	train-mcc:0.000000	test-mcc:0.481121 
[121]	train-mcc:0.000000	test-mcc:0.481667 
[122]	train-mcc:0.000000	test-mcc:0.481166 
Stopping. Best iteration:
[92]	train-mcc:0.000000	test-mcc:0.487410


Time: Thu Nov 10 2016 05:26:48 AM
For 0092 rounds: train_mcc: 0 - test_mcc: 0.48741
Confusion matrix:
     truth
preds      0      1
    0 235196    919
    1    177    457
     truth
preds            0            1
    0 0.9934403102 0.0038817482
    1 0.0007476272 0.0019303144
Iteration 3 (base=0.151105): MCC=0.48741 | threshold=0.3427355



Iteration 3[3] on Thu Nov 10 2016 05:26:51 AM

depth=5, min_child_weight=7.037223, subsample=0.6937541, colsample_bytree=0.6755467, base_score=0.151105
[1]	train-mcc:0.000000	test-mcc:0.484932 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486982 
[3]	train-mcc:0.000000	test-mcc:0.490943 
[4]	train-mcc:0.000000	test-mcc:0.489307 
[5]	train-mcc:0.000000	test-mcc:0.489926 
[6]	train-mcc:0.000000	test-mcc:0.490153 
[7]	train-mcc:0.000000	test-mcc:0.490497 
[8]	train-mcc:0.000000	test-mcc:0.491905 
[9]	train-mcc:0.000000	test-mcc:0.492009 
[10]	train-mcc:0.000000	test-mcc:0.491853 
[11]	train-mcc:0.000000	test-mcc:0.493163 
[12]	train-mcc:0.000000	test-mcc:0.492781 
[13]	train-mcc:0.000000	test-mcc:0.491925 
[14]	train-mcc:0.000000	test-mcc:0.491925 
[15]	train-mcc:0.000000	test-mcc:0.492717 
[16]	train-mcc:0.000000	test-mcc:0.493415 
[17]	train-mcc:0.000000	test-mcc:0.493415 
[18]	train-mcc:0.000000	test-mcc:0.492678 
[19]	train-mcc:0.000000	test-mcc:0.492912 
[20]	train-mcc:0.000000	test-mcc:0.492212 
[21]	train-mcc:0.000000	test-mcc:0.493236 
[22]	train-mcc:0.000000	test-mcc:0.492122 
[23]	train-mcc:0.000000	test-mcc:0.493163 
[24]	train-mcc:0.000000	test-mcc:0.494308 
[25]	train-mcc:0.000000	test-mcc:0.494059 
[26]	train-mcc:0.000000	test-mcc:0.494469 
[27]	train-mcc:0.000000	test-mcc:0.494469 
[28]	train-mcc:0.000000	test-mcc:0.494709 
[29]	train-mcc:0.000000	test-mcc:0.494709 
[30]	train-mcc:0.000000	test-mcc:0.496383 
[31]	train-mcc:0.000000	test-mcc:0.496870 
[32]	train-mcc:0.000000	test-mcc:0.496870 
[33]	train-mcc:0.000000	test-mcc:0.495898 
[34]	train-mcc:0.000000	test-mcc:0.495414 
[35]	train-mcc:0.000000	test-mcc:0.495636 
[36]	train-mcc:0.000000	test-mcc:0.495156 
[37]	train-mcc:0.000000	test-mcc:0.494676 
[38]	train-mcc:0.000000	test-mcc:0.494714 
[39]	train-mcc:0.000000	test-mcc:0.495130 
[40]	train-mcc:0.000000	test-mcc:0.498008 
[41]	train-mcc:0.000000	test-mcc:0.497525 
[42]	train-mcc:0.000000	test-mcc:0.498227 
[43]	train-mcc:0.000000	test-mcc:0.498227 
[44]	train-mcc:0.000000	test-mcc:0.498037 
[45]	train-mcc:0.000000	test-mcc:0.498037 
[46]	train-mcc:0.000000	test-mcc:0.499590 
[47]	train-mcc:0.000000	test-mcc:0.498903 
[48]	train-mcc:0.000000	test-mcc:0.497175 
[49]	train-mcc:0.000000	test-mcc:0.496746 
[50]	train-mcc:0.000000	test-mcc:0.496746 
[51]	train-mcc:0.000000	test-mcc:0.497175 
[52]	train-mcc:0.000000	test-mcc:0.497694 
[53]	train-mcc:0.000000	test-mcc:0.497694 
[54]	train-mcc:0.000000	test-mcc:0.498122 
[55]	train-mcc:0.000000	test-mcc:0.497529 
[56]	train-mcc:0.000000	test-mcc:0.497105 
[57]	train-mcc:0.000000	test-mcc:0.496842 
[58]	train-mcc:0.000000	test-mcc:0.498901 
[59]	train-mcc:0.000000	test-mcc:0.498477 
[60]	train-mcc:0.000000	test-mcc:0.496224 
[61]	train-mcc:0.000000	test-mcc:0.495538 
[62]	train-mcc:0.000000	test-mcc:0.495393 
[63]	train-mcc:0.000000	test-mcc:0.496349 
[64]	train-mcc:0.000000	test-mcc:0.496349 
[65]	train-mcc:0.000000	test-mcc:0.496349 
[66]	train-mcc:0.000000	test-mcc:0.495754 
[67]	train-mcc:0.000000	test-mcc:0.495754 
[68]	train-mcc:0.000000	test-mcc:0.495123 
[69]	train-mcc:0.000000	test-mcc:0.496525 
[70]	train-mcc:0.000000	test-mcc:0.496324 
[71]	train-mcc:0.000000	test-mcc:0.495538 
[72]	train-mcc:0.000000	test-mcc:0.496579 
[73]	train-mcc:0.000000	test-mcc:0.495888 
[74]	train-mcc:0.000000	test-mcc:0.496324 
[75]	train-mcc:0.000000	test-mcc:0.499215 
[76]	train-mcc:0.000000	test-mcc:0.498524 
Stopping. Best iteration:
[46]	train-mcc:0.000000	test-mcc:0.499590


Time: Thu Nov 10 2016 05:28:46 AM
For 0046 rounds: train_mcc: 0 - test_mcc: 0.4995904
Confusion matrix:
     truth
preds      0      1
    0 235240    927
    1    134    449
     truth
preds            0            1
    0 0.9936219641 0.0039155227
    1 0.0005659979 0.0018965153
Iteration 3 (base=0.151105): MCC=0.4995904 | threshold=0.3404601



Iteration 3[4] on Thu Nov 10 2016 05:28:47 AM

depth=5, min_child_weight=7.037223, subsample=0.6937541, colsample_bytree=0.6755467, base_score=0.151105
[1]	train-mcc:0.000000	test-mcc:0.479585 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483432 
[3]	train-mcc:0.000000	test-mcc:0.480569 
[4]	train-mcc:0.000000	test-mcc:0.481342 
[5]	train-mcc:0.000000	test-mcc:0.483382 
[6]	train-mcc:0.000000	test-mcc:0.480097 
[7]	train-mcc:0.000000	test-mcc:0.482354 
[8]	train-mcc:0.000000	test-mcc:0.482321 
[9]	train-mcc:0.000000	test-mcc:0.482638 
[10]	train-mcc:0.000000	test-mcc:0.482601 
[11]	train-mcc:0.000000	test-mcc:0.483298 
[12]	train-mcc:0.000000	test-mcc:0.483411 
[13]	train-mcc:0.000000	test-mcc:0.483818 
[14]	train-mcc:0.000000	test-mcc:0.483521 
[15]	train-mcc:0.000000	test-mcc:0.483521 
[16]	train-mcc:0.000000	test-mcc:0.483040 
[17]	train-mcc:0.000000	test-mcc:0.482099 
[18]	train-mcc:0.000000	test-mcc:0.482643 
[19]	train-mcc:0.000000	test-mcc:0.482806 
[20]	train-mcc:0.000000	test-mcc:0.482532 
[21]	train-mcc:0.000000	test-mcc:0.483238 
[22]	train-mcc:0.000000	test-mcc:0.483511 
[23]	train-mcc:0.000000	test-mcc:0.483511 
[24]	train-mcc:0.000000	test-mcc:0.485191 
[25]	train-mcc:0.000000	test-mcc:0.485463 
[26]	train-mcc:0.000000	test-mcc:0.485191 
[27]	train-mcc:0.000000	test-mcc:0.484762 
[28]	train-mcc:0.000000	test-mcc:0.483355 
[29]	train-mcc:0.000000	test-mcc:0.483039 
[30]	train-mcc:0.000000	test-mcc:0.484175 
[31]	train-mcc:0.000000	test-mcc:0.483756 
[32]	train-mcc:0.000000	test-mcc:0.483865 
[33]	train-mcc:0.000000	test-mcc:0.484175 
[34]	train-mcc:0.000000	test-mcc:0.484885 
[35]	train-mcc:0.000000	test-mcc:0.485310 
[36]	train-mcc:0.000000	test-mcc:0.483593 
[37]	train-mcc:0.000000	test-mcc:0.483880 
[38]	train-mcc:0.000000	test-mcc:0.483859 
[39]	train-mcc:0.000000	test-mcc:0.483859 
[40]	train-mcc:0.000000	test-mcc:0.483859 
[41]	train-mcc:0.000000	test-mcc:0.482785 
[42]	train-mcc:0.000000	test-mcc:0.483494 
[43]	train-mcc:0.000000	test-mcc:0.483235 
[44]	train-mcc:0.000000	test-mcc:0.482160 
[45]	train-mcc:0.000000	test-mcc:0.482977 
[46]	train-mcc:0.000000	test-mcc:0.480906 
[47]	train-mcc:0.000000	test-mcc:0.480191 
[48]	train-mcc:0.000000	test-mcc:0.481169 
[49]	train-mcc:0.000000	test-mcc:0.481357 
[50]	train-mcc:0.000000	test-mcc:0.482776 
[51]	train-mcc:0.000000	test-mcc:0.482478 
[52]	train-mcc:0.000000	test-mcc:0.482478 
[53]	train-mcc:0.000000	test-mcc:0.480492 
[54]	train-mcc:0.000000	test-mcc:0.478997 
[55]	train-mcc:0.000000	test-mcc:0.478997 
Stopping. Best iteration:
[25]	train-mcc:0.000000	test-mcc:0.485463


Time: Thu Nov 10 2016 05:30:08 AM
For 0025 rounds: train_mcc: 0 - test_mcc: 0.4854635
Confusion matrix:
     truth
preds      0      1
    0 235233    943
    1    141    433
     truth
preds            0            1
    0 0.9935923970 0.0039831045
    1 0.0005955649 0.0018289335
Iteration 3 (base=0.151105): MCC=0.4854635 | threshold=0.3525286



Iteration 3[5] on Thu Nov 10 2016 05:30:09 AM

depth=5, min_child_weight=7.037223, subsample=0.6937541, colsample_bytree=0.6755467, base_score=0.151105
[1]	train-mcc:0.000000	test-mcc:0.493748 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.493632 
[3]	train-mcc:0.000000	test-mcc:0.489657 
[4]	train-mcc:0.000000	test-mcc:0.489747 
[5]	train-mcc:0.000000	test-mcc:0.488671 
[6]	train-mcc:0.000000	test-mcc:0.490719 
[7]	train-mcc:0.000000	test-mcc:0.492066 
[8]	train-mcc:0.000000	test-mcc:0.491593 
[9]	train-mcc:0.000000	test-mcc:0.491595 
[10]	train-mcc:0.000000	test-mcc:0.493005 
[11]	train-mcc:0.000000	test-mcc:0.493129 
[12]	train-mcc:0.000000	test-mcc:0.492538 
[13]	train-mcc:0.000000	test-mcc:0.492322 
[14]	train-mcc:0.000000	test-mcc:0.492322 
[15]	train-mcc:0.000000	test-mcc:0.492299 
[16]	train-mcc:0.000000	test-mcc:0.491721 
[17]	train-mcc:0.000000	test-mcc:0.490890 
[18]	train-mcc:0.000000	test-mcc:0.491174 
[19]	train-mcc:0.000000	test-mcc:0.494851 
[20]	train-mcc:0.000000	test-mcc:0.494707 
[21]	train-mcc:0.000000	test-mcc:0.494980 
[22]	train-mcc:0.000000	test-mcc:0.494294 
[23]	train-mcc:0.000000	test-mcc:0.493194 
[24]	train-mcc:0.000000	test-mcc:0.493194 
[25]	train-mcc:0.000000	test-mcc:0.493971 
[26]	train-mcc:0.000000	test-mcc:0.493971 
[27]	train-mcc:0.000000	test-mcc:0.493971 
[28]	train-mcc:0.000000	test-mcc:0.491681 
[29]	train-mcc:0.000000	test-mcc:0.491584 
[30]	train-mcc:0.000000	test-mcc:0.492277 
[31]	train-mcc:0.000000	test-mcc:0.491406 
[32]	train-mcc:0.000000	test-mcc:0.490990 
[33]	train-mcc:0.000000	test-mcc:0.490893 
[34]	train-mcc:0.000000	test-mcc:0.490893 
[35]	train-mcc:0.000000	test-mcc:0.489715 
[36]	train-mcc:0.000000	test-mcc:0.489026 
[37]	train-mcc:0.000000	test-mcc:0.490245 
[38]	train-mcc:0.000000	test-mcc:0.489986 
[39]	train-mcc:0.000000	test-mcc:0.489104 
[40]	train-mcc:0.000000	test-mcc:0.489365 
[41]	train-mcc:0.000000	test-mcc:0.489500 
[42]	train-mcc:0.000000	test-mcc:0.488925 
[43]	train-mcc:0.000000	test-mcc:0.488636 
[44]	train-mcc:0.000000	test-mcc:0.488636 
[45]	train-mcc:0.000000	test-mcc:0.488765 
[46]	train-mcc:0.000000	test-mcc:0.489235 
[47]	train-mcc:0.000000	test-mcc:0.488540 
[48]	train-mcc:0.000000	test-mcc:0.490414 
[49]	train-mcc:0.000000	test-mcc:0.489235 
[50]	train-mcc:0.000000	test-mcc:0.489235 
[51]	train-mcc:0.000000	test-mcc:0.490182 
Stopping. Best iteration:
[21]	train-mcc:0.000000	test-mcc:0.494980


Time: Thu Nov 10 2016 05:31:24 AM
For 0021 rounds: train_mcc: 0 - test_mcc: 0.4949799
Confusion matrix:
     truth
preds      0      1
    0 235221    922
    1    153    454
     truth
preds            0            1
    0 0.9935417107 0.0038944034
    1 0.0006462513 0.0019176346
Iteration 3 (base=0.151105): MCC=0.4949799 | threshold=0.3103365


===




Iteration 4[1] on Thu Nov 10 2016 05:31:33 AM

depth=5, min_child_weight=33.91563, subsample=0.921018, colsample_bytree=0.8494715, base_score=0.0845362
[1]	train-mcc:0.000000	test-mcc:0.469297 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477163 
[3]	train-mcc:0.000000	test-mcc:0.477495 
[4]	train-mcc:0.000000	test-mcc:0.475731 
[5]	train-mcc:0.000000	test-mcc:0.474509 
[6]	train-mcc:0.000000	test-mcc:0.475978 
[7]	train-mcc:0.000000	test-mcc:0.477189 
[8]	train-mcc:0.000000	test-mcc:0.477189 
[9]	train-mcc:0.000000	test-mcc:0.476215 
[10]	train-mcc:0.000000	test-mcc:0.475731 
[11]	train-mcc:0.000000	test-mcc:0.475977 
[12]	train-mcc:0.000000	test-mcc:0.475123 
[13]	train-mcc:0.000000	test-mcc:0.475762 
[14]	train-mcc:0.000000	test-mcc:0.475528 
[15]	train-mcc:0.000000	test-mcc:0.475690 
[16]	train-mcc:0.000000	test-mcc:0.476427 
[17]	train-mcc:0.000000	test-mcc:0.475690 
[18]	train-mcc:0.000000	test-mcc:0.476314 
[19]	train-mcc:0.000000	test-mcc:0.475489 
[20]	train-mcc:0.000000	test-mcc:0.475911 
[21]	train-mcc:0.000000	test-mcc:0.476118 
[22]	train-mcc:0.000000	test-mcc:0.475397 
[23]	train-mcc:0.000000	test-mcc:0.475397 
[24]	train-mcc:0.000000	test-mcc:0.475547 
[25]	train-mcc:0.000000	test-mcc:0.476300 
[26]	train-mcc:0.000000	test-mcc:0.477802 
[27]	train-mcc:0.000000	test-mcc:0.477052 
[28]	train-mcc:0.000000	test-mcc:0.477052 
[29]	train-mcc:0.000000	test-mcc:0.477052 
[30]	train-mcc:0.000000	test-mcc:0.477389 
[31]	train-mcc:0.000000	test-mcc:0.477662 
[32]	train-mcc:0.000000	test-mcc:0.477662 
[33]	train-mcc:0.000000	test-mcc:0.477052 
[34]	train-mcc:0.000000	test-mcc:0.477487 
[35]	train-mcc:0.000000	test-mcc:0.476998 
[36]	train-mcc:0.000000	test-mcc:0.476998 
[37]	train-mcc:0.000000	test-mcc:0.476998 
[38]	train-mcc:0.000000	test-mcc:0.477503 
[39]	train-mcc:0.000000	test-mcc:0.476750 
[40]	train-mcc:0.000000	test-mcc:0.476750 
[41]	train-mcc:0.000000	test-mcc:0.476750 
[42]	train-mcc:0.000000	test-mcc:0.475530 
[43]	train-mcc:0.000000	test-mcc:0.475618 
[44]	train-mcc:0.000000	test-mcc:0.478136 
[45]	train-mcc:0.000000	test-mcc:0.478136 
[46]	train-mcc:0.000000	test-mcc:0.476118 
[47]	train-mcc:0.000000	test-mcc:0.475489 
[48]	train-mcc:0.000000	test-mcc:0.475691 
[49]	train-mcc:0.000000	test-mcc:0.475691 
[50]	train-mcc:0.000000	test-mcc:0.477495 
[51]	train-mcc:0.000000	test-mcc:0.477495 
[52]	train-mcc:0.000000	test-mcc:0.477495 
[53]	train-mcc:0.000000	test-mcc:0.477495 
[54]	train-mcc:0.000000	test-mcc:0.475997 
[55]	train-mcc:0.000000	test-mcc:0.475997 
[56]	train-mcc:0.000000	test-mcc:0.475997 
[57]	train-mcc:0.000000	test-mcc:0.475997 
[58]	train-mcc:0.000000	test-mcc:0.476532 
[59]	train-mcc:0.000000	test-mcc:0.476532 
[60]	train-mcc:0.000000	test-mcc:0.476300 
[61]	train-mcc:0.000000	test-mcc:0.476443 
[62]	train-mcc:0.000000	test-mcc:0.476532 
[63]	train-mcc:0.000000	test-mcc:0.477036 
[64]	train-mcc:0.000000	test-mcc:0.477052 
[65]	train-mcc:0.000000	test-mcc:0.477052 
[66]	train-mcc:0.000000	test-mcc:0.476137 
[67]	train-mcc:0.000000	test-mcc:0.476137 
[68]	train-mcc:0.000000	test-mcc:0.476300 
[69]	train-mcc:0.000000	test-mcc:0.476300 
[70]	train-mcc:0.000000	test-mcc:0.476399 
[71]	train-mcc:0.000000	test-mcc:0.476399 
[72]	train-mcc:0.000000	test-mcc:0.476647 
[73]	train-mcc:0.000000	test-mcc:0.476820 
[74]	train-mcc:0.000000	test-mcc:0.476647 
Stopping. Best iteration:
[44]	train-mcc:0.000000	test-mcc:0.478136


Time: Thu Nov 10 2016 05:33:51 AM
For 0044 rounds: train_mcc: 0 - test_mcc: 0.4781365
Confusion matrix:
     truth
preds      0      1
    0 235339   1028
    1     34    347
     truth
preds            0            1
    0 0.9940485242 0.0043421697
    1 0.0001436126 0.0014656935
Iteration 4 (base=0.0845362): MCC=0.4781365 | threshold=0.6420816



Iteration 4[2] on Thu Nov 10 2016 05:33:53 AM

depth=5, min_child_weight=33.91563, subsample=0.921018, colsample_bytree=0.8494715, base_score=0.0845362
[1]	train-mcc:0.000000	test-mcc:0.471469 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476300 
[3]	train-mcc:0.000000	test-mcc:0.479240 
[4]	train-mcc:0.000000	test-mcc:0.482084 
[5]	train-mcc:0.000000	test-mcc:0.481657 
[6]	train-mcc:0.000000	test-mcc:0.480663 
[7]	train-mcc:0.000000	test-mcc:0.481649 
[8]	train-mcc:0.000000	test-mcc:0.482006 
[9]	train-mcc:0.000000	test-mcc:0.482111 
[10]	train-mcc:0.000000	test-mcc:0.483235 
[11]	train-mcc:0.000000	test-mcc:0.483235 
[12]	train-mcc:0.000000	test-mcc:0.481169 
[13]	train-mcc:0.000000	test-mcc:0.481432 
[14]	train-mcc:0.000000	test-mcc:0.482672 
[15]	train-mcc:0.000000	test-mcc:0.482672 
[16]	train-mcc:0.000000	test-mcc:0.482672 
[17]	train-mcc:0.000000	test-mcc:0.482494 
[18]	train-mcc:0.000000	test-mcc:0.482494 
[19]	train-mcc:0.000000	test-mcc:0.482494 
[20]	train-mcc:0.000000	test-mcc:0.484091 
[21]	train-mcc:0.000000	test-mcc:0.484883 
[22]	train-mcc:0.000000	test-mcc:0.484488 
[23]	train-mcc:0.000000	test-mcc:0.485350 
[24]	train-mcc:0.000000	test-mcc:0.484536 
[25]	train-mcc:0.000000	test-mcc:0.484091 
[26]	train-mcc:0.000000	test-mcc:0.484006 
[27]	train-mcc:0.000000	test-mcc:0.483907 
[28]	train-mcc:0.000000	test-mcc:0.483056 
[29]	train-mcc:0.000000	test-mcc:0.484183 
[30]	train-mcc:0.000000	test-mcc:0.483056 
[31]	train-mcc:0.000000	test-mcc:0.484460 
[32]	train-mcc:0.000000	test-mcc:0.484038 
[33]	train-mcc:0.000000	test-mcc:0.484914 
[34]	train-mcc:0.000000	test-mcc:0.485573 
[35]	train-mcc:0.000000	test-mcc:0.485573 
[36]	train-mcc:0.000000	test-mcc:0.485573 
[37]	train-mcc:0.000000	test-mcc:0.485294 
[38]	train-mcc:0.000000	test-mcc:0.486137 
[39]	train-mcc:0.000000	test-mcc:0.485438 
[40]	train-mcc:0.000000	test-mcc:0.486385 
[41]	train-mcc:0.000000	test-mcc:0.486011 
[42]	train-mcc:0.000000	test-mcc:0.485016 
[43]	train-mcc:0.000000	test-mcc:0.484595 
[44]	train-mcc:0.000000	test-mcc:0.483759 
[45]	train-mcc:0.000000	test-mcc:0.484604 
[46]	train-mcc:0.000000	test-mcc:0.484874 
[47]	train-mcc:0.000000	test-mcc:0.485161 
[48]	train-mcc:0.000000	test-mcc:0.485350 
[49]	train-mcc:0.000000	test-mcc:0.486216 
[50]	train-mcc:0.000000	test-mcc:0.486132 
[51]	train-mcc:0.000000	test-mcc:0.486385 
[52]	train-mcc:0.000000	test-mcc:0.486937 
[53]	train-mcc:0.000000	test-mcc:0.486687 
[54]	train-mcc:0.000000	test-mcc:0.486822 
[55]	train-mcc:0.000000	test-mcc:0.487611 
[56]	train-mcc:0.000000	test-mcc:0.487611 
[57]	train-mcc:0.000000	test-mcc:0.485944 
[58]	train-mcc:0.000000	test-mcc:0.486011 
[59]	train-mcc:0.000000	test-mcc:0.485949 
[60]	train-mcc:0.000000	test-mcc:0.485301 
[61]	train-mcc:0.000000	test-mcc:0.485019 
[62]	train-mcc:0.000000	test-mcc:0.484038 
[63]	train-mcc:0.000000	test-mcc:0.483943 
[64]	train-mcc:0.000000	test-mcc:0.485350 
[65]	train-mcc:0.000000	test-mcc:0.484762 
[66]	train-mcc:0.000000	test-mcc:0.484762 
[67]	train-mcc:0.000000	test-mcc:0.484918 
[68]	train-mcc:0.000000	test-mcc:0.483895 
[69]	train-mcc:0.000000	test-mcc:0.483895 
[70]	train-mcc:0.000000	test-mcc:0.483895 
[71]	train-mcc:0.000000	test-mcc:0.484595 
[72]	train-mcc:0.000000	test-mcc:0.483754 
[73]	train-mcc:0.000000	test-mcc:0.484316 
[74]	train-mcc:0.000000	test-mcc:0.485016 
[75]	train-mcc:0.000000	test-mcc:0.484376 
[76]	train-mcc:0.000000	test-mcc:0.486285 
[77]	train-mcc:0.000000	test-mcc:0.485892 
[78]	train-mcc:0.000000	test-mcc:0.485892 
[79]	train-mcc:0.000000	test-mcc:0.485892 
[80]	train-mcc:0.000000	test-mcc:0.485350 
[81]	train-mcc:0.000000	test-mcc:0.486413 
[82]	train-mcc:0.000000	test-mcc:0.485993 
[83]	train-mcc:0.000000	test-mcc:0.486413 
[84]	train-mcc:0.000000	test-mcc:0.486560 
[85]	train-mcc:0.000000	test-mcc:0.486137 
Stopping. Best iteration:
[55]	train-mcc:0.000000	test-mcc:0.487611


Time: Thu Nov 10 2016 05:36:25 AM
For 0055 rounds: train_mcc: 0 - test_mcc: 0.4876111
Confusion matrix:
     truth
preds      0      1
    0 235259    957
    1    114    419
     truth
preds            0            1
    0 0.9937064148 0.0040422557
    1 0.0004815226 0.0017698068
Iteration 4 (base=0.0845362): MCC=0.4876111 | threshold=0.4126



Iteration 4[3] on Thu Nov 10 2016 05:36:26 AM

depth=5, min_child_weight=33.91563, subsample=0.921018, colsample_bytree=0.8494715, base_score=0.0845362
[1]	train-mcc:0.000000	test-mcc:0.480362 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484759 
[3]	train-mcc:0.000000	test-mcc:0.488843 
[4]	train-mcc:0.000000	test-mcc:0.488664 
[5]	train-mcc:0.000000	test-mcc:0.488853 
[6]	train-mcc:0.000000	test-mcc:0.489285 
[7]	train-mcc:0.000000	test-mcc:0.490441 
[8]	train-mcc:0.000000	test-mcc:0.490811 
[9]	train-mcc:0.000000	test-mcc:0.491461 
[10]	train-mcc:0.000000	test-mcc:0.493525 
[11]	train-mcc:0.000000	test-mcc:0.493525 
[12]	train-mcc:0.000000	test-mcc:0.493525 
[13]	train-mcc:0.000000	test-mcc:0.493861 
[14]	train-mcc:0.000000	test-mcc:0.493163 
[15]	train-mcc:0.000000	test-mcc:0.493163 
[16]	train-mcc:0.000000	test-mcc:0.493861 
[17]	train-mcc:0.000000	test-mcc:0.494557 
[18]	train-mcc:0.000000	test-mcc:0.493861 
[19]	train-mcc:0.000000	test-mcc:0.493415 
[20]	train-mcc:0.000000	test-mcc:0.493415 
[21]	train-mcc:0.000000	test-mcc:0.493667 
[22]	train-mcc:0.000000	test-mcc:0.493667 
[23]	train-mcc:0.000000	test-mcc:0.494557 
[24]	train-mcc:0.000000	test-mcc:0.495254 
[25]	train-mcc:0.000000	test-mcc:0.495453 
[26]	train-mcc:0.000000	test-mcc:0.495453 
[27]	train-mcc:0.000000	test-mcc:0.495700 
[28]	train-mcc:0.000000	test-mcc:0.495588 
[29]	train-mcc:0.000000	test-mcc:0.495584 
[30]	train-mcc:0.000000	test-mcc:0.494646 
[31]	train-mcc:0.000000	test-mcc:0.494460 
[32]	train-mcc:0.000000	test-mcc:0.495348 
[33]	train-mcc:0.000000	test-mcc:0.495588 
[34]	train-mcc:0.000000	test-mcc:0.496990 
[35]	train-mcc:0.000000	test-mcc:0.496990 
[36]	train-mcc:0.000000	test-mcc:0.497237 
[37]	train-mcc:0.000000	test-mcc:0.496748 
[38]	train-mcc:0.000000	test-mcc:0.495820 
[39]	train-mcc:0.000000	test-mcc:0.495820 
[40]	train-mcc:0.000000	test-mcc:0.495820 
[41]	train-mcc:0.000000	test-mcc:0.496084 
[42]	train-mcc:0.000000	test-mcc:0.495359 
[43]	train-mcc:0.000000	test-mcc:0.494655 
[44]	train-mcc:0.000000	test-mcc:0.494655 
[45]	train-mcc:0.000000	test-mcc:0.495580 
[46]	train-mcc:0.000000	test-mcc:0.495130 
[47]	train-mcc:0.000000	test-mcc:0.495130 
[48]	train-mcc:0.000000	test-mcc:0.494266 
[49]	train-mcc:0.000000	test-mcc:0.495380 
[50]	train-mcc:0.000000	test-mcc:0.494669 
[51]	train-mcc:0.000000	test-mcc:0.495378 
[52]	train-mcc:0.000000	test-mcc:0.495378 
[53]	train-mcc:0.000000	test-mcc:0.494810 
[54]	train-mcc:0.000000	test-mcc:0.496011 
[55]	train-mcc:0.000000	test-mcc:0.494709 
[56]	train-mcc:0.000000	test-mcc:0.495453 
[57]	train-mcc:0.000000	test-mcc:0.495018 
[58]	train-mcc:0.000000	test-mcc:0.494709 
[59]	train-mcc:0.000000	test-mcc:0.494709 
[60]	train-mcc:0.000000	test-mcc:0.493083 
[61]	train-mcc:0.000000	test-mcc:0.493927 
[62]	train-mcc:0.000000	test-mcc:0.494351 
[63]	train-mcc:0.000000	test-mcc:0.494776 
[64]	train-mcc:0.000000	test-mcc:0.496418 
[65]	train-mcc:0.000000	test-mcc:0.496154 
[66]	train-mcc:0.000000	test-mcc:0.494676 
Stopping. Best iteration:
[36]	train-mcc:0.000000	test-mcc:0.497237


Time: Thu Nov 10 2016 05:38:37 AM
For 0036 rounds: train_mcc: 0 - test_mcc: 0.4972366
Confusion matrix:
     truth
preds      0      1
    0 235270    950
    1    104    426
     truth
preds            0            1
    0 0.9937486800 0.0040126716
    1 0.0004392819 0.0017993664
Iteration 4 (base=0.0845362): MCC=0.4972366 | threshold=0.4011129



Iteration 4[4] on Thu Nov 10 2016 05:38:39 AM

depth=5, min_child_weight=33.91563, subsample=0.921018, colsample_bytree=0.8494715, base_score=0.0845362
[1]	train-mcc:0.000000	test-mcc:0.481687 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482040 
[3]	train-mcc:0.000000	test-mcc:0.484779 
[4]	train-mcc:0.000000	test-mcc:0.487135 
[5]	train-mcc:0.000000	test-mcc:0.486564 
[6]	train-mcc:0.000000	test-mcc:0.486940 
[7]	train-mcc:0.000000	test-mcc:0.488720 
[8]	train-mcc:0.000000	test-mcc:0.488319 
[9]	train-mcc:0.000000	test-mcc:0.487897 
[10]	train-mcc:0.000000	test-mcc:0.489150 
[11]	train-mcc:0.000000	test-mcc:0.488055 
[12]	train-mcc:0.000000	test-mcc:0.488055 
[13]	train-mcc:0.000000	test-mcc:0.487380 
[14]	train-mcc:0.000000	test-mcc:0.487018 
[15]	train-mcc:0.000000	test-mcc:0.486725 
[16]	train-mcc:0.000000	test-mcc:0.485934 
[17]	train-mcc:0.000000	test-mcc:0.485540 
[18]	train-mcc:0.000000	test-mcc:0.486222 
[19]	train-mcc:0.000000	test-mcc:0.486477 
[20]	train-mcc:0.000000	test-mcc:0.487823 
[21]	train-mcc:0.000000	test-mcc:0.487274 
[22]	train-mcc:0.000000	test-mcc:0.486928 
[23]	train-mcc:0.000000	test-mcc:0.488257 
[24]	train-mcc:0.000000	test-mcc:0.487607 
[25]	train-mcc:0.000000	test-mcc:0.488572 
[26]	train-mcc:0.000000	test-mcc:0.488572 
[27]	train-mcc:0.000000	test-mcc:0.488572 
[28]	train-mcc:0.000000	test-mcc:0.488360 
[29]	train-mcc:0.000000	test-mcc:0.487465 
[30]	train-mcc:0.000000	test-mcc:0.488669 
[31]	train-mcc:0.000000	test-mcc:0.488864 
[32]	train-mcc:0.000000	test-mcc:0.488793 
[33]	train-mcc:0.000000	test-mcc:0.487862 
[34]	train-mcc:0.000000	test-mcc:0.488305 
[35]	train-mcc:0.000000	test-mcc:0.489243 
[36]	train-mcc:0.000000	test-mcc:0.489557 
[37]	train-mcc:0.000000	test-mcc:0.489557 
[38]	train-mcc:0.000000	test-mcc:0.489243 
[39]	train-mcc:0.000000	test-mcc:0.488594 
[40]	train-mcc:0.000000	test-mcc:0.487318 
[41]	train-mcc:0.000000	test-mcc:0.487864 
[42]	train-mcc:0.000000	test-mcc:0.488552 
[43]	train-mcc:0.000000	test-mcc:0.488552 
[44]	train-mcc:0.000000	test-mcc:0.488168 
[45]	train-mcc:0.000000	test-mcc:0.489852 
[46]	train-mcc:0.000000	test-mcc:0.489536 
[47]	train-mcc:0.000000	test-mcc:0.489794 
[48]	train-mcc:0.000000	test-mcc:0.489536 
[49]	train-mcc:0.000000	test-mcc:0.489871 
[50]	train-mcc:0.000000	test-mcc:0.489557 
[51]	train-mcc:0.000000	test-mcc:0.487490 
[52]	train-mcc:0.000000	test-mcc:0.486414 
[53]	train-mcc:0.000000	test-mcc:0.486876 
[54]	train-mcc:0.000000	test-mcc:0.487799 
[55]	train-mcc:0.000000	test-mcc:0.487744 
[56]	train-mcc:0.000000	test-mcc:0.488454 
[57]	train-mcc:0.000000	test-mcc:0.486356 
[58]	train-mcc:0.000000	test-mcc:0.486356 
[59]	train-mcc:0.000000	test-mcc:0.488669 
[60]	train-mcc:0.000000	test-mcc:0.489098 
[61]	train-mcc:0.000000	test-mcc:0.489098 
[62]	train-mcc:0.000000	test-mcc:0.488617 
[63]	train-mcc:0.000000	test-mcc:0.487842 
[64]	train-mcc:0.000000	test-mcc:0.487835 
[65]	train-mcc:0.000000	test-mcc:0.487848 
[66]	train-mcc:0.000000	test-mcc:0.485866 
[67]	train-mcc:0.000000	test-mcc:0.486820 
[68]	train-mcc:0.000000	test-mcc:0.486514 
[69]	train-mcc:0.000000	test-mcc:0.487380 
[70]	train-mcc:0.000000	test-mcc:0.486393 
[71]	train-mcc:0.000000	test-mcc:0.486393 
[72]	train-mcc:0.000000	test-mcc:0.485716 
[73]	train-mcc:0.000000	test-mcc:0.485716 
[74]	train-mcc:0.000000	test-mcc:0.484940 
[75]	train-mcc:0.000000	test-mcc:0.484725 
[76]	train-mcc:0.000000	test-mcc:0.484725 
[77]	train-mcc:0.000000	test-mcc:0.484731 
[78]	train-mcc:0.000000	test-mcc:0.485377 
[79]	train-mcc:0.000000	test-mcc:0.486023 
Stopping. Best iteration:
[49]	train-mcc:0.000000	test-mcc:0.489871


Time: Thu Nov 10 2016 05:41:14 AM
For 0049 rounds: train_mcc: 0 - test_mcc: 0.4898708
Confusion matrix:
     truth
preds      0      1
    0 235097    863
    1    277    513
     truth
preds           0           1
    0 0.993017951 0.003645195
    1 0.001170011 0.002166843
Iteration 4 (base=0.0845362): MCC=0.4898708 | threshold=0.2418852



Iteration 4[5] on Thu Nov 10 2016 05:41:15 AM

depth=5, min_child_weight=33.91563, subsample=0.921018, colsample_bytree=0.8494715, base_score=0.0845362
[1]	train-mcc:0.000000	test-mcc:0.484806 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488533 
[3]	train-mcc:0.000000	test-mcc:0.494411 
[4]	train-mcc:0.000000	test-mcc:0.492777 
[5]	train-mcc:0.000000	test-mcc:0.493551 
[6]	train-mcc:0.000000	test-mcc:0.495700 
[7]	train-mcc:0.000000	test-mcc:0.497257 
[8]	train-mcc:0.000000	test-mcc:0.496148 
[9]	train-mcc:0.000000	test-mcc:0.494756 
[10]	train-mcc:0.000000	test-mcc:0.495206 
[11]	train-mcc:0.000000	test-mcc:0.495902 
[12]	train-mcc:0.000000	test-mcc:0.496049 
[13]	train-mcc:0.000000	test-mcc:0.496049 
[14]	train-mcc:0.000000	test-mcc:0.495348 
[15]	train-mcc:0.000000	test-mcc:0.495348 
[16]	train-mcc:0.000000	test-mcc:0.495818 
[17]	train-mcc:0.000000	test-mcc:0.494879 
[18]	train-mcc:0.000000	test-mcc:0.495418 
[19]	train-mcc:0.000000	test-mcc:0.496946 
[20]	train-mcc:0.000000	test-mcc:0.496259 
[21]	train-mcc:0.000000	test-mcc:0.496372 
[22]	train-mcc:0.000000	test-mcc:0.495955 
[23]	train-mcc:0.000000	test-mcc:0.495955 
[24]	train-mcc:0.000000	test-mcc:0.498054 
[25]	train-mcc:0.000000	test-mcc:0.498054 
[26]	train-mcc:0.000000	test-mcc:0.497325 
[27]	train-mcc:0.000000	test-mcc:0.495538 
[28]	train-mcc:0.000000	test-mcc:0.497270 
[29]	train-mcc:0.000000	test-mcc:0.495838 
[30]	train-mcc:0.000000	test-mcc:0.495686 
[31]	train-mcc:0.000000	test-mcc:0.496105 
[32]	train-mcc:0.000000	test-mcc:0.495418 
[33]	train-mcc:0.000000	test-mcc:0.494617 
[34]	train-mcc:0.000000	test-mcc:0.495041 
[35]	train-mcc:0.000000	test-mcc:0.495041 
[36]	train-mcc:0.000000	test-mcc:0.495121 
[37]	train-mcc:0.000000	test-mcc:0.495797 
[38]	train-mcc:0.000000	test-mcc:0.495106 
[39]	train-mcc:0.000000	test-mcc:0.494248 
[40]	train-mcc:0.000000	test-mcc:0.493632 
[41]	train-mcc:0.000000	test-mcc:0.492837 
[42]	train-mcc:0.000000	test-mcc:0.493520 
[43]	train-mcc:0.000000	test-mcc:0.492037 
[44]	train-mcc:0.000000	test-mcc:0.492037 
[45]	train-mcc:0.000000	test-mcc:0.492037 
[46]	train-mcc:0.000000	test-mcc:0.491639 
[47]	train-mcc:0.000000	test-mcc:0.491639 
[48]	train-mcc:0.000000	test-mcc:0.492837 
[49]	train-mcc:0.000000	test-mcc:0.494448 
[50]	train-mcc:0.000000	test-mcc:0.494086 
[51]	train-mcc:0.000000	test-mcc:0.493687 
[52]	train-mcc:0.000000	test-mcc:0.493290 
[53]	train-mcc:0.000000	test-mcc:0.493290 
[54]	train-mcc:0.000000	test-mcc:0.492499 
Stopping. Best iteration:
[24]	train-mcc:0.000000	test-mcc:0.498054


Time: Thu Nov 10 2016 05:43:04 AM
For 0024 rounds: train_mcc: 0 - test_mcc: 0.4980541
Confusion matrix:
     truth
preds      0      1
    0 235230    923
    1    144    453
     truth
preds            0            1
    0 0.9935797254 0.0038986272
    1 0.0006082365 0.0019134108
Iteration 4 (base=0.0845362): MCC=0.4980541 | threshold=0.3204263


===




Iteration 5[1] on Thu Nov 10 2016 05:43:14 AM

depth=9, min_child_weight=29.61737, subsample=0.8758997, colsample_bytree=0.9241473, base_score=0.1464266
[1]	train-mcc:0.000000	test-mcc:0.471926 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.473678 
[3]	train-mcc:0.000000	test-mcc:0.471829 
[4]	train-mcc:0.000000	test-mcc:0.473012 
[5]	train-mcc:0.000000	test-mcc:0.477464 
[6]	train-mcc:0.000000	test-mcc:0.477730 
[7]	train-mcc:0.000000	test-mcc:0.477104 
[8]	train-mcc:0.000000	test-mcc:0.473552 
[9]	train-mcc:0.000000	test-mcc:0.474952 
[10]	train-mcc:0.000000	test-mcc:0.474995 
[11]	train-mcc:0.000000	test-mcc:0.475264 
[12]	train-mcc:0.000000	test-mcc:0.474643 
[13]	train-mcc:0.000000	test-mcc:0.474708 
[14]	train-mcc:0.000000	test-mcc:0.475874 
[15]	train-mcc:0.000000	test-mcc:0.476786 
[16]	train-mcc:0.000000	test-mcc:0.476786 
[17]	train-mcc:0.000000	test-mcc:0.475239 
[18]	train-mcc:0.000000	test-mcc:0.476948 
[19]	train-mcc:0.000000	test-mcc:0.475977 
[20]	train-mcc:0.000000	test-mcc:0.475884 
[21]	train-mcc:0.000000	test-mcc:0.476435 
[22]	train-mcc:0.000000	test-mcc:0.477433 
[23]	train-mcc:0.000000	test-mcc:0.477200 
[24]	train-mcc:0.000000	test-mcc:0.476473 
[25]	train-mcc:0.000000	test-mcc:0.476827 
[26]	train-mcc:0.000000	test-mcc:0.476286 
[27]	train-mcc:0.000000	test-mcc:0.476062 
[28]	train-mcc:0.000000	test-mcc:0.476497 
[29]	train-mcc:0.000000	test-mcc:0.477223 
[30]	train-mcc:0.000000	test-mcc:0.476497 
[31]	train-mcc:0.000000	test-mcc:0.476024 
[32]	train-mcc:0.000000	test-mcc:0.475995 
[33]	train-mcc:0.000000	test-mcc:0.476246 
[34]	train-mcc:0.000000	test-mcc:0.475677 
[35]	train-mcc:0.000000	test-mcc:0.475552 
[36]	train-mcc:0.000000	test-mcc:0.476024 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.477730


Time: Thu Nov 10 2016 05:45:10 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4777297
Confusion matrix:
     truth
preds      0      1
    0 235225    949
    1    148    426
     truth
preds            0            1
    0 0.9935669995 0.0040084816
    1 0.0006251373 0.0017993816
Iteration 5 (base=0.1464266): MCC=0.4777297 | threshold=0.3374757



Iteration 5[2] on Thu Nov 10 2016 05:45:12 AM

depth=9, min_child_weight=29.61737, subsample=0.8758997, colsample_bytree=0.9241473, base_score=0.1464266
[1]	train-mcc:0.000000	test-mcc:0.476877 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483365 
[3]	train-mcc:0.000000	test-mcc:0.483373 
[4]	train-mcc:0.000000	test-mcc:0.483118 
[5]	train-mcc:0.000000	test-mcc:0.486293 
[6]	train-mcc:0.000000	test-mcc:0.486404 
[7]	train-mcc:0.000000	test-mcc:0.483635 
[8]	train-mcc:0.000000	test-mcc:0.483556 
[9]	train-mcc:0.000000	test-mcc:0.484271 
[10]	train-mcc:0.000000	test-mcc:0.485978 
[11]	train-mcc:0.000000	test-mcc:0.486087 
[12]	train-mcc:0.000000	test-mcc:0.483289 
[13]	train-mcc:0.000000	test-mcc:0.484141 
[14]	train-mcc:0.000000	test-mcc:0.483267 
[15]	train-mcc:0.000000	test-mcc:0.483038 
[16]	train-mcc:0.000000	test-mcc:0.483267 
[17]	train-mcc:0.000000	test-mcc:0.483591 
[18]	train-mcc:0.000000	test-mcc:0.484313 
[19]	train-mcc:0.000000	test-mcc:0.483096 
[20]	train-mcc:0.000000	test-mcc:0.482764 
[21]	train-mcc:0.000000	test-mcc:0.484177 
[22]	train-mcc:0.000000	test-mcc:0.487523 
[23]	train-mcc:0.000000	test-mcc:0.486470 
[24]	train-mcc:0.000000	test-mcc:0.485318 
[25]	train-mcc:0.000000	test-mcc:0.485226 
[26]	train-mcc:0.000000	test-mcc:0.484644 
[27]	train-mcc:0.000000	test-mcc:0.484644 
[28]	train-mcc:0.000000	test-mcc:0.484932 
[29]	train-mcc:0.000000	test-mcc:0.484006 
[30]	train-mcc:0.000000	test-mcc:0.485195 
[31]	train-mcc:0.000000	test-mcc:0.486624 
[32]	train-mcc:0.000000	test-mcc:0.485431 
[33]	train-mcc:0.000000	test-mcc:0.487097 
[34]	train-mcc:0.000000	test-mcc:0.485670 
[35]	train-mcc:0.000000	test-mcc:0.484715 
[36]	train-mcc:0.000000	test-mcc:0.485944 
[37]	train-mcc:0.000000	test-mcc:0.485944 
[38]	train-mcc:0.000000	test-mcc:0.486165 
[39]	train-mcc:0.000000	test-mcc:0.484519 
[40]	train-mcc:0.000000	test-mcc:0.485670 
[41]	train-mcc:0.000000	test-mcc:0.486384 
[42]	train-mcc:0.000000	test-mcc:0.483046 
[43]	train-mcc:0.000000	test-mcc:0.483521 
[44]	train-mcc:0.000000	test-mcc:0.482228 
[45]	train-mcc:0.000000	test-mcc:0.481784 
[46]	train-mcc:0.000000	test-mcc:0.480631 
[47]	train-mcc:0.000000	test-mcc:0.480474 
[48]	train-mcc:0.000000	test-mcc:0.481034 
[49]	train-mcc:0.000000	test-mcc:0.481034 
[50]	train-mcc:0.000000	test-mcc:0.481492 
[51]	train-mcc:0.000000	test-mcc:0.481360 
[52]	train-mcc:0.000000	test-mcc:0.480688 
Stopping. Best iteration:
[22]	train-mcc:0.000000	test-mcc:0.487523


Time: Thu Nov 10 2016 05:48:17 AM
For 0022 rounds: train_mcc: 0 - test_mcc: 0.4875233
Confusion matrix:
     truth
preds      0      1
    0 235298    984
    1     75    392
     truth
preds            0            1
    0 0.9938711462 0.0041563006
    1 0.0003167912 0.0016557620
Iteration 5 (base=0.1464266): MCC=0.4875233 | threshold=0.471748



Iteration 5[3] on Thu Nov 10 2016 05:48:18 AM

depth=9, min_child_weight=29.61737, subsample=0.8758997, colsample_bytree=0.9241473, base_score=0.1464266
[1]	train-mcc:0.000000	test-mcc:0.485459 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487311 
[3]	train-mcc:0.000000	test-mcc:0.494487 
[4]	train-mcc:0.000000	test-mcc:0.494182 
[5]	train-mcc:0.000000	test-mcc:0.493673 
[6]	train-mcc:0.000000	test-mcc:0.493480 
[7]	train-mcc:0.000000	test-mcc:0.497043 
[8]	train-mcc:0.000000	test-mcc:0.497002 
[9]	train-mcc:0.000000	test-mcc:0.493745 
[10]	train-mcc:0.000000	test-mcc:0.495588 
[11]	train-mcc:0.000000	test-mcc:0.497213 
[12]	train-mcc:0.000000	test-mcc:0.497213 
[13]	train-mcc:0.000000	test-mcc:0.495359 
[14]	train-mcc:0.000000	test-mcc:0.494451 
[15]	train-mcc:0.000000	test-mcc:0.495113 
[16]	train-mcc:0.000000	test-mcc:0.494972 
[17]	train-mcc:0.000000	test-mcc:0.493942 
[18]	train-mcc:0.000000	test-mcc:0.492769 
[19]	train-mcc:0.000000	test-mcc:0.493111 
[20]	train-mcc:0.000000	test-mcc:0.496535 
[21]	train-mcc:0.000000	test-mcc:0.496535 
[22]	train-mcc:0.000000	test-mcc:0.495820 
[23]	train-mcc:0.000000	test-mcc:0.496519 
[24]	train-mcc:0.000000	test-mcc:0.498412 
[25]	train-mcc:0.000000	test-mcc:0.497237 
[26]	train-mcc:0.000000	test-mcc:0.495814 
[27]	train-mcc:0.000000	test-mcc:0.495814 
[28]	train-mcc:0.000000	test-mcc:0.495167 
[29]	train-mcc:0.000000	test-mcc:0.496535 
[30]	train-mcc:0.000000	test-mcc:0.493982 
[31]	train-mcc:0.000000	test-mcc:0.493982 
[32]	train-mcc:0.000000	test-mcc:0.495359 
[33]	train-mcc:0.000000	test-mcc:0.495359 
[34]	train-mcc:0.000000	test-mcc:0.494899 
[35]	train-mcc:0.000000	test-mcc:0.494439 
[36]	train-mcc:0.000000	test-mcc:0.495411 
[37]	train-mcc:0.000000	test-mcc:0.495411 
[38]	train-mcc:0.000000	test-mcc:0.495598 
[39]	train-mcc:0.000000	test-mcc:0.496058 
[40]	train-mcc:0.000000	test-mcc:0.496514 
[41]	train-mcc:0.000000	test-mcc:0.497680 
[42]	train-mcc:0.000000	test-mcc:0.497691 
[43]	train-mcc:0.000000	test-mcc:0.497691 
[44]	train-mcc:0.000000	test-mcc:0.497525 
[45]	train-mcc:0.000000	test-mcc:0.496748 
[46]	train-mcc:0.000000	test-mcc:0.496309 
[47]	train-mcc:0.000000	test-mcc:0.496309 
[48]	train-mcc:0.000000	test-mcc:0.494681 
[49]	train-mcc:0.000000	test-mcc:0.496296 
[50]	train-mcc:0.000000	test-mcc:0.495414 
[51]	train-mcc:0.000000	test-mcc:0.495348 
[52]	train-mcc:0.000000	test-mcc:0.494413 
[53]	train-mcc:0.000000	test-mcc:0.495833 
[54]	train-mcc:0.000000	test-mcc:0.494198 
Stopping. Best iteration:
[24]	train-mcc:0.000000	test-mcc:0.498412


Time: Thu Nov 10 2016 05:51:19 AM
For 0024 rounds: train_mcc: 0 - test_mcc: 0.4984123
Confusion matrix:
     truth
preds      0      1
    0 235271    949
    1    103    427
     truth
preds            0            1
    0 0.9937529039 0.0040084477
    1 0.0004350581 0.0018035903
Iteration 5 (base=0.1464266): MCC=0.4984123 | threshold=0.4150382



Iteration 5[4] on Thu Nov 10 2016 05:51:20 AM

depth=9, min_child_weight=29.61737, subsample=0.8758997, colsample_bytree=0.9241473, base_score=0.1464266
[1]	train-mcc:0.000000	test-mcc:0.478126 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481639 
[3]	train-mcc:0.000000	test-mcc:0.483590 
[4]	train-mcc:0.000000	test-mcc:0.485665 
[5]	train-mcc:0.000000	test-mcc:0.486292 
[6]	train-mcc:0.000000	test-mcc:0.484234 
[7]	train-mcc:0.000000	test-mcc:0.485938 
[8]	train-mcc:0.000000	test-mcc:0.482737 
[9]	train-mcc:0.000000	test-mcc:0.483419 
[10]	train-mcc:0.000000	test-mcc:0.481466 
[11]	train-mcc:0.000000	test-mcc:0.482004 
[12]	train-mcc:0.000000	test-mcc:0.481900 
[13]	train-mcc:0.000000	test-mcc:0.480295 
[14]	train-mcc:0.000000	test-mcc:0.479576 
[15]	train-mcc:0.000000	test-mcc:0.479699 
[16]	train-mcc:0.000000	test-mcc:0.480347 
[17]	train-mcc:0.000000	test-mcc:0.480882 
[18]	train-mcc:0.000000	test-mcc:0.480245 
[19]	train-mcc:0.000000	test-mcc:0.481435 
[20]	train-mcc:0.000000	test-mcc:0.481844 
[21]	train-mcc:0.000000	test-mcc:0.481678 
[22]	train-mcc:0.000000	test-mcc:0.481266 
[23]	train-mcc:0.000000	test-mcc:0.481266 
[24]	train-mcc:0.000000	test-mcc:0.480854 
[25]	train-mcc:0.000000	test-mcc:0.480093 
[26]	train-mcc:0.000000	test-mcc:0.482665 
[27]	train-mcc:0.000000	test-mcc:0.482134 
[28]	train-mcc:0.000000	test-mcc:0.481005 
[29]	train-mcc:0.000000	test-mcc:0.480569 
[30]	train-mcc:0.000000	test-mcc:0.479026 
[31]	train-mcc:0.000000	test-mcc:0.479692 
[32]	train-mcc:0.000000	test-mcc:0.480735 
[33]	train-mcc:0.000000	test-mcc:0.480620 
[34]	train-mcc:0.000000	test-mcc:0.480104 
[35]	train-mcc:0.000000	test-mcc:0.480060 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.486292


Time: Thu Nov 10 2016 05:53:26 AM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.486292
Confusion matrix:
     truth
preds      0      1
    0 235165    903
    1    209    473
     truth
preds            0            1
    0 0.9933051742 0.0038141499
    1 0.0008827878 0.0019978881
Iteration 5 (base=0.1464266): MCC=0.486292 | threshold=0.244987



Iteration 5[5] on Thu Nov 10 2016 05:53:27 AM

depth=9, min_child_weight=29.61737, subsample=0.8758997, colsample_bytree=0.9241473, base_score=0.1464266
[1]	train-mcc:0.000000	test-mcc:0.488607 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488050 
[3]	train-mcc:0.000000	test-mcc:0.486937 
[4]	train-mcc:0.000000	test-mcc:0.488054 
[5]	train-mcc:0.000000	test-mcc:0.488065 
[6]	train-mcc:0.000000	test-mcc:0.488853 
[7]	train-mcc:0.000000	test-mcc:0.489199 
[8]	train-mcc:0.000000	test-mcc:0.490588 
[9]	train-mcc:0.000000	test-mcc:0.489388 
[10]	train-mcc:0.000000	test-mcc:0.488652 
[11]	train-mcc:0.000000	test-mcc:0.488652 
[12]	train-mcc:0.000000	test-mcc:0.488462 
[13]	train-mcc:0.000000	test-mcc:0.489179 
[14]	train-mcc:0.000000	test-mcc:0.489232 
[15]	train-mcc:0.000000	test-mcc:0.488031 
[16]	train-mcc:0.000000	test-mcc:0.488679 
[17]	train-mcc:0.000000	test-mcc:0.489179 
[18]	train-mcc:0.000000	test-mcc:0.488758 
[19]	train-mcc:0.000000	test-mcc:0.486150 
[20]	train-mcc:0.000000	test-mcc:0.485450 
[21]	train-mcc:0.000000	test-mcc:0.486361 
[22]	train-mcc:0.000000	test-mcc:0.488776 
[23]	train-mcc:0.000000	test-mcc:0.487950 
[24]	train-mcc:0.000000	test-mcc:0.487810 
[25]	train-mcc:0.000000	test-mcc:0.487413 
[26]	train-mcc:0.000000	test-mcc:0.487700 
[27]	train-mcc:0.000000	test-mcc:0.488913 
[28]	train-mcc:0.000000	test-mcc:0.489191 
[29]	train-mcc:0.000000	test-mcc:0.489104 
[30]	train-mcc:0.000000	test-mcc:0.490152 
[31]	train-mcc:0.000000	test-mcc:0.487723 
[32]	train-mcc:0.000000	test-mcc:0.487723 
[33]	train-mcc:0.000000	test-mcc:0.486593 
[34]	train-mcc:0.000000	test-mcc:0.487454 
[35]	train-mcc:0.000000	test-mcc:0.488754 
[36]	train-mcc:0.000000	test-mcc:0.488664 
[37]	train-mcc:0.000000	test-mcc:0.487388 
[38]	train-mcc:0.000000	test-mcc:0.487803 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.490588


Time: Thu Nov 10 2016 05:55:31 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4905876
Confusion matrix:
     truth
preds      0      1
    0 235240    940
    1    134    436
     truth
preds            0            1
    0 0.9936219641 0.0039704329
    1 0.0005659979 0.0018416051
Iteration 5 (base=0.1464266): MCC=0.4905876 | threshold=0.324282


===




Iteration 6[1] on Thu Nov 10 2016 05:55:40 AM

depth=6, min_child_weight=29.54808, subsample=0.5705054, colsample_bytree=0.9195295, base_score=0.3262698
[1]	train-mcc:0.000000	test-mcc:0.468621 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474451 
[3]	train-mcc:0.000000	test-mcc:0.474892 
[4]	train-mcc:0.000000	test-mcc:0.472668 
[5]	train-mcc:0.000000	test-mcc:0.472855 
[6]	train-mcc:0.000000	test-mcc:0.472221 
[7]	train-mcc:0.000000	test-mcc:0.474213 
[8]	train-mcc:0.000000	test-mcc:0.475690 
[9]	train-mcc:0.000000	test-mcc:0.474466 
[10]	train-mcc:0.000000	test-mcc:0.474768 
[11]	train-mcc:0.000000	test-mcc:0.474666 
[12]	train-mcc:0.000000	test-mcc:0.475470 
[13]	train-mcc:0.000000	test-mcc:0.477366 
[14]	train-mcc:0.000000	test-mcc:0.476844 
[15]	train-mcc:0.000000	test-mcc:0.475884 
[16]	train-mcc:0.000000	test-mcc:0.476177 
[17]	train-mcc:0.000000	test-mcc:0.478690 
[18]	train-mcc:0.000000	test-mcc:0.478000 
[19]	train-mcc:0.000000	test-mcc:0.475522 
[20]	train-mcc:0.000000	test-mcc:0.476620 
[21]	train-mcc:0.000000	test-mcc:0.477196 
[22]	train-mcc:0.000000	test-mcc:0.476853 
[23]	train-mcc:0.000000	test-mcc:0.476314 
[24]	train-mcc:0.000000	test-mcc:0.476082 
[25]	train-mcc:0.000000	test-mcc:0.476853 
[26]	train-mcc:0.000000	test-mcc:0.478287 
[27]	train-mcc:0.000000	test-mcc:0.477668 
[28]	train-mcc:0.000000	test-mcc:0.476999 
[29]	train-mcc:0.000000	test-mcc:0.477740 
[30]	train-mcc:0.000000	test-mcc:0.477354 
[31]	train-mcc:0.000000	test-mcc:0.476611 
[32]	train-mcc:0.000000	test-mcc:0.476723 
[33]	train-mcc:0.000000	test-mcc:0.476454 
[34]	train-mcc:0.000000	test-mcc:0.476637 
[35]	train-mcc:0.000000	test-mcc:0.476503 
[36]	train-mcc:0.000000	test-mcc:0.475884 
[37]	train-mcc:0.000000	test-mcc:0.475884 
[38]	train-mcc:0.000000	test-mcc:0.475870 
[39]	train-mcc:0.000000	test-mcc:0.475000 
[40]	train-mcc:0.000000	test-mcc:0.475000 
[41]	train-mcc:0.000000	test-mcc:0.475118 
[42]	train-mcc:0.000000	test-mcc:0.475757 
[43]	train-mcc:0.000000	test-mcc:0.475757 
[44]	train-mcc:0.000000	test-mcc:0.476398 
[45]	train-mcc:0.000000	test-mcc:0.476512 
[46]	train-mcc:0.000000	test-mcc:0.475875 
[47]	train-mcc:0.000000	test-mcc:0.476512 
Stopping. Best iteration:
[17]	train-mcc:0.000000	test-mcc:0.478690


Time: Thu Nov 10 2016 05:57:31 AM
For 0017 rounds: train_mcc: 0 - test_mcc: 0.4786903
Confusion matrix:
     truth
preds      0      1
    0 235324   1015
    1     49    360
     truth
preds            0            1
    0 0.9939851657 0.0042872590
    1 0.0002069711 0.0015206042
Iteration 6 (base=0.3262698): MCC=0.4786903 | threshold=0.5983818



Iteration 6[2] on Thu Nov 10 2016 05:57:33 AM

depth=6, min_child_weight=29.54808, subsample=0.5705054, colsample_bytree=0.9195295, base_score=0.3262698
[1]	train-mcc:0.000000	test-mcc:0.471644 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477014 
[3]	train-mcc:0.000000	test-mcc:0.483763 
[4]	train-mcc:0.000000	test-mcc:0.483304 
[5]	train-mcc:0.000000	test-mcc:0.483895 
[6]	train-mcc:0.000000	test-mcc:0.481669 
[7]	train-mcc:0.000000	test-mcc:0.482855 
[8]	train-mcc:0.000000	test-mcc:0.484249 
[9]	train-mcc:0.000000	test-mcc:0.482523 
[10]	train-mcc:0.000000	test-mcc:0.482070 
[11]	train-mcc:0.000000	test-mcc:0.481096 
[12]	train-mcc:0.000000	test-mcc:0.481517 
[13]	train-mcc:0.000000	test-mcc:0.481517 
[14]	train-mcc:0.000000	test-mcc:0.480520 
[15]	train-mcc:0.000000	test-mcc:0.481360 
[16]	train-mcc:0.000000	test-mcc:0.482672 
[17]	train-mcc:0.000000	test-mcc:0.483494 
[18]	train-mcc:0.000000	test-mcc:0.486687 
[19]	train-mcc:0.000000	test-mcc:0.485517 
[20]	train-mcc:0.000000	test-mcc:0.484767 
[21]	train-mcc:0.000000	test-mcc:0.483889 
[22]	train-mcc:0.000000	test-mcc:0.484094 
[23]	train-mcc:0.000000	test-mcc:0.483867 
[24]	train-mcc:0.000000	test-mcc:0.484716 
[25]	train-mcc:0.000000	test-mcc:0.485226 
[26]	train-mcc:0.000000	test-mcc:0.485318 
[27]	train-mcc:0.000000	test-mcc:0.485226 
[28]	train-mcc:0.000000	test-mcc:0.484970 
[29]	train-mcc:0.000000	test-mcc:0.484289 
[30]	train-mcc:0.000000	test-mcc:0.483338 
[31]	train-mcc:0.000000	test-mcc:0.484059 
[32]	train-mcc:0.000000	test-mcc:0.485949 
[33]	train-mcc:0.000000	test-mcc:0.486164 
[34]	train-mcc:0.000000	test-mcc:0.487564 
[35]	train-mcc:0.000000	test-mcc:0.486710 
[36]	train-mcc:0.000000	test-mcc:0.485016 
[37]	train-mcc:0.000000	test-mcc:0.485016 
[38]	train-mcc:0.000000	test-mcc:0.485016 
[39]	train-mcc:0.000000	test-mcc:0.485161 
[40]	train-mcc:0.000000	test-mcc:0.484460 
[41]	train-mcc:0.000000	test-mcc:0.484014 
[42]	train-mcc:0.000000	test-mcc:0.484758 
[43]	train-mcc:0.000000	test-mcc:0.484554 
[44]	train-mcc:0.000000	test-mcc:0.484457 
[45]	train-mcc:0.000000	test-mcc:0.483972 
[46]	train-mcc:0.000000	test-mcc:0.483282 
[47]	train-mcc:0.000000	test-mcc:0.482953 
[48]	train-mcc:0.000000	test-mcc:0.483468 
[49]	train-mcc:0.000000	test-mcc:0.484173 
[50]	train-mcc:0.000000	test-mcc:0.484661 
[51]	train-mcc:0.000000	test-mcc:0.486131 
[52]	train-mcc:0.000000	test-mcc:0.486622 
[53]	train-mcc:0.000000	test-mcc:0.484363 
[54]	train-mcc:0.000000	test-mcc:0.484107 
[55]	train-mcc:0.000000	test-mcc:0.484272 
[56]	train-mcc:0.000000	test-mcc:0.485260 
[57]	train-mcc:0.000000	test-mcc:0.484705 
[58]	train-mcc:0.000000	test-mcc:0.486724 
[59]	train-mcc:0.000000	test-mcc:0.485473 
[60]	train-mcc:0.000000	test-mcc:0.484184 
[61]	train-mcc:0.000000	test-mcc:0.484486 
[62]	train-mcc:0.000000	test-mcc:0.484486 
[63]	train-mcc:0.000000	test-mcc:0.485473 
[64]	train-mcc:0.000000	test-mcc:0.485849 
Stopping. Best iteration:
[34]	train-mcc:0.000000	test-mcc:0.487564


Time: Thu Nov 10 2016 05:59:58 AM
For 0034 rounds: train_mcc: 0 - test_mcc: 0.487564
Confusion matrix:
     truth
preds      0      1
    0 235232    940
    1    141    436
     truth
preds            0            1
    0 0.9935923700 0.0039704497
    1 0.0005955675 0.0018416128
Iteration 6 (base=0.3262698): MCC=0.487564 | threshold=0.3787336



Iteration 6[3] on Thu Nov 10 2016 06:00:00 AM

depth=6, min_child_weight=29.54808, subsample=0.5705054, colsample_bytree=0.9195295, base_score=0.3262698
[1]	train-mcc:0.000000	test-mcc:0.485459 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486154 
[3]	train-mcc:0.000000	test-mcc:0.487190 
[4]	train-mcc:0.000000	test-mcc:0.486298 
[5]	train-mcc:0.000000	test-mcc:0.486687 
[6]	train-mcc:0.000000	test-mcc:0.488056 
[7]	train-mcc:0.000000	test-mcc:0.487149 
[8]	train-mcc:0.000000	test-mcc:0.487149 
[9]	train-mcc:0.000000	test-mcc:0.488167 
[10]	train-mcc:0.000000	test-mcc:0.486454 
[11]	train-mcc:0.000000	test-mcc:0.486159 
[12]	train-mcc:0.000000	test-mcc:0.487443 
[13]	train-mcc:0.000000	test-mcc:0.488119 
[14]	train-mcc:0.000000	test-mcc:0.490004 
[15]	train-mcc:0.000000	test-mcc:0.487135 
[16]	train-mcc:0.000000	test-mcc:0.488266 
[17]	train-mcc:0.000000	test-mcc:0.489106 
[18]	train-mcc:0.000000	test-mcc:0.489872 
[19]	train-mcc:0.000000	test-mcc:0.488583 
[20]	train-mcc:0.000000	test-mcc:0.490244 
[21]	train-mcc:0.000000	test-mcc:0.489405 
[22]	train-mcc:0.000000	test-mcc:0.487907 
[23]	train-mcc:0.000000	test-mcc:0.489475 
[24]	train-mcc:0.000000	test-mcc:0.490552 
[25]	train-mcc:0.000000	test-mcc:0.490936 
[26]	train-mcc:0.000000	test-mcc:0.488776 
[27]	train-mcc:0.000000	test-mcc:0.488835 
[28]	train-mcc:0.000000	test-mcc:0.490557 
[29]	train-mcc:0.000000	test-mcc:0.490557 
[30]	train-mcc:0.000000	test-mcc:0.489981 
[31]	train-mcc:0.000000	test-mcc:0.489575 
[32]	train-mcc:0.000000	test-mcc:0.489325 
[33]	train-mcc:0.000000	test-mcc:0.488946 
[34]	train-mcc:0.000000	test-mcc:0.489926 
[35]	train-mcc:0.000000	test-mcc:0.491146 
[36]	train-mcc:0.000000	test-mcc:0.491609 
[37]	train-mcc:0.000000	test-mcc:0.491160 
[38]	train-mcc:0.000000	test-mcc:0.492159 
[39]	train-mcc:0.000000	test-mcc:0.493989 
[40]	train-mcc:0.000000	test-mcc:0.492597 
[41]	train-mcc:0.000000	test-mcc:0.491721 
[42]	train-mcc:0.000000	test-mcc:0.491129 
[43]	train-mcc:0.000000	test-mcc:0.492072 
[44]	train-mcc:0.000000	test-mcc:0.491633 
[45]	train-mcc:0.000000	test-mcc:0.491358 
[46]	train-mcc:0.000000	test-mcc:0.491593 
[47]	train-mcc:0.000000	test-mcc:0.491512 
[48]	train-mcc:0.000000	test-mcc:0.492064 
[49]	train-mcc:0.000000	test-mcc:0.491828 
[50]	train-mcc:0.000000	test-mcc:0.491478 
[51]	train-mcc:0.000000	test-mcc:0.493256 
[52]	train-mcc:0.000000	test-mcc:0.493719 
[53]	train-mcc:0.000000	test-mcc:0.492301 
[54]	train-mcc:0.000000	test-mcc:0.489952 
[55]	train-mcc:0.000000	test-mcc:0.489806 
[56]	train-mcc:0.000000	test-mcc:0.489524 
[57]	train-mcc:0.000000	test-mcc:0.489361 
[58]	train-mcc:0.000000	test-mcc:0.488320 
[59]	train-mcc:0.000000	test-mcc:0.489348 
[60]	train-mcc:0.000000	test-mcc:0.486968 
[61]	train-mcc:0.000000	test-mcc:0.487611 
[62]	train-mcc:0.000000	test-mcc:0.487689 
[63]	train-mcc:0.000000	test-mcc:0.488601 
[64]	train-mcc:0.000000	test-mcc:0.491368 
[65]	train-mcc:0.000000	test-mcc:0.490441 
[66]	train-mcc:0.000000	test-mcc:0.489285 
[67]	train-mcc:0.000000	test-mcc:0.491121 
[68]	train-mcc:0.000000	test-mcc:0.488765 
[69]	train-mcc:0.000000	test-mcc:0.489474 
Stopping. Best iteration:
[39]	train-mcc:0.000000	test-mcc:0.493989


Time: Thu Nov 10 2016 06:02:38 AM
For 0039 rounds: train_mcc: 0 - test_mcc: 0.493989
Confusion matrix:
     truth
preds      0      1
    0 235243    937
    1    131    439
     truth
preds            0            1
    0 0.9936346357 0.0039577614
    1 0.0005533263 0.0018542767
Iteration 6 (base=0.3262698): MCC=0.493989 | threshold=0.3693122



Iteration 6[4] on Thu Nov 10 2016 06:02:39 AM

depth=6, min_child_weight=29.54808, subsample=0.5705054, colsample_bytree=0.9195295, base_score=0.3262698
[1]	train-mcc:0.000000	test-mcc:0.486760 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487744 
[3]	train-mcc:0.000000	test-mcc:0.484885 
[4]	train-mcc:0.000000	test-mcc:0.483494 
[5]	train-mcc:0.000000	test-mcc:0.483736 
[6]	train-mcc:0.000000	test-mcc:0.484376 
[7]	train-mcc:0.000000	test-mcc:0.482490 
[8]	train-mcc:0.000000	test-mcc:0.485234 
[9]	train-mcc:0.000000	test-mcc:0.483415 
[10]	train-mcc:0.000000	test-mcc:0.486222 
[11]	train-mcc:0.000000	test-mcc:0.487615 
[12]	train-mcc:0.000000	test-mcc:0.486255 
[13]	train-mcc:0.000000	test-mcc:0.485638 
[14]	train-mcc:0.000000	test-mcc:0.486725 
[15]	train-mcc:0.000000	test-mcc:0.486831 
[16]	train-mcc:0.000000	test-mcc:0.484360 
[17]	train-mcc:0.000000	test-mcc:0.484064 
[18]	train-mcc:0.000000	test-mcc:0.484758 
[19]	train-mcc:0.000000	test-mcc:0.485639 
[20]	train-mcc:0.000000	test-mcc:0.487021 
[21]	train-mcc:0.000000	test-mcc:0.485244 
[22]	train-mcc:0.000000	test-mcc:0.485173 
[23]	train-mcc:0.000000	test-mcc:0.484787 
[24]	train-mcc:0.000000	test-mcc:0.483588 
[25]	train-mcc:0.000000	test-mcc:0.485260 
[26]	train-mcc:0.000000	test-mcc:0.485648 
[27]	train-mcc:0.000000	test-mcc:0.485161 
[28]	train-mcc:0.000000	test-mcc:0.482657 
[29]	train-mcc:0.000000	test-mcc:0.483366 
[30]	train-mcc:0.000000	test-mcc:0.483373 
[31]	train-mcc:0.000000	test-mcc:0.483559 
[32]	train-mcc:0.000000	test-mcc:0.484046 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.487744


Time: Thu Nov 10 2016 06:03:49 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.4877444
Confusion matrix:
     truth
preds      0      1
    0 235169    903
    1    205    473
     truth
preds            0            1
    0 0.9933220697 0.0038141499
    1 0.0008658923 0.0019978881
Iteration 6 (base=0.3262698): MCC=0.4877444 | threshold=0.3225246



Iteration 6[5] on Thu Nov 10 2016 06:03:50 AM

depth=6, min_child_weight=29.54808, subsample=0.5705054, colsample_bytree=0.9195295, base_score=0.3262698
[1]	train-mcc:0.000000	test-mcc:0.489204 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.490441 
[3]	train-mcc:0.000000	test-mcc:0.489578 
[4]	train-mcc:0.000000	test-mcc:0.490497 
[5]	train-mcc:0.000000	test-mcc:0.486149 
[6]	train-mcc:0.000000	test-mcc:0.486319 
[7]	train-mcc:0.000000	test-mcc:0.486814 
[8]	train-mcc:0.000000	test-mcc:0.486076 
[9]	train-mcc:0.000000	test-mcc:0.486679 
[10]	train-mcc:0.000000	test-mcc:0.487283 
[11]	train-mcc:0.000000	test-mcc:0.488783 
[12]	train-mcc:0.000000	test-mcc:0.488297 
[13]	train-mcc:0.000000	test-mcc:0.490890 
[14]	train-mcc:0.000000	test-mcc:0.492599 
[15]	train-mcc:0.000000	test-mcc:0.491113 
[16]	train-mcc:0.000000	test-mcc:0.490781 
[17]	train-mcc:0.000000	test-mcc:0.490196 
[18]	train-mcc:0.000000	test-mcc:0.491279 
[19]	train-mcc:0.000000	test-mcc:0.492371 
[20]	train-mcc:0.000000	test-mcc:0.490298 
[21]	train-mcc:0.000000	test-mcc:0.491265 
[22]	train-mcc:0.000000	test-mcc:0.490305 
[23]	train-mcc:0.000000	test-mcc:0.490890 
[24]	train-mcc:0.000000	test-mcc:0.489818 
[25]	train-mcc:0.000000	test-mcc:0.490890 
[26]	train-mcc:0.000000	test-mcc:0.490196 
[27]	train-mcc:0.000000	test-mcc:0.487821 
[28]	train-mcc:0.000000	test-mcc:0.486072 
[29]	train-mcc:0.000000	test-mcc:0.486121 
[30]	train-mcc:0.000000	test-mcc:0.486875 
[31]	train-mcc:0.000000	test-mcc:0.485008 
[32]	train-mcc:0.000000	test-mcc:0.484960 
[33]	train-mcc:0.000000	test-mcc:0.486439 
[34]	train-mcc:0.000000	test-mcc:0.487021 
[35]	train-mcc:0.000000	test-mcc:0.486459 
[36]	train-mcc:0.000000	test-mcc:0.485467 
[37]	train-mcc:0.000000	test-mcc:0.485892 
[38]	train-mcc:0.000000	test-mcc:0.486835 
[39]	train-mcc:0.000000	test-mcc:0.485575 
[40]	train-mcc:0.000000	test-mcc:0.484363 
[41]	train-mcc:0.000000	test-mcc:0.486037 
[42]	train-mcc:0.000000	test-mcc:0.485743 
[43]	train-mcc:0.000000	test-mcc:0.486189 
[44]	train-mcc:0.000000	test-mcc:0.486596 
Stopping. Best iteration:
[14]	train-mcc:0.000000	test-mcc:0.492599


Time: Thu Nov 10 2016 06:05:32 AM
For 0014 rounds: train_mcc: 0 - test_mcc: 0.4925991
Confusion matrix:
     truth
preds      0      1
    0 235235    934
    1    139    442
     truth
preds            0            1
    0 0.9936008448 0.0039450898
    1 0.0005871172 0.0018669483
Iteration 6 (base=0.3262698): MCC=0.4925991 | threshold=0.3421623


===




Iteration 7[1] on Thu Nov 10 2016 06:05:53 AM

depth=6, min_child_weight=8.086418, subsample=0.6477984, colsample_bytree=0.6081299, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.368300 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.078063 
[3]	train-mcc:0.000000	test-mcc:0.076539 
[4]	train-mcc:0.000000	test-mcc:0.078764 
[5]	train-mcc:0.000000	test-mcc:0.419804 
[6]	train-mcc:0.000000	test-mcc:0.076346 
[7]	train-mcc:0.000000	test-mcc:0.419326 
[8]	train-mcc:0.000000	test-mcc:0.076327 
[9]	train-mcc:0.000000	test-mcc:0.416359 
[10]	train-mcc:0.000000	test-mcc:0.076105 
[11]	train-mcc:0.000000	test-mcc:0.414824 
[12]	train-mcc:0.000000	test-mcc:0.106706 
[13]	train-mcc:0.000000	test-mcc:0.436556 
[14]	train-mcc:0.000000	test-mcc:0.107256 
[15]	train-mcc:0.000000	test-mcc:0.435733 
[16]	train-mcc:0.000000	test-mcc:0.416244 
[17]	train-mcc:0.000000	test-mcc:0.414669 
[18]	train-mcc:0.000000	test-mcc:0.413553 
[19]	train-mcc:0.000000	test-mcc:0.413263 
[20]	train-mcc:0.000000	test-mcc:0.431851 
[21]	train-mcc:0.000000	test-mcc:0.430298 
[22]	train-mcc:0.000000	test-mcc:0.432597 
[23]	train-mcc:0.000000	test-mcc:0.433535 
[24]	train-mcc:0.000000	test-mcc:0.434882 
[25]	train-mcc:0.000000	test-mcc:0.436722 
[26]	train-mcc:0.000000	test-mcc:0.438311 
[27]	train-mcc:0.000000	test-mcc:0.440062 
[28]	train-mcc:0.000000	test-mcc:0.441541 
[29]	train-mcc:0.000000	test-mcc:0.440671 
[30]	train-mcc:0.000000	test-mcc:0.442613 
[31]	train-mcc:0.000000	test-mcc:0.442843 
[32]	train-mcc:0.000000	test-mcc:0.442438 
[33]	train-mcc:0.000000	test-mcc:0.441721 
[34]	train-mcc:0.000000	test-mcc:0.443135 
[35]	train-mcc:0.000000	test-mcc:0.444696 
[36]	train-mcc:0.000000	test-mcc:0.442801 
[37]	train-mcc:0.000000	test-mcc:0.444069 
[38]	train-mcc:0.000000	test-mcc:0.442672 
[39]	train-mcc:0.000000	test-mcc:0.443733 
[40]	train-mcc:0.000000	test-mcc:0.443330 
[41]	train-mcc:0.000000	test-mcc:0.440649 
[42]	train-mcc:0.000000	test-mcc:0.442955 
[43]	train-mcc:0.000000	test-mcc:0.442649 
[44]	train-mcc:0.000000	test-mcc:0.440283 
[45]	train-mcc:0.000000	test-mcc:0.444610 
[46]	train-mcc:0.000000	test-mcc:0.444939 
[47]	train-mcc:0.000000	test-mcc:0.443154 
[48]	train-mcc:0.000000	test-mcc:0.444603 
[49]	train-mcc:0.000000	test-mcc:0.445564 
[50]	train-mcc:0.000000	test-mcc:0.445056 
[51]	train-mcc:0.000000	test-mcc:0.443312 
[52]	train-mcc:0.000000	test-mcc:0.443780 
[53]	train-mcc:0.000000	test-mcc:0.442937 
[54]	train-mcc:0.000000	test-mcc:0.444055 
[55]	train-mcc:0.000000	test-mcc:0.444220 
[56]	train-mcc:0.000000	test-mcc:0.446375 
[57]	train-mcc:0.000000	test-mcc:0.444624 
[58]	train-mcc:0.000000	test-mcc:0.445429 
[59]	train-mcc:0.000000	test-mcc:0.444015 
[60]	train-mcc:0.000000	test-mcc:0.443950 
[61]	train-mcc:0.000000	test-mcc:0.444525 
[62]	train-mcc:0.000000	test-mcc:0.444354 
[63]	train-mcc:0.000000	test-mcc:0.441316 
[64]	train-mcc:0.000000	test-mcc:0.442149 
[65]	train-mcc:0.000000	test-mcc:0.441767 
[66]	train-mcc:0.000000	test-mcc:0.440265 
[67]	train-mcc:0.000000	test-mcc:0.439494 
[68]	train-mcc:0.000000	test-mcc:0.439384 
[69]	train-mcc:0.000000	test-mcc:0.439763 
[70]	train-mcc:0.000000	test-mcc:0.441234 
[71]	train-mcc:0.000000	test-mcc:0.442517 
[72]	train-mcc:0.000000	test-mcc:0.441982 
[73]	train-mcc:0.000000	test-mcc:0.445638 
[74]	train-mcc:0.000000	test-mcc:0.446465 
[75]	train-mcc:0.000000	test-mcc:0.446018 
[76]	train-mcc:0.000000	test-mcc:0.444740 
[77]	train-mcc:0.000000	test-mcc:0.445037 
[78]	train-mcc:0.000000	test-mcc:0.446693 
[79]	train-mcc:0.000000	test-mcc:0.446705 
[80]	train-mcc:0.000000	test-mcc:0.445137 
[81]	train-mcc:0.000000	test-mcc:0.444365 
[82]	train-mcc:0.000000	test-mcc:0.445823 
[83]	train-mcc:0.000000	test-mcc:0.444521 
[84]	train-mcc:0.000000	test-mcc:0.443969 
[85]	train-mcc:0.000000	test-mcc:0.444008 
[86]	train-mcc:0.000000	test-mcc:0.443236 
[87]	train-mcc:0.000000	test-mcc:0.441637 
[88]	train-mcc:0.000000	test-mcc:0.442032 
[89]	train-mcc:0.000000	test-mcc:0.442320 
[90]	train-mcc:0.000000	test-mcc:0.445219 
[91]	train-mcc:0.000000	test-mcc:0.446495 
[92]	train-mcc:0.000000	test-mcc:0.443875 
[93]	train-mcc:0.000000	test-mcc:0.444198 
[94]	train-mcc:0.000000	test-mcc:0.443766 
[95]	train-mcc:0.000000	test-mcc:0.443441 
[96]	train-mcc:0.000000	test-mcc:0.442797 
[97]	train-mcc:0.000000	test-mcc:0.441423 
[98]	train-mcc:0.000000	test-mcc:0.443062 
[99]	train-mcc:0.000000	test-mcc:0.442394 
[100]	train-mcc:0.000000	test-mcc:0.442676 
[101]	train-mcc:0.000000	test-mcc:0.439912 
[102]	train-mcc:0.000000	test-mcc:0.440729 
[103]	train-mcc:0.000000	test-mcc:0.439727 
[104]	train-mcc:0.000000	test-mcc:0.440022 
[105]	train-mcc:0.000000	test-mcc:0.439727 
[106]	train-mcc:0.000000	test-mcc:0.441008 
[107]	train-mcc:0.000000	test-mcc:0.441400 
[108]	train-mcc:0.000000	test-mcc:0.440031 
[109]	train-mcc:0.000000	test-mcc:0.441246 
Stopping. Best iteration:
[79]	train-mcc:0.000000	test-mcc:0.446705


Time: Thu Nov 10 2016 06:09:07 AM
For 0079 rounds: train_mcc: 0 - test_mcc: 0.4467052
Confusion matrix:
     truth
preds      0      1
    0 235072    916
    1    301    459
     truth
preds           0           1
    0 0.992920743 0.003869093
    1 0.001271394 0.001938770
Iteration 7 (base=0.001): MCC=0.4467052 | threshold=0.4353485



Iteration 7[2] on Thu Nov 10 2016 06:09:08 AM

depth=6, min_child_weight=8.086418, subsample=0.6477984, colsample_bytree=0.6081299, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.363148 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.195094 
[3]	train-mcc:0.000000	test-mcc:0.058916 
[4]	train-mcc:0.000000	test-mcc:0.111057 
[5]	train-mcc:0.000000	test-mcc:0.347658 
[6]	train-mcc:0.000000	test-mcc:0.245114 
[7]	train-mcc:0.000000	test-mcc:0.350412 
[8]	train-mcc:0.000000	test-mcc:0.391541 
[9]	train-mcc:0.000000	test-mcc:0.397738 
[10]	train-mcc:0.000000	test-mcc:0.400715 
[11]	train-mcc:0.000000	test-mcc:0.404717 
[12]	train-mcc:0.000000	test-mcc:0.408618 
[13]	train-mcc:0.000000	test-mcc:0.409756 
[14]	train-mcc:0.000000	test-mcc:0.409057 
[15]	train-mcc:0.000000	test-mcc:0.410345 
[16]	train-mcc:0.000000	test-mcc:0.411105 
[17]	train-mcc:0.000000	test-mcc:0.412017 
[18]	train-mcc:0.000000	test-mcc:0.414760 
[19]	train-mcc:0.000000	test-mcc:0.414675 
[20]	train-mcc:0.000000	test-mcc:0.419710 
[21]	train-mcc:0.000000	test-mcc:0.423048 
[22]	train-mcc:0.000000	test-mcc:0.424908 
[23]	train-mcc:0.000000	test-mcc:0.423219 
[24]	train-mcc:0.000000	test-mcc:0.424471 
[25]	train-mcc:0.000000	test-mcc:0.424065 
[26]	train-mcc:0.000000	test-mcc:0.425528 
[27]	train-mcc:0.000000	test-mcc:0.423419 
[28]	train-mcc:0.000000	test-mcc:0.420938 
[29]	train-mcc:0.000000	test-mcc:0.421375 
[30]	train-mcc:0.000000	test-mcc:0.420727 
[31]	train-mcc:0.000000	test-mcc:0.421363 
[32]	train-mcc:0.000000	test-mcc:0.420875 
[33]	train-mcc:0.000000	test-mcc:0.422386 
[34]	train-mcc:0.000000	test-mcc:0.422712 
[35]	train-mcc:0.000000	test-mcc:0.423409 
[36]	train-mcc:0.000000	test-mcc:0.422257 
[37]	train-mcc:0.000000	test-mcc:0.421747 
[38]	train-mcc:0.000000	test-mcc:0.421165 
[39]	train-mcc:0.000000	test-mcc:0.420501 
[40]	train-mcc:0.000000	test-mcc:0.420800 
[41]	train-mcc:0.000000	test-mcc:0.421897 
[42]	train-mcc:0.000000	test-mcc:0.422237 
[43]	train-mcc:0.000000	test-mcc:0.423372 
[44]	train-mcc:0.000000	test-mcc:0.421431 
[45]	train-mcc:0.000000	test-mcc:0.420940 
[46]	train-mcc:0.000000	test-mcc:0.422062 
[47]	train-mcc:0.000000	test-mcc:0.421073 
[48]	train-mcc:0.000000	test-mcc:0.421899 
[49]	train-mcc:0.000000	test-mcc:0.422603 
[50]	train-mcc:0.000000	test-mcc:0.422188 
[51]	train-mcc:0.000000	test-mcc:0.423182 
[52]	train-mcc:0.000000	test-mcc:0.423260 
[53]	train-mcc:0.000000	test-mcc:0.421363 
[54]	train-mcc:0.000000	test-mcc:0.420905 
[55]	train-mcc:0.000000	test-mcc:0.421215 
[56]	train-mcc:0.000000	test-mcc:0.422680 
Stopping. Best iteration:
[26]	train-mcc:0.000000	test-mcc:0.425528


Time: Thu Nov 10 2016 06:10:40 AM
For 0026 rounds: train_mcc: 0 - test_mcc: 0.4255282
Confusion matrix:
     truth
preds      0      1
    0 234862    869
    1    511    507
     truth
preds           0           1
    0 0.992029533 0.003670554
    1 0.002158404 0.002141509
Iteration 7 (base=0.001): MCC=0.4255282 | threshold=0.3136991



Iteration 7[3] on Thu Nov 10 2016 06:10:42 AM

depth=6, min_child_weight=8.086418, subsample=0.6477984, colsample_bytree=0.6081299, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.375947 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.187075 
[3]	train-mcc:0.000000	test-mcc:0.373054 
[4]	train-mcc:0.000000	test-mcc:0.062072 
[5]	train-mcc:0.000000	test-mcc:0.061451 
[6]	train-mcc:0.000000	test-mcc:0.079608 
[7]	train-mcc:0.000000	test-mcc:0.438285 
[8]	train-mcc:0.000000	test-mcc:0.245796 
[9]	train-mcc:0.000000	test-mcc:0.404328 
[10]	train-mcc:0.000000	test-mcc:0.401212 
[11]	train-mcc:0.000000	test-mcc:0.418200 
[12]	train-mcc:0.000000	test-mcc:0.421012 
[13]	train-mcc:0.000000	test-mcc:0.429770 
[14]	train-mcc:0.000000	test-mcc:0.428386 
[15]	train-mcc:0.000000	test-mcc:0.427676 
[16]	train-mcc:0.000000	test-mcc:0.429004 
[17]	train-mcc:0.000000	test-mcc:0.430985 
[18]	train-mcc:0.000000	test-mcc:0.429398 
[19]	train-mcc:0.000000	test-mcc:0.429352 
[20]	train-mcc:0.000000	test-mcc:0.430985 
[21]	train-mcc:0.000000	test-mcc:0.429068 
[22]	train-mcc:0.000000	test-mcc:0.433285 
[23]	train-mcc:0.000000	test-mcc:0.435023 
[24]	train-mcc:0.000000	test-mcc:0.436585 
[25]	train-mcc:0.000000	test-mcc:0.435050 
[26]	train-mcc:0.000000	test-mcc:0.432705 
[27]	train-mcc:0.000000	test-mcc:0.430351 
[28]	train-mcc:0.000000	test-mcc:0.430554 
[29]	train-mcc:0.000000	test-mcc:0.430712 
[30]	train-mcc:0.000000	test-mcc:0.429665 
[31]	train-mcc:0.000000	test-mcc:0.430509 
[32]	train-mcc:0.000000	test-mcc:0.432047 
[33]	train-mcc:0.000000	test-mcc:0.432361 
[34]	train-mcc:0.000000	test-mcc:0.435439 
[35]	train-mcc:0.000000	test-mcc:0.434926 
[36]	train-mcc:0.000000	test-mcc:0.435383 
[37]	train-mcc:0.000000	test-mcc:0.432610 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.438285


Time: Thu Nov 10 2016 06:11:47 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.438285
Confusion matrix:
     truth
preds      0      1
    0 234751    812
    1    623    564
     truth
preds           0           1
    0 0.991556494 0.003429778
    1 0.002631468 0.002382260
Iteration 7 (base=0.001): MCC=0.438285 | threshold=0.9999948



Iteration 7[4] on Thu Nov 10 2016 06:11:48 AM

depth=6, min_child_weight=8.086418, subsample=0.6477984, colsample_bytree=0.6081299, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.375918 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.116579 
[3]	train-mcc:0.000000	test-mcc:0.368603 
[4]	train-mcc:0.000000	test-mcc:0.090934 
[5]	train-mcc:0.000000	test-mcc:0.273299 
[6]	train-mcc:0.000000	test-mcc:0.409391 
[7]	train-mcc:0.000000	test-mcc:0.391900 
[8]	train-mcc:0.000000	test-mcc:0.393349 
[9]	train-mcc:0.000000	test-mcc:0.397478 
[10]	train-mcc:0.000000	test-mcc:0.399306 
[11]	train-mcc:0.000000	test-mcc:0.398097 
[12]	train-mcc:0.000000	test-mcc:0.397579 
[13]	train-mcc:0.000000	test-mcc:0.399052 
[14]	train-mcc:0.000000	test-mcc:0.401642 
[15]	train-mcc:0.000000	test-mcc:0.402869 
[16]	train-mcc:0.000000	test-mcc:0.401649 
[17]	train-mcc:0.000000	test-mcc:0.405377 
[18]	train-mcc:0.000000	test-mcc:0.406118 
[19]	train-mcc:0.000000	test-mcc:0.407970 
[20]	train-mcc:0.000000	test-mcc:0.406591 
[21]	train-mcc:0.000000	test-mcc:0.406659 
[22]	train-mcc:0.000000	test-mcc:0.407997 
[23]	train-mcc:0.000000	test-mcc:0.408773 
[24]	train-mcc:0.000000	test-mcc:0.415788 
[25]	train-mcc:0.000000	test-mcc:0.416283 
[26]	train-mcc:0.000000	test-mcc:0.416487 
[27]	train-mcc:0.000000	test-mcc:0.417676 
[28]	train-mcc:0.000000	test-mcc:0.415963 
[29]	train-mcc:0.000000	test-mcc:0.415530 
[30]	train-mcc:0.000000	test-mcc:0.414176 
[31]	train-mcc:0.000000	test-mcc:0.418084 
[32]	train-mcc:0.000000	test-mcc:0.416782 
[33]	train-mcc:0.000000	test-mcc:0.418714 
[34]	train-mcc:0.000000	test-mcc:0.419143 
[35]	train-mcc:0.000000	test-mcc:0.419143 
[36]	train-mcc:0.000000	test-mcc:0.420263 
[37]	train-mcc:0.000000	test-mcc:0.421579 
[38]	train-mcc:0.000000	test-mcc:0.418754 
[39]	train-mcc:0.000000	test-mcc:0.417439 
[40]	train-mcc:0.000000	test-mcc:0.417254 
[41]	train-mcc:0.000000	test-mcc:0.418754 
[42]	train-mcc:0.000000	test-mcc:0.418080 
[43]	train-mcc:0.000000	test-mcc:0.418418 
[44]	train-mcc:0.000000	test-mcc:0.417641 
[45]	train-mcc:0.000000	test-mcc:0.416339 
[46]	train-mcc:0.000000	test-mcc:0.416786 
[47]	train-mcc:0.000000	test-mcc:0.416553 
[48]	train-mcc:0.000000	test-mcc:0.416942 
[49]	train-mcc:0.000000	test-mcc:0.418395 
[50]	train-mcc:0.000000	test-mcc:0.417600 
[51]	train-mcc:0.000000	test-mcc:0.418539 
[52]	train-mcc:0.000000	test-mcc:0.414484 
[53]	train-mcc:0.000000	test-mcc:0.414050 
[54]	train-mcc:0.000000	test-mcc:0.414252 
[55]	train-mcc:0.000000	test-mcc:0.414421 
[56]	train-mcc:0.000000	test-mcc:0.416167 
[57]	train-mcc:0.000000	test-mcc:0.415061 
[58]	train-mcc:0.000000	test-mcc:0.414454 
[59]	train-mcc:0.000000	test-mcc:0.413545 
[60]	train-mcc:0.000000	test-mcc:0.413896 
[61]	train-mcc:0.000000	test-mcc:0.414625 
[62]	train-mcc:0.000000	test-mcc:0.413078 
[63]	train-mcc:0.000000	test-mcc:0.413435 
[64]	train-mcc:0.000000	test-mcc:0.414005 
[65]	train-mcc:0.000000	test-mcc:0.414488 
[66]	train-mcc:0.000000	test-mcc:0.414618 
[67]	train-mcc:0.000000	test-mcc:0.414245 
Stopping. Best iteration:
[37]	train-mcc:0.000000	test-mcc:0.421579


Time: Thu Nov 10 2016 06:13:31 AM
For 0037 rounds: train_mcc: 0 - test_mcc: 0.4215787
Confusion matrix:
     truth
preds      0      1
    0 234898    887
    1    476    489
     truth
preds           0           1
    0 0.992177402 0.003746568
    1 0.002010560 0.002065470
Iteration 7 (base=0.001): MCC=0.4215787 | threshold=0.4170651



Iteration 7[5] on Thu Nov 10 2016 06:13:32 AM

depth=6, min_child_weight=8.086418, subsample=0.6477984, colsample_bytree=0.6081299, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.369109 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.263220 
[3]	train-mcc:0.000000	test-mcc:0.358307 
[4]	train-mcc:0.000000	test-mcc:0.424396 
[5]	train-mcc:0.000000	test-mcc:0.426065 
[6]	train-mcc:0.000000	test-mcc:0.427101 
[7]	train-mcc:0.000000	test-mcc:0.436331 
[8]	train-mcc:0.000000	test-mcc:0.435177 
[9]	train-mcc:0.000000	test-mcc:0.442682 
[10]	train-mcc:0.000000	test-mcc:0.445057 
[11]	train-mcc:0.000000	test-mcc:0.445988 
[12]	train-mcc:0.000000	test-mcc:0.444673 
[13]	train-mcc:0.000000	test-mcc:0.447188 
[14]	train-mcc:0.000000	test-mcc:0.447476 
[15]	train-mcc:0.000000	test-mcc:0.447885 
[16]	train-mcc:0.000000	test-mcc:0.450034 
[17]	train-mcc:0.000000	test-mcc:0.451754 
[18]	train-mcc:0.000000	test-mcc:0.451086 
[19]	train-mcc:0.000000	test-mcc:0.447195 
[20]	train-mcc:0.000000	test-mcc:0.446311 
[21]	train-mcc:0.000000	test-mcc:0.446928 
[22]	train-mcc:0.000000	test-mcc:0.446991 
[23]	train-mcc:0.000000	test-mcc:0.445536 
[24]	train-mcc:0.000000	test-mcc:0.444465 
[25]	train-mcc:0.000000	test-mcc:0.446863 
[26]	train-mcc:0.000000	test-mcc:0.446125 
[27]	train-mcc:0.000000	test-mcc:0.447720 
[28]	train-mcc:0.000000	test-mcc:0.446603 
[29]	train-mcc:0.000000	test-mcc:0.447055 
[30]	train-mcc:0.000000	test-mcc:0.447356 
[31]	train-mcc:0.000000	test-mcc:0.446541 
[32]	train-mcc:0.000000	test-mcc:0.445969 
[33]	train-mcc:0.000000	test-mcc:0.445308 
[34]	train-mcc:0.000000	test-mcc:0.445308 
[35]	train-mcc:0.000000	test-mcc:0.443515 
[36]	train-mcc:0.000000	test-mcc:0.441070 
[37]	train-mcc:0.000000	test-mcc:0.440018 
[38]	train-mcc:0.000000	test-mcc:0.440656 
[39]	train-mcc:0.000000	test-mcc:0.441341 
[40]	train-mcc:0.000000	test-mcc:0.442316 
[41]	train-mcc:0.000000	test-mcc:0.442549 
[42]	train-mcc:0.000000	test-mcc:0.439993 
[43]	train-mcc:0.000000	test-mcc:0.440139 
[44]	train-mcc:0.000000	test-mcc:0.440220 
[45]	train-mcc:0.000000	test-mcc:0.440192 
[46]	train-mcc:0.000000	test-mcc:0.440172 
[47]	train-mcc:0.000000	test-mcc:0.439468 
Stopping. Best iteration:
[17]	train-mcc:0.000000	test-mcc:0.451754


Time: Thu Nov 10 2016 06:14:48 AM
For 0017 rounds: train_mcc: 0 - test_mcc: 0.4517542
Confusion matrix:
     truth
preds      0      1
    0 235079    912
    1    295    464
     truth
preds           0           1
    0 0.992941922 0.003852165
    1 0.001246040 0.001959873
Iteration 7 (base=0.001): MCC=0.4517542 | threshold=0.4129221


===




Iteration 8[1] on Thu Nov 10 2016 06:15:14 AM

depth=10, min_child_weight=32.30703, subsample=0.9702541, colsample_bytree=0.9716007, base_score=0.2187879
[1]	train-mcc:0.000000	test-mcc:0.469276 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471246 
[3]	train-mcc:0.000000	test-mcc:0.473171 
[4]	train-mcc:0.000000	test-mcc:0.477257 
[5]	train-mcc:0.000000	test-mcc:0.476979 
[6]	train-mcc:0.000000	test-mcc:0.477161 
[7]	train-mcc:0.000000	test-mcc:0.478872 
[8]	train-mcc:0.000000	test-mcc:0.478718 
[9]	train-mcc:0.000000	test-mcc:0.479596 
[10]	train-mcc:0.000000	test-mcc:0.477344 
[11]	train-mcc:0.000000	test-mcc:0.480125 
[12]	train-mcc:0.000000	test-mcc:0.480706 
[13]	train-mcc:0.000000	test-mcc:0.479388 
[14]	train-mcc:0.000000	test-mcc:0.478190 
[15]	train-mcc:0.000000	test-mcc:0.477393 
[16]	train-mcc:0.000000	test-mcc:0.477393 
[17]	train-mcc:0.000000	test-mcc:0.478050 
[18]	train-mcc:0.000000	test-mcc:0.478050 
[19]	train-mcc:0.000000	test-mcc:0.477905 
[20]	train-mcc:0.000000	test-mcc:0.478647 
[21]	train-mcc:0.000000	test-mcc:0.478087 
[22]	train-mcc:0.000000	test-mcc:0.479013 
[23]	train-mcc:0.000000	test-mcc:0.478829 
[24]	train-mcc:0.000000	test-mcc:0.476270 
[25]	train-mcc:0.000000	test-mcc:0.476270 
[26]	train-mcc:0.000000	test-mcc:0.476270 
[27]	train-mcc:0.000000	test-mcc:0.476805 
[28]	train-mcc:0.000000	test-mcc:0.476786 
[29]	train-mcc:0.000000	test-mcc:0.476786 
[30]	train-mcc:0.000000	test-mcc:0.476518 
[31]	train-mcc:0.000000	test-mcc:0.477163 
[32]	train-mcc:0.000000	test-mcc:0.477257 
[33]	train-mcc:0.000000	test-mcc:0.477383 
[34]	train-mcc:0.000000	test-mcc:0.478932 
[35]	train-mcc:0.000000	test-mcc:0.478198 
[36]	train-mcc:0.000000	test-mcc:0.478532 
[37]	train-mcc:0.000000	test-mcc:0.478198 
[38]	train-mcc:0.000000	test-mcc:0.479013 
[39]	train-mcc:0.000000	test-mcc:0.479198 
[40]	train-mcc:0.000000	test-mcc:0.479749 
[41]	train-mcc:0.000000	test-mcc:0.480336 
[42]	train-mcc:0.000000	test-mcc:0.479749 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.480706


Time: Thu Nov 10 2016 06:18:39 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4807064
Confusion matrix:
     truth
preds      0      1
    0 235293    989
    1     80    386
     truth
preds           0           1
    0 0.993854225 0.004177438
    1 0.000337912 0.001630426
Iteration 8 (base=0.2187879): MCC=0.4807064 | threshold=0.4752117



Iteration 8[2] on Thu Nov 10 2016 06:18:41 AM

depth=10, min_child_weight=32.30703, subsample=0.9702541, colsample_bytree=0.9716007, base_score=0.2187879
[1]	train-mcc:0.000000	test-mcc:0.476526 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478281 
[3]	train-mcc:0.000000	test-mcc:0.479396 
[4]	train-mcc:0.000000	test-mcc:0.480137 
[5]	train-mcc:0.000000	test-mcc:0.481842 
[6]	train-mcc:0.000000	test-mcc:0.482916 
[7]	train-mcc:0.000000	test-mcc:0.480965 
[8]	train-mcc:0.000000	test-mcc:0.478781 
[9]	train-mcc:0.000000	test-mcc:0.478325 
[10]	train-mcc:0.000000	test-mcc:0.479919 
[11]	train-mcc:0.000000	test-mcc:0.479399 
[12]	train-mcc:0.000000	test-mcc:0.479424 
[13]	train-mcc:0.000000	test-mcc:0.479755 
[14]	train-mcc:0.000000	test-mcc:0.479755 
[15]	train-mcc:0.000000	test-mcc:0.480688 
[16]	train-mcc:0.000000	test-mcc:0.480944 
[17]	train-mcc:0.000000	test-mcc:0.480962 
[18]	train-mcc:0.000000	test-mcc:0.481239 
[19]	train-mcc:0.000000	test-mcc:0.482375 
[20]	train-mcc:0.000000	test-mcc:0.483763 
[21]	train-mcc:0.000000	test-mcc:0.482326 
[22]	train-mcc:0.000000	test-mcc:0.483785 
[23]	train-mcc:0.000000	test-mcc:0.482326 
[24]	train-mcc:0.000000	test-mcc:0.482803 
[25]	train-mcc:0.000000	test-mcc:0.483340 
[26]	train-mcc:0.000000	test-mcc:0.484006 
[27]	train-mcc:0.000000	test-mcc:0.483778 
[28]	train-mcc:0.000000	test-mcc:0.483062 
[29]	train-mcc:0.000000	test-mcc:0.483309 
[30]	train-mcc:0.000000	test-mcc:0.482841 
[31]	train-mcc:0.000000	test-mcc:0.481600 
[32]	train-mcc:0.000000	test-mcc:0.482562 
[33]	train-mcc:0.000000	test-mcc:0.483778 
[34]	train-mcc:0.000000	test-mcc:0.481657 
[35]	train-mcc:0.000000	test-mcc:0.480939 
[36]	train-mcc:0.000000	test-mcc:0.480221 
[37]	train-mcc:0.000000	test-mcc:0.479755 
[38]	train-mcc:0.000000	test-mcc:0.479290 
[39]	train-mcc:0.000000	test-mcc:0.479666 
[40]	train-mcc:0.000000	test-mcc:0.480776 
[41]	train-mcc:0.000000	test-mcc:0.480776 
[42]	train-mcc:0.000000	test-mcc:0.480776 
[43]	train-mcc:0.000000	test-mcc:0.479404 
[44]	train-mcc:0.000000	test-mcc:0.480121 
[45]	train-mcc:0.000000	test-mcc:0.480121 
[46]	train-mcc:0.000000	test-mcc:0.479404 
[47]	train-mcc:0.000000	test-mcc:0.479404 
[48]	train-mcc:0.000000	test-mcc:0.480461 
[49]	train-mcc:0.000000	test-mcc:0.477772 
[50]	train-mcc:0.000000	test-mcc:0.478469 
[51]	train-mcc:0.000000	test-mcc:0.479478 
[52]	train-mcc:0.000000	test-mcc:0.478275 
[53]	train-mcc:0.000000	test-mcc:0.477552 
[54]	train-mcc:0.000000	test-mcc:0.477552 
[55]	train-mcc:0.000000	test-mcc:0.477513 
[56]	train-mcc:0.000000	test-mcc:0.477779 
Stopping. Best iteration:
[26]	train-mcc:0.000000	test-mcc:0.484006


Time: Thu Nov 10 2016 06:23:07 AM
For 0026 rounds: train_mcc: 0 - test_mcc: 0.4840055
Confusion matrix:
     truth
preds      0      1
    0 235265    966
    1    108    410
     truth
preds            0            1
    0 0.9937317581 0.0040802707
    1 0.0004561793 0.0017317919
Iteration 8 (base=0.2187879): MCC=0.4840055 | threshold=0.4241814



Iteration 8[3] on Thu Nov 10 2016 06:23:08 AM

depth=10, min_child_weight=32.30703, subsample=0.9702541, colsample_bytree=0.9716007, base_score=0.2187879
[1]	train-mcc:0.000000	test-mcc:0.478431 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482090 
[3]	train-mcc:0.000000	test-mcc:0.485080 
[4]	train-mcc:0.000000	test-mcc:0.489307 
[5]	train-mcc:0.000000	test-mcc:0.487831 
[6]	train-mcc:0.000000	test-mcc:0.492580 
[7]	train-mcc:0.000000	test-mcc:0.492363 
[8]	train-mcc:0.000000	test-mcc:0.492163 
[9]	train-mcc:0.000000	test-mcc:0.491129 
[10]	train-mcc:0.000000	test-mcc:0.494261 
[11]	train-mcc:0.000000	test-mcc:0.494557 
[12]	train-mcc:0.000000	test-mcc:0.496892 
[13]	train-mcc:0.000000	test-mcc:0.496049 
[14]	train-mcc:0.000000	test-mcc:0.494959 
[15]	train-mcc:0.000000	test-mcc:0.497712 
[16]	train-mcc:0.000000	test-mcc:0.496084 
[17]	train-mcc:0.000000	test-mcc:0.496353 
[18]	train-mcc:0.000000	test-mcc:0.496395 
[19]	train-mcc:0.000000	test-mcc:0.495865 
[20]	train-mcc:0.000000	test-mcc:0.496353 
[21]	train-mcc:0.000000	test-mcc:0.496535 
[22]	train-mcc:0.000000	test-mcc:0.495860 
[23]	train-mcc:0.000000	test-mcc:0.497680 
[24]	train-mcc:0.000000	test-mcc:0.496579 
[25]	train-mcc:0.000000	test-mcc:0.496643 
[26]	train-mcc:0.000000	test-mcc:0.496643 
[27]	train-mcc:0.000000	test-mcc:0.496154 
[28]	train-mcc:0.000000	test-mcc:0.496746 
[29]	train-mcc:0.000000	test-mcc:0.495151 
[30]	train-mcc:0.000000	test-mcc:0.495537 
[31]	train-mcc:0.000000	test-mcc:0.493861 
[32]	train-mcc:0.000000	test-mcc:0.495537 
[33]	train-mcc:0.000000	test-mcc:0.496401 
[34]	train-mcc:0.000000	test-mcc:0.495968 
[35]	train-mcc:0.000000	test-mcc:0.495277 
[36]	train-mcc:0.000000	test-mcc:0.495277 
[37]	train-mcc:0.000000	test-mcc:0.497016 
[38]	train-mcc:0.000000	test-mcc:0.495563 
[39]	train-mcc:0.000000	test-mcc:0.493229 
[40]	train-mcc:0.000000	test-mcc:0.493722 
[41]	train-mcc:0.000000	test-mcc:0.492828 
[42]	train-mcc:0.000000	test-mcc:0.492828 
[43]	train-mcc:0.000000	test-mcc:0.493864 
[44]	train-mcc:0.000000	test-mcc:0.494856 
[45]	train-mcc:0.000000	test-mcc:0.496086 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.497712


Time: Thu Nov 10 2016 06:26:33 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4977121
Confusion matrix:
     truth
preds      0      1
    0 235271    950
    1    103    426
     truth
preds            0            1
    0 0.9937529039 0.0040126716
    1 0.0004350581 0.0017993664
Iteration 8 (base=0.2187879): MCC=0.4977121 | threshold=0.3898374



Iteration 8[4] on Thu Nov 10 2016 06:26:34 AM

depth=10, min_child_weight=32.30703, subsample=0.9702541, colsample_bytree=0.9716007, base_score=0.2187879
[1]	train-mcc:0.000000	test-mcc:0.479490 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482084 
[3]	train-mcc:0.000000	test-mcc:0.487743 
[4]	train-mcc:0.000000	test-mcc:0.488423 
[5]	train-mcc:0.000000	test-mcc:0.487612 
[6]	train-mcc:0.000000	test-mcc:0.488498 
[7]	train-mcc:0.000000	test-mcc:0.486760 
[8]	train-mcc:0.000000	test-mcc:0.486141 
[9]	train-mcc:0.000000	test-mcc:0.486940 
[10]	train-mcc:0.000000	test-mcc:0.484062 
[11]	train-mcc:0.000000	test-mcc:0.482309 
[12]	train-mcc:0.000000	test-mcc:0.483078 
[13]	train-mcc:0.000000	test-mcc:0.481239 
[14]	train-mcc:0.000000	test-mcc:0.482071 
[15]	train-mcc:0.000000	test-mcc:0.480791 
[16]	train-mcc:0.000000	test-mcc:0.481883 
[17]	train-mcc:0.000000	test-mcc:0.482134 
[18]	train-mcc:0.000000	test-mcc:0.481805 
[19]	train-mcc:0.000000	test-mcc:0.481517 
[20]	train-mcc:0.000000	test-mcc:0.481669 
[21]	train-mcc:0.000000	test-mcc:0.481239 
[22]	train-mcc:0.000000	test-mcc:0.481157 
[23]	train-mcc:0.000000	test-mcc:0.481611 
[24]	train-mcc:0.000000	test-mcc:0.481627 
[25]	train-mcc:0.000000	test-mcc:0.481074 
[26]	train-mcc:0.000000	test-mcc:0.482667 
[27]	train-mcc:0.000000	test-mcc:0.483635 
[28]	train-mcc:0.000000	test-mcc:0.484985 
[29]	train-mcc:0.000000	test-mcc:0.485058 
[30]	train-mcc:0.000000	test-mcc:0.484601 
[31]	train-mcc:0.000000	test-mcc:0.483090 
[32]	train-mcc:0.000000	test-mcc:0.483340 
[33]	train-mcc:0.000000	test-mcc:0.483556 
[34]	train-mcc:0.000000	test-mcc:0.483556 
[35]	train-mcc:0.000000	test-mcc:0.484493 
[36]	train-mcc:0.000000	test-mcc:0.484739 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.488498


Time: Thu Nov 10 2016 06:29:20 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4884981
Confusion matrix:
     truth
preds      0      1
    0 235205    922
    1    169    454
     truth
preds            0            1
    0 0.9934741288 0.0038944034
    1 0.0007138332 0.0019176346
Iteration 8 (base=0.2187879): MCC=0.4884981 | threshold=0.2994976



Iteration 8[5] on Thu Nov 10 2016 06:29:21 AM

depth=10, min_child_weight=32.30703, subsample=0.9702541, colsample_bytree=0.9716007, base_score=0.2187879
[1]	train-mcc:0.000000	test-mcc:0.483078 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484572 
[3]	train-mcc:0.000000	test-mcc:0.485310 
[4]	train-mcc:0.000000	test-mcc:0.487621 
[5]	train-mcc:0.000000	test-mcc:0.488379 
[6]	train-mcc:0.000000	test-mcc:0.488643 
[7]	train-mcc:0.000000	test-mcc:0.490736 
[8]	train-mcc:0.000000	test-mcc:0.491551 
[9]	train-mcc:0.000000	test-mcc:0.490873 
[10]	train-mcc:0.000000	test-mcc:0.492413 
[11]	train-mcc:0.000000	test-mcc:0.492536 
[12]	train-mcc:0.000000	test-mcc:0.491962 
[13]	train-mcc:0.000000	test-mcc:0.492799 
[14]	train-mcc:0.000000	test-mcc:0.493827 
[15]	train-mcc:0.000000	test-mcc:0.490585 
[16]	train-mcc:0.000000	test-mcc:0.490686 
[17]	train-mcc:0.000000	test-mcc:0.489973 
[18]	train-mcc:0.000000	test-mcc:0.490943 
[19]	train-mcc:0.000000	test-mcc:0.490457 
[20]	train-mcc:0.000000	test-mcc:0.491799 
[21]	train-mcc:0.000000	test-mcc:0.491597 
[22]	train-mcc:0.000000	test-mcc:0.493460 
[23]	train-mcc:0.000000	test-mcc:0.491823 
[24]	train-mcc:0.000000	test-mcc:0.493037 
[25]	train-mcc:0.000000	test-mcc:0.490546 
[26]	train-mcc:0.000000	test-mcc:0.489746 
[27]	train-mcc:0.000000	test-mcc:0.490177 
[28]	train-mcc:0.000000	test-mcc:0.489241 
[29]	train-mcc:0.000000	test-mcc:0.487527 
[30]	train-mcc:0.000000	test-mcc:0.488299 
[31]	train-mcc:0.000000	test-mcc:0.488245 
[32]	train-mcc:0.000000	test-mcc:0.486432 
[33]	train-mcc:0.000000	test-mcc:0.486967 
[34]	train-mcc:0.000000	test-mcc:0.486922 
[35]	train-mcc:0.000000	test-mcc:0.486922 
[36]	train-mcc:0.000000	test-mcc:0.487639 
[37]	train-mcc:0.000000	test-mcc:0.487639 
[38]	train-mcc:0.000000	test-mcc:0.487414 
[39]	train-mcc:0.000000	test-mcc:0.485714 
[40]	train-mcc:0.000000	test-mcc:0.486204 
[41]	train-mcc:0.000000	test-mcc:0.486432 
[42]	train-mcc:0.000000	test-mcc:0.485195 
[43]	train-mcc:0.000000	test-mcc:0.485486 
[44]	train-mcc:0.000000	test-mcc:0.485486 
Stopping. Best iteration:
[14]	train-mcc:0.000000	test-mcc:0.493827


Time: Thu Nov 10 2016 06:32:48 AM
For 0014 rounds: train_mcc: 0 - test_mcc: 0.4938269
Confusion matrix:
     truth
preds      0      1
    0 235279    961
    1     95    415
     truth
preds            0            1
    0 0.9937866948 0.0040591341
    1 0.0004012672 0.0017529039
Iteration 8 (base=0.2187879): MCC=0.4938269 | threshold=0.3756278


===




Iteration 9[1] on Thu Nov 10 2016 06:33:22 AM

depth=5, min_child_weight=42.34664, subsample=1, colsample_bytree=0.559015, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.474766 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478669 
[3]	train-mcc:0.000000	test-mcc:0.481161 
[4]	train-mcc:0.000000	test-mcc:0.482165 
[5]	train-mcc:0.000000	test-mcc:0.482183 
[6]	train-mcc:0.000000	test-mcc:0.480586 
[7]	train-mcc:0.000000	test-mcc:0.480289 
[8]	train-mcc:0.000000	test-mcc:0.482368 
[9]	train-mcc:0.000000	test-mcc:0.481557 
[10]	train-mcc:0.000000	test-mcc:0.480816 
[11]	train-mcc:0.000000	test-mcc:0.480917 
[12]	train-mcc:0.000000	test-mcc:0.480917 
[13]	train-mcc:0.000000	test-mcc:0.480816 
[14]	train-mcc:0.000000	test-mcc:0.480289 
[15]	train-mcc:0.000000	test-mcc:0.482052 
[16]	train-mcc:0.000000	test-mcc:0.482301 
[17]	train-mcc:0.000000	test-mcc:0.482030 
[18]	train-mcc:0.000000	test-mcc:0.482275 
[19]	train-mcc:0.000000	test-mcc:0.482052 
[20]	train-mcc:0.000000	test-mcc:0.482301 
[21]	train-mcc:0.000000	test-mcc:0.482769 
[22]	train-mcc:0.000000	test-mcc:0.482052 
[23]	train-mcc:0.000000	test-mcc:0.482522 
[24]	train-mcc:0.000000	test-mcc:0.482522 
[25]	train-mcc:0.000000	test-mcc:0.481804 
[26]	train-mcc:0.000000	test-mcc:0.481777 
[27]	train-mcc:0.000000	test-mcc:0.481777 
[28]	train-mcc:0.000000	test-mcc:0.482030 
[29]	train-mcc:0.000000	test-mcc:0.482030 
[30]	train-mcc:0.000000	test-mcc:0.481116 
[31]	train-mcc:0.000000	test-mcc:0.481583 
[32]	train-mcc:0.000000	test-mcc:0.481116 
[33]	train-mcc:0.000000	test-mcc:0.481116 
[34]	train-mcc:0.000000	test-mcc:0.481116 
[35]	train-mcc:0.000000	test-mcc:0.481116 
[36]	train-mcc:0.000000	test-mcc:0.481116 
[37]	train-mcc:0.000000	test-mcc:0.481310 
[38]	train-mcc:0.000000	test-mcc:0.480589 
[39]	train-mcc:0.000000	test-mcc:0.482739 
[40]	train-mcc:0.000000	test-mcc:0.481785 
[41]	train-mcc:0.000000	test-mcc:0.481785 
[42]	train-mcc:0.000000	test-mcc:0.481310 
[43]	train-mcc:0.000000	test-mcc:0.481773 
[44]	train-mcc:0.000000	test-mcc:0.480532 
[45]	train-mcc:0.000000	test-mcc:0.480096 
[46]	train-mcc:0.000000	test-mcc:0.480096 
[47]	train-mcc:0.000000	test-mcc:0.480096 
[48]	train-mcc:0.000000	test-mcc:0.480096 
[49]	train-mcc:0.000000	test-mcc:0.478890 
[50]	train-mcc:0.000000	test-mcc:0.479643 
[51]	train-mcc:0.000000	test-mcc:0.479643 
Stopping. Best iteration:
[21]	train-mcc:0.000000	test-mcc:0.482769


Time: Thu Nov 10 2016 06:34:45 AM
For 0021 rounds: train_mcc: 0 - test_mcc: 0.4827695
Confusion matrix:
     truth
preds      0      1
    0 235262    965
    1    111    410
     truth
preds           0           1
    0 0.993723284 0.004076064
    1 0.000468853 0.001731799
Iteration 9 (base=0.5): MCC=0.4827695 | threshold=0.4290018



Iteration 9[2] on Thu Nov 10 2016 06:34:47 AM

depth=5, min_child_weight=42.34664, subsample=1, colsample_bytree=0.559015, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.471860 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475586 
[3]	train-mcc:0.000000	test-mcc:0.478675 
[4]	train-mcc:0.000000	test-mcc:0.479111 
[5]	train-mcc:0.000000	test-mcc:0.481166 
[6]	train-mcc:0.000000	test-mcc:0.481444 
[7]	train-mcc:0.000000	test-mcc:0.481241 
[8]	train-mcc:0.000000	test-mcc:0.483842 
[9]	train-mcc:0.000000	test-mcc:0.481895 
[10]	train-mcc:0.000000	test-mcc:0.481498 
[11]	train-mcc:0.000000	test-mcc:0.480030 
[12]	train-mcc:0.000000	test-mcc:0.479546 
[13]	train-mcc:0.000000	test-mcc:0.480727 
[14]	train-mcc:0.000000	test-mcc:0.481683 
[15]	train-mcc:0.000000	test-mcc:0.481471 
[16]	train-mcc:0.000000	test-mcc:0.481683 
[17]	train-mcc:0.000000	test-mcc:0.482930 
[18]	train-mcc:0.000000	test-mcc:0.482624 
[19]	train-mcc:0.000000	test-mcc:0.481895 
[20]	train-mcc:0.000000	test-mcc:0.482876 
[21]	train-mcc:0.000000	test-mcc:0.483128 
[22]	train-mcc:0.000000	test-mcc:0.483128 
[23]	train-mcc:0.000000	test-mcc:0.483563 
[24]	train-mcc:0.000000	test-mcc:0.483805 
[25]	train-mcc:0.000000	test-mcc:0.483340 
[26]	train-mcc:0.000000	test-mcc:0.483128 
[27]	train-mcc:0.000000	test-mcc:0.483842 
[28]	train-mcc:0.000000	test-mcc:0.483128 
[29]	train-mcc:0.000000	test-mcc:0.482806 
[30]	train-mcc:0.000000	test-mcc:0.482806 
[31]	train-mcc:0.000000	test-mcc:0.482806 
[32]	train-mcc:0.000000	test-mcc:0.482806 
[33]	train-mcc:0.000000	test-mcc:0.481698 
[34]	train-mcc:0.000000	test-mcc:0.482413 
[35]	train-mcc:0.000000	test-mcc:0.482876 
[36]	train-mcc:0.000000	test-mcc:0.483128 
[37]	train-mcc:0.000000	test-mcc:0.482876 
[38]	train-mcc:0.000000	test-mcc:0.481657 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.483842


Time: Thu Nov 10 2016 06:35:48 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4838416
Confusion matrix:
     truth
preds      0      1
    0 235257    961
    1    116    415
     truth
preds            0            1
    0 0.9936979670 0.0040591513
    1 0.0004899704 0.0017529113
Iteration 9 (base=0.5): MCC=0.4838416 | threshold=0.4336183



Iteration 9[3] on Thu Nov 10 2016 06:35:49 AM

depth=5, min_child_weight=42.34664, subsample=1, colsample_bytree=0.559015, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.479042 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486434 
[3]	train-mcc:0.000000	test-mcc:0.488623 
[4]	train-mcc:0.000000	test-mcc:0.489956 
[5]	train-mcc:0.000000	test-mcc:0.490167 
[6]	train-mcc:0.000000	test-mcc:0.489179 
[7]	train-mcc:0.000000	test-mcc:0.489054 
[8]	train-mcc:0.000000	test-mcc:0.490267 
[9]	train-mcc:0.000000	test-mcc:0.490314 
[10]	train-mcc:0.000000	test-mcc:0.489137 
[11]	train-mcc:0.000000	test-mcc:0.489293 
[12]	train-mcc:0.000000	test-mcc:0.489498 
[13]	train-mcc:0.000000	test-mcc:0.490412 
[14]	train-mcc:0.000000	test-mcc:0.488927 
[15]	train-mcc:0.000000	test-mcc:0.490085 
[16]	train-mcc:0.000000	test-mcc:0.491093 
[17]	train-mcc:0.000000	test-mcc:0.491048 
[18]	train-mcc:0.000000	test-mcc:0.492718 
[19]	train-mcc:0.000000	test-mcc:0.492718 
[20]	train-mcc:0.000000	test-mcc:0.494681 
[21]	train-mcc:0.000000	test-mcc:0.494321 
[22]	train-mcc:0.000000	test-mcc:0.494858 
[23]	train-mcc:0.000000	test-mcc:0.494681 
[24]	train-mcc:0.000000	test-mcc:0.494681 
[25]	train-mcc:0.000000	test-mcc:0.493786 
[26]	train-mcc:0.000000	test-mcc:0.493786 
[27]	train-mcc:0.000000	test-mcc:0.493611 
[28]	train-mcc:0.000000	test-mcc:0.493556 
[29]	train-mcc:0.000000	test-mcc:0.493748 
[30]	train-mcc:0.000000	test-mcc:0.493748 
[31]	train-mcc:0.000000	test-mcc:0.493333 
[32]	train-mcc:0.000000	test-mcc:0.493773 
[33]	train-mcc:0.000000	test-mcc:0.493722 
[34]	train-mcc:0.000000	test-mcc:0.494153 
[35]	train-mcc:0.000000	test-mcc:0.494153 
[36]	train-mcc:0.000000	test-mcc:0.494585 
[37]	train-mcc:0.000000	test-mcc:0.494760 
[38]	train-mcc:0.000000	test-mcc:0.494351 
[39]	train-mcc:0.000000	test-mcc:0.494760 
[40]	train-mcc:0.000000	test-mcc:0.495151 
[41]	train-mcc:0.000000	test-mcc:0.495151 
[42]	train-mcc:0.000000	test-mcc:0.495377 
[43]	train-mcc:0.000000	test-mcc:0.495377 
[44]	train-mcc:0.000000	test-mcc:0.495377 
[45]	train-mcc:0.000000	test-mcc:0.495632 
[46]	train-mcc:0.000000	test-mcc:0.495816 
[47]	train-mcc:0.000000	test-mcc:0.495196 
[48]	train-mcc:0.000000	test-mcc:0.495196 
[49]	train-mcc:0.000000	test-mcc:0.495196 
[50]	train-mcc:0.000000	test-mcc:0.494676 
[51]	train-mcc:0.000000	test-mcc:0.495732 
[52]	train-mcc:0.000000	test-mcc:0.494535 
[53]	train-mcc:0.000000	test-mcc:0.494192 
[54]	train-mcc:0.000000	test-mcc:0.494248 
[55]	train-mcc:0.000000	test-mcc:0.492781 
[56]	train-mcc:0.000000	test-mcc:0.494308 
[57]	train-mcc:0.000000	test-mcc:0.493667 
[58]	train-mcc:0.000000	test-mcc:0.493670 
[59]	train-mcc:0.000000	test-mcc:0.493742 
[60]	train-mcc:0.000000	test-mcc:0.493821 
[61]	train-mcc:0.000000	test-mcc:0.493821 
[62]	train-mcc:0.000000	test-mcc:0.493749 
[63]	train-mcc:0.000000	test-mcc:0.493543 
[64]	train-mcc:0.000000	test-mcc:0.494879 
[65]	train-mcc:0.000000	test-mcc:0.494669 
[66]	train-mcc:0.000000	test-mcc:0.494170 
[67]	train-mcc:0.000000	test-mcc:0.494382 
[68]	train-mcc:0.000000	test-mcc:0.494251 
[69]	train-mcc:0.000000	test-mcc:0.493540 
[70]	train-mcc:0.000000	test-mcc:0.493749 
[71]	train-mcc:0.000000	test-mcc:0.493749 
[72]	train-mcc:0.000000	test-mcc:0.493749 
[73]	train-mcc:0.000000	test-mcc:0.493827 
[74]	train-mcc:0.000000	test-mcc:0.494451 
[75]	train-mcc:0.000000	test-mcc:0.494198 
[76]	train-mcc:0.000000	test-mcc:0.494198 
Stopping. Best iteration:
[46]	train-mcc:0.000000	test-mcc:0.495816


Time: Thu Nov 10 2016 06:37:50 AM
For 0046 rounds: train_mcc: 0 - test_mcc: 0.4958164
Confusion matrix:
     truth
preds      0      1
    0 235244    935
    1    130    441
     truth
preds            0            1
    0 0.9936388596 0.0039493136
    1 0.0005491024 0.0018627244
Iteration 9 (base=0.5): MCC=0.4958164 | threshold=0.360336



Iteration 9[4] on Thu Nov 10 2016 06:37:52 AM

depth=5, min_child_weight=42.34664, subsample=1, colsample_bytree=0.559015, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.477733 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485311 
[3]	train-mcc:0.000000	test-mcc:0.484572 
[4]	train-mcc:0.000000	test-mcc:0.484031 
[5]	train-mcc:0.000000	test-mcc:0.483651 
[6]	train-mcc:0.000000	test-mcc:0.487111 
[7]	train-mcc:0.000000	test-mcc:0.485585 
[8]	train-mcc:0.000000	test-mcc:0.484609 
[9]	train-mcc:0.000000	test-mcc:0.486485 
[10]	train-mcc:0.000000	test-mcc:0.486228 
[11]	train-mcc:0.000000	test-mcc:0.486228 
[12]	train-mcc:0.000000	test-mcc:0.485934 
[13]	train-mcc:0.000000	test-mcc:0.485540 
[14]	train-mcc:0.000000	test-mcc:0.485540 
[15]	train-mcc:0.000000	test-mcc:0.486036 
[16]	train-mcc:0.000000	test-mcc:0.486036 
[17]	train-mcc:0.000000	test-mcc:0.485345 
[18]	train-mcc:0.000000	test-mcc:0.485345 
[19]	train-mcc:0.000000	test-mcc:0.483668 
[20]	train-mcc:0.000000	test-mcc:0.483943 
[21]	train-mcc:0.000000	test-mcc:0.483785 
[22]	train-mcc:0.000000	test-mcc:0.483374 
[23]	train-mcc:0.000000	test-mcc:0.483374 
[24]	train-mcc:0.000000	test-mcc:0.483282 
[25]	train-mcc:0.000000	test-mcc:0.483972 
[26]	train-mcc:0.000000	test-mcc:0.484661 
[27]	train-mcc:0.000000	test-mcc:0.483972 
[28]	train-mcc:0.000000	test-mcc:0.483946 
[29]	train-mcc:0.000000	test-mcc:0.483946 
[30]	train-mcc:0.000000	test-mcc:0.484205 
[31]	train-mcc:0.000000	test-mcc:0.484205 
[32]	train-mcc:0.000000	test-mcc:0.484798 
[33]	train-mcc:0.000000	test-mcc:0.484536 
[34]	train-mcc:0.000000	test-mcc:0.485311 
[35]	train-mcc:0.000000	test-mcc:0.485311 
[36]	train-mcc:0.000000	test-mcc:0.486021 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.487111


Time: Thu Nov 10 2016 06:38:50 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.487111
Confusion matrix:
     truth
preds      0      1
    0 235227    937
    1    147    439
     truth
preds            0            1
    0 0.9935670539 0.0039577614
    1 0.0006209081 0.0018542767
Iteration 9 (base=0.5): MCC=0.487111 | threshold=0.3895234



Iteration 9[5] on Thu Nov 10 2016 06:38:51 AM

depth=5, min_child_weight=42.34664, subsample=1, colsample_bytree=0.559015, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.486323 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.489806 
[3]	train-mcc:0.000000	test-mcc:0.492163 
[4]	train-mcc:0.000000	test-mcc:0.493989 
[5]	train-mcc:0.000000	test-mcc:0.494414 
[6]	train-mcc:0.000000	test-mcc:0.492721 
[7]	train-mcc:0.000000	test-mcc:0.493556 
[8]	train-mcc:0.000000	test-mcc:0.493810 
[9]	train-mcc:0.000000	test-mcc:0.494557 
[10]	train-mcc:0.000000	test-mcc:0.495254 
[11]	train-mcc:0.000000	test-mcc:0.495902 
[12]	train-mcc:0.000000	test-mcc:0.496148 
[13]	train-mcc:0.000000	test-mcc:0.496148 
[14]	train-mcc:0.000000	test-mcc:0.495700 
[15]	train-mcc:0.000000	test-mcc:0.495700 
[16]	train-mcc:0.000000	test-mcc:0.495598 
[17]	train-mcc:0.000000	test-mcc:0.496148 
[18]	train-mcc:0.000000	test-mcc:0.497537 
[19]	train-mcc:0.000000	test-mcc:0.496643 
[20]	train-mcc:0.000000	test-mcc:0.495563 
[21]	train-mcc:0.000000	test-mcc:0.495563 
[22]	train-mcc:0.000000	test-mcc:0.495563 
[23]	train-mcc:0.000000	test-mcc:0.495123 
[24]	train-mcc:0.000000	test-mcc:0.494869 
[25]	train-mcc:0.000000	test-mcc:0.495348 
[26]	train-mcc:0.000000	test-mcc:0.494883 
[27]	train-mcc:0.000000	test-mcc:0.494939 
[28]	train-mcc:0.000000	test-mcc:0.495348 
[29]	train-mcc:0.000000	test-mcc:0.495814 
[30]	train-mcc:0.000000	test-mcc:0.495814 
[31]	train-mcc:0.000000	test-mcc:0.495348 
[32]	train-mcc:0.000000	test-mcc:0.495348 
[33]	train-mcc:0.000000	test-mcc:0.494647 
[34]	train-mcc:0.000000	test-mcc:0.494647 
[35]	train-mcc:0.000000	test-mcc:0.493982 
[36]	train-mcc:0.000000	test-mcc:0.493525 
[37]	train-mcc:0.000000	test-mcc:0.493497 
[38]	train-mcc:0.000000	test-mcc:0.493480 
[39]	train-mcc:0.000000	test-mcc:0.494502 
[40]	train-mcc:0.000000	test-mcc:0.495377 
[41]	train-mcc:0.000000	test-mcc:0.495377 
[42]	train-mcc:0.000000	test-mcc:0.494067 
[43]	train-mcc:0.000000	test-mcc:0.493551 
[44]	train-mcc:0.000000	test-mcc:0.493114 
[45]	train-mcc:0.000000	test-mcc:0.493632 
[46]	train-mcc:0.000000	test-mcc:0.494326 
[47]	train-mcc:0.000000	test-mcc:0.495968 
[48]	train-mcc:0.000000	test-mcc:0.495277 
Stopping. Best iteration:
[18]	train-mcc:0.000000	test-mcc:0.497537


Time: Thu Nov 10 2016 06:40:08 AM
For 0018 rounds: train_mcc: 0 - test_mcc: 0.4975372
Confusion matrix:
     truth
preds      0      1
    0 235251    937
    1    123    439
     truth
preds            0            1
    0 0.9936684266 0.0039577614
    1 0.0005195354 0.0018542767
Iteration 9 (base=0.5): MCC=0.4975372 | threshold=0.3600347


===




Iteration 10[1] on Thu Nov 10 2016 06:40:33 AM

depth=7, min_child_weight=24.96117, subsample=0.7923566, colsample_bytree=0.9987883, base_score=0.4483429
[1]	train-mcc:0.000000	test-mcc:0.471629 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472440 
[3]	train-mcc:0.000000	test-mcc:0.478751 
[4]	train-mcc:0.000000	test-mcc:0.480925 
[5]	train-mcc:0.000000	test-mcc:0.480232 
[6]	train-mcc:0.000000	test-mcc:0.483688 
[7]	train-mcc:0.000000	test-mcc:0.486461 
[8]	train-mcc:0.000000	test-mcc:0.483476 
[9]	train-mcc:0.000000	test-mcc:0.481229 
[10]	train-mcc:0.000000	test-mcc:0.479765 
[11]	train-mcc:0.000000	test-mcc:0.483273 
[12]	train-mcc:0.000000	test-mcc:0.483502 
[13]	train-mcc:0.000000	test-mcc:0.481297 
[14]	train-mcc:0.000000	test-mcc:0.481797 
[15]	train-mcc:0.000000	test-mcc:0.481797 
[16]	train-mcc:0.000000	test-mcc:0.482032 
[17]	train-mcc:0.000000	test-mcc:0.481781 
[18]	train-mcc:0.000000	test-mcc:0.481541 
[19]	train-mcc:0.000000	test-mcc:0.480512 
[20]	train-mcc:0.000000	test-mcc:0.480689 
[21]	train-mcc:0.000000	test-mcc:0.479386 
[22]	train-mcc:0.000000	test-mcc:0.478835 
[23]	train-mcc:0.000000	test-mcc:0.477947 
[24]	train-mcc:0.000000	test-mcc:0.477344 
[25]	train-mcc:0.000000	test-mcc:0.479208 
[26]	train-mcc:0.000000	test-mcc:0.479013 
[27]	train-mcc:0.000000	test-mcc:0.480001 
[28]	train-mcc:0.000000	test-mcc:0.481254 
[29]	train-mcc:0.000000	test-mcc:0.481254 
[30]	train-mcc:0.000000	test-mcc:0.480749 
[31]	train-mcc:0.000000	test-mcc:0.481254 
[32]	train-mcc:0.000000	test-mcc:0.480626 
[33]	train-mcc:0.000000	test-mcc:0.480626 
[34]	train-mcc:0.000000	test-mcc:0.481254 
[35]	train-mcc:0.000000	test-mcc:0.480874 
[36]	train-mcc:0.000000	test-mcc:0.481621 
[37]	train-mcc:0.000000	test-mcc:0.481621 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.486461


Time: Thu Nov 10 2016 06:42:46 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4864614
Confusion matrix:
     truth
preds      0      1
    0 235317    999
    1     56    376
     truth
preds            0            1
    0 0.9939555984 0.0042196766
    1 0.0002365384 0.0015881866
Iteration 10 (base=0.4483429): MCC=0.4864614 | threshold=0.5109012



Iteration 10[2] on Thu Nov 10 2016 06:42:47 AM

depth=7, min_child_weight=24.96117, subsample=0.7923566, colsample_bytree=0.9987883, base_score=0.4483429
[1]	train-mcc:0.000000	test-mcc:0.472298 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477554 
[3]	train-mcc:0.000000	test-mcc:0.478051 
[4]	train-mcc:0.000000	test-mcc:0.478466 
[5]	train-mcc:0.000000	test-mcc:0.481254 
[6]	train-mcc:0.000000	test-mcc:0.481551 
[7]	train-mcc:0.000000	test-mcc:0.483842 
[8]	train-mcc:0.000000	test-mcc:0.484809 
[9]	train-mcc:0.000000	test-mcc:0.486404 
[10]	train-mcc:0.000000	test-mcc:0.482592 
[11]	train-mcc:0.000000	test-mcc:0.481917 
[12]	train-mcc:0.000000	test-mcc:0.482327 
[13]	train-mcc:0.000000	test-mcc:0.485909 
[14]	train-mcc:0.000000	test-mcc:0.484271 
[15]	train-mcc:0.000000	test-mcc:0.484806 
[16]	train-mcc:0.000000	test-mcc:0.484144 
[17]	train-mcc:0.000000	test-mcc:0.483029 
[18]	train-mcc:0.000000	test-mcc:0.483943 
[19]	train-mcc:0.000000	test-mcc:0.485513 
[20]	train-mcc:0.000000	test-mcc:0.486478 
[21]	train-mcc:0.000000	test-mcc:0.486478 
[22]	train-mcc:0.000000	test-mcc:0.485698 
[23]	train-mcc:0.000000	test-mcc:0.486410 
[24]	train-mcc:0.000000	test-mcc:0.487121 
[25]	train-mcc:0.000000	test-mcc:0.487588 
[26]	train-mcc:0.000000	test-mcc:0.489235 
[27]	train-mcc:0.000000	test-mcc:0.488050 
[28]	train-mcc:0.000000	test-mcc:0.487815 
[29]	train-mcc:0.000000	test-mcc:0.487104 
[30]	train-mcc:0.000000	test-mcc:0.488286 
[31]	train-mcc:0.000000	test-mcc:0.489248 
[32]	train-mcc:0.000000	test-mcc:0.489248 
[33]	train-mcc:0.000000	test-mcc:0.489248 
[34]	train-mcc:0.000000	test-mcc:0.488056 
[35]	train-mcc:0.000000	test-mcc:0.488075 
[36]	train-mcc:0.000000	test-mcc:0.486730 
[37]	train-mcc:0.000000	test-mcc:0.487187 
[38]	train-mcc:0.000000	test-mcc:0.487645 
[39]	train-mcc:0.000000	test-mcc:0.488195 
[40]	train-mcc:0.000000	test-mcc:0.488075 
[41]	train-mcc:0.000000	test-mcc:0.487103 
[42]	train-mcc:0.000000	test-mcc:0.487361 
[43]	train-mcc:0.000000	test-mcc:0.486154 
[44]	train-mcc:0.000000	test-mcc:0.486916 
[45]	train-mcc:0.000000	test-mcc:0.487723 
[46]	train-mcc:0.000000	test-mcc:0.487881 
[47]	train-mcc:0.000000	test-mcc:0.488324 
[48]	train-mcc:0.000000	test-mcc:0.486651 
[49]	train-mcc:0.000000	test-mcc:0.488396 
[50]	train-mcc:0.000000	test-mcc:0.486782 
[51]	train-mcc:0.000000	test-mcc:0.487235 
[52]	train-mcc:0.000000	test-mcc:0.487942 
[53]	train-mcc:0.000000	test-mcc:0.484885 
[54]	train-mcc:0.000000	test-mcc:0.485036 
[55]	train-mcc:0.000000	test-mcc:0.485058 
[56]	train-mcc:0.000000	test-mcc:0.485463 
[57]	train-mcc:0.000000	test-mcc:0.485036 
[58]	train-mcc:0.000000	test-mcc:0.485513 
[59]	train-mcc:0.000000	test-mcc:0.487789 
[60]	train-mcc:0.000000	test-mcc:0.485737 
[61]	train-mcc:0.000000	test-mcc:0.485016 
Stopping. Best iteration:
[31]	train-mcc:0.000000	test-mcc:0.489248


Time: Thu Nov 10 2016 06:46:20 AM
For 0031 rounds: train_mcc: 0 - test_mcc: 0.4892484
Confusion matrix:
     truth
preds      0      1
    0 235261    956
    1    112    420
     truth
preds            0            1
    0 0.9937148626 0.0040380318
    1 0.0004730749 0.0017740307
Iteration 10 (base=0.4483429): MCC=0.4892484 | threshold=0.4123408



Iteration 10[3] on Thu Nov 10 2016 06:46:21 AM

depth=7, min_child_weight=24.96117, subsample=0.7923566, colsample_bytree=0.9987883, base_score=0.4483429
[1]	train-mcc:0.000000	test-mcc:0.482228 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484914 
[3]	train-mcc:0.000000	test-mcc:0.485527 
[4]	train-mcc:0.000000	test-mcc:0.486869 
[5]	train-mcc:0.000000	test-mcc:0.488323 
[6]	train-mcc:0.000000	test-mcc:0.489466 
[7]	train-mcc:0.000000	test-mcc:0.488963 
[8]	train-mcc:0.000000	test-mcc:0.492313 
[9]	train-mcc:0.000000	test-mcc:0.493477 
[10]	train-mcc:0.000000	test-mcc:0.493072 
[11]	train-mcc:0.000000	test-mcc:0.492330 
[12]	train-mcc:0.000000	test-mcc:0.492189 
[13]	train-mcc:0.000000	test-mcc:0.492587 
[14]	train-mcc:0.000000	test-mcc:0.493827 
[15]	train-mcc:0.000000	test-mcc:0.495678 
[16]	train-mcc:0.000000	test-mcc:0.495242 
[17]	train-mcc:0.000000	test-mcc:0.494487 
[18]	train-mcc:0.000000	test-mcc:0.495898 
[19]	train-mcc:0.000000	test-mcc:0.496870 
[20]	train-mcc:0.000000	test-mcc:0.496340 
[21]	train-mcc:0.000000	test-mcc:0.495193 
[22]	train-mcc:0.000000	test-mcc:0.496165 
[23]	train-mcc:0.000000	test-mcc:0.495682 
[24]	train-mcc:0.000000	test-mcc:0.495167 
[25]	train-mcc:0.000000	test-mcc:0.496855 
[26]	train-mcc:0.000000	test-mcc:0.496855 
[27]	train-mcc:0.000000	test-mcc:0.496715 
[28]	train-mcc:0.000000	test-mcc:0.495517 
[29]	train-mcc:0.000000	test-mcc:0.496506 
[30]	train-mcc:0.000000	test-mcc:0.496793 
[31]	train-mcc:0.000000	test-mcc:0.496717 
[32]	train-mcc:0.000000	test-mcc:0.496086 
[33]	train-mcc:0.000000	test-mcc:0.496086 
[34]	train-mcc:0.000000	test-mcc:0.496086 
[35]	train-mcc:0.000000	test-mcc:0.496986 
[36]	train-mcc:0.000000	test-mcc:0.496086 
[37]	train-mcc:0.000000	test-mcc:0.496086 
[38]	train-mcc:0.000000	test-mcc:0.494536 
[39]	train-mcc:0.000000	test-mcc:0.494170 
[40]	train-mcc:0.000000	test-mcc:0.493951 
[41]	train-mcc:0.000000	test-mcc:0.493239 
[42]	train-mcc:0.000000	test-mcc:0.493239 
[43]	train-mcc:0.000000	test-mcc:0.493477 
[44]	train-mcc:0.000000	test-mcc:0.493483 
[45]	train-mcc:0.000000	test-mcc:0.493558 
[46]	train-mcc:0.000000	test-mcc:0.493415 
[47]	train-mcc:0.000000	test-mcc:0.493982 
[48]	train-mcc:0.000000	test-mcc:0.493295 
[49]	train-mcc:0.000000	test-mcc:0.493780 
[50]	train-mcc:0.000000	test-mcc:0.493719 
[51]	train-mcc:0.000000	test-mcc:0.493780 
[52]	train-mcc:0.000000	test-mcc:0.493281 
[53]	train-mcc:0.000000	test-mcc:0.493415 
[54]	train-mcc:0.000000	test-mcc:0.493719 
[55]	train-mcc:0.000000	test-mcc:0.493072 
[56]	train-mcc:0.000000	test-mcc:0.494002 
[57]	train-mcc:0.000000	test-mcc:0.494002 
[58]	train-mcc:0.000000	test-mcc:0.494451 
[59]	train-mcc:0.000000	test-mcc:0.491168 
[60]	train-mcc:0.000000	test-mcc:0.492363 
[61]	train-mcc:0.000000	test-mcc:0.491659 
[62]	train-mcc:0.000000	test-mcc:0.492377 
[63]	train-mcc:0.000000	test-mcc:0.492719 
[64]	train-mcc:0.000000	test-mcc:0.492719 
[65]	train-mcc:0.000000	test-mcc:0.492377 
Stopping. Best iteration:
[35]	train-mcc:0.000000	test-mcc:0.496986


Time: Thu Nov 10 2016 06:49:37 AM
For 0035 rounds: train_mcc: 0 - test_mcc: 0.4969857
Confusion matrix:
     truth
preds      0      1
    0 235291    965
    1     83    411
     truth
preds            0            1
    0 0.9938373812 0.0040760296
    1 0.0003505808 0.0017360084
Iteration 10 (base=0.4483429): MCC=0.4969857 | threshold=0.4473531



Iteration 10[4] on Thu Nov 10 2016 06:49:39 AM

depth=7, min_child_weight=24.96117, subsample=0.7923566, colsample_bytree=0.9987883, base_score=0.4483429
[1]	train-mcc:0.000000	test-mcc:0.481225 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487021 
[3]	train-mcc:0.000000	test-mcc:0.482339 
[4]	train-mcc:0.000000	test-mcc:0.484099 
[5]	train-mcc:0.000000	test-mcc:0.484184 
[6]	train-mcc:0.000000	test-mcc:0.481161 
[7]	train-mcc:0.000000	test-mcc:0.485515 
[8]	train-mcc:0.000000	test-mcc:0.486601 
[9]	train-mcc:0.000000	test-mcc:0.484137 
[10]	train-mcc:0.000000	test-mcc:0.486916 
[11]	train-mcc:0.000000	test-mcc:0.489279 
[12]	train-mcc:0.000000	test-mcc:0.491062 
[13]	train-mcc:0.000000	test-mcc:0.490169 
[14]	train-mcc:0.000000	test-mcc:0.490682 
[15]	train-mcc:0.000000	test-mcc:0.489173 
[16]	train-mcc:0.000000	test-mcc:0.488191 
[17]	train-mcc:0.000000	test-mcc:0.482663 
[18]	train-mcc:0.000000	test-mcc:0.484245 
[19]	train-mcc:0.000000	test-mcc:0.484930 
[20]	train-mcc:0.000000	test-mcc:0.484171 
[21]	train-mcc:0.000000	test-mcc:0.484855 
[22]	train-mcc:0.000000	test-mcc:0.485704 
[23]	train-mcc:0.000000	test-mcc:0.486830 
[24]	train-mcc:0.000000	test-mcc:0.486904 
[25]	train-mcc:0.000000	test-mcc:0.483766 
[26]	train-mcc:0.000000	test-mcc:0.485540 
[27]	train-mcc:0.000000	test-mcc:0.485540 
[28]	train-mcc:0.000000	test-mcc:0.486819 
[29]	train-mcc:0.000000	test-mcc:0.484214 
[30]	train-mcc:0.000000	test-mcc:0.483680 
[31]	train-mcc:0.000000	test-mcc:0.483078 
[32]	train-mcc:0.000000	test-mcc:0.483078 
[33]	train-mcc:0.000000	test-mcc:0.484184 
[34]	train-mcc:0.000000	test-mcc:0.484100 
[35]	train-mcc:0.000000	test-mcc:0.484184 
[36]	train-mcc:0.000000	test-mcc:0.484705 
[37]	train-mcc:0.000000	test-mcc:0.485995 
[38]	train-mcc:0.000000	test-mcc:0.485995 
[39]	train-mcc:0.000000	test-mcc:0.485995 
[40]	train-mcc:0.000000	test-mcc:0.484184 
[41]	train-mcc:0.000000	test-mcc:0.484100 
[42]	train-mcc:0.000000	test-mcc:0.484171 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.491062


Time: Thu Nov 10 2016 06:51:46 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4910618
Confusion matrix:
     truth
preds      0      1
    0 235187    908
    1    187    468
     truth
preds            0            1
    0 0.9933980993 0.0038352693
    1 0.0007898627 0.0019767687
Iteration 10 (base=0.4483429): MCC=0.4910618 | threshold=0.3117241



Iteration 10[5] on Thu Nov 10 2016 06:51:48 AM

depth=7, min_child_weight=24.96117, subsample=0.7923566, colsample_bytree=0.9987883, base_score=0.4483429
[1]	train-mcc:0.000000	test-mcc:0.478549 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487895 
[3]	train-mcc:0.000000	test-mcc:0.490023 
[4]	train-mcc:0.000000	test-mcc:0.488126 
[5]	train-mcc:0.000000	test-mcc:0.489120 
[6]	train-mcc:0.000000	test-mcc:0.486164 
[7]	train-mcc:0.000000	test-mcc:0.487128 
[8]	train-mcc:0.000000	test-mcc:0.487550 
[9]	train-mcc:0.000000	test-mcc:0.486427 
[10]	train-mcc:0.000000	test-mcc:0.488355 
[11]	train-mcc:0.000000	test-mcc:0.491121 
[12]	train-mcc:0.000000	test-mcc:0.491911 
[13]	train-mcc:0.000000	test-mcc:0.491805 
[14]	train-mcc:0.000000	test-mcc:0.490528 
[15]	train-mcc:0.000000	test-mcc:0.488893 
[16]	train-mcc:0.000000	test-mcc:0.489489 
[17]	train-mcc:0.000000	test-mcc:0.490227 
[18]	train-mcc:0.000000	test-mcc:0.489578 
[19]	train-mcc:0.000000	test-mcc:0.489567 
[20]	train-mcc:0.000000	test-mcc:0.489549 
[21]	train-mcc:0.000000	test-mcc:0.489549 
[22]	train-mcc:0.000000	test-mcc:0.489101 
[23]	train-mcc:0.000000	test-mcc:0.489101 
[24]	train-mcc:0.000000	test-mcc:0.488568 
[25]	train-mcc:0.000000	test-mcc:0.490345 
[26]	train-mcc:0.000000	test-mcc:0.488289 
[27]	train-mcc:0.000000	test-mcc:0.489337 
[28]	train-mcc:0.000000	test-mcc:0.486159 
[29]	train-mcc:0.000000	test-mcc:0.486626 
[30]	train-mcc:0.000000	test-mcc:0.486691 
[31]	train-mcc:0.000000	test-mcc:0.486427 
[32]	train-mcc:0.000000	test-mcc:0.486173 
[33]	train-mcc:0.000000	test-mcc:0.485559 
[34]	train-mcc:0.000000	test-mcc:0.485529 
[35]	train-mcc:0.000000	test-mcc:0.485033 
[36]	train-mcc:0.000000	test-mcc:0.486725 
[37]	train-mcc:0.000000	test-mcc:0.485947 
[38]	train-mcc:0.000000	test-mcc:0.486228 
[39]	train-mcc:0.000000	test-mcc:0.487362 
[40]	train-mcc:0.000000	test-mcc:0.486298 
[41]	train-mcc:0.000000	test-mcc:0.486439 
[42]	train-mcc:0.000000	test-mcc:0.486121 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.491911


Time: Thu Nov 10 2016 06:53:59 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4919106
Confusion matrix:
     truth
preds      0      1
    0 235191    909
    1    183    467
     truth
preds            0            1
    0 0.9934149947 0.0038394931
    1 0.0007729673 0.0019725449
Iteration 10 (base=0.4483429): MCC=0.4919106 | threshold=0.2999172


===




Iteration 11[1] on Thu Nov 10 2016 06:54:26 AM

depth=12, min_child_weight=15.00015, subsample=0.5522148, colsample_bytree=0.7399968, base_score=0.1901247
[1]	train-mcc:0.000000	test-mcc:0.469850 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474005 
[3]	train-mcc:0.000000	test-mcc:0.472733 
[4]	train-mcc:0.000000	test-mcc:0.474202 
[5]	train-mcc:0.000000	test-mcc:0.481064 
[6]	train-mcc:0.000000	test-mcc:0.479621 
[7]	train-mcc:0.000000	test-mcc:0.481210 
[8]	train-mcc:0.000000	test-mcc:0.479112 
[9]	train-mcc:0.000000	test-mcc:0.479556 
[10]	train-mcc:0.000000	test-mcc:0.480297 
[11]	train-mcc:0.000000	test-mcc:0.476440 
[12]	train-mcc:0.000000	test-mcc:0.476579 
[13]	train-mcc:0.000000	test-mcc:0.476838 
[14]	train-mcc:0.000000	test-mcc:0.480696 
[15]	train-mcc:0.000000	test-mcc:0.482085 
[16]	train-mcc:0.000000	test-mcc:0.478434 
[17]	train-mcc:0.000000	test-mcc:0.477157 
[18]	train-mcc:0.000000	test-mcc:0.476965 
[19]	train-mcc:0.000000	test-mcc:0.477597 
[20]	train-mcc:0.000000	test-mcc:0.478434 
[21]	train-mcc:0.000000	test-mcc:0.476969 
[22]	train-mcc:0.000000	test-mcc:0.477743 
[23]	train-mcc:0.000000	test-mcc:0.478862 
[24]	train-mcc:0.000000	test-mcc:0.479722 
[25]	train-mcc:0.000000	test-mcc:0.477724 
[26]	train-mcc:0.000000	test-mcc:0.478175 
[27]	train-mcc:0.000000	test-mcc:0.479283 
[28]	train-mcc:0.000000	test-mcc:0.477574 
[29]	train-mcc:0.000000	test-mcc:0.475900 
[30]	train-mcc:0.000000	test-mcc:0.478374 
[31]	train-mcc:0.000000	test-mcc:0.477373 
[32]	train-mcc:0.000000	test-mcc:0.476779 
[33]	train-mcc:0.000000	test-mcc:0.477178 
[34]	train-mcc:0.000000	test-mcc:0.477974 
[35]	train-mcc:0.000000	test-mcc:0.474660 
[36]	train-mcc:0.000000	test-mcc:0.474660 
[37]	train-mcc:0.000000	test-mcc:0.471953 
[38]	train-mcc:0.000000	test-mcc:0.470865 
[39]	train-mcc:0.000000	test-mcc:0.469819 
[40]	train-mcc:0.000000	test-mcc:0.469563 
[41]	train-mcc:0.000000	test-mcc:0.470091 
[42]	train-mcc:0.000000	test-mcc:0.469191 
[43]	train-mcc:0.000000	test-mcc:0.470268 
[44]	train-mcc:0.000000	test-mcc:0.469191 
[45]	train-mcc:0.000000	test-mcc:0.469022 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.482085


Time: Thu Nov 10 2016 06:57:54 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4820852
Confusion matrix:
     truth
preds      0      1
    0 235259    964
    1    114    411
     truth
preds            0            1
    0 0.9937106121 0.0040718401
    1 0.0004815247 0.0017360231
Iteration 11 (base=0.1901247): MCC=0.4820852 | threshold=0.4339805



Iteration 11[2] on Thu Nov 10 2016 06:57:55 AM

depth=12, min_child_weight=15.00015, subsample=0.5522148, colsample_bytree=0.7399968, base_score=0.1901247
[1]	train-mcc:0.000000	test-mcc:0.467343 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.470851 
[3]	train-mcc:0.000000	test-mcc:0.476724 
[4]	train-mcc:0.000000	test-mcc:0.478709 
[5]	train-mcc:0.000000	test-mcc:0.478894 
[6]	train-mcc:0.000000	test-mcc:0.477782 
[7]	train-mcc:0.000000	test-mcc:0.478504 
[8]	train-mcc:0.000000	test-mcc:0.478828 
[9]	train-mcc:0.000000	test-mcc:0.476670 
[10]	train-mcc:0.000000	test-mcc:0.476646 
[11]	train-mcc:0.000000	test-mcc:0.476116 
[12]	train-mcc:0.000000	test-mcc:0.476867 
[13]	train-mcc:0.000000	test-mcc:0.477497 
[14]	train-mcc:0.000000	test-mcc:0.475736 
[15]	train-mcc:0.000000	test-mcc:0.475327 
[16]	train-mcc:0.000000	test-mcc:0.474865 
[17]	train-mcc:0.000000	test-mcc:0.474993 
[18]	train-mcc:0.000000	test-mcc:0.475861 
[19]	train-mcc:0.000000	test-mcc:0.475045 
[20]	train-mcc:0.000000	test-mcc:0.475523 
[21]	train-mcc:0.000000	test-mcc:0.474775 
[22]	train-mcc:0.000000	test-mcc:0.474775 
[23]	train-mcc:0.000000	test-mcc:0.474204 
[24]	train-mcc:0.000000	test-mcc:0.474596 
[25]	train-mcc:0.000000	test-mcc:0.474994 
[26]	train-mcc:0.000000	test-mcc:0.472130 
[27]	train-mcc:0.000000	test-mcc:0.471593 
[28]	train-mcc:0.000000	test-mcc:0.472885 
[29]	train-mcc:0.000000	test-mcc:0.471593 
[30]	train-mcc:0.000000	test-mcc:0.471307 
[31]	train-mcc:0.000000	test-mcc:0.471417 
[32]	train-mcc:0.000000	test-mcc:0.472885 
[33]	train-mcc:0.000000	test-mcc:0.473253 
[34]	train-mcc:0.000000	test-mcc:0.473849 
[35]	train-mcc:0.000000	test-mcc:0.472130 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.478894


Time: Thu Nov 10 2016 07:00:25 AM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.4788943
Confusion matrix:
     truth
preds      0      1
    0 235287    988
    1     86    388
     truth
preds            0            1
    0 0.9938246835 0.0041731961
    1 0.0003632539 0.0016388665
Iteration 11 (base=0.1901247): MCC=0.4788943 | threshold=0.3727876



Iteration 11[3] on Thu Nov 10 2016 07:00:26 AM

depth=12, min_child_weight=15.00015, subsample=0.5522148, colsample_bytree=0.7399968, base_score=0.1901247
[1]	train-mcc:0.000000	test-mcc:0.485208 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487962 
[3]	train-mcc:0.000000	test-mcc:0.486997 
[4]	train-mcc:0.000000	test-mcc:0.488535 
[5]	train-mcc:0.000000	test-mcc:0.490662 
[6]	train-mcc:0.000000	test-mcc:0.489248 
[7]	train-mcc:0.000000	test-mcc:0.492272 
[8]	train-mcc:0.000000	test-mcc:0.490912 
[9]	train-mcc:0.000000	test-mcc:0.488664 
[10]	train-mcc:0.000000	test-mcc:0.486550 
[11]	train-mcc:0.000000	test-mcc:0.488511 
[12]	train-mcc:0.000000	test-mcc:0.489926 
[13]	train-mcc:0.000000	test-mcc:0.491048 
[14]	train-mcc:0.000000	test-mcc:0.491467 
[15]	train-mcc:0.000000	test-mcc:0.491700 
[16]	train-mcc:0.000000	test-mcc:0.489214 
[17]	train-mcc:0.000000	test-mcc:0.489804 
[18]	train-mcc:0.000000	test-mcc:0.490109 
[19]	train-mcc:0.000000	test-mcc:0.488566 
[20]	train-mcc:0.000000	test-mcc:0.489627 
[21]	train-mcc:0.000000	test-mcc:0.489746 
[22]	train-mcc:0.000000	test-mcc:0.488928 
[23]	train-mcc:0.000000	test-mcc:0.489519 
[24]	train-mcc:0.000000	test-mcc:0.490273 
[25]	train-mcc:0.000000	test-mcc:0.490307 
[26]	train-mcc:0.000000	test-mcc:0.491146 
[27]	train-mcc:0.000000	test-mcc:0.486331 
[28]	train-mcc:0.000000	test-mcc:0.485767 
[29]	train-mcc:0.000000	test-mcc:0.485949 
[30]	train-mcc:0.000000	test-mcc:0.485459 
[31]	train-mcc:0.000000	test-mcc:0.486011 
[32]	train-mcc:0.000000	test-mcc:0.485110 
[33]	train-mcc:0.000000	test-mcc:0.485661 
[34]	train-mcc:0.000000	test-mcc:0.485585 
[35]	train-mcc:0.000000	test-mcc:0.487835 
[36]	train-mcc:0.000000	test-mcc:0.487477 
[37]	train-mcc:0.000000	test-mcc:0.489078 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.492272


Time: Thu Nov 10 2016 07:03:11 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4922717
Confusion matrix:
     truth
preds      0      1
    0 235247    942
    1    127    434
     truth
preds            0            1
    0 0.9936515312 0.0039788807
    1 0.0005364308 0.0018331573
Iteration 11 (base=0.1901247): MCC=0.4922717 | threshold=0.3445961



Iteration 11[4] on Thu Nov 10 2016 07:03:13 AM

depth=12, min_child_weight=15.00015, subsample=0.5522148, colsample_bytree=0.7399968, base_score=0.1901247
[1]	train-mcc:0.000000	test-mcc:0.473970 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485151 
[3]	train-mcc:0.000000	test-mcc:0.479855 
[4]	train-mcc:0.000000	test-mcc:0.480429 
[5]	train-mcc:0.000000	test-mcc:0.477935 
[6]	train-mcc:0.000000	test-mcc:0.478705 
[7]	train-mcc:0.000000	test-mcc:0.478997 
[8]	train-mcc:0.000000	test-mcc:0.478051 
[9]	train-mcc:0.000000	test-mcc:0.476136 
[10]	train-mcc:0.000000	test-mcc:0.477142 
[11]	train-mcc:0.000000	test-mcc:0.477337 
[12]	train-mcc:0.000000	test-mcc:0.475705 
[13]	train-mcc:0.000000	test-mcc:0.476842 
[14]	train-mcc:0.000000	test-mcc:0.476913 
[15]	train-mcc:0.000000	test-mcc:0.475231 
[16]	train-mcc:0.000000	test-mcc:0.477462 
[17]	train-mcc:0.000000	test-mcc:0.474770 
[18]	train-mcc:0.000000	test-mcc:0.475521 
[19]	train-mcc:0.000000	test-mcc:0.474356 
[20]	train-mcc:0.000000	test-mcc:0.473585 
[21]	train-mcc:0.000000	test-mcc:0.477052 
[22]	train-mcc:0.000000	test-mcc:0.477701 
[23]	train-mcc:0.000000	test-mcc:0.476512 
[24]	train-mcc:0.000000	test-mcc:0.477886 
[25]	train-mcc:0.000000	test-mcc:0.477729 
[26]	train-mcc:0.000000	test-mcc:0.477336 
[27]	train-mcc:0.000000	test-mcc:0.478083 
[28]	train-mcc:0.000000	test-mcc:0.477729 
[29]	train-mcc:0.000000	test-mcc:0.476611 
[30]	train-mcc:0.000000	test-mcc:0.476986 
[31]	train-mcc:0.000000	test-mcc:0.478283 
[32]	train-mcc:0.000000	test-mcc:0.477619 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.485151


Time: Thu Nov 10 2016 07:05:24 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.4851513
Confusion matrix:
     truth
preds      0      1
    0 235127    885
    1    247    491
     truth
preds           0           1
    0 0.993144667 0.003738120
    1 0.001043295 0.002073918
Iteration 11 (base=0.1901247): MCC=0.4851513 | threshold=0.2188303



Iteration 11[5] on Thu Nov 10 2016 07:05:26 AM

depth=12, min_child_weight=15.00015, subsample=0.5522148, colsample_bytree=0.7399968, base_score=0.1901247
[1]	train-mcc:0.000000	test-mcc:0.476531 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472906 
[3]	train-mcc:0.000000	test-mcc:0.480113 
[4]	train-mcc:0.000000	test-mcc:0.482624 
[5]	train-mcc:0.000000	test-mcc:0.485946 
[6]	train-mcc:0.000000	test-mcc:0.484090 
[7]	train-mcc:0.000000	test-mcc:0.484376 
[8]	train-mcc:0.000000	test-mcc:0.484738 
[9]	train-mcc:0.000000	test-mcc:0.484271 
[10]	train-mcc:0.000000	test-mcc:0.482134 
[11]	train-mcc:0.000000	test-mcc:0.481842 
[12]	train-mcc:0.000000	test-mcc:0.482720 
[13]	train-mcc:0.000000	test-mcc:0.480663 
[14]	train-mcc:0.000000	test-mcc:0.480532 
[15]	train-mcc:0.000000	test-mcc:0.481936 
[16]	train-mcc:0.000000	test-mcc:0.482321 
[17]	train-mcc:0.000000	test-mcc:0.480188 
[18]	train-mcc:0.000000	test-mcc:0.480688 
[19]	train-mcc:0.000000	test-mcc:0.481627 
[20]	train-mcc:0.000000	test-mcc:0.481104 
[21]	train-mcc:0.000000	test-mcc:0.479098 
[22]	train-mcc:0.000000	test-mcc:0.476224 
[23]	train-mcc:0.000000	test-mcc:0.477208 
[24]	train-mcc:0.000000	test-mcc:0.477875 
[25]	train-mcc:0.000000	test-mcc:0.481342 
[26]	train-mcc:0.000000	test-mcc:0.481074 
[27]	train-mcc:0.000000	test-mcc:0.478925 
[28]	train-mcc:0.000000	test-mcc:0.478003 
[29]	train-mcc:0.000000	test-mcc:0.478214 
[30]	train-mcc:0.000000	test-mcc:0.477127 
[31]	train-mcc:0.000000	test-mcc:0.476552 
[32]	train-mcc:0.000000	test-mcc:0.478757 
[33]	train-mcc:0.000000	test-mcc:0.476769 
[34]	train-mcc:0.000000	test-mcc:0.478843 
[35]	train-mcc:0.000000	test-mcc:0.476518 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.485946


Time: Thu Nov 10 2016 07:07:37 AM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.4859462
Confusion matrix:
     truth
preds      0      1
    0 235296    984
    1     78    392
     truth
preds            0            1
    0 0.9938585005 0.0041562830
    1 0.0003294615 0.0016557550
Iteration 11 (base=0.1901247): MCC=0.4859462 | threshold=0.3612404


===




Iteration 12[1] on Thu Nov 10 2016 07:08:04 AM

depth=12, min_child_weight=23.21774, subsample=0.9747669, colsample_bytree=0.9400097, base_score=0.4881057
[1]	train-mcc:0.000000	test-mcc:0.465483 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.473646 
[3]	train-mcc:0.000000	test-mcc:0.475063 
[4]	train-mcc:0.000000	test-mcc:0.483661 
[5]	train-mcc:0.000000	test-mcc:0.483139 
[6]	train-mcc:0.000000	test-mcc:0.480492 
[7]	train-mcc:0.000000	test-mcc:0.482150 
[8]	train-mcc:0.000000	test-mcc:0.483069 
[9]	train-mcc:0.000000	test-mcc:0.483317 
[10]	train-mcc:0.000000	test-mcc:0.481922 
[11]	train-mcc:0.000000	test-mcc:0.482870 
[12]	train-mcc:0.000000	test-mcc:0.482592 
[13]	train-mcc:0.000000	test-mcc:0.483093 
[14]	train-mcc:0.000000	test-mcc:0.483538 
[15]	train-mcc:0.000000	test-mcc:0.482169 
[16]	train-mcc:0.000000	test-mcc:0.482550 
[17]	train-mcc:0.000000	test-mcc:0.483444 
[18]	train-mcc:0.000000	test-mcc:0.483154 
[19]	train-mcc:0.000000	test-mcc:0.484671 
[20]	train-mcc:0.000000	test-mcc:0.483317 
[21]	train-mcc:0.000000	test-mcc:0.482870 
[22]	train-mcc:0.000000	test-mcc:0.483627 
[23]	train-mcc:0.000000	test-mcc:0.483014 
[24]	train-mcc:0.000000	test-mcc:0.482280 
[25]	train-mcc:0.000000	test-mcc:0.481261 
[26]	train-mcc:0.000000	test-mcc:0.480642 
[27]	train-mcc:0.000000	test-mcc:0.479148 
[28]	train-mcc:0.000000	test-mcc:0.479185 
[29]	train-mcc:0.000000	test-mcc:0.481648 
[30]	train-mcc:0.000000	test-mcc:0.481648 
[31]	train-mcc:0.000000	test-mcc:0.480917 
[32]	train-mcc:0.000000	test-mcc:0.481648 
[33]	train-mcc:0.000000	test-mcc:0.481129 
[34]	train-mcc:0.000000	test-mcc:0.481129 
[35]	train-mcc:0.000000	test-mcc:0.481368 
[36]	train-mcc:0.000000	test-mcc:0.480903 
[37]	train-mcc:0.000000	test-mcc:0.480903 
[38]	train-mcc:0.000000	test-mcc:0.480903 
[39]	train-mcc:0.000000	test-mcc:0.480953 
[40]	train-mcc:0.000000	test-mcc:0.481158 
[41]	train-mcc:0.000000	test-mcc:0.481158 
[42]	train-mcc:0.000000	test-mcc:0.481158 
[43]	train-mcc:0.000000	test-mcc:0.481621 
[44]	train-mcc:0.000000	test-mcc:0.480440 
[45]	train-mcc:0.000000	test-mcc:0.480236 
[46]	train-mcc:0.000000	test-mcc:0.480036 
[47]	train-mcc:0.000000	test-mcc:0.479961 
[48]	train-mcc:0.000000	test-mcc:0.480187 
[49]	train-mcc:0.000000	test-mcc:0.480512 
Stopping. Best iteration:
[19]	train-mcc:0.000000	test-mcc:0.484671


Time: Thu Nov 10 2016 07:12:10 AM
For 0019 rounds: train_mcc: 0 - test_mcc: 0.4846715
Confusion matrix:
     truth
preds      0      1
    0 235295    985
    1     78    390
     truth
preds            0            1
    0 0.9938626725 0.0041605420
    1 0.0003294642 0.0016473212
Iteration 12 (base=0.4881057): MCC=0.4846715 | threshold=0.4987027



Iteration 12[2] on Thu Nov 10 2016 07:12:12 AM

depth=12, min_child_weight=23.21774, subsample=0.9747669, colsample_bytree=0.9400097, base_score=0.4881057
[1]	train-mcc:0.000000	test-mcc:0.472426 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478709 
[3]	train-mcc:0.000000	test-mcc:0.483432 
[4]	train-mcc:0.000000	test-mcc:0.481917 
[5]	train-mcc:0.000000	test-mcc:0.483090 
[6]	train-mcc:0.000000	test-mcc:0.483140 
[7]	train-mcc:0.000000	test-mcc:0.481810 
[8]	train-mcc:0.000000	test-mcc:0.481908 
[9]	train-mcc:0.000000	test-mcc:0.484585 
[10]	train-mcc:0.000000	test-mcc:0.481236 
[11]	train-mcc:0.000000	test-mcc:0.482506 
[12]	train-mcc:0.000000	test-mcc:0.483051 
[13]	train-mcc:0.000000	test-mcc:0.482412 
[14]	train-mcc:0.000000	test-mcc:0.482343 
[15]	train-mcc:0.000000	test-mcc:0.481465 
[16]	train-mcc:0.000000	test-mcc:0.480400 
[17]	train-mcc:0.000000	test-mcc:0.481842 
[18]	train-mcc:0.000000	test-mcc:0.480167 
[19]	train-mcc:0.000000	test-mcc:0.482811 
[20]	train-mcc:0.000000	test-mcc:0.484002 
[21]	train-mcc:0.000000	test-mcc:0.483521 
[22]	train-mcc:0.000000	test-mcc:0.483283 
[23]	train-mcc:0.000000	test-mcc:0.482916 
[24]	train-mcc:0.000000	test-mcc:0.484425 
[25]	train-mcc:0.000000	test-mcc:0.484863 
[26]	train-mcc:0.000000	test-mcc:0.484087 
[27]	train-mcc:0.000000	test-mcc:0.482868 
[28]	train-mcc:0.000000	test-mcc:0.481388 
[29]	train-mcc:0.000000	test-mcc:0.480962 
[30]	train-mcc:0.000000	test-mcc:0.480514 
[31]	train-mcc:0.000000	test-mcc:0.479824 
[32]	train-mcc:0.000000	test-mcc:0.479824 
[33]	train-mcc:0.000000	test-mcc:0.478873 
[34]	train-mcc:0.000000	test-mcc:0.479191 
[35]	train-mcc:0.000000	test-mcc:0.480962 
[36]	train-mcc:0.000000	test-mcc:0.480398 
[37]	train-mcc:0.000000	test-mcc:0.480811 
[38]	train-mcc:0.000000	test-mcc:0.481946 
[39]	train-mcc:0.000000	test-mcc:0.482651 
[40]	train-mcc:0.000000	test-mcc:0.481241 
[41]	train-mcc:0.000000	test-mcc:0.481745 
[42]	train-mcc:0.000000	test-mcc:0.480665 
[43]	train-mcc:0.000000	test-mcc:0.481018 
[44]	train-mcc:0.000000	test-mcc:0.481278 
[45]	train-mcc:0.000000	test-mcc:0.481278 
[46]	train-mcc:0.000000	test-mcc:0.480843 
[47]	train-mcc:0.000000	test-mcc:0.480381 
[48]	train-mcc:0.000000	test-mcc:0.479960 
[49]	train-mcc:0.000000	test-mcc:0.479922 
[50]	train-mcc:0.000000	test-mcc:0.479396 
[51]	train-mcc:0.000000	test-mcc:0.480238 
[52]	train-mcc:0.000000	test-mcc:0.480238 
[53]	train-mcc:0.000000	test-mcc:0.480408 
[54]	train-mcc:0.000000	test-mcc:0.479683 
[55]	train-mcc:0.000000	test-mcc:0.480962 
Stopping. Best iteration:
[25]	train-mcc:0.000000	test-mcc:0.484863


Time: Thu Nov 10 2016 07:16:03 AM
For 0025 rounds: train_mcc: 0 - test_mcc: 0.4848634
Confusion matrix:
     truth
preds      0      1
    0 235283    977
    1     90    399
     truth
preds            0            1
    0 0.9938077880 0.0041267334
    1 0.0003801494 0.0016853292
Iteration 12 (base=0.4881057): MCC=0.4848634 | threshold=0.4704508



Iteration 12[3] on Thu Nov 10 2016 07:16:04 AM

depth=12, min_child_weight=23.21774, subsample=0.9747669, colsample_bytree=0.9400097, base_score=0.4881057
[1]	train-mcc:0.000000	test-mcc:0.472201 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482693 
[3]	train-mcc:0.000000	test-mcc:0.489615 
[4]	train-mcc:0.000000	test-mcc:0.486998 
[5]	train-mcc:0.000000	test-mcc:0.487410 
[6]	train-mcc:0.000000	test-mcc:0.486725 
[7]	train-mcc:0.000000	test-mcc:0.488525 
[8]	train-mcc:0.000000	test-mcc:0.489468 
[9]	train-mcc:0.000000	test-mcc:0.488297 
[10]	train-mcc:0.000000	test-mcc:0.489235 
[11]	train-mcc:0.000000	test-mcc:0.488056 
[12]	train-mcc:0.000000	test-mcc:0.488583 
[13]	train-mcc:0.000000	test-mcc:0.490651 
[14]	train-mcc:0.000000	test-mcc:0.493473 
[15]	train-mcc:0.000000	test-mcc:0.495116 
[16]	train-mcc:0.000000	test-mcc:0.497463 
[17]	train-mcc:0.000000	test-mcc:0.496514 
[18]	train-mcc:0.000000	test-mcc:0.497257 
[19]	train-mcc:0.000000	test-mcc:0.494439 
[20]	train-mcc:0.000000	test-mcc:0.495838 
[21]	train-mcc:0.000000	test-mcc:0.495656 
[22]	train-mcc:0.000000	test-mcc:0.495730 
[23]	train-mcc:0.000000	test-mcc:0.492855 
[24]	train-mcc:0.000000	test-mcc:0.494086 
[25]	train-mcc:0.000000	test-mcc:0.494999 
[26]	train-mcc:0.000000	test-mcc:0.493204 
[27]	train-mcc:0.000000	test-mcc:0.492504 
[28]	train-mcc:0.000000	test-mcc:0.491622 
[29]	train-mcc:0.000000	test-mcc:0.492079 
[30]	train-mcc:0.000000	test-mcc:0.492969 
[31]	train-mcc:0.000000	test-mcc:0.492814 
[32]	train-mcc:0.000000	test-mcc:0.492814 
[33]	train-mcc:0.000000	test-mcc:0.492526 
[34]	train-mcc:0.000000	test-mcc:0.492863 
[35]	train-mcc:0.000000	test-mcc:0.492863 
[36]	train-mcc:0.000000	test-mcc:0.493163 
[37]	train-mcc:0.000000	test-mcc:0.492464 
[38]	train-mcc:0.000000	test-mcc:0.493163 
[39]	train-mcc:0.000000	test-mcc:0.492682 
[40]	train-mcc:0.000000	test-mcc:0.492682 
[41]	train-mcc:0.000000	test-mcc:0.492189 
[42]	train-mcc:0.000000	test-mcc:0.491971 
[43]	train-mcc:0.000000	test-mcc:0.493224 
[44]	train-mcc:0.000000	test-mcc:0.493224 
[45]	train-mcc:0.000000	test-mcc:0.493224 
[46]	train-mcc:0.000000	test-mcc:0.493415 
Stopping. Best iteration:
[16]	train-mcc:0.000000	test-mcc:0.497463


Time: Thu Nov 10 2016 07:19:18 AM
For 0016 rounds: train_mcc: 0 - test_mcc: 0.497463
Confusion matrix:
     truth
preds      0      1
    0 235269    949
    1    105    427
     truth
preds            0            1
    0 0.9937444562 0.0040084477
    1 0.0004435058 0.0018035903
Iteration 12 (base=0.4881057): MCC=0.497463 | threshold=0.4041864



Iteration 12[4] on Thu Nov 10 2016 07:19:19 AM

depth=12, min_child_weight=23.21774, subsample=0.9747669, colsample_bytree=0.9400097, base_score=0.4881057
[1]	train-mcc:0.000000	test-mcc:0.478540 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.479809 
[3]	train-mcc:0.000000	test-mcc:0.480290 
[4]	train-mcc:0.000000	test-mcc:0.480057 
[5]	train-mcc:0.000000	test-mcc:0.479700 
[6]	train-mcc:0.000000	test-mcc:0.483027 
[7]	train-mcc:0.000000	test-mcc:0.484031 
[8]	train-mcc:0.000000	test-mcc:0.482074 
[9]	train-mcc:0.000000	test-mcc:0.483532 
[10]	train-mcc:0.000000	test-mcc:0.482761 
[11]	train-mcc:0.000000	test-mcc:0.482331 
[12]	train-mcc:0.000000	test-mcc:0.486634 
[13]	train-mcc:0.000000	test-mcc:0.487621 
[14]	train-mcc:0.000000	test-mcc:0.485452 
[15]	train-mcc:0.000000	test-mcc:0.486404 
[16]	train-mcc:0.000000	test-mcc:0.486154 
[17]	train-mcc:0.000000	test-mcc:0.480694 
[18]	train-mcc:0.000000	test-mcc:0.481966 
[19]	train-mcc:0.000000	test-mcc:0.482221 
[20]	train-mcc:0.000000	test-mcc:0.481962 
[21]	train-mcc:0.000000	test-mcc:0.481251 
[22]	train-mcc:0.000000	test-mcc:0.481853 
[23]	train-mcc:0.000000	test-mcc:0.482832 
[24]	train-mcc:0.000000	test-mcc:0.481288 
[25]	train-mcc:0.000000	test-mcc:0.481697 
[26]	train-mcc:0.000000	test-mcc:0.482577 
[27]	train-mcc:0.000000	test-mcc:0.481795 
[28]	train-mcc:0.000000	test-mcc:0.483373 
[29]	train-mcc:0.000000	test-mcc:0.483373 
[30]	train-mcc:0.000000	test-mcc:0.482384 
[31]	train-mcc:0.000000	test-mcc:0.481900 
[32]	train-mcc:0.000000	test-mcc:0.481188 
[33]	train-mcc:0.000000	test-mcc:0.479699 
[34]	train-mcc:0.000000	test-mcc:0.480395 
[35]	train-mcc:0.000000	test-mcc:0.481169 
[36]	train-mcc:0.000000	test-mcc:0.480906 
[37]	train-mcc:0.000000	test-mcc:0.479755 
[38]	train-mcc:0.000000	test-mcc:0.479126 
[39]	train-mcc:0.000000	test-mcc:0.479148 
[40]	train-mcc:0.000000	test-mcc:0.479909 
[41]	train-mcc:0.000000	test-mcc:0.481657 
[42]	train-mcc:0.000000	test-mcc:0.481237 
[43]	train-mcc:0.000000	test-mcc:0.480474 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.487621


Time: Thu Nov 10 2016 07:22:26 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4876206
Confusion matrix:
     truth
preds      0      1
    0 235246    948
    1    128    428
     truth
preds            0            1
    0 0.9936473073 0.0040042239
    1 0.0005406547 0.0018078141
Iteration 12 (base=0.4881057): MCC=0.4876206 | threshold=0.3826951



Iteration 12[5] on Thu Nov 10 2016 07:22:27 AM

depth=12, min_child_weight=23.21774, subsample=0.9747669, colsample_bytree=0.9400097, base_score=0.4881057
[1]	train-mcc:0.000000	test-mcc:0.486623 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.491476 
[3]	train-mcc:0.000000	test-mcc:0.491752 
[4]	train-mcc:0.000000	test-mcc:0.492106 
[5]	train-mcc:0.000000	test-mcc:0.490904 
[6]	train-mcc:0.000000	test-mcc:0.492290 
[7]	train-mcc:0.000000	test-mcc:0.491640 
[8]	train-mcc:0.000000	test-mcc:0.487645 
[9]	train-mcc:0.000000	test-mcc:0.488145 
[10]	train-mcc:0.000000	test-mcc:0.487438 
[11]	train-mcc:0.000000	test-mcc:0.488065 
[12]	train-mcc:0.000000	test-mcc:0.488141 
[13]	train-mcc:0.000000	test-mcc:0.485949 
[14]	train-mcc:0.000000	test-mcc:0.486191 
[15]	train-mcc:0.000000	test-mcc:0.485193 
[16]	train-mcc:0.000000	test-mcc:0.486222 
[17]	train-mcc:0.000000	test-mcc:0.486076 
[18]	train-mcc:0.000000	test-mcc:0.488647 
[19]	train-mcc:0.000000	test-mcc:0.486544 
[20]	train-mcc:0.000000	test-mcc:0.487289 
[21]	train-mcc:0.000000	test-mcc:0.486024 
[22]	train-mcc:0.000000	test-mcc:0.487963 
[23]	train-mcc:0.000000	test-mcc:0.487799 
[24]	train-mcc:0.000000	test-mcc:0.488520 
[25]	train-mcc:0.000000	test-mcc:0.490365 
[26]	train-mcc:0.000000	test-mcc:0.488112 
[27]	train-mcc:0.000000	test-mcc:0.490059 
[28]	train-mcc:0.000000	test-mcc:0.493095 
[29]	train-mcc:0.000000	test-mcc:0.488640 
[30]	train-mcc:0.000000	test-mcc:0.489463 
[31]	train-mcc:0.000000	test-mcc:0.488392 
[32]	train-mcc:0.000000	test-mcc:0.488392 
[33]	train-mcc:0.000000	test-mcc:0.487859 
[34]	train-mcc:0.000000	test-mcc:0.487328 
[35]	train-mcc:0.000000	test-mcc:0.485852 
[36]	train-mcc:0.000000	test-mcc:0.486549 
[37]	train-mcc:0.000000	test-mcc:0.486271 
[38]	train-mcc:0.000000	test-mcc:0.486368 
[39]	train-mcc:0.000000	test-mcc:0.487111 
[40]	train-mcc:0.000000	test-mcc:0.487111 
[41]	train-mcc:0.000000	test-mcc:0.485993 
[42]	train-mcc:0.000000	test-mcc:0.486671 
[43]	train-mcc:0.000000	test-mcc:0.486671 
[44]	train-mcc:0.000000	test-mcc:0.487395 
[45]	train-mcc:0.000000	test-mcc:0.486470 
[46]	train-mcc:0.000000	test-mcc:0.486603 
[47]	train-mcc:0.000000	test-mcc:0.487277 
[48]	train-mcc:0.000000	test-mcc:0.486690 
[49]	train-mcc:0.000000	test-mcc:0.487097 
[50]	train-mcc:0.000000	test-mcc:0.486942 
[51]	train-mcc:0.000000	test-mcc:0.487859 
[52]	train-mcc:0.000000	test-mcc:0.487859 
[53]	train-mcc:0.000000	test-mcc:0.487564 
[54]	train-mcc:0.000000	test-mcc:0.486437 
[55]	train-mcc:0.000000	test-mcc:0.486437 
[56]	train-mcc:0.000000	test-mcc:0.487523 
[57]	train-mcc:0.000000	test-mcc:0.487523 
[58]	train-mcc:0.000000	test-mcc:0.488052 
Stopping. Best iteration:
[28]	train-mcc:0.000000	test-mcc:0.493095


Time: Thu Nov 10 2016 07:26:30 AM
For 0028 rounds: train_mcc: 0 - test_mcc: 0.4930949
Confusion matrix:
     truth
preds      0      1
    0 235300    977
    1     74    399
     truth
preds           0           1
    0 0.993875396 0.004126716
    1 0.000312566 0.001685322
Iteration 12 (base=0.4881057): MCC=0.4930949 | threshold=0.443485


===




Iteration 13[1] on Thu Nov 10 2016 07:26:55 AM

depth=5, min_child_weight=21.32156, subsample=0.5290311, colsample_bytree=0.5111552, base_score=0.261821
[1]	train-mcc:0.000000	test-mcc:0.470281 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475697 
[3]	train-mcc:0.000000	test-mcc:0.476844 
[4]	train-mcc:0.000000	test-mcc:0.478456 
[5]	train-mcc:0.000000	test-mcc:0.482032 
[6]	train-mcc:0.000000	test-mcc:0.481648 
[7]	train-mcc:0.000000	test-mcc:0.480694 
[8]	train-mcc:0.000000	test-mcc:0.478758 
[9]	train-mcc:0.000000	test-mcc:0.478837 
[10]	train-mcc:0.000000	test-mcc:0.479283 
[11]	train-mcc:0.000000	test-mcc:0.480837 
[12]	train-mcc:0.000000	test-mcc:0.482052 
[13]	train-mcc:0.000000	test-mcc:0.482052 
[14]	train-mcc:0.000000	test-mcc:0.482052 
[15]	train-mcc:0.000000	test-mcc:0.482275 
[16]	train-mcc:0.000000	test-mcc:0.481475 
[17]	train-mcc:0.000000	test-mcc:0.480273 
[18]	train-mcc:0.000000	test-mcc:0.480915 
[19]	train-mcc:0.000000	test-mcc:0.480871 
[20]	train-mcc:0.000000	test-mcc:0.479914 
[21]	train-mcc:0.000000	test-mcc:0.479685 
[22]	train-mcc:0.000000	test-mcc:0.481596 
[23]	train-mcc:0.000000	test-mcc:0.479006 
[24]	train-mcc:0.000000	test-mcc:0.478424 
[25]	train-mcc:0.000000	test-mcc:0.477900 
[26]	train-mcc:0.000000	test-mcc:0.478336 
[27]	train-mcc:0.000000	test-mcc:0.479926 
[28]	train-mcc:0.000000	test-mcc:0.480006 
[29]	train-mcc:0.000000	test-mcc:0.479471 
[30]	train-mcc:0.000000	test-mcc:0.478937 
[31]	train-mcc:0.000000	test-mcc:0.478937 
[32]	train-mcc:0.000000	test-mcc:0.478690 
[33]	train-mcc:0.000000	test-mcc:0.479807 
[34]	train-mcc:0.000000	test-mcc:0.479425 
[35]	train-mcc:0.000000	test-mcc:0.479425 
[36]	train-mcc:0.000000	test-mcc:0.479336 
[37]	train-mcc:0.000000	test-mcc:0.479216 
[38]	train-mcc:0.000000	test-mcc:0.479216 
[39]	train-mcc:0.000000	test-mcc:0.479859 
[40]	train-mcc:0.000000	test-mcc:0.480611 
[41]	train-mcc:0.000000	test-mcc:0.480611 
[42]	train-mcc:0.000000	test-mcc:0.480611 
[43]	train-mcc:0.000000	test-mcc:0.480611 
[44]	train-mcc:0.000000	test-mcc:0.480082 
[45]	train-mcc:0.000000	test-mcc:0.480082 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.482275


Time: Thu Nov 10 2016 07:27:56 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4822754
Confusion matrix:
     truth
preds      0      1
    0 235264    967
    1    109    408
     truth
preds            0            1
    0 0.9937317316 0.0040845118
    1 0.0004604052 0.0017233514
Iteration 13 (base=0.261821): MCC=0.4822754 | threshold=0.4335759



Iteration 13[2] on Thu Nov 10 2016 07:27:58 AM

depth=5, min_child_weight=21.32156, subsample=0.5290311, colsample_bytree=0.5111552, base_score=0.261821
[1]	train-mcc:0.000000	test-mcc:0.470558 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474632 
[3]	train-mcc:0.000000	test-mcc:0.482090 
[4]	train-mcc:0.000000	test-mcc:0.484956 
[5]	train-mcc:0.000000	test-mcc:0.485452 
[6]	train-mcc:0.000000	test-mcc:0.485479 
[7]	train-mcc:0.000000	test-mcc:0.484601 
[8]	train-mcc:0.000000	test-mcc:0.483325 
[9]	train-mcc:0.000000	test-mcc:0.482641 
[10]	train-mcc:0.000000	test-mcc:0.481053 
[11]	train-mcc:0.000000	test-mcc:0.480953 
[12]	train-mcc:0.000000	test-mcc:0.481875 
[13]	train-mcc:0.000000	test-mcc:0.483521 
[14]	train-mcc:0.000000	test-mcc:0.484238 
[15]	train-mcc:0.000000	test-mcc:0.483417 
[16]	train-mcc:0.000000	test-mcc:0.482916 
[17]	train-mcc:0.000000	test-mcc:0.482720 
[18]	train-mcc:0.000000	test-mcc:0.484249 
[19]	train-mcc:0.000000	test-mcc:0.484954 
[20]	train-mcc:0.000000	test-mcc:0.483763 
[21]	train-mcc:0.000000	test-mcc:0.483911 
[22]	train-mcc:0.000000	test-mcc:0.483206 
[23]	train-mcc:0.000000	test-mcc:0.483556 
[24]	train-mcc:0.000000	test-mcc:0.483556 
[25]	train-mcc:0.000000	test-mcc:0.484493 
[26]	train-mcc:0.000000	test-mcc:0.485436 
[27]	train-mcc:0.000000	test-mcc:0.484883 
[28]	train-mcc:0.000000	test-mcc:0.485195 
[29]	train-mcc:0.000000	test-mcc:0.485892 
[30]	train-mcc:0.000000	test-mcc:0.485479 
[31]	train-mcc:0.000000	test-mcc:0.486404 
[32]	train-mcc:0.000000	test-mcc:0.485208 
[33]	train-mcc:0.000000	test-mcc:0.484806 
[34]	train-mcc:0.000000	test-mcc:0.485977 
[35]	train-mcc:0.000000	test-mcc:0.485517 
[36]	train-mcc:0.000000	test-mcc:0.484479 
[37]	train-mcc:0.000000	test-mcc:0.484238 
[38]	train-mcc:0.000000	test-mcc:0.484006 
[39]	train-mcc:0.000000	test-mcc:0.484479 
[40]	train-mcc:0.000000	test-mcc:0.484506 
[41]	train-mcc:0.000000	test-mcc:0.483786 
[42]	train-mcc:0.000000	test-mcc:0.483270 
[43]	train-mcc:0.000000	test-mcc:0.486280 
[44]	train-mcc:0.000000	test-mcc:0.485155 
[45]	train-mcc:0.000000	test-mcc:0.484038 
[46]	train-mcc:0.000000	test-mcc:0.484363 
[47]	train-mcc:0.000000	test-mcc:0.483381 
[48]	train-mcc:0.000000	test-mcc:0.484054 
[49]	train-mcc:0.000000	test-mcc:0.485266 
[50]	train-mcc:0.000000	test-mcc:0.483622 
[51]	train-mcc:0.000000	test-mcc:0.483756 
[52]	train-mcc:0.000000	test-mcc:0.484456 
[53]	train-mcc:0.000000	test-mcc:0.484456 
[54]	train-mcc:0.000000	test-mcc:0.483615 
[55]	train-mcc:0.000000	test-mcc:0.483622 
[56]	train-mcc:0.000000	test-mcc:0.483193 
[57]	train-mcc:0.000000	test-mcc:0.481946 
[58]	train-mcc:0.000000	test-mcc:0.482500 
[59]	train-mcc:0.000000	test-mcc:0.482092 
[60]	train-mcc:0.000000	test-mcc:0.482221 
[61]	train-mcc:0.000000	test-mcc:0.481789 
Stopping. Best iteration:
[31]	train-mcc:0.000000	test-mcc:0.486404


Time: Thu Nov 10 2016 07:29:11 AM
For 0031 rounds: train_mcc: 0 - test_mcc: 0.4864039
Confusion matrix:
     truth
preds      0      1
    0 235273    968
    1    100    408
     truth
preds            0            1
    0 0.9937655492 0.0040887184
    1 0.0004223883 0.0017233441
Iteration 13 (base=0.261821): MCC=0.4864039 | threshold=0.424053



Iteration 13[3] on Thu Nov 10 2016 07:29:12 AM

depth=5, min_child_weight=21.32156, subsample=0.5290311, colsample_bytree=0.5111552, base_score=0.261821
[1]	train-mcc:0.000000	test-mcc:0.486603 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488928 
[3]	train-mcc:0.000000	test-mcc:0.491287 
[4]	train-mcc:0.000000	test-mcc:0.491698 
[5]	train-mcc:0.000000	test-mcc:0.491121 
[6]	train-mcc:0.000000	test-mcc:0.492900 
[7]	train-mcc:0.000000	test-mcc:0.494856 
[8]	train-mcc:0.000000	test-mcc:0.492413 
[9]	train-mcc:0.000000	test-mcc:0.493229 
[10]	train-mcc:0.000000	test-mcc:0.489960 
[11]	train-mcc:0.000000	test-mcc:0.492189 
[12]	train-mcc:0.000000	test-mcc:0.490986 
[13]	train-mcc:0.000000	test-mcc:0.491593 
[14]	train-mcc:0.000000	test-mcc:0.490609 
[15]	train-mcc:0.000000	test-mcc:0.491971 
[16]	train-mcc:0.000000	test-mcc:0.491259 
[17]	train-mcc:0.000000	test-mcc:0.491170 
[18]	train-mcc:0.000000	test-mcc:0.491971 
[19]	train-mcc:0.000000	test-mcc:0.491799 
[20]	train-mcc:0.000000	test-mcc:0.492313 
[21]	train-mcc:0.000000	test-mcc:0.491799 
[22]	train-mcc:0.000000	test-mcc:0.494578 
[23]	train-mcc:0.000000	test-mcc:0.491401 
[24]	train-mcc:0.000000	test-mcc:0.491401 
[25]	train-mcc:0.000000	test-mcc:0.491218 
[26]	train-mcc:0.000000	test-mcc:0.491218 
[27]	train-mcc:0.000000	test-mcc:0.490606 
[28]	train-mcc:0.000000	test-mcc:0.489981 
[29]	train-mcc:0.000000	test-mcc:0.491028 
[30]	train-mcc:0.000000	test-mcc:0.492190 
[31]	train-mcc:0.000000	test-mcc:0.492190 
[32]	train-mcc:0.000000	test-mcc:0.492190 
[33]	train-mcc:0.000000	test-mcc:0.493129 
[34]	train-mcc:0.000000	test-mcc:0.492418 
[35]	train-mcc:0.000000	test-mcc:0.491700 
[36]	train-mcc:0.000000	test-mcc:0.491899 
[37]	train-mcc:0.000000	test-mcc:0.492580 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.494856


Time: Thu Nov 10 2016 07:29:55 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4948556
Confusion matrix:
     truth
preds      0      1
    0 235291    968
    1     83    408
     truth
preds            0            1
    0 0.9938373812 0.0040887012
    1 0.0003505808 0.0017233369
Iteration 13 (base=0.261821): MCC=0.4948556 | threshold=0.4096337



Iteration 13[4] on Thu Nov 10 2016 07:29:57 AM

depth=5, min_child_weight=21.32156, subsample=0.5290311, colsample_bytree=0.5111552, base_score=0.261821
[1]	train-mcc:0.000000	test-mcc:0.485090 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477786 
[3]	train-mcc:0.000000	test-mcc:0.478285 
[4]	train-mcc:0.000000	test-mcc:0.478710 
[5]	train-mcc:0.000000	test-mcc:0.477301 
[6]	train-mcc:0.000000	test-mcc:0.478748 
[7]	train-mcc:0.000000	test-mcc:0.479977 
[8]	train-mcc:0.000000	test-mcc:0.481342 
[9]	train-mcc:0.000000	test-mcc:0.479840 
[10]	train-mcc:0.000000	test-mcc:0.480835 
[11]	train-mcc:0.000000	test-mcc:0.480167 
[12]	train-mcc:0.000000	test-mcc:0.479500 
[13]	train-mcc:0.000000	test-mcc:0.481243 
[14]	train-mcc:0.000000	test-mcc:0.481888 
[15]	train-mcc:0.000000	test-mcc:0.481582 
[16]	train-mcc:0.000000	test-mcc:0.482211 
[17]	train-mcc:0.000000	test-mcc:0.482211 
[18]	train-mcc:0.000000	test-mcc:0.481582 
[19]	train-mcc:0.000000	test-mcc:0.481623 
[20]	train-mcc:0.000000	test-mcc:0.480696 
[21]	train-mcc:0.000000	test-mcc:0.479299 
[22]	train-mcc:0.000000	test-mcc:0.480601 
[23]	train-mcc:0.000000	test-mcc:0.479939 
[24]	train-mcc:0.000000	test-mcc:0.479277 
[25]	train-mcc:0.000000	test-mcc:0.479939 
[26]	train-mcc:0.000000	test-mcc:0.478345 
[27]	train-mcc:0.000000	test-mcc:0.477497 
[28]	train-mcc:0.000000	test-mcc:0.478224 
[29]	train-mcc:0.000000	test-mcc:0.477548 
[30]	train-mcc:0.000000	test-mcc:0.477548 
[31]	train-mcc:0.000000	test-mcc:0.478957 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.485090


Time: Thu Nov 10 2016 07:30:36 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.4850901
Confusion matrix:
     truth
preds      0      1
    0 235182    914
    1    192    462
     truth
preds           0           1
    0 0.993376980 0.003860612
    1 0.000810982 0.001951426
Iteration 13 (base=0.261821): MCC=0.4850901 | threshold=0.263716



Iteration 13[5] on Thu Nov 10 2016 07:30:37 AM

depth=5, min_child_weight=21.32156, subsample=0.5290311, colsample_bytree=0.5111552, base_score=0.261821
[1]	train-mcc:0.000000	test-mcc:0.491067 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483911 
[3]	train-mcc:0.000000	test-mcc:0.480333 
[4]	train-mcc:0.000000	test-mcc:0.485774 
[5]	train-mcc:0.000000	test-mcc:0.485458 
[6]	train-mcc:0.000000	test-mcc:0.485575 
[7]	train-mcc:0.000000	test-mcc:0.485147 
[8]	train-mcc:0.000000	test-mcc:0.486410 
[9]	train-mcc:0.000000	test-mcc:0.488355 
[10]	train-mcc:0.000000	test-mcc:0.487857 
[11]	train-mcc:0.000000	test-mcc:0.488191 
[12]	train-mcc:0.000000	test-mcc:0.487888 
[13]	train-mcc:0.000000	test-mcc:0.487815 
[14]	train-mcc:0.000000	test-mcc:0.487177 
[15]	train-mcc:0.000000	test-mcc:0.486916 
[16]	train-mcc:0.000000	test-mcc:0.486478 
[17]	train-mcc:0.000000	test-mcc:0.487242 
[18]	train-mcc:0.000000	test-mcc:0.489549 
[19]	train-mcc:0.000000	test-mcc:0.489032 
[20]	train-mcc:0.000000	test-mcc:0.488798 
[21]	train-mcc:0.000000	test-mcc:0.486293 
[22]	train-mcc:0.000000	test-mcc:0.486997 
[23]	train-mcc:0.000000	test-mcc:0.486735 
[24]	train-mcc:0.000000	test-mcc:0.486194 
[25]	train-mcc:0.000000	test-mcc:0.486397 
[26]	train-mcc:0.000000	test-mcc:0.486293 
[27]	train-mcc:0.000000	test-mcc:0.486997 
[28]	train-mcc:0.000000	test-mcc:0.487980 
[29]	train-mcc:0.000000	test-mcc:0.489524 
[30]	train-mcc:0.000000	test-mcc:0.489239 
[31]	train-mcc:0.000000	test-mcc:0.488896 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.491067


Time: Thu Nov 10 2016 07:31:15 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.4910669
Confusion matrix:
     truth
preds      0      1
    0 235208    920
    1    166    456
     truth
preds            0            1
    0 0.9934868004 0.0038859556
    1 0.0007011616 0.0019260824
Iteration 13 (base=0.261821): MCC=0.4910669 | threshold=0.253133


===




Iteration 14[1] on Thu Nov 10 2016 07:31:41 AM

depth=12, min_child_weight=6.914099, subsample=0.9370011, colsample_bytree=0.5, base_score=0.1067563
[1]	train-mcc:0.000000	test-mcc:0.469978 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476786 
[3]	train-mcc:0.000000	test-mcc:0.475757 
[4]	train-mcc:0.000000	test-mcc:0.473348 
[5]	train-mcc:0.000000	test-mcc:0.476421 
[6]	train-mcc:0.000000	test-mcc:0.473795 
[7]	train-mcc:0.000000	test-mcc:0.475081 
[8]	train-mcc:0.000000	test-mcc:0.474755 
[9]	train-mcc:0.000000	test-mcc:0.472093 
[10]	train-mcc:0.000000	test-mcc:0.471161 
[11]	train-mcc:0.000000	test-mcc:0.471822 
[12]	train-mcc:0.000000	test-mcc:0.473647 
[13]	train-mcc:0.000000	test-mcc:0.472482 
[14]	train-mcc:0.000000	test-mcc:0.473483 
[15]	train-mcc:0.000000	test-mcc:0.472441 
[16]	train-mcc:0.000000	test-mcc:0.472595 
[17]	train-mcc:0.000000	test-mcc:0.473777 
[18]	train-mcc:0.000000	test-mcc:0.472732 
[19]	train-mcc:0.000000	test-mcc:0.474213 
[20]	train-mcc:0.000000	test-mcc:0.473088 
[21]	train-mcc:0.000000	test-mcc:0.473298 
[22]	train-mcc:0.000000	test-mcc:0.473965 
[23]	train-mcc:0.000000	test-mcc:0.473965 
[24]	train-mcc:0.000000	test-mcc:0.474885 
[25]	train-mcc:0.000000	test-mcc:0.474885 
[26]	train-mcc:0.000000	test-mcc:0.474885 
[27]	train-mcc:0.000000	test-mcc:0.475622 
[28]	train-mcc:0.000000	test-mcc:0.475622 
[29]	train-mcc:0.000000	test-mcc:0.476134 
[30]	train-mcc:0.000000	test-mcc:0.475622 
[31]	train-mcc:0.000000	test-mcc:0.475063 
[32]	train-mcc:0.000000	test-mcc:0.474998 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.476786


Time: Thu Nov 10 2016 07:33:22 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.476786
Confusion matrix:
     truth
preds      0      1
    0 235309   1006
    1     64    369
     truth
preds            0            1
    0 0.9939218072 0.0042492439
    1 0.0002703296 0.0015586193
Iteration 14 (base=0.1067563): MCC=0.476786 | threshold=0.3265005



Iteration 14[2] on Thu Nov 10 2016 07:33:24 AM

depth=12, min_child_weight=6.914099, subsample=0.9370011, colsample_bytree=0.5, base_score=0.1067563
[1]	train-mcc:0.000000	test-mcc:0.471408 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472158 
[3]	train-mcc:0.000000	test-mcc:0.476630 
[4]	train-mcc:0.000000	test-mcc:0.478061 
[5]	train-mcc:0.000000	test-mcc:0.476331 
[6]	train-mcc:0.000000	test-mcc:0.477909 
[7]	train-mcc:0.000000	test-mcc:0.477020 
[8]	train-mcc:0.000000	test-mcc:0.479589 
[9]	train-mcc:0.000000	test-mcc:0.478230 
[10]	train-mcc:0.000000	test-mcc:0.478471 
[11]	train-mcc:0.000000	test-mcc:0.477992 
[12]	train-mcc:0.000000	test-mcc:0.478828 
[13]	train-mcc:0.000000	test-mcc:0.477497 
[14]	train-mcc:0.000000	test-mcc:0.478331 
[15]	train-mcc:0.000000	test-mcc:0.480161 
[16]	train-mcc:0.000000	test-mcc:0.478660 
[17]	train-mcc:0.000000	test-mcc:0.479683 
[18]	train-mcc:0.000000	test-mcc:0.479479 
[19]	train-mcc:0.000000	test-mcc:0.481059 
[20]	train-mcc:0.000000	test-mcc:0.482607 
[21]	train-mcc:0.000000	test-mcc:0.481468 
[22]	train-mcc:0.000000	test-mcc:0.480728 
[23]	train-mcc:0.000000	test-mcc:0.480728 
[24]	train-mcc:0.000000	test-mcc:0.479988 
[25]	train-mcc:0.000000	test-mcc:0.481962 
[26]	train-mcc:0.000000	test-mcc:0.478765 
[27]	train-mcc:0.000000	test-mcc:0.478518 
[28]	train-mcc:0.000000	test-mcc:0.478518 
[29]	train-mcc:0.000000	test-mcc:0.477769 
[30]	train-mcc:0.000000	test-mcc:0.477769 
[31]	train-mcc:0.000000	test-mcc:0.476296 
[32]	train-mcc:0.000000	test-mcc:0.476563 
[33]	train-mcc:0.000000	test-mcc:0.477769 
[34]	train-mcc:0.000000	test-mcc:0.477769 
[35]	train-mcc:0.000000	test-mcc:0.477942 
[36]	train-mcc:0.000000	test-mcc:0.477965 
[37]	train-mcc:0.000000	test-mcc:0.476329 
[38]	train-mcc:0.000000	test-mcc:0.476329 
[39]	train-mcc:0.000000	test-mcc:0.477081 
[40]	train-mcc:0.000000	test-mcc:0.476842 
[41]	train-mcc:0.000000	test-mcc:0.477760 
[42]	train-mcc:0.000000	test-mcc:0.478061 
[43]	train-mcc:0.000000	test-mcc:0.478061 
[44]	train-mcc:0.000000	test-mcc:0.478662 
[45]	train-mcc:0.000000	test-mcc:0.478662 
[46]	train-mcc:0.000000	test-mcc:0.478662 
[47]	train-mcc:0.000000	test-mcc:0.479033 
[48]	train-mcc:0.000000	test-mcc:0.479261 
[49]	train-mcc:0.000000	test-mcc:0.479212 
[50]	train-mcc:0.000000	test-mcc:0.479773 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.482607


Time: Thu Nov 10 2016 07:35:46 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.482607
Confusion matrix:
     truth
preds      0      1
    0 235317   1005
    1     56    371
     truth
preds            0            1
    0 0.9939514000 0.0042450021
    1 0.0002365374 0.0015670605
Iteration 14 (base=0.1067563): MCC=0.482607 | threshold=0.5517997



Iteration 14[3] on Thu Nov 10 2016 07:35:48 AM

depth=12, min_child_weight=6.914099, subsample=0.9370011, colsample_bytree=0.5, base_score=0.1067563
[1]	train-mcc:0.000000	test-mcc:0.485455 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487743 
[3]	train-mcc:0.000000	test-mcc:0.491358 
[4]	train-mcc:0.000000	test-mcc:0.492850 
[5]	train-mcc:0.000000	test-mcc:0.491041 
[6]	train-mcc:0.000000	test-mcc:0.495206 
[7]	train-mcc:0.000000	test-mcc:0.495121 
[8]	train-mcc:0.000000	test-mcc:0.496148 
[9]	train-mcc:0.000000	test-mcc:0.494659 
[10]	train-mcc:0.000000	test-mcc:0.497952 
[11]	train-mcc:0.000000	test-mcc:0.499100 
[12]	train-mcc:0.000000	test-mcc:0.496148 
[13]	train-mcc:0.000000	test-mcc:0.489549 
[14]	train-mcc:0.000000	test-mcc:0.490441 
[15]	train-mcc:0.000000	test-mcc:0.490684 
[16]	train-mcc:0.000000	test-mcc:0.490438 
[17]	train-mcc:0.000000	test-mcc:0.491918 
[18]	train-mcc:0.000000	test-mcc:0.489338 
[19]	train-mcc:0.000000	test-mcc:0.491828 
[20]	train-mcc:0.000000	test-mcc:0.490889 
[21]	train-mcc:0.000000	test-mcc:0.489973 
[22]	train-mcc:0.000000	test-mcc:0.489519 
[23]	train-mcc:0.000000	test-mcc:0.490006 
[24]	train-mcc:0.000000	test-mcc:0.490006 
[25]	train-mcc:0.000000	test-mcc:0.490893 
[26]	train-mcc:0.000000	test-mcc:0.490893 
[27]	train-mcc:0.000000	test-mcc:0.491359 
[28]	train-mcc:0.000000	test-mcc:0.491359 
[29]	train-mcc:0.000000	test-mcc:0.492189 
[30]	train-mcc:0.000000	test-mcc:0.492189 
[31]	train-mcc:0.000000	test-mcc:0.492900 
[32]	train-mcc:0.000000	test-mcc:0.492900 
[33]	train-mcc:0.000000	test-mcc:0.492786 
[34]	train-mcc:0.000000	test-mcc:0.492309 
[35]	train-mcc:0.000000	test-mcc:0.491833 
[36]	train-mcc:0.000000	test-mcc:0.491833 
[37]	train-mcc:0.000000	test-mcc:0.492363 
[38]	train-mcc:0.000000	test-mcc:0.492363 
[39]	train-mcc:0.000000	test-mcc:0.491653 
[40]	train-mcc:0.000000	test-mcc:0.490110 
[41]	train-mcc:0.000000	test-mcc:0.489117 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.499100


Time: Thu Nov 10 2016 07:37:39 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4991002
Confusion matrix:
     truth
preds      0      1
    0 235256    938
    1    118    438
     truth
preds            0            1
    0 0.9936895459 0.0039619852
    1 0.0004984161 0.0018500528
Iteration 14 (base=0.1067563): MCC=0.4991002 | threshold=0.3638477



Iteration 14[4] on Thu Nov 10 2016 07:37:40 AM

depth=12, min_child_weight=6.914099, subsample=0.9370011, colsample_bytree=0.5, base_score=0.1067563
[1]	train-mcc:0.000000	test-mcc:0.476411 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476518 
[3]	train-mcc:0.000000	test-mcc:0.473271 
[4]	train-mcc:0.000000	test-mcc:0.476271 
[5]	train-mcc:0.000000	test-mcc:0.473147 
[6]	train-mcc:0.000000	test-mcc:0.475622 
[7]	train-mcc:0.000000	test-mcc:0.479292 
[8]	train-mcc:0.000000	test-mcc:0.477249 
[9]	train-mcc:0.000000	test-mcc:0.475460 
[10]	train-mcc:0.000000	test-mcc:0.475517 
[11]	train-mcc:0.000000	test-mcc:0.474770 
[12]	train-mcc:0.000000	test-mcc:0.474096 
[13]	train-mcc:0.000000	test-mcc:0.476018 
[14]	train-mcc:0.000000	test-mcc:0.476421 
[15]	train-mcc:0.000000	test-mcc:0.476828 
[16]	train-mcc:0.000000	test-mcc:0.476828 
[17]	train-mcc:0.000000	test-mcc:0.476647 
[18]	train-mcc:0.000000	test-mcc:0.476731 
[19]	train-mcc:0.000000	test-mcc:0.475982 
[20]	train-mcc:0.000000	test-mcc:0.476726 
[21]	train-mcc:0.000000	test-mcc:0.474845 
[22]	train-mcc:0.000000	test-mcc:0.474429 
[23]	train-mcc:0.000000	test-mcc:0.476769 
[24]	train-mcc:0.000000	test-mcc:0.476408 
[25]	train-mcc:0.000000	test-mcc:0.476588 
[26]	train-mcc:0.000000	test-mcc:0.476923 
[27]	train-mcc:0.000000	test-mcc:0.476462 
[28]	train-mcc:0.000000	test-mcc:0.476923 
[29]	train-mcc:0.000000	test-mcc:0.476855 
[30]	train-mcc:0.000000	test-mcc:0.477289 
[31]	train-mcc:0.000000	test-mcc:0.476126 
[32]	train-mcc:0.000000	test-mcc:0.474955 
[33]	train-mcc:0.000000	test-mcc:0.475276 
[34]	train-mcc:0.000000	test-mcc:0.475276 
[35]	train-mcc:0.000000	test-mcc:0.475276 
[36]	train-mcc:0.000000	test-mcc:0.475276 
[37]	train-mcc:0.000000	test-mcc:0.474827 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.479292


Time: Thu Nov 10 2016 07:39:23 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4792918
Confusion matrix:
     truth
preds      0      1
    0 235183    923
    1    191    453
     truth
preds            0            1
    0 0.9933812038 0.0038986272
    1 0.0008067582 0.0019134108
Iteration 14 (base=0.1067563): MCC=0.4792918 | threshold=0.2731482



Iteration 14[5] on Thu Nov 10 2016 07:39:24 AM

depth=12, min_child_weight=6.914099, subsample=0.9370011, colsample_bytree=0.5, base_score=0.1067563
[1]	train-mcc:0.000000	test-mcc:0.477506 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481090 
[3]	train-mcc:0.000000	test-mcc:0.480413 
[4]	train-mcc:0.000000	test-mcc:0.482876 
[5]	train-mcc:0.000000	test-mcc:0.479785 
[6]	train-mcc:0.000000	test-mcc:0.482834 
[7]	train-mcc:0.000000	test-mcc:0.485943 
[8]	train-mcc:0.000000	test-mcc:0.485226 
[9]	train-mcc:0.000000	test-mcc:0.487744 
[10]	train-mcc:0.000000	test-mcc:0.487527 
[11]	train-mcc:0.000000	test-mcc:0.485805 
[12]	train-mcc:0.000000	test-mcc:0.487311 
[13]	train-mcc:0.000000	test-mcc:0.486808 
[14]	train-mcc:0.000000	test-mcc:0.484362 
[15]	train-mcc:0.000000	test-mcc:0.481605 
[16]	train-mcc:0.000000	test-mcc:0.482145 
[17]	train-mcc:0.000000	test-mcc:0.484809 
[18]	train-mcc:0.000000	test-mcc:0.482471 
[19]	train-mcc:0.000000	test-mcc:0.482693 
[20]	train-mcc:0.000000	test-mcc:0.480514 
[21]	train-mcc:0.000000	test-mcc:0.480514 
[22]	train-mcc:0.000000	test-mcc:0.479738 
[23]	train-mcc:0.000000	test-mcc:0.479701 
[24]	train-mcc:0.000000	test-mcc:0.479701 
[25]	train-mcc:0.000000	test-mcc:0.480011 
[26]	train-mcc:0.000000	test-mcc:0.480121 
[27]	train-mcc:0.000000	test-mcc:0.480318 
[28]	train-mcc:0.000000	test-mcc:0.481304 
[29]	train-mcc:0.000000	test-mcc:0.483483 
[30]	train-mcc:0.000000	test-mcc:0.482693 
[31]	train-mcc:0.000000	test-mcc:0.482693 
[32]	train-mcc:0.000000	test-mcc:0.482693 
[33]	train-mcc:0.000000	test-mcc:0.482693 
[34]	train-mcc:0.000000	test-mcc:0.481967 
[35]	train-mcc:0.000000	test-mcc:0.481967 
[36]	train-mcc:0.000000	test-mcc:0.481967 
[37]	train-mcc:0.000000	test-mcc:0.481967 
[38]	train-mcc:0.000000	test-mcc:0.482471 
[39]	train-mcc:0.000000	test-mcc:0.482471 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.487744


Time: Thu Nov 10 2016 07:41:21 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.487744
Confusion matrix:
     truth
preds      0      1
    0 235284    973
    1     90    403
     truth
preds            0            1
    0 0.9938078141 0.0041098205
    1 0.0003801478 0.0017022175
Iteration 14 (base=0.1067563): MCC=0.487744 | threshold=0.3911227


===




Iteration 15[1] on Thu Nov 10 2016 07:41:49 AM

depth=12, min_child_weight=16.71972, subsample=0.9692056, colsample_bytree=0.5, base_score=0.4613082
[1]	train-mcc:0.000000	test-mcc:0.463201 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477789 
[3]	train-mcc:0.000000	test-mcc:0.476589 
[4]	train-mcc:0.000000	test-mcc:0.479585 
[5]	train-mcc:0.000000	test-mcc:0.478272 
[6]	train-mcc:0.000000	test-mcc:0.479489 
[7]	train-mcc:0.000000	test-mcc:0.478418 
[8]	train-mcc:0.000000	test-mcc:0.478745 
[9]	train-mcc:0.000000	test-mcc:0.477093 
[10]	train-mcc:0.000000	test-mcc:0.476820 
[11]	train-mcc:0.000000	test-mcc:0.478117 
[12]	train-mcc:0.000000	test-mcc:0.476233 
[13]	train-mcc:0.000000	test-mcc:0.476972 
[14]	train-mcc:0.000000	test-mcc:0.479029 
[15]	train-mcc:0.000000	test-mcc:0.477668 
[16]	train-mcc:0.000000	test-mcc:0.478932 
[17]	train-mcc:0.000000	test-mcc:0.479070 
[18]	train-mcc:0.000000	test-mcc:0.478631 
[19]	train-mcc:0.000000	test-mcc:0.478159 
[20]	train-mcc:0.000000	test-mcc:0.477433 
[21]	train-mcc:0.000000	test-mcc:0.478885 
[22]	train-mcc:0.000000	test-mcc:0.478406 
[23]	train-mcc:0.000000	test-mcc:0.477875 
[24]	train-mcc:0.000000	test-mcc:0.478337 
[25]	train-mcc:0.000000	test-mcc:0.477915 
[26]	train-mcc:0.000000	test-mcc:0.477189 
[27]	train-mcc:0.000000	test-mcc:0.478659 
[28]	train-mcc:0.000000	test-mcc:0.477439 
[29]	train-mcc:0.000000	test-mcc:0.478399 
[30]	train-mcc:0.000000	test-mcc:0.477915 
[31]	train-mcc:0.000000	test-mcc:0.476944 
[32]	train-mcc:0.000000	test-mcc:0.477743 
[33]	train-mcc:0.000000	test-mcc:0.476889 
[34]	train-mcc:0.000000	test-mcc:0.476874 
Stopping. Best iteration:
[4]	train-mcc:0.000000	test-mcc:0.479585


Time: Thu Nov 10 2016 07:43:34 AM
For 0004 rounds: train_mcc: 0 - test_mcc: 0.4795846
Confusion matrix:
     truth
preds      0      1
    0 235328   1017
    1     45    358
     truth
preds            0            1
    0 0.9940020613 0.0042957068
    1 0.0001900755 0.0015121564
Iteration 15 (base=0.4613082): MCC=0.4795846 | threshold=0.5553769



Iteration 15[2] on Thu Nov 10 2016 07:43:35 AM

depth=12, min_child_weight=16.71972, subsample=0.9692056, colsample_bytree=0.5, base_score=0.4613082
[1]	train-mcc:0.000000	test-mcc:0.461307 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.464872 
[3]	train-mcc:0.000000	test-mcc:0.472357 
[4]	train-mcc:0.000000	test-mcc:0.475295 
[5]	train-mcc:0.000000	test-mcc:0.473712 
[6]	train-mcc:0.000000	test-mcc:0.474810 
[7]	train-mcc:0.000000	test-mcc:0.474102 
[8]	train-mcc:0.000000	test-mcc:0.473092 
[9]	train-mcc:0.000000	test-mcc:0.473747 
[10]	train-mcc:0.000000	test-mcc:0.473634 
[11]	train-mcc:0.000000	test-mcc:0.477798 
[12]	train-mcc:0.000000	test-mcc:0.476876 
[13]	train-mcc:0.000000	test-mcc:0.478456 
[14]	train-mcc:0.000000	test-mcc:0.477369 
[15]	train-mcc:0.000000	test-mcc:0.478239 
[16]	train-mcc:0.000000	test-mcc:0.478210 
[17]	train-mcc:0.000000	test-mcc:0.476165 
[18]	train-mcc:0.000000	test-mcc:0.477079 
[19]	train-mcc:0.000000	test-mcc:0.477266 
[20]	train-mcc:0.000000	test-mcc:0.478397 
[21]	train-mcc:0.000000	test-mcc:0.481171 
[22]	train-mcc:0.000000	test-mcc:0.479038 
[23]	train-mcc:0.000000	test-mcc:0.478599 
[24]	train-mcc:0.000000	test-mcc:0.478496 
[25]	train-mcc:0.000000	test-mcc:0.478746 
[26]	train-mcc:0.000000	test-mcc:0.479044 
[27]	train-mcc:0.000000	test-mcc:0.480367 
[28]	train-mcc:0.000000	test-mcc:0.480367 
[29]	train-mcc:0.000000	test-mcc:0.479631 
[30]	train-mcc:0.000000	test-mcc:0.478894 
[31]	train-mcc:0.000000	test-mcc:0.478330 
[32]	train-mcc:0.000000	test-mcc:0.479240 
[33]	train-mcc:0.000000	test-mcc:0.477984 
[34]	train-mcc:0.000000	test-mcc:0.478469 
[35]	train-mcc:0.000000	test-mcc:0.479342 
[36]	train-mcc:0.000000	test-mcc:0.481364 
[37]	train-mcc:0.000000	test-mcc:0.480897 
[38]	train-mcc:0.000000	test-mcc:0.480264 
[39]	train-mcc:0.000000	test-mcc:0.480727 
[40]	train-mcc:0.000000	test-mcc:0.480474 
[41]	train-mcc:0.000000	test-mcc:0.479704 
[42]	train-mcc:0.000000	test-mcc:0.479704 
[43]	train-mcc:0.000000	test-mcc:0.479704 
[44]	train-mcc:0.000000	test-mcc:0.479195 
[45]	train-mcc:0.000000	test-mcc:0.478281 
[46]	train-mcc:0.000000	test-mcc:0.479010 
[47]	train-mcc:0.000000	test-mcc:0.479738 
[48]	train-mcc:0.000000	test-mcc:0.479240 
[49]	train-mcc:0.000000	test-mcc:0.480318 
[50]	train-mcc:0.000000	test-mcc:0.480465 
[51]	train-mcc:0.000000	test-mcc:0.480382 
[52]	train-mcc:0.000000	test-mcc:0.480121 
[53]	train-mcc:0.000000	test-mcc:0.480577 
[54]	train-mcc:0.000000	test-mcc:0.479968 
[55]	train-mcc:0.000000	test-mcc:0.479968 
[56]	train-mcc:0.000000	test-mcc:0.480694 
[57]	train-mcc:0.000000	test-mcc:0.481155 
[58]	train-mcc:0.000000	test-mcc:0.480688 
[59]	train-mcc:0.000000	test-mcc:0.479919 
[60]	train-mcc:0.000000	test-mcc:0.479199 
[61]	train-mcc:0.000000	test-mcc:0.478970 
[62]	train-mcc:0.000000	test-mcc:0.478493 
[63]	train-mcc:0.000000	test-mcc:0.477779 
[64]	train-mcc:0.000000	test-mcc:0.477779 
[65]	train-mcc:0.000000	test-mcc:0.477337 
[66]	train-mcc:0.000000	test-mcc:0.476880 
Stopping. Best iteration:
[36]	train-mcc:0.000000	test-mcc:0.481364


Time: Thu Nov 10 2016 07:46:43 AM
For 0036 rounds: train_mcc: 0 - test_mcc: 0.4813642
Confusion matrix:
     truth
preds      0      1
    0 235267    971
    1    106    405
     truth
preds            0            1
    0 0.9937402059 0.0041013901
    1 0.0004477316 0.0017106725
Iteration 15 (base=0.4613082): MCC=0.4813642 | threshold=0.4389128



Iteration 15[3] on Thu Nov 10 2016 07:46:44 AM

depth=12, min_child_weight=16.71972, subsample=0.9692056, colsample_bytree=0.5, base_score=0.4613082
[1]	train-mcc:0.000000	test-mcc:0.475344 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482373 
[3]	train-mcc:0.000000	test-mcc:0.482801 
[4]	train-mcc:0.000000	test-mcc:0.486940 
[5]	train-mcc:0.000000	test-mcc:0.492392 
[6]	train-mcc:0.000000	test-mcc:0.489551 
[7]	train-mcc:0.000000	test-mcc:0.490495 
[8]	train-mcc:0.000000	test-mcc:0.490431 
[9]	train-mcc:0.000000	test-mcc:0.493118 
[10]	train-mcc:0.000000	test-mcc:0.493345 
[11]	train-mcc:0.000000	test-mcc:0.492433 
[12]	train-mcc:0.000000	test-mcc:0.492188 
[13]	train-mcc:0.000000	test-mcc:0.493543 
[14]	train-mcc:0.000000	test-mcc:0.490983 
[15]	train-mcc:0.000000	test-mcc:0.495768 
[16]	train-mcc:0.000000	test-mcc:0.495465 
[17]	train-mcc:0.000000	test-mcc:0.495169 
[18]	train-mcc:0.000000	test-mcc:0.494411 
[19]	train-mcc:0.000000	test-mcc:0.492212 
[20]	train-mcc:0.000000	test-mcc:0.493673 
[21]	train-mcc:0.000000	test-mcc:0.492682 
[22]	train-mcc:0.000000	test-mcc:0.498161 
[23]	train-mcc:0.000000	test-mcc:0.497743 
[24]	train-mcc:0.000000	test-mcc:0.496525 
[25]	train-mcc:0.000000	test-mcc:0.496486 
[26]	train-mcc:0.000000	test-mcc:0.496057 
[27]	train-mcc:0.000000	test-mcc:0.496057 
[28]	train-mcc:0.000000	test-mcc:0.494851 
[29]	train-mcc:0.000000	test-mcc:0.496079 
[30]	train-mcc:0.000000	test-mcc:0.495955 
[31]	train-mcc:0.000000	test-mcc:0.496319 
[32]	train-mcc:0.000000	test-mcc:0.495955 
[33]	train-mcc:0.000000	test-mcc:0.495268 
[34]	train-mcc:0.000000	test-mcc:0.494261 
[35]	train-mcc:0.000000	test-mcc:0.494924 
[36]	train-mcc:0.000000	test-mcc:0.494924 
[37]	train-mcc:0.000000	test-mcc:0.495937 
[38]	train-mcc:0.000000	test-mcc:0.495526 
[39]	train-mcc:0.000000	test-mcc:0.494502 
[40]	train-mcc:0.000000	test-mcc:0.494617 
[41]	train-mcc:0.000000	test-mcc:0.494617 
[42]	train-mcc:0.000000	test-mcc:0.494194 
[43]	train-mcc:0.000000	test-mcc:0.493238 
[44]	train-mcc:0.000000	test-mcc:0.493640 
[45]	train-mcc:0.000000	test-mcc:0.493640 
[46]	train-mcc:0.000000	test-mcc:0.494311 
[47]	train-mcc:0.000000	test-mcc:0.493622 
[48]	train-mcc:0.000000	test-mcc:0.494311 
[49]	train-mcc:0.000000	test-mcc:0.493622 
[50]	train-mcc:0.000000	test-mcc:0.494431 
[51]	train-mcc:0.000000	test-mcc:0.494999 
[52]	train-mcc:0.000000	test-mcc:0.494311 
Stopping. Best iteration:
[22]	train-mcc:0.000000	test-mcc:0.498161


Time: Thu Nov 10 2016 07:48:56 AM
For 0022 rounds: train_mcc: 0 - test_mcc: 0.4981613
Confusion matrix:
     truth
preds      0      1
    0 235227    921
    1    147    455
     truth
preds            0            1
    0 0.9935670539 0.0038901795
    1 0.0006209081 0.0019218585
Iteration 15 (base=0.4613082): MCC=0.4981613 | threshold=0.3566301



Iteration 15[4] on Thu Nov 10 2016 07:48:57 AM

depth=12, min_child_weight=16.71972, subsample=0.9692056, colsample_bytree=0.5, base_score=0.4613082
[1]	train-mcc:0.000000	test-mcc:0.481435 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480474 
[3]	train-mcc:0.000000	test-mcc:0.481599 
[4]	train-mcc:0.000000	test-mcc:0.478701 
[5]	train-mcc:0.000000	test-mcc:0.479699 
[6]	train-mcc:0.000000	test-mcc:0.482339 
[7]	train-mcc:0.000000	test-mcc:0.484477 
[8]	train-mcc:0.000000	test-mcc:0.481836 
[9]	train-mcc:0.000000	test-mcc:0.479391 
[10]	train-mcc:0.000000	test-mcc:0.482479 
[11]	train-mcc:0.000000	test-mcc:0.480825 
[12]	train-mcc:0.000000	test-mcc:0.480897 
[13]	train-mcc:0.000000	test-mcc:0.480924 
[14]	train-mcc:0.000000	test-mcc:0.480694 
[15]	train-mcc:0.000000	test-mcc:0.480924 
[16]	train-mcc:0.000000	test-mcc:0.482145 
[17]	train-mcc:0.000000	test-mcc:0.482657 
[18]	train-mcc:0.000000	test-mcc:0.482333 
[19]	train-mcc:0.000000	test-mcc:0.480776 
[20]	train-mcc:0.000000	test-mcc:0.479531 
[21]	train-mcc:0.000000	test-mcc:0.479404 
[22]	train-mcc:0.000000	test-mcc:0.479802 
[23]	train-mcc:0.000000	test-mcc:0.479649 
[24]	train-mcc:0.000000	test-mcc:0.480272 
[25]	train-mcc:0.000000	test-mcc:0.482589 
[26]	train-mcc:0.000000	test-mcc:0.479391 
[27]	train-mcc:0.000000	test-mcc:0.479424 
[28]	train-mcc:0.000000	test-mcc:0.477782 
[29]	train-mcc:0.000000	test-mcc:0.477782 
[30]	train-mcc:0.000000	test-mcc:0.478165 
[31]	train-mcc:0.000000	test-mcc:0.477285 
[32]	train-mcc:0.000000	test-mcc:0.478015 
[33]	train-mcc:0.000000	test-mcc:0.478512 
[34]	train-mcc:0.000000	test-mcc:0.478512 
[35]	train-mcc:0.000000	test-mcc:0.478512 
[36]	train-mcc:0.000000	test-mcc:0.478045 
[37]	train-mcc:0.000000	test-mcc:0.480035 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.484477


Time: Thu Nov 10 2016 07:50:40 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4844771
Confusion matrix:
     truth
preds      0      1
    0 235184    916
    1    190    460
     truth
preds            0            1
    0 0.9933854277 0.0038690602
    1 0.0008025343 0.0019429778
Iteration 15 (base=0.4613082): MCC=0.4844771 | threshold=0.3438127



Iteration 15[5] on Thu Nov 10 2016 07:50:41 AM

depth=12, min_child_weight=16.71972, subsample=0.9692056, colsample_bytree=0.5, base_score=0.4613082
[1]	train-mcc:0.000000	test-mcc:0.476277 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480888 
[3]	train-mcc:0.000000	test-mcc:0.481657 
[4]	train-mcc:0.000000	test-mcc:0.480741 
[5]	train-mcc:0.000000	test-mcc:0.482816 
[6]	train-mcc:0.000000	test-mcc:0.487076 
[7]	train-mcc:0.000000	test-mcc:0.487962 
[8]	train-mcc:0.000000	test-mcc:0.488900 
[9]	train-mcc:0.000000	test-mcc:0.489352 
[10]	train-mcc:0.000000	test-mcc:0.487895 
[11]	train-mcc:0.000000	test-mcc:0.488812 
[12]	train-mcc:0.000000	test-mcc:0.486650 
[13]	train-mcc:0.000000	test-mcc:0.488324 
[14]	train-mcc:0.000000	test-mcc:0.488065 
[15]	train-mcc:0.000000	test-mcc:0.485463 
[16]	train-mcc:0.000000	test-mcc:0.486011 
[17]	train-mcc:0.000000	test-mcc:0.486119 
[18]	train-mcc:0.000000	test-mcc:0.486916 
[19]	train-mcc:0.000000	test-mcc:0.489153 
[20]	train-mcc:0.000000	test-mcc:0.488900 
[21]	train-mcc:0.000000	test-mcc:0.488754 
[22]	train-mcc:0.000000	test-mcc:0.487807 
[23]	train-mcc:0.000000	test-mcc:0.488927 
[24]	train-mcc:0.000000	test-mcc:0.489026 
[25]	train-mcc:0.000000	test-mcc:0.487177 
[26]	train-mcc:0.000000	test-mcc:0.488843 
[27]	train-mcc:0.000000	test-mcc:0.489916 
[28]	train-mcc:0.000000	test-mcc:0.489728 
[29]	train-mcc:0.000000	test-mcc:0.489365 
[30]	train-mcc:0.000000	test-mcc:0.490429 
[31]	train-mcc:0.000000	test-mcc:0.490429 
[32]	train-mcc:0.000000	test-mcc:0.490504 
[33]	train-mcc:0.000000	test-mcc:0.489190 
[34]	train-mcc:0.000000	test-mcc:0.487895 
[35]	train-mcc:0.000000	test-mcc:0.488504 
[36]	train-mcc:0.000000	test-mcc:0.488925 
[37]	train-mcc:0.000000	test-mcc:0.489230 
[38]	train-mcc:0.000000	test-mcc:0.488643 
[39]	train-mcc:0.000000	test-mcc:0.489474 
[40]	train-mcc:0.000000	test-mcc:0.489721 
[41]	train-mcc:0.000000	test-mcc:0.489721 
[42]	train-mcc:0.000000	test-mcc:0.488529 
[43]	train-mcc:0.000000	test-mcc:0.487807 
[44]	train-mcc:0.000000	test-mcc:0.488566 
[45]	train-mcc:0.000000	test-mcc:0.488511 
[46]	train-mcc:0.000000	test-mcc:0.488065 
[47]	train-mcc:0.000000	test-mcc:0.487438 
[48]	train-mcc:0.000000	test-mcc:0.488783 
[49]	train-mcc:0.000000	test-mcc:0.488075 
[50]	train-mcc:0.000000	test-mcc:0.487149 
[51]	train-mcc:0.000000	test-mcc:0.487396 
[52]	train-mcc:0.000000	test-mcc:0.487190 
[53]	train-mcc:0.000000	test-mcc:0.487190 
[54]	train-mcc:0.000000	test-mcc:0.486696 
[55]	train-mcc:0.000000	test-mcc:0.487685 
[56]	train-mcc:0.000000	test-mcc:0.487414 
[57]	train-mcc:0.000000	test-mcc:0.487694 
[58]	train-mcc:0.000000	test-mcc:0.487694 
[59]	train-mcc:0.000000	test-mcc:0.487097 
[60]	train-mcc:0.000000	test-mcc:0.486460 
[61]	train-mcc:0.000000	test-mcc:0.486460 
[62]	train-mcc:0.000000	test-mcc:0.488112 
Stopping. Best iteration:
[32]	train-mcc:0.000000	test-mcc:0.490504


Time: Thu Nov 10 2016 07:53:26 AM
For 0032 rounds: train_mcc: 0 - test_mcc: 0.4905038
Confusion matrix:
     truth
preds      0      1
    0 235243    942
    1    131    434
     truth
preds            0            1
    0 0.9936346357 0.0039788807
    1 0.0005533263 0.0018331573
Iteration 15 (base=0.4613082): MCC=0.4905038 | threshold=0.3768119


===




Iteration 16[1] on Thu Nov 10 2016 07:53:54 AM

depth=5, min_child_weight=47.13102, subsample=0.864567, colsample_bytree=1, base_score=0.1109651
[1]	train-mcc:0.000000	test-mcc:0.459623 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471546 
[3]	train-mcc:0.000000	test-mcc:0.483964 
[4]	train-mcc:0.000000	test-mcc:0.479575 
[5]	train-mcc:0.000000	test-mcc:0.483447 
[6]	train-mcc:0.000000	test-mcc:0.483150 
[7]	train-mcc:0.000000	test-mcc:0.480887 
[8]	train-mcc:0.000000	test-mcc:0.480655 
[9]	train-mcc:0.000000	test-mcc:0.481878 
[10]	train-mcc:0.000000	test-mcc:0.479914 
[11]	train-mcc:0.000000	test-mcc:0.481564 
[12]	train-mcc:0.000000	test-mcc:0.480655 
[13]	train-mcc:0.000000	test-mcc:0.480047 
[14]	train-mcc:0.000000	test-mcc:0.482145 
[15]	train-mcc:0.000000	test-mcc:0.482281 
[16]	train-mcc:0.000000	test-mcc:0.481002 
[17]	train-mcc:0.000000	test-mcc:0.481748 
[18]	train-mcc:0.000000	test-mcc:0.481373 
[19]	train-mcc:0.000000	test-mcc:0.482000 
[20]	train-mcc:0.000000	test-mcc:0.480255 
[21]	train-mcc:0.000000	test-mcc:0.480874 
[22]	train-mcc:0.000000	test-mcc:0.481621 
[23]	train-mcc:0.000000	test-mcc:0.481002 
[24]	train-mcc:0.000000	test-mcc:0.481002 
[25]	train-mcc:0.000000	test-mcc:0.481002 
[26]	train-mcc:0.000000	test-mcc:0.481883 
[27]	train-mcc:0.000000	test-mcc:0.481878 
[28]	train-mcc:0.000000	test-mcc:0.481517 
[29]	train-mcc:0.000000	test-mcc:0.482119 
[30]	train-mcc:0.000000	test-mcc:0.482865 
[31]	train-mcc:0.000000	test-mcc:0.482366 
[32]	train-mcc:0.000000	test-mcc:0.482366 
[33]	train-mcc:0.000000	test-mcc:0.483000 
Stopping. Best iteration:
[3]	train-mcc:0.000000	test-mcc:0.483964


Time: Thu Nov 10 2016 07:55:10 AM
For 0003 rounds: train_mcc: 0 - test_mcc: 0.4839635
Confusion matrix:
     truth
preds      0      1
    0 235275    972
    1     98    403
     truth
preds            0            1
    0 0.9937781945 0.0041056313
    1 0.0004139423 0.0017022319
Iteration 16 (base=0.1109651): MCC=0.4839635 | threshold=0.3000269



Iteration 16[2] on Thu Nov 10 2016 07:55:11 AM

depth=5, min_child_weight=47.13102, subsample=0.864567, colsample_bytree=1, base_score=0.1109651
[1]	train-mcc:0.000000	test-mcc:0.471385 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477285 
[3]	train-mcc:0.000000	test-mcc:0.477258 
[4]	train-mcc:0.000000	test-mcc:0.478709 
[5]	train-mcc:0.000000	test-mcc:0.480908 
[6]	train-mcc:0.000000	test-mcc:0.480157 
[7]	train-mcc:0.000000	test-mcc:0.482111 
[8]	train-mcc:0.000000	test-mcc:0.482111 
[9]	train-mcc:0.000000	test-mcc:0.482343 
[10]	train-mcc:0.000000	test-mcc:0.482031 
[11]	train-mcc:0.000000	test-mcc:0.481621 
[12]	train-mcc:0.000000	test-mcc:0.483532 
[13]	train-mcc:0.000000	test-mcc:0.484506 
[14]	train-mcc:0.000000	test-mcc:0.482326 
[15]	train-mcc:0.000000	test-mcc:0.482589 
[16]	train-mcc:0.000000	test-mcc:0.481986 
[17]	train-mcc:0.000000	test-mcc:0.482720 
[18]	train-mcc:0.000000	test-mcc:0.482937 
[19]	train-mcc:0.000000	test-mcc:0.483828 
[20]	train-mcc:0.000000	test-mcc:0.483382 
[21]	train-mcc:0.000000	test-mcc:0.482373 
[22]	train-mcc:0.000000	test-mcc:0.482006 
[23]	train-mcc:0.000000	test-mcc:0.482251 
[24]	train-mcc:0.000000	test-mcc:0.482251 
[25]	train-mcc:0.000000	test-mcc:0.481241 
[26]	train-mcc:0.000000	test-mcc:0.481254 
[27]	train-mcc:0.000000	test-mcc:0.481254 
[28]	train-mcc:0.000000	test-mcc:0.481610 
[29]	train-mcc:0.000000	test-mcc:0.481423 
[30]	train-mcc:0.000000	test-mcc:0.480686 
[31]	train-mcc:0.000000	test-mcc:0.481085 
[32]	train-mcc:0.000000	test-mcc:0.481262 
[33]	train-mcc:0.000000	test-mcc:0.481992 
[34]	train-mcc:0.000000	test-mcc:0.483051 
[35]	train-mcc:0.000000	test-mcc:0.481640 
[36]	train-mcc:0.000000	test-mcc:0.482324 
[37]	train-mcc:0.000000	test-mcc:0.482103 
[38]	train-mcc:0.000000	test-mcc:0.482834 
[39]	train-mcc:0.000000	test-mcc:0.482834 
[40]	train-mcc:0.000000	test-mcc:0.482834 
[41]	train-mcc:0.000000	test-mcc:0.482834 
[42]	train-mcc:0.000000	test-mcc:0.484090 
[43]	train-mcc:0.000000	test-mcc:0.483836 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.484506


Time: Thu Nov 10 2016 07:56:44 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.484506
Confusion matrix:
     truth
preds      0      1
    0 235275    972
    1     98    404
     truth
preds            0            1
    0 0.9937739969 0.0041056140
    1 0.0004139405 0.0017064486
Iteration 16 (base=0.1109651): MCC=0.484506 | threshold=0.4130569



Iteration 16[3] on Thu Nov 10 2016 07:56:45 AM

depth=5, min_child_weight=47.13102, subsample=0.864567, colsample_bytree=1, base_score=0.1109651
[1]	train-mcc:0.000000	test-mcc:0.483177 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487604 
[3]	train-mcc:0.000000	test-mcc:0.490825 
[4]	train-mcc:0.000000	test-mcc:0.490983 
[5]	train-mcc:0.000000	test-mcc:0.490880 
[6]	train-mcc:0.000000	test-mcc:0.489199 
[7]	train-mcc:0.000000	test-mcc:0.490621 
[8]	train-mcc:0.000000	test-mcc:0.491048 
[9]	train-mcc:0.000000	test-mcc:0.491048 
[10]	train-mcc:0.000000	test-mcc:0.491008 
[11]	train-mcc:0.000000	test-mcc:0.491430 
[12]	train-mcc:0.000000	test-mcc:0.491325 
[13]	train-mcc:0.000000	test-mcc:0.493029 
[14]	train-mcc:0.000000	test-mcc:0.493292 
[15]	train-mcc:0.000000	test-mcc:0.493892 
[16]	train-mcc:0.000000	test-mcc:0.493460 
[17]	train-mcc:0.000000	test-mcc:0.493892 
[18]	train-mcc:0.000000	test-mcc:0.493722 
[19]	train-mcc:0.000000	test-mcc:0.493722 
[20]	train-mcc:0.000000	test-mcc:0.493292 
[21]	train-mcc:0.000000	test-mcc:0.492864 
[22]	train-mcc:0.000000	test-mcc:0.492761 
[23]	train-mcc:0.000000	test-mcc:0.493477 
[24]	train-mcc:0.000000	test-mcc:0.493864 
[25]	train-mcc:0.000000	test-mcc:0.493864 
[26]	train-mcc:0.000000	test-mcc:0.493345 
[27]	train-mcc:0.000000	test-mcc:0.494578 
[28]	train-mcc:0.000000	test-mcc:0.494773 
[29]	train-mcc:0.000000	test-mcc:0.494257 
[30]	train-mcc:0.000000	test-mcc:0.495037 
[31]	train-mcc:0.000000	test-mcc:0.494685 
[32]	train-mcc:0.000000	test-mcc:0.494869 
[33]	train-mcc:0.000000	test-mcc:0.495400 
[34]	train-mcc:0.000000	test-mcc:0.495054 
[35]	train-mcc:0.000000	test-mcc:0.495584 
[36]	train-mcc:0.000000	test-mcc:0.495933 
[37]	train-mcc:0.000000	test-mcc:0.496143 
[38]	train-mcc:0.000000	test-mcc:0.496668 
[39]	train-mcc:0.000000	test-mcc:0.495291 
[40]	train-mcc:0.000000	test-mcc:0.494460 
[41]	train-mcc:0.000000	test-mcc:0.494460 
[42]	train-mcc:0.000000	test-mcc:0.494346 
[43]	train-mcc:0.000000	test-mcc:0.493423 
[44]	train-mcc:0.000000	test-mcc:0.493423 
[45]	train-mcc:0.000000	test-mcc:0.493333 
[46]	train-mcc:0.000000	test-mcc:0.493603 
[47]	train-mcc:0.000000	test-mcc:0.493603 
[48]	train-mcc:0.000000	test-mcc:0.494330 
[49]	train-mcc:0.000000	test-mcc:0.494705 
[50]	train-mcc:0.000000	test-mcc:0.493986 
[51]	train-mcc:0.000000	test-mcc:0.493986 
[52]	train-mcc:0.000000	test-mcc:0.493423 
[53]	train-mcc:0.000000	test-mcc:0.492885 
[54]	train-mcc:0.000000	test-mcc:0.493423 
[55]	train-mcc:0.000000	test-mcc:0.493963 
[56]	train-mcc:0.000000	test-mcc:0.493785 
[57]	train-mcc:0.000000	test-mcc:0.493251 
[58]	train-mcc:0.000000	test-mcc:0.493251 
[59]	train-mcc:0.000000	test-mcc:0.492704 
[60]	train-mcc:0.000000	test-mcc:0.492171 
[61]	train-mcc:0.000000	test-mcc:0.491396 
[62]	train-mcc:0.000000	test-mcc:0.491191 
[63]	train-mcc:0.000000	test-mcc:0.491191 
[64]	train-mcc:0.000000	test-mcc:0.492207 
[65]	train-mcc:0.000000	test-mcc:0.491323 
[66]	train-mcc:0.000000	test-mcc:0.490110 
[67]	train-mcc:0.000000	test-mcc:0.490928 
[68]	train-mcc:0.000000	test-mcc:0.491482 
Stopping. Best iteration:
[38]	train-mcc:0.000000	test-mcc:0.496668


Time: Thu Nov 10 2016 07:59:02 AM
For 0038 rounds: train_mcc: 0 - test_mcc: 0.4966678
Confusion matrix:
     truth
preds      0      1
    0 235300    972
    1     74    404
     truth
preds           0           1
    0 0.993875396 0.004105597
    1 0.000312566 0.001706441
Iteration 16 (base=0.1109651): MCC=0.4966678 | threshold=0.4518722



Iteration 16[4] on Thu Nov 10 2016 07:59:03 AM

depth=5, min_child_weight=47.13102, subsample=0.864567, colsample_bytree=1, base_score=0.1109651
[1]	train-mcc:0.000000	test-mcc:0.473084 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483078 
[3]	train-mcc:0.000000	test-mcc:0.479399 
[4]	train-mcc:0.000000	test-mcc:0.482826 
[5]	train-mcc:0.000000	test-mcc:0.483860 
[6]	train-mcc:0.000000	test-mcc:0.484100 
[7]	train-mcc:0.000000	test-mcc:0.484137 
[8]	train-mcc:0.000000	test-mcc:0.483977 
[9]	train-mcc:0.000000	test-mcc:0.483952 
[10]	train-mcc:0.000000	test-mcc:0.483977 
[11]	train-mcc:0.000000	test-mcc:0.485487 
[12]	train-mcc:0.000000	test-mcc:0.485379 
[13]	train-mcc:0.000000	test-mcc:0.483654 
[14]	train-mcc:0.000000	test-mcc:0.484486 
[15]	train-mcc:0.000000	test-mcc:0.483520 
[16]	train-mcc:0.000000	test-mcc:0.482363 
[17]	train-mcc:0.000000	test-mcc:0.482381 
[18]	train-mcc:0.000000	test-mcc:0.481511 
[19]	train-mcc:0.000000	test-mcc:0.482893 
[20]	train-mcc:0.000000	test-mcc:0.483194 
[21]	train-mcc:0.000000	test-mcc:0.483107 
[22]	train-mcc:0.000000	test-mcc:0.483486 
[23]	train-mcc:0.000000	test-mcc:0.483486 
[24]	train-mcc:0.000000	test-mcc:0.483559 
[25]	train-mcc:0.000000	test-mcc:0.483027 
[26]	train-mcc:0.000000	test-mcc:0.482893 
[27]	train-mcc:0.000000	test-mcc:0.483496 
[28]	train-mcc:0.000000	test-mcc:0.483583 
[29]	train-mcc:0.000000	test-mcc:0.484184 
[30]	train-mcc:0.000000	test-mcc:0.484100 
[31]	train-mcc:0.000000	test-mcc:0.483715 
[32]	train-mcc:0.000000	test-mcc:0.482288 
[33]	train-mcc:0.000000	test-mcc:0.482807 
[34]	train-mcc:0.000000	test-mcc:0.482490 
[35]	train-mcc:0.000000	test-mcc:0.482893 
[36]	train-mcc:0.000000	test-mcc:0.483297 
[37]	train-mcc:0.000000	test-mcc:0.483297 
[38]	train-mcc:0.000000	test-mcc:0.482420 
[39]	train-mcc:0.000000	test-mcc:0.482807 
[40]	train-mcc:0.000000	test-mcc:0.482893 
[41]	train-mcc:0.000000	test-mcc:0.482034 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.485487


Time: Thu Nov 10 2016 08:00:21 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4854865
Confusion matrix:
     truth
preds      0      1
    0 235159    901
    1    215    475
     truth
preds            0            1
    0 0.9932798310 0.0038057022
    1 0.0009081309 0.0020063358
Iteration 16 (base=0.1109651): MCC=0.4854865 | threshold=0.2742507



Iteration 16[5] on Thu Nov 10 2016 08:00:23 AM

depth=5, min_child_weight=47.13102, subsample=0.864567, colsample_bytree=1, base_score=0.1109651
[1]	train-mcc:0.000000	test-mcc:0.484806 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487941 
[3]	train-mcc:0.000000	test-mcc:0.489407 
[4]	train-mcc:0.000000	test-mcc:0.488054 
[5]	train-mcc:0.000000	test-mcc:0.490104 
[6]	train-mcc:0.000000	test-mcc:0.491480 
[7]	train-mcc:0.000000	test-mcc:0.489604 
[8]	train-mcc:0.000000	test-mcc:0.490363 
[9]	train-mcc:0.000000	test-mcc:0.490227 
[10]	train-mcc:0.000000	test-mcc:0.491231 
[11]	train-mcc:0.000000	test-mcc:0.491128 
[12]	train-mcc:0.000000	test-mcc:0.491009 
[13]	train-mcc:0.000000	test-mcc:0.491261 
[14]	train-mcc:0.000000	test-mcc:0.491261 
[15]	train-mcc:0.000000	test-mcc:0.491914 
[16]	train-mcc:0.000000	test-mcc:0.491461 
[17]	train-mcc:0.000000	test-mcc:0.490759 
[18]	train-mcc:0.000000	test-mcc:0.490759 
[19]	train-mcc:0.000000	test-mcc:0.491146 
[20]	train-mcc:0.000000	test-mcc:0.490146 
[21]	train-mcc:0.000000	test-mcc:0.489960 
[22]	train-mcc:0.000000	test-mcc:0.490641 
[23]	train-mcc:0.000000	test-mcc:0.490684 
[24]	train-mcc:0.000000	test-mcc:0.490686 
[25]	train-mcc:0.000000	test-mcc:0.490686 
[26]	train-mcc:0.000000	test-mcc:0.491368 
[27]	train-mcc:0.000000	test-mcc:0.490429 
[28]	train-mcc:0.000000	test-mcc:0.491009 
[29]	train-mcc:0.000000	test-mcc:0.491261 
[30]	train-mcc:0.000000	test-mcc:0.492369 
[31]	train-mcc:0.000000	test-mcc:0.491667 
[32]	train-mcc:0.000000	test-mcc:0.491711 
[33]	train-mcc:0.000000	test-mcc:0.491711 
[34]	train-mcc:0.000000	test-mcc:0.491362 
[35]	train-mcc:0.000000	test-mcc:0.491667 
[36]	train-mcc:0.000000	test-mcc:0.490261 
[37]	train-mcc:0.000000	test-mcc:0.489926 
[38]	train-mcc:0.000000	test-mcc:0.490304 
[39]	train-mcc:0.000000	test-mcc:0.490682 
[40]	train-mcc:0.000000	test-mcc:0.490085 
[41]	train-mcc:0.000000	test-mcc:0.490466 
[42]	train-mcc:0.000000	test-mcc:0.489025 
[43]	train-mcc:0.000000	test-mcc:0.488647 
[44]	train-mcc:0.000000	test-mcc:0.488145 
[45]	train-mcc:0.000000	test-mcc:0.488031 
[46]	train-mcc:0.000000	test-mcc:0.488776 
[47]	train-mcc:0.000000	test-mcc:0.489007 
[48]	train-mcc:0.000000	test-mcc:0.489809 
[49]	train-mcc:0.000000	test-mcc:0.486968 
[50]	train-mcc:0.000000	test-mcc:0.488050 
[51]	train-mcc:0.000000	test-mcc:0.488997 
[52]	train-mcc:0.000000	test-mcc:0.489943 
[53]	train-mcc:0.000000	test-mcc:0.489943 
[54]	train-mcc:0.000000	test-mcc:0.488758 
[55]	train-mcc:0.000000	test-mcc:0.489232 
[56]	train-mcc:0.000000	test-mcc:0.489491 
[57]	train-mcc:0.000000	test-mcc:0.489491 
[58]	train-mcc:0.000000	test-mcc:0.489491 
[59]	train-mcc:0.000000	test-mcc:0.489556 
[60]	train-mcc:0.000000	test-mcc:0.488320 
Stopping. Best iteration:
[30]	train-mcc:0.000000	test-mcc:0.492369


Time: Thu Nov 10 2016 08:02:34 AM
For 0030 rounds: train_mcc: 0 - test_mcc: 0.4923687
Confusion matrix:
     truth
preds      0      1
    0 235255    947
    1    119    429
     truth
preds            0            1
    0 0.9936853221 0.0040000000
    1 0.0005026399 0.0018120380
Iteration 16 (base=0.1109651): MCC=0.4923687 | threshold=0.3510276


===




Iteration 17[1] on Thu Nov 10 2016 08:03:13 AM

depth=12, min_child_weight=45.27862, subsample=0.5, colsample_bytree=1, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.472056 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472158 
[3]	train-mcc:0.000000	test-mcc:0.475798 
[4]	train-mcc:0.000000	test-mcc:0.475914 
[5]	train-mcc:0.000000	test-mcc:0.476838 
[6]	train-mcc:0.000000	test-mcc:0.474537 
[7]	train-mcc:0.000000	test-mcc:0.475431 
[8]	train-mcc:0.000000	test-mcc:0.476888 
[9]	train-mcc:0.000000	test-mcc:0.476844 
[10]	train-mcc:0.000000	test-mcc:0.479655 
[11]	train-mcc:0.000000	test-mcc:0.480651 
[12]	train-mcc:0.000000	test-mcc:0.477366 
[13]	train-mcc:0.000000	test-mcc:0.478167 
[14]	train-mcc:0.000000	test-mcc:0.477366 
[15]	train-mcc:0.000000	test-mcc:0.478089 
[16]	train-mcc:0.000000	test-mcc:0.478659 
[17]	train-mcc:0.000000	test-mcc:0.479621 
[18]	train-mcc:0.000000	test-mcc:0.479414 
[19]	train-mcc:0.000000	test-mcc:0.478219 
[20]	train-mcc:0.000000	test-mcc:0.477223 
[21]	train-mcc:0.000000	test-mcc:0.477430 
[22]	train-mcc:0.000000	test-mcc:0.475794 
[23]	train-mcc:0.000000	test-mcc:0.478282 
[24]	train-mcc:0.000000	test-mcc:0.476898 
[25]	train-mcc:0.000000	test-mcc:0.477819 
[26]	train-mcc:0.000000	test-mcc:0.476750 
[27]	train-mcc:0.000000	test-mcc:0.476653 
[28]	train-mcc:0.000000	test-mcc:0.477052 
[29]	train-mcc:0.000000	test-mcc:0.476929 
[30]	train-mcc:0.000000	test-mcc:0.475916 
[31]	train-mcc:0.000000	test-mcc:0.477071 
[32]	train-mcc:0.000000	test-mcc:0.478301 
[33]	train-mcc:0.000000	test-mcc:0.478480 
[34]	train-mcc:0.000000	test-mcc:0.477794 
[35]	train-mcc:0.000000	test-mcc:0.478287 
[36]	train-mcc:0.000000	test-mcc:0.476999 
[37]	train-mcc:0.000000	test-mcc:0.476257 
[38]	train-mcc:0.000000	test-mcc:0.476888 
[39]	train-mcc:0.000000	test-mcc:0.475109 
[40]	train-mcc:0.000000	test-mcc:0.475296 
[41]	train-mcc:0.000000	test-mcc:0.475033 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.480651


Time: Thu Nov 10 2016 08:06:24 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.480651
Confusion matrix:
     truth
preds      0      1
    0 235321   1010
    1     52    365
     truth
preds            0            1
    0 0.9939724940 0.0042661395
    1 0.0002196428 0.0015417237
Iteration 17 (base=0.5): MCC=0.480651 | threshold=0.5657881



Iteration 17[2] on Thu Nov 10 2016 08:06:26 AM

depth=12, min_child_weight=45.27862, subsample=0.5, colsample_bytree=1, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.473902 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476424 
[3]	train-mcc:0.000000	test-mcc:0.482783 
[4]	train-mcc:0.000000	test-mcc:0.484715 
[5]	train-mcc:0.000000	test-mcc:0.486150 
[6]	train-mcc:0.000000	test-mcc:0.485909 
[7]	train-mcc:0.000000	test-mcc:0.484094 
[8]	train-mcc:0.000000	test-mcc:0.483786 
[9]	train-mcc:0.000000	test-mcc:0.486472 
[10]	train-mcc:0.000000	test-mcc:0.485259 
[11]	train-mcc:0.000000	test-mcc:0.483849 
[12]	train-mcc:0.000000	test-mcc:0.483280 
[13]	train-mcc:0.000000	test-mcc:0.483635 
[14]	train-mcc:0.000000	test-mcc:0.484155 
[15]	train-mcc:0.000000	test-mcc:0.481657 
[16]	train-mcc:0.000000	test-mcc:0.482321 
[17]	train-mcc:0.000000	test-mcc:0.484737 
[18]	train-mcc:0.000000	test-mcc:0.486376 
[19]	train-mcc:0.000000	test-mcc:0.483532 
[20]	train-mcc:0.000000	test-mcc:0.482145 
[21]	train-mcc:0.000000	test-mcc:0.485439 
[22]	train-mcc:0.000000	test-mcc:0.484539 
[23]	train-mcc:0.000000	test-mcc:0.480939 
[24]	train-mcc:0.000000	test-mcc:0.479692 
[25]	train-mcc:0.000000	test-mcc:0.480890 
[26]	train-mcc:0.000000	test-mcc:0.480592 
[27]	train-mcc:0.000000	test-mcc:0.479541 
[28]	train-mcc:0.000000	test-mcc:0.478356 
[29]	train-mcc:0.000000	test-mcc:0.479391 
[30]	train-mcc:0.000000	test-mcc:0.479472 
[31]	train-mcc:0.000000	test-mcc:0.478023 
[32]	train-mcc:0.000000	test-mcc:0.478957 
[33]	train-mcc:0.000000	test-mcc:0.478831 
[34]	train-mcc:0.000000	test-mcc:0.479115 
[35]	train-mcc:0.000000	test-mcc:0.477935 
[36]	train-mcc:0.000000	test-mcc:0.478988 
[37]	train-mcc:0.000000	test-mcc:0.478405 
[38]	train-mcc:0.000000	test-mcc:0.480212 
[39]	train-mcc:0.000000	test-mcc:0.478713 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.486472


Time: Thu Nov 10 2016 08:09:15 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.486472
Confusion matrix:
     truth
preds      0      1
    0 235279    972
    1     94    404
     truth
preds           0           1
    0 0.993790892 0.004105614
    1 0.000397045 0.001706449
Iteration 17 (base=0.5): MCC=0.486472 | threshold=0.4478511



Iteration 17[3] on Thu Nov 10 2016 08:09:17 AM

depth=12, min_child_weight=45.27862, subsample=0.5, colsample_bytree=1, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.487076 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488723 
[3]	train-mcc:0.000000	test-mcc:0.495167 
[4]	train-mcc:0.000000	test-mcc:0.491711 
[5]	train-mcc:0.000000	test-mcc:0.492000 
[6]	train-mcc:0.000000	test-mcc:0.489832 
[7]	train-mcc:0.000000	test-mcc:0.487288 
[8]	train-mcc:0.000000	test-mcc:0.488324 
[9]	train-mcc:0.000000	test-mcc:0.487744 
[10]	train-mcc:0.000000	test-mcc:0.490110 
[11]	train-mcc:0.000000	test-mcc:0.488323 
[12]	train-mcc:0.000000	test-mcc:0.488900 
[13]	train-mcc:0.000000	test-mcc:0.489715 
[14]	train-mcc:0.000000	test-mcc:0.494182 
[15]	train-mcc:0.000000	test-mcc:0.490904 
[16]	train-mcc:0.000000	test-mcc:0.491146 
[17]	train-mcc:0.000000	test-mcc:0.488286 
[18]	train-mcc:0.000000	test-mcc:0.487621 
[19]	train-mcc:0.000000	test-mcc:0.488379 
[20]	train-mcc:0.000000	test-mcc:0.490198 
[21]	train-mcc:0.000000	test-mcc:0.491160 
[22]	train-mcc:0.000000	test-mcc:0.494059 
[23]	train-mcc:0.000000	test-mcc:0.493129 
[24]	train-mcc:0.000000	test-mcc:0.493722 
[25]	train-mcc:0.000000	test-mcc:0.496227 
[26]	train-mcc:0.000000	test-mcc:0.495632 
[27]	train-mcc:0.000000	test-mcc:0.493460 
[28]	train-mcc:0.000000	test-mcc:0.489199 
[29]	train-mcc:0.000000	test-mcc:0.489551 
[30]	train-mcc:0.000000	test-mcc:0.487808 
[31]	train-mcc:0.000000	test-mcc:0.489330 
[32]	train-mcc:0.000000	test-mcc:0.489818 
[33]	train-mcc:0.000000	test-mcc:0.489120 
[34]	train-mcc:0.000000	test-mcc:0.488804 
[35]	train-mcc:0.000000	test-mcc:0.487111 
[36]	train-mcc:0.000000	test-mcc:0.487664 
[37]	train-mcc:0.000000	test-mcc:0.487409 
[38]	train-mcc:0.000000	test-mcc:0.490781 
[39]	train-mcc:0.000000	test-mcc:0.489473 
[40]	train-mcc:0.000000	test-mcc:0.486764 
[41]	train-mcc:0.000000	test-mcc:0.485867 
[42]	train-mcc:0.000000	test-mcc:0.485350 
[43]	train-mcc:0.000000	test-mcc:0.486437 
[44]	train-mcc:0.000000	test-mcc:0.486918 
[45]	train-mcc:0.000000	test-mcc:0.485350 
[46]	train-mcc:0.000000	test-mcc:0.485019 
[47]	train-mcc:0.000000	test-mcc:0.483479 
[48]	train-mcc:0.000000	test-mcc:0.483412 
[49]	train-mcc:0.000000	test-mcc:0.482288 
[50]	train-mcc:0.000000	test-mcc:0.480643 
[51]	train-mcc:0.000000	test-mcc:0.480401 
[52]	train-mcc:0.000000	test-mcc:0.481122 
[53]	train-mcc:0.000000	test-mcc:0.479601 
[54]	train-mcc:0.000000	test-mcc:0.479434 
[55]	train-mcc:0.000000	test-mcc:0.481600 
Stopping. Best iteration:
[25]	train-mcc:0.000000	test-mcc:0.496227


Time: Thu Nov 10 2016 08:13:08 AM
For 0025 rounds: train_mcc: 0 - test_mcc: 0.496227
Confusion matrix:
     truth
preds      0      1
    0 235237    930
    1    137    446
     truth
preds            0            1
    0 0.9936092925 0.0039281943
    1 0.0005786695 0.0018838437
Iteration 17 (base=0.5): MCC=0.496227 | threshold=0.3822934



Iteration 17[4] on Thu Nov 10 2016 08:13:10 AM

depth=12, min_child_weight=45.27862, subsample=0.5, colsample_bytree=1, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.481122 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480854 
[3]	train-mcc:0.000000	test-mcc:0.479425 
[4]	train-mcc:0.000000	test-mcc:0.479795 
[5]	train-mcc:0.000000	test-mcc:0.482006 
[6]	train-mcc:0.000000	test-mcc:0.482074 
[7]	train-mcc:0.000000	test-mcc:0.480153 
[8]	train-mcc:0.000000	test-mcc:0.484762 
[9]	train-mcc:0.000000	test-mcc:0.483911 
[10]	train-mcc:0.000000	test-mcc:0.485311 
[11]	train-mcc:0.000000	test-mcc:0.483943 
[12]	train-mcc:0.000000	test-mcc:0.486587 
[13]	train-mcc:0.000000	test-mcc:0.488031 
[14]	train-mcc:0.000000	test-mcc:0.486036 
[15]	train-mcc:0.000000	test-mcc:0.487103 
[16]	train-mcc:0.000000	test-mcc:0.485993 
[17]	train-mcc:0.000000	test-mcc:0.485161 
[18]	train-mcc:0.000000	test-mcc:0.484921 
[19]	train-mcc:0.000000	test-mcc:0.486656 
[20]	train-mcc:0.000000	test-mcc:0.485161 
[21]	train-mcc:0.000000	test-mcc:0.485669 
[22]	train-mcc:0.000000	test-mcc:0.484866 
[23]	train-mcc:0.000000	test-mcc:0.484759 
[24]	train-mcc:0.000000	test-mcc:0.487258 
[25]	train-mcc:0.000000	test-mcc:0.482259 
[26]	train-mcc:0.000000	test-mcc:0.480985 
[27]	train-mcc:0.000000	test-mcc:0.479860 
[28]	train-mcc:0.000000	test-mcc:0.479755 
[29]	train-mcc:0.000000	test-mcc:0.480408 
[30]	train-mcc:0.000000	test-mcc:0.481018 
[31]	train-mcc:0.000000	test-mcc:0.480796 
[32]	train-mcc:0.000000	test-mcc:0.481627 
[33]	train-mcc:0.000000	test-mcc:0.480665 
[34]	train-mcc:0.000000	test-mcc:0.480400 
[35]	train-mcc:0.000000	test-mcc:0.479065 
[36]	train-mcc:0.000000	test-mcc:0.478543 
[37]	train-mcc:0.000000	test-mcc:0.476575 
[38]	train-mcc:0.000000	test-mcc:0.477805 
[39]	train-mcc:0.000000	test-mcc:0.478894 
[40]	train-mcc:0.000000	test-mcc:0.478957 
[41]	train-mcc:0.000000	test-mcc:0.476862 
[42]	train-mcc:0.000000	test-mcc:0.478043 
[43]	train-mcc:0.000000	test-mcc:0.479189 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.488031


Time: Thu Nov 10 2016 08:15:51 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4880306
Confusion matrix:
     truth
preds      0      1
    0 235209    925
    1    165    451
     truth
preds            0            1
    0 0.9934910243 0.0039070750
    1 0.0006969377 0.0019049630
Iteration 17 (base=0.5): MCC=0.4880306 | threshold=0.3427328



Iteration 17[5] on Thu Nov 10 2016 08:15:52 AM

depth=12, min_child_weight=45.27862, subsample=0.5, colsample_bytree=1, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.491067 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477790 
[3]	train-mcc:0.000000	test-mcc:0.480843 
[4]	train-mcc:0.000000	test-mcc:0.482523 
[5]	train-mcc:0.000000	test-mcc:0.485844 
[6]	train-mcc:0.000000	test-mcc:0.484855 
[7]	train-mcc:0.000000	test-mcc:0.484443 
[8]	train-mcc:0.000000	test-mcc:0.486587 
[9]	train-mcc:0.000000	test-mcc:0.486274 
[10]	train-mcc:0.000000	test-mcc:0.487361 
[11]	train-mcc:0.000000	test-mcc:0.491285 
[12]	train-mcc:0.000000	test-mcc:0.492855 
[13]	train-mcc:0.000000	test-mcc:0.489893 
[14]	train-mcc:0.000000	test-mcc:0.490152 
[15]	train-mcc:0.000000	test-mcc:0.492159 
[16]	train-mcc:0.000000	test-mcc:0.493059 
[17]	train-mcc:0.000000	test-mcc:0.492372 
[18]	train-mcc:0.000000	test-mcc:0.492392 
[19]	train-mcc:0.000000	test-mcc:0.490621 
[20]	train-mcc:0.000000	test-mcc:0.489120 
[21]	train-mcc:0.000000	test-mcc:0.488320 
[22]	train-mcc:0.000000	test-mcc:0.485903 
[23]	train-mcc:0.000000	test-mcc:0.488379 
[24]	train-mcc:0.000000	test-mcc:0.490680 
[25]	train-mcc:0.000000	test-mcc:0.491422 
[26]	train-mcc:0.000000	test-mcc:0.492170 
[27]	train-mcc:0.000000	test-mcc:0.488231 
[28]	train-mcc:0.000000	test-mcc:0.490167 
[29]	train-mcc:0.000000	test-mcc:0.491553 
[30]	train-mcc:0.000000	test-mcc:0.490621 
[31]	train-mcc:0.000000	test-mcc:0.489471 
[32]	train-mcc:0.000000	test-mcc:0.489986 
[33]	train-mcc:0.000000	test-mcc:0.492721 
[34]	train-mcc:0.000000	test-mcc:0.490636 
[35]	train-mcc:0.000000	test-mcc:0.486285 
[36]	train-mcc:0.000000	test-mcc:0.489007 
[37]	train-mcc:0.000000	test-mcc:0.487505 
[38]	train-mcc:0.000000	test-mcc:0.489468 
[39]	train-mcc:0.000000	test-mcc:0.491962 
[40]	train-mcc:0.000000	test-mcc:0.488684 
[41]	train-mcc:0.000000	test-mcc:0.487743 
[42]	train-mcc:0.000000	test-mcc:0.488003 
[43]	train-mcc:0.000000	test-mcc:0.488684 
[44]	train-mcc:0.000000	test-mcc:0.486759 
[45]	train-mcc:0.000000	test-mcc:0.487065 
[46]	train-mcc:0.000000	test-mcc:0.487548 
Stopping. Best iteration:
[16]	train-mcc:0.000000	test-mcc:0.493059


Time: Thu Nov 10 2016 08:18:56 AM
For 0016 rounds: train_mcc: 0 - test_mcc: 0.4930588
Confusion matrix:
     truth
preds      0      1
    0 235218    923
    1    156    453
     truth
preds            0            1
    0 0.9935290391 0.0038986272
    1 0.0006589229 0.0019134108
Iteration 17 (base=0.5): MCC=0.4930588 | threshold=0.3341967


===




Iteration 18[1] on Thu Nov 10 2016 08:19:22 AM

depth=6, min_child_weight=7.936784, subsample=0.7604223, colsample_bytree=0.9737812, base_score=0.4153898
[1]	train-mcc:0.000000	test-mcc:0.470502 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472859 
[3]	train-mcc:0.000000	test-mcc:0.475260 
[4]	train-mcc:0.000000	test-mcc:0.476261 
[5]	train-mcc:0.000000	test-mcc:0.477604 
[6]	train-mcc:0.000000	test-mcc:0.479859 
[7]	train-mcc:0.000000	test-mcc:0.477546 
[8]	train-mcc:0.000000	test-mcc:0.476944 
[9]	train-mcc:0.000000	test-mcc:0.478159 
[10]	train-mcc:0.000000	test-mcc:0.477915 
[11]	train-mcc:0.000000	test-mcc:0.479291 
[12]	train-mcc:0.000000	test-mcc:0.478336 
[13]	train-mcc:0.000000	test-mcc:0.481022 
[14]	train-mcc:0.000000	test-mcc:0.480543 
[15]	train-mcc:0.000000	test-mcc:0.479807 
[16]	train-mcc:0.000000	test-mcc:0.480082 
[17]	train-mcc:0.000000	test-mcc:0.480289 
[18]	train-mcc:0.000000	test-mcc:0.480289 
[19]	train-mcc:0.000000	test-mcc:0.480532 
[20]	train-mcc:0.000000	test-mcc:0.481129 
[21]	train-mcc:0.000000	test-mcc:0.480917 
[22]	train-mcc:0.000000	test-mcc:0.482286 
[23]	train-mcc:0.000000	test-mcc:0.482286 
[24]	train-mcc:0.000000	test-mcc:0.480096 
[25]	train-mcc:0.000000	test-mcc:0.479582 
[26]	train-mcc:0.000000	test-mcc:0.479291 
[27]	train-mcc:0.000000	test-mcc:0.480917 
[28]	train-mcc:0.000000	test-mcc:0.479880 
[29]	train-mcc:0.000000	test-mcc:0.479666 
[30]	train-mcc:0.000000	test-mcc:0.478631 
[31]	train-mcc:0.000000	test-mcc:0.478198 
[32]	train-mcc:0.000000	test-mcc:0.478198 
[33]	train-mcc:0.000000	test-mcc:0.477137 
[34]	train-mcc:0.000000	test-mcc:0.479029 
[35]	train-mcc:0.000000	test-mcc:0.479029 
[36]	train-mcc:0.000000	test-mcc:0.479029 
[37]	train-mcc:0.000000	test-mcc:0.479555 
[38]	train-mcc:0.000000	test-mcc:0.479555 
[39]	train-mcc:0.000000	test-mcc:0.479240 
[40]	train-mcc:0.000000	test-mcc:0.479240 
[41]	train-mcc:0.000000	test-mcc:0.479240 
[42]	train-mcc:0.000000	test-mcc:0.479240 
[43]	train-mcc:0.000000	test-mcc:0.479974 
[44]	train-mcc:0.000000	test-mcc:0.479452 
[45]	train-mcc:0.000000	test-mcc:0.479974 
[46]	train-mcc:0.000000	test-mcc:0.478718 
[47]	train-mcc:0.000000	test-mcc:0.478718 
[48]	train-mcc:0.000000	test-mcc:0.477983 
[49]	train-mcc:0.000000	test-mcc:0.476944 
[50]	train-mcc:0.000000	test-mcc:0.477983 
[51]	train-mcc:0.000000	test-mcc:0.477983 
[52]	train-mcc:0.000000	test-mcc:0.477983 
Stopping. Best iteration:
[22]	train-mcc:0.000000	test-mcc:0.482286


Time: Thu Nov 10 2016 08:21:36 AM
For 0022 rounds: train_mcc: 0 - test_mcc: 0.4822858
Confusion matrix:
     truth
preds      0      1
    0 235289    984
    1     84    391
     truth
preds            0            1
    0 0.9938373291 0.0041563181
    1 0.0003548076 0.0016515451
Iteration 18 (base=0.4153898): MCC=0.4822858 | threshold=0.4731182



Iteration 18[2] on Thu Nov 10 2016 08:21:37 AM

depth=6, min_child_weight=7.936784, subsample=0.7604223, colsample_bytree=0.9737812, base_score=0.4153898
[1]	train-mcc:0.000000	test-mcc:0.480981 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.479115 
[3]	train-mcc:0.000000	test-mcc:0.484362 
[4]	train-mcc:0.000000	test-mcc:0.482099 
[5]	train-mcc:0.000000	test-mcc:0.482320 
[6]	train-mcc:0.000000	test-mcc:0.479189 
[7]	train-mcc:0.000000	test-mcc:0.481053 
[8]	train-mcc:0.000000	test-mcc:0.480461 
[9]	train-mcc:0.000000	test-mcc:0.479116 
[10]	train-mcc:0.000000	test-mcc:0.478541 
[11]	train-mcc:0.000000	test-mcc:0.479268 
[12]	train-mcc:0.000000	test-mcc:0.479268 
[13]	train-mcc:0.000000	test-mcc:0.480097 
[14]	train-mcc:0.000000	test-mcc:0.479391 
[15]	train-mcc:0.000000	test-mcc:0.478969 
[16]	train-mcc:0.000000	test-mcc:0.477422 
[17]	train-mcc:0.000000	test-mcc:0.477122 
[18]	train-mcc:0.000000	test-mcc:0.479111 
[19]	train-mcc:0.000000	test-mcc:0.479292 
[20]	train-mcc:0.000000	test-mcc:0.479038 
[21]	train-mcc:0.000000	test-mcc:0.479741 
[22]	train-mcc:0.000000	test-mcc:0.479478 
[23]	train-mcc:0.000000	test-mcc:0.479700 
[24]	train-mcc:0.000000	test-mcc:0.481118 
[25]	train-mcc:0.000000	test-mcc:0.480720 
[26]	train-mcc:0.000000	test-mcc:0.481005 
[27]	train-mcc:0.000000	test-mcc:0.481005 
[28]	train-mcc:0.000000	test-mcc:0.480569 
[29]	train-mcc:0.000000	test-mcc:0.482081 
[30]	train-mcc:0.000000	test-mcc:0.480400 
[31]	train-mcc:0.000000	test-mcc:0.480398 
[32]	train-mcc:0.000000	test-mcc:0.480882 
[33]	train-mcc:0.000000	test-mcc:0.481842 
Stopping. Best iteration:
[3]	train-mcc:0.000000	test-mcc:0.484362


Time: Thu Nov 10 2016 08:23:00 AM
For 0003 rounds: train_mcc: 0 - test_mcc: 0.4843623
Confusion matrix:
     truth
preds      0      1
    0 235282    977
    1     91    399
     truth
preds            0            1
    0 0.9938035641 0.0041267334
    1 0.0003843733 0.0016853292
Iteration 18 (base=0.4153898): MCC=0.4843623 | threshold=0.4294837



Iteration 18[3] on Thu Nov 10 2016 08:23:01 AM

depth=6, min_child_weight=7.936784, subsample=0.7604223, colsample_bytree=0.9737812, base_score=0.4153898
[1]	train-mcc:0.000000	test-mcc:0.480924 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486566 
[3]	train-mcc:0.000000	test-mcc:0.486660 
[4]	train-mcc:0.000000	test-mcc:0.487669 
[5]	train-mcc:0.000000	test-mcc:0.487353 
[6]	train-mcc:0.000000	test-mcc:0.484806 
[7]	train-mcc:0.000000	test-mcc:0.486922 
[8]	train-mcc:0.000000	test-mcc:0.487052 
[9]	train-mcc:0.000000	test-mcc:0.487835 
[10]	train-mcc:0.000000	test-mcc:0.485737 
[11]	train-mcc:0.000000	test-mcc:0.484059 
[12]	train-mcc:0.000000	test-mcc:0.484276 
[13]	train-mcc:0.000000	test-mcc:0.485877 
[14]	train-mcc:0.000000	test-mcc:0.485147 
[15]	train-mcc:0.000000	test-mcc:0.487195 
[16]	train-mcc:0.000000	test-mcc:0.487834 
[17]	train-mcc:0.000000	test-mcc:0.489973 
[18]	train-mcc:0.000000	test-mcc:0.489261 
[19]	train-mcc:0.000000	test-mcc:0.490457 
[20]	train-mcc:0.000000	test-mcc:0.489261 
[21]	train-mcc:0.000000	test-mcc:0.489261 
[22]	train-mcc:0.000000	test-mcc:0.490231 
[23]	train-mcc:0.000000	test-mcc:0.490457 
[24]	train-mcc:0.000000	test-mcc:0.490273 
[25]	train-mcc:0.000000	test-mcc:0.491259 
[26]	train-mcc:0.000000	test-mcc:0.491259 
[27]	train-mcc:0.000000	test-mcc:0.490546 
[28]	train-mcc:0.000000	test-mcc:0.490273 
[29]	train-mcc:0.000000	test-mcc:0.490167 
[30]	train-mcc:0.000000	test-mcc:0.490765 
[31]	train-mcc:0.000000	test-mcc:0.491478 
[32]	train-mcc:0.000000	test-mcc:0.491478 
[33]	train-mcc:0.000000	test-mcc:0.491520 
[34]	train-mcc:0.000000	test-mcc:0.491520 
[35]	train-mcc:0.000000	test-mcc:0.490546 
[36]	train-mcc:0.000000	test-mcc:0.490478 
[37]	train-mcc:0.000000	test-mcc:0.489759 
[38]	train-mcc:0.000000	test-mcc:0.489759 
[39]	train-mcc:0.000000	test-mcc:0.488636 
[40]	train-mcc:0.000000	test-mcc:0.488622 
[41]	train-mcc:0.000000	test-mcc:0.488963 
[42]	train-mcc:0.000000	test-mcc:0.489970 
[43]	train-mcc:0.000000	test-mcc:0.489970 
[44]	train-mcc:0.000000	test-mcc:0.490182 
[45]	train-mcc:0.000000	test-mcc:0.490052 
[46]	train-mcc:0.000000	test-mcc:0.489101 
[47]	train-mcc:0.000000	test-mcc:0.489856 
[48]	train-mcc:0.000000	test-mcc:0.490307 
[49]	train-mcc:0.000000	test-mcc:0.490825 
[50]	train-mcc:0.000000	test-mcc:0.491833 
[51]	train-mcc:0.000000	test-mcc:0.491121 
[52]	train-mcc:0.000000	test-mcc:0.492786 
[53]	train-mcc:0.000000	test-mcc:0.492363 
[54]	train-mcc:0.000000	test-mcc:0.493028 
[55]	train-mcc:0.000000	test-mcc:0.493028 
[56]	train-mcc:0.000000	test-mcc:0.493028 
[57]	train-mcc:0.000000	test-mcc:0.493028 
[58]	train-mcc:0.000000	test-mcc:0.493149 
[59]	train-mcc:0.000000	test-mcc:0.493072 
[60]	train-mcc:0.000000	test-mcc:0.493338 
[61]	train-mcc:0.000000	test-mcc:0.493338 
[62]	train-mcc:0.000000	test-mcc:0.492113 
[63]	train-mcc:0.000000	test-mcc:0.492113 
[64]	train-mcc:0.000000	test-mcc:0.492828 
[65]	train-mcc:0.000000	test-mcc:0.492828 
[66]	train-mcc:0.000000	test-mcc:0.492413 
[67]	train-mcc:0.000000	test-mcc:0.491906 
[68]	train-mcc:0.000000	test-mcc:0.491906 
[69]	train-mcc:0.000000	test-mcc:0.491191 
[70]	train-mcc:0.000000	test-mcc:0.495091 
[71]	train-mcc:0.000000	test-mcc:0.494595 
[72]	train-mcc:0.000000	test-mcc:0.493558 
[73]	train-mcc:0.000000	test-mcc:0.493072 
[74]	train-mcc:0.000000	test-mcc:0.490893 
[75]	train-mcc:0.000000	test-mcc:0.491371 
[76]	train-mcc:0.000000	test-mcc:0.491394 
[77]	train-mcc:0.000000	test-mcc:0.491394 
[78]	train-mcc:0.000000	test-mcc:0.491878 
[79]	train-mcc:0.000000	test-mcc:0.490912 
[80]	train-mcc:0.000000	test-mcc:0.490662 
[81]	train-mcc:0.000000	test-mcc:0.490662 
[82]	train-mcc:0.000000	test-mcc:0.490184 
[83]	train-mcc:0.000000	test-mcc:0.490184 
[84]	train-mcc:0.000000	test-mcc:0.489942 
[85]	train-mcc:0.000000	test-mcc:0.490184 
[86]	train-mcc:0.000000	test-mcc:0.490184 
[87]	train-mcc:0.000000	test-mcc:0.490184 
[88]	train-mcc:0.000000	test-mcc:0.490184 
[89]	train-mcc:0.000000	test-mcc:0.490198 
[90]	train-mcc:0.000000	test-mcc:0.490904 
[91]	train-mcc:0.000000	test-mcc:0.489735 
[92]	train-mcc:0.000000	test-mcc:0.489735 
[93]	train-mcc:0.000000	test-mcc:0.490414 
[94]	train-mcc:0.000000	test-mcc:0.490414 
[95]	train-mcc:0.000000	test-mcc:0.491593 
[96]	train-mcc:0.000000	test-mcc:0.490559 
[97]	train-mcc:0.000000	test-mcc:0.490559 
[98]	train-mcc:0.000000	test-mcc:0.490559 
[99]	train-mcc:0.000000	test-mcc:0.491609 
[100]	train-mcc:0.000000	test-mcc:0.489956 
Stopping. Best iteration:
[70]	train-mcc:0.000000	test-mcc:0.495091


Time: Thu Nov 10 2016 08:26:46 AM
For 0070 rounds: train_mcc: 0 - test_mcc: 0.4950909
Confusion matrix:
     truth
preds      0      1
    0 235283    962
    1     91    414
     truth
preds            0            1
    0 0.9938035903 0.0040633580
    1 0.0003843717 0.0017486800
Iteration 18 (base=0.4153898): MCC=0.4950909 | threshold=0.4209261



Iteration 18[4] on Thu Nov 10 2016 08:26:47 AM

depth=6, min_child_weight=7.936784, subsample=0.7604223, colsample_bytree=0.9737812, base_score=0.4153898
[1]	train-mcc:0.000000	test-mcc:0.483521 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486472 
[3]	train-mcc:0.000000	test-mcc:0.483001 
[4]	train-mcc:0.000000	test-mcc:0.485448 
[5]	train-mcc:0.000000	test-mcc:0.486174 
[6]	train-mcc:0.000000	test-mcc:0.487964 
[7]	train-mcc:0.000000	test-mcc:0.488475 
[8]	train-mcc:0.000000	test-mcc:0.487743 
[9]	train-mcc:0.000000	test-mcc:0.487744 
[10]	train-mcc:0.000000	test-mcc:0.488626 
[11]	train-mcc:0.000000	test-mcc:0.487663 
[12]	train-mcc:0.000000	test-mcc:0.487234 
[13]	train-mcc:0.000000	test-mcc:0.489921 
[14]	train-mcc:0.000000	test-mcc:0.490640 
[15]	train-mcc:0.000000	test-mcc:0.488419 
[16]	train-mcc:0.000000	test-mcc:0.489475 
[17]	train-mcc:0.000000	test-mcc:0.488366 
[18]	train-mcc:0.000000	test-mcc:0.486335 
[19]	train-mcc:0.000000	test-mcc:0.486459 
[20]	train-mcc:0.000000	test-mcc:0.486844 
[21]	train-mcc:0.000000	test-mcc:0.488227 
[22]	train-mcc:0.000000	test-mcc:0.489272 
[23]	train-mcc:0.000000	test-mcc:0.488355 
[24]	train-mcc:0.000000	test-mcc:0.487827 
[25]	train-mcc:0.000000	test-mcc:0.488903 
[26]	train-mcc:0.000000	test-mcc:0.488842 
[27]	train-mcc:0.000000	test-mcc:0.490304 
[28]	train-mcc:0.000000	test-mcc:0.490004 
[29]	train-mcc:0.000000	test-mcc:0.489106 
[30]	train-mcc:0.000000	test-mcc:0.489205 
[31]	train-mcc:0.000000	test-mcc:0.487074 
[32]	train-mcc:0.000000	test-mcc:0.488136 
[33]	train-mcc:0.000000	test-mcc:0.487491 
[34]	train-mcc:0.000000	test-mcc:0.487465 
[35]	train-mcc:0.000000	test-mcc:0.486814 
[36]	train-mcc:0.000000	test-mcc:0.486393 
[37]	train-mcc:0.000000	test-mcc:0.486393 
[38]	train-mcc:0.000000	test-mcc:0.485716 
[39]	train-mcc:0.000000	test-mcc:0.485716 
[40]	train-mcc:0.000000	test-mcc:0.485090 
[41]	train-mcc:0.000000	test-mcc:0.486341 
[42]	train-mcc:0.000000	test-mcc:0.486439 
[43]	train-mcc:0.000000	test-mcc:0.486562 
[44]	train-mcc:0.000000	test-mcc:0.485804 
Stopping. Best iteration:
[14]	train-mcc:0.000000	test-mcc:0.490640


Time: Thu Nov 10 2016 08:28:27 AM
For 0014 rounds: train_mcc: 0 - test_mcc: 0.4906404
Confusion matrix:
     truth
preds      0      1
    0 235164    896
    1    210    480
     truth
preds            0            1
    0 0.9933009504 0.0037845829
    1 0.0008870116 0.0020274551
Iteration 18 (base=0.4153898): MCC=0.4906404 | threshold=0.2874743



Iteration 18[5] on Thu Nov 10 2016 08:28:29 AM

depth=6, min_child_weight=7.936784, subsample=0.7604223, colsample_bytree=0.9737812, base_score=0.4153898
[1]	train-mcc:0.000000	test-mcc:0.476547 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.493360 
[3]	train-mcc:0.000000	test-mcc:0.489054 
[4]	train-mcc:0.000000	test-mcc:0.489519 
[5]	train-mcc:0.000000	test-mcc:0.489365 
[6]	train-mcc:0.000000	test-mcc:0.489556 
[7]	train-mcc:0.000000	test-mcc:0.491358 
[8]	train-mcc:0.000000	test-mcc:0.487895 
[9]	train-mcc:0.000000	test-mcc:0.491316 
[10]	train-mcc:0.000000	test-mcc:0.492545 
[11]	train-mcc:0.000000	test-mcc:0.491971 
[12]	train-mcc:0.000000	test-mcc:0.489468 
[13]	train-mcc:0.000000	test-mcc:0.489388 
[14]	train-mcc:0.000000	test-mcc:0.489768 
[15]	train-mcc:0.000000	test-mcc:0.490160 
[16]	train-mcc:0.000000	test-mcc:0.489747 
[17]	train-mcc:0.000000	test-mcc:0.490305 
[18]	train-mcc:0.000000	test-mcc:0.490764 
[19]	train-mcc:0.000000	test-mcc:0.488927 
[20]	train-mcc:0.000000	test-mcc:0.489365 
[21]	train-mcc:0.000000	test-mcc:0.488490 
[22]	train-mcc:0.000000	test-mcc:0.488490 
[23]	train-mcc:0.000000	test-mcc:0.489806 
[24]	train-mcc:0.000000	test-mcc:0.489352 
[25]	train-mcc:0.000000	test-mcc:0.489352 
[26]	train-mcc:0.000000	test-mcc:0.490307 
[27]	train-mcc:0.000000	test-mcc:0.490307 
[28]	train-mcc:0.000000	test-mcc:0.489604 
[29]	train-mcc:0.000000	test-mcc:0.490056 
[30]	train-mcc:0.000000	test-mcc:0.488851 
[31]	train-mcc:0.000000	test-mcc:0.490172 
[32]	train-mcc:0.000000	test-mcc:0.487881 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.493360


Time: Thu Nov 10 2016 08:29:53 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.4933604
Confusion matrix:
     truth
preds      0      1
    0 235251    943
    1    123    433
     truth
preds            0            1
    0 0.9936684266 0.0039831045
    1 0.0005195354 0.0018289335
Iteration 18 (base=0.4153898): MCC=0.4933604 | threshold=0.3902595


===




Iteration 19[1] on Thu Nov 10 2016 08:30:28 AM

depth=5, min_child_weight=49.36037, subsample=1, colsample_bytree=1, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.241106 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.000479 
[3]	train-mcc:0.000000	test-mcc:0.000000 
[4]	train-mcc:0.000000	test-mcc:0.000041 
[5]	train-mcc:0.000000	test-mcc:0.000801 
[6]	train-mcc:0.000000	test-mcc:0.003218 
[7]	train-mcc:0.000000	test-mcc:0.000000 
[8]	train-mcc:0.000000	test-mcc:0.003670 
[9]	train-mcc:0.000000	test-mcc:0.000136 
[10]	train-mcc:0.000000	test-mcc:0.006375 
[11]	train-mcc:0.000000	test-mcc:0.000257 
[12]	train-mcc:0.000000	test-mcc:0.009807 
[13]	train-mcc:0.000000	test-mcc:0.000307 
[14]	train-mcc:0.000000	test-mcc:0.000000 
[15]	train-mcc:0.000000	test-mcc:0.000000 
[16]	train-mcc:0.000000	test-mcc:0.000000 
[17]	train-mcc:0.000000	test-mcc:0.000000 
[18]	train-mcc:0.000000	test-mcc:0.000000 
[19]	train-mcc:0.000000	test-mcc:0.000000 
[20]	train-mcc:0.000000	test-mcc:0.000427 
[21]	train-mcc:0.000000	test-mcc:0.000427 
[22]	train-mcc:0.000000	test-mcc:0.000000 
[23]	train-mcc:0.000000	test-mcc:0.000000 
[24]	train-mcc:0.000000	test-mcc:0.000000 
[25]	train-mcc:0.000000	test-mcc:0.000000 
[26]	train-mcc:0.000000	test-mcc:0.000000 
[27]	train-mcc:0.000000	test-mcc:0.000000 
[28]	train-mcc:0.000000	test-mcc:0.000000 
[29]	train-mcc:0.000000	test-mcc:0.000000 
[30]	train-mcc:0.000000	test-mcc:0.000000 
[31]	train-mcc:0.000000	test-mcc:0.000000 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.241106


Time: Thu Nov 10 2016 08:31:27 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.2411058
Confusion matrix:
     truth
preds      0      1
    0 223816    328
    1  11557   1047
     truth
preds           0           1
    0 0.945376518 0.001385439
    1 0.048815618 0.004422424
Iteration 19 (base=0.001): MCC=0.2411058 | threshold=0.002216782



Iteration 19[2] on Thu Nov 10 2016 08:31:28 AM

depth=5, min_child_weight=49.36037, subsample=1, colsample_bytree=1, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.239052 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.005418 
[3]	train-mcc:0.000000	test-mcc:0.006421 
[4]	train-mcc:0.000000	test-mcc:0.004533 
[5]	train-mcc:0.000000	test-mcc:0.004784 
[6]	train-mcc:0.000000	test-mcc:0.001998 
[7]	train-mcc:0.000000	test-mcc:0.001069 
[8]	train-mcc:0.000000	test-mcc:0.000000 
[9]	train-mcc:0.000000	test-mcc:0.000000 
[10]	train-mcc:0.000000	test-mcc:0.000325 
[11]	train-mcc:0.000000	test-mcc:0.000000 
[12]	train-mcc:0.000000	test-mcc:0.003281 
[13]	train-mcc:0.000000	test-mcc:0.001563 
[14]	train-mcc:0.000000	test-mcc:0.000000 
[15]	train-mcc:0.000000	test-mcc:0.000000 
[16]	train-mcc:0.000000	test-mcc:0.000000 
[17]	train-mcc:0.000000	test-mcc:0.000000 
[18]	train-mcc:0.000000	test-mcc:0.000000 
[19]	train-mcc:0.000000	test-mcc:0.000000 
[20]	train-mcc:0.000000	test-mcc:0.000087 
[21]	train-mcc:0.000000	test-mcc:0.000000 
[22]	train-mcc:0.000000	test-mcc:0.000000 
[23]	train-mcc:0.000000	test-mcc:0.000000 
[24]	train-mcc:0.000000	test-mcc:0.000000 
[25]	train-mcc:0.000000	test-mcc:0.000000 
[26]	train-mcc:0.000000	test-mcc:0.000000 
[27]	train-mcc:0.000000	test-mcc:0.000000 
[28]	train-mcc:0.000000	test-mcc:0.000000 
[29]	train-mcc:0.000000	test-mcc:0.000000 
[30]	train-mcc:0.000000	test-mcc:0.000000 
[31]	train-mcc:0.000000	test-mcc:0.000000 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.239052


Time: Thu Nov 10 2016 08:32:10 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.2390517
Confusion matrix:
     truth
preds      0      1
    0 224015    346
    1  11358   1030
     truth
preds           0           1
    0 0.946213078 0.001461463
    1 0.047974859 0.004350599
Iteration 19 (base=0.001): MCC=0.2390517 | threshold=0.002522269



Iteration 19[3] on Thu Nov 10 2016 08:32:12 AM

depth=5, min_child_weight=49.36037, subsample=1, colsample_bytree=1, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.245399 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.000000 
[3]	train-mcc:0.000000	test-mcc:0.000000 
[4]	train-mcc:0.000000	test-mcc:0.000062 
[5]	train-mcc:0.000000	test-mcc:0.000000 
[6]	train-mcc:0.000000	test-mcc:0.005094 
[7]	train-mcc:0.000000	test-mcc:0.001359 
[8]	train-mcc:0.000000	test-mcc:0.015338 
[9]	train-mcc:0.000000	test-mcc:0.006932 
[10]	train-mcc:0.000000	test-mcc:0.000000 
[11]	train-mcc:0.000000	test-mcc:0.000000 
[12]	train-mcc:0.000000	test-mcc:0.000305 
[13]	train-mcc:0.000000	test-mcc:0.000430 
[14]	train-mcc:0.000000	test-mcc:0.000782 
[15]	train-mcc:0.000000	test-mcc:0.000000 
[16]	train-mcc:0.000000	test-mcc:0.000000 
[17]	train-mcc:0.000000	test-mcc:0.000000 
[18]	train-mcc:0.000000	test-mcc:0.000000 
[19]	train-mcc:0.000000	test-mcc:0.000000 
[20]	train-mcc:0.000000	test-mcc:0.000000 
[21]	train-mcc:0.000000	test-mcc:0.000000 
[22]	train-mcc:0.000000	test-mcc:0.000000 
[23]	train-mcc:0.000000	test-mcc:0.000000 
[24]	train-mcc:0.000000	test-mcc:0.000000 
[25]	train-mcc:0.000000	test-mcc:0.000000 
[26]	train-mcc:0.000000	test-mcc:0.000000 
[27]	train-mcc:0.000000	test-mcc:0.000000 
[28]	train-mcc:0.000000	test-mcc:0.000000 
[29]	train-mcc:0.000000	test-mcc:0.000000 
[30]	train-mcc:0.000000	test-mcc:0.000000 
[31]	train-mcc:0.000000	test-mcc:0.000000 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.245399


Time: Thu Nov 10 2016 08:32:55 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.2453986
Confusion matrix:
     truth
preds      0      1
    0 223560    299
    1  11814   1077
     truth
preds           0           1
    0 0.944287223 0.001262936
    1 0.049900739 0.004549102
Iteration 19 (base=0.001): MCC=0.2453986 | threshold=0.002307978



Iteration 19[4] on Thu Nov 10 2016 08:32:56 AM

depth=5, min_child_weight=49.36037, subsample=1, colsample_bytree=1, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.256810 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.000000 
[3]	train-mcc:0.000000	test-mcc:0.000000 
[4]	train-mcc:0.000000	test-mcc:0.001254 
[5]	train-mcc:0.000000	test-mcc:0.000000 
[6]	train-mcc:0.000000	test-mcc:0.006372 
[7]	train-mcc:0.000000	test-mcc:0.000666 
[8]	train-mcc:0.000000	test-mcc:0.003300 
[9]	train-mcc:0.000000	test-mcc:0.001432 
[10]	train-mcc:0.000000	test-mcc:0.004749 
[11]	train-mcc:0.000000	test-mcc:0.000000 
[12]	train-mcc:0.000000	test-mcc:0.004330 
[13]	train-mcc:0.000000	test-mcc:0.005256 
[14]	train-mcc:0.000000	test-mcc:0.000000 
[15]	train-mcc:0.000000	test-mcc:0.000000 
[16]	train-mcc:0.000000	test-mcc:0.000426 
[17]	train-mcc:0.000000	test-mcc:0.000000 
[18]	train-mcc:0.000000	test-mcc:0.000000 
[19]	train-mcc:0.000000	test-mcc:0.000000 
[20]	train-mcc:0.000000	test-mcc:0.000000 
[21]	train-mcc:0.000000	test-mcc:0.000000 
[22]	train-mcc:0.000000	test-mcc:0.000000 
[23]	train-mcc:0.000000	test-mcc:0.000000 
[24]	train-mcc:0.000000	test-mcc:0.000000 
[25]	train-mcc:0.000000	test-mcc:0.000000 
[26]	train-mcc:0.000000	test-mcc:0.000000 
[27]	train-mcc:0.000000	test-mcc:0.000000 
[28]	train-mcc:0.000000	test-mcc:0.000000 
[29]	train-mcc:0.000000	test-mcc:0.000000 
[30]	train-mcc:0.000000	test-mcc:0.000000 
[31]	train-mcc:0.000000	test-mcc:0.000000 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.256810


Time: Thu Nov 10 2016 08:33:37 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.2568097
Confusion matrix:
     truth
preds      0      1
    0 224922    315
    1  10452   1061
     truth
preds           0           1
    0 0.950040127 0.001330517
    1 0.044147835 0.004481521
Iteration 19 (base=0.001): MCC=0.2568097 | threshold=0.002266171



Iteration 19[5] on Thu Nov 10 2016 08:33:38 AM

depth=5, min_child_weight=49.36037, subsample=1, colsample_bytree=1, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.248339 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.000487 
[3]	train-mcc:0.000000	test-mcc:0.000000 
[4]	train-mcc:0.000000	test-mcc:0.000662 
[5]	train-mcc:0.000000	test-mcc:0.000029 
[6]	train-mcc:0.000000	test-mcc:0.003668 
[7]	train-mcc:0.000000	test-mcc:0.002570 
[8]	train-mcc:0.000000	test-mcc:0.003281 
[9]	train-mcc:0.000000	test-mcc:0.004387 
[10]	train-mcc:0.000000	test-mcc:0.000000 
[11]	train-mcc:0.000000	test-mcc:0.000000 
[12]	train-mcc:0.000000	test-mcc:0.000000 
[13]	train-mcc:0.000000	test-mcc:0.000930 
[14]	train-mcc:0.000000	test-mcc:0.000000 
[15]	train-mcc:0.000000	test-mcc:0.000000 
[16]	train-mcc:0.000000	test-mcc:0.000000 
[17]	train-mcc:0.000000	test-mcc:0.000000 
[18]	train-mcc:0.000000	test-mcc:0.000000 
[19]	train-mcc:0.000000	test-mcc:0.000000 
[20]	train-mcc:0.000000	test-mcc:0.000000 
[21]	train-mcc:0.000000	test-mcc:0.000000 
[22]	train-mcc:0.000000	test-mcc:0.000000 
[23]	train-mcc:0.000000	test-mcc:0.000000 
[24]	train-mcc:0.000000	test-mcc:0.000000 
[25]	train-mcc:0.000000	test-mcc:0.000000 
[26]	train-mcc:0.000000	test-mcc:0.000000 
[27]	train-mcc:0.000000	test-mcc:0.000000 
[28]	train-mcc:0.000000	test-mcc:0.000000 
[29]	train-mcc:0.000000	test-mcc:0.000000 
[30]	train-mcc:0.000000	test-mcc:0.000000 
[31]	train-mcc:0.000000	test-mcc:0.000000 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.248339


Time: Thu Nov 10 2016 08:34:21 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.2483391
Confusion matrix:
     truth
preds      0      1
    0 224058    309
    1  11316   1067
     truth
preds           0           1
    0 0.946390707 0.001305174
    1 0.047797254 0.004506864
Iteration 19 (base=0.001): MCC=0.2483391 | threshold=0.002802199


===




Iteration 20[1] on Thu Nov 10 2016 08:34:54 AM

depth=12, min_child_weight=50, subsample=0.988337, colsample_bytree=0.6766197, base_score=0.3880255
[1]	train-mcc:0.000000	test-mcc:0.473170 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480364 
[3]	train-mcc:0.000000	test-mcc:0.483224 
[4]	train-mcc:0.000000	test-mcc:0.482784 
[5]	train-mcc:0.000000	test-mcc:0.482321 
[6]	train-mcc:0.000000	test-mcc:0.481990 
[7]	train-mcc:0.000000	test-mcc:0.482321 
[8]	train-mcc:0.000000	test-mcc:0.481564 
[9]	train-mcc:0.000000	test-mcc:0.483803 
[10]	train-mcc:0.000000	test-mcc:0.482648 
[11]	train-mcc:0.000000	test-mcc:0.486055 
[12]	train-mcc:0.000000	test-mcc:0.486587 
[13]	train-mcc:0.000000	test-mcc:0.484469 
[14]	train-mcc:0.000000	test-mcc:0.484876 
[15]	train-mcc:0.000000	test-mcc:0.484937 
[16]	train-mcc:0.000000	test-mcc:0.482208 
[17]	train-mcc:0.000000	test-mcc:0.481606 
[18]	train-mcc:0.000000	test-mcc:0.481642 
[19]	train-mcc:0.000000	test-mcc:0.480827 
[20]	train-mcc:0.000000	test-mcc:0.481308 
[21]	train-mcc:0.000000	test-mcc:0.482550 
[22]	train-mcc:0.000000	test-mcc:0.481642 
[23]	train-mcc:0.000000	test-mcc:0.482208 
[24]	train-mcc:0.000000	test-mcc:0.482780 
[25]	train-mcc:0.000000	test-mcc:0.482286 
[26]	train-mcc:0.000000	test-mcc:0.480187 
[27]	train-mcc:0.000000	test-mcc:0.480082 
[28]	train-mcc:0.000000	test-mcc:0.478490 
[29]	train-mcc:0.000000	test-mcc:0.479240 
[30]	train-mcc:0.000000	test-mcc:0.478095 
[31]	train-mcc:0.000000	test-mcc:0.478332 
[32]	train-mcc:0.000000	test-mcc:0.478675 
[33]	train-mcc:0.000000	test-mcc:0.478651 
[34]	train-mcc:0.000000	test-mcc:0.479375 
[35]	train-mcc:0.000000	test-mcc:0.479375 
[36]	train-mcc:0.000000	test-mcc:0.477947 
[37]	train-mcc:0.000000	test-mcc:0.477619 
[38]	train-mcc:0.000000	test-mcc:0.478133 
[39]	train-mcc:0.000000	test-mcc:0.478133 
[40]	train-mcc:0.000000	test-mcc:0.478133 
[41]	train-mcc:0.000000	test-mcc:0.477936 
[42]	train-mcc:0.000000	test-mcc:0.478406 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.486587


Time: Thu Nov 10 2016 08:37:25 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4865867
Confusion matrix:
     truth
preds      0      1
    0 235300    986
    1     73    389
     truth
preds            0            1
    0 0.9938837920 0.0041647659
    1 0.0003083447 0.0016430973
Iteration 20 (base=0.3880255): MCC=0.4865867 | threshold=0.4927154



Iteration 20[2] on Thu Nov 10 2016 08:37:26 AM

depth=12, min_child_weight=50, subsample=0.988337, colsample_bytree=0.6766197, base_score=0.3880255
[1]	train-mcc:0.000000	test-mcc:0.465021 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476529 
[3]	train-mcc:0.000000	test-mcc:0.483177 
[4]	train-mcc:0.000000	test-mcc:0.485456 
[5]	train-mcc:0.000000	test-mcc:0.484037 
[6]	train-mcc:0.000000	test-mcc:0.483494 
[7]	train-mcc:0.000000	test-mcc:0.483736 
[8]	train-mcc:0.000000	test-mcc:0.483481 
[9]	train-mcc:0.000000	test-mcc:0.485036 
[10]	train-mcc:0.000000	test-mcc:0.483646 
[11]	train-mcc:0.000000	test-mcc:0.483835 
[12]	train-mcc:0.000000	test-mcc:0.481393 
[13]	train-mcc:0.000000	test-mcc:0.482693 
[14]	train-mcc:0.000000	test-mcc:0.483129 
[15]	train-mcc:0.000000	test-mcc:0.484272 
[16]	train-mcc:0.000000	test-mcc:0.485513 
[17]	train-mcc:0.000000	test-mcc:0.484488 
[18]	train-mcc:0.000000	test-mcc:0.483355 
[19]	train-mcc:0.000000	test-mcc:0.484798 
[20]	train-mcc:0.000000	test-mcc:0.486137 
[21]	train-mcc:0.000000	test-mcc:0.485737 
[22]	train-mcc:0.000000	test-mcc:0.484738 
[23]	train-mcc:0.000000	test-mcc:0.485681 
[24]	train-mcc:0.000000	test-mcc:0.484762 
[25]	train-mcc:0.000000	test-mcc:0.483615 
[26]	train-mcc:0.000000	test-mcc:0.484376 
[27]	train-mcc:0.000000	test-mcc:0.485019 
[28]	train-mcc:0.000000	test-mcc:0.483491 
[29]	train-mcc:0.000000	test-mcc:0.484595 
[30]	train-mcc:0.000000	test-mcc:0.484738 
[31]	train-mcc:0.000000	test-mcc:0.482638 
[32]	train-mcc:0.000000	test-mcc:0.481881 
[33]	train-mcc:0.000000	test-mcc:0.482331 
[34]	train-mcc:0.000000	test-mcc:0.482280 
[35]	train-mcc:0.000000	test-mcc:0.481789 
[36]	train-mcc:0.000000	test-mcc:0.483895 
[37]	train-mcc:0.000000	test-mcc:0.482792 
[38]	train-mcc:0.000000	test-mcc:0.483622 
[39]	train-mcc:0.000000	test-mcc:0.483785 
[40]	train-mcc:0.000000	test-mcc:0.483029 
[41]	train-mcc:0.000000	test-mcc:0.483029 
[42]	train-mcc:0.000000	test-mcc:0.483355 
[43]	train-mcc:0.000000	test-mcc:0.483304 
[44]	train-mcc:0.000000	test-mcc:0.483056 
[45]	train-mcc:0.000000	test-mcc:0.483056 
[46]	train-mcc:0.000000	test-mcc:0.483238 
[47]	train-mcc:0.000000	test-mcc:0.483297 
[48]	train-mcc:0.000000	test-mcc:0.484400 
[49]	train-mcc:0.000000	test-mcc:0.482593 
[50]	train-mcc:0.000000	test-mcc:0.483646 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.486137


Time: Thu Nov 10 2016 08:40:00 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.4861368
Confusion matrix:
     truth
preds      0      1
    0 235227    939
    1    146    437
     truth
preds            0            1
    0 0.9935712506 0.0039662258
    1 0.0006166869 0.0018458367
Iteration 20 (base=0.3880255): MCC=0.4861368 | threshold=0.3883324



Iteration 20[3] on Thu Nov 10 2016 08:40:01 AM

depth=12, min_child_weight=50, subsample=0.988337, colsample_bytree=0.6766197, base_score=0.3880255
[1]	train-mcc:0.000000	test-mcc:0.479126 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485496 
[3]	train-mcc:0.000000	test-mcc:0.484493 
[4]	train-mcc:0.000000	test-mcc:0.488056 
[5]	train-mcc:0.000000	test-mcc:0.486690 
[6]	train-mcc:0.000000	test-mcc:0.488117 
[7]	train-mcc:0.000000	test-mcc:0.487361 
[8]	train-mcc:0.000000	test-mcc:0.489952 
[9]	train-mcc:0.000000	test-mcc:0.490431 
[10]	train-mcc:0.000000	test-mcc:0.489759 
[11]	train-mcc:0.000000	test-mcc:0.490182 
[12]	train-mcc:0.000000	test-mcc:0.488679 
[13]	train-mcc:0.000000	test-mcc:0.489679 
[14]	train-mcc:0.000000	test-mcc:0.492036 
[15]	train-mcc:0.000000	test-mcc:0.494508 
[16]	train-mcc:0.000000	test-mcc:0.495818 
[17]	train-mcc:0.000000	test-mcc:0.497472 
[18]	train-mcc:0.000000	test-mcc:0.495116 
[19]	train-mcc:0.000000	test-mcc:0.492772 
[20]	train-mcc:0.000000	test-mcc:0.496383 
[21]	train-mcc:0.000000	test-mcc:0.495678 
[22]	train-mcc:0.000000	test-mcc:0.493709 
[23]	train-mcc:0.000000	test-mcc:0.493971 
[24]	train-mcc:0.000000	test-mcc:0.492772 
[25]	train-mcc:0.000000	test-mcc:0.491914 
[26]	train-mcc:0.000000	test-mcc:0.492073 
[27]	train-mcc:0.000000	test-mcc:0.491168 
[28]	train-mcc:0.000000	test-mcc:0.492464 
[29]	train-mcc:0.000000	test-mcc:0.491573 
[30]	train-mcc:0.000000	test-mcc:0.493333 
[31]	train-mcc:0.000000	test-mcc:0.492140 
[32]	train-mcc:0.000000	test-mcc:0.492772 
[33]	train-mcc:0.000000	test-mcc:0.492628 
[34]	train-mcc:0.000000	test-mcc:0.492850 
[35]	train-mcc:0.000000	test-mcc:0.492250 
[36]	train-mcc:0.000000	test-mcc:0.492036 
[37]	train-mcc:0.000000	test-mcc:0.492850 
[38]	train-mcc:0.000000	test-mcc:0.491430 
[39]	train-mcc:0.000000	test-mcc:0.491595 
[40]	train-mcc:0.000000	test-mcc:0.491041 
[41]	train-mcc:0.000000	test-mcc:0.491389 
[42]	train-mcc:0.000000	test-mcc:0.490110 
[43]	train-mcc:0.000000	test-mcc:0.490261 
[44]	train-mcc:0.000000	test-mcc:0.492299 
[45]	train-mcc:0.000000	test-mcc:0.493005 
[46]	train-mcc:0.000000	test-mcc:0.493005 
[47]	train-mcc:0.000000	test-mcc:0.494182 
Stopping. Best iteration:
[17]	train-mcc:0.000000	test-mcc:0.497472


Time: Thu Nov 10 2016 08:42:24 AM
For 0017 rounds: train_mcc: 0 - test_mcc: 0.4974715
Confusion matrix:
     truth
preds      0      1
    0 235257    941
    1    117    435
     truth
preds            0            1
    0 0.9936937698 0.0039746568
    1 0.0004941922 0.0018373812
Iteration 20 (base=0.3880255): MCC=0.4974715 | threshold=0.3876916



Iteration 20[4] on Thu Nov 10 2016 08:42:26 AM

depth=12, min_child_weight=50, subsample=0.988337, colsample_bytree=0.6766197, base_score=0.3880255
[1]	train-mcc:0.000000	test-mcc:0.477264 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480505 
[3]	train-mcc:0.000000	test-mcc:0.482776 
[4]	train-mcc:0.000000	test-mcc:0.484648 
[5]	train-mcc:0.000000	test-mcc:0.484310 
[6]	train-mcc:0.000000	test-mcc:0.486517 
[7]	train-mcc:0.000000	test-mcc:0.484467 
[8]	train-mcc:0.000000	test-mcc:0.486601 
[9]	train-mcc:0.000000	test-mcc:0.485155 
[10]	train-mcc:0.000000	test-mcc:0.484360 
[11]	train-mcc:0.000000	test-mcc:0.485740 
[12]	train-mcc:0.000000	test-mcc:0.486622 
[13]	train-mcc:0.000000	test-mcc:0.485699 
[14]	train-mcc:0.000000	test-mcc:0.485835 
[15]	train-mcc:0.000000	test-mcc:0.485415 
[16]	train-mcc:0.000000	test-mcc:0.487003 
[17]	train-mcc:0.000000	test-mcc:0.485438 
[18]	train-mcc:0.000000	test-mcc:0.485330 
[19]	train-mcc:0.000000	test-mcc:0.484885 
[20]	train-mcc:0.000000	test-mcc:0.485016 
[21]	train-mcc:0.000000	test-mcc:0.485016 
[22]	train-mcc:0.000000	test-mcc:0.483781 
[23]	train-mcc:0.000000	test-mcc:0.482792 
[24]	train-mcc:0.000000	test-mcc:0.481866 
[25]	train-mcc:0.000000	test-mcc:0.482394 
[26]	train-mcc:0.000000	test-mcc:0.482010 
[27]	train-mcc:0.000000	test-mcc:0.483585 
[28]	train-mcc:0.000000	test-mcc:0.483793 
[29]	train-mcc:0.000000	test-mcc:0.482566 
[30]	train-mcc:0.000000	test-mcc:0.481914 
[31]	train-mcc:0.000000	test-mcc:0.482333 
[32]	train-mcc:0.000000	test-mcc:0.482333 
[33]	train-mcc:0.000000	test-mcc:0.481957 
[34]	train-mcc:0.000000	test-mcc:0.483786 
[35]	train-mcc:0.000000	test-mcc:0.483474 
[36]	train-mcc:0.000000	test-mcc:0.481853 
[37]	train-mcc:0.000000	test-mcc:0.481292 
[38]	train-mcc:0.000000	test-mcc:0.480916 
[39]	train-mcc:0.000000	test-mcc:0.482537 
[40]	train-mcc:0.000000	test-mcc:0.482973 
[41]	train-mcc:0.000000	test-mcc:0.482116 
[42]	train-mcc:0.000000	test-mcc:0.482202 
[43]	train-mcc:0.000000	test-mcc:0.481122 
[44]	train-mcc:0.000000	test-mcc:0.480825 
[45]	train-mcc:0.000000	test-mcc:0.480586 
[46]	train-mcc:0.000000	test-mcc:0.480505 
Stopping. Best iteration:
[16]	train-mcc:0.000000	test-mcc:0.487003


Time: Thu Nov 10 2016 08:44:46 AM
For 0016 rounds: train_mcc: 0 - test_mcc: 0.4870031
Confusion matrix:
     truth
preds      0      1
    0 235215    930
    1    159    446
     truth
preds            0            1
    0 0.9935163675 0.0039281943
    1 0.0006715945 0.0018838437
Iteration 20 (base=0.3880255): MCC=0.4870031 | threshold=0.3317346



Iteration 20[5] on Thu Nov 10 2016 08:44:48 AM

depth=12, min_child_weight=50, subsample=0.988337, colsample_bytree=0.6766197, base_score=0.3880255
[1]	train-mcc:0.000000	test-mcc:0.486687 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484493 
[3]	train-mcc:0.000000	test-mcc:0.483636 
[4]	train-mcc:0.000000	test-mcc:0.487003 
[5]	train-mcc:0.000000	test-mcc:0.486633 
[6]	train-mcc:0.000000	test-mcc:0.486132 
[7]	train-mcc:0.000000	test-mcc:0.488219 
[8]	train-mcc:0.000000	test-mcc:0.485853 
[9]	train-mcc:0.000000	test-mcc:0.487244 
[10]	train-mcc:0.000000	test-mcc:0.490198 
[11]	train-mcc:0.000000	test-mcc:0.490651 
[12]	train-mcc:0.000000	test-mcc:0.491121 
[13]	train-mcc:0.000000	test-mcc:0.489986 
[14]	train-mcc:0.000000	test-mcc:0.489039 
[15]	train-mcc:0.000000	test-mcc:0.488963 
[16]	train-mcc:0.000000	test-mcc:0.487963 
[17]	train-mcc:0.000000	test-mcc:0.487464 
[18]	train-mcc:0.000000	test-mcc:0.487744 
[19]	train-mcc:0.000000	test-mcc:0.489134 
[20]	train-mcc:0.000000	test-mcc:0.487902 
[21]	train-mcc:0.000000	test-mcc:0.487538 
[22]	train-mcc:0.000000	test-mcc:0.484956 
[23]	train-mcc:0.000000	test-mcc:0.487351 
[24]	train-mcc:0.000000	test-mcc:0.489241 
[25]	train-mcc:0.000000	test-mcc:0.490184 
[26]	train-mcc:0.000000	test-mcc:0.488963 
[27]	train-mcc:0.000000	test-mcc:0.489474 
[28]	train-mcc:0.000000	test-mcc:0.488286 
[29]	train-mcc:0.000000	test-mcc:0.487604 
[30]	train-mcc:0.000000	test-mcc:0.489240 
[31]	train-mcc:0.000000	test-mcc:0.487694 
[32]	train-mcc:0.000000	test-mcc:0.487647 
[33]	train-mcc:0.000000	test-mcc:0.486549 
[34]	train-mcc:0.000000	test-mcc:0.486732 
[35]	train-mcc:0.000000	test-mcc:0.486215 
[36]	train-mcc:0.000000	test-mcc:0.486188 
[37]	train-mcc:0.000000	test-mcc:0.487149 
[38]	train-mcc:0.000000	test-mcc:0.487523 
[39]	train-mcc:0.000000	test-mcc:0.485877 
[40]	train-mcc:0.000000	test-mcc:0.487122 
[41]	train-mcc:0.000000	test-mcc:0.487295 
[42]	train-mcc:0.000000	test-mcc:0.487295 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.491121


Time: Thu Nov 10 2016 08:47:02 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.4911214
Confusion matrix:
     truth
preds      0      1
    0 235266    956
    1    108    420
     truth
preds            0            1
    0 0.9937317846 0.0040380148
    1 0.0004561774 0.0017740232
Iteration 20 (base=0.3880255): MCC=0.4911214 | threshold=0.3972269


===




Iteration 21[1] on Thu Nov 10 2016 08:47:36 AM

depth=11, min_child_weight=50, subsample=0.9265141, colsample_bytree=0.5281251, base_score=0.2786187
[1]	train-mcc:0.000000	test-mcc:0.470832 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481085 
[3]	train-mcc:0.000000	test-mcc:0.482335 
[4]	train-mcc:0.000000	test-mcc:0.482259 
[5]	train-mcc:0.000000	test-mcc:0.482409 
[6]	train-mcc:0.000000	test-mcc:0.484175 
[7]	train-mcc:0.000000	test-mcc:0.482745 
[8]	train-mcc:0.000000	test-mcc:0.481082 
[9]	train-mcc:0.000000	test-mcc:0.480185 
[10]	train-mcc:0.000000	test-mcc:0.480543 
[11]	train-mcc:0.000000	test-mcc:0.478117 
[12]	train-mcc:0.000000	test-mcc:0.476653 
[13]	train-mcc:0.000000	test-mcc:0.478414 
[14]	train-mcc:0.000000	test-mcc:0.478612 
[15]	train-mcc:0.000000	test-mcc:0.478200 
[16]	train-mcc:0.000000	test-mcc:0.476653 
[17]	train-mcc:0.000000	test-mcc:0.477936 
[18]	train-mcc:0.000000	test-mcc:0.477196 
[19]	train-mcc:0.000000	test-mcc:0.476762 
[20]	train-mcc:0.000000	test-mcc:0.476420 
[21]	train-mcc:0.000000	test-mcc:0.476786 
[22]	train-mcc:0.000000	test-mcc:0.477931 
[23]	train-mcc:0.000000	test-mcc:0.477344 
[24]	train-mcc:0.000000	test-mcc:0.477725 
[25]	train-mcc:0.000000	test-mcc:0.475251 
[26]	train-mcc:0.000000	test-mcc:0.475397 
[27]	train-mcc:0.000000	test-mcc:0.474378 
[28]	train-mcc:0.000000	test-mcc:0.475369 
[29]	train-mcc:0.000000	test-mcc:0.474315 
[30]	train-mcc:0.000000	test-mcc:0.472509 
[31]	train-mcc:0.000000	test-mcc:0.472441 
[32]	train-mcc:0.000000	test-mcc:0.472859 
[33]	train-mcc:0.000000	test-mcc:0.472591 
[34]	train-mcc:0.000000	test-mcc:0.471480 
[35]	train-mcc:0.000000	test-mcc:0.471415 
[36]	train-mcc:0.000000	test-mcc:0.470737 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.484175


Time: Thu Nov 10 2016 08:49:12 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4841748
Confusion matrix:
     truth
preds      0      1
    0 235305    993
    1     68    382
     truth
preds            0            1
    0 0.9939049116 0.0041943332
    1 0.0002872252 0.0016135300
Iteration 21 (base=0.2786187): MCC=0.4841748 | threshold=0.4586814



Iteration 21[2] on Thu Nov 10 2016 08:49:13 AM

depth=11, min_child_weight=50, subsample=0.9265141, colsample_bytree=0.5281251, base_score=0.2786187
[1]	train-mcc:0.000000	test-mcc:0.469429 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477142 
[3]	train-mcc:0.000000	test-mcc:0.483029 
[4]	train-mcc:0.000000	test-mcc:0.482720 
[5]	train-mcc:0.000000	test-mcc:0.482577 
[6]	train-mcc:0.000000	test-mcc:0.483373 
[7]	train-mcc:0.000000	test-mcc:0.483907 
[8]	train-mcc:0.000000	test-mcc:0.485767 
[9]	train-mcc:0.000000	test-mcc:0.484037 
[10]	train-mcc:0.000000	test-mcc:0.480985 
[11]	train-mcc:0.000000	test-mcc:0.481090 
[12]	train-mcc:0.000000	test-mcc:0.480410 
[13]	train-mcc:0.000000	test-mcc:0.482145 
[14]	train-mcc:0.000000	test-mcc:0.480796 
[15]	train-mcc:0.000000	test-mcc:0.483417 
[16]	train-mcc:0.000000	test-mcc:0.482693 
[17]	train-mcc:0.000000	test-mcc:0.482321 
[18]	train-mcc:0.000000	test-mcc:0.483759 
[19]	train-mcc:0.000000	test-mcc:0.480966 
[20]	train-mcc:0.000000	test-mcc:0.481168 
[21]	train-mcc:0.000000	test-mcc:0.480776 
[22]	train-mcc:0.000000	test-mcc:0.481262 
[23]	train-mcc:0.000000	test-mcc:0.482230 
[24]	train-mcc:0.000000	test-mcc:0.481299 
[25]	train-mcc:0.000000	test-mcc:0.481835 
[26]	train-mcc:0.000000	test-mcc:0.484358 
[27]	train-mcc:0.000000	test-mcc:0.483811 
[28]	train-mcc:0.000000	test-mcc:0.483038 
[29]	train-mcc:0.000000	test-mcc:0.483361 
[30]	train-mcc:0.000000	test-mcc:0.483454 
[31]	train-mcc:0.000000	test-mcc:0.483836 
[32]	train-mcc:0.000000	test-mcc:0.483836 
[33]	train-mcc:0.000000	test-mcc:0.482373 
[34]	train-mcc:0.000000	test-mcc:0.483105 
[35]	train-mcc:0.000000	test-mcc:0.483566 
[36]	train-mcc:0.000000	test-mcc:0.483622 
[37]	train-mcc:0.000000	test-mcc:0.484189 
[38]	train-mcc:0.000000	test-mcc:0.485019 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.485767


Time: Thu Nov 10 2016 08:50:41 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4857673
Confusion matrix:
     truth
preds      0      1
    0 235244    950
    1    129    426
     truth
preds            0            1
    0 0.9936430566 0.0040126885
    1 0.0005448809 0.0017993740
Iteration 21 (base=0.2786187): MCC=0.4857673 | threshold=0.3672178



Iteration 21[3] on Thu Nov 10 2016 08:50:42 AM

depth=11, min_child_weight=50, subsample=0.9265141, colsample_bytree=0.5281251, base_score=0.2786187
[1]	train-mcc:0.000000	test-mcc:0.481444 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.489059 
[3]	train-mcc:0.000000	test-mcc:0.487454 
[4]	train-mcc:0.000000	test-mcc:0.494384 
[5]	train-mcc:0.000000	test-mcc:0.494141 
[6]	train-mcc:0.000000	test-mcc:0.493477 
[7]	train-mcc:0.000000	test-mcc:0.491804 
[8]	train-mcc:0.000000	test-mcc:0.491982 
[9]	train-mcc:0.000000	test-mcc:0.491877 
[10]	train-mcc:0.000000	test-mcc:0.493163 
[11]	train-mcc:0.000000	test-mcc:0.491823 
[12]	train-mcc:0.000000	test-mcc:0.493721 
[13]	train-mcc:0.000000	test-mcc:0.494102 
[14]	train-mcc:0.000000	test-mcc:0.494382 
[15]	train-mcc:0.000000	test-mcc:0.494487 
[16]	train-mcc:0.000000	test-mcc:0.494002 
[17]	train-mcc:0.000000	test-mcc:0.496224 
[18]	train-mcc:0.000000	test-mcc:0.494382 
[19]	train-mcc:0.000000	test-mcc:0.493942 
[20]	train-mcc:0.000000	test-mcc:0.492534 
[21]	train-mcc:0.000000	test-mcc:0.492855 
[22]	train-mcc:0.000000	test-mcc:0.493029 
[23]	train-mcc:0.000000	test-mcc:0.493733 
[24]	train-mcc:0.000000	test-mcc:0.495380 
[25]	train-mcc:0.000000	test-mcc:0.495838 
[26]	train-mcc:0.000000	test-mcc:0.493497 
[27]	train-mcc:0.000000	test-mcc:0.493610 
[28]	train-mcc:0.000000	test-mcc:0.494112 
[29]	train-mcc:0.000000	test-mcc:0.495503 
[30]	train-mcc:0.000000	test-mcc:0.495254 
[31]	train-mcc:0.000000	test-mcc:0.495700 
[32]	train-mcc:0.000000	test-mcc:0.496148 
[33]	train-mcc:0.000000	test-mcc:0.494225 
[34]	train-mcc:0.000000	test-mcc:0.493810 
[35]	train-mcc:0.000000	test-mcc:0.491971 
[36]	train-mcc:0.000000	test-mcc:0.491133 
[37]	train-mcc:0.000000	test-mcc:0.491905 
[38]	train-mcc:0.000000	test-mcc:0.493292 
[39]	train-mcc:0.000000	test-mcc:0.493722 
[40]	train-mcc:0.000000	test-mcc:0.494616 
[41]	train-mcc:0.000000	test-mcc:0.495710 
[42]	train-mcc:0.000000	test-mcc:0.495277 
[43]	train-mcc:0.000000	test-mcc:0.495106 
[44]	train-mcc:0.000000	test-mcc:0.493985 
[45]	train-mcc:0.000000	test-mcc:0.493985 
[46]	train-mcc:0.000000	test-mcc:0.493660 
[47]	train-mcc:0.000000	test-mcc:0.494086 
Stopping. Best iteration:
[17]	train-mcc:0.000000	test-mcc:0.496224


Time: Thu Nov 10 2016 08:52:27 AM
For 0017 rounds: train_mcc: 0 - test_mcc: 0.4962239
Confusion matrix:
     truth
preds      0      1
    0 235281    959
    1     93    417
     truth
preds            0            1
    0 0.9937951426 0.0040506864
    1 0.0003928194 0.0017613516
Iteration 21 (base=0.2786187): MCC=0.4962239 | threshold=0.4211722



Iteration 21[4] on Thu Nov 10 2016 08:52:29 AM

depth=11, min_child_weight=50, subsample=0.9265141, colsample_bytree=0.5281251, base_score=0.2786187
[1]	train-mcc:0.000000	test-mcc:0.488686 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485731 
[3]	train-mcc:0.000000	test-mcc:0.478223 
[4]	train-mcc:0.000000	test-mcc:0.479688 
[5]	train-mcc:0.000000	test-mcc:0.483269 
[6]	train-mcc:0.000000	test-mcc:0.479920 
[7]	train-mcc:0.000000	test-mcc:0.480229 
[8]	train-mcc:0.000000	test-mcc:0.480272 
[9]	train-mcc:0.000000	test-mcc:0.479920 
[10]	train-mcc:0.000000	test-mcc:0.480817 
[11]	train-mcc:0.000000	test-mcc:0.480520 
[12]	train-mcc:0.000000	test-mcc:0.478765 
[13]	train-mcc:0.000000	test-mcc:0.480157 
[14]	train-mcc:0.000000	test-mcc:0.479478 
[15]	train-mcc:0.000000	test-mcc:0.481085 
[16]	train-mcc:0.000000	test-mcc:0.481034 
[17]	train-mcc:0.000000	test-mcc:0.481407 
[18]	train-mcc:0.000000	test-mcc:0.481407 
[19]	train-mcc:0.000000	test-mcc:0.481278 
[20]	train-mcc:0.000000	test-mcc:0.482720 
[21]	train-mcc:0.000000	test-mcc:0.482408 
[22]	train-mcc:0.000000	test-mcc:0.481407 
[23]	train-mcc:0.000000	test-mcc:0.481962 
[24]	train-mcc:0.000000	test-mcc:0.480575 
[25]	train-mcc:0.000000	test-mcc:0.480908 
[26]	train-mcc:0.000000	test-mcc:0.482124 
[27]	train-mcc:0.000000	test-mcc:0.481908 
[28]	train-mcc:0.000000	test-mcc:0.482031 
[29]	train-mcc:0.000000	test-mcc:0.481018 
[30]	train-mcc:0.000000	test-mcc:0.479938 
[31]	train-mcc:0.000000	test-mcc:0.478760 
Stopping. Best iteration:
[1]	train-mcc:0.000000	test-mcc:0.488686


Time: Thu Nov 10 2016 08:53:40 AM
For 0001 rounds: train_mcc: 0 - test_mcc: 0.4886864
Confusion matrix:
     truth
preds      0      1
    0 235195    916
    1    179    460
     truth
preds            0            1
    0 0.9934318902 0.0038690602
    1 0.0007560718 0.0019429778
Iteration 21 (base=0.2786187): MCC=0.4886864 | threshold=0.2857661



Iteration 21[5] on Thu Nov 10 2016 08:53:41 AM

depth=11, min_child_weight=50, subsample=0.9265141, colsample_bytree=0.5281251, base_score=0.2786187
[1]	train-mcc:0.000000	test-mcc:0.487744 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.493281 
[3]	train-mcc:0.000000	test-mcc:0.495130 
[4]	train-mcc:0.000000	test-mcc:0.490224 
[5]	train-mcc:0.000000	test-mcc:0.487963 
[6]	train-mcc:0.000000	test-mcc:0.488925 
[7]	train-mcc:0.000000	test-mcc:0.490169 
[8]	train-mcc:0.000000	test-mcc:0.490587 
[9]	train-mcc:0.000000	test-mcc:0.494883 
[10]	train-mcc:0.000000	test-mcc:0.491828 
[11]	train-mcc:0.000000	test-mcc:0.491174 
[12]	train-mcc:0.000000	test-mcc:0.490177 
[13]	train-mcc:0.000000	test-mcc:0.489471 
[14]	train-mcc:0.000000	test-mcc:0.487454 
[15]	train-mcc:0.000000	test-mcc:0.487605 
[16]	train-mcc:0.000000	test-mcc:0.485909 
[17]	train-mcc:0.000000	test-mcc:0.487815 
[18]	train-mcc:0.000000	test-mcc:0.487121 
[19]	train-mcc:0.000000	test-mcc:0.488055 
[20]	train-mcc:0.000000	test-mcc:0.487280 
[21]	train-mcc:0.000000	test-mcc:0.487229 
[22]	train-mcc:0.000000	test-mcc:0.486228 
[23]	train-mcc:0.000000	test-mcc:0.486030 
[24]	train-mcc:0.000000	test-mcc:0.486525 
[25]	train-mcc:0.000000	test-mcc:0.486250 
[26]	train-mcc:0.000000	test-mcc:0.486353 
[27]	train-mcc:0.000000	test-mcc:0.487169 
[28]	train-mcc:0.000000	test-mcc:0.487695 
[29]	train-mcc:0.000000	test-mcc:0.488491 
[30]	train-mcc:0.000000	test-mcc:0.487862 
[31]	train-mcc:0.000000	test-mcc:0.487862 
[32]	train-mcc:0.000000	test-mcc:0.486030 
[33]	train-mcc:0.000000	test-mcc:0.486397 
Stopping. Best iteration:
[3]	train-mcc:0.000000	test-mcc:0.495130


Time: Thu Nov 10 2016 08:55:01 AM
For 0003 rounds: train_mcc: 0 - test_mcc: 0.4951301
Confusion matrix:
     truth
preds      0      1
    0 235270    953
    1    104    423
     truth
preds            0            1
    0 0.9937486800 0.0040253432
    1 0.0004392819 0.0017866948
Iteration 21 (base=0.2786187): MCC=0.4951301 | threshold=0.3336004


===




Iteration 22[1] on Thu Nov 10 2016 08:55:33 AM

depth=7, min_child_weight=49.68375, subsample=0.9289565, colsample_bytree=0.821596, base_score=0.2659555
[1]	train-mcc:0.000000	test-mcc:0.475102 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480232 
[3]	train-mcc:0.000000	test-mcc:0.481333 
[4]	train-mcc:0.000000	test-mcc:0.481715 
[5]	train-mcc:0.000000	test-mcc:0.484453 
[6]	train-mcc:0.000000	test-mcc:0.483992 
[7]	train-mcc:0.000000	test-mcc:0.485267 
[8]	train-mcc:0.000000	test-mcc:0.484424 
[9]	train-mcc:0.000000	test-mcc:0.484536 
[10]	train-mcc:0.000000	test-mcc:0.481875 
[11]	train-mcc:0.000000	test-mcc:0.482077 
[12]	train-mcc:0.000000	test-mcc:0.482902 
[13]	train-mcc:0.000000	test-mcc:0.481548 
[14]	train-mcc:0.000000	test-mcc:0.481548 
[15]	train-mcc:0.000000	test-mcc:0.481082 
[16]	train-mcc:0.000000	test-mcc:0.480694 
[17]	train-mcc:0.000000	test-mcc:0.479765 
[18]	train-mcc:0.000000	test-mcc:0.479765 
[19]	train-mcc:0.000000	test-mcc:0.479219 
[20]	train-mcc:0.000000	test-mcc:0.479765 
[21]	train-mcc:0.000000	test-mcc:0.479414 
[22]	train-mcc:0.000000	test-mcc:0.477770 
[23]	train-mcc:0.000000	test-mcc:0.478377 
[24]	train-mcc:0.000000	test-mcc:0.479007 
[25]	train-mcc:0.000000	test-mcc:0.477503 
[26]	train-mcc:0.000000	test-mcc:0.478287 
[27]	train-mcc:0.000000	test-mcc:0.479622 
[28]	train-mcc:0.000000	test-mcc:0.478644 
[29]	train-mcc:0.000000	test-mcc:0.479133 
[30]	train-mcc:0.000000	test-mcc:0.478644 
[31]	train-mcc:0.000000	test-mcc:0.478644 
[32]	train-mcc:0.000000	test-mcc:0.478644 
[33]	train-mcc:0.000000	test-mcc:0.479371 
[34]	train-mcc:0.000000	test-mcc:0.479371 
[35]	train-mcc:0.000000	test-mcc:0.478502 
[36]	train-mcc:0.000000	test-mcc:0.478502 
[37]	train-mcc:0.000000	test-mcc:0.477672 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.485267


Time: Thu Nov 10 2016 08:57:09 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4852672
Confusion matrix:
     truth
preds      0      1
    0 235307    993
    1     66    382
     truth
preds            0            1
    0 0.9939133594 0.0041943332
    1 0.0002787774 0.0016135300
Iteration 22 (base=0.2659555): MCC=0.4852672 | threshold=0.4552653



Iteration 22[2] on Thu Nov 10 2016 08:57:10 AM

depth=7, min_child_weight=49.68375, subsample=0.9289565, colsample_bytree=0.821596, base_score=0.2659555
[1]	train-mcc:0.000000	test-mcc:0.473567 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.479860 
[3]	train-mcc:0.000000	test-mcc:0.482324 
[4]	train-mcc:0.000000	test-mcc:0.486154 
[5]	train-mcc:0.000000	test-mcc:0.483340 
[6]	train-mcc:0.000000	test-mcc:0.482327 
[7]	train-mcc:0.000000	test-mcc:0.480694 
[8]	train-mcc:0.000000	test-mcc:0.482081 
[9]	train-mcc:0.000000	test-mcc:0.482111 
[10]	train-mcc:0.000000	test-mcc:0.483325 
[11]	train-mcc:0.000000	test-mcc:0.483096 
[12]	train-mcc:0.000000	test-mcc:0.484485 
[13]	train-mcc:0.000000	test-mcc:0.483096 
[14]	train-mcc:0.000000	test-mcc:0.483325 
[15]	train-mcc:0.000000	test-mcc:0.483842 
[16]	train-mcc:0.000000	test-mcc:0.483842 
[17]	train-mcc:0.000000	test-mcc:0.485208 
[18]	train-mcc:0.000000	test-mcc:0.484954 
[19]	train-mcc:0.000000	test-mcc:0.484954 
[20]	train-mcc:0.000000	test-mcc:0.484954 
[21]	train-mcc:0.000000	test-mcc:0.484932 
[22]	train-mcc:0.000000	test-mcc:0.486591 
[23]	train-mcc:0.000000	test-mcc:0.487834 
[24]	train-mcc:0.000000	test-mcc:0.487121 
[25]	train-mcc:0.000000	test-mcc:0.488181 
[26]	train-mcc:0.000000	test-mcc:0.488566 
[27]	train-mcc:0.000000	test-mcc:0.488105 
[28]	train-mcc:0.000000	test-mcc:0.488105 
[29]	train-mcc:0.000000	test-mcc:0.487815 
[30]	train-mcc:0.000000	test-mcc:0.489033 
[31]	train-mcc:0.000000	test-mcc:0.487639 
[32]	train-mcc:0.000000	test-mcc:0.488354 
[33]	train-mcc:0.000000	test-mcc:0.488402 
[34]	train-mcc:0.000000	test-mcc:0.488402 
[35]	train-mcc:0.000000	test-mcc:0.488402 
[36]	train-mcc:0.000000	test-mcc:0.487907 
[37]	train-mcc:0.000000	test-mcc:0.487907 
[38]	train-mcc:0.000000	test-mcc:0.487907 
[39]	train-mcc:0.000000	test-mcc:0.487907 
[40]	train-mcc:0.000000	test-mcc:0.487907 
[41]	train-mcc:0.000000	test-mcc:0.485479 
[42]	train-mcc:0.000000	test-mcc:0.484554 
[43]	train-mcc:0.000000	test-mcc:0.485565 
[44]	train-mcc:0.000000	test-mcc:0.486730 
[45]	train-mcc:0.000000	test-mcc:0.486478 
[46]	train-mcc:0.000000	test-mcc:0.485880 
[47]	train-mcc:0.000000	test-mcc:0.485880 
[48]	train-mcc:0.000000	test-mcc:0.484205 
[49]	train-mcc:0.000000	test-mcc:0.485208 
[50]	train-mcc:0.000000	test-mcc:0.485678 
[51]	train-mcc:0.000000	test-mcc:0.485208 
[52]	train-mcc:0.000000	test-mcc:0.485678 
[53]	train-mcc:0.000000	test-mcc:0.484506 
[54]	train-mcc:0.000000	test-mcc:0.485431 
[55]	train-mcc:0.000000	test-mcc:0.484715 
[56]	train-mcc:0.000000	test-mcc:0.483763 
[57]	train-mcc:0.000000	test-mcc:0.485033 
[58]	train-mcc:0.000000	test-mcc:0.485195 
[59]	train-mcc:0.000000	test-mcc:0.484024 
[60]	train-mcc:0.000000	test-mcc:0.485486 
Stopping. Best iteration:
[30]	train-mcc:0.000000	test-mcc:0.489033


Time: Thu Nov 10 2016 08:59:30 AM
For 0030 rounds: train_mcc: 0 - test_mcc: 0.4890329
Confusion matrix:
     truth
preds      0      1
    0 235274    965
    1     99    411
     truth
preds            0            1
    0 0.9937697731 0.0040760468
    1 0.0004181644 0.0017360158
Iteration 22 (base=0.2659555): MCC=0.4890329 | threshold=0.41983



Iteration 22[3] on Thu Nov 10 2016 08:59:31 AM

depth=7, min_child_weight=49.68375, subsample=0.9289565, colsample_bytree=0.821596, base_score=0.2659555
[1]	train-mcc:0.000000	test-mcc:0.481444 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488579 
[3]	train-mcc:0.000000	test-mcc:0.492347 
[4]	train-mcc:0.000000	test-mcc:0.490172 
[5]	train-mcc:0.000000	test-mcc:0.491174 
[6]	train-mcc:0.000000	test-mcc:0.493543 
[7]	train-mcc:0.000000	test-mcc:0.493959 
[8]	train-mcc:0.000000	test-mcc:0.495366 
[9]	train-mcc:0.000000	test-mcc:0.496175 
[10]	train-mcc:0.000000	test-mcc:0.496332 
[11]	train-mcc:0.000000	test-mcc:0.495879 
[12]	train-mcc:0.000000	test-mcc:0.495414 
[13]	train-mcc:0.000000	test-mcc:0.497496 
[14]	train-mcc:0.000000	test-mcc:0.497103 
[15]	train-mcc:0.000000	test-mcc:0.496143 
[16]	train-mcc:0.000000	test-mcc:0.496589 
[17]	train-mcc:0.000000	test-mcc:0.496277 
[18]	train-mcc:0.000000	test-mcc:0.496477 
[19]	train-mcc:0.000000	test-mcc:0.497265 
[20]	train-mcc:0.000000	test-mcc:0.499112 
[21]	train-mcc:0.000000	test-mcc:0.497999 
[22]	train-mcc:0.000000	test-mcc:0.497999 
[23]	train-mcc:0.000000	test-mcc:0.498447 
[24]	train-mcc:0.000000	test-mcc:0.498667 
[25]	train-mcc:0.000000	test-mcc:0.498447 
[26]	train-mcc:0.000000	test-mcc:0.499588 
[27]	train-mcc:0.000000	test-mcc:0.500066 
[28]	train-mcc:0.000000	test-mcc:0.498296 
[29]	train-mcc:0.000000	test-mcc:0.498520 
[30]	train-mcc:0.000000	test-mcc:0.498326 
[31]	train-mcc:0.000000	test-mcc:0.498843 
[32]	train-mcc:0.000000	test-mcc:0.498928 
[33]	train-mcc:0.000000	test-mcc:0.499034 
[34]	train-mcc:0.000000	test-mcc:0.498401 
[35]	train-mcc:0.000000	test-mcc:0.498923 
[36]	train-mcc:0.000000	test-mcc:0.499821 
[37]	train-mcc:0.000000	test-mcc:0.499821 
[38]	train-mcc:0.000000	test-mcc:0.498029 
[39]	train-mcc:0.000000	test-mcc:0.497265 
[40]	train-mcc:0.000000	test-mcc:0.497525 
[41]	train-mcc:0.000000	test-mcc:0.498390 
[42]	train-mcc:0.000000	test-mcc:0.498887 
[43]	train-mcc:0.000000	test-mcc:0.498436 
[44]	train-mcc:0.000000	test-mcc:0.499129 
[45]	train-mcc:0.000000	test-mcc:0.498436 
[46]	train-mcc:0.000000	test-mcc:0.498617 
[47]	train-mcc:0.000000	test-mcc:0.498390 
[48]	train-mcc:0.000000	test-mcc:0.498189 
[49]	train-mcc:0.000000	test-mcc:0.502121 
[50]	train-mcc:0.000000	test-mcc:0.501900 
[51]	train-mcc:0.000000	test-mcc:0.500730 
[52]	train-mcc:0.000000	test-mcc:0.499367 
[53]	train-mcc:0.000000	test-mcc:0.499367 
[54]	train-mcc:0.000000	test-mcc:0.499147 
[55]	train-mcc:0.000000	test-mcc:0.498008 
[56]	train-mcc:0.000000	test-mcc:0.497712 
[57]	train-mcc:0.000000	test-mcc:0.497967 
[58]	train-mcc:0.000000	test-mcc:0.497690 
[59]	train-mcc:0.000000	test-mcc:0.498127 
[60]	train-mcc:0.000000	test-mcc:0.498667 
[61]	train-mcc:0.000000	test-mcc:0.497712 
[62]	train-mcc:0.000000	test-mcc:0.497712 
[63]	train-mcc:0.000000	test-mcc:0.498928 
[64]	train-mcc:0.000000	test-mcc:0.498447 
[65]	train-mcc:0.000000	test-mcc:0.497745 
[66]	train-mcc:0.000000	test-mcc:0.497449 
[67]	train-mcc:0.000000	test-mcc:0.498148 
[68]	train-mcc:0.000000	test-mcc:0.498144 
[69]	train-mcc:0.000000	test-mcc:0.498144 
[70]	train-mcc:0.000000	test-mcc:0.498412 
[71]	train-mcc:0.000000	test-mcc:0.497680 
[72]	train-mcc:0.000000	test-mcc:0.496438 
[73]	train-mcc:0.000000	test-mcc:0.496519 
[74]	train-mcc:0.000000	test-mcc:0.496535 
[75]	train-mcc:0.000000	test-mcc:0.495949 
[76]	train-mcc:0.000000	test-mcc:0.496994 
[77]	train-mcc:0.000000	test-mcc:0.497232 
[78]	train-mcc:0.000000	test-mcc:0.497232 
[79]	train-mcc:0.000000	test-mcc:0.497454 
Stopping. Best iteration:
[49]	train-mcc:0.000000	test-mcc:0.502121


Time: Thu Nov 10 2016 09:02:42 AM
For 0049 rounds: train_mcc: 0 - test_mcc: 0.5021213
Confusion matrix:
     truth
preds      0      1
    0 235270    943
    1    104    433
     truth
preds            0            1
    0 0.9937486800 0.0039831045
    1 0.0004392819 0.0018289335
Iteration 22 (base=0.2659555): MCC=0.5021213 | threshold=0.4050111



Iteration 22[4] on Thu Nov 10 2016 09:02:44 AM

depth=7, min_child_weight=49.68375, subsample=0.9289565, colsample_bytree=0.821596, base_score=0.2659555
[1]	train-mcc:0.000000	test-mcc:0.488686 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.490187 
[3]	train-mcc:0.000000	test-mcc:0.486361 
[4]	train-mcc:0.000000	test-mcc:0.489138 
[5]	train-mcc:0.000000	test-mcc:0.489578 
[6]	train-mcc:0.000000	test-mcc:0.486814 
[7]	train-mcc:0.000000	test-mcc:0.489032 
[8]	train-mcc:0.000000	test-mcc:0.487983 
[9]	train-mcc:0.000000	test-mcc:0.488355 
[10]	train-mcc:0.000000	test-mcc:0.486845 
[11]	train-mcc:0.000000	test-mcc:0.486587 
[12]	train-mcc:0.000000	test-mcc:0.488346 
[13]	train-mcc:0.000000	test-mcc:0.485814 
[14]	train-mcc:0.000000	test-mcc:0.485175 
[15]	train-mcc:0.000000	test-mcc:0.485244 
[16]	train-mcc:0.000000	test-mcc:0.486211 
[17]	train-mcc:0.000000	test-mcc:0.485505 
[18]	train-mcc:0.000000	test-mcc:0.485861 
[19]	train-mcc:0.000000	test-mcc:0.485880 
[20]	train-mcc:0.000000	test-mcc:0.486323 
[21]	train-mcc:0.000000	test-mcc:0.487293 
[22]	train-mcc:0.000000	test-mcc:0.485585 
[23]	train-mcc:0.000000	test-mcc:0.486052 
[24]	train-mcc:0.000000	test-mcc:0.486754 
[25]	train-mcc:0.000000	test-mcc:0.486918 
[26]	train-mcc:0.000000	test-mcc:0.486485 
[27]	train-mcc:0.000000	test-mcc:0.486485 
[28]	train-mcc:0.000000	test-mcc:0.486216 
[29]	train-mcc:0.000000	test-mcc:0.484376 
[30]	train-mcc:0.000000	test-mcc:0.485513 
[31]	train-mcc:0.000000	test-mcc:0.486822 
[32]	train-mcc:0.000000	test-mcc:0.485245 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.490187


Time: Thu Nov 10 2016 09:03:57 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.4901872
Confusion matrix:
     truth
preds      0      1
    0 235159    894
    1    215    482
     truth
preds            0            1
    0 0.9932798310 0.0037761352
    1 0.0009081309 0.0020359029
Iteration 22 (base=0.2659555): MCC=0.4901872 | threshold=0.2793002



Iteration 22[5] on Thu Nov 10 2016 09:03:58 AM

depth=7, min_child_weight=49.68375, subsample=0.9289565, colsample_bytree=0.821596, base_score=0.2659555
[1]	train-mcc:0.000000	test-mcc:0.487744 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.490618 
[3]	train-mcc:0.000000	test-mcc:0.490995 
[4]	train-mcc:0.000000	test-mcc:0.490307 
[5]	train-mcc:0.000000	test-mcc:0.489765 
[6]	train-mcc:0.000000	test-mcc:0.492786 
[7]	train-mcc:0.000000	test-mcc:0.493177 
[8]	train-mcc:0.000000	test-mcc:0.490811 
[9]	train-mcc:0.000000	test-mcc:0.491653 
[10]	train-mcc:0.000000	test-mcc:0.493338 
[11]	train-mcc:0.000000	test-mcc:0.490893 
[12]	train-mcc:0.000000	test-mcc:0.491406 
[13]	train-mcc:0.000000	test-mcc:0.490859 
[14]	train-mcc:0.000000	test-mcc:0.491146 
[15]	train-mcc:0.000000	test-mcc:0.492301 
[16]	train-mcc:0.000000	test-mcc:0.492538 
[17]	train-mcc:0.000000	test-mcc:0.491700 
[18]	train-mcc:0.000000	test-mcc:0.492122 
[19]	train-mcc:0.000000	test-mcc:0.492122 
[20]	train-mcc:0.000000	test-mcc:0.491742 
[21]	train-mcc:0.000000	test-mcc:0.492969 
[22]	train-mcc:0.000000	test-mcc:0.491476 
[23]	train-mcc:0.000000	test-mcc:0.491547 
[24]	train-mcc:0.000000	test-mcc:0.491547 
[25]	train-mcc:0.000000	test-mcc:0.492243 
[26]	train-mcc:0.000000	test-mcc:0.491982 
[27]	train-mcc:0.000000	test-mcc:0.490651 
[28]	train-mcc:0.000000	test-mcc:0.491602 
[29]	train-mcc:0.000000	test-mcc:0.491622 
[30]	train-mcc:0.000000	test-mcc:0.491371 
[31]	train-mcc:0.000000	test-mcc:0.491622 
[32]	train-mcc:0.000000	test-mcc:0.492159 
[33]	train-mcc:0.000000	test-mcc:0.492159 
[34]	train-mcc:0.000000	test-mcc:0.492159 
[35]	train-mcc:0.000000	test-mcc:0.491476 
[36]	train-mcc:0.000000	test-mcc:0.491476 
[37]	train-mcc:0.000000	test-mcc:0.491792 
[38]	train-mcc:0.000000	test-mcc:0.491792 
[39]	train-mcc:0.000000	test-mcc:0.491203 
[40]	train-mcc:0.000000	test-mcc:0.490893 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.493338


Time: Thu Nov 10 2016 09:05:40 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4933375
Confusion matrix:
     truth
preds      0      1
    0 235278    961
    1     96    415
     truth
preds           0           1
    0 0.993782471 0.004059134
    1 0.000405491 0.001752904
Iteration 22 (base=0.2659555): MCC=0.4933375 | threshold=0.3934603


===




Iteration 23[1] on Thu Nov 10 2016 09:06:14 AM

depth=11, min_child_weight=1, subsample=0.9244739, colsample_bytree=0.6485038, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.455513 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.467041 
[3]	train-mcc:0.000000	test-mcc:0.472081 
[4]	train-mcc:0.000000	test-mcc:0.474770 
[5]	train-mcc:0.000000	test-mcc:0.474038 
[6]	train-mcc:0.000000	test-mcc:0.475911 
[7]	train-mcc:0.000000	test-mcc:0.475528 
[8]	train-mcc:0.000000	test-mcc:0.477093 
[9]	train-mcc:0.000000	test-mcc:0.478117 
[10]	train-mcc:0.000000	test-mcc:0.475989 
[11]	train-mcc:0.000000	test-mcc:0.477915 
[12]	train-mcc:0.000000	test-mcc:0.479622 
[13]	train-mcc:0.000000	test-mcc:0.479772 
[14]	train-mcc:0.000000	test-mcc:0.480689 
[15]	train-mcc:0.000000	test-mcc:0.479198 
[16]	train-mcc:0.000000	test-mcc:0.478466 
[17]	train-mcc:0.000000	test-mcc:0.476583 
[18]	train-mcc:0.000000	test-mcc:0.476233 
[19]	train-mcc:0.000000	test-mcc:0.477163 
[20]	train-mcc:0.000000	test-mcc:0.477898 
[21]	train-mcc:0.000000	test-mcc:0.478198 
[22]	train-mcc:0.000000	test-mcc:0.479666 
[23]	train-mcc:0.000000	test-mcc:0.479666 
[24]	train-mcc:0.000000	test-mcc:0.479452 
[25]	train-mcc:0.000000	test-mcc:0.479452 
[26]	train-mcc:0.000000	test-mcc:0.478718 
[27]	train-mcc:0.000000	test-mcc:0.478506 
[28]	train-mcc:0.000000	test-mcc:0.477590 
[29]	train-mcc:0.000000	test-mcc:0.478532 
[30]	train-mcc:0.000000	test-mcc:0.479452 
[31]	train-mcc:0.000000	test-mcc:0.480611 
[32]	train-mcc:0.000000	test-mcc:0.479877 
[33]	train-mcc:0.000000	test-mcc:0.479348 
[34]	train-mcc:0.000000	test-mcc:0.478505 
[35]	train-mcc:0.000000	test-mcc:0.479764 
[36]	train-mcc:0.000000	test-mcc:0.479240 
[37]	train-mcc:0.000000	test-mcc:0.480503 
[38]	train-mcc:0.000000	test-mcc:0.480503 
[39]	train-mcc:0.000000	test-mcc:0.480503 
[40]	train-mcc:0.000000	test-mcc:0.480503 
[41]	train-mcc:0.000000	test-mcc:0.480503 
[42]	train-mcc:0.000000	test-mcc:0.479219 
[43]	train-mcc:0.000000	test-mcc:0.479219 
[44]	train-mcc:0.000000	test-mcc:0.478646 
Stopping. Best iteration:
[14]	train-mcc:0.000000	test-mcc:0.480689


Time: Thu Nov 10 2016 09:08:49 AM
For 0014 rounds: train_mcc: 0 - test_mcc: 0.4806889
Confusion matrix:
     truth
preds      0      1
    0 235312   1003
    1     61    372
     truth
preds            0            1
    0 0.9939344789 0.0042365722
    1 0.0002576579 0.0015712910
Iteration 23 (base=0.5): MCC=0.4806889 | threshold=0.5711831



Iteration 23[2] on Thu Nov 10 2016 09:08:50 AM

depth=11, min_child_weight=1, subsample=0.9244739, colsample_bytree=0.6485038, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.445126 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.464278 
[3]	train-mcc:0.000000	test-mcc:0.472148 
[4]	train-mcc:0.000000	test-mcc:0.473270 
[5]	train-mcc:0.000000	test-mcc:0.475820 
[6]	train-mcc:0.000000	test-mcc:0.473243 
[7]	train-mcc:0.000000	test-mcc:0.472254 
[8]	train-mcc:0.000000	test-mcc:0.476870 
[9]	train-mcc:0.000000	test-mcc:0.477998 
[10]	train-mcc:0.000000	test-mcc:0.479396 
[11]	train-mcc:0.000000	test-mcc:0.479116 
[12]	train-mcc:0.000000	test-mcc:0.479191 
[13]	train-mcc:0.000000	test-mcc:0.480461 
[14]	train-mcc:0.000000	test-mcc:0.480539 
[15]	train-mcc:0.000000	test-mcc:0.481236 
[16]	train-mcc:0.000000	test-mcc:0.479969 
[17]	train-mcc:0.000000	test-mcc:0.480908 
[18]	train-mcc:0.000000	test-mcc:0.478599 
[19]	train-mcc:0.000000	test-mcc:0.479501 
[20]	train-mcc:0.000000	test-mcc:0.478314 
[21]	train-mcc:0.000000	test-mcc:0.477849 
[22]	train-mcc:0.000000	test-mcc:0.477976 
[23]	train-mcc:0.000000	test-mcc:0.477976 
[24]	train-mcc:0.000000	test-mcc:0.478314 
[25]	train-mcc:0.000000	test-mcc:0.477444 
[26]	train-mcc:0.000000	test-mcc:0.478099 
[27]	train-mcc:0.000000	test-mcc:0.477651 
[28]	train-mcc:0.000000	test-mcc:0.478512 
[29]	train-mcc:0.000000	test-mcc:0.477142 
[30]	train-mcc:0.000000	test-mcc:0.477651 
[31]	train-mcc:0.000000	test-mcc:0.477701 
[32]	train-mcc:0.000000	test-mcc:0.477399 
[33]	train-mcc:0.000000	test-mcc:0.478198 
[34]	train-mcc:0.000000	test-mcc:0.478898 
[35]	train-mcc:0.000000	test-mcc:0.478744 
[36]	train-mcc:0.000000	test-mcc:0.479299 
[37]	train-mcc:0.000000	test-mcc:0.480214 
[38]	train-mcc:0.000000	test-mcc:0.480214 
[39]	train-mcc:0.000000	test-mcc:0.479809 
[40]	train-mcc:0.000000	test-mcc:0.479809 
[41]	train-mcc:0.000000	test-mcc:0.479115 
[42]	train-mcc:0.000000	test-mcc:0.479626 
[43]	train-mcc:0.000000	test-mcc:0.478259 
[44]	train-mcc:0.000000	test-mcc:0.479824 
[45]	train-mcc:0.000000	test-mcc:0.479824 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.481236


Time: Thu Nov 10 2016 09:11:17 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4812365
Confusion matrix:
     truth
preds      0      1
    0 235256    964
    1    117    412
     truth
preds            0            1
    0 0.9936937432 0.0040718229
    1 0.0004941943 0.0017402397
Iteration 23 (base=0.5): MCC=0.4812365 | threshold=0.4424407



Iteration 23[3] on Thu Nov 10 2016 09:11:19 AM

depth=11, min_child_weight=1, subsample=0.9244739, colsample_bytree=0.6485038, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.458426 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472267 
[3]	train-mcc:0.000000	test-mcc:0.479292 
[4]	train-mcc:0.000000	test-mcc:0.481144 
[5]	train-mcc:0.000000	test-mcc:0.484038 
[6]	train-mcc:0.000000	test-mcc:0.485431 
[7]	train-mcc:0.000000	test-mcc:0.490736 
[8]	train-mcc:0.000000	test-mcc:0.492152 
[9]	train-mcc:0.000000	test-mcc:0.488229 
[10]	train-mcc:0.000000	test-mcc:0.491008 
[11]	train-mcc:0.000000	test-mcc:0.487538 
[12]	train-mcc:0.000000	test-mcc:0.490095 
[13]	train-mcc:0.000000	test-mcc:0.493336 
[14]	train-mcc:0.000000	test-mcc:0.490954 
[15]	train-mcc:0.000000	test-mcc:0.489853 
[16]	train-mcc:0.000000	test-mcc:0.490449 
[17]	train-mcc:0.000000	test-mcc:0.488290 
[18]	train-mcc:0.000000	test-mcc:0.489475 
[19]	train-mcc:0.000000	test-mcc:0.490160 
[20]	train-mcc:0.000000	test-mcc:0.490160 
[21]	train-mcc:0.000000	test-mcc:0.489549 
[22]	train-mcc:0.000000	test-mcc:0.489134 
[23]	train-mcc:0.000000	test-mcc:0.490162 
[24]	train-mcc:0.000000	test-mcc:0.489240 
[25]	train-mcc:0.000000	test-mcc:0.488703 
[26]	train-mcc:0.000000	test-mcc:0.489806 
[27]	train-mcc:0.000000	test-mcc:0.492093 
[28]	train-mcc:0.000000	test-mcc:0.493016 
[29]	train-mcc:0.000000	test-mcc:0.493016 
[30]	train-mcc:0.000000	test-mcc:0.491420 
[31]	train-mcc:0.000000	test-mcc:0.491653 
[32]	train-mcc:0.000000	test-mcc:0.492850 
[33]	train-mcc:0.000000	test-mcc:0.492628 
[34]	train-mcc:0.000000	test-mcc:0.492123 
[35]	train-mcc:0.000000	test-mcc:0.492580 
[36]	train-mcc:0.000000	test-mcc:0.493038 
[37]	train-mcc:0.000000	test-mcc:0.493038 
[38]	train-mcc:0.000000	test-mcc:0.493038 
[39]	train-mcc:0.000000	test-mcc:0.491595 
[40]	train-mcc:0.000000	test-mcc:0.493316 
[41]	train-mcc:0.000000	test-mcc:0.493316 
[42]	train-mcc:0.000000	test-mcc:0.493316 
[43]	train-mcc:0.000000	test-mcc:0.493070 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.493336


Time: Thu Nov 10 2016 09:13:43 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4933357
Confusion matrix:
     truth
preds      0      1
    0 235217    922
    1    157    454
     truth
preds            0            1
    0 0.9935248152 0.0038944034
    1 0.0006631468 0.0019176346
Iteration 23 (base=0.5): MCC=0.4933357 | threshold=0.3521155



Iteration 23[4] on Thu Nov 10 2016 09:13:44 AM

depth=11, min_child_weight=1, subsample=0.9244739, colsample_bytree=0.6485038, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.466089 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475322 
[3]	train-mcc:0.000000	test-mcc:0.474486 
[4]	train-mcc:0.000000	test-mcc:0.476797 
[5]	train-mcc:0.000000	test-mcc:0.477691 
[6]	train-mcc:0.000000	test-mcc:0.482562 
[7]	train-mcc:0.000000	test-mcc:0.478397 
[8]	train-mcc:0.000000	test-mcc:0.481507 
[9]	train-mcc:0.000000	test-mcc:0.481929 
[10]	train-mcc:0.000000	test-mcc:0.480245 
[11]	train-mcc:0.000000	test-mcc:0.479026 
[12]	train-mcc:0.000000	test-mcc:0.482657 
[13]	train-mcc:0.000000	test-mcc:0.483297 
[14]	train-mcc:0.000000	test-mcc:0.483479 
[15]	train-mcc:0.000000	test-mcc:0.484175 
[16]	train-mcc:0.000000	test-mcc:0.482638 
[17]	train-mcc:0.000000	test-mcc:0.482221 
[18]	train-mcc:0.000000	test-mcc:0.482354 
[19]	train-mcc:0.000000	test-mcc:0.481966 
[20]	train-mcc:0.000000	test-mcc:0.482784 
[21]	train-mcc:0.000000	test-mcc:0.481726 
[22]	train-mcc:0.000000	test-mcc:0.482624 
[23]	train-mcc:0.000000	test-mcc:0.484271 
[24]	train-mcc:0.000000	test-mcc:0.481492 
[25]	train-mcc:0.000000	test-mcc:0.482207 
[26]	train-mcc:0.000000	test-mcc:0.481608 
[27]	train-mcc:0.000000	test-mcc:0.481627 
[28]	train-mcc:0.000000	test-mcc:0.480577 
[29]	train-mcc:0.000000	test-mcc:0.483689 
[30]	train-mcc:0.000000	test-mcc:0.483689 
[31]	train-mcc:0.000000	test-mcc:0.483646 
[32]	train-mcc:0.000000	test-mcc:0.483432 
[33]	train-mcc:0.000000	test-mcc:0.482413 
[34]	train-mcc:0.000000	test-mcc:0.481435 
[35]	train-mcc:0.000000	test-mcc:0.481239 
[36]	train-mcc:0.000000	test-mcc:0.481611 
[37]	train-mcc:0.000000	test-mcc:0.481611 
[38]	train-mcc:0.000000	test-mcc:0.481611 
[39]	train-mcc:0.000000	test-mcc:0.480802 
[40]	train-mcc:0.000000	test-mcc:0.481206 
[41]	train-mcc:0.000000	test-mcc:0.481507 
[42]	train-mcc:0.000000	test-mcc:0.481904 
[43]	train-mcc:0.000000	test-mcc:0.481904 
[44]	train-mcc:0.000000	test-mcc:0.481929 
[45]	train-mcc:0.000000	test-mcc:0.482715 
[46]	train-mcc:0.000000	test-mcc:0.481904 
[47]	train-mcc:0.000000	test-mcc:0.482092 
[48]	train-mcc:0.000000	test-mcc:0.483206 
[49]	train-mcc:0.000000	test-mcc:0.483206 
[50]	train-mcc:0.000000	test-mcc:0.482506 
[51]	train-mcc:0.000000	test-mcc:0.482506 
[52]	train-mcc:0.000000	test-mcc:0.481789 
[53]	train-mcc:0.000000	test-mcc:0.480520 
Stopping. Best iteration:
[23]	train-mcc:0.000000	test-mcc:0.484271


Time: Thu Nov 10 2016 09:16:27 AM
For 0023 rounds: train_mcc: 0 - test_mcc: 0.484271
Confusion matrix:
     truth
preds      0      1
    0 235262    963
    1    112    413
     truth
preds            0            1
    0 0.9937148891 0.0040675818
    1 0.0004730729 0.0017444562
Iteration 23 (base=0.5): MCC=0.484271 | threshold=0.3956023



Iteration 23[5] on Thu Nov 10 2016 09:16:29 AM

depth=11, min_child_weight=1, subsample=0.9244739, colsample_bytree=0.6485038, base_score=0.5
[1]	train-mcc:0.000000	test-mcc:0.460534 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.470427 
[3]	train-mcc:0.000000	test-mcc:0.474711 
[4]	train-mcc:0.000000	test-mcc:0.481104 
[5]	train-mcc:0.000000	test-mcc:0.482408 
[6]	train-mcc:0.000000	test-mcc:0.481794 
[7]	train-mcc:0.000000	test-mcc:0.480639 
[8]	train-mcc:0.000000	test-mcc:0.478165 
[9]	train-mcc:0.000000	test-mcc:0.479111 
[10]	train-mcc:0.000000	test-mcc:0.478765 
[11]	train-mcc:0.000000	test-mcc:0.482320 
[12]	train-mcc:0.000000	test-mcc:0.478835 
[13]	train-mcc:0.000000	test-mcc:0.479928 
[14]	train-mcc:0.000000	test-mcc:0.481096 
[15]	train-mcc:0.000000	test-mcc:0.479928 
[16]	train-mcc:0.000000	test-mcc:0.479292 
[17]	train-mcc:0.000000	test-mcc:0.479558 
[18]	train-mcc:0.000000	test-mcc:0.479500 
[19]	train-mcc:0.000000	test-mcc:0.479431 
[20]	train-mcc:0.000000	test-mcc:0.480398 
[21]	train-mcc:0.000000	test-mcc:0.479915 
[22]	train-mcc:0.000000	test-mcc:0.478229 
[23]	train-mcc:0.000000	test-mcc:0.477325 
[24]	train-mcc:0.000000	test-mcc:0.478364 
[25]	train-mcc:0.000000	test-mcc:0.478623 
[26]	train-mcc:0.000000	test-mcc:0.477772 
[27]	train-mcc:0.000000	test-mcc:0.478314 
[28]	train-mcc:0.000000	test-mcc:0.478106 
[29]	train-mcc:0.000000	test-mcc:0.478106 
[30]	train-mcc:0.000000	test-mcc:0.477644 
[31]	train-mcc:0.000000	test-mcc:0.478164 
[32]	train-mcc:0.000000	test-mcc:0.477706 
[33]	train-mcc:0.000000	test-mcc:0.477411 
[34]	train-mcc:0.000000	test-mcc:0.477779 
[35]	train-mcc:0.000000	test-mcc:0.477552 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.482408


Time: Thu Nov 10 2016 09:18:27 AM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.4824081
Confusion matrix:
     truth
preds      0      1
    0 235247    956
    1    127    420
     truth
preds            0            1
    0 0.9936515312 0.0040380148
    1 0.0005364308 0.0017740232
Iteration 23 (base=0.5): MCC=0.4824081 | threshold=0.4221917


===




Iteration 24[1] on Thu Nov 10 2016 09:18:59 AM

depth=10, min_child_weight=1, subsample=0.6010251, colsample_bytree=0.5405732, base_score=0.04515597
[1]	train-mcc:0.000000	test-mcc:0.462680 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.470561 
[3]	train-mcc:0.000000	test-mcc:0.469850 
[4]	train-mcc:0.000000	test-mcc:0.470673 
[5]	train-mcc:0.000000	test-mcc:0.470080 
[6]	train-mcc:0.000000	test-mcc:0.470256 
[7]	train-mcc:0.000000	test-mcc:0.470633 
[8]	train-mcc:0.000000	test-mcc:0.471032 
[9]	train-mcc:0.000000	test-mcc:0.471622 
[10]	train-mcc:0.000000	test-mcc:0.470436 
[11]	train-mcc:0.000000	test-mcc:0.470436 
[12]	train-mcc:0.000000	test-mcc:0.467451 
[13]	train-mcc:0.000000	test-mcc:0.468433 
[14]	train-mcc:0.000000	test-mcc:0.469816 
[15]	train-mcc:0.000000	test-mcc:0.470315 
[16]	train-mcc:0.000000	test-mcc:0.470250 
[17]	train-mcc:0.000000	test-mcc:0.469937 
[18]	train-mcc:0.000000	test-mcc:0.465784 
[19]	train-mcc:0.000000	test-mcc:0.465556 
[20]	train-mcc:0.000000	test-mcc:0.465556 
[21]	train-mcc:0.000000	test-mcc:0.465032 
[22]	train-mcc:0.000000	test-mcc:0.464184 
[23]	train-mcc:0.000000	test-mcc:0.463756 
[24]	train-mcc:0.000000	test-mcc:0.462572 
[25]	train-mcc:0.000000	test-mcc:0.463193 
[26]	train-mcc:0.000000	test-mcc:0.463818 
[27]	train-mcc:0.000000	test-mcc:0.463818 
[28]	train-mcc:0.000000	test-mcc:0.463818 
[29]	train-mcc:0.000000	test-mcc:0.463818 
[30]	train-mcc:0.000000	test-mcc:0.464589 
[31]	train-mcc:0.000000	test-mcc:0.464589 
[32]	train-mcc:0.000000	test-mcc:0.463812 
[33]	train-mcc:0.000000	test-mcc:0.463529 
[34]	train-mcc:0.000000	test-mcc:0.465039 
[35]	train-mcc:0.000000	test-mcc:0.466475 
[36]	train-mcc:0.000000	test-mcc:0.466424 
[37]	train-mcc:0.000000	test-mcc:0.466129 
[38]	train-mcc:0.000000	test-mcc:0.465844 
[39]	train-mcc:0.000000	test-mcc:0.465985 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.471622


Time: Thu Nov 10 2016 09:20:48 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.4716216
Confusion matrix:
     truth
preds      0      1
    0 235331   1030
    1     42    345
     truth
preds            0            1
    0 0.9940147330 0.0043506175
    1 0.0001774038 0.0014572457
Iteration 24 (base=0.04515597): MCC=0.4716216 | threshold=0.6637372



Iteration 24[2] on Thu Nov 10 2016 09:20:49 AM

depth=10, min_child_weight=1, subsample=0.6010251, colsample_bytree=0.5405732, base_score=0.04515597
[1]	train-mcc:0.000000	test-mcc:0.480381 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480190 
[3]	train-mcc:0.000000	test-mcc:0.479928 
[4]	train-mcc:0.000000	test-mcc:0.479827 
[5]	train-mcc:0.000000	test-mcc:0.479255 
[6]	train-mcc:0.000000	test-mcc:0.478116 
[7]	train-mcc:0.000000	test-mcc:0.481810 
[8]	train-mcc:0.000000	test-mcc:0.478229 
[9]	train-mcc:0.000000	test-mcc:0.479207 
[10]	train-mcc:0.000000	test-mcc:0.482408 
[11]	train-mcc:0.000000	test-mcc:0.482408 
[12]	train-mcc:0.000000	test-mcc:0.480836 
[13]	train-mcc:0.000000	test-mcc:0.481492 
[14]	train-mcc:0.000000	test-mcc:0.477013 
[15]	train-mcc:0.000000	test-mcc:0.471218 
[16]	train-mcc:0.000000	test-mcc:0.472651 
[17]	train-mcc:0.000000	test-mcc:0.470793 
[18]	train-mcc:0.000000	test-mcc:0.472417 
[19]	train-mcc:0.000000	test-mcc:0.471732 
[20]	train-mcc:0.000000	test-mcc:0.471275 
[21]	train-mcc:0.000000	test-mcc:0.470983 
[22]	train-mcc:0.000000	test-mcc:0.469542 
[23]	train-mcc:0.000000	test-mcc:0.471427 
[24]	train-mcc:0.000000	test-mcc:0.471732 
[25]	train-mcc:0.000000	test-mcc:0.473907 
[26]	train-mcc:0.000000	test-mcc:0.473907 
[27]	train-mcc:0.000000	test-mcc:0.473815 
[28]	train-mcc:0.000000	test-mcc:0.473994 
[29]	train-mcc:0.000000	test-mcc:0.472430 
[30]	train-mcc:0.000000	test-mcc:0.471406 
[31]	train-mcc:0.000000	test-mcc:0.469710 
[32]	train-mcc:0.000000	test-mcc:0.470851 
[33]	train-mcc:0.000000	test-mcc:0.470835 
[34]	train-mcc:0.000000	test-mcc:0.472644 
[35]	train-mcc:0.000000	test-mcc:0.472198 
[36]	train-mcc:0.000000	test-mcc:0.471197 
[37]	train-mcc:0.000000	test-mcc:0.470427 
[38]	train-mcc:0.000000	test-mcc:0.470830 
[39]	train-mcc:0.000000	test-mcc:0.471308 
[40]	train-mcc:0.000000	test-mcc:0.469188 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.482408


Time: Thu Nov 10 2016 09:22:26 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4824081
Confusion matrix:
     truth
preds      0      1
    0 235246    956
    1    127    420
     truth
preds            0            1
    0 0.9936515043 0.0040380318
    1 0.0005364331 0.0017740307
Iteration 24 (base=0.04515597): MCC=0.4824081 | threshold=0.4015787



Iteration 24[3] on Thu Nov 10 2016 09:22:27 AM

depth=10, min_child_weight=1, subsample=0.6010251, colsample_bytree=0.5405732, base_score=0.04515597
[1]	train-mcc:0.000000	test-mcc:0.479802 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483289 
[3]	train-mcc:0.000000	test-mcc:0.484585 
[4]	train-mcc:0.000000	test-mcc:0.486883 
[5]	train-mcc:0.000000	test-mcc:0.478970 
[6]	train-mcc:0.000000	test-mcc:0.478549 
[7]	train-mcc:0.000000	test-mcc:0.480530 
[8]	train-mcc:0.000000	test-mcc:0.478162 
[9]	train-mcc:0.000000	test-mcc:0.478162 
[10]	train-mcc:0.000000	test-mcc:0.477208 
[11]	train-mcc:0.000000	test-mcc:0.477722 
[12]	train-mcc:0.000000	test-mcc:0.477594 
[13]	train-mcc:0.000000	test-mcc:0.478654 
[14]	train-mcc:0.000000	test-mcc:0.475808 
[15]	train-mcc:0.000000	test-mcc:0.476529 
[16]	train-mcc:0.000000	test-mcc:0.477260 
[17]	train-mcc:0.000000	test-mcc:0.477592 
[18]	train-mcc:0.000000	test-mcc:0.478229 
[19]	train-mcc:0.000000	test-mcc:0.477448 
[20]	train-mcc:0.000000	test-mcc:0.479207 
[21]	train-mcc:0.000000	test-mcc:0.478222 
[22]	train-mcc:0.000000	test-mcc:0.479928 
[23]	train-mcc:0.000000	test-mcc:0.477129 
[24]	train-mcc:0.000000	test-mcc:0.478023 
[25]	train-mcc:0.000000	test-mcc:0.479404 
[26]	train-mcc:0.000000	test-mcc:0.480060 
[27]	train-mcc:0.000000	test-mcc:0.480264 
[28]	train-mcc:0.000000	test-mcc:0.481492 
[29]	train-mcc:0.000000	test-mcc:0.480720 
[30]	train-mcc:0.000000	test-mcc:0.482331 
[31]	train-mcc:0.000000	test-mcc:0.481881 
[32]	train-mcc:0.000000	test-mcc:0.480455 
[33]	train-mcc:0.000000	test-mcc:0.481433 
[34]	train-mcc:0.000000	test-mcc:0.480689 
Stopping. Best iteration:
[4]	train-mcc:0.000000	test-mcc:0.486883


Time: Thu Nov 10 2016 09:23:52 AM
For 0004 rounds: train_mcc: 0 - test_mcc: 0.4868832
Confusion matrix:
     truth
preds      0      1
    0 235288    977
    1     86    399
     truth
preds            0            1
    0 0.9938247096 0.0041267159
    1 0.0003632524 0.0016853221
Iteration 24 (base=0.04515597): MCC=0.4868832 | threshold=0.4142967



Iteration 24[4] on Thu Nov 10 2016 09:23:53 AM

depth=10, min_child_weight=1, subsample=0.6010251, colsample_bytree=0.5405732, base_score=0.04515597
[1]	train-mcc:0.000000	test-mcc:0.472189 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.473039 
[3]	train-mcc:0.000000	test-mcc:0.473093 
[4]	train-mcc:0.000000	test-mcc:0.474714 
[5]	train-mcc:0.000000	test-mcc:0.469258 
[6]	train-mcc:0.000000	test-mcc:0.472030 
[7]	train-mcc:0.000000	test-mcc:0.471261 
[8]	train-mcc:0.000000	test-mcc:0.471271 
[9]	train-mcc:0.000000	test-mcc:0.469104 
[10]	train-mcc:0.000000	test-mcc:0.469416 
[11]	train-mcc:0.000000	test-mcc:0.470195 
[12]	train-mcc:0.000000	test-mcc:0.469120 
[13]	train-mcc:0.000000	test-mcc:0.471120 
[14]	train-mcc:0.000000	test-mcc:0.474429 
[15]	train-mcc:0.000000	test-mcc:0.472618 
[16]	train-mcc:0.000000	test-mcc:0.473559 
[17]	train-mcc:0.000000	test-mcc:0.472752 
[18]	train-mcc:0.000000	test-mcc:0.474135 
[19]	train-mcc:0.000000	test-mcc:0.473430 
[20]	train-mcc:0.000000	test-mcc:0.472984 
[21]	train-mcc:0.000000	test-mcc:0.473804 
[22]	train-mcc:0.000000	test-mcc:0.472384 
[23]	train-mcc:0.000000	test-mcc:0.471074 
[24]	train-mcc:0.000000	test-mcc:0.469839 
[25]	train-mcc:0.000000	test-mcc:0.470401 
[26]	train-mcc:0.000000	test-mcc:0.469839 
[27]	train-mcc:0.000000	test-mcc:0.469287 
[28]	train-mcc:0.000000	test-mcc:0.467585 
[29]	train-mcc:0.000000	test-mcc:0.467995 
[30]	train-mcc:0.000000	test-mcc:0.465434 
[31]	train-mcc:0.000000	test-mcc:0.467552 
[32]	train-mcc:0.000000	test-mcc:0.467552 
[33]	train-mcc:0.000000	test-mcc:0.467946 
[34]	train-mcc:0.000000	test-mcc:0.467946 
Stopping. Best iteration:
[4]	train-mcc:0.000000	test-mcc:0.474714


Time: Thu Nov 10 2016 09:25:23 AM
For 0004 rounds: train_mcc: 0 - test_mcc: 0.4747145
Confusion matrix:
     truth
preds      0      1
    0 235249    968
    1    125    408
     truth
preds            0            1
    0 0.9936599789 0.0040887012
    1 0.0005279831 0.0017233369
Iteration 24 (base=0.04515597): MCC=0.4747145 | threshold=0.3145473



Iteration 24[5] on Thu Nov 10 2016 09:25:24 AM

depth=10, min_child_weight=1, subsample=0.6010251, colsample_bytree=0.5405732, base_score=0.04515597
[1]	train-mcc:0.000000	test-mcc:0.485529 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.489519 
[3]	train-mcc:0.000000	test-mcc:0.488297 
[4]	train-mcc:0.000000	test-mcc:0.486391 
[5]	train-mcc:0.000000	test-mcc:0.484657 
[6]	train-mcc:0.000000	test-mcc:0.484087 
[7]	train-mcc:0.000000	test-mcc:0.486204 
[8]	train-mcc:0.000000	test-mcc:0.485943 
[9]	train-mcc:0.000000	test-mcc:0.483635 
[10]	train-mcc:0.000000	test-mcc:0.486439 
[11]	train-mcc:0.000000	test-mcc:0.485266 
[12]	train-mcc:0.000000	test-mcc:0.484806 
[13]	train-mcc:0.000000	test-mcc:0.484806 
[14]	train-mcc:0.000000	test-mcc:0.484657 
[15]	train-mcc:0.000000	test-mcc:0.486634 
[16]	train-mcc:0.000000	test-mcc:0.485805 
[17]	train-mcc:0.000000	test-mcc:0.486249 
[18]	train-mcc:0.000000	test-mcc:0.484767 
[19]	train-mcc:0.000000	test-mcc:0.485203 
[20]	train-mcc:0.000000	test-mcc:0.484087 
[21]	train-mcc:0.000000	test-mcc:0.482145 
[22]	train-mcc:0.000000	test-mcc:0.480965 
[23]	train-mcc:0.000000	test-mcc:0.480643 
[24]	train-mcc:0.000000	test-mcc:0.480159 
[25]	train-mcc:0.000000	test-mcc:0.482344 
[26]	train-mcc:0.000000	test-mcc:0.482344 
[27]	train-mcc:0.000000	test-mcc:0.482930 
[28]	train-mcc:0.000000	test-mcc:0.482345 
[29]	train-mcc:0.000000	test-mcc:0.482430 
[30]	train-mcc:0.000000	test-mcc:0.480913 
[31]	train-mcc:0.000000	test-mcc:0.481507 
[32]	train-mcc:0.000000	test-mcc:0.481420 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.489519


Time: Thu Nov 10 2016 09:26:47 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.489519
Confusion matrix:
     truth
preds      0      1
    0 235276    965
    1     98    411
     truth
preds            0            1
    0 0.9937740232 0.0040760296
    1 0.0004139388 0.0017360084
Iteration 24 (base=0.04515597): MCC=0.489519 | threshold=0.2425466


===




Iteration 25[1] on Thu Nov 10 2016 09:27:19 AM

depth=8, min_child_weight=50, subsample=0.8137507, colsample_bytree=0.5242916, base_score=0.4448803
[1]	train-mcc:0.000000	test-mcc:0.467963 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475487 
[3]	train-mcc:0.000000	test-mcc:0.478133 
[4]	train-mcc:0.000000	test-mcc:0.478829 
[5]	train-mcc:0.000000	test-mcc:0.479388 
[6]	train-mcc:0.000000	test-mcc:0.479436 
[7]	train-mcc:0.000000	test-mcc:0.480188 
[8]	train-mcc:0.000000	test-mcc:0.479591 
[9]	train-mcc:0.000000	test-mcc:0.479164 
[10]	train-mcc:0.000000	test-mcc:0.480164 
[11]	train-mcc:0.000000	test-mcc:0.478532 
[12]	train-mcc:0.000000	test-mcc:0.479655 
[13]	train-mcc:0.000000	test-mcc:0.479386 
[14]	train-mcc:0.000000	test-mcc:0.478332 
[15]	train-mcc:0.000000	test-mcc:0.479673 
[16]	train-mcc:0.000000	test-mcc:0.479489 
[17]	train-mcc:0.000000	test-mcc:0.478728 
[18]	train-mcc:0.000000	test-mcc:0.480558 
[19]	train-mcc:0.000000	test-mcc:0.481013 
[20]	train-mcc:0.000000	test-mcc:0.480865 
[21]	train-mcc:0.000000	test-mcc:0.480903 
[22]	train-mcc:0.000000	test-mcc:0.480753 
[23]	train-mcc:0.000000	test-mcc:0.480837 
[24]	train-mcc:0.000000	test-mcc:0.479125 
[25]	train-mcc:0.000000	test-mcc:0.479487 
[26]	train-mcc:0.000000	test-mcc:0.478152 
[27]	train-mcc:0.000000	test-mcc:0.477071 
[28]	train-mcc:0.000000	test-mcc:0.476965 
[29]	train-mcc:0.000000	test-mcc:0.478301 
[30]	train-mcc:0.000000	test-mcc:0.479324 
[31]	train-mcc:0.000000	test-mcc:0.477900 
[32]	train-mcc:0.000000	test-mcc:0.477682 
[33]	train-mcc:0.000000	test-mcc:0.476889 
[34]	train-mcc:0.000000	test-mcc:0.476344 
[35]	train-mcc:0.000000	test-mcc:0.476344 
[36]	train-mcc:0.000000	test-mcc:0.476042 
[37]	train-mcc:0.000000	test-mcc:0.476042 
[38]	train-mcc:0.000000	test-mcc:0.475513 
[39]	train-mcc:0.000000	test-mcc:0.475100 
[40]	train-mcc:0.000000	test-mcc:0.475989 
[41]	train-mcc:0.000000	test-mcc:0.475989 
[42]	train-mcc:0.000000	test-mcc:0.476446 
[43]	train-mcc:0.000000	test-mcc:0.475874 
[44]	train-mcc:0.000000	test-mcc:0.475557 
[45]	train-mcc:0.000000	test-mcc:0.476082 
[46]	train-mcc:0.000000	test-mcc:0.477433 
[47]	train-mcc:0.000000	test-mcc:0.477433 
[48]	train-mcc:0.000000	test-mcc:0.476952 
[49]	train-mcc:0.000000	test-mcc:0.475241 
Stopping. Best iteration:
[19]	train-mcc:0.000000	test-mcc:0.481013


Time: Thu Nov 10 2016 09:28:57 AM
For 0019 rounds: train_mcc: 0 - test_mcc: 0.4810125
Confusion matrix:
     truth
preds      0      1
    0 235252    961
    1    121    414
     truth
preds           0           1
    0 0.993681045 0.004059168
    1 0.000511092 0.001748695
Iteration 25 (base=0.4448803): MCC=0.4810125 | threshold=0.4382871



Iteration 25[2] on Thu Nov 10 2016 09:28:59 AM

depth=8, min_child_weight=50, subsample=0.8137507, colsample_bytree=0.5242916, base_score=0.4448803
[1]	train-mcc:0.000000	test-mcc:0.467814 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.475144 
[3]	train-mcc:0.000000	test-mcc:0.478106 
[4]	train-mcc:0.000000	test-mcc:0.481967 
[5]	train-mcc:0.000000	test-mcc:0.484421 
[6]	train-mcc:0.000000	test-mcc:0.486050 
[7]	train-mcc:0.000000	test-mcc:0.488583 
[8]	train-mcc:0.000000	test-mcc:0.486470 
[9]	train-mcc:0.000000	test-mcc:0.488583 
[10]	train-mcc:0.000000	test-mcc:0.487647 
[11]	train-mcc:0.000000	test-mcc:0.486087 
[12]	train-mcc:0.000000	test-mcc:0.488928 
[13]	train-mcc:0.000000	test-mcc:0.488723 
[14]	train-mcc:0.000000	test-mcc:0.486591 
[15]	train-mcc:0.000000	test-mcc:0.485014 
[16]	train-mcc:0.000000	test-mcc:0.484141 
[17]	train-mcc:0.000000	test-mcc:0.483701 
[18]	train-mcc:0.000000	test-mcc:0.484657 
[19]	train-mcc:0.000000	test-mcc:0.485769 
[20]	train-mcc:0.000000	test-mcc:0.486030 
[21]	train-mcc:0.000000	test-mcc:0.484985 
[22]	train-mcc:0.000000	test-mcc:0.485350 
[23]	train-mcc:0.000000	test-mcc:0.485949 
[24]	train-mcc:0.000000	test-mcc:0.485513 
[25]	train-mcc:0.000000	test-mcc:0.485415 
[26]	train-mcc:0.000000	test-mcc:0.484304 
[27]	train-mcc:0.000000	test-mcc:0.485016 
[28]	train-mcc:0.000000	test-mcc:0.484983 
[29]	train-mcc:0.000000	test-mcc:0.485172 
[30]	train-mcc:0.000000	test-mcc:0.484539 
[31]	train-mcc:0.000000	test-mcc:0.485438 
[32]	train-mcc:0.000000	test-mcc:0.486211 
[33]	train-mcc:0.000000	test-mcc:0.485161 
[34]	train-mcc:0.000000	test-mcc:0.485016 
[35]	train-mcc:0.000000	test-mcc:0.485280 
[36]	train-mcc:0.000000	test-mcc:0.485172 
[37]	train-mcc:0.000000	test-mcc:0.485172 
[38]	train-mcc:0.000000	test-mcc:0.485172 
[39]	train-mcc:0.000000	test-mcc:0.485208 
[40]	train-mcc:0.000000	test-mcc:0.486021 
[41]	train-mcc:0.000000	test-mcc:0.485195 
[42]	train-mcc:0.000000	test-mcc:0.486478 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.488928


Time: Thu Nov 10 2016 09:30:21 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.488928
Confusion matrix:
     truth
preds      0      1
    0 235291    977
    1     82    399
     truth
preds            0            1
    0 0.9938415791 0.0041267334
    1 0.0003463584 0.0016853292
Iteration 25 (base=0.4448803): MCC=0.488928 | threshold=0.4446186



Iteration 25[3] on Thu Nov 10 2016 09:30:22 AM

depth=8, min_child_weight=50, subsample=0.8137507, colsample_bytree=0.5242916, base_score=0.4448803
[1]	train-mcc:0.000000	test-mcc:0.480749 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487685 
[3]	train-mcc:0.000000	test-mcc:0.487857 
[4]	train-mcc:0.000000	test-mcc:0.489970 
[5]	train-mcc:0.000000	test-mcc:0.491168 
[6]	train-mcc:0.000000	test-mcc:0.491633 
[7]	train-mcc:0.000000	test-mcc:0.493540 
[8]	train-mcc:0.000000	test-mcc:0.495682 
[9]	train-mcc:0.000000	test-mcc:0.494346 
[10]	train-mcc:0.000000	test-mcc:0.492189 
[11]	train-mcc:0.000000	test-mcc:0.490719 
[12]	train-mcc:0.000000	test-mcc:0.490986 
[13]	train-mcc:0.000000	test-mcc:0.492330 
[14]	train-mcc:0.000000	test-mcc:0.493072 
[15]	train-mcc:0.000000	test-mcc:0.493239 
[16]	train-mcc:0.000000	test-mcc:0.493005 
[17]	train-mcc:0.000000	test-mcc:0.494451 
[18]	train-mcc:0.000000	test-mcc:0.492538 
[19]	train-mcc:0.000000	test-mcc:0.493246 
[20]	train-mcc:0.000000	test-mcc:0.492772 
[21]	train-mcc:0.000000	test-mcc:0.492608 
[22]	train-mcc:0.000000	test-mcc:0.494413 
[23]	train-mcc:0.000000	test-mcc:0.494182 
[24]	train-mcc:0.000000	test-mcc:0.494225 
[25]	train-mcc:0.000000	test-mcc:0.492777 
[26]	train-mcc:0.000000	test-mcc:0.492777 
[27]	train-mcc:0.000000	test-mcc:0.493016 
[28]	train-mcc:0.000000	test-mcc:0.491816 
[29]	train-mcc:0.000000	test-mcc:0.491028 
[30]	train-mcc:0.000000	test-mcc:0.492000 
[31]	train-mcc:0.000000	test-mcc:0.492499 
[32]	train-mcc:0.000000	test-mcc:0.493260 
[33]	train-mcc:0.000000	test-mcc:0.493204 
[34]	train-mcc:0.000000	test-mcc:0.494462 
[35]	train-mcc:0.000000	test-mcc:0.494311 
[36]	train-mcc:0.000000	test-mcc:0.494883 
[37]	train-mcc:0.000000	test-mcc:0.496746 
[38]	train-mcc:0.000000	test-mcc:0.498276 
[39]	train-mcc:0.000000	test-mcc:0.499167 
[40]	train-mcc:0.000000	test-mcc:0.497641 
[41]	train-mcc:0.000000	test-mcc:0.497390 
[42]	train-mcc:0.000000	test-mcc:0.496949 
[43]	train-mcc:0.000000	test-mcc:0.496949 
[44]	train-mcc:0.000000	test-mcc:0.496949 
[45]	train-mcc:0.000000	test-mcc:0.496144 
[46]	train-mcc:0.000000	test-mcc:0.495888 
[47]	train-mcc:0.000000	test-mcc:0.496509 
[48]	train-mcc:0.000000	test-mcc:0.496257 
[49]	train-mcc:0.000000	test-mcc:0.496078 
[50]	train-mcc:0.000000	test-mcc:0.495816 
[51]	train-mcc:0.000000	test-mcc:0.496698 
[52]	train-mcc:0.000000	test-mcc:0.495994 
[53]	train-mcc:0.000000	test-mcc:0.497007 
[54]	train-mcc:0.000000	test-mcc:0.496318 
[55]	train-mcc:0.000000	test-mcc:0.494841 
[56]	train-mcc:0.000000	test-mcc:0.493958 
[57]	train-mcc:0.000000	test-mcc:0.493719 
[58]	train-mcc:0.000000	test-mcc:0.492170 
[59]	train-mcc:0.000000	test-mcc:0.493083 
[60]	train-mcc:0.000000	test-mcc:0.493029 
[61]	train-mcc:0.000000	test-mcc:0.493029 
[62]	train-mcc:0.000000	test-mcc:0.493029 
[63]	train-mcc:0.000000	test-mcc:0.493029 
[64]	train-mcc:0.000000	test-mcc:0.493563 
[65]	train-mcc:0.000000	test-mcc:0.493281 
[66]	train-mcc:0.000000	test-mcc:0.492721 
[67]	train-mcc:0.000000	test-mcc:0.492104 
[68]	train-mcc:0.000000	test-mcc:0.492212 
[69]	train-mcc:0.000000	test-mcc:0.493754 
Stopping. Best iteration:
[39]	train-mcc:0.000000	test-mcc:0.499167


Time: Thu Nov 10 2016 09:32:30 AM
For 0039 rounds: train_mcc: 0 - test_mcc: 0.4991671
Confusion matrix:
     truth
preds      0      1
    0 235250    934
    1    124    442
     truth
preds            0            1
    0 0.9936642027 0.0039450898
    1 0.0005237592 0.0018669483
Iteration 25 (base=0.4448803): MCC=0.4991671 | threshold=0.3794877



Iteration 25[4] on Thu Nov 10 2016 09:32:32 AM

depth=8, min_child_weight=50, subsample=0.8137507, colsample_bytree=0.5242916, base_score=0.4448803
[1]	train-mcc:0.000000	test-mcc:0.477520 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480802 
[3]	train-mcc:0.000000	test-mcc:0.478222 
[4]	train-mcc:0.000000	test-mcc:0.480569 
[5]	train-mcc:0.000000	test-mcc:0.482932 
[6]	train-mcc:0.000000	test-mcc:0.482663 
[7]	train-mcc:0.000000	test-mcc:0.483818 
[8]	train-mcc:0.000000	test-mcc:0.484812 
[9]	train-mcc:0.000000	test-mcc:0.486830 
[10]	train-mcc:0.000000	test-mcc:0.484189 
[11]	train-mcc:0.000000	test-mcc:0.483680 
[12]	train-mcc:0.000000	test-mcc:0.484412 
[13]	train-mcc:0.000000	test-mcc:0.485191 
[14]	train-mcc:0.000000	test-mcc:0.484316 
[15]	train-mcc:0.000000	test-mcc:0.485585 
[16]	train-mcc:0.000000	test-mcc:0.484762 
[17]	train-mcc:0.000000	test-mcc:0.484762 
[18]	train-mcc:0.000000	test-mcc:0.482849 
[19]	train-mcc:0.000000	test-mcc:0.484354 
[20]	train-mcc:0.000000	test-mcc:0.483348 
[21]	train-mcc:0.000000	test-mcc:0.483511 
[22]	train-mcc:0.000000	test-mcc:0.483038 
[23]	train-mcc:0.000000	test-mcc:0.482685 
[24]	train-mcc:0.000000	test-mcc:0.481649 
[25]	train-mcc:0.000000	test-mcc:0.482506 
[26]	train-mcc:0.000000	test-mcc:0.481266 
[27]	train-mcc:0.000000	test-mcc:0.481369 
[28]	train-mcc:0.000000	test-mcc:0.481160 
[29]	train-mcc:0.000000	test-mcc:0.481555 
[30]	train-mcc:0.000000	test-mcc:0.482428 
[31]	train-mcc:0.000000	test-mcc:0.481395 
[32]	train-mcc:0.000000	test-mcc:0.481282 
[33]	train-mcc:0.000000	test-mcc:0.479931 
[34]	train-mcc:0.000000	test-mcc:0.480107 
[35]	train-mcc:0.000000	test-mcc:0.481957 
[36]	train-mcc:0.000000	test-mcc:0.481608 
[37]	train-mcc:0.000000	test-mcc:0.481751 
[38]	train-mcc:0.000000	test-mcc:0.479909 
[39]	train-mcc:0.000000	test-mcc:0.479909 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.486830


Time: Thu Nov 10 2016 09:33:39 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.4868303
Confusion matrix:
     truth
preds      0      1
    0 235183    912
    1    191    464
     truth
preds            0            1
    0 0.9933812038 0.0038521647
    1 0.0008067582 0.0019598733
Iteration 25 (base=0.4448803): MCC=0.4868303 | threshold=0.3247845



Iteration 25[5] on Thu Nov 10 2016 09:33:40 AM

depth=8, min_child_weight=50, subsample=0.8137507, colsample_bytree=0.5242916, base_score=0.4448803
[1]	train-mcc:0.000000	test-mcc:0.480825 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483479 
[3]	train-mcc:0.000000	test-mcc:0.484626 
[4]	train-mcc:0.000000	test-mcc:0.488691 
[5]	train-mcc:0.000000	test-mcc:0.487800 
[6]	train-mcc:0.000000	test-mcc:0.488780 
[7]	train-mcc:0.000000	test-mcc:0.488344 
[8]	train-mcc:0.000000	test-mcc:0.490449 
[9]	train-mcc:0.000000	test-mcc:0.487705 
[10]	train-mcc:0.000000	test-mcc:0.489884 
[11]	train-mcc:0.000000	test-mcc:0.489239 
[12]	train-mcc:0.000000	test-mcc:0.488229 
[13]	train-mcc:0.000000	test-mcc:0.486882 
[14]	train-mcc:0.000000	test-mcc:0.487023 
[15]	train-mcc:0.000000	test-mcc:0.489746 
[16]	train-mcc:0.000000	test-mcc:0.489474 
[17]	train-mcc:0.000000	test-mcc:0.490470 
[18]	train-mcc:0.000000	test-mcc:0.491359 
[19]	train-mcc:0.000000	test-mcc:0.490609 
[20]	train-mcc:0.000000	test-mcc:0.491538 
[21]	train-mcc:0.000000	test-mcc:0.487834 
[22]	train-mcc:0.000000	test-mcc:0.487464 
[23]	train-mcc:0.000000	test-mcc:0.487744 
[24]	train-mcc:0.000000	test-mcc:0.486746 
[25]	train-mcc:0.000000	test-mcc:0.487414 
[26]	train-mcc:0.000000	test-mcc:0.486596 
[27]	train-mcc:0.000000	test-mcc:0.487538 
[28]	train-mcc:0.000000	test-mcc:0.485687 
[29]	train-mcc:0.000000	test-mcc:0.486725 
[30]	train-mcc:0.000000	test-mcc:0.487520 
[31]	train-mcc:0.000000	test-mcc:0.487052 
[32]	train-mcc:0.000000	test-mcc:0.484283 
[33]	train-mcc:0.000000	test-mcc:0.484018 
[34]	train-mcc:0.000000	test-mcc:0.484506 
[35]	train-mcc:0.000000	test-mcc:0.483766 
[36]	train-mcc:0.000000	test-mcc:0.485486 
[37]	train-mcc:0.000000	test-mcc:0.483381 
[38]	train-mcc:0.000000	test-mcc:0.483521 
[39]	train-mcc:0.000000	test-mcc:0.484476 
[40]	train-mcc:0.000000	test-mcc:0.484239 
[41]	train-mcc:0.000000	test-mcc:0.485193 
[42]	train-mcc:0.000000	test-mcc:0.484485 
[43]	train-mcc:0.000000	test-mcc:0.486525 
[44]	train-mcc:0.000000	test-mcc:0.486026 
[45]	train-mcc:0.000000	test-mcc:0.486026 
[46]	train-mcc:0.000000	test-mcc:0.485033 
[47]	train-mcc:0.000000	test-mcc:0.486249 
[48]	train-mcc:0.000000	test-mcc:0.486472 
[49]	train-mcc:0.000000	test-mcc:0.485978 
[50]	train-mcc:0.000000	test-mcc:0.480694 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.491538


Time: Thu Nov 10 2016 09:35:15 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.4915381
Confusion matrix:
     truth
preds      0      1
    0 235283    967
    1     91    409
     truth
preds            0            1
    0 0.9938035903 0.0040844773
    1 0.0003843717 0.0017275607
Iteration 25 (base=0.4448803): MCC=0.4915381 | threshold=0.4119948


===




Iteration 26[1] on Thu Nov 10 2016 09:35:51 AM

depth=8, min_child_weight=9.407928, subsample=0.7575715, colsample_bytree=0.5, base_score=0.3729189
[1]	train-mcc:0.000000	test-mcc:0.463063 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477354 
[3]	train-mcc:0.000000	test-mcc:0.479949 
[4]	train-mcc:0.000000	test-mcc:0.479013 
[5]	train-mcc:0.000000	test-mcc:0.476097 
[6]	train-mcc:0.000000	test-mcc:0.476454 
[7]	train-mcc:0.000000	test-mcc:0.475642 
[8]	train-mcc:0.000000	test-mcc:0.477750 
[9]	train-mcc:0.000000	test-mcc:0.474921 
[10]	train-mcc:0.000000	test-mcc:0.476017 
[11]	train-mcc:0.000000	test-mcc:0.475050 
[12]	train-mcc:0.000000	test-mcc:0.474095 
[13]	train-mcc:0.000000	test-mcc:0.476294 
[14]	train-mcc:0.000000	test-mcc:0.476330 
[15]	train-mcc:0.000000	test-mcc:0.476782 
[16]	train-mcc:0.000000	test-mcc:0.477441 
[17]	train-mcc:0.000000	test-mcc:0.478434 
[18]	train-mcc:0.000000	test-mcc:0.477871 
[19]	train-mcc:0.000000	test-mcc:0.478152 
[20]	train-mcc:0.000000	test-mcc:0.478434 
[21]	train-mcc:0.000000	test-mcc:0.477604 
[22]	train-mcc:0.000000	test-mcc:0.479294 
[23]	train-mcc:0.000000	test-mcc:0.479223 
[24]	train-mcc:0.000000	test-mcc:0.478291 
[25]	train-mcc:0.000000	test-mcc:0.477649 
[26]	train-mcc:0.000000	test-mcc:0.479000 
[27]	train-mcc:0.000000	test-mcc:0.479773 
[28]	train-mcc:0.000000	test-mcc:0.479985 
[29]	train-mcc:0.000000	test-mcc:0.482060 
[30]	train-mcc:0.000000	test-mcc:0.482167 
[31]	train-mcc:0.000000	test-mcc:0.482081 
[32]	train-mcc:0.000000	test-mcc:0.482266 
[33]	train-mcc:0.000000	test-mcc:0.483363 
[34]	train-mcc:0.000000	test-mcc:0.483252 
[35]	train-mcc:0.000000	test-mcc:0.481474 
[36]	train-mcc:0.000000	test-mcc:0.482457 
[37]	train-mcc:0.000000	test-mcc:0.482457 
[38]	train-mcc:0.000000	test-mcc:0.483744 
[39]	train-mcc:0.000000	test-mcc:0.484538 
[40]	train-mcc:0.000000	test-mcc:0.483950 
[41]	train-mcc:0.000000	test-mcc:0.483363 
[42]	train-mcc:0.000000	test-mcc:0.483766 
[43]	train-mcc:0.000000	test-mcc:0.483363 
[44]	train-mcc:0.000000	test-mcc:0.480370 
[45]	train-mcc:0.000000	test-mcc:0.481663 
[46]	train-mcc:0.000000	test-mcc:0.481267 
[47]	train-mcc:0.000000	test-mcc:0.482457 
[48]	train-mcc:0.000000	test-mcc:0.480163 
[49]	train-mcc:0.000000	test-mcc:0.479874 
[50]	train-mcc:0.000000	test-mcc:0.479874 
[51]	train-mcc:0.000000	test-mcc:0.480696 
[52]	train-mcc:0.000000	test-mcc:0.480696 
[53]	train-mcc:0.000000	test-mcc:0.480979 
[54]	train-mcc:0.000000	test-mcc:0.480273 
[55]	train-mcc:0.000000	test-mcc:0.480273 
[56]	train-mcc:0.000000	test-mcc:0.481203 
[57]	train-mcc:0.000000	test-mcc:0.481612 
[58]	train-mcc:0.000000	test-mcc:0.480841 
[59]	train-mcc:0.000000	test-mcc:0.480841 
[60]	train-mcc:0.000000	test-mcc:0.480136 
[61]	train-mcc:0.000000	test-mcc:0.479283 
[62]	train-mcc:0.000000	test-mcc:0.479283 
[63]	train-mcc:0.000000	test-mcc:0.479676 
[64]	train-mcc:0.000000	test-mcc:0.479534 
[65]	train-mcc:0.000000	test-mcc:0.478220 
[66]	train-mcc:0.000000	test-mcc:0.477839 
[67]	train-mcc:0.000000	test-mcc:0.480444 
[68]	train-mcc:0.000000	test-mcc:0.480444 
[69]	train-mcc:0.000000	test-mcc:0.478830 
Stopping. Best iteration:
[39]	train-mcc:0.000000	test-mcc:0.484538


Time: Thu Nov 10 2016 09:38:09 AM
For 0039 rounds: train_mcc: 0 - test_mcc: 0.4845379
Confusion matrix:
     truth
preds      0      1
    0 235204    927
    1    169    448
     truth
preds            0            1
    0 0.9934782976 0.0039155558
    1 0.0007138392 0.0018923074
Iteration 26 (base=0.3729189): MCC=0.4845379 | threshold=0.3670058



Iteration 26[2] on Thu Nov 10 2016 09:38:11 AM

depth=8, min_child_weight=9.407928, subsample=0.7575715, colsample_bytree=0.5, base_score=0.3729189
[1]	train-mcc:0.000000	test-mcc:0.458393 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.468548 
[3]	train-mcc:0.000000	test-mcc:0.476340 
[4]	train-mcc:0.000000	test-mcc:0.477506 
[5]	train-mcc:0.000000	test-mcc:0.478746 
[6]	train-mcc:0.000000	test-mcc:0.481683 
[7]	train-mcc:0.000000	test-mcc:0.480514 
[8]	train-mcc:0.000000	test-mcc:0.479510 
[9]	train-mcc:0.000000	test-mcc:0.479497 
[10]	train-mcc:0.000000	test-mcc:0.483065 
[11]	train-mcc:0.000000	test-mcc:0.483038 
[12]	train-mcc:0.000000	test-mcc:0.485424 
[13]	train-mcc:0.000000	test-mcc:0.486765 
[14]	train-mcc:0.000000	test-mcc:0.482916 
[15]	train-mcc:0.000000	test-mcc:0.485745 
[16]	train-mcc:0.000000	test-mcc:0.484818 
[17]	train-mcc:0.000000	test-mcc:0.483971 
[18]	train-mcc:0.000000	test-mcc:0.484177 
[19]	train-mcc:0.000000	test-mcc:0.482624 
[20]	train-mcc:0.000000	test-mcc:0.481683 
[21]	train-mcc:0.000000	test-mcc:0.482833 
[22]	train-mcc:0.000000	test-mcc:0.483325 
[23]	train-mcc:0.000000	test-mcc:0.481649 
[24]	train-mcc:0.000000	test-mcc:0.482111 
[25]	train-mcc:0.000000	test-mcc:0.481393 
[26]	train-mcc:0.000000	test-mcc:0.480569 
[27]	train-mcc:0.000000	test-mcc:0.480741 
[28]	train-mcc:0.000000	test-mcc:0.479626 
[29]	train-mcc:0.000000	test-mcc:0.480222 
[30]	train-mcc:0.000000	test-mcc:0.480444 
[31]	train-mcc:0.000000	test-mcc:0.480735 
[32]	train-mcc:0.000000	test-mcc:0.480689 
[33]	train-mcc:0.000000	test-mcc:0.481678 
[34]	train-mcc:0.000000	test-mcc:0.480689 
[35]	train-mcc:0.000000	test-mcc:0.482092 
[36]	train-mcc:0.000000	test-mcc:0.481966 
[37]	train-mcc:0.000000	test-mcc:0.481678 
[38]	train-mcc:0.000000	test-mcc:0.480977 
[39]	train-mcc:0.000000	test-mcc:0.481266 
[40]	train-mcc:0.000000	test-mcc:0.481640 
[41]	train-mcc:0.000000	test-mcc:0.480906 
[42]	train-mcc:0.000000	test-mcc:0.482032 
[43]	train-mcc:0.000000	test-mcc:0.482764 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.486765


Time: Thu Nov 10 2016 09:39:30 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4867647
Confusion matrix:
     truth
preds      0      1
    0 235291    980
    1     82    396
     truth
preds            0            1
    0 0.9938415791 0.0041394050
    1 0.0003463584 0.0016726575
Iteration 26 (base=0.3729189): MCC=0.4867647 | threshold=0.4485845



Iteration 26[3] on Thu Nov 10 2016 09:39:31 AM

depth=8, min_child_weight=9.407928, subsample=0.7575715, colsample_bytree=0.5, base_score=0.3729189
[1]	train-mcc:0.000000	test-mcc:0.483297 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487803 
[3]	train-mcc:0.000000	test-mcc:0.485921 
[4]	train-mcc:0.000000	test-mcc:0.486072 
[5]	train-mcc:0.000000	test-mcc:0.487365 
[6]	train-mcc:0.000000	test-mcc:0.487376 
[7]	train-mcc:0.000000	test-mcc:0.488054 
[8]	train-mcc:0.000000	test-mcc:0.487999 
[9]	train-mcc:0.000000	test-mcc:0.488422 
[10]	train-mcc:0.000000	test-mcc:0.487942 
[11]	train-mcc:0.000000	test-mcc:0.491420 
[12]	train-mcc:0.000000	test-mcc:0.491850 
[13]	train-mcc:0.000000	test-mcc:0.492554 
[14]	train-mcc:0.000000	test-mcc:0.490261 
[15]	train-mcc:0.000000	test-mcc:0.490273 
[16]	train-mcc:0.000000	test-mcc:0.490765 
[17]	train-mcc:0.000000	test-mcc:0.491478 
[18]	train-mcc:0.000000	test-mcc:0.491971 
[19]	train-mcc:0.000000	test-mcc:0.490470 
[20]	train-mcc:0.000000	test-mcc:0.491389 
[21]	train-mcc:0.000000	test-mcc:0.491368 
[22]	train-mcc:0.000000	test-mcc:0.492073 
[23]	train-mcc:0.000000	test-mcc:0.491430 
[24]	train-mcc:0.000000	test-mcc:0.492036 
[25]	train-mcc:0.000000	test-mcc:0.490776 
[26]	train-mcc:0.000000	test-mcc:0.490328 
[27]	train-mcc:0.000000	test-mcc:0.489705 
[28]	train-mcc:0.000000	test-mcc:0.491612 
[29]	train-mcc:0.000000	test-mcc:0.491041 
[30]	train-mcc:0.000000	test-mcc:0.490328 
[31]	train-mcc:0.000000	test-mcc:0.490110 
[32]	train-mcc:0.000000	test-mcc:0.488898 
[33]	train-mcc:0.000000	test-mcc:0.489894 
[34]	train-mcc:0.000000	test-mcc:0.489707 
[35]	train-mcc:0.000000	test-mcc:0.489474 
[36]	train-mcc:0.000000	test-mcc:0.488297 
[37]	train-mcc:0.000000	test-mcc:0.489894 
[38]	train-mcc:0.000000	test-mcc:0.490417 
[39]	train-mcc:0.000000	test-mcc:0.491850 
[40]	train-mcc:0.000000	test-mcc:0.491609 
[41]	train-mcc:0.000000	test-mcc:0.491609 
[42]	train-mcc:0.000000	test-mcc:0.491389 
[43]	train-mcc:0.000000	test-mcc:0.492073 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.492554


Time: Thu Nov 10 2016 09:40:50 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4925538
Confusion matrix:
     truth
preds      0      1
    0 235260    950
    1    114    426
     truth
preds            0            1
    0 0.9937064414 0.0040126716
    1 0.0004815206 0.0017993664
Iteration 26 (base=0.3729189): MCC=0.4925538 | threshold=0.3935304



Iteration 26[4] on Thu Nov 10 2016 09:40:52 AM

depth=8, min_child_weight=9.407928, subsample=0.7575715, colsample_bytree=0.5, base_score=0.3729189
[1]	train-mcc:0.000000	test-mcc:0.468638 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.470731 
[3]	train-mcc:0.000000	test-mcc:0.472704 
[4]	train-mcc:0.000000	test-mcc:0.477354 
[5]	train-mcc:0.000000	test-mcc:0.480056 
[6]	train-mcc:0.000000	test-mcc:0.484010 
[7]	train-mcc:0.000000	test-mcc:0.483930 
[8]	train-mcc:0.000000	test-mcc:0.483319 
[9]	train-mcc:0.000000	test-mcc:0.483127 
[10]	train-mcc:0.000000	test-mcc:0.483059 
[11]	train-mcc:0.000000	test-mcc:0.483188 
[12]	train-mcc:0.000000	test-mcc:0.482577 
[13]	train-mcc:0.000000	test-mcc:0.481372 
[14]	train-mcc:0.000000	test-mcc:0.481089 
[15]	train-mcc:0.000000	test-mcc:0.483299 
[16]	train-mcc:0.000000	test-mcc:0.482230 
[17]	train-mcc:0.000000	test-mcc:0.482764 
[18]	train-mcc:0.000000	test-mcc:0.484173 
[19]	train-mcc:0.000000	test-mcc:0.483645 
[20]	train-mcc:0.000000	test-mcc:0.483997 
[21]	train-mcc:0.000000	test-mcc:0.483849 
[22]	train-mcc:0.000000	test-mcc:0.484584 
[23]	train-mcc:0.000000	test-mcc:0.484755 
[24]	train-mcc:0.000000	test-mcc:0.484755 
[25]	train-mcc:0.000000	test-mcc:0.484767 
[26]	train-mcc:0.000000	test-mcc:0.484375 
[27]	train-mcc:0.000000	test-mcc:0.484729 
[28]	train-mcc:0.000000	test-mcc:0.484806 
[29]	train-mcc:0.000000	test-mcc:0.483836 
[30]	train-mcc:0.000000	test-mcc:0.484144 
[31]	train-mcc:0.000000	test-mcc:0.483626 
[32]	train-mcc:0.000000	test-mcc:0.483889 
[33]	train-mcc:0.000000	test-mcc:0.484543 
[34]	train-mcc:0.000000	test-mcc:0.484543 
[35]	train-mcc:0.000000	test-mcc:0.484358 
[36]	train-mcc:0.000000	test-mcc:0.484916 
[37]	train-mcc:0.000000	test-mcc:0.483645 
[38]	train-mcc:0.000000	test-mcc:0.483946 
[39]	train-mcc:0.000000	test-mcc:0.483283 
[40]	train-mcc:0.000000	test-mcc:0.483177 
[41]	train-mcc:0.000000	test-mcc:0.483432 
[42]	train-mcc:0.000000	test-mcc:0.484175 
[43]	train-mcc:0.000000	test-mcc:0.483776 
[44]	train-mcc:0.000000	test-mcc:0.483265 
[45]	train-mcc:0.000000	test-mcc:0.482344 
[46]	train-mcc:0.000000	test-mcc:0.482344 
[47]	train-mcc:0.000000	test-mcc:0.483078 
[48]	train-mcc:0.000000	test-mcc:0.482563 
[49]	train-mcc:0.000000	test-mcc:0.482563 
[50]	train-mcc:0.000000	test-mcc:0.481683 
[51]	train-mcc:0.000000	test-mcc:0.482124 
[52]	train-mcc:0.000000	test-mcc:0.482124 
[53]	train-mcc:0.000000	test-mcc:0.482124 
[54]	train-mcc:0.000000	test-mcc:0.482124 
[55]	train-mcc:0.000000	test-mcc:0.482160 
[56]	train-mcc:0.000000	test-mcc:0.482124 
[57]	train-mcc:0.000000	test-mcc:0.482081 
[58]	train-mcc:0.000000	test-mcc:0.481600 
[59]	train-mcc:0.000000	test-mcc:0.481600 
[60]	train-mcc:0.000000	test-mcc:0.481191 
[61]	train-mcc:0.000000	test-mcc:0.481372 
[62]	train-mcc:0.000000	test-mcc:0.482430 
[63]	train-mcc:0.000000	test-mcc:0.479434 
[64]	train-mcc:0.000000	test-mcc:0.481063 
[65]	train-mcc:0.000000	test-mcc:0.482180 
[66]	train-mcc:0.000000	test-mcc:0.481989 
Stopping. Best iteration:
[36]	train-mcc:0.000000	test-mcc:0.484916


Time: Thu Nov 10 2016 09:42:59 AM
For 0036 rounds: train_mcc: 0 - test_mcc: 0.4849161
Confusion matrix:
     truth
preds      0      1
    0 235305    992
    1     69    384
     truth
preds            0            1
    0 0.9938965153 0.0041900739
    1 0.0002914467 0.0016219641
Iteration 26 (base=0.3729189): MCC=0.4849161 | threshold=0.4939899



Iteration 26[5] on Thu Nov 10 2016 09:43:00 AM

depth=8, min_child_weight=9.407928, subsample=0.7575715, colsample_bytree=0.5, base_score=0.3729189
[1]	train-mcc:0.000000	test-mcc:0.484964 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484400 
[3]	train-mcc:0.000000	test-mcc:0.486754 
[4]	train-mcc:0.000000	test-mcc:0.487789 
[5]	train-mcc:0.000000	test-mcc:0.488923 
[6]	train-mcc:0.000000	test-mcc:0.490680 
[7]	train-mcc:0.000000	test-mcc:0.488997 
[8]	train-mcc:0.000000	test-mcc:0.487834 
[9]	train-mcc:0.000000	test-mcc:0.487021 
[10]	train-mcc:0.000000	test-mcc:0.486687 
[11]	train-mcc:0.000000	test-mcc:0.491113 
[12]	train-mcc:0.000000	test-mcc:0.492580 
[13]	train-mcc:0.000000	test-mcc:0.492864 
[14]	train-mcc:0.000000	test-mcc:0.493982 
[15]	train-mcc:0.000000	test-mcc:0.495311 
[16]	train-mcc:0.000000	test-mcc:0.494959 
[17]	train-mcc:0.000000	test-mcc:0.495059 
[18]	train-mcc:0.000000	test-mcc:0.493478 
[19]	train-mcc:0.000000	test-mcc:0.493224 
[20]	train-mcc:0.000000	test-mcc:0.493920 
[21]	train-mcc:0.000000	test-mcc:0.494059 
[22]	train-mcc:0.000000	test-mcc:0.491900 
[23]	train-mcc:0.000000	test-mcc:0.493415 
[24]	train-mcc:0.000000	test-mcc:0.492340 
[25]	train-mcc:0.000000	test-mcc:0.493478 
[26]	train-mcc:0.000000	test-mcc:0.492340 
[27]	train-mcc:0.000000	test-mcc:0.492340 
[28]	train-mcc:0.000000	test-mcc:0.493551 
[29]	train-mcc:0.000000	test-mcc:0.492855 
[30]	train-mcc:0.000000	test-mcc:0.493551 
[31]	train-mcc:0.000000	test-mcc:0.493037 
[32]	train-mcc:0.000000	test-mcc:0.492170 
[33]	train-mcc:0.000000	test-mcc:0.491595 
[34]	train-mcc:0.000000	test-mcc:0.491595 
[35]	train-mcc:0.000000	test-mcc:0.491595 
[36]	train-mcc:0.000000	test-mcc:0.490422 
[37]	train-mcc:0.000000	test-mcc:0.491877 
[38]	train-mcc:0.000000	test-mcc:0.492795 
[39]	train-mcc:0.000000	test-mcc:0.492336 
[40]	train-mcc:0.000000	test-mcc:0.490929 
[41]	train-mcc:0.000000	test-mcc:0.489661 
[42]	train-mcc:0.000000	test-mcc:0.490212 
[43]	train-mcc:0.000000	test-mcc:0.490851 
[44]	train-mcc:0.000000	test-mcc:0.492094 
[45]	train-mcc:0.000000	test-mcc:0.494156 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.495311


Time: Thu Nov 10 2016 09:44:24 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4953108
Confusion matrix:
     truth
preds      0      1
    0 235246    937
    1    128    439
     truth
preds            0            1
    0 0.9936473073 0.0039577614
    1 0.0005406547 0.0018542767
Iteration 26 (base=0.3729189): MCC=0.4953108 | threshold=0.363081


===




Iteration 27[1] on Thu Nov 10 2016 09:45:00 AM

depth=5, min_child_weight=50, subsample=0.5238144, colsample_bytree=0.704163, base_score=0.1041236
[1]	train-mcc:0.000000	test-mcc:0.461218 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471006 
[3]	train-mcc:0.000000	test-mcc:0.473428 
[4]	train-mcc:0.000000	test-mcc:0.474603 
[5]	train-mcc:0.000000	test-mcc:0.474708 
[6]	train-mcc:0.000000	test-mcc:0.477188 
[7]	train-mcc:0.000000	test-mcc:0.476782 
[8]	train-mcc:0.000000	test-mcc:0.477819 
[9]	train-mcc:0.000000	test-mcc:0.480903 
[10]	train-mcc:0.000000	test-mcc:0.479894 
[11]	train-mcc:0.000000	test-mcc:0.480116 
[12]	train-mcc:0.000000	test-mcc:0.480650 
[13]	train-mcc:0.000000	test-mcc:0.479260 
[14]	train-mcc:0.000000	test-mcc:0.478144 
[15]	train-mcc:0.000000	test-mcc:0.479125 
[16]	train-mcc:0.000000	test-mcc:0.480297 
[17]	train-mcc:0.000000	test-mcc:0.477931 
[18]	train-mcc:0.000000	test-mcc:0.477139 
[19]	train-mcc:0.000000	test-mcc:0.476869 
[20]	train-mcc:0.000000	test-mcc:0.478303 
[21]	train-mcc:0.000000	test-mcc:0.477586 
[22]	train-mcc:0.000000	test-mcc:0.477139 
[23]	train-mcc:0.000000	test-mcc:0.475450 
[24]	train-mcc:0.000000	test-mcc:0.475557 
[25]	train-mcc:0.000000	test-mcc:0.475983 
[26]	train-mcc:0.000000	test-mcc:0.475718 
[27]	train-mcc:0.000000	test-mcc:0.475282 
[28]	train-mcc:0.000000	test-mcc:0.476704 
[29]	train-mcc:0.000000	test-mcc:0.475454 
[30]	train-mcc:0.000000	test-mcc:0.475396 
[31]	train-mcc:0.000000	test-mcc:0.475396 
[32]	train-mcc:0.000000	test-mcc:0.474925 
[33]	train-mcc:0.000000	test-mcc:0.474983 
[34]	train-mcc:0.000000	test-mcc:0.474983 
[35]	train-mcc:0.000000	test-mcc:0.476246 
[36]	train-mcc:0.000000	test-mcc:0.475771 
[37]	train-mcc:0.000000	test-mcc:0.476233 
[38]	train-mcc:0.000000	test-mcc:0.475731 
[39]	train-mcc:0.000000	test-mcc:0.475241 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.480903


Time: Thu Nov 10 2016 09:46:03 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.4809034
Confusion matrix:
     truth
preds      0      1
    0 235258    965
    1    115    410
     truth
preds            0            1
    0 0.9937063882 0.0040760640
    1 0.0004857486 0.0017317992
Iteration 27 (base=0.1041236): MCC=0.4809034 | threshold=0.399332



Iteration 27[2] on Thu Nov 10 2016 09:46:04 AM

depth=5, min_child_weight=50, subsample=0.5238144, colsample_bytree=0.704163, base_score=0.1041236
[1]	train-mcc:0.000000	test-mcc:0.474410 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477003 
[3]	train-mcc:0.000000	test-mcc:0.481599 
[4]	train-mcc:0.000000	test-mcc:0.482309 
[5]	train-mcc:0.000000	test-mcc:0.481730 
[6]	train-mcc:0.000000	test-mcc:0.482874 
[7]	train-mcc:0.000000	test-mcc:0.481900 
[8]	train-mcc:0.000000	test-mcc:0.486685 
[9]	train-mcc:0.000000	test-mcc:0.483453 
[10]	train-mcc:0.000000	test-mcc:0.483283 
[11]	train-mcc:0.000000	test-mcc:0.483118 
[12]	train-mcc:0.000000	test-mcc:0.481251 
[13]	train-mcc:0.000000	test-mcc:0.481517 
[14]	train-mcc:0.000000	test-mcc:0.481278 
[15]	train-mcc:0.000000	test-mcc:0.480295 
[16]	train-mcc:0.000000	test-mcc:0.480408 
[17]	train-mcc:0.000000	test-mcc:0.481432 
[18]	train-mcc:0.000000	test-mcc:0.481649 
[19]	train-mcc:0.000000	test-mcc:0.483818 
[20]	train-mcc:0.000000	test-mcc:0.483096 
[21]	train-mcc:0.000000	test-mcc:0.483365 
[22]	train-mcc:0.000000	test-mcc:0.481649 
[23]	train-mcc:0.000000	test-mcc:0.482577 
[24]	train-mcc:0.000000	test-mcc:0.481155 
[25]	train-mcc:0.000000	test-mcc:0.482416 
[26]	train-mcc:0.000000	test-mcc:0.481465 
[27]	train-mcc:0.000000	test-mcc:0.480530 
[28]	train-mcc:0.000000	test-mcc:0.481517 
[29]	train-mcc:0.000000	test-mcc:0.481191 
[30]	train-mcc:0.000000	test-mcc:0.480221 
[31]	train-mcc:0.000000	test-mcc:0.481605 
[32]	train-mcc:0.000000	test-mcc:0.481881 
[33]	train-mcc:0.000000	test-mcc:0.481517 
[34]	train-mcc:0.000000	test-mcc:0.484493 
[35]	train-mcc:0.000000	test-mcc:0.483842 
[36]	train-mcc:0.000000	test-mcc:0.484054 
[37]	train-mcc:0.000000	test-mcc:0.483090 
[38]	train-mcc:0.000000	test-mcc:0.482374 
Stopping. Best iteration:
[8]	train-mcc:0.000000	test-mcc:0.486685


Time: Thu Nov 10 2016 09:47:00 AM
For 0008 rounds: train_mcc: 0 - test_mcc: 0.4866849
Confusion matrix:
     truth
preds      0      1
    0 235341   1019
    1     32    357
     truth
preds            0            1
    0 0.9940527732 0.0043041364
    1 0.0001351642 0.0015079261
Iteration 27 (base=0.1041236): MCC=0.4866849 | threshold=0.4723694



Iteration 27[3] on Thu Nov 10 2016 09:47:02 AM

depth=5, min_child_weight=50, subsample=0.5238144, colsample_bytree=0.704163, base_score=0.1041236
[1]	train-mcc:0.000000	test-mcc:0.482693 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485921 
[3]	train-mcc:0.000000	test-mcc:0.487596 
[4]	train-mcc:0.000000	test-mcc:0.492313 
[5]	train-mcc:0.000000	test-mcc:0.493839 
[6]	train-mcc:0.000000	test-mcc:0.492954 
[7]	train-mcc:0.000000	test-mcc:0.490162 
[8]	train-mcc:0.000000	test-mcc:0.491492 
[9]	train-mcc:0.000000	test-mcc:0.488898 
[10]	train-mcc:0.000000	test-mcc:0.488898 
[11]	train-mcc:0.000000	test-mcc:0.489069 
[12]	train-mcc:0.000000	test-mcc:0.489069 
[13]	train-mcc:0.000000	test-mcc:0.490983 
[14]	train-mcc:0.000000	test-mcc:0.490943 
[15]	train-mcc:0.000000	test-mcc:0.490912 
[16]	train-mcc:0.000000	test-mcc:0.491905 
[17]	train-mcc:0.000000	test-mcc:0.492335 
[18]	train-mcc:0.000000	test-mcc:0.491742 
[19]	train-mcc:0.000000	test-mcc:0.491478 
[20]	train-mcc:0.000000	test-mcc:0.491971 
[21]	train-mcc:0.000000	test-mcc:0.492466 
[22]	train-mcc:0.000000	test-mcc:0.490986 
[23]	train-mcc:0.000000	test-mcc:0.490765 
[24]	train-mcc:0.000000	test-mcc:0.490765 
[25]	train-mcc:0.000000	test-mcc:0.490781 
[26]	train-mcc:0.000000	test-mcc:0.491547 
[27]	train-mcc:0.000000	test-mcc:0.491113 
[28]	train-mcc:0.000000	test-mcc:0.491653 
[29]	train-mcc:0.000000	test-mcc:0.492170 
[30]	train-mcc:0.000000	test-mcc:0.491905 
[31]	train-mcc:0.000000	test-mcc:0.491048 
[32]	train-mcc:0.000000	test-mcc:0.490052 
[33]	train-mcc:0.000000	test-mcc:0.491376 
[34]	train-mcc:0.000000	test-mcc:0.490353 
[35]	train-mcc:0.000000	test-mcc:0.491110 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.493839


Time: Thu Nov 10 2016 09:47:59 AM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.4938387
Confusion matrix:
     truth
preds      0      1
    0 235289    968
    1     85    408
     truth
preds            0            1
    0 0.9938289335 0.0040887012
    1 0.0003590285 0.0017233369
Iteration 27 (base=0.1041236): MCC=0.4938387 | threshold=0.3569743



Iteration 27[4] on Thu Nov 10 2016 09:48:00 AM

depth=5, min_child_weight=50, subsample=0.5238144, colsample_bytree=0.704163, base_score=0.1041236
[1]	train-mcc:0.000000	test-mcc:0.475606 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480544 
[3]	train-mcc:0.000000	test-mcc:0.482600 
[4]	train-mcc:0.000000	test-mcc:0.484818 
[5]	train-mcc:0.000000	test-mcc:0.483503 
[6]	train-mcc:0.000000	test-mcc:0.484177 
[7]	train-mcc:0.000000	test-mcc:0.486260 
[8]	train-mcc:0.000000	test-mcc:0.486187 
[9]	train-mcc:0.000000	test-mcc:0.485827 
[10]	train-mcc:0.000000	test-mcc:0.485820 
[11]	train-mcc:0.000000	test-mcc:0.484775 
[12]	train-mcc:0.000000	test-mcc:0.483846 
[13]	train-mcc:0.000000	test-mcc:0.484648 
[14]	train-mcc:0.000000	test-mcc:0.484162 
[15]	train-mcc:0.000000	test-mcc:0.484181 
[16]	train-mcc:0.000000	test-mcc:0.484940 
[17]	train-mcc:0.000000	test-mcc:0.485130 
[18]	train-mcc:0.000000	test-mcc:0.484263 
[19]	train-mcc:0.000000	test-mcc:0.483490 
[20]	train-mcc:0.000000	test-mcc:0.484818 
[21]	train-mcc:0.000000	test-mcc:0.483163 
[22]	train-mcc:0.000000	test-mcc:0.483492 
[23]	train-mcc:0.000000	test-mcc:0.484516 
[24]	train-mcc:0.000000	test-mcc:0.483846 
[25]	train-mcc:0.000000	test-mcc:0.484386 
[26]	train-mcc:0.000000	test-mcc:0.484556 
[27]	train-mcc:0.000000	test-mcc:0.484676 
[28]	train-mcc:0.000000	test-mcc:0.485571 
[29]	train-mcc:0.000000	test-mcc:0.485552 
[30]	train-mcc:0.000000	test-mcc:0.485571 
[31]	train-mcc:0.000000	test-mcc:0.485228 
[32]	train-mcc:0.000000	test-mcc:0.486219 
[33]	train-mcc:0.000000	test-mcc:0.485877 
[34]	train-mcc:0.000000	test-mcc:0.484177 
[35]	train-mcc:0.000000	test-mcc:0.485536 
[36]	train-mcc:0.000000	test-mcc:0.483181 
[37]	train-mcc:0.000000	test-mcc:0.481853 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.486260


Time: Thu Nov 10 2016 09:48:59 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4862605
Confusion matrix:
     truth
preds      0      1
    0 235144    892
    1    230    484
     truth
preds            0            1
    0 0.9932164731 0.0037676874
    1 0.0009714889 0.0020443506
Iteration 27 (base=0.1041236): MCC=0.4862605 | threshold=0.2526115



Iteration 27[5] on Thu Nov 10 2016 09:49:00 AM

depth=5, min_child_weight=50, subsample=0.5238144, colsample_bytree=0.704163, base_score=0.1041236
[1]	train-mcc:0.000000	test-mcc:0.481881 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481881 
[3]	train-mcc:0.000000	test-mcc:0.482523 
[4]	train-mcc:0.000000	test-mcc:0.483043 
[5]	train-mcc:0.000000	test-mcc:0.482331 
[6]	train-mcc:0.000000	test-mcc:0.485346 
[7]	train-mcc:0.000000	test-mcc:0.484540 
[8]	train-mcc:0.000000	test-mcc:0.485513 
[9]	train-mcc:0.000000	test-mcc:0.485616 
[10]	train-mcc:0.000000	test-mcc:0.486137 
[11]	train-mcc:0.000000	test-mcc:0.488504 
[12]	train-mcc:0.000000	test-mcc:0.488379 
[13]	train-mcc:0.000000	test-mcc:0.487538 
[14]	train-mcc:0.000000	test-mcc:0.487122 
[15]	train-mcc:0.000000	test-mcc:0.487941 
[16]	train-mcc:0.000000	test-mcc:0.486829 
[17]	train-mcc:0.000000	test-mcc:0.484595 
[18]	train-mcc:0.000000	test-mcc:0.484189 
[19]	train-mcc:0.000000	test-mcc:0.484648 
[20]	train-mcc:0.000000	test-mcc:0.485191 
[21]	train-mcc:0.000000	test-mcc:0.484100 
[22]	train-mcc:0.000000	test-mcc:0.484866 
[23]	train-mcc:0.000000	test-mcc:0.485091 
[24]	train-mcc:0.000000	test-mcc:0.484895 
[25]	train-mcc:0.000000	test-mcc:0.487538 
[26]	train-mcc:0.000000	test-mcc:0.487538 
[27]	train-mcc:0.000000	test-mcc:0.489981 
[28]	train-mcc:0.000000	test-mcc:0.487705 
[29]	train-mcc:0.000000	test-mcc:0.488583 
[30]	train-mcc:0.000000	test-mcc:0.487800 
[31]	train-mcc:0.000000	test-mcc:0.486819 
[32]	train-mcc:0.000000	test-mcc:0.487800 
[33]	train-mcc:0.000000	test-mcc:0.487318 
[34]	train-mcc:0.000000	test-mcc:0.487310 
[35]	train-mcc:0.000000	test-mcc:0.487919 
[36]	train-mcc:0.000000	test-mcc:0.488976 
[37]	train-mcc:0.000000	test-mcc:0.487410 
[38]	train-mcc:0.000000	test-mcc:0.485934 
[39]	train-mcc:0.000000	test-mcc:0.485450 
[40]	train-mcc:0.000000	test-mcc:0.485052 
[41]	train-mcc:0.000000	test-mcc:0.485234 
[42]	train-mcc:0.000000	test-mcc:0.485169 
[43]	train-mcc:0.000000	test-mcc:0.486691 
[44]	train-mcc:0.000000	test-mcc:0.484275 
[45]	train-mcc:0.000000	test-mcc:0.483541 
[46]	train-mcc:0.000000	test-mcc:0.483520 
[47]	train-mcc:0.000000	test-mcc:0.483373 
[48]	train-mcc:0.000000	test-mcc:0.484836 
[49]	train-mcc:0.000000	test-mcc:0.485575 
[50]	train-mcc:0.000000	test-mcc:0.485575 
[51]	train-mcc:0.000000	test-mcc:0.485059 
[52]	train-mcc:0.000000	test-mcc:0.484739 
[53]	train-mcc:0.000000	test-mcc:0.485091 
[54]	train-mcc:0.000000	test-mcc:0.485348 
[55]	train-mcc:0.000000	test-mcc:0.484810 
[56]	train-mcc:0.000000	test-mcc:0.486025 
[57]	train-mcc:0.000000	test-mcc:0.485208 
Stopping. Best iteration:
[27]	train-mcc:0.000000	test-mcc:0.489981


Time: Thu Nov 10 2016 09:50:34 AM
For 0027 rounds: train_mcc: 0 - test_mcc: 0.4899814
Confusion matrix:
     truth
preds      0      1
    0 235207    921
    1    167    455
     truth
preds            0            1
    0 0.9934825766 0.0038901795
    1 0.0007053854 0.0019218585
Iteration 27 (base=0.1041236): MCC=0.4899814 | threshold=0.3165805


===




Iteration 28[1] on Thu Nov 10 2016 09:51:09 AM

depth=5, min_child_weight=50, subsample=0.5974115, colsample_bytree=0.5, base_score=0.1995476
[1]	train-mcc:0.000000	test-mcc:0.441026 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472971 
[3]	train-mcc:0.000000	test-mcc:0.475691 
[4]	train-mcc:0.000000	test-mcc:0.476972 
[5]	train-mcc:0.000000	test-mcc:0.478846 
[6]	train-mcc:0.000000	test-mcc:0.479880 
[7]	train-mcc:0.000000	test-mcc:0.478919 
[8]	train-mcc:0.000000	test-mcc:0.481142 
[9]	train-mcc:0.000000	test-mcc:0.479582 
[10]	train-mcc:0.000000	test-mcc:0.480917 
[11]	train-mcc:0.000000	test-mcc:0.479364 
[12]	train-mcc:0.000000	test-mcc:0.480289 
[13]	train-mcc:0.000000	test-mcc:0.479737 
[14]	train-mcc:0.000000	test-mcc:0.480185 
[15]	train-mcc:0.000000	test-mcc:0.482077 
[16]	train-mcc:0.000000	test-mcc:0.481773 
[17]	train-mcc:0.000000	test-mcc:0.483215 
[18]	train-mcc:0.000000	test-mcc:0.483215 
[19]	train-mcc:0.000000	test-mcc:0.482691 
[20]	train-mcc:0.000000	test-mcc:0.481961 
[21]	train-mcc:0.000000	test-mcc:0.481548 
[22]	train-mcc:0.000000	test-mcc:0.482280 
[23]	train-mcc:0.000000	test-mcc:0.482169 
[24]	train-mcc:0.000000	test-mcc:0.482378 
[25]	train-mcc:0.000000	test-mcc:0.482169 
[26]	train-mcc:0.000000	test-mcc:0.482378 
[27]	train-mcc:0.000000	test-mcc:0.482378 
[28]	train-mcc:0.000000	test-mcc:0.483420 
[29]	train-mcc:0.000000	test-mcc:0.483627 
[30]	train-mcc:0.000000	test-mcc:0.483627 
[31]	train-mcc:0.000000	test-mcc:0.483107 
[32]	train-mcc:0.000000	test-mcc:0.484148 
[33]	train-mcc:0.000000	test-mcc:0.484876 
[34]	train-mcc:0.000000	test-mcc:0.484148 
[35]	train-mcc:0.000000	test-mcc:0.484148 
[36]	train-mcc:0.000000	test-mcc:0.484148 
[37]	train-mcc:0.000000	test-mcc:0.482077 
[38]	train-mcc:0.000000	test-mcc:0.481961 
[39]	train-mcc:0.000000	test-mcc:0.481961 
[40]	train-mcc:0.000000	test-mcc:0.481417 
[41]	train-mcc:0.000000	test-mcc:0.481417 
[42]	train-mcc:0.000000	test-mcc:0.481417 
[43]	train-mcc:0.000000	test-mcc:0.481129 
[44]	train-mcc:0.000000	test-mcc:0.482169 
[45]	train-mcc:0.000000	test-mcc:0.482378 
[46]	train-mcc:0.000000	test-mcc:0.482800 
[47]	train-mcc:0.000000	test-mcc:0.482800 
[48]	train-mcc:0.000000	test-mcc:0.482691 
[49]	train-mcc:0.000000	test-mcc:0.482691 
[50]	train-mcc:0.000000	test-mcc:0.483420 
[51]	train-mcc:0.000000	test-mcc:0.482691 
[52]	train-mcc:0.000000	test-mcc:0.481859 
[53]	train-mcc:0.000000	test-mcc:0.481859 
[54]	train-mcc:0.000000	test-mcc:0.483228 
[55]	train-mcc:0.000000	test-mcc:0.483741 
[56]	train-mcc:0.000000	test-mcc:0.482501 
[57]	train-mcc:0.000000	test-mcc:0.481261 
[58]	train-mcc:0.000000	test-mcc:0.481990 
[59]	train-mcc:0.000000	test-mcc:0.481129 
[60]	train-mcc:0.000000	test-mcc:0.481129 
[61]	train-mcc:0.000000	test-mcc:0.480917 
[62]	train-mcc:0.000000	test-mcc:0.479291 
[63]	train-mcc:0.000000	test-mcc:0.478782 
Stopping. Best iteration:
[33]	train-mcc:0.000000	test-mcc:0.484876


Time: Thu Nov 10 2016 09:52:28 AM
For 0033 rounds: train_mcc: 0 - test_mcc: 0.4848755
Confusion matrix:
     truth
preds      0      1
    0 235294    984
    1     79    391
     truth
preds            0            1
    0 0.9938584486 0.0041563181
    1 0.0003336881 0.0016515451
Iteration 28 (base=0.1995476): MCC=0.4848755 | threshold=0.5102201



Iteration 28[2] on Thu Nov 10 2016 09:52:29 AM

depth=5, min_child_weight=50, subsample=0.5974115, colsample_bytree=0.5, base_score=0.1995476
[1]	train-mcc:0.000000	test-mcc:0.469429 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481039 
[3]	train-mcc:0.000000	test-mcc:0.481090 
[4]	train-mcc:0.000000	test-mcc:0.482144 
[5]	train-mcc:0.000000	test-mcc:0.484321 
[6]	train-mcc:0.000000	test-mcc:0.483355 
[7]	train-mcc:0.000000	test-mcc:0.481605 
[8]	train-mcc:0.000000	test-mcc:0.480508 
[9]	train-mcc:0.000000	test-mcc:0.481146 
[10]	train-mcc:0.000000	test-mcc:0.480214 
[11]	train-mcc:0.000000	test-mcc:0.480275 
[12]	train-mcc:0.000000	test-mcc:0.480009 
[13]	train-mcc:0.000000	test-mcc:0.479631 
[14]	train-mcc:0.000000	test-mcc:0.480500 
[15]	train-mcc:0.000000	test-mcc:0.478112 
[16]	train-mcc:0.000000	test-mcc:0.478760 
[17]	train-mcc:0.000000	test-mcc:0.478475 
[18]	train-mcc:0.000000	test-mcc:0.479915 
[19]	train-mcc:0.000000	test-mcc:0.481853 
[20]	train-mcc:0.000000	test-mcc:0.482592 
[21]	train-mcc:0.000000	test-mcc:0.482571 
[22]	train-mcc:0.000000	test-mcc:0.483047 
[23]	train-mcc:0.000000	test-mcc:0.483047 
[24]	train-mcc:0.000000	test-mcc:0.483759 
[25]	train-mcc:0.000000	test-mcc:0.484251 
[26]	train-mcc:0.000000	test-mcc:0.484024 
[27]	train-mcc:0.000000	test-mcc:0.484024 
[28]	train-mcc:0.000000	test-mcc:0.485678 
[29]	train-mcc:0.000000	test-mcc:0.484964 
[30]	train-mcc:0.000000	test-mcc:0.485678 
[31]	train-mcc:0.000000	test-mcc:0.485431 
[32]	train-mcc:0.000000	test-mcc:0.483090 
[33]	train-mcc:0.000000	test-mcc:0.482571 
[34]	train-mcc:0.000000	test-mcc:0.482562 
[35]	train-mcc:0.000000	test-mcc:0.482099 
[36]	train-mcc:0.000000	test-mcc:0.484810 
[37]	train-mcc:0.000000	test-mcc:0.484376 
[38]	train-mcc:0.000000	test-mcc:0.485245 
[39]	train-mcc:0.000000	test-mcc:0.484710 
[40]	train-mcc:0.000000	test-mcc:0.483759 
[41]	train-mcc:0.000000	test-mcc:0.483778 
[42]	train-mcc:0.000000	test-mcc:0.483835 
[43]	train-mcc:0.000000	test-mcc:0.484540 
[44]	train-mcc:0.000000	test-mcc:0.482494 
[45]	train-mcc:0.000000	test-mcc:0.481929 
[46]	train-mcc:0.000000	test-mcc:0.482859 
[47]	train-mcc:0.000000	test-mcc:0.481611 
[48]	train-mcc:0.000000	test-mcc:0.483565 
[49]	train-mcc:0.000000	test-mcc:0.483129 
[50]	train-mcc:0.000000	test-mcc:0.481507 
[51]	train-mcc:0.000000	test-mcc:0.482259 
[52]	train-mcc:0.000000	test-mcc:0.482354 
[53]	train-mcc:0.000000	test-mcc:0.482071 
[54]	train-mcc:0.000000	test-mcc:0.480214 
[55]	train-mcc:0.000000	test-mcc:0.482017 
[56]	train-mcc:0.000000	test-mcc:0.480689 
[57]	train-mcc:0.000000	test-mcc:0.481104 
[58]	train-mcc:0.000000	test-mcc:0.480275 
Stopping. Best iteration:
[28]	train-mcc:0.000000	test-mcc:0.485678


Time: Thu Nov 10 2016 09:53:37 AM
For 0028 rounds: train_mcc: 0 - test_mcc: 0.4856781
Confusion matrix:
     truth
preds      0      1
    0 235264    963
    1    109    413
     truth
preds            0            1
    0 0.9937275342 0.0040675990
    1 0.0004604032 0.0017444635
Iteration 28 (base=0.1995476): MCC=0.4856781 | threshold=0.412746



Iteration 28[3] on Thu Nov 10 2016 09:53:38 AM

depth=5, min_child_weight=50, subsample=0.5974115, colsample_bytree=0.5, base_score=0.1995476
[1]	train-mcc:0.000000	test-mcc:0.482693 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485949 
[3]	train-mcc:0.000000	test-mcc:0.490943 
[4]	train-mcc:0.000000	test-mcc:0.491121 
[5]	train-mcc:0.000000	test-mcc:0.489307 
[6]	train-mcc:0.000000	test-mcc:0.490495 
[7]	train-mcc:0.000000	test-mcc:0.490943 
[8]	train-mcc:0.000000	test-mcc:0.489970 
[9]	train-mcc:0.000000	test-mcc:0.490026 
[10]	train-mcc:0.000000	test-mcc:0.490013 
[11]	train-mcc:0.000000	test-mcc:0.491609 
[12]	train-mcc:0.000000	test-mcc:0.492313 
[13]	train-mcc:0.000000	test-mcc:0.492812 
[14]	train-mcc:0.000000	test-mcc:0.492301 
[15]	train-mcc:0.000000	test-mcc:0.492534 
[16]	train-mcc:0.000000	test-mcc:0.496049 
[17]	train-mcc:0.000000	test-mcc:0.496290 
[18]	train-mcc:0.000000	test-mcc:0.495814 
[19]	train-mcc:0.000000	test-mcc:0.493016 
[20]	train-mcc:0.000000	test-mcc:0.494469 
[21]	train-mcc:0.000000	test-mcc:0.493316 
[22]	train-mcc:0.000000	test-mcc:0.494198 
[23]	train-mcc:0.000000	test-mcc:0.493005 
[24]	train-mcc:0.000000	test-mcc:0.492534 
[25]	train-mcc:0.000000	test-mcc:0.492277 
[26]	train-mcc:0.000000	test-mcc:0.491853 
[27]	train-mcc:0.000000	test-mcc:0.492504 
[28]	train-mcc:0.000000	test-mcc:0.493029 
[29]	train-mcc:0.000000	test-mcc:0.492599 
[30]	train-mcc:0.000000	test-mcc:0.491028 
[31]	train-mcc:0.000000	test-mcc:0.490845 
[32]	train-mcc:0.000000	test-mcc:0.490449 
[33]	train-mcc:0.000000	test-mcc:0.491259 
[34]	train-mcc:0.000000	test-mcc:0.491478 
[35]	train-mcc:0.000000	test-mcc:0.493038 
[36]	train-mcc:0.000000	test-mcc:0.492812 
[37]	train-mcc:0.000000	test-mcc:0.492412 
[38]	train-mcc:0.000000	test-mcc:0.492309 
[39]	train-mcc:0.000000	test-mcc:0.493951 
[40]	train-mcc:0.000000	test-mcc:0.493256 
[41]	train-mcc:0.000000	test-mcc:0.493246 
[42]	train-mcc:0.000000	test-mcc:0.493525 
[43]	train-mcc:0.000000	test-mcc:0.492824 
[44]	train-mcc:0.000000	test-mcc:0.493739 
[45]	train-mcc:0.000000	test-mcc:0.492545 
[46]	train-mcc:0.000000	test-mcc:0.492301 
[47]	train-mcc:0.000000	test-mcc:0.492073 
Stopping. Best iteration:
[17]	train-mcc:0.000000	test-mcc:0.496290


Time: Thu Nov 10 2016 09:54:37 AM
For 0017 rounds: train_mcc: 0 - test_mcc: 0.4962895
Confusion matrix:
     truth
preds      0      1
    0 235268    950
    1    106    426
     truth
preds            0            1
    0 0.9937402323 0.0040126716
    1 0.0004477297 0.0017993664
Iteration 28 (base=0.1995476): MCC=0.4962895 | threshold=0.4051895



Iteration 28[4] on Thu Nov 10 2016 09:54:39 AM

depth=5, min_child_weight=50, subsample=0.5974115, colsample_bytree=0.5, base_score=0.1995476
[1]	train-mcc:0.000000	test-mcc:0.480158 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481670 
[3]	train-mcc:0.000000	test-mcc:0.478434 
[4]	train-mcc:0.000000	test-mcc:0.479642 
[5]	train-mcc:0.000000	test-mcc:0.480921 
[6]	train-mcc:0.000000	test-mcc:0.481211 
[7]	train-mcc:0.000000	test-mcc:0.481963 
[8]	train-mcc:0.000000	test-mcc:0.482261 
[9]	train-mcc:0.000000	test-mcc:0.482586 
[10]	train-mcc:0.000000	test-mcc:0.481934 
[11]	train-mcc:0.000000	test-mcc:0.482842 
[12]	train-mcc:0.000000	test-mcc:0.483181 
[13]	train-mcc:0.000000	test-mcc:0.482167 
[14]	train-mcc:0.000000	test-mcc:0.482504 
[15]	train-mcc:0.000000	test-mcc:0.481363 
[16]	train-mcc:0.000000	test-mcc:0.482194 
[17]	train-mcc:0.000000	test-mcc:0.482550 
[18]	train-mcc:0.000000	test-mcc:0.483158 
[19]	train-mcc:0.000000	test-mcc:0.482523 
[20]	train-mcc:0.000000	test-mcc:0.481836 
[21]	train-mcc:0.000000	test-mcc:0.481167 
[22]	train-mcc:0.000000	test-mcc:0.481844 
[23]	train-mcc:0.000000	test-mcc:0.481505 
[24]	train-mcc:0.000000	test-mcc:0.481167 
[25]	train-mcc:0.000000	test-mcc:0.481493 
[26]	train-mcc:0.000000	test-mcc:0.480601 
[27]	train-mcc:0.000000	test-mcc:0.481514 
[28]	train-mcc:0.000000	test-mcc:0.482282 
[29]	train-mcc:0.000000	test-mcc:0.481493 
[30]	train-mcc:0.000000	test-mcc:0.481826 
[31]	train-mcc:0.000000	test-mcc:0.480622 
[32]	train-mcc:0.000000	test-mcc:0.481328 
[33]	train-mcc:0.000000	test-mcc:0.480645 
[34]	train-mcc:0.000000	test-mcc:0.482328 
[35]	train-mcc:0.000000	test-mcc:0.483240 
[36]	train-mcc:0.000000	test-mcc:0.482523 
[37]	train-mcc:0.000000	test-mcc:0.482304 
[38]	train-mcc:0.000000	test-mcc:0.480841 
[39]	train-mcc:0.000000	test-mcc:0.480303 
[40]	train-mcc:0.000000	test-mcc:0.479694 
[41]	train-mcc:0.000000	test-mcc:0.479506 
[42]	train-mcc:0.000000	test-mcc:0.478935 
[43]	train-mcc:0.000000	test-mcc:0.479407 
[44]	train-mcc:0.000000	test-mcc:0.479038 
[45]	train-mcc:0.000000	test-mcc:0.479628 
[46]	train-mcc:0.000000	test-mcc:0.479116 
[47]	train-mcc:0.000000	test-mcc:0.479859 
[48]	train-mcc:0.000000	test-mcc:0.479261 
[49]	train-mcc:0.000000	test-mcc:0.478515 
[50]	train-mcc:0.000000	test-mcc:0.478678 
[51]	train-mcc:0.000000	test-mcc:0.477179 
[52]	train-mcc:0.000000	test-mcc:0.477730 
[53]	train-mcc:0.000000	test-mcc:0.478283 
[54]	train-mcc:0.000000	test-mcc:0.478283 
[55]	train-mcc:0.000000	test-mcc:0.478283 
[56]	train-mcc:0.000000	test-mcc:0.478471 
[57]	train-mcc:0.000000	test-mcc:0.476866 
[58]	train-mcc:0.000000	test-mcc:0.476426 
[59]	train-mcc:0.000000	test-mcc:0.477246 
[60]	train-mcc:0.000000	test-mcc:0.476280 
[61]	train-mcc:0.000000	test-mcc:0.476750 
[62]	train-mcc:0.000000	test-mcc:0.476750 
[63]	train-mcc:0.000000	test-mcc:0.476429 
[64]	train-mcc:0.000000	test-mcc:0.476588 
[65]	train-mcc:0.000000	test-mcc:0.475348 
Stopping. Best iteration:
[35]	train-mcc:0.000000	test-mcc:0.483240


Time: Thu Nov 10 2016 09:55:57 AM
For 0035 rounds: train_mcc: 0 - test_mcc: 0.4832403
Confusion matrix:
     truth
preds      0      1
    0 235107    878
    1    267    498
     truth
preds           0           1
    0 0.993060190 0.003708553
    1 0.001127772 0.002103485
Iteration 28 (base=0.1995476): MCC=0.4832403 | threshold=0.2500883



Iteration 28[5] on Thu Nov 10 2016 09:55:58 AM

depth=5, min_child_weight=50, subsample=0.5974115, colsample_bytree=0.5, base_score=0.1995476
[1]	train-mcc:0.000000	test-mcc:0.488596 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484705 
[3]	train-mcc:0.000000	test-mcc:0.485693 
[4]	train-mcc:0.000000	test-mcc:0.485740 
[5]	train-mcc:0.000000	test-mcc:0.486079 
[6]	train-mcc:0.000000	test-mcc:0.487229 
[7]	train-mcc:0.000000	test-mcc:0.487121 
[8]	train-mcc:0.000000	test-mcc:0.488686 
[9]	train-mcc:0.000000	test-mcc:0.488266 
[10]	train-mcc:0.000000	test-mcc:0.487815 
[11]	train-mcc:0.000000	test-mcc:0.486544 
[12]	train-mcc:0.000000	test-mcc:0.487574 
[13]	train-mcc:0.000000	test-mcc:0.488083 
[14]	train-mcc:0.000000	test-mcc:0.488362 
[15]	train-mcc:0.000000	test-mcc:0.488779 
[16]	train-mcc:0.000000	test-mcc:0.488208 
[17]	train-mcc:0.000000	test-mcc:0.488652 
[18]	train-mcc:0.000000	test-mcc:0.489473 
[19]	train-mcc:0.000000	test-mcc:0.488776 
[20]	train-mcc:0.000000	test-mcc:0.489606 
[21]	train-mcc:0.000000	test-mcc:0.488379 
[22]	train-mcc:0.000000	test-mcc:0.488843 
[23]	train-mcc:0.000000	test-mcc:0.488958 
[24]	train-mcc:0.000000	test-mcc:0.488231 
[25]	train-mcc:0.000000	test-mcc:0.489199 
[26]	train-mcc:0.000000	test-mcc:0.489620 
[27]	train-mcc:0.000000	test-mcc:0.488691 
[28]	train-mcc:0.000000	test-mcc:0.489078 
[29]	train-mcc:0.000000	test-mcc:0.489078 
[30]	train-mcc:0.000000	test-mcc:0.488107 
[31]	train-mcc:0.000000	test-mcc:0.488795 
[32]	train-mcc:0.000000	test-mcc:0.488955 
[33]	train-mcc:0.000000	test-mcc:0.488031 
[34]	train-mcc:0.000000	test-mcc:0.489121 
[35]	train-mcc:0.000000	test-mcc:0.489644 
[36]	train-mcc:0.000000	test-mcc:0.489185 
[37]	train-mcc:0.000000	test-mcc:0.488671 
[38]	train-mcc:0.000000	test-mcc:0.486718 
[39]	train-mcc:0.000000	test-mcc:0.487574 
[40]	train-mcc:0.000000	test-mcc:0.487857 
[41]	train-mcc:0.000000	test-mcc:0.487941 
[42]	train-mcc:0.000000	test-mcc:0.488104 
[43]	train-mcc:0.000000	test-mcc:0.486427 
[44]	train-mcc:0.000000	test-mcc:0.487919 
[45]	train-mcc:0.000000	test-mcc:0.487230 
[46]	train-mcc:0.000000	test-mcc:0.487620 
[47]	train-mcc:0.000000	test-mcc:0.486918 
[48]	train-mcc:0.000000	test-mcc:0.487723 
[49]	train-mcc:0.000000	test-mcc:0.488219 
[50]	train-mcc:0.000000	test-mcc:0.486693 
[51]	train-mcc:0.000000	test-mcc:0.487411 
[52]	train-mcc:0.000000	test-mcc:0.486596 
[53]	train-mcc:0.000000	test-mcc:0.486562 
[54]	train-mcc:0.000000	test-mcc:0.487388 
[55]	train-mcc:0.000000	test-mcc:0.486280 
[56]	train-mcc:0.000000	test-mcc:0.486764 
[57]	train-mcc:0.000000	test-mcc:0.485267 
[58]	train-mcc:0.000000	test-mcc:0.485267 
[59]	train-mcc:0.000000	test-mcc:0.485784 
[60]	train-mcc:0.000000	test-mcc:0.484363 
[61]	train-mcc:0.000000	test-mcc:0.484887 
[62]	train-mcc:0.000000	test-mcc:0.485146 
[63]	train-mcc:0.000000	test-mcc:0.487695 
[64]	train-mcc:0.000000	test-mcc:0.487052 
[65]	train-mcc:0.000000	test-mcc:0.488031 
Stopping. Best iteration:
[35]	train-mcc:0.000000	test-mcc:0.489644


Time: Thu Nov 10 2016 09:57:13 AM
For 0035 rounds: train_mcc: 0 - test_mcc: 0.4896442
Confusion matrix:
     truth
preds      0      1
    0 235213    925
    1    161    451
     truth
preds            0            1
    0 0.9935079197 0.0039070750
    1 0.0006800422 0.0019049630
Iteration 28 (base=0.1995476): MCC=0.4896442 | threshold=0.3212188


===




Iteration 29[1] on Thu Nov 10 2016 09:57:49 AM

depth=6, min_child_weight=29.92147, subsample=0.5664782, colsample_bytree=0.5119089, base_score=0.4034329
[1]	train-mcc:0.000000	test-mcc:0.469732 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476799 
[3]	train-mcc:0.000000	test-mcc:0.479938 
[4]	train-mcc:0.000000	test-mcc:0.480676 
[5]	train-mcc:0.000000	test-mcc:0.483538 
[6]	train-mcc:0.000000	test-mcc:0.479765 
[7]	train-mcc:0.000000	test-mcc:0.480694 
[8]	train-mcc:0.000000	test-mcc:0.480503 
[9]	train-mcc:0.000000	test-mcc:0.481754 
[10]	train-mcc:0.000000	test-mcc:0.484094 
[11]	train-mcc:0.000000	test-mcc:0.482852 
[12]	train-mcc:0.000000	test-mcc:0.483302 
[13]	train-mcc:0.000000	test-mcc:0.483291 
[14]	train-mcc:0.000000	test-mcc:0.482727 
[15]	train-mcc:0.000000	test-mcc:0.482709 
[16]	train-mcc:0.000000	test-mcc:0.483803 
[17]	train-mcc:0.000000	test-mcc:0.481961 
[18]	train-mcc:0.000000	test-mcc:0.483139 
[19]	train-mcc:0.000000	test-mcc:0.481773 
[20]	train-mcc:0.000000	test-mcc:0.481867 
[21]	train-mcc:0.000000	test-mcc:0.480676 
[22]	train-mcc:0.000000	test-mcc:0.480933 
[23]	train-mcc:0.000000	test-mcc:0.479880 
[24]	train-mcc:0.000000	test-mcc:0.481677 
[25]	train-mcc:0.000000	test-mcc:0.480655 
[26]	train-mcc:0.000000	test-mcc:0.482010 
[27]	train-mcc:0.000000	test-mcc:0.482754 
[28]	train-mcc:0.000000	test-mcc:0.482622 
[29]	train-mcc:0.000000	test-mcc:0.481400 
[30]	train-mcc:0.000000	test-mcc:0.482754 
[31]	train-mcc:0.000000	test-mcc:0.483496 
[32]	train-mcc:0.000000	test-mcc:0.482010 
[33]	train-mcc:0.000000	test-mcc:0.481265 
[34]	train-mcc:0.000000	test-mcc:0.480655 
[35]	train-mcc:0.000000	test-mcc:0.481557 
[36]	train-mcc:0.000000	test-mcc:0.481797 
[37]	train-mcc:0.000000	test-mcc:0.481073 
[38]	train-mcc:0.000000	test-mcc:0.482286 
[39]	train-mcc:0.000000	test-mcc:0.482898 
[40]	train-mcc:0.000000	test-mcc:0.482501 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.484094


Time: Thu Nov 10 2016 09:58:50 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4840938
Confusion matrix:
     truth
preds      0      1
    0 235318   1003
    1     55    372
     truth
preds            0            1
    0 0.9939598223 0.0042365722
    1 0.0002323145 0.0015712910
Iteration 29 (base=0.4034329): MCC=0.4840938 | threshold=0.5489534



Iteration 29[2] on Thu Nov 10 2016 09:58:51 AM

depth=6, min_child_weight=29.92147, subsample=0.5664782, colsample_bytree=0.5119089, base_score=0.4034329
[1]	train-mcc:0.000000	test-mcc:0.472148 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474445 
[3]	train-mcc:0.000000	test-mcc:0.479649 
[4]	train-mcc:0.000000	test-mcc:0.480836 
[5]	train-mcc:0.000000	test-mcc:0.484721 
[6]	train-mcc:0.000000	test-mcc:0.483062 
[7]	train-mcc:0.000000	test-mcc:0.486624 
[8]	train-mcc:0.000000	test-mcc:0.487182 
[9]	train-mcc:0.000000	test-mcc:0.486404 
[10]	train-mcc:0.000000	test-mcc:0.486922 
[11]	train-mcc:0.000000	test-mcc:0.487149 
[12]	train-mcc:0.000000	test-mcc:0.488623 
[13]	train-mcc:0.000000	test-mcc:0.488758 
[14]	train-mcc:0.000000	test-mcc:0.488540 
[15]	train-mcc:0.000000	test-mcc:0.488056 
[16]	train-mcc:0.000000	test-mcc:0.487605 
[17]	train-mcc:0.000000	test-mcc:0.487351 
[18]	train-mcc:0.000000	test-mcc:0.488762 
[19]	train-mcc:0.000000	test-mcc:0.488297 
[20]	train-mcc:0.000000	test-mcc:0.489560 
[21]	train-mcc:0.000000	test-mcc:0.488623 
[22]	train-mcc:0.000000	test-mcc:0.488623 
[23]	train-mcc:0.000000	test-mcc:0.489033 
[24]	train-mcc:0.000000	test-mcc:0.489746 
[25]	train-mcc:0.000000	test-mcc:0.488762 
[26]	train-mcc:0.000000	test-mcc:0.488056 
[27]	train-mcc:0.000000	test-mcc:0.489241 
[28]	train-mcc:0.000000	test-mcc:0.488997 
[29]	train-mcc:0.000000	test-mcc:0.488748 
[30]	train-mcc:0.000000	test-mcc:0.487864 
[31]	train-mcc:0.000000	test-mcc:0.488806 
[32]	train-mcc:0.000000	test-mcc:0.487121 
[33]	train-mcc:0.000000	test-mcc:0.487121 
[34]	train-mcc:0.000000	test-mcc:0.487831 
[35]	train-mcc:0.000000	test-mcc:0.487097 
[36]	train-mcc:0.000000	test-mcc:0.487281 
[37]	train-mcc:0.000000	test-mcc:0.485805 
[38]	train-mcc:0.000000	test-mcc:0.485366 
[39]	train-mcc:0.000000	test-mcc:0.485366 
[40]	train-mcc:0.000000	test-mcc:0.487190 
[41]	train-mcc:0.000000	test-mcc:0.487190 
[42]	train-mcc:0.000000	test-mcc:0.487190 
[43]	train-mcc:0.000000	test-mcc:0.488354 
[44]	train-mcc:0.000000	test-mcc:0.487190 
[45]	train-mcc:0.000000	test-mcc:0.486306 
[46]	train-mcc:0.000000	test-mcc:0.485486 
[47]	train-mcc:0.000000	test-mcc:0.484739 
[48]	train-mcc:0.000000	test-mcc:0.486889 
[49]	train-mcc:0.000000	test-mcc:0.485920 
[50]	train-mcc:0.000000	test-mcc:0.485431 
[51]	train-mcc:0.000000	test-mcc:0.487351 
[52]	train-mcc:0.000000	test-mcc:0.487583 
[53]	train-mcc:0.000000	test-mcc:0.486869 
[54]	train-mcc:0.000000	test-mcc:0.487744 
Stopping. Best iteration:
[24]	train-mcc:0.000000	test-mcc:0.489746


Time: Thu Nov 10 2016 10:00:06 AM
For 0024 rounds: train_mcc: 0 - test_mcc: 0.4897455
Confusion matrix:
     truth
preds      0      1
    0 235274    964
    1     99    412
     truth
preds            0            1
    0 0.9937697731 0.0040718229
    1 0.0004181644 0.0017402397
Iteration 29 (base=0.4034329): MCC=0.4897455 | threshold=0.432



Iteration 29[3] on Thu Nov 10 2016 10:00:07 AM

depth=6, min_child_weight=29.92147, subsample=0.5664782, colsample_bytree=0.5119089, base_score=0.4034329
[1]	train-mcc:0.000000	test-mcc:0.485459 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486432 
[3]	train-mcc:0.000000	test-mcc:0.489306 
[4]	train-mcc:0.000000	test-mcc:0.489691 
[5]	train-mcc:0.000000	test-mcc:0.491401 
[6]	train-mcc:0.000000	test-mcc:0.491612 
[7]	train-mcc:0.000000	test-mcc:0.490280 
[8]	train-mcc:0.000000	test-mcc:0.488996 
[9]	train-mcc:0.000000	test-mcc:0.489705 
[10]	train-mcc:0.000000	test-mcc:0.485678 
[11]	train-mcc:0.000000	test-mcc:0.485415 
[12]	train-mcc:0.000000	test-mcc:0.486271 
[13]	train-mcc:0.000000	test-mcc:0.485867 
[14]	train-mcc:0.000000	test-mcc:0.487025 
[15]	train-mcc:0.000000	test-mcc:0.488047 
[16]	train-mcc:0.000000	test-mcc:0.487743 
[17]	train-mcc:0.000000	test-mcc:0.486427 
[18]	train-mcc:0.000000	test-mcc:0.486622 
[19]	train-mcc:0.000000	test-mcc:0.486622 
[20]	train-mcc:0.000000	test-mcc:0.485638 
[21]	train-mcc:0.000000	test-mcc:0.485459 
[22]	train-mcc:0.000000	test-mcc:0.486437 
[23]	train-mcc:0.000000	test-mcc:0.487564 
[24]	train-mcc:0.000000	test-mcc:0.489388 
[25]	train-mcc:0.000000	test-mcc:0.491316 
[26]	train-mcc:0.000000	test-mcc:0.489926 
[27]	train-mcc:0.000000	test-mcc:0.489895 
[28]	train-mcc:0.000000	test-mcc:0.491125 
[29]	train-mcc:0.000000	test-mcc:0.491125 
[30]	train-mcc:0.000000	test-mcc:0.490042 
[31]	train-mcc:0.000000	test-mcc:0.490026 
[32]	train-mcc:0.000000	test-mcc:0.489747 
[33]	train-mcc:0.000000	test-mcc:0.491541 
[34]	train-mcc:0.000000	test-mcc:0.489926 
[35]	train-mcc:0.000000	test-mcc:0.489883 
[36]	train-mcc:0.000000	test-mcc:0.489778 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.491612


Time: Thu Nov 10 2016 10:00:57 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4916115
Confusion matrix:
     truth
preds      0      1
    0 235286    969
    1     88    407
     truth
preds            0            1
    0 0.9938162619 0.0040929250
    1 0.0003717001 0.0017191130
Iteration 29 (base=0.4034329): MCC=0.4916115 | threshold=0.4348363



Iteration 29[4] on Thu Nov 10 2016 10:00:58 AM

depth=6, min_child_weight=29.92147, subsample=0.5664782, colsample_bytree=0.5119089, base_score=0.4034329
[1]	train-mcc:0.000000	test-mcc:0.486760 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483158 
[3]	train-mcc:0.000000	test-mcc:0.482159 
[4]	train-mcc:0.000000	test-mcc:0.482749 
[5]	train-mcc:0.000000	test-mcc:0.480505 
[6]	train-mcc:0.000000	test-mcc:0.483128 
[7]	train-mcc:0.000000	test-mcc:0.483654 
[8]	train-mcc:0.000000	test-mcc:0.481805 
[9]	train-mcc:0.000000	test-mcc:0.483946 
[10]	train-mcc:0.000000	test-mcc:0.486155 
[11]	train-mcc:0.000000	test-mcc:0.485485 
[12]	train-mcc:0.000000	test-mcc:0.485491 
[13]	train-mcc:0.000000	test-mcc:0.485820 
[14]	train-mcc:0.000000	test-mcc:0.486818 
[15]	train-mcc:0.000000	test-mcc:0.485150 
[16]	train-mcc:0.000000	test-mcc:0.485153 
[17]	train-mcc:0.000000	test-mcc:0.484300 
[18]	train-mcc:0.000000	test-mcc:0.485479 
[19]	train-mcc:0.000000	test-mcc:0.487209 
[20]	train-mcc:0.000000	test-mcc:0.486174 
[21]	train-mcc:0.000000	test-mcc:0.486163 
[22]	train-mcc:0.000000	test-mcc:0.487154 
[23]	train-mcc:0.000000	test-mcc:0.488165 
[24]	train-mcc:0.000000	test-mcc:0.487816 
[25]	train-mcc:0.000000	test-mcc:0.488180 
[26]	train-mcc:0.000000	test-mcc:0.486501 
[27]	train-mcc:0.000000	test-mcc:0.486818 
[28]	train-mcc:0.000000	test-mcc:0.485915 
[29]	train-mcc:0.000000	test-mcc:0.486980 
[30]	train-mcc:0.000000	test-mcc:0.487274 
[31]	train-mcc:0.000000	test-mcc:0.487502 
[32]	train-mcc:0.000000	test-mcc:0.486174 
[33]	train-mcc:0.000000	test-mcc:0.485499 
[34]	train-mcc:0.000000	test-mcc:0.485811 
[35]	train-mcc:0.000000	test-mcc:0.486473 
[36]	train-mcc:0.000000	test-mcc:0.483583 
[37]	train-mcc:0.000000	test-mcc:0.483593 
[38]	train-mcc:0.000000	test-mcc:0.483374 
[39]	train-mcc:0.000000	test-mcc:0.483283 
[40]	train-mcc:0.000000	test-mcc:0.483865 
[41]	train-mcc:0.000000	test-mcc:0.482807 
[42]	train-mcc:0.000000	test-mcc:0.482420 
[43]	train-mcc:0.000000	test-mcc:0.482566 
[44]	train-mcc:0.000000	test-mcc:0.483027 
[45]	train-mcc:0.000000	test-mcc:0.482339 
[46]	train-mcc:0.000000	test-mcc:0.480041 
[47]	train-mcc:0.000000	test-mcc:0.481690 
[48]	train-mcc:0.000000	test-mcc:0.482383 
[49]	train-mcc:0.000000	test-mcc:0.481690 
[50]	train-mcc:0.000000	test-mcc:0.481390 
[51]	train-mcc:0.000000	test-mcc:0.479821 
[52]	train-mcc:0.000000	test-mcc:0.480882 
[53]	train-mcc:0.000000	test-mcc:0.480511 
[54]	train-mcc:0.000000	test-mcc:0.481194 
[55]	train-mcc:0.000000	test-mcc:0.481390 
Stopping. Best iteration:
[25]	train-mcc:0.000000	test-mcc:0.488180


Time: Thu Nov 10 2016 10:02:15 AM
For 0025 rounds: train_mcc: 0 - test_mcc: 0.48818
Confusion matrix:
     truth
preds      0      1
    0 235136    885
    1    238    491
     truth
preds           0           1
    0 0.993182682 0.003738120
    1 0.001005280 0.002073918
Iteration 29 (base=0.4034329): MCC=0.48818 | threshold=0.2615039



Iteration 29[5] on Thu Nov 10 2016 10:02:16 AM

depth=6, min_child_weight=29.92147, subsample=0.5664782, colsample_bytree=0.5119089, base_score=0.4034329
[1]	train-mcc:0.000000	test-mcc:0.485892 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.481855 
[3]	train-mcc:0.000000	test-mcc:0.485909 
[4]	train-mcc:0.000000	test-mcc:0.488703 
[5]	train-mcc:0.000000	test-mcc:0.490457 
[6]	train-mcc:0.000000	test-mcc:0.492170 
[7]	train-mcc:0.000000	test-mcc:0.492773 
[8]	train-mcc:0.000000	test-mcc:0.494448 
[9]	train-mcc:0.000000	test-mcc:0.494169 
[10]	train-mcc:0.000000	test-mcc:0.495393 
[11]	train-mcc:0.000000	test-mcc:0.495116 
[12]	train-mcc:0.000000	test-mcc:0.495332 
[13]	train-mcc:0.000000	test-mcc:0.492242 
[14]	train-mcc:0.000000	test-mcc:0.491218 
[15]	train-mcc:0.000000	test-mcc:0.490995 
[16]	train-mcc:0.000000	test-mcc:0.489486 
[17]	train-mcc:0.000000	test-mcc:0.488290 
[18]	train-mcc:0.000000	test-mcc:0.488003 
[19]	train-mcc:0.000000	test-mcc:0.488686 
[20]	train-mcc:0.000000	test-mcc:0.486724 
[21]	train-mcc:0.000000	test-mcc:0.484787 
[22]	train-mcc:0.000000	test-mcc:0.484739 
[23]	train-mcc:0.000000	test-mcc:0.485977 
[24]	train-mcc:0.000000	test-mcc:0.486329 
[25]	train-mcc:0.000000	test-mcc:0.485161 
[26]	train-mcc:0.000000	test-mcc:0.485036 
[27]	train-mcc:0.000000	test-mcc:0.484554 
[28]	train-mcc:0.000000	test-mcc:0.484866 
[29]	train-mcc:0.000000	test-mcc:0.484400 
[30]	train-mcc:0.000000	test-mcc:0.484160 
[31]	train-mcc:0.000000	test-mcc:0.483963 
[32]	train-mcc:0.000000	test-mcc:0.485861 
[33]	train-mcc:0.000000	test-mcc:0.484921 
[34]	train-mcc:0.000000	test-mcc:0.485699 
[35]	train-mcc:0.000000	test-mcc:0.484971 
[36]	train-mcc:0.000000	test-mcc:0.484855 
[37]	train-mcc:0.000000	test-mcc:0.483701 
[38]	train-mcc:0.000000	test-mcc:0.486377 
[39]	train-mcc:0.000000	test-mcc:0.486222 
[40]	train-mcc:0.000000	test-mcc:0.486691 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.495393


Time: Thu Nov 10 2016 10:03:13 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4953934
Confusion matrix:
     truth
preds      0      1
    0 235222    922
    1    152    454
     truth
preds            0            1
    0 0.9935459345 0.0038944034
    1 0.0006420275 0.0019176346
Iteration 29 (base=0.4034329): MCC=0.4953934 | threshold=0.3236579


===




Iteration 30[1] on Thu Nov 10 2016 10:03:57 AM

depth=5, min_child_weight=1, subsample=1, colsample_bytree=1, base_score=0.2328854
[1]	train-mcc:0.000000	test-mcc:0.466764 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.473696 
[3]	train-mcc:0.000000	test-mcc:0.478820 
[4]	train-mcc:0.000000	test-mcc:0.480466 
[5]	train-mcc:0.000000	test-mcc:0.480917 
[6]	train-mcc:0.000000	test-mcc:0.482808 
[7]	train-mcc:0.000000	test-mcc:0.482808 
[8]	train-mcc:0.000000	test-mcc:0.482077 
[9]	train-mcc:0.000000	test-mcc:0.481674 
[10]	train-mcc:0.000000	test-mcc:0.480151 
[11]	train-mcc:0.000000	test-mcc:0.480151 
[12]	train-mcc:0.000000	test-mcc:0.480313 
[13]	train-mcc:0.000000	test-mcc:0.479610 
[14]	train-mcc:0.000000	test-mcc:0.479610 
[15]	train-mcc:0.000000	test-mcc:0.479270 
[16]	train-mcc:0.000000	test-mcc:0.479348 
[17]	train-mcc:0.000000	test-mcc:0.479673 
[18]	train-mcc:0.000000	test-mcc:0.478937 
[19]	train-mcc:0.000000	test-mcc:0.478200 
[20]	train-mcc:0.000000	test-mcc:0.477904 
[21]	train-mcc:0.000000	test-mcc:0.478872 
[22]	train-mcc:0.000000	test-mcc:0.478332 
[23]	train-mcc:0.000000	test-mcc:0.478133 
[24]	train-mcc:0.000000	test-mcc:0.478133 
[25]	train-mcc:0.000000	test-mcc:0.478872 
[26]	train-mcc:0.000000	test-mcc:0.478872 
[27]	train-mcc:0.000000	test-mcc:0.479414 
[28]	train-mcc:0.000000	test-mcc:0.479414 
[29]	train-mcc:0.000000	test-mcc:0.479414 
[30]	train-mcc:0.000000	test-mcc:0.479414 
[31]	train-mcc:0.000000	test-mcc:0.479414 
[32]	train-mcc:0.000000	test-mcc:0.479414 
[33]	train-mcc:0.000000	test-mcc:0.479765 
[34]	train-mcc:0.000000	test-mcc:0.479765 
[35]	train-mcc:0.000000	test-mcc:0.479765 
[36]	train-mcc:0.000000	test-mcc:0.479765 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.482808


Time: Thu Nov 10 2016 10:05:17 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.482808
Confusion matrix:
     truth
preds      0      1
    0 235297    989
    1     76    386
     truth
preds            0            1
    0 0.9938711203 0.0041774376
    1 0.0003210164 0.0016304256
Iteration 30 (base=0.2328854): MCC=0.482808 | threshold=0.4191841



Iteration 30[2] on Thu Nov 10 2016 10:05:18 AM

depth=5, min_child_weight=1, subsample=1, colsample_bytree=1, base_score=0.2328854
[1]	train-mcc:0.000000	test-mcc:0.480962 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482413 
[3]	train-mcc:0.000000	test-mcc:0.483533 
[4]	train-mcc:0.000000	test-mcc:0.483533 
[5]	train-mcc:0.000000	test-mcc:0.482667 
[6]	train-mcc:0.000000	test-mcc:0.484567 
[7]	train-mcc:0.000000	test-mcc:0.485638 
[8]	train-mcc:0.000000	test-mcc:0.484818 
[9]	train-mcc:0.000000	test-mcc:0.484384 
[10]	train-mcc:0.000000	test-mcc:0.485978 
[11]	train-mcc:0.000000	test-mcc:0.486026 
[12]	train-mcc:0.000000	test-mcc:0.485978 
[13]	train-mcc:0.000000	test-mcc:0.485585 
[14]	train-mcc:0.000000	test-mcc:0.485306 
[15]	train-mcc:0.000000	test-mcc:0.487025 
[16]	train-mcc:0.000000	test-mcc:0.485306 
[17]	train-mcc:0.000000	test-mcc:0.485033 
[18]	train-mcc:0.000000	test-mcc:0.484046 
[19]	train-mcc:0.000000	test-mcc:0.483265 
[20]	train-mcc:0.000000	test-mcc:0.483555 
[21]	train-mcc:0.000000	test-mcc:0.483065 
[22]	train-mcc:0.000000	test-mcc:0.482320 
[23]	train-mcc:0.000000	test-mcc:0.483029 
[24]	train-mcc:0.000000	test-mcc:0.482124 
[25]	train-mcc:0.000000	test-mcc:0.481714 
[26]	train-mcc:0.000000	test-mcc:0.481714 
[27]	train-mcc:0.000000	test-mcc:0.482816 
[28]	train-mcc:0.000000	test-mcc:0.483062 
[29]	train-mcc:0.000000	test-mcc:0.483778 
[30]	train-mcc:0.000000	test-mcc:0.483842 
[31]	train-mcc:0.000000	test-mcc:0.483235 
[32]	train-mcc:0.000000	test-mcc:0.483235 
[33]	train-mcc:0.000000	test-mcc:0.482197 
[34]	train-mcc:0.000000	test-mcc:0.481904 
[35]	train-mcc:0.000000	test-mcc:0.482977 
[36]	train-mcc:0.000000	test-mcc:0.482977 
[37]	train-mcc:0.000000	test-mcc:0.482070 
[38]	train-mcc:0.000000	test-mcc:0.482577 
[39]	train-mcc:0.000000	test-mcc:0.482577 
[40]	train-mcc:0.000000	test-mcc:0.482577 
[41]	train-mcc:0.000000	test-mcc:0.482874 
[42]	train-mcc:0.000000	test-mcc:0.482478 
[43]	train-mcc:0.000000	test-mcc:0.482478 
[44]	train-mcc:0.000000	test-mcc:0.482374 
[45]	train-mcc:0.000000	test-mcc:0.483090 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.487025


Time: Thu Nov 10 2016 10:06:55 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4870253
Confusion matrix:
     truth
preds      0      1
    0 235283    974
    1     90    402
     truth
preds            0            1
    0 0.9938077880 0.0041140617
    1 0.0003801494 0.0016980008
Iteration 30 (base=0.2328854): MCC=0.4870253 | threshold=0.4505826



Iteration 30[3] on Thu Nov 10 2016 10:06:57 AM

depth=5, min_child_weight=1, subsample=1, colsample_bytree=1, base_score=0.2328854
[1]	train-mcc:0.000000	test-mcc:0.483298 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485193 
[3]	train-mcc:0.000000	test-mcc:0.490618 
[4]	train-mcc:0.000000	test-mcc:0.491541 
[5]	train-mcc:0.000000	test-mcc:0.492464 
[6]	train-mcc:0.000000	test-mcc:0.492661 
[7]	train-mcc:0.000000	test-mcc:0.493886 
[8]	train-mcc:0.000000	test-mcc:0.493478 
[9]	train-mcc:0.000000	test-mcc:0.492587 
[10]	train-mcc:0.000000	test-mcc:0.492587 
[11]	train-mcc:0.000000	test-mcc:0.492587 
[12]	train-mcc:0.000000	test-mcc:0.492850 
[13]	train-mcc:0.000000	test-mcc:0.493572 
[14]	train-mcc:0.000000	test-mcc:0.492906 
[15]	train-mcc:0.000000	test-mcc:0.493572 
[16]	train-mcc:0.000000	test-mcc:0.495010 
[17]	train-mcc:0.000000	test-mcc:0.493983 
[18]	train-mcc:0.000000	test-mcc:0.494290 
[19]	train-mcc:0.000000	test-mcc:0.494903 
[20]	train-mcc:0.000000	test-mcc:0.494266 
[21]	train-mcc:0.000000	test-mcc:0.494535 
[22]	train-mcc:0.000000	test-mcc:0.493392 
[23]	train-mcc:0.000000	test-mcc:0.494245 
[24]	train-mcc:0.000000	test-mcc:0.493808 
[25]	train-mcc:0.000000	test-mcc:0.494021 
[26]	train-mcc:0.000000	test-mcc:0.494435 
[27]	train-mcc:0.000000	test-mcc:0.494021 
[28]	train-mcc:0.000000	test-mcc:0.494326 
[29]	train-mcc:0.000000	test-mcc:0.494326 
[30]	train-mcc:0.000000	test-mcc:0.494326 
[31]	train-mcc:0.000000	test-mcc:0.494326 
[32]	train-mcc:0.000000	test-mcc:0.495418 
[33]	train-mcc:0.000000	test-mcc:0.495994 
[34]	train-mcc:0.000000	test-mcc:0.495994 
[35]	train-mcc:0.000000	test-mcc:0.495393 
[36]	train-mcc:0.000000	test-mcc:0.495393 
[37]	train-mcc:0.000000	test-mcc:0.495393 
[38]	train-mcc:0.000000	test-mcc:0.495393 
[39]	train-mcc:0.000000	test-mcc:0.495393 
[40]	train-mcc:0.000000	test-mcc:0.495393 
[41]	train-mcc:0.000000	test-mcc:0.495253 
[42]	train-mcc:0.000000	test-mcc:0.494776 
[43]	train-mcc:0.000000	test-mcc:0.495629 
[44]	train-mcc:0.000000	test-mcc:0.495253 
[45]	train-mcc:0.000000	test-mcc:0.494841 
[46]	train-mcc:0.000000	test-mcc:0.495367 
[47]	train-mcc:0.000000	test-mcc:0.495367 
[48]	train-mcc:0.000000	test-mcc:0.494939 
[49]	train-mcc:0.000000	test-mcc:0.494939 
[50]	train-mcc:0.000000	test-mcc:0.494939 
[51]	train-mcc:0.000000	test-mcc:0.494512 
[52]	train-mcc:0.000000	test-mcc:0.495367 
[53]	train-mcc:0.000000	test-mcc:0.495106 
[54]	train-mcc:0.000000	test-mcc:0.493722 
[55]	train-mcc:0.000000	test-mcc:0.493722 
[56]	train-mcc:0.000000	test-mcc:0.493292 
[57]	train-mcc:0.000000	test-mcc:0.493292 
[58]	train-mcc:0.000000	test-mcc:0.493985 
[59]	train-mcc:0.000000	test-mcc:0.494414 
[60]	train-mcc:0.000000	test-mcc:0.494414 
[61]	train-mcc:0.000000	test-mcc:0.493985 
[62]	train-mcc:0.000000	test-mcc:0.493556 
[63]	train-mcc:0.000000	test-mcc:0.493556 
Stopping. Best iteration:
[33]	train-mcc:0.000000	test-mcc:0.495994


Time: Thu Nov 10 2016 10:09:09 AM
For 0033 rounds: train_mcc: 0 - test_mcc: 0.4959942
Confusion matrix:
     truth
preds      0      1
    0 235230    926
    1    144    450
     truth
preds            0            1
    0 0.9935797254 0.0039112988
    1 0.0006082365 0.0019007392
Iteration 30 (base=0.2328854): MCC=0.4959942 | threshold=0.3454861



Iteration 30[4] on Thu Nov 10 2016 10:09:10 AM

depth=5, min_child_weight=1, subsample=1, colsample_bytree=1, base_score=0.2328854
[1]	train-mcc:0.000000	test-mcc:0.477600 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.484474 
[3]	train-mcc:0.000000	test-mcc:0.490232 
[4]	train-mcc:0.000000	test-mcc:0.486953 
[5]	train-mcc:0.000000	test-mcc:0.488028 
[6]	train-mcc:0.000000	test-mcc:0.490331 
[7]	train-mcc:0.000000	test-mcc:0.487040 
[8]	train-mcc:0.000000	test-mcc:0.488498 
[9]	train-mcc:0.000000	test-mcc:0.488607 
[10]	train-mcc:0.000000	test-mcc:0.487595 
[11]	train-mcc:0.000000	test-mcc:0.487595 
[12]	train-mcc:0.000000	test-mcc:0.486633 
[13]	train-mcc:0.000000	test-mcc:0.486835 
[14]	train-mcc:0.000000	test-mcc:0.487258 
[15]	train-mcc:0.000000	test-mcc:0.487258 
[16]	train-mcc:0.000000	test-mcc:0.487410 
[17]	train-mcc:0.000000	test-mcc:0.486341 
[18]	train-mcc:0.000000	test-mcc:0.486136 
[19]	train-mcc:0.000000	test-mcc:0.486633 
[20]	train-mcc:0.000000	test-mcc:0.486413 
[21]	train-mcc:0.000000	test-mcc:0.487700 
[22]	train-mcc:0.000000	test-mcc:0.487664 
[23]	train-mcc:0.000000	test-mcc:0.488643 
[24]	train-mcc:0.000000	test-mcc:0.488643 
[25]	train-mcc:0.000000	test-mcc:0.488652 
[26]	train-mcc:0.000000	test-mcc:0.488652 
[27]	train-mcc:0.000000	test-mcc:0.487669 
[28]	train-mcc:0.000000	test-mcc:0.488925 
[29]	train-mcc:0.000000	test-mcc:0.488083 
[30]	train-mcc:0.000000	test-mcc:0.487955 
[31]	train-mcc:0.000000	test-mcc:0.487664 
[32]	train-mcc:0.000000	test-mcc:0.487664 
[33]	train-mcc:0.000000	test-mcc:0.488359 
[34]	train-mcc:0.000000	test-mcc:0.488779 
[35]	train-mcc:0.000000	test-mcc:0.488779 
[36]	train-mcc:0.000000	test-mcc:0.488779 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.490331


Time: Thu Nov 10 2016 10:10:24 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4903307
Confusion matrix:
     truth
preds      0      1
    0 235165    897
    1    209    479
     truth
preds            0            1
    0 0.9933051742 0.0037888068
    1 0.0008827878 0.0020232313
Iteration 30 (base=0.2328854): MCC=0.4903307 | threshold=0.269854



Iteration 30[5] on Thu Nov 10 2016 10:10:25 AM

depth=5, min_child_weight=1, subsample=1, colsample_bytree=1, base_score=0.2328854
[1]	train-mcc:0.000000	test-mcc:0.480796 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485149 
[3]	train-mcc:0.000000	test-mcc:0.487052 
[4]	train-mcc:0.000000	test-mcc:0.488449 
[5]	train-mcc:0.000000	test-mcc:0.487942 
[6]	train-mcc:0.000000	test-mcc:0.488319 
[7]	train-mcc:0.000000	test-mcc:0.489809 
[8]	train-mcc:0.000000	test-mcc:0.488758 
[9]	train-mcc:0.000000	test-mcc:0.489466 
[10]	train-mcc:0.000000	test-mcc:0.489468 
[11]	train-mcc:0.000000	test-mcc:0.490886 
[12]	train-mcc:0.000000	test-mcc:0.490177 
[13]	train-mcc:0.000000	test-mcc:0.490177 
[14]	train-mcc:0.000000	test-mcc:0.489943 
[15]	train-mcc:0.000000	test-mcc:0.489235 
[16]	train-mcc:0.000000	test-mcc:0.488762 
[17]	train-mcc:0.000000	test-mcc:0.488762 
[18]	train-mcc:0.000000	test-mcc:0.489028 
[19]	train-mcc:0.000000	test-mcc:0.489474 
[20]	train-mcc:0.000000	test-mcc:0.488286 
[21]	train-mcc:0.000000	test-mcc:0.488286 
[22]	train-mcc:0.000000	test-mcc:0.488286 
[23]	train-mcc:0.000000	test-mcc:0.489943 
[24]	train-mcc:0.000000	test-mcc:0.490431 
[25]	train-mcc:0.000000	test-mcc:0.491359 
[26]	train-mcc:0.000000	test-mcc:0.492772 
[27]	train-mcc:0.000000	test-mcc:0.493951 
[28]	train-mcc:0.000000	test-mcc:0.493477 
[29]	train-mcc:0.000000	test-mcc:0.493477 
[30]	train-mcc:0.000000	test-mcc:0.492534 
[31]	train-mcc:0.000000	test-mcc:0.492534 
[32]	train-mcc:0.000000	test-mcc:0.492534 
[33]	train-mcc:0.000000	test-mcc:0.492534 
[34]	train-mcc:0.000000	test-mcc:0.492534 
[35]	train-mcc:0.000000	test-mcc:0.492534 
[36]	train-mcc:0.000000	test-mcc:0.491828 
[37]	train-mcc:0.000000	test-mcc:0.491125 
[38]	train-mcc:0.000000	test-mcc:0.490886 
[39]	train-mcc:0.000000	test-mcc:0.489707 
[40]	train-mcc:0.000000	test-mcc:0.489707 
[41]	train-mcc:0.000000	test-mcc:0.489560 
[42]	train-mcc:0.000000	test-mcc:0.489707 
[43]	train-mcc:0.000000	test-mcc:0.490231 
[44]	train-mcc:0.000000	test-mcc:0.490231 
[45]	train-mcc:0.000000	test-mcc:0.490231 
[46]	train-mcc:0.000000	test-mcc:0.490231 
[47]	train-mcc:0.000000	test-mcc:0.489981 
[48]	train-mcc:0.000000	test-mcc:0.489261 
[49]	train-mcc:0.000000	test-mcc:0.489973 
[50]	train-mcc:0.000000	test-mcc:0.489973 
[51]	train-mcc:0.000000	test-mcc:0.490684 
[52]	train-mcc:0.000000	test-mcc:0.489973 
[53]	train-mcc:0.000000	test-mcc:0.489261 
[54]	train-mcc:0.000000	test-mcc:0.489973 
[55]	train-mcc:0.000000	test-mcc:0.489973 
[56]	train-mcc:0.000000	test-mcc:0.489490 
[57]	train-mcc:0.000000	test-mcc:0.489235 
Stopping. Best iteration:
[27]	train-mcc:0.000000	test-mcc:0.493951


Time: Thu Nov 10 2016 10:12:28 AM
For 0027 rounds: train_mcc: 0 - test_mcc: 0.493951
Confusion matrix:
     truth
preds      0      1
    0 235269    954
    1    105    422
     truth
preds            0            1
    0 0.9937444562 0.0040295671
    1 0.0004435058 0.0017824710
Iteration 30 (base=0.2328854): MCC=0.493951 | threshold=0.3643908


===




Iteration 31[1] on Thu Nov 10 2016 10:13:12 AM

depth=5, min_child_weight=21.28039, subsample=0.5, colsample_bytree=1, base_score=0.09901666
[1]	train-mcc:0.000000	test-mcc:0.472056 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472933 
[3]	train-mcc:0.000000	test-mcc:0.475874 
[4]	train-mcc:0.000000	test-mcc:0.475601 
[5]	train-mcc:0.000000	test-mcc:0.479013 
[6]	train-mcc:0.000000	test-mcc:0.479386 
[7]	train-mcc:0.000000	test-mcc:0.477769 
[8]	train-mcc:0.000000	test-mcc:0.478646 
[9]	train-mcc:0.000000	test-mcc:0.479610 
[10]	train-mcc:0.000000	test-mcc:0.480933 
[11]	train-mcc:0.000000	test-mcc:0.482421 
[12]	train-mcc:0.000000	test-mcc:0.480181 
[13]	train-mcc:0.000000	test-mcc:0.482366 
[14]	train-mcc:0.000000	test-mcc:0.480793 
[15]	train-mcc:0.000000	test-mcc:0.481082 
[16]	train-mcc:0.000000	test-mcc:0.481819 
[17]	train-mcc:0.000000	test-mcc:0.481517 
[18]	train-mcc:0.000000	test-mcc:0.481132 
[19]	train-mcc:0.000000	test-mcc:0.480386 
[20]	train-mcc:0.000000	test-mcc:0.479772 
[21]	train-mcc:0.000000	test-mcc:0.479772 
[22]	train-mcc:0.000000	test-mcc:0.479128 
[23]	train-mcc:0.000000	test-mcc:0.479300 
[24]	train-mcc:0.000000	test-mcc:0.478758 
[25]	train-mcc:0.000000	test-mcc:0.479300 
[26]	train-mcc:0.000000	test-mcc:0.478837 
[27]	train-mcc:0.000000	test-mcc:0.478758 
[28]	train-mcc:0.000000	test-mcc:0.479467 
[29]	train-mcc:0.000000	test-mcc:0.479772 
[30]	train-mcc:0.000000	test-mcc:0.478837 
[31]	train-mcc:0.000000	test-mcc:0.480336 
[32]	train-mcc:0.000000	test-mcc:0.480925 
[33]	train-mcc:0.000000	test-mcc:0.480243 
[34]	train-mcc:0.000000	test-mcc:0.480751 
[35]	train-mcc:0.000000	test-mcc:0.480751 
[36]	train-mcc:0.000000	test-mcc:0.480243 
[37]	train-mcc:0.000000	test-mcc:0.481648 
[38]	train-mcc:0.000000	test-mcc:0.481648 
[39]	train-mcc:0.000000	test-mcc:0.480904 
[40]	train-mcc:0.000000	test-mcc:0.481474 
[41]	train-mcc:0.000000	test-mcc:0.479949 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.482421


Time: Thu Nov 10 2016 10:14:45 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4824207
Confusion matrix:
     truth
preds      0      1
    0 235329   1014
    1     44    361
     truth
preds            0            1
    0 0.9940062852 0.0042830351
    1 0.0001858516 0.0015248281
Iteration 31 (base=0.09901666): MCC=0.4824207 | threshold=0.5495481



Iteration 31[2] on Thu Nov 10 2016 10:14:46 AM

depth=5, min_child_weight=21.28039, subsample=0.5, colsample_bytree=1, base_score=0.09901666
[1]	train-mcc:0.000000	test-mcc:0.473902 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477047 
[3]	train-mcc:0.000000	test-mcc:0.482562 
[4]	train-mcc:0.000000	test-mcc:0.485678 
[5]	train-mcc:0.000000	test-mcc:0.483828 
[6]	train-mcc:0.000000	test-mcc:0.484995 
[7]	train-mcc:0.000000	test-mcc:0.488065 
[8]	train-mcc:0.000000	test-mcc:0.484995 
[9]	train-mcc:0.000000	test-mcc:0.485033 
[10]	train-mcc:0.000000	test-mcc:0.485203 
[11]	train-mcc:0.000000	test-mcc:0.484618 
[12]	train-mcc:0.000000	test-mcc:0.486410 
[13]	train-mcc:0.000000	test-mcc:0.484954 
[14]	train-mcc:0.000000	test-mcc:0.483304 
[15]	train-mcc:0.000000	test-mcc:0.483533 
[16]	train-mcc:0.000000	test-mcc:0.483062 
[17]	train-mcc:0.000000	test-mcc:0.485232 
[18]	train-mcc:0.000000	test-mcc:0.484739 
[19]	train-mcc:0.000000	test-mcc:0.486634 
[20]	train-mcc:0.000000	test-mcc:0.483556 
[21]	train-mcc:0.000000	test-mcc:0.484479 
[22]	train-mcc:0.000000	test-mcc:0.483046 
[23]	train-mcc:0.000000	test-mcc:0.483029 
[24]	train-mcc:0.000000	test-mcc:0.482922 
[25]	train-mcc:0.000000	test-mcc:0.485698 
[26]	train-mcc:0.000000	test-mcc:0.484721 
[27]	train-mcc:0.000000	test-mcc:0.482720 
[28]	train-mcc:0.000000	test-mcc:0.484463 
[29]	train-mcc:0.000000	test-mcc:0.483469 
[30]	train-mcc:0.000000	test-mcc:0.483469 
[31]	train-mcc:0.000000	test-mcc:0.483646 
[32]	train-mcc:0.000000	test-mcc:0.483118 
[33]	train-mcc:0.000000	test-mcc:0.482859 
[34]	train-mcc:0.000000	test-mcc:0.483565 
[35]	train-mcc:0.000000	test-mcc:0.483828 
[36]	train-mcc:0.000000	test-mcc:0.485437 
[37]	train-mcc:0.000000	test-mcc:0.483805 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.488065


Time: Thu Nov 10 2016 10:16:09 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.488065
Confusion matrix:
     truth
preds      0      1
    0 235272    965
    1    101    411
     truth
preds            0            1
    0 0.9937613253 0.0040760468
    1 0.0004266122 0.0017360158
Iteration 31 (base=0.09901666): MCC=0.488065 | threshold=0.3541932



Iteration 31[3] on Thu Nov 10 2016 10:16:10 AM

depth=5, min_child_weight=21.28039, subsample=0.5, colsample_bytree=1, base_score=0.09901666
[1]	train-mcc:0.000000	test-mcc:0.482693 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.491853 
[3]	train-mcc:0.000000	test-mcc:0.494261 
[4]	train-mcc:0.000000	test-mcc:0.495167 
[5]	train-mcc:0.000000	test-mcc:0.493028 
[6]	train-mcc:0.000000	test-mcc:0.492855 
[7]	train-mcc:0.000000	test-mcc:0.492036 
[8]	train-mcc:0.000000	test-mcc:0.492772 
[9]	train-mcc:0.000000	test-mcc:0.493038 
[10]	train-mcc:0.000000	test-mcc:0.494225 
[11]	train-mcc:0.000000	test-mcc:0.493810 
[12]	train-mcc:0.000000	test-mcc:0.494439 
[13]	train-mcc:0.000000	test-mcc:0.494439 
[14]	train-mcc:0.000000	test-mcc:0.493982 
[15]	train-mcc:0.000000	test-mcc:0.495167 
[16]	train-mcc:0.000000	test-mcc:0.495167 
[17]	train-mcc:0.000000	test-mcc:0.495380 
[18]	train-mcc:0.000000	test-mcc:0.494681 
[19]	train-mcc:0.000000	test-mcc:0.495598 
[20]	train-mcc:0.000000	test-mcc:0.496283 
[21]	train-mcc:0.000000	test-mcc:0.494681 
[22]	train-mcc:0.000000	test-mcc:0.495139 
[23]	train-mcc:0.000000	test-mcc:0.494681 
[24]	train-mcc:0.000000	test-mcc:0.495598 
[25]	train-mcc:0.000000	test-mcc:0.494681 
[26]	train-mcc:0.000000	test-mcc:0.495380 
[27]	train-mcc:0.000000	test-mcc:0.496319 
[28]	train-mcc:0.000000	test-mcc:0.497453 
[29]	train-mcc:0.000000	test-mcc:0.498582 
[30]	train-mcc:0.000000	test-mcc:0.498396 
[31]	train-mcc:0.000000	test-mcc:0.498332 
[32]	train-mcc:0.000000	test-mcc:0.496762 
[33]	train-mcc:0.000000	test-mcc:0.495572 
[34]	train-mcc:0.000000	test-mcc:0.496949 
[35]	train-mcc:0.000000	test-mcc:0.497048 
[36]	train-mcc:0.000000	test-mcc:0.496148 
[37]	train-mcc:0.000000	test-mcc:0.494462 
[38]	train-mcc:0.000000	test-mcc:0.497048 
[39]	train-mcc:0.000000	test-mcc:0.497048 
[40]	train-mcc:0.000000	test-mcc:0.496775 
[41]	train-mcc:0.000000	test-mcc:0.496319 
[42]	train-mcc:0.000000	test-mcc:0.498377 
[43]	train-mcc:0.000000	test-mcc:0.497217 
[44]	train-mcc:0.000000	test-mcc:0.497463 
[45]	train-mcc:0.000000	test-mcc:0.496281 
[46]	train-mcc:0.000000	test-mcc:0.496281 
[47]	train-mcc:0.000000	test-mcc:0.496281 
[48]	train-mcc:0.000000	test-mcc:0.498611 
[49]	train-mcc:0.000000	test-mcc:0.498840 
[50]	train-mcc:0.000000	test-mcc:0.499073 
[51]	train-mcc:0.000000	test-mcc:0.499954 
[52]	train-mcc:0.000000	test-mcc:0.496994 
[53]	train-mcc:0.000000	test-mcc:0.497087 
[54]	train-mcc:0.000000	test-mcc:0.495358 
[55]	train-mcc:0.000000	test-mcc:0.496048 
[56]	train-mcc:0.000000	test-mcc:0.495606 
[57]	train-mcc:0.000000	test-mcc:0.494885 
[58]	train-mcc:0.000000	test-mcc:0.496309 
[59]	train-mcc:0.000000	test-mcc:0.496309 
[60]	train-mcc:0.000000	test-mcc:0.495380 
[61]	train-mcc:0.000000	test-mcc:0.495606 
[62]	train-mcc:0.000000	test-mcc:0.492781 
[63]	train-mcc:0.000000	test-mcc:0.493037 
[64]	train-mcc:0.000000	test-mcc:0.493478 
[65]	train-mcc:0.000000	test-mcc:0.491900 
[66]	train-mcc:0.000000	test-mcc:0.490781 
[67]	train-mcc:0.000000	test-mcc:0.491210 
[68]	train-mcc:0.000000	test-mcc:0.494112 
[69]	train-mcc:0.000000	test-mcc:0.494557 
[70]	train-mcc:0.000000	test-mcc:0.493163 
[71]	train-mcc:0.000000	test-mcc:0.493360 
[72]	train-mcc:0.000000	test-mcc:0.493111 
[73]	train-mcc:0.000000	test-mcc:0.490945 
[74]	train-mcc:0.000000	test-mcc:0.490811 
[75]	train-mcc:0.000000	test-mcc:0.491128 
[76]	train-mcc:0.000000	test-mcc:0.489747 
[77]	train-mcc:0.000000	test-mcc:0.489895 
[78]	train-mcc:0.000000	test-mcc:0.489735 
[79]	train-mcc:0.000000	test-mcc:0.489486 
[80]	train-mcc:0.000000	test-mcc:0.489486 
[81]	train-mcc:0.000000	test-mcc:0.488754 
Stopping. Best iteration:
[51]	train-mcc:0.000000	test-mcc:0.499954


Time: Thu Nov 10 2016 10:18:57 AM
For 0051 rounds: train_mcc: 0 - test_mcc: 0.4999543
Confusion matrix:
     truth
preds      0      1
    0 235280    953
    1     94    423
     truth
preds            0            1
    0 0.9937909187 0.0040253432
    1 0.0003970433 0.0017866948
Iteration 31 (base=0.09901666): MCC=0.4999543 | threshold=0.4212069



Iteration 31[4] on Thu Nov 10 2016 10:18:58 AM

depth=5, min_child_weight=21.28039, subsample=0.5, colsample_bytree=1, base_score=0.09901666
[1]	train-mcc:0.000000	test-mcc:0.481122 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478498 
[3]	train-mcc:0.000000	test-mcc:0.479738 
[4]	train-mcc:0.000000	test-mcc:0.479604 
[5]	train-mcc:0.000000	test-mcc:0.478267 
[6]	train-mcc:0.000000	test-mcc:0.477679 
[7]	train-mcc:0.000000	test-mcc:0.479981 
[8]	train-mcc:0.000000	test-mcc:0.481425 
[9]	train-mcc:0.000000	test-mcc:0.481188 
[10]	train-mcc:0.000000	test-mcc:0.483270 
[11]	train-mcc:0.000000	test-mcc:0.484363 
[12]	train-mcc:0.000000	test-mcc:0.483583 
[13]	train-mcc:0.000000	test-mcc:0.485403 
[14]	train-mcc:0.000000	test-mcc:0.485038 
[15]	train-mcc:0.000000	test-mcc:0.485091 
[16]	train-mcc:0.000000	test-mcc:0.484396 
[17]	train-mcc:0.000000	test-mcc:0.484525 
[18]	train-mcc:0.000000	test-mcc:0.484214 
[19]	train-mcc:0.000000	test-mcc:0.483366 
[20]	train-mcc:0.000000	test-mcc:0.483680 
[21]	train-mcc:0.000000	test-mcc:0.483680 
[22]	train-mcc:0.000000	test-mcc:0.482040 
[23]	train-mcc:0.000000	test-mcc:0.482282 
[24]	train-mcc:0.000000	test-mcc:0.482631 
[25]	train-mcc:0.000000	test-mcc:0.484100 
[26]	train-mcc:0.000000	test-mcc:0.484812 
[27]	train-mcc:0.000000	test-mcc:0.485027 
[28]	train-mcc:0.000000	test-mcc:0.485059 
[29]	train-mcc:0.000000	test-mcc:0.483682 
[30]	train-mcc:0.000000	test-mcc:0.482657 
[31]	train-mcc:0.000000	test-mcc:0.482307 
[32]	train-mcc:0.000000	test-mcc:0.481523 
[33]	train-mcc:0.000000	test-mcc:0.481844 
[34]	train-mcc:0.000000	test-mcc:0.480843 
[35]	train-mcc:0.000000	test-mcc:0.480622 
[36]	train-mcc:0.000000	test-mcc:0.480864 
[37]	train-mcc:0.000000	test-mcc:0.480878 
[38]	train-mcc:0.000000	test-mcc:0.479939 
[39]	train-mcc:0.000000	test-mcc:0.479939 
[40]	train-mcc:0.000000	test-mcc:0.479619 
[41]	train-mcc:0.000000	test-mcc:0.478325 
[42]	train-mcc:0.000000	test-mcc:0.477951 
[43]	train-mcc:0.000000	test-mcc:0.477566 
Stopping. Best iteration:
[13]	train-mcc:0.000000	test-mcc:0.485403


Time: Thu Nov 10 2016 10:20:33 AM
For 0013 rounds: train_mcc: 0 - test_mcc: 0.4854033
Confusion matrix:
     truth
preds      0      1
    0 235170    907
    1    204    469
     truth
preds            0            1
    0 0.9933262936 0.0038310454
    1 0.0008616684 0.0019809926
Iteration 31 (base=0.09901666): MCC=0.4854033 | threshold=0.2862086



Iteration 31[5] on Thu Nov 10 2016 10:20:34 AM

depth=5, min_child_weight=21.28039, subsample=0.5, colsample_bytree=1, base_score=0.09901666
[1]	train-mcc:0.000000	test-mcc:0.481881 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480811 
[3]	train-mcc:0.000000	test-mcc:0.483382 
[4]	train-mcc:0.000000	test-mcc:0.484064 
[5]	train-mcc:0.000000	test-mcc:0.486335 
[6]	train-mcc:0.000000	test-mcc:0.487052 
[7]	train-mcc:0.000000	test-mcc:0.488379 
[8]	train-mcc:0.000000	test-mcc:0.488684 
[9]	train-mcc:0.000000	test-mcc:0.490667 
[10]	train-mcc:0.000000	test-mcc:0.492499 
[11]	train-mcc:0.000000	test-mcc:0.492894 
[12]	train-mcc:0.000000	test-mcc:0.491816 
[13]	train-mcc:0.000000	test-mcc:0.491353 
[14]	train-mcc:0.000000	test-mcc:0.491551 
[15]	train-mcc:0.000000	test-mcc:0.494575 
[16]	train-mcc:0.000000	test-mcc:0.494575 
[17]	train-mcc:0.000000	test-mcc:0.491989 
[18]	train-mcc:0.000000	test-mcc:0.492675 
[19]	train-mcc:0.000000	test-mcc:0.493764 
[20]	train-mcc:0.000000	test-mcc:0.491426 
[21]	train-mcc:0.000000	test-mcc:0.493891 
[22]	train-mcc:0.000000	test-mcc:0.494194 
[23]	train-mcc:0.000000	test-mcc:0.491971 
[24]	train-mcc:0.000000	test-mcc:0.492675 
[25]	train-mcc:0.000000	test-mcc:0.492675 
[26]	train-mcc:0.000000	test-mcc:0.491752 
[27]	train-mcc:0.000000	test-mcc:0.491989 
[28]	train-mcc:0.000000	test-mcc:0.491816 
[29]	train-mcc:0.000000	test-mcc:0.491899 
[30]	train-mcc:0.000000	test-mcc:0.489279 
[31]	train-mcc:0.000000	test-mcc:0.490160 
[32]	train-mcc:0.000000	test-mcc:0.488982 
[33]	train-mcc:0.000000	test-mcc:0.488982 
[34]	train-mcc:0.000000	test-mcc:0.487052 
[35]	train-mcc:0.000000	test-mcc:0.486504 
[36]	train-mcc:0.000000	test-mcc:0.486150 
[37]	train-mcc:0.000000	test-mcc:0.488112 
[38]	train-mcc:0.000000	test-mcc:0.487392 
[39]	train-mcc:0.000000	test-mcc:0.488323 
[40]	train-mcc:0.000000	test-mcc:0.488091 
[41]	train-mcc:0.000000	test-mcc:0.488065 
[42]	train-mcc:0.000000	test-mcc:0.486472 
[43]	train-mcc:0.000000	test-mcc:0.486227 
[44]	train-mcc:0.000000	test-mcc:0.487288 
[45]	train-mcc:0.000000	test-mcc:0.487574 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.494575


Time: Thu Nov 10 2016 10:22:01 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4945752
Confusion matrix:
     truth
preds      0      1
    0 235215    919
    1    159    457
     truth
preds            0            1
    0 0.9935163675 0.0038817318
    1 0.0006715945 0.0019303062
Iteration 31 (base=0.09901666): MCC=0.4945752 | threshold=0.3222558


===




Iteration 32[1] on Thu Nov 10 2016 10:22:40 AM

depth=5, min_child_weight=1, subsample=0.5238103, colsample_bytree=0.7559526, base_score=0.0948154
[1]	train-mcc:0.000000	test-mcc:0.464035 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472374 
[3]	train-mcc:0.000000	test-mcc:0.472266 
[4]	train-mcc:0.000000	test-mcc:0.473882 
[5]	train-mcc:0.000000	test-mcc:0.472950 
[6]	train-mcc:0.000000	test-mcc:0.474602 
[7]	train-mcc:0.000000	test-mcc:0.477740 
[8]	train-mcc:0.000000	test-mcc:0.479765 
[9]	train-mcc:0.000000	test-mcc:0.478287 
[10]	train-mcc:0.000000	test-mcc:0.477257 
[11]	train-mcc:0.000000	test-mcc:0.479879 
[12]	train-mcc:0.000000	test-mcc:0.481220 
[13]	train-mcc:0.000000	test-mcc:0.479731 
[14]	train-mcc:0.000000	test-mcc:0.479164 
[15]	train-mcc:0.000000	test-mcc:0.478690 
[16]	train-mcc:0.000000	test-mcc:0.478287 
[17]	train-mcc:0.000000	test-mcc:0.478287 
[18]	train-mcc:0.000000	test-mcc:0.479765 
[19]	train-mcc:0.000000	test-mcc:0.479219 
[20]	train-mcc:0.000000	test-mcc:0.479219 
[21]	train-mcc:0.000000	test-mcc:0.480694 
[22]	train-mcc:0.000000	test-mcc:0.480941 
[23]	train-mcc:0.000000	test-mcc:0.479673 
[24]	train-mcc:0.000000	test-mcc:0.479388 
[25]	train-mcc:0.000000	test-mcc:0.479388 
[26]	train-mcc:0.000000	test-mcc:0.479388 
[27]	train-mcc:0.000000	test-mcc:0.479388 
[28]	train-mcc:0.000000	test-mcc:0.481967 
[29]	train-mcc:0.000000	test-mcc:0.481785 
[30]	train-mcc:0.000000	test-mcc:0.481048 
[31]	train-mcc:0.000000	test-mcc:0.481048 
[32]	train-mcc:0.000000	test-mcc:0.481048 
[33]	train-mcc:0.000000	test-mcc:0.480309 
[34]	train-mcc:0.000000	test-mcc:0.479957 
[35]	train-mcc:0.000000	test-mcc:0.479938 
[36]	train-mcc:0.000000	test-mcc:0.479938 
[37]	train-mcc:0.000000	test-mcc:0.480206 
[38]	train-mcc:0.000000	test-mcc:0.481142 
[39]	train-mcc:0.000000	test-mcc:0.479013 
[40]	train-mcc:0.000000	test-mcc:0.478294 
[41]	train-mcc:0.000000	test-mcc:0.479388 
[42]	train-mcc:0.000000	test-mcc:0.479575 
[43]	train-mcc:0.000000	test-mcc:0.479570 
[44]	train-mcc:0.000000	test-mcc:0.481230 
[45]	train-mcc:0.000000	test-mcc:0.480676 
[46]	train-mcc:0.000000	test-mcc:0.481785 
[47]	train-mcc:0.000000	test-mcc:0.481230 
[48]	train-mcc:0.000000	test-mcc:0.481230 
[49]	train-mcc:0.000000	test-mcc:0.480676 
[50]	train-mcc:0.000000	test-mcc:0.479386 
[51]	train-mcc:0.000000	test-mcc:0.478480 
[52]	train-mcc:0.000000	test-mcc:0.476999 
[53]	train-mcc:0.000000	test-mcc:0.475848 
[54]	train-mcc:0.000000	test-mcc:0.477680 
[55]	train-mcc:0.000000	test-mcc:0.475501 
[56]	train-mcc:0.000000	test-mcc:0.476869 
[57]	train-mcc:0.000000	test-mcc:0.476944 
[58]	train-mcc:0.000000	test-mcc:0.478198 
Stopping. Best iteration:
[28]	train-mcc:0.000000	test-mcc:0.481967


Time: Thu Nov 10 2016 10:24:25 AM
For 0028 rounds: train_mcc: 0 - test_mcc: 0.4819669
Confusion matrix:
     truth
preds      0      1
    0 235309    999
    1     64    376
     truth
preds            0            1
    0 0.9939218072 0.0042196766
    1 0.0002703296 0.0015881866
Iteration 32 (base=0.0948154): MCC=0.4819669 | threshold=0.5594839



Iteration 32[2] on Thu Nov 10 2016 10:24:26 AM

depth=5, min_child_weight=1, subsample=0.5238103, colsample_bytree=0.7559526, base_score=0.0948154
[1]	train-mcc:0.000000	test-mcc:0.476271 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478898 
[3]	train-mcc:0.000000	test-mcc:0.483651 
[4]	train-mcc:0.000000	test-mcc:0.484062 
[5]	train-mcc:0.000000	test-mcc:0.486310 
[6]	train-mcc:0.000000	test-mcc:0.484883 
[7]	train-mcc:0.000000	test-mcc:0.484798 
[8]	train-mcc:0.000000	test-mcc:0.484004 
[9]	train-mcc:0.000000	test-mcc:0.486030 
[10]	train-mcc:0.000000	test-mcc:0.485505 
[11]	train-mcc:0.000000	test-mcc:0.484798 
[12]	train-mcc:0.000000	test-mcc:0.486735 
[13]	train-mcc:0.000000	test-mcc:0.486473 
[14]	train-mcc:0.000000	test-mcc:0.487177 
[15]	train-mcc:0.000000	test-mcc:0.485589 
[16]	train-mcc:0.000000	test-mcc:0.485589 
[17]	train-mcc:0.000000	test-mcc:0.485149 
[18]	train-mcc:0.000000	test-mcc:0.484474 
[19]	train-mcc:0.000000	test-mcc:0.485330 
[20]	train-mcc:0.000000	test-mcc:0.484107 
[21]	train-mcc:0.000000	test-mcc:0.484477 
[22]	train-mcc:0.000000	test-mcc:0.484855 
[23]	train-mcc:0.000000	test-mcc:0.485234 
[24]	train-mcc:0.000000	test-mcc:0.485234 
[25]	train-mcc:0.000000	test-mcc:0.484171 
[26]	train-mcc:0.000000	test-mcc:0.484550 
[27]	train-mcc:0.000000	test-mcc:0.483865 
[28]	train-mcc:0.000000	test-mcc:0.483583 
[29]	train-mcc:0.000000	test-mcc:0.483583 
[30]	train-mcc:0.000000	test-mcc:0.483078 
[31]	train-mcc:0.000000	test-mcc:0.483373 
[32]	train-mcc:0.000000	test-mcc:0.483373 
[33]	train-mcc:0.000000	test-mcc:0.482784 
[34]	train-mcc:0.000000	test-mcc:0.482784 
[35]	train-mcc:0.000000	test-mcc:0.482784 
[36]	train-mcc:0.000000	test-mcc:0.482784 
[37]	train-mcc:0.000000	test-mcc:0.482784 
[38]	train-mcc:0.000000	test-mcc:0.482784 
[39]	train-mcc:0.000000	test-mcc:0.482874 
[40]	train-mcc:0.000000	test-mcc:0.482874 
[41]	train-mcc:0.000000	test-mcc:0.482478 
[42]	train-mcc:0.000000	test-mcc:0.484360 
[43]	train-mcc:0.000000	test-mcc:0.484457 
[44]	train-mcc:0.000000	test-mcc:0.484949 
Stopping. Best iteration:
[14]	train-mcc:0.000000	test-mcc:0.487177


Time: Thu Nov 10 2016 10:25:43 AM
For 0014 rounds: train_mcc: 0 - test_mcc: 0.487177
Confusion matrix:
     truth
preds      0      1
    0 235244    948
    1    129    428
     truth
preds            0            1
    0 0.9936430566 0.0040042408
    1 0.0005448809 0.0018078218
Iteration 32 (base=0.0948154): MCC=0.487177 | threshold=0.3938895



Iteration 32[3] on Thu Nov 10 2016 10:25:45 AM

depth=5, min_child_weight=1, subsample=0.5238103, colsample_bytree=0.7559526, base_score=0.0948154
[1]	train-mcc:0.000000	test-mcc:0.480060 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.480318 
[3]	train-mcc:0.000000	test-mcc:0.483309 
[4]	train-mcc:0.000000	test-mcc:0.483998 
[5]	train-mcc:0.000000	test-mcc:0.486656 
[6]	train-mcc:0.000000	test-mcc:0.488083 
[7]	train-mcc:0.000000	test-mcc:0.488226 
[8]	train-mcc:0.000000	test-mcc:0.487620 
[9]	train-mcc:0.000000	test-mcc:0.488754 
[10]	train-mcc:0.000000	test-mcc:0.488318 
[11]	train-mcc:0.000000	test-mcc:0.488839 
[12]	train-mcc:0.000000	test-mcc:0.489718 
[13]	train-mcc:0.000000	test-mcc:0.492661 
[14]	train-mcc:0.000000	test-mcc:0.492554 
[15]	train-mcc:0.000000	test-mcc:0.491212 
[16]	train-mcc:0.000000	test-mcc:0.490457 
[17]	train-mcc:0.000000	test-mcc:0.491461 
[18]	train-mcc:0.000000	test-mcc:0.491009 
[19]	train-mcc:0.000000	test-mcc:0.492313 
[20]	train-mcc:0.000000	test-mcc:0.492412 
[21]	train-mcc:0.000000	test-mcc:0.492412 
[22]	train-mcc:0.000000	test-mcc:0.492538 
[23]	train-mcc:0.000000	test-mcc:0.491877 
[24]	train-mcc:0.000000	test-mcc:0.493038 
[25]	train-mcc:0.000000	test-mcc:0.491850 
[26]	train-mcc:0.000000	test-mcc:0.492238 
[27]	train-mcc:0.000000	test-mcc:0.492921 
[28]	train-mcc:0.000000	test-mcc:0.492630 
[29]	train-mcc:0.000000	test-mcc:0.493345 
[30]	train-mcc:0.000000	test-mcc:0.493345 
[31]	train-mcc:0.000000	test-mcc:0.493719 
[32]	train-mcc:0.000000	test-mcc:0.493719 
[33]	train-mcc:0.000000	test-mcc:0.493719 
[34]	train-mcc:0.000000	test-mcc:0.494970 
[35]	train-mcc:0.000000	test-mcc:0.494773 
[36]	train-mcc:0.000000	test-mcc:0.495167 
[37]	train-mcc:0.000000	test-mcc:0.493345 
[38]	train-mcc:0.000000	test-mcc:0.493345 
[39]	train-mcc:0.000000	test-mcc:0.494384 
[40]	train-mcc:0.000000	test-mcc:0.492433 
[41]	train-mcc:0.000000	test-mcc:0.492433 
[42]	train-mcc:0.000000	test-mcc:0.492717 
[43]	train-mcc:0.000000	test-mcc:0.492717 
[44]	train-mcc:0.000000	test-mcc:0.492717 
[45]	train-mcc:0.000000	test-mcc:0.495242 
[46]	train-mcc:0.000000	test-mcc:0.495948 
[47]	train-mcc:0.000000	test-mcc:0.495242 
[48]	train-mcc:0.000000	test-mcc:0.496653 
[49]	train-mcc:0.000000	test-mcc:0.499041 
[50]	train-mcc:0.000000	test-mcc:0.499116 
[51]	train-mcc:0.000000	test-mcc:0.499533 
[52]	train-mcc:0.000000	test-mcc:0.498412 
[53]	train-mcc:0.000000	test-mcc:0.497847 
[54]	train-mcc:0.000000	test-mcc:0.496870 
[55]	train-mcc:0.000000	test-mcc:0.495732 
[56]	train-mcc:0.000000	test-mcc:0.493886 
[57]	train-mcc:0.000000	test-mcc:0.496165 
[58]	train-mcc:0.000000	test-mcc:0.495678 
[59]	train-mcc:0.000000	test-mcc:0.495833 
[60]	train-mcc:0.000000	test-mcc:0.495584 
[61]	train-mcc:0.000000	test-mcc:0.494659 
[62]	train-mcc:0.000000	test-mcc:0.494420 
[63]	train-mcc:0.000000	test-mcc:0.493945 
[64]	train-mcc:0.000000	test-mcc:0.493945 
[65]	train-mcc:0.000000	test-mcc:0.494411 
[66]	train-mcc:0.000000	test-mcc:0.494879 
[67]	train-mcc:0.000000	test-mcc:0.494879 
[68]	train-mcc:0.000000	test-mcc:0.493945 
[69]	train-mcc:0.000000	test-mcc:0.493484 
[70]	train-mcc:0.000000	test-mcc:0.491877 
[71]	train-mcc:0.000000	test-mcc:0.492394 
[72]	train-mcc:0.000000	test-mcc:0.492545 
[73]	train-mcc:0.000000	test-mcc:0.493551 
[74]	train-mcc:0.000000	test-mcc:0.495629 
[75]	train-mcc:0.000000	test-mcc:0.496057 
[76]	train-mcc:0.000000	test-mcc:0.494086 
[77]	train-mcc:0.000000	test-mcc:0.494462 
[78]	train-mcc:0.000000	test-mcc:0.494730 
[79]	train-mcc:0.000000	test-mcc:0.492933 
[80]	train-mcc:0.000000	test-mcc:0.492242 
[81]	train-mcc:0.000000	test-mcc:0.490715 
Stopping. Best iteration:
[51]	train-mcc:0.000000	test-mcc:0.499533


Time: Thu Nov 10 2016 10:28:01 AM
For 0051 rounds: train_mcc: 0 - test_mcc: 0.4995331
Confusion matrix:
     truth
preds      0      1
    0 235282    955
    1     92    421
     truth
preds            0            1
    0 0.9937993664 0.0040337909
    1 0.0003885956 0.0017782471
Iteration 32 (base=0.0948154): MCC=0.4995331 | threshold=0.4226776



Iteration 32[4] on Thu Nov 10 2016 10:28:02 AM

depth=5, min_child_weight=1, subsample=0.5238103, colsample_bytree=0.7559526, base_score=0.0948154
[1]	train-mcc:0.000000	test-mcc:0.477920 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474582 
[3]	train-mcc:0.000000	test-mcc:0.474123 
[4]	train-mcc:0.000000	test-mcc:0.478181 
[5]	train-mcc:0.000000	test-mcc:0.479187 
[6]	train-mcc:0.000000	test-mcc:0.480180 
[7]	train-mcc:0.000000	test-mcc:0.479824 
[8]	train-mcc:0.000000	test-mcc:0.482004 
[9]	train-mcc:0.000000	test-mcc:0.482428 
[10]	train-mcc:0.000000	test-mcc:0.484957 
[11]	train-mcc:0.000000	test-mcc:0.483657 
[12]	train-mcc:0.000000	test-mcc:0.483419 
[13]	train-mcc:0.000000	test-mcc:0.484836 
[14]	train-mcc:0.000000	test-mcc:0.484836 
[15]	train-mcc:0.000000	test-mcc:0.483001 
[16]	train-mcc:0.000000	test-mcc:0.483366 
[17]	train-mcc:0.000000	test-mcc:0.481955 
[18]	train-mcc:0.000000	test-mcc:0.483269 
[19]	train-mcc:0.000000	test-mcc:0.483269 
[20]	train-mcc:0.000000	test-mcc:0.482589 
[21]	train-mcc:0.000000	test-mcc:0.480866 
[22]	train-mcc:0.000000	test-mcc:0.481229 
[23]	train-mcc:0.000000	test-mcc:0.482227 
[24]	train-mcc:0.000000	test-mcc:0.482545 
[25]	train-mcc:0.000000	test-mcc:0.480825 
[26]	train-mcc:0.000000	test-mcc:0.480866 
[27]	train-mcc:0.000000	test-mcc:0.481587 
[28]	train-mcc:0.000000	test-mcc:0.481688 
[29]	train-mcc:0.000000	test-mcc:0.480934 
[30]	train-mcc:0.000000	test-mcc:0.480835 
[31]	train-mcc:0.000000	test-mcc:0.481373 
[32]	train-mcc:0.000000	test-mcc:0.482567 
[33]	train-mcc:0.000000	test-mcc:0.482980 
[34]	train-mcc:0.000000	test-mcc:0.483304 
[35]	train-mcc:0.000000	test-mcc:0.483331 
[36]	train-mcc:0.000000	test-mcc:0.483604 
[37]	train-mcc:0.000000	test-mcc:0.483654 
[38]	train-mcc:0.000000	test-mcc:0.483258 
[39]	train-mcc:0.000000	test-mcc:0.481982 
[40]	train-mcc:0.000000	test-mcc:0.481240 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.484957


Time: Thu Nov 10 2016 10:29:08 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4849572
Confusion matrix:
     truth
preds      0      1
    0 235178    912
    1    196    464
     truth
preds            0            1
    0 0.9933600845 0.0038521647
    1 0.0008278775 0.0019598733
Iteration 32 (base=0.0948154): MCC=0.4849572 | threshold=0.2732323



Iteration 32[5] on Thu Nov 10 2016 10:29:09 AM

depth=5, min_child_weight=1, subsample=0.5238103, colsample_bytree=0.7559526, base_score=0.0948154
[1]	train-mcc:0.000000	test-mcc:0.488804 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488900 
[3]	train-mcc:0.000000	test-mcc:0.487103 
[4]	train-mcc:0.000000	test-mcc:0.488047 
[5]	train-mcc:0.000000	test-mcc:0.487396 
[6]	train-mcc:0.000000	test-mcc:0.487700 
[7]	train-mcc:0.000000	test-mcc:0.488141 
[8]	train-mcc:0.000000	test-mcc:0.487835 
[9]	train-mcc:0.000000	test-mcc:0.488130 
[10]	train-mcc:0.000000	test-mcc:0.487103 
[11]	train-mcc:0.000000	test-mcc:0.487338 
[12]	train-mcc:0.000000	test-mcc:0.487338 
[13]	train-mcc:0.000000	test-mcc:0.488636 
[14]	train-mcc:0.000000	test-mcc:0.488379 
[15]	train-mcc:0.000000	test-mcc:0.488362 
[16]	train-mcc:0.000000	test-mcc:0.489199 
[17]	train-mcc:0.000000	test-mcc:0.490845 
[18]	train-mcc:0.000000	test-mcc:0.489694 
[19]	train-mcc:0.000000	test-mcc:0.491406 
[20]	train-mcc:0.000000	test-mcc:0.492231 
[21]	train-mcc:0.000000	test-mcc:0.490585 
[22]	train-mcc:0.000000	test-mcc:0.490305 
[23]	train-mcc:0.000000	test-mcc:0.489694 
[24]	train-mcc:0.000000	test-mcc:0.489408 
[25]	train-mcc:0.000000	test-mcc:0.489809 
[26]	train-mcc:0.000000	test-mcc:0.488208 
[27]	train-mcc:0.000000	test-mcc:0.486882 
[28]	train-mcc:0.000000	test-mcc:0.487964 
[29]	train-mcc:0.000000	test-mcc:0.486940 
[30]	train-mcc:0.000000	test-mcc:0.486526 
[31]	train-mcc:0.000000	test-mcc:0.488423 
[32]	train-mcc:0.000000	test-mcc:0.486998 
[33]	train-mcc:0.000000	test-mcc:0.487371 
[34]	train-mcc:0.000000	test-mcc:0.486626 
[35]	train-mcc:0.000000	test-mcc:0.485158 
[36]	train-mcc:0.000000	test-mcc:0.486249 
[37]	train-mcc:0.000000	test-mcc:0.486141 
[38]	train-mcc:0.000000	test-mcc:0.485849 
[39]	train-mcc:0.000000	test-mcc:0.486560 
[40]	train-mcc:0.000000	test-mcc:0.486560 
[41]	train-mcc:0.000000	test-mcc:0.486560 
[42]	train-mcc:0.000000	test-mcc:0.485852 
[43]	train-mcc:0.000000	test-mcc:0.485852 
[44]	train-mcc:0.000000	test-mcc:0.488229 
[45]	train-mcc:0.000000	test-mcc:0.488776 
[46]	train-mcc:0.000000	test-mcc:0.489191 
[47]	train-mcc:0.000000	test-mcc:0.487669 
[48]	train-mcc:0.000000	test-mcc:0.489191 
[49]	train-mcc:0.000000	test-mcc:0.488229 
[50]	train-mcc:0.000000	test-mcc:0.488652 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.492231


Time: Thu Nov 10 2016 10:30:32 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.4922306
Confusion matrix:
     truth
preds      0      1
    0 235221    926
    1    153    450
     truth
preds            0            1
    0 0.9935417107 0.0039112988
    1 0.0006462513 0.0019007392
Iteration 32 (base=0.0948154): MCC=0.4922306 | threshold=0.3121599


===




Iteration 33[1] on Thu Nov 10 2016 10:31:17 AM

depth=5, min_child_weight=4.976841, subsample=0.5, colsample_bytree=0.9156574, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.371577 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.083466 
[3]	train-mcc:0.000000	test-mcc:0.084335 
[4]	train-mcc:0.000000	test-mcc:0.401653 
[5]	train-mcc:0.000000	test-mcc:0.079877 
[6]	train-mcc:0.000000	test-mcc:0.242691 
[7]	train-mcc:0.000000	test-mcc:0.365472 
[8]	train-mcc:0.000000	test-mcc:0.428883 
[9]	train-mcc:0.000000	test-mcc:0.437259 
[10]	train-mcc:0.000000	test-mcc:0.431736 
[11]	train-mcc:0.000000	test-mcc:0.430936 
[12]	train-mcc:0.000000	test-mcc:0.432477 
[13]	train-mcc:0.000000	test-mcc:0.432288 
[14]	train-mcc:0.000000	test-mcc:0.431080 
[15]	train-mcc:0.000000	test-mcc:0.429894 
[16]	train-mcc:0.000000	test-mcc:0.426849 
[17]	train-mcc:0.000000	test-mcc:0.426575 
[18]	train-mcc:0.000000	test-mcc:0.411554 
[19]	train-mcc:0.000000	test-mcc:0.412934 
[20]	train-mcc:0.000000	test-mcc:0.417818 
[21]	train-mcc:0.000000	test-mcc:0.422982 
[22]	train-mcc:0.000000	test-mcc:0.427111 
[23]	train-mcc:0.000000	test-mcc:0.426333 
[24]	train-mcc:0.000000	test-mcc:0.428511 
[25]	train-mcc:0.000000	test-mcc:0.429392 
[26]	train-mcc:0.000000	test-mcc:0.430723 
[27]	train-mcc:0.000000	test-mcc:0.429728 
[28]	train-mcc:0.000000	test-mcc:0.429142 
[29]	train-mcc:0.000000	test-mcc:0.428951 
[30]	train-mcc:0.000000	test-mcc:0.432742 
[31]	train-mcc:0.000000	test-mcc:0.433496 
[32]	train-mcc:0.000000	test-mcc:0.435166 
[33]	train-mcc:0.000000	test-mcc:0.435428 
[34]	train-mcc:0.000000	test-mcc:0.434155 
[35]	train-mcc:0.000000	test-mcc:0.432597 
[36]	train-mcc:0.000000	test-mcc:0.432597 
[37]	train-mcc:0.000000	test-mcc:0.434515 
[38]	train-mcc:0.000000	test-mcc:0.434515 
[39]	train-mcc:0.000000	test-mcc:0.433730 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.437259


Time: Thu Nov 10 2016 10:32:37 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.4372589
Confusion matrix:
     truth
preds      0      1
    0 235068    928
    1    305    447
     truth
preds           0           1
    0 0.992903847 0.003919780
    1 0.001288290 0.001888084
Iteration 33 (base=0.001): MCC=0.4372589 | threshold=0.8562731



Iteration 33[2] on Thu Nov 10 2016 10:32:38 AM

depth=5, min_child_weight=4.976841, subsample=0.5, colsample_bytree=0.9156574, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.388430 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.070380 
[3]	train-mcc:0.000000	test-mcc:0.070123 
[4]	train-mcc:0.000000	test-mcc:0.387920 
[5]	train-mcc:0.000000	test-mcc:0.068963 
[6]	train-mcc:0.000000	test-mcc:0.068965 
[7]	train-mcc:0.000000	test-mcc:0.070234 
[8]	train-mcc:0.000000	test-mcc:0.386721 
[9]	train-mcc:0.000000	test-mcc:0.386335 
[10]	train-mcc:0.000000	test-mcc:0.065654 
[11]	train-mcc:0.000000	test-mcc:0.065830 
[12]	train-mcc:0.000000	test-mcc:0.102777 
[13]	train-mcc:0.000000	test-mcc:0.417865 
[14]	train-mcc:0.000000	test-mcc:0.099445 
[15]	train-mcc:0.000000	test-mcc:0.418550 
[16]	train-mcc:0.000000	test-mcc:0.100578 
[17]	train-mcc:0.000000	test-mcc:0.423895 
[18]	train-mcc:0.000000	test-mcc:0.415654 
[19]	train-mcc:0.000000	test-mcc:0.409427 
[20]	train-mcc:0.000000	test-mcc:0.410132 
[21]	train-mcc:0.000000	test-mcc:0.408666 
[22]	train-mcc:0.000000	test-mcc:0.411339 
[23]	train-mcc:0.000000	test-mcc:0.418480 
[24]	train-mcc:0.000000	test-mcc:0.420455 
[25]	train-mcc:0.000000	test-mcc:0.420745 
[26]	train-mcc:0.000000	test-mcc:0.421470 
[27]	train-mcc:0.000000	test-mcc:0.423189 
[28]	train-mcc:0.000000	test-mcc:0.424602 
[29]	train-mcc:0.000000	test-mcc:0.424002 
[30]	train-mcc:0.000000	test-mcc:0.424163 
[31]	train-mcc:0.000000	test-mcc:0.424317 
[32]	train-mcc:0.000000	test-mcc:0.427028 
[33]	train-mcc:0.000000	test-mcc:0.429499 
[34]	train-mcc:0.000000	test-mcc:0.429865 
[35]	train-mcc:0.000000	test-mcc:0.430886 
[36]	train-mcc:0.000000	test-mcc:0.428790 
[37]	train-mcc:0.000000	test-mcc:0.429048 
[38]	train-mcc:0.000000	test-mcc:0.429738 
[39]	train-mcc:0.000000	test-mcc:0.430453 
[40]	train-mcc:0.000000	test-mcc:0.431179 
[41]	train-mcc:0.000000	test-mcc:0.431848 
[42]	train-mcc:0.000000	test-mcc:0.431387 
[43]	train-mcc:0.000000	test-mcc:0.434211 
[44]	train-mcc:0.000000	test-mcc:0.436245 
[45]	train-mcc:0.000000	test-mcc:0.433949 
[46]	train-mcc:0.000000	test-mcc:0.434570 
[47]	train-mcc:0.000000	test-mcc:0.432988 
[48]	train-mcc:0.000000	test-mcc:0.432717 
[49]	train-mcc:0.000000	test-mcc:0.428215 
[50]	train-mcc:0.000000	test-mcc:0.428728 
[51]	train-mcc:0.000000	test-mcc:0.428640 
[52]	train-mcc:0.000000	test-mcc:0.428565 
[53]	train-mcc:0.000000	test-mcc:0.429397 
[54]	train-mcc:0.000000	test-mcc:0.428982 
[55]	train-mcc:0.000000	test-mcc:0.429184 
[56]	train-mcc:0.000000	test-mcc:0.428951 
[57]	train-mcc:0.000000	test-mcc:0.428706 
[58]	train-mcc:0.000000	test-mcc:0.428658 
[59]	train-mcc:0.000000	test-mcc:0.429453 
[60]	train-mcc:0.000000	test-mcc:0.429147 
[61]	train-mcc:0.000000	test-mcc:0.429441 
[62]	train-mcc:0.000000	test-mcc:0.428304 
[63]	train-mcc:0.000000	test-mcc:0.429589 
[64]	train-mcc:0.000000	test-mcc:0.429666 
[65]	train-mcc:0.000000	test-mcc:0.429666 
[66]	train-mcc:0.000000	test-mcc:0.428394 
[67]	train-mcc:0.000000	test-mcc:0.428771 
[68]	train-mcc:0.000000	test-mcc:0.429473 
[69]	train-mcc:0.000000	test-mcc:0.430135 
[70]	train-mcc:0.000000	test-mcc:0.429854 
[71]	train-mcc:0.000000	test-mcc:0.429582 
[72]	train-mcc:0.000000	test-mcc:0.430947 
[73]	train-mcc:0.000000	test-mcc:0.431416 
[74]	train-mcc:0.000000	test-mcc:0.430624 
Stopping. Best iteration:
[44]	train-mcc:0.000000	test-mcc:0.436245


Time: Thu Nov 10 2016 10:35:11 AM
For 0044 rounds: train_mcc: 0 - test_mcc: 0.4362454
Confusion matrix:
     truth
preds      0      1
    0 235024    912
    1    349    464
     truth
preds           0           1
    0 0.992713802 0.003852181
    1 0.001474135 0.001959882
Iteration 33 (base=0.001): MCC=0.4362454 | threshold=0.4102119



Iteration 33[3] on Thu Nov 10 2016 10:35:12 AM

depth=5, min_child_weight=4.976841, subsample=0.5, colsample_bytree=0.9156574, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.392355 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.079734 
[3]	train-mcc:0.000000	test-mcc:0.081288 
[4]	train-mcc:0.000000	test-mcc:0.390464 
[5]	train-mcc:0.000000	test-mcc:0.082613 
[6]	train-mcc:0.000000	test-mcc:0.082068 
[7]	train-mcc:0.000000	test-mcc:0.082091 
[8]	train-mcc:0.000000	test-mcc:0.386570 
[9]	train-mcc:0.000000	test-mcc:0.080669 
[10]	train-mcc:0.000000	test-mcc:0.079475 
[11]	train-mcc:0.000000	test-mcc:0.081173 
[12]	train-mcc:0.000000	test-mcc:0.409856 
[13]	train-mcc:0.000000	test-mcc:0.078245 
[14]	train-mcc:0.000000	test-mcc:0.410209 
[15]	train-mcc:0.000000	test-mcc:0.077696 
[16]	train-mcc:0.000000	test-mcc:0.404501 
[17]	train-mcc:0.000000	test-mcc:0.072923 
[18]	train-mcc:0.000000	test-mcc:0.402223 
[19]	train-mcc:0.000000	test-mcc:0.417410 
[20]	train-mcc:0.000000	test-mcc:0.418283 
[21]	train-mcc:0.000000	test-mcc:0.419887 
[22]	train-mcc:0.000000	test-mcc:0.421241 
[23]	train-mcc:0.000000	test-mcc:0.416117 
[24]	train-mcc:0.000000	test-mcc:0.418962 
[25]	train-mcc:0.000000	test-mcc:0.422980 
[26]	train-mcc:0.000000	test-mcc:0.422693 
[27]	train-mcc:0.000000	test-mcc:0.425773 
[28]	train-mcc:0.000000	test-mcc:0.427229 
[29]	train-mcc:0.000000	test-mcc:0.427330 
[30]	train-mcc:0.000000	test-mcc:0.427439 
[31]	train-mcc:0.000000	test-mcc:0.428944 
[32]	train-mcc:0.000000	test-mcc:0.432870 
[33]	train-mcc:0.000000	test-mcc:0.432286 
[34]	train-mcc:0.000000	test-mcc:0.432509 
[35]	train-mcc:0.000000	test-mcc:0.435812 
[36]	train-mcc:0.000000	test-mcc:0.438557 
[37]	train-mcc:0.000000	test-mcc:0.440002 
[38]	train-mcc:0.000000	test-mcc:0.439920 
[39]	train-mcc:0.000000	test-mcc:0.438105 
[40]	train-mcc:0.000000	test-mcc:0.434200 
[41]	train-mcc:0.000000	test-mcc:0.433985 
[42]	train-mcc:0.000000	test-mcc:0.435986 
[43]	train-mcc:0.000000	test-mcc:0.437636 
[44]	train-mcc:0.000000	test-mcc:0.437716 
[45]	train-mcc:0.000000	test-mcc:0.438217 
[46]	train-mcc:0.000000	test-mcc:0.438465 
[47]	train-mcc:0.000000	test-mcc:0.444945 
[48]	train-mcc:0.000000	test-mcc:0.443267 
[49]	train-mcc:0.000000	test-mcc:0.445393 
[50]	train-mcc:0.000000	test-mcc:0.444708 
[51]	train-mcc:0.000000	test-mcc:0.442736 
[52]	train-mcc:0.000000	test-mcc:0.440403 
[53]	train-mcc:0.000000	test-mcc:0.438618 
[54]	train-mcc:0.000000	test-mcc:0.439359 
[55]	train-mcc:0.000000	test-mcc:0.442912 
[56]	train-mcc:0.000000	test-mcc:0.440747 
[57]	train-mcc:0.000000	test-mcc:0.441391 
[58]	train-mcc:0.000000	test-mcc:0.442263 
[59]	train-mcc:0.000000	test-mcc:0.442418 
[60]	train-mcc:0.000000	test-mcc:0.442316 
[61]	train-mcc:0.000000	test-mcc:0.441558 
[62]	train-mcc:0.000000	test-mcc:0.440677 
[63]	train-mcc:0.000000	test-mcc:0.438845 
[64]	train-mcc:0.000000	test-mcc:0.437222 
[65]	train-mcc:0.000000	test-mcc:0.437474 
[66]	train-mcc:0.000000	test-mcc:0.436571 
[67]	train-mcc:0.000000	test-mcc:0.437048 
[68]	train-mcc:0.000000	test-mcc:0.438460 
[69]	train-mcc:0.000000	test-mcc:0.440279 
[70]	train-mcc:0.000000	test-mcc:0.440008 
[71]	train-mcc:0.000000	test-mcc:0.440270 
[72]	train-mcc:0.000000	test-mcc:0.439733 
[73]	train-mcc:0.000000	test-mcc:0.438948 
[74]	train-mcc:0.000000	test-mcc:0.439095 
[75]	train-mcc:0.000000	test-mcc:0.437616 
[76]	train-mcc:0.000000	test-mcc:0.437969 
[77]	train-mcc:0.000000	test-mcc:0.437502 
[78]	train-mcc:0.000000	test-mcc:0.438400 
[79]	train-mcc:0.000000	test-mcc:0.438465 
Stopping. Best iteration:
[49]	train-mcc:0.000000	test-mcc:0.445393


Time: Thu Nov 10 2016 10:37:57 AM
For 0049 rounds: train_mcc: 0 - test_mcc: 0.4453932
Confusion matrix:
     truth
preds      0      1
    0 234966    875
    1    408    501
     truth
preds           0           1
    0 0.992464625 0.003695882
    1 0.001723337 0.002116156
Iteration 33 (base=0.001): MCC=0.4453932 | threshold=0.3120598



Iteration 33[4] on Thu Nov 10 2016 10:37:58 AM

depth=5, min_child_weight=4.976841, subsample=0.5, colsample_bytree=0.9156574, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.386454 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.095461 
[3]	train-mcc:0.000000	test-mcc:0.097220 
[4]	train-mcc:0.000000	test-mcc:0.438864 
[5]	train-mcc:0.000000	test-mcc:0.453823 
[6]	train-mcc:0.000000	test-mcc:0.453823 
[7]	train-mcc:0.000000	test-mcc:0.448025 
[8]	train-mcc:0.000000	test-mcc:0.445622 
[9]	train-mcc:0.000000	test-mcc:0.444503 
[10]	train-mcc:0.000000	test-mcc:0.448495 
[11]	train-mcc:0.000000	test-mcc:0.447730 
[12]	train-mcc:0.000000	test-mcc:0.448013 
[13]	train-mcc:0.000000	test-mcc:0.447532 
[14]	train-mcc:0.000000	test-mcc:0.447730 
[15]	train-mcc:0.000000	test-mcc:0.447247 
[16]	train-mcc:0.000000	test-mcc:0.450760 
[17]	train-mcc:0.000000	test-mcc:0.455762 
[18]	train-mcc:0.000000	test-mcc:0.454876 
[19]	train-mcc:0.000000	test-mcc:0.454351 
[20]	train-mcc:0.000000	test-mcc:0.455480 
[21]	train-mcc:0.000000	test-mcc:0.455480 
[22]	train-mcc:0.000000	test-mcc:0.453996 
[23]	train-mcc:0.000000	test-mcc:0.454605 
[24]	train-mcc:0.000000	test-mcc:0.456661 
[25]	train-mcc:0.000000	test-mcc:0.456941 
[26]	train-mcc:0.000000	test-mcc:0.456636 
[27]	train-mcc:0.000000	test-mcc:0.455681 
[28]	train-mcc:0.000000	test-mcc:0.456523 
[29]	train-mcc:0.000000	test-mcc:0.455160 
[30]	train-mcc:0.000000	test-mcc:0.453595 
[31]	train-mcc:0.000000	test-mcc:0.452681 
[32]	train-mcc:0.000000	test-mcc:0.452357 
[33]	train-mcc:0.000000	test-mcc:0.452446 
[34]	train-mcc:0.000000	test-mcc:0.452805 
[35]	train-mcc:0.000000	test-mcc:0.449980 
[36]	train-mcc:0.000000	test-mcc:0.450104 
[37]	train-mcc:0.000000	test-mcc:0.450267 
[38]	train-mcc:0.000000	test-mcc:0.450234 
[39]	train-mcc:0.000000	test-mcc:0.450400 
[40]	train-mcc:0.000000	test-mcc:0.451896 
[41]	train-mcc:0.000000	test-mcc:0.450546 
[42]	train-mcc:0.000000	test-mcc:0.451481 
[43]	train-mcc:0.000000	test-mcc:0.451211 
[44]	train-mcc:0.000000	test-mcc:0.449657 
[45]	train-mcc:0.000000	test-mcc:0.450973 
[46]	train-mcc:0.000000	test-mcc:0.452190 
[47]	train-mcc:0.000000	test-mcc:0.451835 
[48]	train-mcc:0.000000	test-mcc:0.453006 
[49]	train-mcc:0.000000	test-mcc:0.451864 
[50]	train-mcc:0.000000	test-mcc:0.452950 
[51]	train-mcc:0.000000	test-mcc:0.451680 
[52]	train-mcc:0.000000	test-mcc:0.451680 
[53]	train-mcc:0.000000	test-mcc:0.452737 
[54]	train-mcc:0.000000	test-mcc:0.453006 
[55]	train-mcc:0.000000	test-mcc:0.453141 
Stopping. Best iteration:
[25]	train-mcc:0.000000	test-mcc:0.456941


Time: Thu Nov 10 2016 10:39:42 AM
For 0025 rounds: train_mcc: 0 - test_mcc: 0.4569409
Confusion matrix:
     truth
preds      0      1
    0 235218    974
    1    156    402
     truth
preds            0            1
    0 0.9935290391 0.0041140444
    1 0.0006589229 0.0016979937
Iteration 33 (base=0.001): MCC=0.4569409 | threshold=0.4727705



Iteration 33[5] on Thu Nov 10 2016 10:39:43 AM

depth=5, min_child_weight=4.976841, subsample=0.5, colsample_bytree=0.9156574, base_score=0.001
[1]	train-mcc:0.000000	test-mcc:0.377084 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.094692 
[3]	train-mcc:0.000000	test-mcc:0.094260 
[4]	train-mcc:0.000000	test-mcc:0.375738 
[5]	train-mcc:0.000000	test-mcc:0.094409 
[6]	train-mcc:0.000000	test-mcc:0.094248 
[7]	train-mcc:0.000000	test-mcc:0.094296 
[8]	train-mcc:0.000000	test-mcc:0.426585 
[9]	train-mcc:0.000000	test-mcc:0.093024 
[10]	train-mcc:0.000000	test-mcc:0.409342 
[11]	train-mcc:0.000000	test-mcc:0.408239 
[12]	train-mcc:0.000000	test-mcc:0.408304 
[13]	train-mcc:0.000000	test-mcc:0.428830 
[14]	train-mcc:0.000000	test-mcc:0.426680 
[15]	train-mcc:0.000000	test-mcc:0.422892 
[16]	train-mcc:0.000000	test-mcc:0.424422 
[17]	train-mcc:0.000000	test-mcc:0.423418 
[18]	train-mcc:0.000000	test-mcc:0.422513 
[19]	train-mcc:0.000000	test-mcc:0.423185 
[20]	train-mcc:0.000000	test-mcc:0.418031 
[21]	train-mcc:0.000000	test-mcc:0.411404 
[22]	train-mcc:0.000000	test-mcc:0.418653 
[23]	train-mcc:0.000000	test-mcc:0.420307 
[24]	train-mcc:0.000000	test-mcc:0.420296 
[25]	train-mcc:0.000000	test-mcc:0.423860 
[26]	train-mcc:0.000000	test-mcc:0.427895 
[27]	train-mcc:0.000000	test-mcc:0.429774 
[28]	train-mcc:0.000000	test-mcc:0.429765 
[29]	train-mcc:0.000000	test-mcc:0.429311 
[30]	train-mcc:0.000000	test-mcc:0.429774 
[31]	train-mcc:0.000000	test-mcc:0.428647 
[32]	train-mcc:0.000000	test-mcc:0.426406 
[33]	train-mcc:0.000000	test-mcc:0.427431 
[34]	train-mcc:0.000000	test-mcc:0.428769 
[35]	train-mcc:0.000000	test-mcc:0.427388 
[36]	train-mcc:0.000000	test-mcc:0.429638 
[37]	train-mcc:0.000000	test-mcc:0.431873 
[38]	train-mcc:0.000000	test-mcc:0.431467 
[39]	train-mcc:0.000000	test-mcc:0.432095 
[40]	train-mcc:0.000000	test-mcc:0.433078 
[41]	train-mcc:0.000000	test-mcc:0.434135 
[42]	train-mcc:0.000000	test-mcc:0.434723 
[43]	train-mcc:0.000000	test-mcc:0.434936 
[44]	train-mcc:0.000000	test-mcc:0.433951 
[45]	train-mcc:0.000000	test-mcc:0.432827 
[46]	train-mcc:0.000000	test-mcc:0.431465 
[47]	train-mcc:0.000000	test-mcc:0.430835 
[48]	train-mcc:0.000000	test-mcc:0.431341 
[49]	train-mcc:0.000000	test-mcc:0.428908 
[50]	train-mcc:0.000000	test-mcc:0.429320 
[51]	train-mcc:0.000000	test-mcc:0.427632 
[52]	train-mcc:0.000000	test-mcc:0.429453 
[53]	train-mcc:0.000000	test-mcc:0.428283 
[54]	train-mcc:0.000000	test-mcc:0.427945 
[55]	train-mcc:0.000000	test-mcc:0.427863 
[56]	train-mcc:0.000000	test-mcc:0.428283 
[57]	train-mcc:0.000000	test-mcc:0.426609 
[58]	train-mcc:0.000000	test-mcc:0.426894 
[59]	train-mcc:0.000000	test-mcc:0.425604 
[60]	train-mcc:0.000000	test-mcc:0.426161 
[61]	train-mcc:0.000000	test-mcc:0.425960 
[62]	train-mcc:0.000000	test-mcc:0.426372 
[63]	train-mcc:0.000000	test-mcc:0.425314 
[64]	train-mcc:0.000000	test-mcc:0.425951 
[65]	train-mcc:0.000000	test-mcc:0.426584 
[66]	train-mcc:0.000000	test-mcc:0.425960 
[67]	train-mcc:0.000000	test-mcc:0.423424 
[68]	train-mcc:0.000000	test-mcc:0.423505 
[69]	train-mcc:0.000000	test-mcc:0.423340 
[70]	train-mcc:0.000000	test-mcc:0.423895 
[71]	train-mcc:0.000000	test-mcc:0.425052 
[72]	train-mcc:0.000000	test-mcc:0.424964 
[73]	train-mcc:0.000000	test-mcc:0.423844 
Stopping. Best iteration:
[43]	train-mcc:0.000000	test-mcc:0.434936


Time: Thu Nov 10 2016 10:41:59 AM
For 0043 rounds: train_mcc: 0 - test_mcc: 0.4349359
Confusion matrix:
     truth
preds      0      1
    0 235064    930
    1    310    446
     truth
preds           0           1
    0 0.992878564 0.003928194
    1 0.001309398 0.001883844
Iteration 33 (base=0.001): MCC=0.4349359 | threshold=0.3962232


===




Iteration 34[1] on Thu Nov 10 2016 10:42:43 AM

depth=5, min_child_weight=35.79293, subsample=0.8824638, colsample_bytree=0.5, base_score=0.1145142
[1]	train-mcc:0.000000	test-mcc:0.459806 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471847 
[3]	train-mcc:0.000000	test-mcc:0.473585 
[4]	train-mcc:0.000000	test-mcc:0.477727 
[5]	train-mcc:0.000000	test-mcc:0.480364 
[6]	train-mcc:0.000000	test-mcc:0.479424 
[7]	train-mcc:0.000000	test-mcc:0.480232 
[8]	train-mcc:0.000000	test-mcc:0.480696 
[9]	train-mcc:0.000000	test-mcc:0.482129 
[10]	train-mcc:0.000000	test-mcc:0.484231 
[11]	train-mcc:0.000000	test-mcc:0.484449 
[12]	train-mcc:0.000000	test-mcc:0.484449 
[13]	train-mcc:0.000000	test-mcc:0.484449 
[14]	train-mcc:0.000000	test-mcc:0.482590 
[15]	train-mcc:0.000000	test-mcc:0.482522 
[16]	train-mcc:0.000000	test-mcc:0.482801 
[17]	train-mcc:0.000000	test-mcc:0.481621 
[18]	train-mcc:0.000000	test-mcc:0.481368 
[19]	train-mcc:0.000000	test-mcc:0.482085 
[20]	train-mcc:0.000000	test-mcc:0.481834 
[21]	train-mcc:0.000000	test-mcc:0.480974 
[22]	train-mcc:0.000000	test-mcc:0.481333 
[23]	train-mcc:0.000000	test-mcc:0.481609 
[24]	train-mcc:0.000000	test-mcc:0.481158 
[25]	train-mcc:0.000000	test-mcc:0.480903 
[26]	train-mcc:0.000000	test-mcc:0.480397 
[27]	train-mcc:0.000000	test-mcc:0.480865 
[28]	train-mcc:0.000000	test-mcc:0.480164 
[29]	train-mcc:0.000000	test-mcc:0.480519 
[30]	train-mcc:0.000000	test-mcc:0.480519 
[31]	train-mcc:0.000000	test-mcc:0.480820 
[32]	train-mcc:0.000000	test-mcc:0.480820 
[33]	train-mcc:0.000000	test-mcc:0.480492 
[34]	train-mcc:0.000000	test-mcc:0.480492 
[35]	train-mcc:0.000000	test-mcc:0.480773 
[36]	train-mcc:0.000000	test-mcc:0.480773 
[37]	train-mcc:0.000000	test-mcc:0.480773 
[38]	train-mcc:0.000000	test-mcc:0.480773 
[39]	train-mcc:0.000000	test-mcc:0.480749 
[40]	train-mcc:0.000000	test-mcc:0.481373 
[41]	train-mcc:0.000000	test-mcc:0.481373 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.484449


Time: Thu Nov 10 2016 10:43:38 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4844486
Confusion matrix:
     truth
preds      0      1
    0 235261    962
    1    112    413
     truth
preds            0            1
    0 0.9937190599 0.0040633923
    1 0.0004730769 0.0017444709
Iteration 34 (base=0.1145142): MCC=0.4844486 | threshold=0.4260692



Iteration 34[2] on Thu Nov 10 2016 10:43:39 AM

depth=5, min_child_weight=35.79293, subsample=0.8824638, colsample_bytree=0.5, base_score=0.1145142
[1]	train-mcc:0.000000	test-mcc:0.470133 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474714 
[3]	train-mcc:0.000000	test-mcc:0.474492 
[4]	train-mcc:0.000000	test-mcc:0.478666 
[5]	train-mcc:0.000000	test-mcc:0.479342 
[6]	train-mcc:0.000000	test-mcc:0.481292 
[7]	train-mcc:0.000000	test-mcc:0.481881 
[8]	train-mcc:0.000000	test-mcc:0.482017 
[9]	train-mcc:0.000000	test-mcc:0.482320 
[10]	train-mcc:0.000000	test-mcc:0.483203 
[11]	train-mcc:0.000000	test-mcc:0.483911 
[12]	train-mcc:0.000000	test-mcc:0.484400 
[13]	train-mcc:0.000000	test-mcc:0.486075 
[14]	train-mcc:0.000000	test-mcc:0.486075 
[15]	train-mcc:0.000000	test-mcc:0.486075 
[16]	train-mcc:0.000000	test-mcc:0.485623 
[17]	train-mcc:0.000000	test-mcc:0.484177 
[18]	train-mcc:0.000000	test-mcc:0.484977 
[19]	train-mcc:0.000000	test-mcc:0.484710 
[20]	train-mcc:0.000000	test-mcc:0.484004 
[21]	train-mcc:0.000000	test-mcc:0.484443 
[22]	train-mcc:0.000000	test-mcc:0.483736 
[23]	train-mcc:0.000000	test-mcc:0.484004 
[24]	train-mcc:0.000000	test-mcc:0.484004 
[25]	train-mcc:0.000000	test-mcc:0.484105 
[26]	train-mcc:0.000000	test-mcc:0.484540 
[27]	train-mcc:0.000000	test-mcc:0.484272 
[28]	train-mcc:0.000000	test-mcc:0.484059 
[29]	train-mcc:0.000000	test-mcc:0.484400 
[30]	train-mcc:0.000000	test-mcc:0.485019 
[31]	train-mcc:0.000000	test-mcc:0.485044 
[32]	train-mcc:0.000000	test-mcc:0.485044 
[33]	train-mcc:0.000000	test-mcc:0.487246 
[34]	train-mcc:0.000000	test-mcc:0.486323 
[35]	train-mcc:0.000000	test-mcc:0.485892 
[36]	train-mcc:0.000000	test-mcc:0.486437 
[37]	train-mcc:0.000000	test-mcc:0.485892 
[38]	train-mcc:0.000000	test-mcc:0.485892 
[39]	train-mcc:0.000000	test-mcc:0.485892 
[40]	train-mcc:0.000000	test-mcc:0.486710 
[41]	train-mcc:0.000000	test-mcc:0.485310 
[42]	train-mcc:0.000000	test-mcc:0.484037 
[43]	train-mcc:0.000000	test-mcc:0.485438 
[44]	train-mcc:0.000000	test-mcc:0.485861 
[45]	train-mcc:0.000000	test-mcc:0.484460 
[46]	train-mcc:0.000000	test-mcc:0.483565 
[47]	train-mcc:0.000000	test-mcc:0.483128 
[48]	train-mcc:0.000000	test-mcc:0.483842 
[49]	train-mcc:0.000000	test-mcc:0.483671 
[50]	train-mcc:0.000000	test-mcc:0.484540 
[51]	train-mcc:0.000000	test-mcc:0.483736 
[52]	train-mcc:0.000000	test-mcc:0.484004 
[53]	train-mcc:0.000000	test-mcc:0.485149 
[54]	train-mcc:0.000000	test-mcc:0.484540 
[55]	train-mcc:0.000000	test-mcc:0.483615 
[56]	train-mcc:0.000000	test-mcc:0.483235 
[57]	train-mcc:0.000000	test-mcc:0.483177 
[58]	train-mcc:0.000000	test-mcc:0.483905 
[59]	train-mcc:0.000000	test-mcc:0.484321 
[60]	train-mcc:0.000000	test-mcc:0.486271 
[61]	train-mcc:0.000000	test-mcc:0.486271 
[62]	train-mcc:0.000000	test-mcc:0.486271 
[63]	train-mcc:0.000000	test-mcc:0.486690 
Stopping. Best iteration:
[33]	train-mcc:0.000000	test-mcc:0.487246


Time: Thu Nov 10 2016 10:45:00 AM
For 0033 rounds: train_mcc: 0 - test_mcc: 0.4872459
Confusion matrix:
     truth
preds      0      1
    0 235223    935
    1    150    441
     truth
preds            0            1
    0 0.9935543550 0.0039493303
    1 0.0006335824 0.0018627323
Iteration 34 (base=0.1145142): MCC=0.4872459 | threshold=0.3733978



Iteration 34[3] on Thu Nov 10 2016 10:45:01 AM

depth=5, min_child_weight=35.79293, subsample=0.8824638, colsample_bytree=0.5, base_score=0.1145142
[1]	train-mcc:0.000000	test-mcc:0.479035 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485431 
[3]	train-mcc:0.000000	test-mcc:0.487605 
[4]	train-mcc:0.000000	test-mcc:0.488323 
[5]	train-mcc:0.000000	test-mcc:0.489746 
[6]	train-mcc:0.000000	test-mcc:0.492140 
[7]	train-mcc:0.000000	test-mcc:0.493493 
[8]	train-mcc:0.000000	test-mcc:0.492769 
[9]	train-mcc:0.000000	test-mcc:0.493246 
[10]	train-mcc:0.000000	test-mcc:0.493739 
[11]	train-mcc:0.000000	test-mcc:0.493739 
[12]	train-mcc:0.000000	test-mcc:0.494659 
[13]	train-mcc:0.000000	test-mcc:0.495588 
[14]	train-mcc:0.000000	test-mcc:0.493719 
[15]	train-mcc:0.000000	test-mcc:0.495113 
[16]	train-mcc:0.000000	test-mcc:0.495814 
[17]	train-mcc:0.000000	test-mcc:0.495116 
[18]	train-mcc:0.000000	test-mcc:0.495348 
[19]	train-mcc:0.000000	test-mcc:0.494879 
[20]	train-mcc:0.000000	test-mcc:0.494646 
[21]	train-mcc:0.000000	test-mcc:0.495348 
[22]	train-mcc:0.000000	test-mcc:0.494883 
[23]	train-mcc:0.000000	test-mcc:0.495588 
[24]	train-mcc:0.000000	test-mcc:0.495588 
[25]	train-mcc:0.000000	test-mcc:0.496108 
[26]	train-mcc:0.000000	test-mcc:0.496319 
[27]	train-mcc:0.000000	test-mcc:0.495656 
[28]	train-mcc:0.000000	test-mcc:0.495622 
[29]	train-mcc:0.000000	test-mcc:0.495503 
[30]	train-mcc:0.000000	test-mcc:0.494411 
[31]	train-mcc:0.000000	test-mcc:0.494411 
[32]	train-mcc:0.000000	test-mcc:0.495113 
[33]	train-mcc:0.000000	test-mcc:0.495818 
[34]	train-mcc:0.000000	test-mcc:0.495818 
[35]	train-mcc:0.000000	test-mcc:0.495818 
[36]	train-mcc:0.000000	test-mcc:0.496283 
[37]	train-mcc:0.000000	test-mcc:0.496283 
[38]	train-mcc:0.000000	test-mcc:0.497219 
[39]	train-mcc:0.000000	test-mcc:0.496281 
[40]	train-mcc:0.000000	test-mcc:0.496748 
[41]	train-mcc:0.000000	test-mcc:0.497219 
[42]	train-mcc:0.000000	test-mcc:0.497219 
[43]	train-mcc:0.000000	test-mcc:0.495818 
[44]	train-mcc:0.000000	test-mcc:0.495588 
[45]	train-mcc:0.000000	test-mcc:0.495818 
[46]	train-mcc:0.000000	test-mcc:0.495348 
[47]	train-mcc:0.000000	test-mcc:0.495116 
[48]	train-mcc:0.000000	test-mcc:0.494487 
[49]	train-mcc:0.000000	test-mcc:0.496787 
[50]	train-mcc:0.000000	test-mcc:0.495580 
[51]	train-mcc:0.000000	test-mcc:0.495580 
[52]	train-mcc:0.000000	test-mcc:0.496982 
[53]	train-mcc:0.000000	test-mcc:0.497446 
[54]	train-mcc:0.000000	test-mcc:0.496519 
[55]	train-mcc:0.000000	test-mcc:0.497232 
[56]	train-mcc:0.000000	test-mcc:0.497691 
[57]	train-mcc:0.000000	test-mcc:0.497454 
[58]	train-mcc:0.000000	test-mcc:0.497454 
[59]	train-mcc:0.000000	test-mcc:0.496756 
[60]	train-mcc:0.000000	test-mcc:0.496756 
[61]	train-mcc:0.000000	test-mcc:0.496296 
[62]	train-mcc:0.000000	test-mcc:0.496283 
[63]	train-mcc:0.000000	test-mcc:0.496283 
[64]	train-mcc:0.000000	test-mcc:0.496535 
[65]	train-mcc:0.000000	test-mcc:0.496930 
[66]	train-mcc:0.000000	test-mcc:0.496224 
[67]	train-mcc:0.000000	test-mcc:0.495378 
[68]	train-mcc:0.000000	test-mcc:0.495378 
[69]	train-mcc:0.000000	test-mcc:0.494170 
[70]	train-mcc:0.000000	test-mcc:0.493861 
[71]	train-mcc:0.000000	test-mcc:0.493861 
[72]	train-mcc:0.000000	test-mcc:0.493415 
[73]	train-mcc:0.000000	test-mcc:0.492717 
[74]	train-mcc:0.000000	test-mcc:0.493611 
[75]	train-mcc:0.000000	test-mcc:0.493611 
[76]	train-mcc:0.000000	test-mcc:0.493611 
[77]	train-mcc:0.000000	test-mcc:0.492928 
[78]	train-mcc:0.000000	test-mcc:0.493294 
[79]	train-mcc:0.000000	test-mcc:0.493294 
[80]	train-mcc:0.000000	test-mcc:0.492855 
[81]	train-mcc:0.000000	test-mcc:0.492766 
[82]	train-mcc:0.000000	test-mcc:0.492864 
[83]	train-mcc:0.000000	test-mcc:0.492969 
[84]	train-mcc:0.000000	test-mcc:0.493083 
[85]	train-mcc:0.000000	test-mcc:0.492702 
[86]	train-mcc:0.000000	test-mcc:0.492702 
Stopping. Best iteration:
[56]	train-mcc:0.000000	test-mcc:0.497691


Time: Thu Nov 10 2016 10:46:53 AM
For 0056 rounds: train_mcc: 0 - test_mcc: 0.4976906
Confusion matrix:
     truth
preds      0      1
    0 235259    942
    1    115    434
     truth
preds            0            1
    0 0.9937022175 0.0039788807
    1 0.0004857445 0.0018331573
Iteration 34 (base=0.1145142): MCC=0.4976906 | threshold=0.389106



Iteration 34[4] on Thu Nov 10 2016 10:46:55 AM

depth=5, min_child_weight=35.79293, subsample=0.8824638, colsample_bytree=0.5, base_score=0.1145142
[1]	train-mcc:0.000000	test-mcc:0.480825 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.483533 
[3]	train-mcc:0.000000	test-mcc:0.480834 
[4]	train-mcc:0.000000	test-mcc:0.482174 
[5]	train-mcc:0.000000	test-mcc:0.483732 
[6]	train-mcc:0.000000	test-mcc:0.483194 
[7]	train-mcc:0.000000	test-mcc:0.481611 
[8]	train-mcc:0.000000	test-mcc:0.482974 
[9]	train-mcc:0.000000	test-mcc:0.483316 
[10]	train-mcc:0.000000	test-mcc:0.484263 
[11]	train-mcc:0.000000	test-mcc:0.484812 
[12]	train-mcc:0.000000	test-mcc:0.484940 
[13]	train-mcc:0.000000	test-mcc:0.484940 
[14]	train-mcc:0.000000	test-mcc:0.484456 
[15]	train-mcc:0.000000	test-mcc:0.484535 
[16]	train-mcc:0.000000	test-mcc:0.483142 
[17]	train-mcc:0.000000	test-mcc:0.483142 
[18]	train-mcc:0.000000	test-mcc:0.484176 
[19]	train-mcc:0.000000	test-mcc:0.484176 
[20]	train-mcc:0.000000	test-mcc:0.484176 
[21]	train-mcc:0.000000	test-mcc:0.482749 
[22]	train-mcc:0.000000	test-mcc:0.482749 
[23]	train-mcc:0.000000	test-mcc:0.482749 
[24]	train-mcc:0.000000	test-mcc:0.480511 
[25]	train-mcc:0.000000	test-mcc:0.480996 
[26]	train-mcc:0.000000	test-mcc:0.481794 
[27]	train-mcc:0.000000	test-mcc:0.482084 
[28]	train-mcc:0.000000	test-mcc:0.481500 
[29]	train-mcc:0.000000	test-mcc:0.480802 
[30]	train-mcc:0.000000	test-mcc:0.481206 
[31]	train-mcc:0.000000	test-mcc:0.481188 
[32]	train-mcc:0.000000	test-mcc:0.481188 
[33]	train-mcc:0.000000	test-mcc:0.480802 
[34]	train-mcc:0.000000	test-mcc:0.481726 
[35]	train-mcc:0.000000	test-mcc:0.481726 
[36]	train-mcc:0.000000	test-mcc:0.481726 
[37]	train-mcc:0.000000	test-mcc:0.481555 
[38]	train-mcc:0.000000	test-mcc:0.480670 
[39]	train-mcc:0.000000	test-mcc:0.481963 
[40]	train-mcc:0.000000	test-mcc:0.481585 
[41]	train-mcc:0.000000	test-mcc:0.479699 
[42]	train-mcc:0.000000	test-mcc:0.479404 
Stopping. Best iteration:
[12]	train-mcc:0.000000	test-mcc:0.484940


Time: Thu Nov 10 2016 10:47:44 AM
For 0012 rounds: train_mcc: 0 - test_mcc: 0.48494
Confusion matrix:
     truth
preds      0      1
    0 235165    905
    1    209    471
     truth
preds            0            1
    0 0.9933051742 0.0038225977
    1 0.0008827878 0.0019894403
Iteration 34 (base=0.1145142): MCC=0.48494 | threshold=0.2753711



Iteration 34[5] on Thu Nov 10 2016 10:47:45 AM

depth=5, min_child_weight=35.79293, subsample=0.8824638, colsample_bytree=0.5, base_score=0.1145142
[1]	train-mcc:0.000000	test-mcc:0.484806 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485740 
[3]	train-mcc:0.000000	test-mcc:0.488083 
[4]	train-mcc:0.000000	test-mcc:0.488211 
[5]	train-mcc:0.000000	test-mcc:0.489764 
[6]	train-mcc:0.000000	test-mcc:0.487604 
[7]	train-mcc:0.000000	test-mcc:0.489009 
[8]	train-mcc:0.000000	test-mcc:0.491406 
[9]	train-mcc:0.000000	test-mcc:0.493204 
[10]	train-mcc:0.000000	test-mcc:0.494776 
[11]	train-mcc:0.000000	test-mcc:0.494042 
[12]	train-mcc:0.000000	test-mcc:0.494042 
[13]	train-mcc:0.000000	test-mcc:0.493204 
[14]	train-mcc:0.000000	test-mcc:0.493204 
[15]	train-mcc:0.000000	test-mcc:0.492769 
[16]	train-mcc:0.000000	test-mcc:0.492782 
[17]	train-mcc:0.000000	test-mcc:0.492094 
[18]	train-mcc:0.000000	test-mcc:0.492855 
[19]	train-mcc:0.000000	test-mcc:0.491406 
[20]	train-mcc:0.000000	test-mcc:0.491633 
[21]	train-mcc:0.000000	test-mcc:0.491683 
[22]	train-mcc:0.000000	test-mcc:0.491683 
[23]	train-mcc:0.000000	test-mcc:0.491818 
[24]	train-mcc:0.000000	test-mcc:0.490716 
[25]	train-mcc:0.000000	test-mcc:0.491406 
[26]	train-mcc:0.000000	test-mcc:0.492538 
[27]	train-mcc:0.000000	test-mcc:0.491274 
[28]	train-mcc:0.000000	test-mcc:0.489715 
[29]	train-mcc:0.000000	test-mcc:0.489715 
[30]	train-mcc:0.000000	test-mcc:0.489715 
[31]	train-mcc:0.000000	test-mcc:0.490182 
[32]	train-mcc:0.000000	test-mcc:0.490414 
[33]	train-mcc:0.000000	test-mcc:0.491358 
[34]	train-mcc:0.000000	test-mcc:0.491358 
[35]	train-mcc:0.000000	test-mcc:0.491358 
[36]	train-mcc:0.000000	test-mcc:0.489956 
[37]	train-mcc:0.000000	test-mcc:0.488154 
[38]	train-mcc:0.000000	test-mcc:0.489153 
[39]	train-mcc:0.000000	test-mcc:0.488703 
[40]	train-mcc:0.000000	test-mcc:0.489199 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.494776


Time: Thu Nov 10 2016 10:48:37 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4947759
Confusion matrix:
     truth
preds      0      1
    0 235232    929
    1    142    447
     truth
preds            0            1
    0 0.9935881732 0.0039239704
    1 0.0005997888 0.0018880676
Iteration 34 (base=0.1145142): MCC=0.4947759 | threshold=0.3155369


===




Iteration 35[1] on Thu Nov 10 2016 10:49:21 AM

depth=12, min_child_weight=17.35189, subsample=0.5, colsample_bytree=0.9462055, base_score=0.4598407
[1]	train-mcc:0.000000	test-mcc:0.460146 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.462427 
[3]	train-mcc:0.000000	test-mcc:0.470770 
[4]	train-mcc:0.000000	test-mcc:0.468445 
[5]	train-mcc:0.000000	test-mcc:0.472371 
[6]	train-mcc:0.000000	test-mcc:0.475756 
[7]	train-mcc:0.000000	test-mcc:0.471846 
[8]	train-mcc:0.000000	test-mcc:0.474277 
[9]	train-mcc:0.000000	test-mcc:0.471867 
[10]	train-mcc:0.000000	test-mcc:0.476062 
[11]	train-mcc:0.000000	test-mcc:0.477054 
[12]	train-mcc:0.000000	test-mcc:0.473341 
[13]	train-mcc:0.000000	test-mcc:0.475853 
[14]	train-mcc:0.000000	test-mcc:0.474262 
[15]	train-mcc:0.000000	test-mcc:0.475745 
[16]	train-mcc:0.000000	test-mcc:0.473795 
[17]	train-mcc:0.000000	test-mcc:0.474202 
[18]	train-mcc:0.000000	test-mcc:0.473636 
[19]	train-mcc:0.000000	test-mcc:0.473170 
[20]	train-mcc:0.000000	test-mcc:0.473663 
[21]	train-mcc:0.000000	test-mcc:0.472381 
[22]	train-mcc:0.000000	test-mcc:0.471766 
[23]	train-mcc:0.000000	test-mcc:0.472933 
[24]	train-mcc:0.000000	test-mcc:0.474223 
[25]	train-mcc:0.000000	test-mcc:0.473341 
[26]	train-mcc:0.000000	test-mcc:0.473681 
[27]	train-mcc:0.000000	test-mcc:0.472146 
[28]	train-mcc:0.000000	test-mcc:0.471329 
[29]	train-mcc:0.000000	test-mcc:0.471731 
[30]	train-mcc:0.000000	test-mcc:0.473064 
[31]	train-mcc:0.000000	test-mcc:0.471581 
[32]	train-mcc:0.000000	test-mcc:0.471951 
[33]	train-mcc:0.000000	test-mcc:0.472851 
[34]	train-mcc:0.000000	test-mcc:0.470807 
[35]	train-mcc:0.000000	test-mcc:0.472970 
[36]	train-mcc:0.000000	test-mcc:0.471735 
[37]	train-mcc:0.000000	test-mcc:0.470502 
[38]	train-mcc:0.000000	test-mcc:0.473016 
[39]	train-mcc:0.000000	test-mcc:0.472970 
[40]	train-mcc:0.000000	test-mcc:0.469698 
[41]	train-mcc:0.000000	test-mcc:0.470595 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.477054


Time: Thu Nov 10 2016 10:52:31 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4770543
Confusion matrix:
     truth
preds      0      1
    0 235300    999
    1     73    376
     truth
preds            0            1
    0 0.9938837920 0.0042196766
    1 0.0003083447 0.0015881866
Iteration 35 (base=0.4598407): MCC=0.4770543 | threshold=0.5460247



Iteration 35[2] on Thu Nov 10 2016 10:52:33 AM

depth=12, min_child_weight=17.35189, subsample=0.5, colsample_bytree=0.9462055, base_score=0.4598407
[1]	train-mcc:0.000000	test-mcc:0.469738 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476799 
[3]	train-mcc:0.000000	test-mcc:0.480436 
[4]	train-mcc:0.000000	test-mcc:0.481895 
[5]	train-mcc:0.000000	test-mcc:0.483811 
[6]	train-mcc:0.000000	test-mcc:0.482721 
[7]	train-mcc:0.000000	test-mcc:0.480694 
[8]	train-mcc:0.000000	test-mcc:0.479546 
[9]	train-mcc:0.000000	test-mcc:0.480461 
[10]	train-mcc:0.000000	test-mcc:0.481468 
[11]	train-mcc:0.000000	test-mcc:0.480817 
[12]	train-mcc:0.000000	test-mcc:0.483080 
[13]	train-mcc:0.000000	test-mcc:0.483038 
[14]	train-mcc:0.000000	test-mcc:0.484698 
[15]	train-mcc:0.000000	test-mcc:0.487311 
[16]	train-mcc:0.000000	test-mcc:0.486087 
[17]	train-mcc:0.000000	test-mcc:0.482722 
[18]	train-mcc:0.000000	test-mcc:0.485646 
[19]	train-mcc:0.000000	test-mcc:0.483140 
[20]	train-mcc:0.000000	test-mcc:0.482463 
[21]	train-mcc:0.000000	test-mcc:0.482592 
[22]	train-mcc:0.000000	test-mcc:0.485944 
[23]	train-mcc:0.000000	test-mcc:0.484519 
[24]	train-mcc:0.000000	test-mcc:0.483563 
[25]	train-mcc:0.000000	test-mcc:0.482859 
[26]	train-mcc:0.000000	test-mcc:0.481085 
[27]	train-mcc:0.000000	test-mcc:0.480254 
[28]	train-mcc:0.000000	test-mcc:0.480362 
[29]	train-mcc:0.000000	test-mcc:0.481372 
[30]	train-mcc:0.000000	test-mcc:0.482201 
[31]	train-mcc:0.000000	test-mcc:0.480836 
[32]	train-mcc:0.000000	test-mcc:0.479084 
[33]	train-mcc:0.000000	test-mcc:0.481360 
[34]	train-mcc:0.000000	test-mcc:0.480897 
[35]	train-mcc:0.000000	test-mcc:0.481649 
[36]	train-mcc:0.000000	test-mcc:0.483065 
[37]	train-mcc:0.000000	test-mcc:0.483283 
[38]	train-mcc:0.000000	test-mcc:0.481842 
[39]	train-mcc:0.000000	test-mcc:0.482373 
[40]	train-mcc:0.000000	test-mcc:0.481649 
[41]	train-mcc:0.000000	test-mcc:0.482373 
[42]	train-mcc:0.000000	test-mcc:0.477992 
[43]	train-mcc:0.000000	test-mcc:0.476874 
[44]	train-mcc:0.000000	test-mcc:0.475940 
[45]	train-mcc:0.000000	test-mcc:0.477048 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.487311


Time: Thu Nov 10 2016 10:55:33 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4873112
Confusion matrix:
     truth
preds      0      1
    0 235285    975
    1     88    401
     truth
preds            0            1
    0 0.9938162358 0.0041182856
    1 0.0003717017 0.0016937770
Iteration 35 (base=0.4598407): MCC=0.4873112 | threshold=0.4547597



Iteration 35[3] on Thu Nov 10 2016 10:55:34 AM

depth=12, min_child_weight=17.35189, subsample=0.5, colsample_bytree=0.9462055, base_score=0.4598407
[1]	train-mcc:0.000000	test-mcc:0.484334 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.490184 
[3]	train-mcc:0.000000	test-mcc:0.489179 
[4]	train-mcc:0.000000	test-mcc:0.489549 
[5]	train-mcc:0.000000	test-mcc:0.490944 
[6]	train-mcc:0.000000	test-mcc:0.491133 
[7]	train-mcc:0.000000	test-mcc:0.492766 
[8]	train-mcc:0.000000	test-mcc:0.490307 
[9]	train-mcc:0.000000	test-mcc:0.494369 
[10]	train-mcc:0.000000	test-mcc:0.490317 
[11]	train-mcc:0.000000	test-mcc:0.494156 
[12]	train-mcc:0.000000	test-mcc:0.491442 
[13]	train-mcc:0.000000	test-mcc:0.494248 
[14]	train-mcc:0.000000	test-mcc:0.496561 
[15]	train-mcc:0.000000	test-mcc:0.498649 
[16]	train-mcc:0.000000	test-mcc:0.494508 
[17]	train-mcc:0.000000	test-mcc:0.493294 
[18]	train-mcc:0.000000	test-mcc:0.495622 
[19]	train-mcc:0.000000	test-mcc:0.494363 
[20]	train-mcc:0.000000	test-mcc:0.496835 
[21]	train-mcc:0.000000	test-mcc:0.495537 
[22]	train-mcc:0.000000	test-mcc:0.492702 
[23]	train-mcc:0.000000	test-mcc:0.491683 
[24]	train-mcc:0.000000	test-mcc:0.492271 
[25]	train-mcc:0.000000	test-mcc:0.492717 
[26]	train-mcc:0.000000	test-mcc:0.490715 
[27]	train-mcc:0.000000	test-mcc:0.490782 
[28]	train-mcc:0.000000	test-mcc:0.489075 
[29]	train-mcc:0.000000	test-mcc:0.489926 
[30]	train-mcc:0.000000	test-mcc:0.492009 
[31]	train-mcc:0.000000	test-mcc:0.490587 
[32]	train-mcc:0.000000	test-mcc:0.491008 
[33]	train-mcc:0.000000	test-mcc:0.493083 
[34]	train-mcc:0.000000	test-mcc:0.491573 
[35]	train-mcc:0.000000	test-mcc:0.491113 
[36]	train-mcc:0.000000	test-mcc:0.490056 
[37]	train-mcc:0.000000	test-mcc:0.492152 
[38]	train-mcc:0.000000	test-mcc:0.489956 
[39]	train-mcc:0.000000	test-mcc:0.488596 
[40]	train-mcc:0.000000	test-mcc:0.488449 
[41]	train-mcc:0.000000	test-mcc:0.488449 
[42]	train-mcc:0.000000	test-mcc:0.490212 
[43]	train-mcc:0.000000	test-mcc:0.489295 
[44]	train-mcc:0.000000	test-mcc:0.489893 
[45]	train-mcc:0.000000	test-mcc:0.488504 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.498649


Time: Thu Nov 10 2016 10:58:59 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4986492
Confusion matrix:
     truth
preds      0      1
    0 235241    929
    1    133    447
     truth
preds           0           1
    0 0.993626188 0.003923970
    1 0.000561774 0.001888068
Iteration 35 (base=0.4598407): MCC=0.4986492 | threshold=0.3807233



Iteration 35[4] on Thu Nov 10 2016 10:59:01 AM

depth=12, min_child_weight=17.35189, subsample=0.5, colsample_bytree=0.9462055, base_score=0.4598407
[1]	train-mcc:0.000000	test-mcc:0.478631 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482006 
[3]	train-mcc:0.000000	test-mcc:0.477710 
[4]	train-mcc:0.000000	test-mcc:0.482589 
[5]	train-mcc:0.000000	test-mcc:0.484091 
[6]	train-mcc:0.000000	test-mcc:0.484249 
[7]	train-mcc:0.000000	test-mcc:0.485728 
[8]	train-mcc:0.000000	test-mcc:0.482651 
[9]	train-mcc:0.000000	test-mcc:0.480811 
[10]	train-mcc:0.000000	test-mcc:0.480474 
[11]	train-mcc:0.000000	test-mcc:0.482375 
[12]	train-mcc:0.000000	test-mcc:0.481191 
[13]	train-mcc:0.000000	test-mcc:0.482006 
[14]	train-mcc:0.000000	test-mcc:0.483203 
[15]	train-mcc:0.000000	test-mcc:0.480327 
[16]	train-mcc:0.000000	test-mcc:0.481880 
[17]	train-mcc:0.000000	test-mcc:0.477644 
[18]	train-mcc:0.000000	test-mcc:0.479468 
[19]	train-mcc:0.000000	test-mcc:0.477706 
[20]	train-mcc:0.000000	test-mcc:0.478331 
[21]	train-mcc:0.000000	test-mcc:0.479988 
[22]	train-mcc:0.000000	test-mcc:0.479445 
[23]	train-mcc:0.000000	test-mcc:0.478500 
[24]	train-mcc:0.000000	test-mcc:0.479781 
[25]	train-mcc:0.000000	test-mcc:0.480727 
[26]	train-mcc:0.000000	test-mcc:0.483017 
[27]	train-mcc:0.000000	test-mcc:0.480872 
[28]	train-mcc:0.000000	test-mcc:0.481297 
[29]	train-mcc:0.000000	test-mcc:0.481191 
[30]	train-mcc:0.000000	test-mcc:0.481787 
[31]	train-mcc:0.000000	test-mcc:0.481191 
[32]	train-mcc:0.000000	test-mcc:0.480318 
[33]	train-mcc:0.000000	test-mcc:0.478854 
[34]	train-mcc:0.000000	test-mcc:0.481342 
[35]	train-mcc:0.000000	test-mcc:0.480985 
[36]	train-mcc:0.000000	test-mcc:0.479108 
[37]	train-mcc:0.000000	test-mcc:0.478828 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.485728


Time: Thu Nov 10 2016 11:01:30 AM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4857279
Confusion matrix:
     truth
preds      0      1
    0 235259    959
    1    115    417
     truth
preds            0            1
    0 0.9937022175 0.0040506864
    1 0.0004857445 0.0017613516
Iteration 35 (base=0.4598407): MCC=0.4857279 | threshold=0.4180795



Iteration 35[5] on Thu Nov 10 2016 11:01:31 AM

depth=12, min_child_weight=17.35189, subsample=0.5, colsample_bytree=0.9462055, base_score=0.4598407
[1]	train-mcc:0.000000	test-mcc:0.482070 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.473883 
[3]	train-mcc:0.000000	test-mcc:0.477011 
[4]	train-mcc:0.000000	test-mcc:0.483121 
[5]	train-mcc:0.000000	test-mcc:0.484737 
[6]	train-mcc:0.000000	test-mcc:0.487821 
[7]	train-mcc:0.000000	test-mcc:0.487706 
[8]	train-mcc:0.000000	test-mcc:0.487065 
[9]	train-mcc:0.000000	test-mcc:0.487525 
[10]	train-mcc:0.000000	test-mcc:0.490954 
[11]	train-mcc:0.000000	test-mcc:0.491303 
[12]	train-mcc:0.000000	test-mcc:0.488231 
[13]	train-mcc:0.000000	test-mcc:0.486011 
[14]	train-mcc:0.000000	test-mcc:0.486434 
[15]	train-mcc:0.000000	test-mcc:0.486434 
[16]	train-mcc:0.000000	test-mcc:0.485944 
[17]	train-mcc:0.000000	test-mcc:0.485698 
[18]	train-mcc:0.000000	test-mcc:0.485769 
[19]	train-mcc:0.000000	test-mcc:0.487376 
[20]	train-mcc:0.000000	test-mcc:0.484737 
[21]	train-mcc:0.000000	test-mcc:0.483766 
[22]	train-mcc:0.000000	test-mcc:0.483532 
[23]	train-mcc:0.000000	test-mcc:0.481600 
[24]	train-mcc:0.000000	test-mcc:0.479468 
[25]	train-mcc:0.000000	test-mcc:0.480157 
[26]	train-mcc:0.000000	test-mcc:0.481297 
[27]	train-mcc:0.000000	test-mcc:0.484457 
[28]	train-mcc:0.000000	test-mcc:0.485934 
[29]	train-mcc:0.000000	test-mcc:0.486280 
[30]	train-mcc:0.000000	test-mcc:0.485849 
[31]	train-mcc:0.000000	test-mcc:0.480956 
[32]	train-mcc:0.000000	test-mcc:0.481466 
[33]	train-mcc:0.000000	test-mcc:0.480689 
[34]	train-mcc:0.000000	test-mcc:0.481466 
[35]	train-mcc:0.000000	test-mcc:0.481322 
[36]	train-mcc:0.000000	test-mcc:0.479431 
[37]	train-mcc:0.000000	test-mcc:0.479532 
[38]	train-mcc:0.000000	test-mcc:0.479701 
[39]	train-mcc:0.000000	test-mcc:0.478400 
[40]	train-mcc:0.000000	test-mcc:0.479197 
[41]	train-mcc:0.000000	test-mcc:0.479795 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.491303


Time: Thu Nov 10 2016 11:04:23 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4913029
Confusion matrix:
     truth
preds      0      1
    0 235212    922
    1    162    454
     truth
preds            0            1
    0 0.9935036959 0.0038944034
    1 0.0006842661 0.0019176346
Iteration 35 (base=0.4598407): MCC=0.4913029 | threshold=0.3314303


===




Iteration 36[1] on Thu Nov 10 2016 11:05:07 AM

depth=12, min_child_weight=50, subsample=0.8648251, colsample_bytree=0.5082582, base_score=0.3443303
[1]	train-mcc:0.000000	test-mcc:0.469477 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.477835 
[3]	train-mcc:0.000000	test-mcc:0.480773 
[4]	train-mcc:0.000000	test-mcc:0.481517 
[5]	train-mcc:0.000000	test-mcc:0.483932 
[6]	train-mcc:0.000000	test-mcc:0.482294 
[7]	train-mcc:0.000000	test-mcc:0.481599 
[8]	train-mcc:0.000000	test-mcc:0.484199 
[9]	train-mcc:0.000000	test-mcc:0.480868 
[10]	train-mcc:0.000000	test-mcc:0.483255 
[11]	train-mcc:0.000000	test-mcc:0.481599 
[12]	train-mcc:0.000000	test-mcc:0.481278 
[13]	train-mcc:0.000000	test-mcc:0.483438 
[14]	train-mcc:0.000000	test-mcc:0.483139 
[15]	train-mcc:0.000000	test-mcc:0.485267 
[16]	train-mcc:0.000000	test-mcc:0.484354 
[17]	train-mcc:0.000000	test-mcc:0.484548 
[18]	train-mcc:0.000000	test-mcc:0.484172 
[19]	train-mcc:0.000000	test-mcc:0.483856 
[20]	train-mcc:0.000000	test-mcc:0.484199 
[21]	train-mcc:0.000000	test-mcc:0.483463 
[22]	train-mcc:0.000000	test-mcc:0.483856 
[23]	train-mcc:0.000000	test-mcc:0.483869 
[24]	train-mcc:0.000000	test-mcc:0.483631 
[25]	train-mcc:0.000000	test-mcc:0.483631 
[26]	train-mcc:0.000000	test-mcc:0.482885 
[27]	train-mcc:0.000000	test-mcc:0.482150 
[28]	train-mcc:0.000000	test-mcc:0.482800 
[29]	train-mcc:0.000000	test-mcc:0.481674 
[30]	train-mcc:0.000000	test-mcc:0.482550 
[31]	train-mcc:0.000000	test-mcc:0.480887 
[32]	train-mcc:0.000000	test-mcc:0.480492 
[33]	train-mcc:0.000000	test-mcc:0.480974 
[34]	train-mcc:0.000000	test-mcc:0.481599 
[35]	train-mcc:0.000000	test-mcc:0.480503 
[36]	train-mcc:0.000000	test-mcc:0.480503 
[37]	train-mcc:0.000000	test-mcc:0.480503 
[38]	train-mcc:0.000000	test-mcc:0.479666 
[39]	train-mcc:0.000000	test-mcc:0.480243 
[40]	train-mcc:0.000000	test-mcc:0.480827 
[41]	train-mcc:0.000000	test-mcc:0.481129 
[42]	train-mcc:0.000000	test-mcc:0.481342 
[43]	train-mcc:0.000000	test-mcc:0.481754 
[44]	train-mcc:0.000000	test-mcc:0.481754 
[45]	train-mcc:0.000000	test-mcc:0.481648 
Stopping. Best iteration:
[15]	train-mcc:0.000000	test-mcc:0.485267


Time: Thu Nov 10 2016 11:07:12 AM
For 0015 rounds: train_mcc: 0 - test_mcc: 0.4852672
Confusion matrix:
     truth
preds      0      1
    0 235307    993
    1     66    382
     truth
preds            0            1
    0 0.9939133594 0.0041943332
    1 0.0002787774 0.0016135300
Iteration 36 (base=0.3443303): MCC=0.4852672 | threshold=0.5353205



Iteration 36[2] on Thu Nov 10 2016 11:07:14 AM

depth=12, min_child_weight=50, subsample=0.8648251, colsample_bytree=0.5082582, base_score=0.3443303
[1]	train-mcc:0.000000	test-mcc:0.470133 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.476588 
[3]	train-mcc:0.000000	test-mcc:0.478957 
[4]	train-mcc:0.000000	test-mcc:0.479699 
[5]	train-mcc:0.000000	test-mcc:0.480238 
[6]	train-mcc:0.000000	test-mcc:0.481621 
[7]	train-mcc:0.000000	test-mcc:0.482841 
[8]	train-mcc:0.000000	test-mcc:0.483971 
[9]	train-mcc:0.000000	test-mcc:0.484002 
[10]	train-mcc:0.000000	test-mcc:0.485318 
[11]	train-mcc:0.000000	test-mcc:0.487025 
[12]	train-mcc:0.000000	test-mcc:0.484208 
[13]	train-mcc:0.000000	test-mcc:0.482413 
[14]	train-mcc:0.000000	test-mcc:0.484094 
[15]	train-mcc:0.000000	test-mcc:0.485172 
[16]	train-mcc:0.000000	test-mcc:0.484657 
[17]	train-mcc:0.000000	test-mcc:0.486211 
[18]	train-mcc:0.000000	test-mcc:0.484914 
[19]	train-mcc:0.000000	test-mcc:0.486410 
[20]	train-mcc:0.000000	test-mcc:0.486634 
[21]	train-mcc:0.000000	test-mcc:0.485221 
[22]	train-mcc:0.000000	test-mcc:0.484304 
[23]	train-mcc:0.000000	test-mcc:0.485105 
[24]	train-mcc:0.000000	test-mcc:0.486558 
[25]	train-mcc:0.000000	test-mcc:0.486353 
[26]	train-mcc:0.000000	test-mcc:0.485745 
[27]	train-mcc:0.000000	test-mcc:0.485978 
[28]	train-mcc:0.000000	test-mcc:0.485745 
[29]	train-mcc:0.000000	test-mcc:0.484818 
[30]	train-mcc:0.000000	test-mcc:0.486087 
[31]	train-mcc:0.000000	test-mcc:0.486470 
[32]	train-mcc:0.000000	test-mcc:0.485628 
[33]	train-mcc:0.000000	test-mcc:0.485014 
[34]	train-mcc:0.000000	test-mcc:0.485148 
[35]	train-mcc:0.000000	test-mcc:0.485148 
[36]	train-mcc:0.000000	test-mcc:0.484715 
[37]	train-mcc:0.000000	test-mcc:0.485084 
[38]	train-mcc:0.000000	test-mcc:0.486087 
[39]	train-mcc:0.000000	test-mcc:0.485654 
[40]	train-mcc:0.000000	test-mcc:0.485084 
[41]	train-mcc:0.000000	test-mcc:0.486671 
Stopping. Best iteration:
[11]	train-mcc:0.000000	test-mcc:0.487025


Time: Thu Nov 10 2016 11:09:01 AM
For 0011 rounds: train_mcc: 0 - test_mcc: 0.4870253
Confusion matrix:
     truth
preds      0      1
    0 235283    974
    1     90    402
     truth
preds            0            1
    0 0.9938077880 0.0041140617
    1 0.0003801494 0.0016980008
Iteration 36 (base=0.3443303): MCC=0.4870253 | threshold=0.4216512



Iteration 36[3] on Thu Nov 10 2016 11:09:02 AM

depth=12, min_child_weight=50, subsample=0.8648251, colsample_bytree=0.5082582, base_score=0.3443303
[1]	train-mcc:0.000000	test-mcc:0.480316 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.491626 
[3]	train-mcc:0.000000	test-mcc:0.491132 
[4]	train-mcc:0.000000	test-mcc:0.491878 
[5]	train-mcc:0.000000	test-mcc:0.493285 
[6]	train-mcc:0.000000	test-mcc:0.492587 
[7]	train-mcc:0.000000	test-mcc:0.493477 
[8]	train-mcc:0.000000	test-mcc:0.491009 
[9]	train-mcc:0.000000	test-mcc:0.491478 
[10]	train-mcc:0.000000	test-mcc:0.490559 
[11]	train-mcc:0.000000	test-mcc:0.491593 
[12]	train-mcc:0.000000	test-mcc:0.492072 
[13]	train-mcc:0.000000	test-mcc:0.493239 
[14]	train-mcc:0.000000	test-mcc:0.493770 
[15]	train-mcc:0.000000	test-mcc:0.494879 
[16]	train-mcc:0.000000	test-mcc:0.494903 
[17]	train-mcc:0.000000	test-mcc:0.494879 
[18]	train-mcc:0.000000	test-mcc:0.494194 
[19]	train-mcc:0.000000	test-mcc:0.495563 
[20]	train-mcc:0.000000	test-mcc:0.493982 
[21]	train-mcc:0.000000	test-mcc:0.493038 
[22]	train-mcc:0.000000	test-mcc:0.494845 
[23]	train-mcc:0.000000	test-mcc:0.494451 
[24]	train-mcc:0.000000	test-mcc:0.492231 
[25]	train-mcc:0.000000	test-mcc:0.493029 
[26]	train-mcc:0.000000	test-mcc:0.493029 
[27]	train-mcc:0.000000	test-mcc:0.493029 
[28]	train-mcc:0.000000	test-mcc:0.491721 
[29]	train-mcc:0.000000	test-mcc:0.491878 
[30]	train-mcc:0.000000	test-mcc:0.493005 
[31]	train-mcc:0.000000	test-mcc:0.492795 
[32]	train-mcc:0.000000	test-mcc:0.493246 
[33]	train-mcc:0.000000	test-mcc:0.492772 
[34]	train-mcc:0.000000	test-mcc:0.492719 
[35]	train-mcc:0.000000	test-mcc:0.493149 
[36]	train-mcc:0.000000	test-mcc:0.493095 
[37]	train-mcc:0.000000	test-mcc:0.493558 
[38]	train-mcc:0.000000	test-mcc:0.494540 
[39]	train-mcc:0.000000	test-mcc:0.494040 
[40]	train-mcc:0.000000	test-mcc:0.494578 
[41]	train-mcc:0.000000	test-mcc:0.494369 
[42]	train-mcc:0.000000	test-mcc:0.494203 
[43]	train-mcc:0.000000	test-mcc:0.494203 
[44]	train-mcc:0.000000	test-mcc:0.493649 
[45]	train-mcc:0.000000	test-mcc:0.493649 
[46]	train-mcc:0.000000	test-mcc:0.494251 
[47]	train-mcc:0.000000	test-mcc:0.494251 
[48]	train-mcc:0.000000	test-mcc:0.494346 
[49]	train-mcc:0.000000	test-mcc:0.493345 
Stopping. Best iteration:
[19]	train-mcc:0.000000	test-mcc:0.495563


Time: Thu Nov 10 2016 11:11:03 AM
For 0019 rounds: train_mcc: 0 - test_mcc: 0.4955633
Confusion matrix:
     truth
preds      0      1
    0 235245    936
    1    129    440
     truth
preds            0            1
    0 0.9936430834 0.0039535375
    1 0.0005448786 0.0018585005
Iteration 36 (base=0.3443303): MCC=0.4955633 | threshold=0.379931



Iteration 36[4] on Thu Nov 10 2016 11:11:05 AM

depth=12, min_child_weight=50, subsample=0.8648251, colsample_bytree=0.5082582, base_score=0.3443303
[1]	train-mcc:0.000000	test-mcc:0.474784 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478713 
[3]	train-mcc:0.000000	test-mcc:0.476519 
[4]	train-mcc:0.000000	test-mcc:0.477535 
[5]	train-mcc:0.000000	test-mcc:0.479320 
[6]	train-mcc:0.000000	test-mcc:0.476483 
[7]	train-mcc:0.000000	test-mcc:0.477814 
[8]	train-mcc:0.000000	test-mcc:0.479514 
[9]	train-mcc:0.000000	test-mcc:0.480293 
[10]	train-mcc:0.000000	test-mcc:0.478835 
[11]	train-mcc:0.000000	test-mcc:0.479743 
[12]	train-mcc:0.000000	test-mcc:0.478704 
[13]	train-mcc:0.000000	test-mcc:0.479314 
[14]	train-mcc:0.000000	test-mcc:0.482210 
[15]	train-mcc:0.000000	test-mcc:0.481368 
[16]	train-mcc:0.000000	test-mcc:0.480965 
[17]	train-mcc:0.000000	test-mcc:0.482052 
[18]	train-mcc:0.000000	test-mcc:0.481627 
[19]	train-mcc:0.000000	test-mcc:0.481074 
[20]	train-mcc:0.000000	test-mcc:0.484251 
[21]	train-mcc:0.000000	test-mcc:0.482603 
[22]	train-mcc:0.000000	test-mcc:0.481407 
[23]	train-mcc:0.000000	test-mcc:0.481034 
[24]	train-mcc:0.000000	test-mcc:0.482081 
[25]	train-mcc:0.000000	test-mcc:0.480153 
[26]	train-mcc:0.000000	test-mcc:0.482084 
[27]	train-mcc:0.000000	test-mcc:0.480172 
[28]	train-mcc:0.000000	test-mcc:0.480408 
[29]	train-mcc:0.000000	test-mcc:0.479404 
[30]	train-mcc:0.000000	test-mcc:0.478558 
[31]	train-mcc:0.000000	test-mcc:0.480264 
[32]	train-mcc:0.000000	test-mcc:0.480097 
[33]	train-mcc:0.000000	test-mcc:0.479795 
[34]	train-mcc:0.000000	test-mcc:0.478496 
[35]	train-mcc:0.000000	test-mcc:0.478980 
[36]	train-mcc:0.000000	test-mcc:0.479228 
[37]	train-mcc:0.000000	test-mcc:0.479960 
[38]	train-mcc:0.000000	test-mcc:0.479601 
[39]	train-mcc:0.000000	test-mcc:0.479541 
[40]	train-mcc:0.000000	test-mcc:0.480060 
[41]	train-mcc:0.000000	test-mcc:0.480474 
[42]	train-mcc:0.000000	test-mcc:0.479148 
[43]	train-mcc:0.000000	test-mcc:0.478713 
[44]	train-mcc:0.000000	test-mcc:0.478437 
[45]	train-mcc:0.000000	test-mcc:0.478001 
[46]	train-mcc:0.000000	test-mcc:0.478309 
[47]	train-mcc:0.000000	test-mcc:0.479821 
[48]	train-mcc:0.000000	test-mcc:0.479961 
[49]	train-mcc:0.000000	test-mcc:0.479654 
[50]	train-mcc:0.000000	test-mcc:0.479305 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.484251


Time: Thu Nov 10 2016 11:13:22 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.4842512
Confusion matrix:
     truth
preds      0      1
    0 235274    971
    1    100    405
     truth
preds            0            1
    0 0.9937655755 0.0041013728
    1 0.0004223865 0.0017106653
Iteration 36 (base=0.3443303): MCC=0.4842512 | threshold=0.4253139



Iteration 36[5] on Thu Nov 10 2016 11:13:24 AM

depth=12, min_child_weight=50, subsample=0.8648251, colsample_bytree=0.5082582, base_score=0.3443303
[1]	train-mcc:0.000000	test-mcc:0.486725 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486863 
[3]	train-mcc:0.000000	test-mcc:0.487149 
[4]	train-mcc:0.000000	test-mcc:0.485208 
[5]	train-mcc:0.000000	test-mcc:0.486164 
[6]	train-mcc:0.000000	test-mcc:0.485915 
[7]	train-mcc:0.000000	test-mcc:0.489851 
[8]	train-mcc:0.000000	test-mcc:0.491616 
[9]	train-mcc:0.000000	test-mcc:0.490384 
[10]	train-mcc:0.000000	test-mcc:0.489055 
[11]	train-mcc:0.000000	test-mcc:0.488107 
[12]	train-mcc:0.000000	test-mcc:0.490684 
[13]	train-mcc:0.000000	test-mcc:0.492104 
[14]	train-mcc:0.000000	test-mcc:0.490886 
[15]	train-mcc:0.000000	test-mcc:0.489746 
[16]	train-mcc:0.000000	test-mcc:0.489468 
[17]	train-mcc:0.000000	test-mcc:0.490184 
[18]	train-mcc:0.000000	test-mcc:0.490182 
[19]	train-mcc:0.000000	test-mcc:0.490152 
[20]	train-mcc:0.000000	test-mcc:0.488511 
[21]	train-mcc:0.000000	test-mcc:0.490305 
[22]	train-mcc:0.000000	test-mcc:0.489983 
[23]	train-mcc:0.000000	test-mcc:0.492526 
[24]	train-mcc:0.000000	test-mcc:0.491721 
[25]	train-mcc:0.000000	test-mcc:0.490759 
[26]	train-mcc:0.000000	test-mcc:0.489235 
[27]	train-mcc:0.000000	test-mcc:0.491113 
[28]	train-mcc:0.000000	test-mcc:0.489804 
[29]	train-mcc:0.000000	test-mcc:0.490109 
[30]	train-mcc:0.000000	test-mcc:0.489285 
[31]	train-mcc:0.000000	test-mcc:0.490441 
[32]	train-mcc:0.000000	test-mcc:0.490873 
[33]	train-mcc:0.000000	test-mcc:0.490172 
[34]	train-mcc:0.000000	test-mcc:0.489500 
[35]	train-mcc:0.000000	test-mcc:0.489747 
[36]	train-mcc:0.000000	test-mcc:0.490298 
[37]	train-mcc:0.000000	test-mcc:0.489728 
[38]	train-mcc:0.000000	test-mcc:0.490736 
[39]	train-mcc:0.000000	test-mcc:0.486822 
[40]	train-mcc:0.000000	test-mcc:0.488843 
[41]	train-mcc:0.000000	test-mcc:0.490859 
[42]	train-mcc:0.000000	test-mcc:0.487211 
[43]	train-mcc:0.000000	test-mcc:0.488219 
[44]	train-mcc:0.000000	test-mcc:0.488083 
[45]	train-mcc:0.000000	test-mcc:0.486718 
[46]	train-mcc:0.000000	test-mcc:0.486718 
[47]	train-mcc:0.000000	test-mcc:0.487950 
[48]	train-mcc:0.000000	test-mcc:0.488497 
[49]	train-mcc:0.000000	test-mcc:0.490457 
[50]	train-mcc:0.000000	test-mcc:0.488231 
[51]	train-mcc:0.000000	test-mcc:0.487907 
[52]	train-mcc:0.000000	test-mcc:0.486982 
[53]	train-mcc:0.000000	test-mcc:0.486782 
Stopping. Best iteration:
[23]	train-mcc:0.000000	test-mcc:0.492526


Time: Thu Nov 10 2016 11:15:48 AM
For 0023 rounds: train_mcc: 0 - test_mcc: 0.4925262
Confusion matrix:
     truth
preds      0      1
    0 235246    941
    1    128    435
     truth
preds            0            1
    0 0.9936473073 0.0039746568
    1 0.0005406547 0.0018373812
Iteration 36 (base=0.3443303): MCC=0.4925262 | threshold=0.3664055


===




Iteration 37[1] on Thu Nov 10 2016 11:16:27 AM

depth=11, min_child_weight=1, subsample=0.8718053, colsample_bytree=0.6988942, base_score=0.2686164
[1]	train-mcc:0.000000	test-mcc:0.452993 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.465891 
[3]	train-mcc:0.000000	test-mcc:0.465902 
[4]	train-mcc:0.000000	test-mcc:0.471572 
[5]	train-mcc:0.000000	test-mcc:0.468912 
[6]	train-mcc:0.000000	test-mcc:0.472066 
[7]	train-mcc:0.000000	test-mcc:0.472380 
[8]	train-mcc:0.000000	test-mcc:0.472387 
[9]	train-mcc:0.000000	test-mcc:0.474374 
[10]	train-mcc:0.000000	test-mcc:0.478084 
[11]	train-mcc:0.000000	test-mcc:0.476701 
[12]	train-mcc:0.000000	test-mcc:0.476762 
[13]	train-mcc:0.000000	test-mcc:0.475043 
[14]	train-mcc:0.000000	test-mcc:0.478025 
[15]	train-mcc:0.000000	test-mcc:0.478746 
[16]	train-mcc:0.000000	test-mcc:0.481082 
[17]	train-mcc:0.000000	test-mcc:0.479917 
[18]	train-mcc:0.000000	test-mcc:0.480820 
[19]	train-mcc:0.000000	test-mcc:0.480448 
[20]	train-mcc:0.000000	test-mcc:0.479734 
[21]	train-mcc:0.000000	test-mcc:0.478190 
[22]	train-mcc:0.000000	test-mcc:0.478456 
[23]	train-mcc:0.000000	test-mcc:0.478303 
[24]	train-mcc:0.000000	test-mcc:0.479467 
[25]	train-mcc:0.000000	test-mcc:0.479917 
[26]	train-mcc:0.000000	test-mcc:0.479201 
[27]	train-mcc:0.000000	test-mcc:0.480182 
[28]	train-mcc:0.000000	test-mcc:0.481987 
[29]	train-mcc:0.000000	test-mcc:0.482700 
[30]	train-mcc:0.000000	test-mcc:0.482700 
[31]	train-mcc:0.000000	test-mcc:0.482700 
[32]	train-mcc:0.000000	test-mcc:0.483154 
[33]	train-mcc:0.000000	test-mcc:0.483154 
[34]	train-mcc:0.000000	test-mcc:0.482247 
[35]	train-mcc:0.000000	test-mcc:0.481345 
[36]	train-mcc:0.000000	test-mcc:0.481082 
[37]	train-mcc:0.000000	test-mcc:0.481082 
[38]	train-mcc:0.000000	test-mcc:0.480448 
[39]	train-mcc:0.000000	test-mcc:0.480198 
[40]	train-mcc:0.000000	test-mcc:0.479926 
[41]	train-mcc:0.000000	test-mcc:0.480185 
[42]	train-mcc:0.000000	test-mcc:0.480095 
[43]	train-mcc:0.000000	test-mcc:0.480095 
[44]	train-mcc:0.000000	test-mcc:0.480095 
[45]	train-mcc:0.000000	test-mcc:0.479677 
[46]	train-mcc:0.000000	test-mcc:0.479737 
[47]	train-mcc:0.000000	test-mcc:0.479737 
[48]	train-mcc:0.000000	test-mcc:0.480466 
[49]	train-mcc:0.000000	test-mcc:0.480972 
[50]	train-mcc:0.000000	test-mcc:0.482501 
[51]	train-mcc:0.000000	test-mcc:0.482501 
[52]	train-mcc:0.000000	test-mcc:0.481990 
[53]	train-mcc:0.000000	test-mcc:0.481990 
[54]	train-mcc:0.000000	test-mcc:0.482717 
[55]	train-mcc:0.000000	test-mcc:0.482286 
[56]	train-mcc:0.000000	test-mcc:0.482208 
[57]	train-mcc:0.000000	test-mcc:0.482935 
[58]	train-mcc:0.000000	test-mcc:0.480532 
[59]	train-mcc:0.000000	test-mcc:0.479894 
[60]	train-mcc:0.000000	test-mcc:0.479894 
[61]	train-mcc:0.000000	test-mcc:0.478490 
[62]	train-mcc:0.000000	test-mcc:0.478956 
Stopping. Best iteration:
[32]	train-mcc:0.000000	test-mcc:0.483154


Time: Thu Nov 10 2016 11:20:15 AM
For 0032 rounds: train_mcc: 0 - test_mcc: 0.4831544
Confusion matrix:
     truth
preds      0      1
    0 235252    958
    1    121    417
     truth
preds           0           1
    0 0.993681045 0.004046497
    1 0.000511092 0.001761367
Iteration 37 (base=0.2686164): MCC=0.4831544 | threshold=0.4205317



Iteration 37[2] on Thu Nov 10 2016 11:20:16 AM

depth=11, min_child_weight=1, subsample=0.8718053, colsample_bytree=0.6988942, base_score=0.2686164
[1]	train-mcc:0.000000	test-mcc:0.445142 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.452294 
[3]	train-mcc:0.000000	test-mcc:0.454276 
[4]	train-mcc:0.000000	test-mcc:0.461672 
[5]	train-mcc:0.000000	test-mcc:0.466233 
[6]	train-mcc:0.000000	test-mcc:0.465991 
[7]	train-mcc:0.000000	test-mcc:0.468859 
[8]	train-mcc:0.000000	test-mcc:0.471771 
[9]	train-mcc:0.000000	test-mcc:0.475937 
[10]	train-mcc:0.000000	test-mcc:0.480030 
[11]	train-mcc:0.000000	test-mcc:0.478558 
[12]	train-mcc:0.000000	test-mcc:0.477595 
[13]	train-mcc:0.000000	test-mcc:0.478357 
[14]	train-mcc:0.000000	test-mcc:0.476755 
[15]	train-mcc:0.000000	test-mcc:0.475694 
[16]	train-mcc:0.000000	test-mcc:0.474949 
[17]	train-mcc:0.000000	test-mcc:0.476059 
[18]	train-mcc:0.000000	test-mcc:0.476296 
[19]	train-mcc:0.000000	test-mcc:0.475804 
[20]	train-mcc:0.000000	test-mcc:0.475808 
[21]	train-mcc:0.000000	test-mcc:0.475537 
[22]	train-mcc:0.000000	test-mcc:0.475485 
[23]	train-mcc:0.000000	test-mcc:0.474744 
[24]	train-mcc:0.000000	test-mcc:0.475074 
[25]	train-mcc:0.000000	test-mcc:0.476044 
[26]	train-mcc:0.000000	test-mcc:0.475072 
[27]	train-mcc:0.000000	test-mcc:0.476296 
[28]	train-mcc:0.000000	test-mcc:0.475313 
[29]	train-mcc:0.000000	test-mcc:0.474581 
[30]	train-mcc:0.000000	test-mcc:0.474262 
[31]	train-mcc:0.000000	test-mcc:0.474262 
[32]	train-mcc:0.000000	test-mcc:0.473747 
[33]	train-mcc:0.000000	test-mcc:0.474262 
[34]	train-mcc:0.000000	test-mcc:0.474832 
[35]	train-mcc:0.000000	test-mcc:0.474120 
[36]	train-mcc:0.000000	test-mcc:0.474854 
[37]	train-mcc:0.000000	test-mcc:0.475588 
[38]	train-mcc:0.000000	test-mcc:0.474356 
[39]	train-mcc:0.000000	test-mcc:0.474356 
[40]	train-mcc:0.000000	test-mcc:0.474854 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.480030


Time: Thu Nov 10 2016 11:22:36 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4800303
Confusion matrix:
     truth
preds      0      1
    0 235299    995
    1     74    381
     truth
preds            0            1
    0 0.9938753701 0.0042027633
    1 0.0003125673 0.0016092993
Iteration 37 (base=0.2686164): MCC=0.4800303 | threshold=0.4908103



Iteration 37[3] on Thu Nov 10 2016 11:22:37 AM

depth=11, min_child_weight=1, subsample=0.8718053, colsample_bytree=0.6988942, base_score=0.2686164
[1]	train-mcc:0.000000	test-mcc:0.452648 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.458164 
[3]	train-mcc:0.000000	test-mcc:0.466862 
[4]	train-mcc:0.000000	test-mcc:0.468148 
[5]	train-mcc:0.000000	test-mcc:0.469541 
[6]	train-mcc:0.000000	test-mcc:0.468402 
[7]	train-mcc:0.000000	test-mcc:0.470750 
[8]	train-mcc:0.000000	test-mcc:0.476411 
[9]	train-mcc:0.000000	test-mcc:0.480631 
[10]	train-mcc:0.000000	test-mcc:0.479497 
[11]	train-mcc:0.000000	test-mcc:0.478357 
[12]	train-mcc:0.000000	test-mcc:0.481168 
[13]	train-mcc:0.000000	test-mcc:0.480435 
[14]	train-mcc:0.000000	test-mcc:0.481698 
[15]	train-mcc:0.000000	test-mcc:0.482930 
[16]	train-mcc:0.000000	test-mcc:0.486149 
[17]	train-mcc:0.000000	test-mcc:0.486470 
[18]	train-mcc:0.000000	test-mcc:0.485424 
[19]	train-mcc:0.000000	test-mcc:0.486873 
[20]	train-mcc:0.000000	test-mcc:0.487596 
[21]	train-mcc:0.000000	test-mcc:0.486470 
[22]	train-mcc:0.000000	test-mcc:0.485646 
[23]	train-mcc:0.000000	test-mcc:0.486562 
[24]	train-mcc:0.000000	test-mcc:0.486024 
[25]	train-mcc:0.000000	test-mcc:0.486732 
[26]	train-mcc:0.000000	test-mcc:0.486918 
[27]	train-mcc:0.000000	test-mcc:0.487015 
[28]	train-mcc:0.000000	test-mcc:0.486392 
[29]	train-mcc:0.000000	test-mcc:0.486392 
[30]	train-mcc:0.000000	test-mcc:0.485661 
[31]	train-mcc:0.000000	test-mcc:0.485661 
[32]	train-mcc:0.000000	test-mcc:0.485834 
[33]	train-mcc:0.000000	test-mcc:0.484421 
[34]	train-mcc:0.000000	test-mcc:0.486732 
[35]	train-mcc:0.000000	test-mcc:0.486732 
[36]	train-mcc:0.000000	test-mcc:0.486392 
[37]	train-mcc:0.000000	test-mcc:0.486781 
[38]	train-mcc:0.000000	test-mcc:0.485835 
[39]	train-mcc:0.000000	test-mcc:0.485488 
[40]	train-mcc:0.000000	test-mcc:0.485488 
[41]	train-mcc:0.000000	test-mcc:0.486050 
[42]	train-mcc:0.000000	test-mcc:0.486050 
[43]	train-mcc:0.000000	test-mcc:0.486050 
[44]	train-mcc:0.000000	test-mcc:0.486220 
[45]	train-mcc:0.000000	test-mcc:0.486781 
[46]	train-mcc:0.000000	test-mcc:0.486220 
[47]	train-mcc:0.000000	test-mcc:0.486050 
[48]	train-mcc:0.000000	test-mcc:0.486613 
[49]	train-mcc:0.000000	test-mcc:0.485881 
[50]	train-mcc:0.000000	test-mcc:0.487122 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.487596


Time: Thu Nov 10 2016 11:25:28 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.4875959
Confusion matrix:
     truth
preds      0      1
    0 235295    981
    1     79    395
     truth
preds            0            1
    0 0.9938542767 0.0041436114
    1 0.0003336853 0.0016684266
Iteration 37 (base=0.2686164): MCC=0.4875959 | threshold=0.4483426



Iteration 37[4] on Thu Nov 10 2016 11:25:29 AM

depth=11, min_child_weight=1, subsample=0.8718053, colsample_bytree=0.6988942, base_score=0.2686164
[1]	train-mcc:0.000000	test-mcc:0.460550 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.468914 
[3]	train-mcc:0.000000	test-mcc:0.466365 
[4]	train-mcc:0.000000	test-mcc:0.472527 
[5]	train-mcc:0.000000	test-mcc:0.476224 
[6]	train-mcc:0.000000	test-mcc:0.475581 
[7]	train-mcc:0.000000	test-mcc:0.477969 
[8]	train-mcc:0.000000	test-mcc:0.476208 
[9]	train-mcc:0.000000	test-mcc:0.478599 
[10]	train-mcc:0.000000	test-mcc:0.475191 
[11]	train-mcc:0.000000	test-mcc:0.479001 
[12]	train-mcc:0.000000	test-mcc:0.479348 
[13]	train-mcc:0.000000	test-mcc:0.479399 
[14]	train-mcc:0.000000	test-mcc:0.478116 
[15]	train-mcc:0.000000	test-mcc:0.479809 
[16]	train-mcc:0.000000	test-mcc:0.479500 
[17]	train-mcc:0.000000	test-mcc:0.477111 
[18]	train-mcc:0.000000	test-mcc:0.477422 
[19]	train-mcc:0.000000	test-mcc:0.477805 
[20]	train-mcc:0.000000	test-mcc:0.478023 
[21]	train-mcc:0.000000	test-mcc:0.476614 
[22]	train-mcc:0.000000	test-mcc:0.476870 
[23]	train-mcc:0.000000	test-mcc:0.479750 
[24]	train-mcc:0.000000	test-mcc:0.479424 
[25]	train-mcc:0.000000	test-mcc:0.479404 
[26]	train-mcc:0.000000	test-mcc:0.480022 
[27]	train-mcc:0.000000	test-mcc:0.480643 
[28]	train-mcc:0.000000	test-mcc:0.479928 
[29]	train-mcc:0.000000	test-mcc:0.479111 
[30]	train-mcc:0.000000	test-mcc:0.479750 
[31]	train-mcc:0.000000	test-mcc:0.478765 
[32]	train-mcc:0.000000	test-mcc:0.478599 
[33]	train-mcc:0.000000	test-mcc:0.479038 
[34]	train-mcc:0.000000	test-mcc:0.478599 
[35]	train-mcc:0.000000	test-mcc:0.478599 
[36]	train-mcc:0.000000	test-mcc:0.479038 
[37]	train-mcc:0.000000	test-mcc:0.480381 
[38]	train-mcc:0.000000	test-mcc:0.480381 
[39]	train-mcc:0.000000	test-mcc:0.479675 
[40]	train-mcc:0.000000	test-mcc:0.480097 
[41]	train-mcc:0.000000	test-mcc:0.481507 
[42]	train-mcc:0.000000	test-mcc:0.481085 
[43]	train-mcc:0.000000	test-mcc:0.480802 
[44]	train-mcc:0.000000	test-mcc:0.481507 
[45]	train-mcc:0.000000	test-mcc:0.481929 
[46]	train-mcc:0.000000	test-mcc:0.482353 
[47]	train-mcc:0.000000	test-mcc:0.483907 
[48]	train-mcc:0.000000	test-mcc:0.484334 
[49]	train-mcc:0.000000	test-mcc:0.483204 
[50]	train-mcc:0.000000	test-mcc:0.481936 
[51]	train-mcc:0.000000	test-mcc:0.482638 
[52]	train-mcc:0.000000	test-mcc:0.480665 
[53]	train-mcc:0.000000	test-mcc:0.480665 
[54]	train-mcc:0.000000	test-mcc:0.480665 
[55]	train-mcc:0.000000	test-mcc:0.481369 
[56]	train-mcc:0.000000	test-mcc:0.482375 
[57]	train-mcc:0.000000	test-mcc:0.482222 
[58]	train-mcc:0.000000	test-mcc:0.482222 
[59]	train-mcc:0.000000	test-mcc:0.480663 
[60]	train-mcc:0.000000	test-mcc:0.480962 
[61]	train-mcc:0.000000	test-mcc:0.480962 
[62]	train-mcc:0.000000	test-mcc:0.480190 
[63]	train-mcc:0.000000	test-mcc:0.480806 
[64]	train-mcc:0.000000	test-mcc:0.482500 
[65]	train-mcc:0.000000	test-mcc:0.482589 
[66]	train-mcc:0.000000	test-mcc:0.481171 
[67]	train-mcc:0.000000	test-mcc:0.481171 
[68]	train-mcc:0.000000	test-mcc:0.479859 
[69]	train-mcc:0.000000	test-mcc:0.480569 
[70]	train-mcc:0.000000	test-mcc:0.479546 
[71]	train-mcc:0.000000	test-mcc:0.481369 
[72]	train-mcc:0.000000	test-mcc:0.480520 
[73]	train-mcc:0.000000	test-mcc:0.482375 
[74]	train-mcc:0.000000	test-mcc:0.481936 
[75]	train-mcc:0.000000	test-mcc:0.481936 
[76]	train-mcc:0.000000	test-mcc:0.482633 
[77]	train-mcc:0.000000	test-mcc:0.483335 
[78]	train-mcc:0.000000	test-mcc:0.483335 
Stopping. Best iteration:
[48]	train-mcc:0.000000	test-mcc:0.484334


Time: Thu Nov 10 2016 11:29:53 AM
For 0048 rounds: train_mcc: 0 - test_mcc: 0.4843336
Confusion matrix:
     truth
preds      0      1
    0 235232    944
    1    142    432
     truth
preds            0            1
    0 0.9935881732 0.0039873284
    1 0.0005997888 0.0018247096
Iteration 37 (base=0.2686164): MCC=0.4843336 | threshold=0.3666327



Iteration 37[5] on Thu Nov 10 2016 11:29:54 AM

depth=11, min_child_weight=1, subsample=0.8718053, colsample_bytree=0.6988942, base_score=0.2686164
[1]	train-mcc:0.000000	test-mcc:0.466870 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472172 
[3]	train-mcc:0.000000	test-mcc:0.471745 
[4]	train-mcc:0.000000	test-mcc:0.477572 
[5]	train-mcc:0.000000	test-mcc:0.477212 
[6]	train-mcc:0.000000	test-mcc:0.477959 
[7]	train-mcc:0.000000	test-mcc:0.478808 
[8]	train-mcc:0.000000	test-mcc:0.479501 
[9]	train-mcc:0.000000	test-mcc:0.478831 
[10]	train-mcc:0.000000	test-mcc:0.479692 
[11]	train-mcc:0.000000	test-mcc:0.479969 
[12]	train-mcc:0.000000	test-mcc:0.480408 
[13]	train-mcc:0.000000	test-mcc:0.481155 
[14]	train-mcc:0.000000	test-mcc:0.481368 
[15]	train-mcc:0.000000	test-mcc:0.480651 
[16]	train-mcc:0.000000	test-mcc:0.480011 
[17]	train-mcc:0.000000	test-mcc:0.480157 
[18]	train-mcc:0.000000	test-mcc:0.479094 
[19]	train-mcc:0.000000	test-mcc:0.478765 
[20]	train-mcc:0.000000	test-mcc:0.478025 
[21]	train-mcc:0.000000	test-mcc:0.478126 
[22]	train-mcc:0.000000	test-mcc:0.478338 
[23]	train-mcc:0.000000	test-mcc:0.480275 
[24]	train-mcc:0.000000	test-mcc:0.480275 
[25]	train-mcc:0.000000	test-mcc:0.480275 
[26]	train-mcc:0.000000	test-mcc:0.479827 
[27]	train-mcc:0.000000	test-mcc:0.481442 
[28]	train-mcc:0.000000	test-mcc:0.479827 
[29]	train-mcc:0.000000	test-mcc:0.479478 
[30]	train-mcc:0.000000	test-mcc:0.478003 
[31]	train-mcc:0.000000	test-mcc:0.477383 
[32]	train-mcc:0.000000	test-mcc:0.477383 
[33]	train-mcc:0.000000	test-mcc:0.477580 
[34]	train-mcc:0.000000	test-mcc:0.478316 
[35]	train-mcc:0.000000	test-mcc:0.478316 
[36]	train-mcc:0.000000	test-mcc:0.479110 
[37]	train-mcc:0.000000	test-mcc:0.480229 
[38]	train-mcc:0.000000	test-mcc:0.480916 
[39]	train-mcc:0.000000	test-mcc:0.480229 
[40]	train-mcc:0.000000	test-mcc:0.479855 
[41]	train-mcc:0.000000	test-mcc:0.480737 
[42]	train-mcc:0.000000	test-mcc:0.481425 
[43]	train-mcc:0.000000	test-mcc:0.481117 
[44]	train-mcc:0.000000	test-mcc:0.481486 
[45]	train-mcc:0.000000	test-mcc:0.480429 
[46]	train-mcc:0.000000	test-mcc:0.481297 
[47]	train-mcc:0.000000	test-mcc:0.480104 
[48]	train-mcc:0.000000	test-mcc:0.481517 
[49]	train-mcc:0.000000	test-mcc:0.481239 
[50]	train-mcc:0.000000	test-mcc:0.481239 
[51]	train-mcc:0.000000	test-mcc:0.481669 
[52]	train-mcc:0.000000	test-mcc:0.480663 
[53]	train-mcc:0.000000	test-mcc:0.479821 
[54]	train-mcc:0.000000	test-mcc:0.480035 
[55]	train-mcc:0.000000	test-mcc:0.481027 
[56]	train-mcc:0.000000	test-mcc:0.480620 
[57]	train-mcc:0.000000	test-mcc:0.480592 
[58]	train-mcc:0.000000	test-mcc:0.479895 
[59]	train-mcc:0.000000	test-mcc:0.481392 
[60]	train-mcc:0.000000	test-mcc:0.480890 
[61]	train-mcc:0.000000	test-mcc:0.481118 
[62]	train-mcc:0.000000	test-mcc:0.481118 
[63]	train-mcc:0.000000	test-mcc:0.481825 
[64]	train-mcc:0.000000	test-mcc:0.482052 
[65]	train-mcc:0.000000	test-mcc:0.484105 
[66]	train-mcc:0.000000	test-mcc:0.483080 
[67]	train-mcc:0.000000	test-mcc:0.483080 
[68]	train-mcc:0.000000	test-mcc:0.483080 
[69]	train-mcc:0.000000	test-mcc:0.484215 
[70]	train-mcc:0.000000	test-mcc:0.482309 
[71]	train-mcc:0.000000	test-mcc:0.481688 
[72]	train-mcc:0.000000	test-mcc:0.481208 
[73]	train-mcc:0.000000	test-mcc:0.481265 
[74]	train-mcc:0.000000	test-mcc:0.482420 
[75]	train-mcc:0.000000	test-mcc:0.482948 
[76]	train-mcc:0.000000	test-mcc:0.480575 
[77]	train-mcc:0.000000	test-mcc:0.478994 
[78]	train-mcc:0.000000	test-mcc:0.479576 
[79]	train-mcc:0.000000	test-mcc:0.479451 
[80]	train-mcc:0.000000	test-mcc:0.479884 
[81]	train-mcc:0.000000	test-mcc:0.479545 
[82]	train-mcc:0.000000	test-mcc:0.478820 
[83]	train-mcc:0.000000	test-mcc:0.478861 
[84]	train-mcc:0.000000	test-mcc:0.479987 
[85]	train-mcc:0.000000	test-mcc:0.479960 
[86]	train-mcc:0.000000	test-mcc:0.480104 
[87]	train-mcc:0.000000	test-mcc:0.479960 
[88]	train-mcc:0.000000	test-mcc:0.480381 
[89]	train-mcc:0.000000	test-mcc:0.482913 
[90]	train-mcc:0.000000	test-mcc:0.482913 
[91]	train-mcc:0.000000	test-mcc:0.482109 
[92]	train-mcc:0.000000	test-mcc:0.481344 
[93]	train-mcc:0.000000	test-mcc:0.480268 
[94]	train-mcc:0.000000	test-mcc:0.480653 
[95]	train-mcc:0.000000	test-mcc:0.481208 
[96]	train-mcc:0.000000	test-mcc:0.480855 
[97]	train-mcc:0.000000	test-mcc:0.480734 
[98]	train-mcc:0.000000	test-mcc:0.481122 
[99]	train-mcc:0.000000	test-mcc:0.480906 
Stopping. Best iteration:
[69]	train-mcc:0.000000	test-mcc:0.484215


Time: Thu Nov 10 2016 11:35:26 AM
For 0069 rounds: train_mcc: 0 - test_mcc: 0.4842152
Confusion matrix:
     truth
preds      0      1
    0 235235    946
    1    139    430
     truth
preds            0            1
    0 0.9936008448 0.0039957761
    1 0.0005871172 0.0018162619
Iteration 37 (base=0.2686164): MCC=0.4842152 | threshold=0.3871046


===




Iteration 38[1] on Thu Nov 10 2016 11:36:07 AM

depth=6, min_child_weight=1, subsample=0.8801701, colsample_bytree=0.883629, base_score=0.1767844
[1]	train-mcc:0.000000	test-mcc:0.462755 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.472200 
[3]	train-mcc:0.000000	test-mcc:0.472322 
[4]	train-mcc:0.000000	test-mcc:0.474481 
[5]	train-mcc:0.000000	test-mcc:0.475983 
[6]	train-mcc:0.000000	test-mcc:0.479166 
[7]	train-mcc:0.000000	test-mcc:0.476733 
[8]	train-mcc:0.000000	test-mcc:0.476632 
[9]	train-mcc:0.000000	test-mcc:0.478303 
[10]	train-mcc:0.000000	test-mcc:0.477623 
[11]	train-mcc:0.000000	test-mcc:0.475916 
[12]	train-mcc:0.000000	test-mcc:0.476965 
[13]	train-mcc:0.000000	test-mcc:0.476522 
[14]	train-mcc:0.000000	test-mcc:0.476965 
[15]	train-mcc:0.000000	test-mcc:0.476965 
[16]	train-mcc:0.000000	test-mcc:0.477410 
[17]	train-mcc:0.000000	test-mcc:0.478936 
[18]	train-mcc:0.000000	test-mcc:0.478842 
[19]	train-mcc:0.000000	test-mcc:0.477954 
[20]	train-mcc:0.000000	test-mcc:0.478303 
[21]	train-mcc:0.000000	test-mcc:0.478303 
[22]	train-mcc:0.000000	test-mcc:0.478303 
[23]	train-mcc:0.000000	test-mcc:0.477163 
[24]	train-mcc:0.000000	test-mcc:0.477898 
[25]	train-mcc:0.000000	test-mcc:0.478631 
[26]	train-mcc:0.000000	test-mcc:0.478631 
[27]	train-mcc:0.000000	test-mcc:0.478782 
[28]	train-mcc:0.000000	test-mcc:0.478782 
[29]	train-mcc:0.000000	test-mcc:0.478782 
[30]	train-mcc:0.000000	test-mcc:0.476965 
[31]	train-mcc:0.000000	test-mcc:0.476965 
[32]	train-mcc:0.000000	test-mcc:0.476471 
[33]	train-mcc:0.000000	test-mcc:0.474832 
[34]	train-mcc:0.000000	test-mcc:0.474832 
[35]	train-mcc:0.000000	test-mcc:0.474560 
[36]	train-mcc:0.000000	test-mcc:0.473136 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.479166


Time: Thu Nov 10 2016 11:37:37 AM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4791661
Confusion matrix:
     truth
preds      0      1
    0 235235    953
    1    138    422
     truth
preds            0            1
    0 0.9936092385 0.0040253772
    1 0.0005828983 0.0017824860
Iteration 38 (base=0.1767844): MCC=0.4791661 | threshold=0.3539487



Iteration 38[2] on Thu Nov 10 2016 11:37:38 AM

depth=6, min_child_weight=1, subsample=0.8801701, colsample_bytree=0.883629, base_score=0.1767844
[1]	train-mcc:0.000000	test-mcc:0.467814 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471469 
[3]	train-mcc:0.000000	test-mcc:0.472589 
[4]	train-mcc:0.000000	test-mcc:0.478397 
[5]	train-mcc:0.000000	test-mcc:0.483639 
[6]	train-mcc:0.000000	test-mcc:0.485084 
[7]	train-mcc:0.000000	test-mcc:0.483778 
[8]	train-mcc:0.000000	test-mcc:0.487604 
[9]	train-mcc:0.000000	test-mcc:0.489647 
[10]	train-mcc:0.000000	test-mcc:0.488414 
[11]	train-mcc:0.000000	test-mcc:0.487744 
[12]	train-mcc:0.000000	test-mcc:0.487103 
[13]	train-mcc:0.000000	test-mcc:0.488297 
[14]	train-mcc:0.000000	test-mcc:0.488297 
[15]	train-mcc:0.000000	test-mcc:0.488297 
[16]	train-mcc:0.000000	test-mcc:0.487816 
[17]	train-mcc:0.000000	test-mcc:0.488065 
[18]	train-mcc:0.000000	test-mcc:0.487351 
[19]	train-mcc:0.000000	test-mcc:0.487744 
[20]	train-mcc:0.000000	test-mcc:0.487810 
[21]	train-mcc:0.000000	test-mcc:0.485670 
[22]	train-mcc:0.000000	test-mcc:0.486146 
[23]	train-mcc:0.000000	test-mcc:0.486146 
[24]	train-mcc:0.000000	test-mcc:0.486624 
[25]	train-mcc:0.000000	test-mcc:0.486624 
[26]	train-mcc:0.000000	test-mcc:0.486623 
[27]	train-mcc:0.000000	test-mcc:0.485016 
[28]	train-mcc:0.000000	test-mcc:0.485016 
[29]	train-mcc:0.000000	test-mcc:0.485820 
[30]	train-mcc:0.000000	test-mcc:0.486731 
[31]	train-mcc:0.000000	test-mcc:0.487643 
[32]	train-mcc:0.000000	test-mcc:0.487643 
[33]	train-mcc:0.000000	test-mcc:0.487101 
[34]	train-mcc:0.000000	test-mcc:0.488553 
[35]	train-mcc:0.000000	test-mcc:0.488553 
[36]	train-mcc:0.000000	test-mcc:0.488014 
[37]	train-mcc:0.000000	test-mcc:0.487828 
[38]	train-mcc:0.000000	test-mcc:0.488369 
[39]	train-mcc:0.000000	test-mcc:0.488369 
Stopping. Best iteration:
[9]	train-mcc:0.000000	test-mcc:0.489647


Time: Thu Nov 10 2016 11:39:12 AM
For 0009 rounds: train_mcc: 0 - test_mcc: 0.4896472
Confusion matrix:
     truth
preds      0      1
    0 235291    976
    1     82    400
     truth
preds            0            1
    0 0.9938415791 0.0041225095
    1 0.0003463584 0.0016895531
Iteration 38 (base=0.1767844): MCC=0.4896472 | threshold=0.4317486



Iteration 38[3] on Thu Nov 10 2016 11:39:13 AM

depth=6, min_child_weight=1, subsample=0.8801701, colsample_bytree=0.883629, base_score=0.1767844
[1]	train-mcc:0.000000	test-mcc:0.473849 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482490 
[3]	train-mcc:0.000000	test-mcc:0.488579 
[4]	train-mcc:0.000000	test-mcc:0.491422 
[5]	train-mcc:0.000000	test-mcc:0.489560 
[6]	train-mcc:0.000000	test-mcc:0.487097 
[7]	train-mcc:0.000000	test-mcc:0.487744 
[8]	train-mcc:0.000000	test-mcc:0.489268 
[9]	train-mcc:0.000000	test-mcc:0.490588 
[10]	train-mcc:0.000000	test-mcc:0.491203 
[11]	train-mcc:0.000000	test-mcc:0.491203 
[12]	train-mcc:0.000000	test-mcc:0.493037 
[13]	train-mcc:0.000000	test-mcc:0.492678 
[14]	train-mcc:0.000000	test-mcc:0.493373 
[15]	train-mcc:0.000000	test-mcc:0.492781 
[16]	train-mcc:0.000000	test-mcc:0.492277 
[17]	train-mcc:0.000000	test-mcc:0.491643 
[18]	train-mcc:0.000000	test-mcc:0.491203 
[19]	train-mcc:0.000000	test-mcc:0.492580 
[20]	train-mcc:0.000000	test-mcc:0.492242 
[21]	train-mcc:0.000000	test-mcc:0.493549 
[22]	train-mcc:0.000000	test-mcc:0.493549 
[23]	train-mcc:0.000000	test-mcc:0.492597 
[24]	train-mcc:0.000000	test-mcc:0.494684 
[25]	train-mcc:0.000000	test-mcc:0.494363 
[26]	train-mcc:0.000000	test-mcc:0.494363 
[27]	train-mcc:0.000000	test-mcc:0.494044 
[28]	train-mcc:0.000000	test-mcc:0.494962 
[29]	train-mcc:0.000000	test-mcc:0.495169 
[30]	train-mcc:0.000000	test-mcc:0.495169 
[31]	train-mcc:0.000000	test-mcc:0.495169 
[32]	train-mcc:0.000000	test-mcc:0.495878 
[33]	train-mcc:0.000000	test-mcc:0.496309 
[34]	train-mcc:0.000000	test-mcc:0.495606 
[35]	train-mcc:0.000000	test-mcc:0.495606 
[36]	train-mcc:0.000000	test-mcc:0.494655 
[37]	train-mcc:0.000000	test-mcc:0.494550 
[38]	train-mcc:0.000000	test-mcc:0.494550 
[39]	train-mcc:0.000000	test-mcc:0.494382 
[40]	train-mcc:0.000000	test-mcc:0.495091 
[41]	train-mcc:0.000000	test-mcc:0.496086 
[42]	train-mcc:0.000000	test-mcc:0.495378 
[43]	train-mcc:0.000000	test-mcc:0.494879 
[44]	train-mcc:0.000000	test-mcc:0.494170 
[45]	train-mcc:0.000000	test-mcc:0.494170 
[46]	train-mcc:0.000000	test-mcc:0.493959 
[47]	train-mcc:0.000000	test-mcc:0.493673 
[48]	train-mcc:0.000000	test-mcc:0.493609 
[49]	train-mcc:0.000000	test-mcc:0.493118 
[50]	train-mcc:0.000000	test-mcc:0.493827 
[51]	train-mcc:0.000000	test-mcc:0.493177 
[52]	train-mcc:0.000000	test-mcc:0.493540 
[53]	train-mcc:0.000000	test-mcc:0.493540 
[54]	train-mcc:0.000000	test-mcc:0.492115 
[55]	train-mcc:0.000000	test-mcc:0.493609 
[56]	train-mcc:0.000000	test-mcc:0.493609 
[57]	train-mcc:0.000000	test-mcc:0.493609 
[58]	train-mcc:0.000000	test-mcc:0.492301 
[59]	train-mcc:0.000000	test-mcc:0.490983 
[60]	train-mcc:0.000000	test-mcc:0.491128 
[61]	train-mcc:0.000000	test-mcc:0.490776 
[62]	train-mcc:0.000000	test-mcc:0.491265 
[63]	train-mcc:0.000000	test-mcc:0.491265 
Stopping. Best iteration:
[33]	train-mcc:0.000000	test-mcc:0.496309


Time: Thu Nov 10 2016 11:41:43 AM
For 0033 rounds: train_mcc: 0 - test_mcc: 0.4963092
Confusion matrix:
     truth
preds      0      1
    0 235271    952
    1    103    424
     truth
preds            0            1
    0 0.9937529039 0.0040211193
    1 0.0004350581 0.0017909187
Iteration 38 (base=0.1767844): MCC=0.4963092 | threshold=0.3783589



Iteration 38[4] on Thu Nov 10 2016 11:41:44 AM

depth=6, min_child_weight=1, subsample=0.8801701, colsample_bytree=0.883629, base_score=0.1767844
[1]	train-mcc:0.000000	test-mcc:0.478549 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.485784 
[3]	train-mcc:0.000000	test-mcc:0.486593 
[4]	train-mcc:0.000000	test-mcc:0.487361 
[5]	train-mcc:0.000000	test-mcc:0.487723 
[6]	train-mcc:0.000000	test-mcc:0.488229 
[7]	train-mcc:0.000000	test-mcc:0.486271 
[8]	train-mcc:0.000000	test-mcc:0.488362 
[9]	train-mcc:0.000000	test-mcc:0.488154 
[10]	train-mcc:0.000000	test-mcc:0.489019 
[11]	train-mcc:0.000000	test-mcc:0.487353 
[12]	train-mcc:0.000000	test-mcc:0.486596 
[13]	train-mcc:0.000000	test-mcc:0.487980 
[14]	train-mcc:0.000000	test-mcc:0.488795 
[15]	train-mcc:0.000000	test-mcc:0.488387 
[16]	train-mcc:0.000000	test-mcc:0.487574 
[17]	train-mcc:0.000000	test-mcc:0.486189 
[18]	train-mcc:0.000000	test-mcc:0.485946 
[19]	train-mcc:0.000000	test-mcc:0.484883 
[20]	train-mcc:0.000000	test-mcc:0.484874 
[21]	train-mcc:0.000000	test-mcc:0.485463 
[22]	train-mcc:0.000000	test-mcc:0.485463 
[23]	train-mcc:0.000000	test-mcc:0.485463 
[24]	train-mcc:0.000000	test-mcc:0.484762 
[25]	train-mcc:0.000000	test-mcc:0.484488 
[26]	train-mcc:0.000000	test-mcc:0.484059 
[27]	train-mcc:0.000000	test-mcc:0.484334 
[28]	train-mcc:0.000000	test-mcc:0.484360 
[29]	train-mcc:0.000000	test-mcc:0.484360 
[30]	train-mcc:0.000000	test-mcc:0.484272 
[31]	train-mcc:0.000000	test-mcc:0.485171 
[32]	train-mcc:0.000000	test-mcc:0.484758 
[33]	train-mcc:0.000000	test-mcc:0.486560 
[34]	train-mcc:0.000000	test-mcc:0.487114 
[35]	train-mcc:0.000000	test-mcc:0.487018 
[36]	train-mcc:0.000000	test-mcc:0.487018 
[37]	train-mcc:0.000000	test-mcc:0.486916 
[38]	train-mcc:0.000000	test-mcc:0.486819 
[39]	train-mcc:0.000000	test-mcc:0.487211 
[40]	train-mcc:0.000000	test-mcc:0.487604 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.489019


Time: Thu Nov 10 2016 11:43:14 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4890194
Confusion matrix:
     truth
preds      0      1
    0 235238    941
    1    136    435
     truth
preds            0            1
    0 0.9936135164 0.0039746568
    1 0.0005744456 0.0018373812
Iteration 38 (base=0.1767844): MCC=0.4890194 | threshold=0.3519553



Iteration 38[5] on Thu Nov 10 2016 11:43:16 AM

depth=6, min_child_weight=1, subsample=0.8801701, colsample_bytree=0.883629, base_score=0.1767844
[1]	train-mcc:0.000000	test-mcc:0.480408 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.482084 
[3]	train-mcc:0.000000	test-mcc:0.479895 
[4]	train-mcc:0.000000	test-mcc:0.484100 
[5]	train-mcc:0.000000	test-mcc:0.484930 
[6]	train-mcc:0.000000	test-mcc:0.484674 
[7]	train-mcc:0.000000	test-mcc:0.485058 
[8]	train-mcc:0.000000	test-mcc:0.484855 
[9]	train-mcc:0.000000	test-mcc:0.483360 
[10]	train-mcc:0.000000	test-mcc:0.482370 
[11]	train-mcc:0.000000	test-mcc:0.483532 
[12]	train-mcc:0.000000	test-mcc:0.483179 
[13]	train-mcc:0.000000	test-mcc:0.482800 
[14]	train-mcc:0.000000	test-mcc:0.482873 
[15]	train-mcc:0.000000	test-mcc:0.483419 
[16]	train-mcc:0.000000	test-mcc:0.484486 
[17]	train-mcc:0.000000	test-mcc:0.484930 
[18]	train-mcc:0.000000	test-mcc:0.484930 
[19]	train-mcc:0.000000	test-mcc:0.485234 
[20]	train-mcc:0.000000	test-mcc:0.484477 
[21]	train-mcc:0.000000	test-mcc:0.486222 
[22]	train-mcc:0.000000	test-mcc:0.483745 
[23]	train-mcc:0.000000	test-mcc:0.484171 
[24]	train-mcc:0.000000	test-mcc:0.484535 
[25]	train-mcc:0.000000	test-mcc:0.484535 
[26]	train-mcc:0.000000	test-mcc:0.484535 
[27]	train-mcc:0.000000	test-mcc:0.484407 
[28]	train-mcc:0.000000	test-mcc:0.483793 
[29]	train-mcc:0.000000	test-mcc:0.483793 
[30]	train-mcc:0.000000	test-mcc:0.483001 
[31]	train-mcc:0.000000	test-mcc:0.483107 
[32]	train-mcc:0.000000	test-mcc:0.483793 
[33]	train-mcc:0.000000	test-mcc:0.484100 
[34]	train-mcc:0.000000	test-mcc:0.484100 
[35]	train-mcc:0.000000	test-mcc:0.483723 
[36]	train-mcc:0.000000	test-mcc:0.485090 
[37]	train-mcc:0.000000	test-mcc:0.484245 
[38]	train-mcc:0.000000	test-mcc:0.484245 
[39]	train-mcc:0.000000	test-mcc:0.483107 
[40]	train-mcc:0.000000	test-mcc:0.481735 
[41]	train-mcc:0.000000	test-mcc:0.481735 
[42]	train-mcc:0.000000	test-mcc:0.483179 
[43]	train-mcc:0.000000	test-mcc:0.483348 
[44]	train-mcc:0.000000	test-mcc:0.483348 
[45]	train-mcc:0.000000	test-mcc:0.483657 
[46]	train-mcc:0.000000	test-mcc:0.483532 
[47]	train-mcc:0.000000	test-mcc:0.483903 
[48]	train-mcc:0.000000	test-mcc:0.484340 
[49]	train-mcc:0.000000	test-mcc:0.482973 
[50]	train-mcc:0.000000	test-mcc:0.481426 
[51]	train-mcc:0.000000	test-mcc:0.482849 
Stopping. Best iteration:
[21]	train-mcc:0.000000	test-mcc:0.486222


Time: Thu Nov 10 2016 11:45:18 AM
For 0021 rounds: train_mcc: 0 - test_mcc: 0.4862219
Confusion matrix:
     truth
preds      0      1
    0 235185    914
    1    189    462
     truth
preds            0            1
    0 0.9933896515 0.0038606125
    1 0.0007983105 0.0019514256
Iteration 38 (base=0.1767844): MCC=0.4862219 | threshold=0.2966014


===




Iteration 39[1] on Thu Nov 10 2016 11:45:57 AM

depth=7, min_child_weight=50, subsample=0.7352329, colsample_bytree=0.9771652, base_score=0.4757263
[1]	train-mcc:0.000000	test-mcc:0.469367 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471173 
[3]	train-mcc:0.000000	test-mcc:0.473111 
[4]	train-mcc:0.000000	test-mcc:0.473368 
[5]	train-mcc:0.000000	test-mcc:0.479133 
[6]	train-mcc:0.000000	test-mcc:0.479270 
[7]	train-mcc:0.000000	test-mcc:0.480862 
[8]	train-mcc:0.000000	test-mcc:0.480862 
[9]	train-mcc:0.000000	test-mcc:0.481879 
[10]	train-mcc:0.000000	test-mcc:0.483592 
[11]	train-mcc:0.000000	test-mcc:0.481076 
[12]	train-mcc:0.000000	test-mcc:0.481715 
[13]	train-mcc:0.000000	test-mcc:0.479004 
[14]	train-mcc:0.000000	test-mcc:0.479325 
[15]	train-mcc:0.000000	test-mcc:0.478690 
[16]	train-mcc:0.000000	test-mcc:0.478332 
[17]	train-mcc:0.000000	test-mcc:0.476399 
[18]	train-mcc:0.000000	test-mcc:0.478258 
[19]	train-mcc:0.000000	test-mcc:0.478167 
[20]	train-mcc:0.000000	test-mcc:0.476443 
[21]	train-mcc:0.000000	test-mcc:0.477195 
[22]	train-mcc:0.000000	test-mcc:0.477033 
[23]	train-mcc:0.000000	test-mcc:0.476112 
[24]	train-mcc:0.000000	test-mcc:0.476786 
[25]	train-mcc:0.000000	test-mcc:0.476454 
[26]	train-mcc:0.000000	test-mcc:0.476042 
[27]	train-mcc:0.000000	test-mcc:0.476175 
[28]	train-mcc:0.000000	test-mcc:0.476340 
[29]	train-mcc:0.000000	test-mcc:0.476340 
[30]	train-mcc:0.000000	test-mcc:0.477161 
[31]	train-mcc:0.000000	test-mcc:0.476257 
[32]	train-mcc:0.000000	test-mcc:0.476782 
[33]	train-mcc:0.000000	test-mcc:0.476763 
[34]	train-mcc:0.000000	test-mcc:0.476924 
[35]	train-mcc:0.000000	test-mcc:0.475676 
[36]	train-mcc:0.000000	test-mcc:0.476270 
[37]	train-mcc:0.000000	test-mcc:0.477935 
[38]	train-mcc:0.000000	test-mcc:0.476799 
[39]	train-mcc:0.000000	test-mcc:0.476620 
[40]	train-mcc:0.000000	test-mcc:0.476620 
Stopping. Best iteration:
[10]	train-mcc:0.000000	test-mcc:0.483592


Time: Thu Nov 10 2016 11:47:57 AM
For 0010 rounds: train_mcc: 0 - test_mcc: 0.4835924
Confusion matrix:
     truth
preds      0      1
    0 235326   1010
    1     47    365
     truth
preds            0            1
    0 0.9939936135 0.0042661395
    1 0.0001985233 0.0015417237
Iteration 39 (base=0.4757263): MCC=0.4835924 | threshold=0.5533611



Iteration 39[2] on Thu Nov 10 2016 11:47:58 AM

depth=7, min_child_weight=50, subsample=0.7352329, colsample_bytree=0.9771652, base_score=0.4757263
[1]	train-mcc:0.000000	test-mcc:0.470494 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474113 
[3]	train-mcc:0.000000	test-mcc:0.479928 
[4]	train-mcc:0.000000	test-mcc:0.482913 
[5]	train-mcc:0.000000	test-mcc:0.481698 
[6]	train-mcc:0.000000	test-mcc:0.483494 
[7]	train-mcc:0.000000	test-mcc:0.480874 
[8]	train-mcc:0.000000	test-mcc:0.481611 
[9]	train-mcc:0.000000	test-mcc:0.480191 
[10]	train-mcc:0.000000	test-mcc:0.482052 
[11]	train-mcc:0.000000	test-mcc:0.480879 
[12]	train-mcc:0.000000	test-mcc:0.480264 
[13]	train-mcc:0.000000	test-mcc:0.481517 
[14]	train-mcc:0.000000	test-mcc:0.482321 
[15]	train-mcc:0.000000	test-mcc:0.481360 
[16]	train-mcc:0.000000	test-mcc:0.482540 
[17]	train-mcc:0.000000	test-mcc:0.481524 
[18]	train-mcc:0.000000	test-mcc:0.482816 
[19]	train-mcc:0.000000	test-mcc:0.483080 
[20]	train-mcc:0.000000	test-mcc:0.483206 
[21]	train-mcc:0.000000	test-mcc:0.484954 
[22]	train-mcc:0.000000	test-mcc:0.484954 
[23]	train-mcc:0.000000	test-mcc:0.484006 
[24]	train-mcc:0.000000	test-mcc:0.484400 
[25]	train-mcc:0.000000	test-mcc:0.484443 
[26]	train-mcc:0.000000	test-mcc:0.486656 
[27]	train-mcc:0.000000	test-mcc:0.486397 
[28]	train-mcc:0.000000	test-mcc:0.488353 
[29]	train-mcc:0.000000	test-mcc:0.488195 
[30]	train-mcc:0.000000	test-mcc:0.487235 
[31]	train-mcc:0.000000	test-mcc:0.485415 
[32]	train-mcc:0.000000	test-mcc:0.485203 
[33]	train-mcc:0.000000	test-mcc:0.483521 
[34]	train-mcc:0.000000	test-mcc:0.484721 
[35]	train-mcc:0.000000	test-mcc:0.485193 
[36]	train-mcc:0.000000	test-mcc:0.484275 
[37]	train-mcc:0.000000	test-mcc:0.484710 
[38]	train-mcc:0.000000	test-mcc:0.485589 
[39]	train-mcc:0.000000	test-mcc:0.485505 
[40]	train-mcc:0.000000	test-mcc:0.485058 
[41]	train-mcc:0.000000	test-mcc:0.485058 
[42]	train-mcc:0.000000	test-mcc:0.485058 
[43]	train-mcc:0.000000	test-mcc:0.484601 
[44]	train-mcc:0.000000	test-mcc:0.483907 
[45]	train-mcc:0.000000	test-mcc:0.484585 
[46]	train-mcc:0.000000	test-mcc:0.485805 
[47]	train-mcc:0.000000	test-mcc:0.485084 
[48]	train-mcc:0.000000	test-mcc:0.483140 
[49]	train-mcc:0.000000	test-mcc:0.484802 
[50]	train-mcc:0.000000	test-mcc:0.486250 
[51]	train-mcc:0.000000	test-mcc:0.484716 
[52]	train-mcc:0.000000	test-mcc:0.484721 
[53]	train-mcc:0.000000	test-mcc:0.485621 
[54]	train-mcc:0.000000	test-mcc:0.484488 
[55]	train-mcc:0.000000	test-mcc:0.483400 
[56]	train-mcc:0.000000	test-mcc:0.487121 
[57]	train-mcc:0.000000	test-mcc:0.486146 
[58]	train-mcc:0.000000	test-mcc:0.485909 
Stopping. Best iteration:
[28]	train-mcc:0.000000	test-mcc:0.488353


Time: Thu Nov 10 2016 11:50:50 AM
For 0028 rounds: train_mcc: 0 - test_mcc: 0.4883526
Confusion matrix:
     truth
preds      0      1
    0 235256    954
    1    117    422
     truth
preds            0            1
    0 0.9936937432 0.0040295841
    1 0.0004941943 0.0017824785
Iteration 39 (base=0.4757263): MCC=0.4883526 | threshold=0.4070247



Iteration 39[3] on Thu Nov 10 2016 11:50:51 AM

depth=7, min_child_weight=50, subsample=0.7352329, colsample_bytree=0.9771652, base_score=0.4757263
[1]	train-mcc:0.000000	test-mcc:0.482801 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486052 
[3]	train-mcc:0.000000	test-mcc:0.492250 
[4]	train-mcc:0.000000	test-mcc:0.489248 
[5]	train-mcc:0.000000	test-mcc:0.486550 
[6]	train-mcc:0.000000	test-mcc:0.487361 
[7]	train-mcc:0.000000	test-mcc:0.489232 
[8]	train-mcc:0.000000	test-mcc:0.488778 
[9]	train-mcc:0.000000	test-mcc:0.488181 
[10]	train-mcc:0.000000	test-mcc:0.490042 
[11]	train-mcc:0.000000	test-mcc:0.490363 
[12]	train-mcc:0.000000	test-mcc:0.490441 
[13]	train-mcc:0.000000	test-mcc:0.492781 
[14]	train-mcc:0.000000	test-mcc:0.494245 
[15]	train-mcc:0.000000	test-mcc:0.493739 
[16]	train-mcc:0.000000	test-mcc:0.494899 
[17]	train-mcc:0.000000	test-mcc:0.495754 
[18]	train-mcc:0.000000	test-mcc:0.494512 
[19]	train-mcc:0.000000	test-mcc:0.494508 
[20]	train-mcc:0.000000	test-mcc:0.495139 
[21]	train-mcc:0.000000	test-mcc:0.496319 
[22]	train-mcc:0.000000	test-mcc:0.494508 
[23]	train-mcc:0.000000	test-mcc:0.494856 
[24]	train-mcc:0.000000	test-mcc:0.495430 
[25]	train-mcc:0.000000	test-mcc:0.494879 
[26]	train-mcc:0.000000	test-mcc:0.495682 
[27]	train-mcc:0.000000	test-mcc:0.495682 
[28]	train-mcc:0.000000	test-mcc:0.496717 
[29]	train-mcc:0.000000	test-mcc:0.498326 
[30]	train-mcc:0.000000	test-mcc:0.497894 
[31]	train-mcc:0.000000	test-mcc:0.498600 
[32]	train-mcc:0.000000	test-mcc:0.495879 
[33]	train-mcc:0.000000	test-mcc:0.495879 
[34]	train-mcc:0.000000	test-mcc:0.497496 
[35]	train-mcc:0.000000	test-mcc:0.496535 
[36]	train-mcc:0.000000	test-mcc:0.496717 
[37]	train-mcc:0.000000	test-mcc:0.496383 
[38]	train-mcc:0.000000	test-mcc:0.497847 
[39]	train-mcc:0.000000	test-mcc:0.497574 
[40]	train-mcc:0.000000	test-mcc:0.497937 
[41]	train-mcc:0.000000	test-mcc:0.498637 
[42]	train-mcc:0.000000	test-mcc:0.497488 
[43]	train-mcc:0.000000	test-mcc:0.495656 
[44]	train-mcc:0.000000	test-mcc:0.495814 
[45]	train-mcc:0.000000	test-mcc:0.495820 
[46]	train-mcc:0.000000	test-mcc:0.496283 
[47]	train-mcc:0.000000	test-mcc:0.496535 
[48]	train-mcc:0.000000	test-mcc:0.496535 
[49]	train-mcc:0.000000	test-mcc:0.498862 
[50]	train-mcc:0.000000	test-mcc:0.498862 
[51]	train-mcc:0.000000	test-mcc:0.498436 
[52]	train-mcc:0.000000	test-mcc:0.495820 
[53]	train-mcc:0.000000	test-mcc:0.495106 
[54]	train-mcc:0.000000	test-mcc:0.494414 
[55]	train-mcc:0.000000	test-mcc:0.497016 
[56]	train-mcc:0.000000	test-mcc:0.496597 
[57]	train-mcc:0.000000	test-mcc:0.495797 
[58]	train-mcc:0.000000	test-mcc:0.495797 
[59]	train-mcc:0.000000	test-mcc:0.496148 
[60]	train-mcc:0.000000	test-mcc:0.494939 
[61]	train-mcc:0.000000	test-mcc:0.493989 
[62]	train-mcc:0.000000	test-mcc:0.495206 
[63]	train-mcc:0.000000	test-mcc:0.493892 
[64]	train-mcc:0.000000	test-mcc:0.493563 
[65]	train-mcc:0.000000	test-mcc:0.494959 
[66]	train-mcc:0.000000	test-mcc:0.493667 
[67]	train-mcc:0.000000	test-mcc:0.494067 
[68]	train-mcc:0.000000	test-mcc:0.494067 
[69]	train-mcc:0.000000	test-mcc:0.493808 
[70]	train-mcc:0.000000	test-mcc:0.494426 
[71]	train-mcc:0.000000	test-mcc:0.494112 
[72]	train-mcc:0.000000	test-mcc:0.493224 
[73]	train-mcc:0.000000	test-mcc:0.492970 
[74]	train-mcc:0.000000	test-mcc:0.493316 
[75]	train-mcc:0.000000	test-mcc:0.492682 
[76]	train-mcc:0.000000	test-mcc:0.493016 
[77]	train-mcc:0.000000	test-mcc:0.492772 
[78]	train-mcc:0.000000	test-mcc:0.491834 
[79]	train-mcc:0.000000	test-mcc:0.492212 
Stopping. Best iteration:
[49]	train-mcc:0.000000	test-mcc:0.498862


Time: Thu Nov 10 2016 11:54:31 AM
For 0049 rounds: train_mcc: 0 - test_mcc: 0.4988615
Confusion matrix:
     truth
preds      0      1
    0 235257    939
    1    117    437
     truth
preds            0            1
    0 0.9936937698 0.0039662091
    1 0.0004941922 0.0018458289
Iteration 39 (base=0.4757263): MCC=0.4988615 | threshold=0.3787364



Iteration 39[4] on Thu Nov 10 2016 11:54:33 AM

depth=7, min_child_weight=50, subsample=0.7352329, colsample_bytree=0.9771652, base_score=0.4757263
[1]	train-mcc:0.000000	test-mcc:0.478281 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487954 
[3]	train-mcc:0.000000	test-mcc:0.484604 
[4]	train-mcc:0.000000	test-mcc:0.481342 
[5]	train-mcc:0.000000	test-mcc:0.481749 
[6]	train-mcc:0.000000	test-mcc:0.482327 
[7]	train-mcc:0.000000	test-mcc:0.483533 
[8]	train-mcc:0.000000	test-mcc:0.482607 
[9]	train-mcc:0.000000	test-mcc:0.481751 
[10]	train-mcc:0.000000	test-mcc:0.482537 
[11]	train-mcc:0.000000	test-mcc:0.483496 
[12]	train-mcc:0.000000	test-mcc:0.484340 
[13]	train-mcc:0.000000	test-mcc:0.485091 
[14]	train-mcc:0.000000	test-mcc:0.483348 
[15]	train-mcc:0.000000	test-mcc:0.483486 
[16]	train-mcc:0.000000	test-mcc:0.484550 
[17]	train-mcc:0.000000	test-mcc:0.482107 
[18]	train-mcc:0.000000	test-mcc:0.482151 
[19]	train-mcc:0.000000	test-mcc:0.482320 
[20]	train-mcc:0.000000	test-mcc:0.480581 
[21]	train-mcc:0.000000	test-mcc:0.481282 
[22]	train-mcc:0.000000	test-mcc:0.481913 
[23]	train-mcc:0.000000	test-mcc:0.481183 
[24]	train-mcc:0.000000	test-mcc:0.481010 
[25]	train-mcc:0.000000	test-mcc:0.481307 
[26]	train-mcc:0.000000	test-mcc:0.482194 
[27]	train-mcc:0.000000	test-mcc:0.481425 
[28]	train-mcc:0.000000	test-mcc:0.481047 
[29]	train-mcc:0.000000	test-mcc:0.481466 
[30]	train-mcc:0.000000	test-mcc:0.482948 
[31]	train-mcc:0.000000	test-mcc:0.483419 
[32]	train-mcc:0.000000	test-mcc:0.484895 
Stopping. Best iteration:
[2]	train-mcc:0.000000	test-mcc:0.487954


Time: Thu Nov 10 2016 11:56:03 AM
For 0002 rounds: train_mcc: 0 - test_mcc: 0.4879536
Confusion matrix:
     truth
preds      0      1
    0 235164    900
    1    210    476
     truth
preds            0            1
    0 0.9933009504 0.0038014784
    1 0.0008870116 0.0020105597
Iteration 39 (base=0.4757263): MCC=0.4879536 | threshold=0.4124641



Iteration 39[5] on Thu Nov 10 2016 11:56:04 AM

depth=7, min_child_weight=50, subsample=0.7352329, colsample_bytree=0.9771652, base_score=0.4757263
[1]	train-mcc:0.000000	test-mcc:0.484519 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486982 
[3]	train-mcc:0.000000	test-mcc:0.486754 
[4]	train-mcc:0.000000	test-mcc:0.489239 
[5]	train-mcc:0.000000	test-mcc:0.488255 
[6]	train-mcc:0.000000	test-mcc:0.488720 
[7]	train-mcc:0.000000	test-mcc:0.488509 
[8]	train-mcc:0.000000	test-mcc:0.486758 
[9]	train-mcc:0.000000	test-mcc:0.487293 
[10]	train-mcc:0.000000	test-mcc:0.487835 
[11]	train-mcc:0.000000	test-mcc:0.490065 
[12]	train-mcc:0.000000	test-mcc:0.491512 
[13]	train-mcc:0.000000	test-mcc:0.491595 
[14]	train-mcc:0.000000	test-mcc:0.491667 
[15]	train-mcc:0.000000	test-mcc:0.492036 
[16]	train-mcc:0.000000	test-mcc:0.491914 
[17]	train-mcc:0.000000	test-mcc:0.491318 
[18]	train-mcc:0.000000	test-mcc:0.492104 
[19]	train-mcc:0.000000	test-mcc:0.491971 
[20]	train-mcc:0.000000	test-mcc:0.492189 
[21]	train-mcc:0.000000	test-mcc:0.491259 
[22]	train-mcc:0.000000	test-mcc:0.489759 
[23]	train-mcc:0.000000	test-mcc:0.490893 
[24]	train-mcc:0.000000	test-mcc:0.489241 
[25]	train-mcc:0.000000	test-mcc:0.489889 
[26]	train-mcc:0.000000	test-mcc:0.489474 
[27]	train-mcc:0.000000	test-mcc:0.488997 
[28]	train-mcc:0.000000	test-mcc:0.489551 
[29]	train-mcc:0.000000	test-mcc:0.488586 
[30]	train-mcc:0.000000	test-mcc:0.487409 
[31]	train-mcc:0.000000	test-mcc:0.488263 
[32]	train-mcc:0.000000	test-mcc:0.488324 
[33]	train-mcc:0.000000	test-mcc:0.488511 
[34]	train-mcc:0.000000	test-mcc:0.486473 
[35]	train-mcc:0.000000	test-mcc:0.485909 
[36]	train-mcc:0.000000	test-mcc:0.486072 
[37]	train-mcc:0.000000	test-mcc:0.487003 
[38]	train-mcc:0.000000	test-mcc:0.485673 
[39]	train-mcc:0.000000	test-mcc:0.484715 
[40]	train-mcc:0.000000	test-mcc:0.485431 
[41]	train-mcc:0.000000	test-mcc:0.486434 
[42]	train-mcc:0.000000	test-mcc:0.486687 
[43]	train-mcc:0.000000	test-mcc:0.485330 
[44]	train-mcc:0.000000	test-mcc:0.485753 
[45]	train-mcc:0.000000	test-mcc:0.485584 
[46]	train-mcc:0.000000	test-mcc:0.487108 
[47]	train-mcc:0.000000	test-mcc:0.487108 
[48]	train-mcc:0.000000	test-mcc:0.485740 
[49]	train-mcc:0.000000	test-mcc:0.488379 
[50]	train-mcc:0.000000	test-mcc:0.488379 
Stopping. Best iteration:
[20]	train-mcc:0.000000	test-mcc:0.492189


Time: Thu Nov 10 2016 11:58:20 AM
For 0020 rounds: train_mcc: 0 - test_mcc: 0.492189
Confusion matrix:
     truth
preds      0      1
    0 235280    964
    1     94    412
     truth
preds            0            1
    0 0.9937909187 0.0040718057
    1 0.0003970433 0.0017402323
Iteration 39 (base=0.4757263): MCC=0.492189 | threshold=0.4001394


===




Iteration 40[1] on Thu Nov 10 2016 11:59:01 AM

depth=10, min_child_weight=32.37816, subsample=0.8964584, colsample_bytree=0.9855451, base_score=0.3620881
[1]	train-mcc:0.000000	test-mcc:0.468260 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.474388 
[3]	train-mcc:0.000000	test-mcc:0.477410 
[4]	train-mcc:0.000000	test-mcc:0.477393 
[5]	train-mcc:0.000000	test-mcc:0.477366 
[6]	train-mcc:0.000000	test-mcc:0.479772 
[7]	train-mcc:0.000000	test-mcc:0.482280 
[8]	train-mcc:0.000000	test-mcc:0.477716 
[9]	train-mcc:0.000000	test-mcc:0.479859 
[10]	train-mcc:0.000000	test-mcc:0.478671 
[11]	train-mcc:0.000000	test-mcc:0.480243 
[12]	train-mcc:0.000000	test-mcc:0.479666 
[13]	train-mcc:0.000000	test-mcc:0.479685 
[14]	train-mcc:0.000000	test-mcc:0.480348 
[15]	train-mcc:0.000000	test-mcc:0.478659 
[16]	train-mcc:0.000000	test-mcc:0.480814 
[17]	train-mcc:0.000000	test-mcc:0.480606 
[18]	train-mcc:0.000000	test-mcc:0.479961 
[19]	train-mcc:0.000000	test-mcc:0.478956 
[20]	train-mcc:0.000000	test-mcc:0.478173 
[21]	train-mcc:0.000000	test-mcc:0.480440 
[22]	train-mcc:0.000000	test-mcc:0.481621 
[23]	train-mcc:0.000000	test-mcc:0.478485 
[24]	train-mcc:0.000000	test-mcc:0.478485 
[25]	train-mcc:0.000000	test-mcc:0.478842 
[26]	train-mcc:0.000000	test-mcc:0.479059 
[27]	train-mcc:0.000000	test-mcc:0.478079 
[28]	train-mcc:0.000000	test-mcc:0.477475 
[29]	train-mcc:0.000000	test-mcc:0.478167 
[30]	train-mcc:0.000000	test-mcc:0.479908 
[31]	train-mcc:0.000000	test-mcc:0.479489 
[32]	train-mcc:0.000000	test-mcc:0.479489 
[33]	train-mcc:0.000000	test-mcc:0.479489 
[34]	train-mcc:0.000000	test-mcc:0.479489 
[35]	train-mcc:0.000000	test-mcc:0.479489 
[36]	train-mcc:0.000000	test-mcc:0.479749 
[37]	train-mcc:0.000000	test-mcc:0.479125 
Stopping. Best iteration:
[7]	train-mcc:0.000000	test-mcc:0.482280


Time: Thu Nov 10 2016 12:01:39 PM
For 0007 rounds: train_mcc: 0 - test_mcc: 0.4822801
Confusion matrix:
     truth
preds      0      1
    0 235296    989
    1     77    386
     truth
preds            0            1
    0 0.9938668964 0.0041774376
    1 0.0003252403 0.0016304256
Iteration 40 (base=0.3620881): MCC=0.4822801 | threshold=0.4770257



Iteration 40[2] on Thu Nov 10 2016 12:01:40 PM

depth=10, min_child_weight=32.37816, subsample=0.8964584, colsample_bytree=0.9855451, base_score=0.3620881
[1]	train-mcc:0.000000	test-mcc:0.472871 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.478552 
[3]	train-mcc:0.000000	test-mcc:0.484721 
[4]	train-mcc:0.000000	test-mcc:0.484054 
[5]	train-mcc:0.000000	test-mcc:0.484460 
[6]	train-mcc:0.000000	test-mcc:0.487148 
[7]	train-mcc:0.000000	test-mcc:0.480879 
[8]	train-mcc:0.000000	test-mcc:0.482801 
[9]	train-mcc:0.000000	test-mcc:0.482806 
[10]	train-mcc:0.000000	test-mcc:0.486656 
[11]	train-mcc:0.000000	test-mcc:0.486138 
[12]	train-mcc:0.000000	test-mcc:0.484215 
[13]	train-mcc:0.000000	test-mcc:0.484903 
[14]	train-mcc:0.000000	test-mcc:0.485244 
[15]	train-mcc:0.000000	test-mcc:0.485306 
[16]	train-mcc:0.000000	test-mcc:0.486746 
[17]	train-mcc:0.000000	test-mcc:0.485769 
[18]	train-mcc:0.000000	test-mcc:0.487438 
[19]	train-mcc:0.000000	test-mcc:0.486274 
[20]	train-mcc:0.000000	test-mcc:0.486138 
[21]	train-mcc:0.000000	test-mcc:0.485690 
[22]	train-mcc:0.000000	test-mcc:0.485318 
[23]	train-mcc:0.000000	test-mcc:0.485431 
[24]	train-mcc:0.000000	test-mcc:0.484983 
[25]	train-mcc:0.000000	test-mcc:0.486250 
[26]	train-mcc:0.000000	test-mcc:0.485737 
[27]	train-mcc:0.000000	test-mcc:0.485439 
[28]	train-mcc:0.000000	test-mcc:0.485870 
[29]	train-mcc:0.000000	test-mcc:0.485318 
[30]	train-mcc:0.000000	test-mcc:0.484077 
[31]	train-mcc:0.000000	test-mcc:0.484863 
[32]	train-mcc:0.000000	test-mcc:0.483863 
[33]	train-mcc:0.000000	test-mcc:0.484289 
[34]	train-mcc:0.000000	test-mcc:0.484291 
[35]	train-mcc:0.000000	test-mcc:0.484291 
[36]	train-mcc:0.000000	test-mcc:0.484585 
[37]	train-mcc:0.000000	test-mcc:0.486306 
[38]	train-mcc:0.000000	test-mcc:0.486808 
[39]	train-mcc:0.000000	test-mcc:0.483759 
[40]	train-mcc:0.000000	test-mcc:0.483065 
[41]	train-mcc:0.000000	test-mcc:0.482603 
[42]	train-mcc:0.000000	test-mcc:0.483096 
[43]	train-mcc:0.000000	test-mcc:0.484087 
[44]	train-mcc:0.000000	test-mcc:0.484313 
[45]	train-mcc:0.000000	test-mcc:0.484720 
[46]	train-mcc:0.000000	test-mcc:0.484720 
[47]	train-mcc:0.000000	test-mcc:0.485193 
[48]	train-mcc:0.000000	test-mcc:0.484954 
Stopping. Best iteration:
[18]	train-mcc:0.000000	test-mcc:0.487438


Time: Thu Nov 10 2016 12:04:44 PM
For 0018 rounds: train_mcc: 0 - test_mcc: 0.4874377
Confusion matrix:
     truth
preds      0      1
    0 235254    954
    1    119    422
     truth
preds           0           1
    0 0.993685295 0.004029584
    1 0.000502642 0.001782478
Iteration 40 (base=0.3620881): MCC=0.4874377 | threshold=0.4021311



Iteration 40[3] on Thu Nov 10 2016 12:04:45 PM

depth=10, min_child_weight=32.37816, subsample=0.8964584, colsample_bytree=0.9855451, base_score=0.3620881
[1]	train-mcc:0.000000	test-mcc:0.488003 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.487135 
[3]	train-mcc:0.000000	test-mcc:0.490902 
[4]	train-mcc:0.000000	test-mcc:0.488433 
[5]	train-mcc:0.000000	test-mcc:0.493942 
[6]	train-mcc:0.000000	test-mcc:0.496012 
[7]	train-mcc:0.000000	test-mcc:0.492919 
[8]	train-mcc:0.000000	test-mcc:0.498800 
[9]	train-mcc:0.000000	test-mcc:0.496509 
[10]	train-mcc:0.000000	test-mcc:0.495453 
[11]	train-mcc:0.000000	test-mcc:0.495955 
[12]	train-mcc:0.000000	test-mcc:0.497175 
[13]	train-mcc:0.000000	test-mcc:0.494841 
[14]	train-mcc:0.000000	test-mcc:0.495566 
[15]	train-mcc:0.000000	test-mcc:0.496361 
[16]	train-mcc:0.000000	test-mcc:0.494853 
[17]	train-mcc:0.000000	test-mcc:0.496842 
[18]	train-mcc:0.000000	test-mcc:0.496946 
[19]	train-mcc:0.000000	test-mcc:0.498581 
[20]	train-mcc:0.000000	test-mcc:0.499080 
[21]	train-mcc:0.000000	test-mcc:0.497960 
[22]	train-mcc:0.000000	test-mcc:0.500210 
[23]	train-mcc:0.000000	test-mcc:0.499337 
[24]	train-mcc:0.000000	test-mcc:0.499157 
[25]	train-mcc:0.000000	test-mcc:0.500995 
[26]	train-mcc:0.000000	test-mcc:0.502322 
[27]	train-mcc:0.000000	test-mcc:0.502954 
[28]	train-mcc:0.000000	test-mcc:0.502767 
[29]	train-mcc:0.000000	test-mcc:0.502082 
[30]	train-mcc:0.000000	test-mcc:0.500995 
[31]	train-mcc:0.000000	test-mcc:0.501648 
[32]	train-mcc:0.000000	test-mcc:0.501216 
[33]	train-mcc:0.000000	test-mcc:0.500712 
[34]	train-mcc:0.000000	test-mcc:0.501397 
[35]	train-mcc:0.000000	test-mcc:0.501147 
[36]	train-mcc:0.000000	test-mcc:0.501584 
[37]	train-mcc:0.000000	test-mcc:0.501969 
[38]	train-mcc:0.000000	test-mcc:0.501926 
[39]	train-mcc:0.000000	test-mcc:0.501684 
[40]	train-mcc:0.000000	test-mcc:0.500704 
[41]	train-mcc:0.000000	test-mcc:0.500305 
[42]	train-mcc:0.000000	test-mcc:0.499215 
[43]	train-mcc:0.000000	test-mcc:0.500792 
[44]	train-mcc:0.000000	test-mcc:0.501684 
[45]	train-mcc:0.000000	test-mcc:0.501480 
[46]	train-mcc:0.000000	test-mcc:0.501147 
[47]	train-mcc:0.000000	test-mcc:0.502021 
[48]	train-mcc:0.000000	test-mcc:0.499588 
[49]	train-mcc:0.000000	test-mcc:0.498923 
[50]	train-mcc:0.000000	test-mcc:0.499743 
[51]	train-mcc:0.000000	test-mcc:0.499463 
[52]	train-mcc:0.000000	test-mcc:0.499614 
[53]	train-mcc:0.000000	test-mcc:0.501237 
[54]	train-mcc:0.000000	test-mcc:0.500963 
[55]	train-mcc:0.000000	test-mcc:0.501868 
[56]	train-mcc:0.000000	test-mcc:0.499129 
[57]	train-mcc:0.000000	test-mcc:0.499371 
Stopping. Best iteration:
[27]	train-mcc:0.000000	test-mcc:0.502954


Time: Thu Nov 10 2016 12:08:51 PM
For 0027 rounds: train_mcc: 0 - test_mcc: 0.5029538
Confusion matrix:
     truth
preds      0      1
    0 235243    924
    1    131    452
     truth
preds            0            1
    0 0.9936346357 0.0039028511
    1 0.0005533263 0.0019091869
Iteration 40 (base=0.3620881): MCC=0.5029538 | threshold=0.3596906



Iteration 40[4] on Thu Nov 10 2016 12:08:52 PM

depth=10, min_child_weight=32.37816, subsample=0.8964584, colsample_bytree=0.9855451, base_score=0.3620881
[1]	train-mcc:0.000000	test-mcc:0.481751 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486131 
[3]	train-mcc:0.000000	test-mcc:0.483907 
[4]	train-mcc:0.000000	test-mcc:0.486691 
[5]	train-mcc:0.000000	test-mcc:0.485267 
[6]	train-mcc:0.000000	test-mcc:0.487881 
[7]	train-mcc:0.000000	test-mcc:0.486928 
[8]	train-mcc:0.000000	test-mcc:0.486121 
[9]	train-mcc:0.000000	test-mcc:0.485379 
[10]	train-mcc:0.000000	test-mcc:0.487329 
[11]	train-mcc:0.000000	test-mcc:0.483105 
[12]	train-mcc:0.000000	test-mcc:0.482416 
[13]	train-mcc:0.000000	test-mcc:0.483622 
[14]	train-mcc:0.000000	test-mcc:0.483056 
[15]	train-mcc:0.000000	test-mcc:0.481881 
[16]	train-mcc:0.000000	test-mcc:0.483325 
[17]	train-mcc:0.000000	test-mcc:0.482834 
[18]	train-mcc:0.000000	test-mcc:0.481368 
[19]	train-mcc:0.000000	test-mcc:0.482109 
[20]	train-mcc:0.000000	test-mcc:0.483532 
[21]	train-mcc:0.000000	test-mcc:0.482506 
[22]	train-mcc:0.000000	test-mcc:0.481388 
[23]	train-mcc:0.000000	test-mcc:0.481299 
[24]	train-mcc:0.000000	test-mcc:0.481364 
[25]	train-mcc:0.000000	test-mcc:0.482832 
[26]	train-mcc:0.000000	test-mcc:0.482962 
[27]	train-mcc:0.000000	test-mcc:0.482834 
[28]	train-mcc:0.000000	test-mcc:0.481789 
[29]	train-mcc:0.000000	test-mcc:0.482624 
[30]	train-mcc:0.000000	test-mcc:0.483494 
[31]	train-mcc:0.000000	test-mcc:0.484014 
[32]	train-mcc:0.000000	test-mcc:0.483043 
[33]	train-mcc:0.000000	test-mcc:0.482201 
[34]	train-mcc:0.000000	test-mcc:0.482624 
[35]	train-mcc:0.000000	test-mcc:0.482160 
[36]	train-mcc:0.000000	test-mcc:0.482160 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.487881


Time: Thu Nov 10 2016 12:11:27 PM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.4878813
Confusion matrix:
     truth
preds      0      1
    0 235101    868
    1    273    508
     truth
preds           0           1
    0 0.993034847 0.003666315
    1 0.001153115 0.002145723
Iteration 40 (base=0.3620881): MCC=0.4878813 | threshold=0.2753789



Iteration 40[5] on Thu Nov 10 2016 12:11:28 PM

depth=10, min_child_weight=32.37816, subsample=0.8964584, colsample_bytree=0.9855451, base_score=0.3620881
[1]	train-mcc:0.000000	test-mcc:0.489771 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.489272 
[3]	train-mcc:0.000000	test-mcc:0.489352 
[4]	train-mcc:0.000000	test-mcc:0.489104 
[5]	train-mcc:0.000000	test-mcc:0.489361 
[6]	train-mcc:0.000000	test-mcc:0.493333 
[7]	train-mcc:0.000000	test-mcc:0.491461 
[8]	train-mcc:0.000000	test-mcc:0.491371 
[9]	train-mcc:0.000000	test-mcc:0.489279 
[10]	train-mcc:0.000000	test-mcc:0.491622 
[11]	train-mcc:0.000000	test-mcc:0.491643 
[12]	train-mcc:0.000000	test-mcc:0.492212 
[13]	train-mcc:0.000000	test-mcc:0.490152 
[14]	train-mcc:0.000000	test-mcc:0.491145 
[15]	train-mcc:0.000000	test-mcc:0.491595 
[16]	train-mcc:0.000000	test-mcc:0.489783 
[17]	train-mcc:0.000000	test-mcc:0.489973 
[18]	train-mcc:0.000000	test-mcc:0.490943 
[19]	train-mcc:0.000000	test-mcc:0.489973 
[20]	train-mcc:0.000000	test-mcc:0.486696 
[21]	train-mcc:0.000000	test-mcc:0.487351 
[22]	train-mcc:0.000000	test-mcc:0.488319 
[23]	train-mcc:0.000000	test-mcc:0.486883 
[24]	train-mcc:0.000000	test-mcc:0.486404 
[25]	train-mcc:0.000000	test-mcc:0.487859 
[26]	train-mcc:0.000000	test-mcc:0.486384 
[27]	train-mcc:0.000000	test-mcc:0.486384 
[28]	train-mcc:0.000000	test-mcc:0.487376 
[29]	train-mcc:0.000000	test-mcc:0.488996 
[30]	train-mcc:0.000000	test-mcc:0.488831 
[31]	train-mcc:0.000000	test-mcc:0.489338 
[32]	train-mcc:0.000000	test-mcc:0.489707 
[33]	train-mcc:0.000000	test-mcc:0.490476 
[34]	train-mcc:0.000000	test-mcc:0.491698 
[35]	train-mcc:0.000000	test-mcc:0.490609 
[36]	train-mcc:0.000000	test-mcc:0.491823 
Stopping. Best iteration:
[6]	train-mcc:0.000000	test-mcc:0.493333


Time: Thu Nov 10 2016 12:14:02 PM
For 0006 rounds: train_mcc: 0 - test_mcc: 0.493333
Confusion matrix:
     truth
preds      0      1
    0 235222    925
    1    152    451
     truth
preds            0            1
    0 0.9935459345 0.0039070750
    1 0.0006420275 0.0019049630
Iteration 40 (base=0.3620881): MCC=0.493333 | threshold=0.3445688


===




Iteration 41[1] on Thu Nov 10 2016 12:14:45 PM

depth=5, min_child_weight=10.95071, subsample=0.9616755, colsample_bytree=0.5537064, base_score=0.07145179
[1]	train-mcc:0.000000	test-mcc:0.466276 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471699 
[3]	train-mcc:0.000000	test-mcc:0.473086 
[4]	train-mcc:0.000000	test-mcc:0.476872 
[5]	train-mcc:0.000000	test-mcc:0.477463 
[6]	train-mcc:0.000000	test-mcc:0.476888 
[7]	train-mcc:0.000000	test-mcc:0.477340 
[8]	train-mcc:0.000000	test-mcc:0.476290 
[9]	train-mcc:0.000000	test-mcc:0.474918 
[10]	train-mcc:0.000000	test-mcc:0.474840 
[11]	train-mcc:0.000000	test-mcc:0.474840 
[12]	train-mcc:0.000000	test-mcc:0.474793 
[13]	train-mcc:0.000000	test-mcc:0.474651 
[14]	train-mcc:0.000000	test-mcc:0.474793 
[15]	train-mcc:0.000000	test-mcc:0.475112 
[16]	train-mcc:0.000000	test-mcc:0.475112 
[17]	train-mcc:0.000000	test-mcc:0.475986 
[18]	train-mcc:0.000000	test-mcc:0.476290 
[19]	train-mcc:0.000000	test-mcc:0.475539 
[20]	train-mcc:0.000000	test-mcc:0.475539 
[21]	train-mcc:0.000000	test-mcc:0.475539 
[22]	train-mcc:0.000000	test-mcc:0.476159 
[23]	train-mcc:0.000000	test-mcc:0.476159 
[24]	train-mcc:0.000000	test-mcc:0.476159 
[25]	train-mcc:0.000000	test-mcc:0.476159 
[26]	train-mcc:0.000000	test-mcc:0.475547 
[27]	train-mcc:0.000000	test-mcc:0.475547 
[28]	train-mcc:0.000000	test-mcc:0.475547 
[29]	train-mcc:0.000000	test-mcc:0.475547 
[30]	train-mcc:0.000000	test-mcc:0.475266 
[31]	train-mcc:0.000000	test-mcc:0.474923 
[32]	train-mcc:0.000000	test-mcc:0.475487 
[33]	train-mcc:0.000000	test-mcc:0.475487 
[34]	train-mcc:0.000000	test-mcc:0.475487 
[35]	train-mcc:0.000000	test-mcc:0.475487 
Stopping. Best iteration:
[5]	train-mcc:0.000000	test-mcc:0.477463


Time: Thu Nov 10 2016 12:15:36 PM
For 0005 rounds: train_mcc: 0 - test_mcc: 0.4774628
Confusion matrix:
     truth
preds      0      1
    0 235291    992
    1     82    383
     truth
preds            0            1
    0 0.9938457769 0.0041901093
    1 0.0003463598 0.0016177539
Iteration 41 (base=0.07145179): MCC=0.4774628 | threshold=0.3840936



Iteration 41[2] on Thu Nov 10 2016 12:15:37 PM

depth=5, min_child_weight=10.95071, subsample=0.9616755, colsample_bytree=0.5537064, base_score=0.07145179
[1]	train-mcc:0.000000	test-mcc:0.469429 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.471889 
[3]	train-mcc:0.000000	test-mcc:0.473384 
[4]	train-mcc:0.000000	test-mcc:0.471385 
[5]	train-mcc:0.000000	test-mcc:0.471199 
[6]	train-mcc:0.000000	test-mcc:0.477587 
[7]	train-mcc:0.000000	test-mcc:0.475382 
[8]	train-mcc:0.000000	test-mcc:0.475598 
[9]	train-mcc:0.000000	test-mcc:0.475598 
[10]	train-mcc:0.000000	test-mcc:0.476858 
[11]	train-mcc:0.000000	test-mcc:0.476858 
[12]	train-mcc:0.000000	test-mcc:0.477072 
[13]	train-mcc:0.000000	test-mcc:0.477072 
[14]	train-mcc:0.000000	test-mcc:0.476963 
[15]	train-mcc:0.000000	test-mcc:0.476963 
[16]	train-mcc:0.000000	test-mcc:0.477287 
[17]	train-mcc:0.000000	test-mcc:0.476755 
[18]	train-mcc:0.000000	test-mcc:0.476963 
[19]	train-mcc:0.000000	test-mcc:0.476963 
[20]	train-mcc:0.000000	test-mcc:0.478119 
[21]	train-mcc:0.000000	test-mcc:0.478119 
[22]	train-mcc:0.000000	test-mcc:0.478119 
[23]	train-mcc:0.000000	test-mcc:0.478119 
[24]	train-mcc:0.000000	test-mcc:0.478119 
[25]	train-mcc:0.000000	test-mcc:0.477909 
[26]	train-mcc:0.000000	test-mcc:0.477740 
[27]	train-mcc:0.000000	test-mcc:0.477740 
[28]	train-mcc:0.000000	test-mcc:0.477740 
[29]	train-mcc:0.000000	test-mcc:0.478224 
[30]	train-mcc:0.000000	test-mcc:0.478025 
[31]	train-mcc:0.000000	test-mcc:0.477172 
[32]	train-mcc:0.000000	test-mcc:0.477587 
[33]	train-mcc:0.000000	test-mcc:0.477909 
[34]	train-mcc:0.000000	test-mcc:0.477273 
[35]	train-mcc:0.000000	test-mcc:0.477025 
[36]	train-mcc:0.000000	test-mcc:0.477025 
[37]	train-mcc:0.000000	test-mcc:0.477025 
[38]	train-mcc:0.000000	test-mcc:0.477025 
[39]	train-mcc:0.000000	test-mcc:0.476547 
[40]	train-mcc:0.000000	test-mcc:0.476547 
[41]	train-mcc:0.000000	test-mcc:0.477025 
[42]	train-mcc:0.000000	test-mcc:0.477706 
[43]	train-mcc:0.000000	test-mcc:0.477706 
[44]	train-mcc:0.000000	test-mcc:0.476002 
[45]	train-mcc:0.000000	test-mcc:0.476002 
[46]	train-mcc:0.000000	test-mcc:0.475212 
[47]	train-mcc:0.000000	test-mcc:0.475212 
[48]	train-mcc:0.000000	test-mcc:0.474842 
[49]	train-mcc:0.000000	test-mcc:0.474778 
[50]	train-mcc:0.000000	test-mcc:0.474778 
[51]	train-mcc:0.000000	test-mcc:0.476988 
[52]	train-mcc:0.000000	test-mcc:0.476988 
[53]	train-mcc:0.000000	test-mcc:0.476473 
[54]	train-mcc:0.000000	test-mcc:0.475673 
[55]	train-mcc:0.000000	test-mcc:0.475673 
[56]	train-mcc:0.000000	test-mcc:0.474937 
[57]	train-mcc:0.000000	test-mcc:0.476033 
[58]	train-mcc:0.000000	test-mcc:0.475673 
[59]	train-mcc:0.000000	test-mcc:0.475673 
Stopping. Best iteration:
[29]	train-mcc:0.000000	test-mcc:0.478224


Time: Thu Nov 10 2016 12:17:04 PM
For 0029 rounds: train_mcc: 0 - test_mcc: 0.4782236
Confusion matrix:
     truth
preds      0      1
    0 235271    978
    1    102    398
     truth
preds           0           1
    0 0.993757101 0.004130957
    1 0.000430836 0.001681105
Iteration 41 (base=0.07145179): MCC=0.4782236 | threshold=0.4402349



Iteration 41[3] on Thu Nov 10 2016 12:17:06 PM

depth=5, min_child_weight=10.95071, subsample=0.9616755, colsample_bytree=0.5537064, base_score=0.07145179
[1]	train-mcc:0.000000	test-mcc:0.483235 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.486138 
[3]	train-mcc:0.000000	test-mcc:0.486655 
[4]	train-mcc:0.000000	test-mcc:0.486391 
[5]	train-mcc:0.000000	test-mcc:0.488566 
[6]	train-mcc:0.000000	test-mcc:0.487963 
[7]	train-mcc:0.000000	test-mcc:0.488229 
[8]	train-mcc:0.000000	test-mcc:0.489104 
[9]	train-mcc:0.000000	test-mcc:0.488566 
[10]	train-mcc:0.000000	test-mcc:0.488075 
[11]	train-mcc:0.000000	test-mcc:0.488379 
[12]	train-mcc:0.000000	test-mcc:0.489075 
[13]	train-mcc:0.000000	test-mcc:0.489075 
[14]	train-mcc:0.000000	test-mcc:0.488533 
[15]	train-mcc:0.000000	test-mcc:0.489926 
[16]	train-mcc:0.000000	test-mcc:0.489500 
[17]	train-mcc:0.000000	test-mcc:0.489500 
[18]	train-mcc:0.000000	test-mcc:0.490781 
[19]	train-mcc:0.000000	test-mcc:0.488960 
[20]	train-mcc:0.000000	test-mcc:0.488960 
[21]	train-mcc:0.000000	test-mcc:0.490621 
[22]	train-mcc:0.000000	test-mcc:0.490621 
[23]	train-mcc:0.000000	test-mcc:0.491640 
[24]	train-mcc:0.000000	test-mcc:0.492085 
[25]	train-mcc:0.000000	test-mcc:0.492420 
[26]	train-mcc:0.000000	test-mcc:0.492381 
[27]	train-mcc:0.000000	test-mcc:0.492938 
[28]	train-mcc:0.000000	test-mcc:0.493195 
[29]	train-mcc:0.000000	test-mcc:0.493632 
[30]	train-mcc:0.000000	test-mcc:0.493169 
[31]	train-mcc:0.000000	test-mcc:0.492828 
[32]	train-mcc:0.000000	test-mcc:0.492599 
[33]	train-mcc:0.000000	test-mcc:0.493199 
[34]	train-mcc:0.000000	test-mcc:0.493090 
[35]	train-mcc:0.000000	test-mcc:0.493090 
[36]	train-mcc:0.000000	test-mcc:0.493090 
[37]	train-mcc:0.000000	test-mcc:0.493090 
[38]	train-mcc:0.000000	test-mcc:0.493090 
[39]	train-mcc:0.000000	test-mcc:0.493114 
[40]	train-mcc:0.000000	test-mcc:0.493114 
[41]	train-mcc:0.000000	test-mcc:0.493821 
[42]	train-mcc:0.000000	test-mcc:0.493129 
[43]	train-mcc:0.000000	test-mcc:0.493129 
[44]	train-mcc:0.000000	test-mcc:0.493556 
[45]	train-mcc:0.000000	test-mcc:0.494414 
[46]	train-mcc:0.000000	test-mcc:0.493394 
[47]	train-mcc:0.000000	test-mcc:0.492936 
[48]	train-mcc:0.000000	test-mcc:0.493631 
[49]	train-mcc:0.000000	test-mcc:0.492274 
[50]	train-mcc:0.000000	test-mcc:0.492306 
[51]	train-mcc:0.000000	test-mcc:0.492864 
[52]	train-mcc:0.000000	test-mcc:0.492855 
[53]	train-mcc:0.000000	test-mcc:0.493294 
[54]	train-mcc:0.000000	test-mcc:0.493294 
[55]	train-mcc:0.000000	test-mcc:0.493294 
[56]	train-mcc:0.000000	test-mcc:0.493236 
[57]	train-mcc:0.000000	test-mcc:0.492969 
[58]	train-mcc:0.000000	test-mcc:0.492545 
[59]	train-mcc:0.000000	test-mcc:0.492514 
[60]	train-mcc:0.000000	test-mcc:0.492159 
[61]	train-mcc:0.000000	test-mcc:0.492159 
[62]	train-mcc:0.000000	test-mcc:0.492159 
[63]	train-mcc:0.000000	test-mcc:0.492159 
[64]	train-mcc:0.000000	test-mcc:0.492597 
[65]	train-mcc:0.000000	test-mcc:0.492597 
[66]	train-mcc:0.000000	test-mcc:0.492418 
[67]	train-mcc:0.000000	test-mcc:0.492855 
[68]	train-mcc:0.000000	test-mcc:0.492159 
[69]	train-mcc:0.000000	test-mcc:0.492159 
[70]	train-mcc:0.000000	test-mcc:0.491265 
[71]	train-mcc:0.000000	test-mcc:0.491584 
[72]	train-mcc:0.000000	test-mcc:0.491160 
[73]	train-mcc:0.000000	test-mcc:0.491853 
[74]	train-mcc:0.000000	test-mcc:0.491430 
[75]	train-mcc:0.000000	test-mcc:0.491430 
Stopping. Best iteration:
[45]	train-mcc:0.000000	test-mcc:0.494414


Time: Thu Nov 10 2016 12:18:56 PM
For 0045 rounds: train_mcc: 0 - test_mcc: 0.4944144
Confusion matrix:
     truth
preds      0      1
    0 235236    932
    1    138    444
     truth
preds            0            1
    0 0.9936050686 0.0039366420
    1 0.0005828933 0.0018753960
Iteration 41 (base=0.07145179): MCC=0.4944144 | threshold=0.335442



Iteration 41[4] on Thu Nov 10 2016 12:18:57 PM

depth=5, min_child_weight=10.95071, subsample=0.9616755, colsample_bytree=0.5537064, base_score=0.07145179
[1]	train-mcc:0.000000	test-mcc:0.482465 
Multiple eval metrics are present. Will use test_mcc for early stopping.
Will train until test_mcc hasn't improved in 30 rounds.

[2]	train-mcc:0.000000	test-mcc:0.488460 
[3]	train-mcc:0.000000	test-mcc:0.485481 
[4]	train-mcc:0.000000	test-mcc:0.485811 
[5]	train-mcc:0.000000	test-mcc:0.484431 
[6]	train-mcc:0.000000	test-mcc:0.485810 
[7]	train-mcc:0.000000	test-mcc:0.486525 
[8]	train-mcc:0.000000	test-mcc:0.486846 
[9]	train-mcc:0.000000	test-mcc:0.487131 
[10]	train-mcc:0.000000	test-mcc:0.487490 
[11]	train-mcc:0.000000	test-mcc:0.486525 
[12]	train-mcc:0.000000	test-mcc:0.487823 
[13]	train-mcc:0.000000	test-mcc:0.487823 
Timing stopped at: 2506.55 14.39 270.23 
