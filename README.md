# sbseg22-quickautoml

Repositório para manter códigos de experimentos de ferramentas de AutoML para a SBSEG22.

## Como rodar os testes

Após instalar o [docker](https://docs.docker.com/engine/install/) em sua máquina, siga os passos a seguir para criar e iniciar um container com os ambientes virtuais preparados para a execução dos testes das ferramentas: 
```
# 1) Crie a imagem:
docker build . -t=automl

# 2) Inicie um novo container a partir da image recém criada e entre nele:
docker run -it automl bash
```

Pronto, agora você deve estar no diretório "`/home/automl`" no container. Você pode rodar os testes executando o script `run.sh`, e.g.: `./run.sh <dataset1> <dataset2> ... <datasetN>`.
