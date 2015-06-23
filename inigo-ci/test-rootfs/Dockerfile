FROM ubuntu:14.04

# for stupid simple bash servers
ADD http://stedolan.github.io/jq/download/linux64/jq /bin/jq
RUN chmod +x /bin/jq

# curl: for hitting test servers
# git: for testing git buildpacks
RUN \
  apt-get update && \
  apt-get -y install \
    curl \
    git \
  && \
  apt-get clean

# for setting up /app to bind-mount to /home/vcap/app
RUN mkdir /app
ADD assets/etc/seed /etc/seed

