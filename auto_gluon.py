import sklearn.metrics
import pandas as pd
import timeit
from autogluon.tabular import TabularPredictor
from sklearn.model_selection import train_test_split 
import sys
from os.path import exists, basename
from datetime import datetime

def get_current_datetime(format="%Y%m%d%H%M%S"):
    return datetime.now().strftime(format)

def parse_dataset():
    if(not exists(sys.argv[1])):
        print("Can't find dataset:", sys.argv[1])
        sys.exit(1)
    return sys.argv[1]
dataset_file_path = parse_dataset()
dataset_name = basename(dataset_file_path)

dataset_df = pd.read_csv(dataset_file_path, encoding = 'utf8')
df_train,df_test=train_test_split(dataset_df,test_size=0.33,random_state=1)
start_time = timeit.default_timer()
predictor= TabularPredictor(label ='class').fit(train_data = df_train, time_limit=200)
predictions = predictor.predict(df_test, as_pandas=False)

m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)

y_test = df_test['class']
results = pd.DataFrame({
    "accuracy": sklearn.metrics.accuracy_score(y_test, predictions),
    "precision": sklearn.metrics.precision_score(y_test, predictions),
    "recall": sklearn.metrics.recall_score(y_test, predictions),
    "f1_score": sklearn.metrics.f1_score(y_test, predictions),
    "dataset" : dataset_name,
    "execution_time" : time_str
}, index=[0])
results.to_csv(f"result-autogluon-{get_current_datetime()}-{dataset_name}", index=False)
