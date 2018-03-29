FROM ubuntu:latest

RUN apt -y update && apt -y upgrade
RUN apt -y install vim git

RUN add-apt-repository ppa:gophers/archive
RUN apt -y update
RUN apt install golang-1.10-go
