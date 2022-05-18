# First install package from terminal:
# pip install -U pip
# pip install -U setuptools wheel
#pip install autogluon 
#https://auto.gluon.ai/stable/index.html

import sklearn.metrics
import pandas as pd
import timeit
from autogluon.tabular import TabularDataset, TabularPredictor
from sklearn.model_selection import train_test_split 
dataset_df = pd.read_csv('DrebinDatasetPermissoes.csv', encoding = 'utf8')
df_train,df_test=train_test_split(dataset_df,test_size=0.33,random_state=1)
test_data=df_test.drop(['class'],axis=1)
start_time = timeit.default_timer()
predictor= TabularPredictor(label ='class').fit(train_data = df_train, time_limit=200)
predictor.evaluate(df_test)
m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)
print('Tempo',time_str)
