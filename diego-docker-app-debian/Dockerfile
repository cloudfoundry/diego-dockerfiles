FROM debian
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles

RUN adduser --no-create-home --shell /bin/sh dockeruser
USER dockeruser

ENV VCAP_APPLICATION {}
ENV BAD_QUOTE \'
ENV BAD_SHELL \$1
ENV HOME /home/dockeruser
ENV SOME_VAR some_docker_value
ENV PORT 7070

EXPOSE 7070

COPY dockerapp /myapp/dockerapp
WORKDIR /myapp
CMD ["./dockerapp"]
