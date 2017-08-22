FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get -y install \
    lsb-release \
    mysql-server \
    sudo \
    zip && \
  apt-get clean

RUN service mysql start && \
  mysql -e "CREATE USER 'diego'@'localhost' IDENTIFIED BY 'diego_password'; GRANT ALL PRIVILEGES ON \`diego\_%\`.* TO 'diego'@'localhost'; GRANT ALL PRIVILEGES ON \`routingapi\_%\`.* TO 'diego'@'localhost';"
RUN \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
  apt-get update && \
  apt-get -y install postgresql-9.4 && \
  apt-get clean && \
  sed -i 's/peer/trust/' /etc/postgresql/9.4/main/pg_hba.conf && \
  sed -i 's/md5/trust/' /etc/postgresql/9.4/main/pg_hba.conf

RUN service postgresql start && \
  createdb -U postgres diego && \
  psql -h localhost -Upostgres -c "CREATE USER diego WITH createrole superuser password 'diego_pw';"


RUN \
  wget -q https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/consul_0.7.0_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/consul_0.7.0_linux_amd64.zip
