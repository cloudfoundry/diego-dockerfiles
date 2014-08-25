FROM cloudfoundry/warden-ci
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

# for zipping up the circuses
RUN apt-get -y install zip

# default rootfs for warden; used for non-Docker inigo tests
ADD inigo-test-rootfs.tar /opt/warden/rootfs
