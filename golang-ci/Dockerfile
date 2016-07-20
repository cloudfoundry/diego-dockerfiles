FROM ubuntu:14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

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

# install Go 1.6.3
RUN \
  wget -qO- https://storage.googleapis.com/golang/go1.6.3.linux-amd64.tar.gz | tar -C /usr/local -xzf -
