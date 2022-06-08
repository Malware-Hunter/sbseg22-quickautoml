FROM ubuntu:20.04 as main-stage

RUN apt-get update && apt-get install -y \
        python3.8 \
        python3-pip \
        python3.8-venv \
        git \
        vim \
	unzip \
	unrar

WORKDIR /automl

COPY *.sh *.py ./

RUN mkdir -p ./datasets

COPY datasets/ ./datasets/

ARG tool="all"
RUN ./build.sh
RUN ./run_${tool}.sh

FROM scratch AS export-stage
COPY --from=main-stage /automl/result*.csv .
