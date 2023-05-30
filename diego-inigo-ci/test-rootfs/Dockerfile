FROM ubuntu:jammy

# jq: for stupid simple bash servers
# curl: for hitting test servers
# git: for testing git buildpacks
# fuse: for inigo style vizzini tests
RUN \
  apt-get update && \
  apt-get -y install \
    curl \
    git \
    jq \
    fuse \
    netcat-openbsd \
  && \
  apt-get clean

RUN useradd -m testuser

RUN useradd -m vcap
