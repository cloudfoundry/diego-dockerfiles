FROM busybox:ubuntu-14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles
ENV VCAP_APPLICATION {}
ENV BAD_QUOTE '
ENV BAD_SHELL $1
ENV HOME /home/some_docker_user
ENV SOME_VAR some_docker_value
EXPOSE 8080
ADD dockerapp /dockerapp
CMD ["/dockerapp"]
