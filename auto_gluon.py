import sklearn.metrics
import pandas as pd
import timeit
from autogluon.tabular import TabularDataset, TabularPredictor
from sklearn.model_selection import train_test_split 
from datetime import datetime
import sys
from os.path import exists, basename

def parse_dataset():
    if(not exists(sys.argv[1])):
        print("Can't find dataset:", sys.argv[1])
        sys.exit(1)
    return sys.argv[1]
dataset_file_path = parse_dataset()
dataset_name = basename(dataset_file_path)

dataset_df = pd.read_csv(dataset_file_path, encoding = 'utf8')
df_train,df_test=train_test_split(dataset_df,test_size=0.33,random_state=1)
test_data=df_test.drop(['class'],axis=1)
start_time = timeit.default_timer()
predictor= TabularPredictor(label ='class').fit(train_data = df_train, time_limit=200)
predictor.evaluate(df_test)
m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)

## TO DO: substituir "FALTA CALCULAR" pelo resultado da métrica correspondente

pd.DataFrame({
    "accuracy": "FALTA CALCULAR",
    "precision": "FALTA CALCULAR",
    "recall": "FALTA CALCULAR",
    "f1_score": "FALTA CALCULAR",
    "dataset" : dataset_name,
    "execution_time" : time_str
}, index=[0]).to_csv(f"result-autogluon-{dataset_name}-{datetime.now()}", index=False)
