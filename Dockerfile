FROM ubuntu:latest

USER root
WORKDIR /root

RUN apt update && \
  apt install -y curl unzip vim

RUN curl -L -s -o dw.zip https://github.com/mulesoft-labs/data-weave-native/releases/download/v1.0.9/dw-1.0.9-Linux.zip && \
  mkdir .dw && \
  unzip dw.zip -d .dw/ && \
  rm dw.zip

RUN echo "\nexport PATH=/root/.dw/bin:$PATH export DW=$HOME/.dw/bin/dw\n" >> $HOME/.bashrc