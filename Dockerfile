FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
	python3.8 \
	python3-pip \
	python3.8-venv \
	git \
	vim

WORKDIR /home/automl

COPY build.sh run.sh *.py *.csv ./

COPY datasets/ ./

RUN ./build.sh
