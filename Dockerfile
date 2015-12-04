FROM ubuntu:14.04
MAINTAINER james.kirk84@gmail.com

RUN apt-get update -y && \
    apt-get install -y software-properties-common ansible sshpass

