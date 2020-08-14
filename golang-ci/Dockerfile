FROM ubuntu:focal
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ARG go_version

ENV HOME /root
ENV GOPATH /root/go
ENV PATH /root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p $GOPATH

# install build dependencies
# - graphviz is for rendering heap w/ pprof
RUN \
  apt-get update && \
  apt-get -y install \
    build-essential \
    curl \
    git \
    graphviz \
    htop \
    libpython-dev \
    lsof \
    psmisc \
    python \
    strace \
    wget \
    mercurial \
  && \
  apt-get clean

# install Go
RUN \
  wget -qO- https://dl.google.com/go/${go_version}.linux-amd64.tar.gz | tar -C /usr/local -xzf -
