FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    software-properties-common \
    vim

RUN apt-add-repository ppa:ansible/ansible

RUN apt-get update && apt-get install -y \
    python-pip \
    ansible

ENV EDITOR vim

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

VOLUME /opt/ansible
WORKDIR /opt/ansible

CMD /bin/bash
