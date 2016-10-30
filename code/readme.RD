stacking level1:
feature 1,2 mike's plus Jay's
script: xgb_20161029_jayjay_mike.py
log:xgb_20161029_jayjay_mike.txt

feature 3,4 mike's no numeric, no lead lag
script: xgb_20161029_mike_v1.py
log: xgb_20161029_mike_v1.txt

feature 5,6 mike's no numeric, no lead lag
script: xgb_20161029_mike_v2.py
log: xgb_20161029_mike_v2.txt


feature 7,8 mike's everything including numeric, exclude clustern500, and unique_path variable
script: xgb_20161029_mike_v3.py
log: xgb_20161029_mike_v3.txt


feature 9,10 all jay's feature
script: xgb_20161029_jay.py
log: xgb_20161029_jay.txt


feature 11,12 lauren's feature plus mike's extended leak feature, not magic3,magic4, cluster_n500, and unique_path
script: xgb_20161029_lauren_mike.py
log: xgb_20161029_lauren_mike.txt



feature 13,14 lauren's raw feature 
script: xgb_20161029_lauren.py
log: xgb_20161029_lauren.txt


stacking level2:

lauren's feature + mike's feature + 12 outputs from first layer
