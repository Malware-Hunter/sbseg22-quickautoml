# sbseg22-quickautoml

Repositório para manter códigos de experimentos de ferramentas de AutoML para a SBSEG22.

## Como instalar 
- Instale o [docker](https://docs.docker.com/engine/install/) em sua máquina. 

## Como rodar

Crie uma image docker com os ambientes virtuais preparados para a execução dos testes das ferramentas:
```
docker build . -t=automl
```

Pronto, agora você pode rodar os testes a partir do script `docker_run.sh`:

```
./docker_run.sh <output-dir> <run_script.sh> <dataset1> <dataset2> ... <datasetN>

## [IMPORTANTE]:    <output-dir> deve ser um caminho absoluto para um diretório na máquina host onde os resultados serão salvos. 
##                  Se o diretório não existir, ele será criado
```