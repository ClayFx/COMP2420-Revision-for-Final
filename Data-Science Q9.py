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

## just to make sure few warnings are not shown
import warnings
warnings.filterwarnings("ignore")


### Do not edit this cell
diab = pd.read_csv('data/diabetes.tab.txt', delimiter='\t')
print(diab.describe())
diab =  diab.iloc[np.random.permutation(len(diab))]
diab_train = diab.head(300)
diab_test = diab.tail(142)

# Q1
# a)
# Build a linear regression model to predict Y by using diab_train as training data and diab_test as testing data.
# Report your test error along with coefficients of your model.
# You should use all the features while building your model.
X_train = diab_train[['AGE', 'SEX', 'BMI', 'BP', 'S1', 'S2','S2', 'S3', 'S4', 'S5', 'S6']]
Y_train = diab_train[['Y']]
X_test = diab_test[['AGE', 'SEX', 'BMI', 'BP', 'S1', 'S2','S2', 'S3', 'S4', 'S5', 'S6']]
Y_test = diab_test[['Y']]
lm = LinearRegression()
lm.fit(X_train, Y_train)

print("Fit a model X_train, and calculate MSE with Y_train:", np.mean((Y_train - lm.predict(X_train)) ** 2))
print("Fit a model X_train, and calculate MSE with X_test, Y_test:", np.mean((Y_test - lm.predict(X_test)) ** 2))
