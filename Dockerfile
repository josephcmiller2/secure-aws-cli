#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:22.04

RUN \
  mkdir /shared && \
  apt-get update && \
  apt-get install -y gnupg wget software-properties-common

RUN \
  apt-get install -y snapd pulseaudio

ENV TZ=America/Denver
ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y vim screen unzip uidmap rsyslog

RUN \
  cd /root && \
  wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

RUN \
  apt-get update && \
  apt-get install -y mandoc gpg less

COPY files/startcontainer.sh /usr/bin/startcontainer.sh
COPY files/subuid /etc/subuid
COPY files/subgid /etc/subgid

# Set environment variables
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
