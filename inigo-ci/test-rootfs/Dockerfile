FROM ubuntu:bionic

# for stupid simple bash servers
ADD http://stedolan.github.io/jq/download/linux64/jq /bin/jq
RUN chmod +x /bin/jq

# curl: for hitting test servers
# git: for testing git buildpacks
# fuse: for inigo style vizzini tests
RUN \
  apt-get update && \
  apt-get -y install \
    curl \
    git \
    fuse \
  && \
  apt-get clean

RUN useradd -m testuser

RUN useradd -m vcap
