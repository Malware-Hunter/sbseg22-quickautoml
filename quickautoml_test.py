from quickautoml.main import make_classifier
from sklearn.metrics import *
from sklearn.model_selection import train_test_split
import pandas as pd
import timeit

dataset_df = pd.read_csv('DrebinDatasetPermissoes.csv', encoding='utf8')

start_time = timeit.default_timer()
estimator = make_classifier()
data = estimator.prepare_data(dataset_df)

y = data['class']
X = data.drop(['class'], axis=1)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=1)

estimator.fit(X_train, y_train)
print(estimator.best_model.estimator.score(X_test, y_test))
predictions = estimator.predict(X_test)
m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)
print("Accuracy score:", accuracy_score(y_test, predictions))
print("Precision:", precision_score(y_test, predictions))
print("Recall:", recall_score(y_test, predictions))
print("F1_score:", f1_score(y_test, predictions))
print('Tempo', time_str)
