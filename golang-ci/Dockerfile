FROM ubuntu:14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV HOME /root
ENV GOPATH /root/go
ENV PATH /root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p $GOPATH

# install build dependencies
RUN apt-get update && \
      apt-get -y install build-essential git wget python libpython-dev \
      && apt-get clean

# install Go 1.4
RUN wget -qO- https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | tar -C /usr/local -xzf -

# install Mercurial (for hg go dependencies)
RUN wget -qO- http://mercurial.selenic.com/release/mercurial-2.9.2.tar.gz | tar -C /tmp -xzf - && \
      cd /tmp/mercurial-2.9.2 && \
      sudo python setup.py install && \
      rm -rf /tmp/mercurial-2.9.2

# install common CI dependencies
RUN go get github.com/dustin/goveralls
RUN go get golang.org/x/tools/cmd/cover

# debugging tools; graphviz is for rendering heap w/ pprof
RUN apt-get -y install htop strace curl graphviz
