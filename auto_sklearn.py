# -*- encoding: utf-8 -*-
#https://automl.github.io/auto-sklearn/master/
#pip install auto-sklearn
"""
==============
Classification
==============

The following example shows how to fit a simple classification model with
*auto-sklearn*.
"""
from pprint import pprint
import timeit
import sklearn.datasets
import sklearn.metrics
import pandas as pd
import autosklearn.classification


############################################################################
# Carrega o Dataset
# ============

dataset_df = pd.read_csv('DrebinDatasetPermissoes.csv', encoding = 'utf8')
y = dataset_df['class']
X = dataset_df.drop(['class'], axis=1)
X_train, X_test, y_train, y_test = \
    sklearn.model_selection.train_test_split(X, y, test_size=0.33, random_state=1)

############################################################################
# Construir e ajusta um classificador
# ==========================
start_time = timeit.default_timer()

automl = autosklearn.classification.AutoSklearnClassifier(
    time_left_for_this_task=120,
    per_run_time_limit=30,
    tmp_folder='/tmp/autosklearn_classification_example_tmp',
)
automl.fit(X_train, y_train, dataset_name='Drebin_215_Permissoes')

############################################################################
# Mostra os modelos encontrados pelo auto-sklearn
# =====================================

automl.leaderboard()

############################################################################
# Imprime o conjunto final construído pelo auto-sklearn
# ====================================================

#pprint(automl.show_models(), indent=4)

###########################################################################
# Obtenha a Metricas do conjunto final
# ===================================

predictions = automl.predict(X_test)
m, s = divmod(timeit.default_timer() - start_time, 60)
h, m = divmod(m, 60)
time_str = "%02d:%02d:%02d" % (h, m, s)
print("auto-sklearn")
print("Accuracy score:", sklearn.metrics.accuracy_score(y_test, predictions))
print("Precision:", sklearn.metrics.precision_score(y_test, predictions))
print("Recall:", sklearn.metrics.recall_score(y_test, predictions))
print("F1_score:", sklearn.metrics.f1_score(y_test, predictions))
print('Tempo',time_str)

