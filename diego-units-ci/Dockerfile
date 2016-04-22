FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get -y install mysql-server zip && \
  apt-get clean

RUN service mysql start && \
  mysql -e "CREATE USER 'diego'@'localhost' IDENTIFIED BY 'diego_password'; GRANT ALL PRIVILEGES ON \`diego\_%\`.* TO 'diego'@'localhost';"

RUN \
  wget -q https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_linux_amd64.zip -P /tmp/ && \
  unzip /tmp/consul_0.5.2_linux_amd64.zip -d /usr/local/bin && \
  rm /tmp/consul_0.5.2_linux_amd64.zip

# add user diego to run unit tests
RUN useradd -ms /bin/bash diego
USER diego

