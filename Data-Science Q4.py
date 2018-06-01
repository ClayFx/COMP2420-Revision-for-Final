import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.neighbors import KNeighborsClassifier, KNeighborsRegressor
from scipy.stats import ttest_ind, ttest_rel, ttest_1samp
from sklearn.preprocessing import scale
from sklearn.metrics import make_scorer, accuracy_score, r2_score, mean_squared_error
from sklearn.tree import DecisionTreeClassifier
plt.style.use('seaborn-notebook')
## inline figures

import os
## just to make sure few warnings are not shown
import warnings
warnings.filterwarnings("ignore")

# >### a)
# >Load data into a pandas dataframe named bike_shares. The file to be read is `data/capitalbikeshare-tripdata.csv`. You might need to change datatypes of few columns. Please justify your choice.
# Briefly describe this data by looking at summary of different fields.

bike_shares = pd.read_csv('data/capitalbikeshare-tripdata.csv',sep = '|')
bike_shares['Start date'] = pd.to_datetime(bike_shares['Start date'])
bike_shares['End date'] = pd.to_datetime(bike_shares['End date'])
print (bike_shares.head())

# b)
# Which are 5 most popular stations, give both name and number?
# Popularity is defined by the total number of trips that either start or end at a particular station.
pop_start = pd.DataFrame(data = bike_shares['Start station'].value_counts().reset_index())
pop_end = pd.DataFrame(data = bike_shares['End station'].value_counts().reset_index())
popularity = pd.merge(pop_start,pop_end, on='index',how='outer')
popularity['total'] = popularity['Start station'] + popularity['End station']
popularity = popularity.sort_values(by='total',ascending=False).reset_index(drop=True)
result = popularity.head(5)
output = result[['index','total']]
output.columns = ['Station name','Number']
# print(output)

# c)
# Find the bike that has been on road for longest period
bike = bike_shares.groupby('Bike number').Duration.sum().reset_index()
resultC = bike.sort_values(by='Duration',ascending=False).reset_index(drop=True)
# print(resultC.head(1))

# d)

mems = bike_shares[bike_shares['Member type'] == 'Member']['Duration']
casu = bike_shares[bike_shares['Member type'] == 'Casual']['Duration']
print(ttest_ind(casu,mems, axis=0, equal_var=True, nan_policy='propagate'))

# e)
# Visualize the duration of trips starting from the 8 most popular stations.
# Popularity is defined by the total number of trips that either start or end at a particular station
# popularity_8 = popularity.head(8)
# X = popularity_8['index']
# Station = bike_shares.groupby('Bike number').Duration.sum().reset_index()
#
# plt.figure(figsize=(10,8))
# ax = plt.subplot(111)
# ax.scatter(diab.BMI, diab.Y)
# ax.set_xlabel("BMI of the Patient", fontsize=22)
# ax.set_ylabel("Disease Progression",fontsize=22)
# ax.set_title("Relationship between BMI and Disease Progression",fontsize=24)
# ax.set_xticklabels(ax.get_xticks(),fontsize=14)
# ax.set_yticklabels(ax.get_yticks(),fontsize=14)
# sns.despine()
