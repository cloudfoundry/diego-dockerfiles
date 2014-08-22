FROM ubuntu:14.04

ENV HOME /root
ENV GOPATH /root/go
ENV PATH /root/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

RUN mkdir -p /root/go

RUN apt-get update && apt-get install -y build-essential mercurial git-core subversion wget

RUN wget -qO- https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | tar -C /usr/local -xzf -

RUN go get github.com/dustin/goveralls
RUN go get code.google.com/p/go.tools/cmd/cover
