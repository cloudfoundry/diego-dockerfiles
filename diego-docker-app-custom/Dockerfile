FROM busybox:ubuntu-14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles
ENV VCAP_APPLICATION {}
ENV BAD_QUOTE '
ENV BAD_SHELL $1
ENV HOME /home/some_docker_user
ENV SOME_VAR some_docker_value
ENV PORT 7070
EXPOSE 7070
COPY dockerapp /myapp/dockerapp
WORKDIR /myapp
CMD ["./dockerapp"]
