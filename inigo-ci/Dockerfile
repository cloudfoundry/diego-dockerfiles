FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV DEBIAN_FRONTEND noninteractive

# pull in dependencies for the garden-linux server
RUN \
  apt-get update && \
  apt-get -y install \
    autoconf \
    btrfs-tools \
    iptables \
    lsb-release \
    mysql-server-5.7 \
    pkg-config \
    quota \
    sudo \
    uidmap \
    ulogd \
    zip \
  && \
  apt-get clean

# default rootfs for warden; used for non-Docker inigo tests
ADD inigo-test-rootfs.tar /opt/inigo/rootfs

# Install postgres
RUN \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
  apt-get update && \
  apt-get -y install postgresql-9.4 && \
  apt-get clean && \
  sed -i 's/peer/trust/' /etc/postgresql/9.4/main/pg_hba.conf && \
  sed -i 's/md5/trust/' /etc/postgresql/9.4/main/pg_hba.conf

# Setup Diego Database and Users
RUN service mysql start && \
  mysql -e "CREATE USER 'diego'@'localhost' IDENTIFIED BY 'diego_password';" && \
  mysql -e "GRANT ALL PRIVILEGES ON \`diego\_%\`.* TO 'diego'@'localhost';" && \
  mysql -e "GRANT ALL PRIVILEGES ON \`routingapi\_%\`.* TO 'diego'@'localhost';"

RUN service postgresql start && \
  createdb -U postgres diego && \
  psql -h localhost -Upostgres -c "CREATE USER diego WITH createrole superuser password 'diego_pw';"

RUN \
  wget -q https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/consul_0.7.0_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/consul_0.7.0_linux_amd64.zip

# install version 1.28 of tar
RUN \
  wget -q http://ftp.gnu.org/gnu/tar/tar-1.28.tar.gz -P /tmp/ && \
  cd /tmp && \
  tar xzf tar-1.28.tar.gz && \
  cd tar-1.28 && \
  export LDFLAGS=-static && \
  export FORCE_UNSAFE_CONFIGURE=1 && \
  ./configure && \
  make && \
  make install && \
  rm -f /bin/tar && \
  rm -rf /tmp/tar-1.28*

# install libseccomp (needed for garden-runc)
RUN \
  wget https://github.com/seccomp/libseccomp/releases/download/v2.3.1/libseccomp-2.3.1.tar.gz && \
  tar zxf libseccomp-2.3.1.tar.gz && \
  cd libseccomp-2.3.1/  && \
  ./configure && \
  make && \
  make install

# add user diego to run unit tests
RUN useradd -ms /bin/bash diego
USER diego

