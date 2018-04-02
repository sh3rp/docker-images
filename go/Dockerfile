FROM ubuntu:latest

RUN apt -y update && apt -y upgrade
RUN apt -y install curl python-pip vim git software-properties-common python-software-properties

RUN add-apt-repository ppa:gophers/archive
RUN apt -y update
RUN apt -y install golang-1.10-go

RUN mkdir /root/go

ENV PATH $PATH:/usr/lib/go-1.10/bin
ENV GOPATH /root/go
ENV GOROOT /usr/lib/go-1.10
ENV PATH $PATH:/root/go/bin

RUN ln -s /usr/lib/go-1.10 /usr/local/go

RUN cd /root
RUN git clone https://github.com/sh3rp/settings /root/settings
RUN echo "\n\nsource /root/settings/unix/.bashrc" >> /root/.bashrc