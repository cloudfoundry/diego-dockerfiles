FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

RUN go get github.com/coreos/etcd && \
      go get github.com/apcera/gnatsd && \
      mv /root/go/bin/etcd /usr/local/bin && \
      mv /root/go/bin/gnatsd /usr/local/bin && \
      rm -rf /root/go/src && \
      rm -rf /root/go/pkg
