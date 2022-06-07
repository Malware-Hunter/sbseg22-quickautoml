# sbseg22-quickautoml

Repositório para manter códigos de experimentos de ferramentas de AutoML para a SBSEG22.

## Como instalar 
- Instale o [docker](https://docs.docker.com/engine/install/) em sua máquina. 

- Habilite a opção `buildkit` no arquivo `/etc/docker/daemon.json` (crie-o se não existir):
```
{ "features": { "buildkit": true } }
```

## Como rodar

Para rodar o teste com uma ferramenta sobre os datasets do diretório `datasets`, substitua os parâmetros e use o seguinte comando:
```
## PARÂMETROS:
## <output_dir> -- diretório para salvar resultados na máquina host (não no container)
## <tool>       -- "all" para rodar todas as ferramentas em paralelo no container ou apenas uma delas: "quick","auto_gluon", "auto_sklearn" ou "tpot".

## COMANDO:
docker build -o <output_dir> . --build-arg tool=<tool>
```
