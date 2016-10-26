# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
from operator import itemgetter

import os

import operator


datadir = '../input/'

    
###########################################################################
#
#
###########################################################################

print("read train")
train = pd.read_csv("../input/train_date_v3.csv.gz")
print(train.shape)
print("max with max")
liste1=train.filter(like='max').columns
liste2=train.filter(like='max').columns
df = pd.DataFrame(train['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = train[j] - train[i]    
print("saving")
df.to_csv(os.path.join(datadir,'train_max_max.csv'))

print("min with max")
liste1=train.filter(like='min').columns
liste2=train.filter(like='max').columns
df = pd.DataFrame(train['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = train[j] - train[i]    
print("saving")
df.to_csv(os.path.join(datadir,'train_min_max.csv'))

print("min with min")
liste1=train.filter(like='min').columns
liste2=train.filter(like='min').columns
df = pd.DataFrame(train['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = train[j] - train[i]    
print("saving")
df.to_csv(os.path.join(datadir,'train_min_min.csv'))

#####################################################################
################ same thing for test
#####################################################################
print("read test")
test = pd.read_csv("../input/test_date_v3.csv.gz")
print(test.shape)
print("max with max")
liste1=test.filter(like='max').columns
liste2=test.filter(like='max').columns
df = pd.DataFrame(test['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = test[j] - test[i]    
print("saving")
df.to_csv(os.path.join(datadir,'test_max_max.csv'))

print("min with max")
liste1=test.filter(like='min').columns
liste2=test.filter(like='max').columns
df = pd.DataFrame(test['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = test[j] - test[i]    
print("saving")
df.to_csv(os.path.join(datadir,'test_min_max.csv'))

print("min with min")
liste1=test.filter(like='min').columns
liste2=test.filter(like='min').columns
df = pd.DataFrame(test['Id'])
for i in liste1:
  print(i)
  for j in liste2:
     if i != j :
          col = str(j) + '_'  + str(i)
          df[col] = test[j] - test[i]    
print("saving")
df.to_csv(os.path.join(datadir,'test_min_min.csv'))
