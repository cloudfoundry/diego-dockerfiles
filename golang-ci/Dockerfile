FROM ubuntu:14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV HOME /root
ENV GOPATH /root/go
ENV PATH /root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p $GOPATH

RUN apt-get update && apt-get install -y build-essential mercurial git-core subversion wget

# install Go 1.3.1
RUN wget -qO- https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | tar -C /usr/local -xzf -

# install common CI dependencies
RUN go get github.com/dustin/goveralls
RUN go get code.google.com/p/go.tools/cmd/cover
