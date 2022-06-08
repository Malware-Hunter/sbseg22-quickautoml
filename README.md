# sbseg22-quickautoml

Repositório para manter códigos de experimentos de ferramentas de AutoML para a SBSEG22.

## Como instalar 
- Instale o [docker](https://docs.docker.com/engine/install/) em sua máquina. 

## Como rodar

Siga os passos a seguir para criar e iniciar um container com os ambientes virtuais preparados para a execução dos testes das ferramentas: 
```
# 1) Crie a imagem:
docker build . -t=automl

# 2) Crie um volume docker (substitua <volume-name> pelo nome desejado)
docker volume create <volume-name>

# 3) Inicie um novo container a partir da image recém criada e entre nele:

docker run -it -v <volume-name>:/home/automl automl bash

# 4) Você deve estar no terminal do container, agora basta executar os testes com os scripts run_<ferramenta>.sh, e.g.:
./run_quick.sh datasets/androcrawl_limpo.csv datasets/motodroid_all.csv

```

Pronto, agora você deve estar no diretório "`/home/automl`" no container. Você pode rodar os testes executando um dos scripts de `run`, e.g.: `./run_quick.sh <dataset1> <dataset2> ... <datasetN>`.
```
