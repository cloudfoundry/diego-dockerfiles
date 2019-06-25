FROM cloudfoundry/golang-ci

RUN \
  apt-get update && \
  apt-get -y --force-yes install \
    libmysqlclient-dev \
    libpq-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libssl-dev/xenial \
    libssl1.0.0/xenial \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    openssl/xenial \
    zip \
    zlib1g-dev \
    ruby && \
  apt-get clean

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /bin/jq
RUN chmod +x /bin/jq

RUN \
  curl -o /usr/local/bin/bosh https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.45-linux-amd64 && \
  chmod +x /usr/local/bin/bosh

RUN \
  curl -sL "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar zxf - -C /usr/bin

RUN \
  curl https://sdk.cloud.google.com | bash -s -- --disable-prompts && /bin/bash -c "source /root/.bashrc"
