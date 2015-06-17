FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

# pull in dependencies for the garden-linux server
RUN \
  apt-get update && \
  apt-get -y install \
    iptables \
    quota \
    ulogd \
    zip \
  && \
  apt-get clean

# default rootfs for warden; used for non-Docker inigo tests
ADD inigo-test-rootfs.tar /opt/inigo/rootfs

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.5.0 /usr/bin/docker
RUN chmod +x /usr/bin/docker

RUN \
  wget -q https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/0.5.2_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/0.5.2_linux_amd64.zip
