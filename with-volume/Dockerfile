FROM busybox
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles
VOLUME /foo
ENV PATH /usr/local/bin:/usr/bin:/bin:/from-dockerfile
ENV TEST test-from-dockerfile
ENV TEST second-test-from-dockerfile:$TEST
