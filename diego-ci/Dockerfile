FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ADD https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz /tmp/etcd.tar.gz

RUN mkdir /tmp/etcd && tar zxf /tmp/etcd.tar.gz -C /tmp && \
      mv /tmp/etcd-*/etcd /usr/local/bin && \
      go get github.com/apcera/gnatsd && \
      mv /root/go/bin/gnatsd /usr/local/bin && \
      rm -rf /root/go/src && \
      rm -rf /root/go/pkg && \
      rm -rf /tmp/etcd*
