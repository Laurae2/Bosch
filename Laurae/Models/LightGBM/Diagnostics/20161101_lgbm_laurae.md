```r
Fold 1 converged after 33 iterations.
Fold 2 converged after 90 iterations.
Fold 3 converged after 87 iterations.
Fold 4 converged after 112 iterations.
Fold 5 converged after 86 iterations.
Iterations: 81.6 + 29.17705


Fold 1: AUC=0.7102789
Fold 2: AUC=0.7391228
Fold 3: AUC=0.7315784
Fold 4: AUC=0.7314406
Fold 5: AUC=0.7334318
AUC: 0.7291705 + 0.01101192
Average AUC using all data: 0.6775342


Fold 1: MCC=0.1827722 (164 [11.93%] positives), threshold=0.233136
Fold 2: MCC=0.2135526 (543 [39.46%] positives), threshold=0.137113
Fold 3: MCC=0.2360019 (379 [27.54%] positives), threshold=0.277277
Fold 4: MCC=0.2322174 (904 [65.70%] positives), threshold=0.121157
Fold 5: MCC=0.2160894 (667 [48.47%] positives), threshold=0.193399
MCC: 0.2161267 + 0.021054
Positives: 531.4 + 280.8742
Detection Rate: 0.3862092 + 0.2040953
Average MCC on all data (5 fold): 0.2000664, threshold=0.2161267
Average MCC using all data: 0.205747, threshold=0.231627


Submission overfitted threshold on all MCC positives: 0

Submission average validated threshold on all MCC positives: 0

Submission average of overfit+validated threshold positives: 0

Submission with all data overfitted threshold on all MCC positives: 0. Threshold=0.231627

Submission with all data average validated threshold on all MCC positives: 0. Threshold=0.2161267

Submission with all data average of overfit+validated threshold positives: 0. Threshold=0.2238769

Submission with all data by taking the amount of positives of overfitted threshold on all MCC positives: 0. Threshold=0.147614

Submission with all data by taking the amount of positives of average validated threshold on all MCC positives: 0. Threshold=0.147614

Submission with all data by taking the amount of positives of average of overfit+validated threshold positives: 0. Threshold=0.147614

Submission with all data by taking the sum of positives of validated positives: 1185. Threshold=0.110285

Cross-validated used features list (all used features to copy & paste):

c("S33", "S32", "S24.311", "S30", "S29", "S38", "S0", "S12", 
"S36", "S34", "S24.308", "S26", "S1", "S35", "S24.307", "S2", 
"S11", "S27", "S6", "S5", "S3", "S7", "S10", "S24.211", "S4", 
"S13", "S14", "S9", "S16", "S19", "S8", "S17", "S24.306", "S23", 
"S15", "S24.3", "S24.303", "S24.301", "S18", "S24.112", "S24.108", 
"S41", "S22", "S21", "S20", "S47", "S24.31", "S24.309", "S24.305", 
"S48", "S24.304", "S45", "S40", "S25.109", "S24.104", "S50", 
"S24.205", "S24.207", "S25.104", "S25.102", "S25.1", "S24.11", 
"S24.107", "S24.109", "S24.101", "S24.103", "S49", "S25.107", 
"S25.106", "S25.11", "S25.207", "S25.21", "S24.102", "S24.201", 
"S24.209", "S25.225", "S37", "S25.226", "S25.229", "S25.222", 
"S24.111", "S44", "S28", "S43", "S25.105", "S25.101", "S24.106", 
"S25.211", "S25.108", "S39", "S31", "S25.224", "S24.206", "S51", 
"S24.203", "S25.204", "S24.202", "S25.223", "S25.212", "S24.208", 
"S24.21", "S25.23", "S24.2", "S25.203", "S25.227", "S25.205", 
"S25.216", "S25.206", "S25.228", "S25.214", "S25.208", "S25.221", 
"S25.202", "S25.218", "S25.22", "S25.209", "S25.217", "S25.213", 
"S25.215")


Cross-validated multipresence used features list (all used features to copy & paste):

c("S33", "S32", "S24.311", "S30", "S29", "S38", "S0", "S12", 
"S36", "S34", "S24.308", "S26", "S1", "S35", "S24.307", "S2", 
"S11", "S27", "S6", "S5", "S3", "S7", "S10", "S24.211", "S4", 
"S13", "S14", "S9", "S16", "S19", "S8", "S17", "S24.306", "S23", 
"S15", "S24.3", "S24.303", "S24.301", "S18", "S24.112", "S24.108", 
"S41", "S22", "S21", "S20", "S47", "S24.31", "S24.309", "S24.305", 
"S48", "S24.304", "S45", "S40", "S25.109", "S24.104", "S50", 
"S24.205", "S24.207", "S25.104", "S25.102", "S25.1", "S24.11", 
"S24.107", "S24.109", "S24.101", "S24.103", "S49", "S25.107", 
"S25.106", "S25.11", "S25.207", "S25.21", "S24.102", "S24.201", 
"S24.209", "S25.225", "S37", "S25.226", "S25.229", "S25.222", 
"S24.111", "S44", "S28", "S43", "S25.105", "S25.101", "S24.106", 
"S25.211", "S25.108", "S39", "S31", "S25.224", "S24.206", "S51", 
"S24.203", "S25.204", "S24.202", "S25.223", "S25.212")


See the screenshots for more accuracy about the gain


