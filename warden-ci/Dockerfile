FROM cloudfoundry/golang-ci

# pull in dependencies for the server
RUN apt-get update && apt-get -y install iptables quota rsync net-tools protobuf-compiler

# pull in the prebuilt rootfs
ADD warden-test-rootfs.tar /opt/warden/rootfs

# install the binary for generating the protocol
RUN go get code.google.com/p/gogoprotobuf/protoc-gen-gogo

# install nsenter
RUN mkdir /tmp/nsenter && \
      wget -qO- https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz \
      | tar -C /tmp/nsenter -zxf - && \
      cd /tmp/nsenter/* && ./configure --without-ncurses && \
      make CFLAGS=-fPIC LDFLAGS=-all-static nsenter && \
      cp ./nsenter /usr/local/bin
