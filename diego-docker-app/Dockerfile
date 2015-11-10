FROM busybox
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

ENV VCAP_APPLICATION {}
ENV BAD_QUOTE \'
ENV BAD_SHELL \$1
ENV HOME /home/some_docker_user
ENV SOME_VAR some_docker_value
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/myapp/bin

EXPOSE 8080

COPY dockerapp /myapp/bin/dockerapp
WORKDIR /myapp

RUN adduser -D vcap

CMD ["dockerapp"]
