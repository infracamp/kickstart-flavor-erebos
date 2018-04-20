FROM kickstart-test-erebos:testing
LABEL maintainer="Matthias Leuffen <leuffen@continue.de>"


ENV DEV_CONTAINER_NAME="testbuild"
ENV HTTP_PORT=80

ADD / /opt
RUN ["/kickstart/container/start.sh", "build"]

EXPOSE 80
ENTRYPOINT ["/kickstart/container/start.sh", "standalone"]