FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
	python3.8 \
	python3-pip \
	python3.8-venv \
	git \
	vim 

WORKDIR /home/automl

ADD docker_install.sh /docker_install.sh
RUN /docker_install.sh
RUN useradd -s /bin/bash --home-dir /home/automl automl
COPY ssh_key_docker_automl.pub /home/automl/.ssh/authorized_keys
RUN chown -R automl:automl /home/automl
RUN chmod 600 /home/automl/.ssh/authorized_keys

COPY *.sh *.py *.csv ./

RUN mkdir -p ./datasets

COPY datasets/ ./datasets/

RUN ./build.sh

EXPOSE 22

CMD ["/home/automl/docker_init.sh"]
