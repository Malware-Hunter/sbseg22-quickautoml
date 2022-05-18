# ver instalação
# http://epistasislab.github.io/tpot/using/

from tpot import TPOTClassifier
from sklearn.metrics import *
from sklearn.model_selection import train_test_split
import pandas as pd
import timeit

dataset_df = pd.read_csv('DrebinDatasetPermissoes.csv', encoding='utf8')
y = dataset_df['class']
X = dataset_df.drop(['class'], axis=1)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=1)
start_time = timeit.default_timer()
tpot = TPOTClassifier(generations=5, population_size=20, verbosity=2,
                      config_dict='TPOT light')
tpot.fit(X_train, y_train)
print(tpot.score(X_test, y_test))
tpot.export('tpot_drebin_pipeline.py')
predictions = tpot.predict(X_test)
m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)
print("Accuracy score:", accuracy_score(y_test, predictions))
print("Precision:", precision_score(y_test, predictions))
print("Recall:", recall_score(y_test, predictions))
print("F1_score:", f1_score(y_test, predictions))
print('Tempo', time_str)
