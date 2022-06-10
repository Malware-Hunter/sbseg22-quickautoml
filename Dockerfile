FROM ubuntu:20.04

RUN apt-get update -q && apt-get install -y -q \
        python3.8 \
        python3-pip \
        python3.8-venv \
        git \
        vim \
	unzip \
	unrar

WORKDIR /main

COPY *.sh *.py ./
COPY datasets ./datasets
RUN ./setup_datasets.sh

RUN ./build.sh

RUN mkdir results
