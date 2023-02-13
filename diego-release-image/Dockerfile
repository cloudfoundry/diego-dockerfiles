FROM cloudfoundry/diego-golang-ci

ENV credhub_cli_version 2.6.0
ENV bbl_version 8.3.2
ENV hub_cli_version 2.14.2

RUN \
  apt-get update && \
  apt-get -y install \
    libmysqlclient-dev \
    libpq-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libssl-dev/jammy \
    libssl3/jammy \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    openssl/jammy \
    zip \
    zlib1g-dev \
    bc \
    python3-pip \
    ruby && \
  apt-get clean

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod +x /bin/jq

RUN \
  pip3 install yq

RUN \
  curl -o /usr/local/bin/bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.45-linux-amd64 && \
  chmod +x /usr/local/bin/bosh

RUN \
  curl -sL "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar zxf - -C /usr/bin

RUN \
  curl https://sdk.cloud.google.com | bash -s -- --disable-prompts && /bin/bash -c "source /root/.bashrc"

# credhub-cli
RUN \
  wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${credhub_cli_version}/credhub-linux-${credhub_cli_version}.tgz -P /tmp && \
  tar xzvf /tmp/credhub-linux-${credhub_cli_version}.tgz -C /usr/local/bin && \
  chmod +x /usr/local/bin/credhub

# bbl and dependencies
RUN \
  wget https://github.com/cloudfoundry/bosh-bootloader/releases/download/v${bbl_version}/bbl-v${bbl_version}_linux_x86-64 -P /tmp && \
  mv /tmp/bbl-* /usr/local/bin/bbl && \
  cd /usr/local/bin && \
  chmod +x bbl

RUN \
  wget https://github.com/github/hub/releases/download/v${hub_cli_version}/hub-linux-amd64-${hub_cli_version}.tgz -P /tmp && \
  tar xvf /tmp/hub-linux*.tgz -C /tmp && \
  /tmp/hub-linux-amd64-${hub_cli_version}/install && \
  rm -rf /tmp/hub-linux*
