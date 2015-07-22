FROM busybox:ubuntu-14.04
MAINTAINER https://github.com/cloudfoundry-incubator/diego-dockerfiles
ENV VCAP_APPLICATION {}
ENV BAD_QUOTE '
ENV BAD_SHELL $1
ENV HOME /home/dockeruser
ENV SOME_VAR some_docker_value
ENV PORT 7070
EXPOSE 7070
COPY dockerapp /myapp/dockerapp
WORKDIR /myapp
CMD ["./dockerapp"]
RUN echo "dockeruser:$5$qJ96cmDMWHs6uql1$oxpiHc.kAXRG4f45Rl0xbwPQPG3jbDrgLE5Xe4hhvy8:501:501:docker user:/home/dockeruser:/bin/sh" >> /etc/passwd
RUN echo "dockeruser:x:501:" >> /etc/group
RUN mkdir -p /home/dockeruser
RUN chown dockeruser:dockeruser /home/dockeruser
USER dockeruser
