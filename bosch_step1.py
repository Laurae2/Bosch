# -*- coding: utf-8 -*-
"""
Created on Tue Aug 23 13:10:56 2016
"""

import pandas as pd
import numpy as np


import os

datadir = '../input/'

    
def prepare_df(train_dt):
    station_dict = {'S0_','S1_','S2_','S3_','S4_','S5_','S6_','S7_','S8_','S9_','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21','S22','S23','S24','S25','S26','S27','S28','S29','S30','S31','S32','S33','S34','S35','S36','S37','S38','S39','S40','S41','S42','S43','S44','S45','S46','S47','S48','S49','S50','S51'}
    L_dict = {'L0','L1','L2','L3'}
    dt = pd.DataFrame(train_dt['Id'])
    station_dict = {}
    for ST in station_dict:
      #print(ST)
      col = ST +'_num_null'
      dt[col]=train_dt.filter(like=ST).apply(lambda x: sum(x.isnull().values), axis = 1) # For rows
      col = ST +'count'     
      dt[col]=train_dt.filter(like=ST).count(axis=1)
      col = ST +'kurt'     
      dt[col]=train_dt.filter(like=ST).kurt(axis=1,skipna=True)
      col = ST +'mad'     
      dt[col]=train_dt.filter(like=ST).mad(axis=1,skipna=True)
      col = ST +'max'     
      dt[col]=train_dt.filter(like=ST).max(axis=1,skipna=True)
      col = ST +'mean'     
      dt[col]=train_dt.filter(like=ST).mean(axis=1,skipna=True)
      col = ST +'min'     
      dt[col]=train_dt.filter(like=ST).min(axis=1,skipna=True)

    for L in L_dict:
      print(L)
      col = L +'_num_null'
      dt[col]=train_dt.filter(like=L).apply(lambda x: sum(x.isnull().values), axis = 1) # For rows
      col = L +'count'     
      dt[col]=train_dt.filter(like=L).count(axis=1)
      col = L +'kurt'     
      dt[col]=train_dt.filter(like=L).kurt(axis=1)
      col = L +'mad'     
      dt[col]=train_dt.filter(like=L).mad(axis=1)
      col = L +'max'     
      dt[col]=train_dt.filter(like=L).max(axis=1)
      col = L +'mean'     
      dt[col]=train_dt.filter(like=L).mean(axis=1)
      col = L +'min'     
      dt[col]=train_dt.filter(like=L).min(axis=1)

    return dt

    
###########################################################################
#
#
###########################################################################
    
if 1 :
  print("lecture date")  
  train_dt = pd.read_csv(os.path.join(datadir,'train_date.csv.gz'))
  print("prepare_df(train_dt)")
  df = prepare_df(train_dt)
  print("saving")
  df.to_csv(os.path.join(datadir,'train_date_v3.csv'))
  del df,train_dt
  print("lecture date test_dt") 
  test_dt = pd.read_csv(os.path.join(datadir,'test_date.csv.gz'))
  print("prepare_df(test_dt)")
  df = prepare_df(test_dt)
  print("saving")
  df.to_csv(os.path.join(datadir,'test_date_v3.csv'))
  del df,test_dt
  print("lecture num")
  train_num = pd.read_csv(os.path.join(datadir,'train_numeric.csv.gz'))
  print("prepare_df(train_num)")
  df = prepare_df(train_num)
  print("saving")
  df.to_csv(os.path.join(datadir,'train_numeric_v3.csv'))
  del df,train_num
  print("read(test_num)")
  test_num  = pd.read_csv(os.path.join(datadir,'test_numeric.csv.gz'))
  print("prepare_df test_num")
  df = prepare_df(test_num)
  print("saving")
  df.to_csv(os.path.join(datadir,'test_numeric_v3.csv'))
  del df,test_num

