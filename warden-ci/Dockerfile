FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

# pull in dependencies for the server
RUN apt-get update && apt-get -y install iptables quota protobuf-compiler ulogd

# pull in the prebuilt rootfs
ADD warden-test-rootfs.tar /opt/warden/rootfs
ADD ubuntu-test-rootfs.tar /opt/warden/nestable-rootfs
ADD fuse-test-rootfs.tar /opt/warden/fuse-rootfs

# install the binary for generating the protocol
RUN go get code.google.com/p/gogoprotobuf/protoc-gen-gogo

# debugging utilities
RUN apt-get -y install strace lsof psmisc
