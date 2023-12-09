FROM debian:bullseye-slim

ARG APP_VERSION
ARG APP_HASH
ARG BUILD_DATE
# If stable argument is passed it will download stable instead of beta
ARG STABLE

LABEL org.label-schema.version=$APP_VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$APP_HASH 

WORKDIR /opt/tunnel

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y --no-install-recommends install ssh iputils-ping\
    &&  apt-get clean 

RUN mkdir -p /root/.ssh

ADD reverse_tunnel.sh /opt/tunnel/reverse_tunnel.sh
RUN chmod +x /opt/tunnel/*.sh

ENV KEY_FILE **None**
ENV FORWARD_PORT **None**
ENV FORWARD_HOST **None**
ENV REMOTE_PORT **None**

ENV TARGET_USER **None**
ENV TARGET_HOST **None**

ENTRYPOINT ["/opt/tunnel/reverse_tunnel.sh"]
CMD ["/opt/tunnel"]

 
