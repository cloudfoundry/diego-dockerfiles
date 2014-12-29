FROM ubuntu:14.04

RUN apt-get update && apt-get -y install \
      # FUSE tests
      fuse libfuse-dev pkg-config

RUN cd /usr/share/doc/libfuse-dev/examples && \
  bash -c "gcc -Wall hello.c $(pkg-config fuse --cflags --libs) -o /usr/bin/hellofs"
