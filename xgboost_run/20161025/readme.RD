    params = {}
    params['objective'] = "binary:logistic"
    params['eta'] = 0.05
    params['max_depth'] = 8
    params['colsample_bytree'] = 0.8
    # params['min_child_weight'] = 3
    params['subsample'] = 0.8
    params['base_score'] = 0.007
    params['eval_metric'] = "auc"
    params['verbose'] = 10
    params['silent'] = True
    params['seed'] = 2016
    
    
the xgb: 0.467965244117
the rf: 0.479353360086
the xgb,rf: 0.4799120721
