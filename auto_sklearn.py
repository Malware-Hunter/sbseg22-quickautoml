from pprint import pprint
import timeit
import sklearn.datasets
import sklearn.metrics
import pandas as pd
import autosklearn.classification
import sys
from os.path import exists, basename
from datetime import datetime

def parse_dataset():
    if(not exists(sys.argv[1])):
        print("Can't find dataset:", sys.argv[1])
        sys.exit(1)
    return sys.argv[1]
dataset_file_path = parse_dataset()
dataset_name = basename(dataset_file_path)

dataset_df = pd.read_csv(dataset_file_path, encoding = 'utf8')
y = dataset_df['class']
X = dataset_df.drop(['class'], axis=1)
X_train, X_test, y_train, y_test = \
    sklearn.model_selection.train_test_split(X, y, test_size=0.33, random_state=1)

start_time = timeit.default_timer()
automl = autosklearn.classification.AutoSklearnClassifier(
    time_left_for_this_task=120,
    per_run_time_limit=30,
    tmp_folder='/tmp/autosklearn_classification_example_tmp',
)
automl.fit(X_train, y_train)
automl.leaderboard()
predictions = automl.predict(X_test)

m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)

pd.DataFrame({
    "accuracy": sklearn.metrics.accuracy_score(y_test, predictions),
    "precision": sklearn.metrics.precision_score(y_test, predictions),
    "recall": sklearn.metrics.recall_score(y_test, predictions),
    "f1_score": sklearn.metrics.f1_score(y_test, predictions),
    "dataset" : dataset_name,
    "execution_time" : time_str
}, index=[0]).to_csv(f"result-auto-sklearn-{dataset_name}-{datetime.now()}", index=False)
