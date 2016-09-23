# -*- coding: utf-8 -*-
"""
Created on Wed Sep 21 11:31:13 2016

@author: joostbloom
"""
import pickle
import os
import c
import re

import pandas as pd
import numpy as np

def load_data_file(f):
    with open(os.path.join(c.BASE_PATH,f + '.pkl'),'rb') as f:
        print('Returning {}'.format(f))
        return pickle.load(f)
        
def get_columns_csv(csv_file):
    ''' gets data columns for csv file identifier '''
    cols = list(pd.read_csv(os.path.join(c.BASE_PATH, csv_file + '.csv'), 
                              nrows=1,
                              index_col=0,
                             dtype=np.float32).columns)
    #print cols
    
    if 'Response' in cols:
        cols.remove('Response')
    
    
    return cols

def col_name_to_station_info(col_names):
    return [[int(i) for i in re.findall(r'\d+', col_name)] for col_name in col_names]

def get_station_info(csv_file):
    ''' extracts line and station info from list of columns '''
    
    cols = get_columns_csv(csv_file)
    
    station_info = [[int(i) for i in re.findall(r'\d+', col_name)] for col_name in cols]
    station_info = pd.DataFrame(station_info, columns=['line', 'station', 'feature_nr'])
    
    return station_info