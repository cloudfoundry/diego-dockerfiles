ARG go_version
ARG sql_flavor

FROM golang:${go_version} AS go_img
FROM ${sql_flavor}

MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV DEBIAN_FRONTEND noninteractive

COPY --from=go_img /usr/local/go /usr/local/go
ENV PATH $PATH:/usr/local/go/bin

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
    lsof \
    psmisc \
    python \
    procps \
    strace \
    wget \
    mercurial \
    unzip

RUN \
  wget -q https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/consul_0.7.0_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/consul_0.7.0_linux_amd64.zip
