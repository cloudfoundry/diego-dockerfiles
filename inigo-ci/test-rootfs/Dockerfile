FROM cloudfoundry/cflinuxfs3

# fuse: for inigo style vizzini tests
RUN \
  apt-get update && \
  apt-get -y install fuse \
  && \
  apt-get clean

RUN useradd -m testuser
