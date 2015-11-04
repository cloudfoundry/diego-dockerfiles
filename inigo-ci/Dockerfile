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
    pkg-config \
    autoconf \
  && \
  apt-get install -y asciidoc xmlto --no-install-recommends && \
  apt-get build-dep -y btrfs-tools && \
  apt-get clean

RUN \
  mkdir -p /tmp/btrfs && \
  cd /tmp/btrfs && \
  git clone git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git && \
  cd btrfs-progs && \
  ./autogen.sh && \
  ./configure && \
  make && \
  make install && \
  rm -rf /tmp/btrfs

# default rootfs for warden; used for non-Docker inigo tests
ADD inigo-test-rootfs.tar /opt/inigo/rootfs

RUN \
  wget -q https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/0.5.2_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/0.5.2_linux_amd64.zip

# add user diego to run unit tests
RUN useradd -ms /bin/bash diego
USER diego

