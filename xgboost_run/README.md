Detailed:

| Date | Model | Data | Parameters | Rounds | Train(M/SD) | Test(M/SD) | LB |
| :---: | --- | --- | --- | :---: | :---: | :---: | :---: |
| yes | yes | yes | yes | yes | yes | yes | yes |
| 10/09/2016 | 20161009 <br> xgb<br>date<br>duplicates.R | Mini num <br> Mini cat <br> Date 0927 <br> Dupped <br> ƒt=NA <br> ƒr=NA <br> ƒe=NA | CV = 5-fold <br> Eta = 0.05 <br> Depth = 10 | NA <br> NA <br> NA <br> NA <br> NA | AUC <br> f1 0.907041 <br> f2 0.905561 <br> f3 0.919708 <br> f4 0.910635 <br> f5 0.904266 | AUC <br> f1 0.903859 <br> f2 0.905561 <br> f3 0.911474 <br> f4 0.908101 <br> f5 0.903043 <br> <br> MCC <br> f1 0.4359931 <br> f2 0.4176268 <br> f3 0.4076849 <br> f4 0.424236 <br> f5 0.4150251 | 1 0.42702 <br> |



* 1 = average
* 2 = vote
* 5 = vote by 1 needed only
* 4+n = vote by n needed only (6=2, 7=3, 8=4, 9=5)
* 3 = hybrid (average + vote, if 1 says yes then yes)
* 4 = hybrid (average + vote, if 1 says yes then no)

Summary:

| Date | Name | Output |
| --- | --- | --- ||
| 10/09/2016 | predictions from fold| MCC: MCC: 0.4201132 + 0.01067357, **LB: 0.42702** |
| 10/10/2016 | predictions from fold| MCC: MCC: 0.4206768 + 0.01863066, **LB: 0.43080** |
| 10/10/2016 | train on the whole dataset and use the cv best mcc as the treshold| MCC: MCC: 0.4206768 + 0.01863066, **LB: 0.43080** |
