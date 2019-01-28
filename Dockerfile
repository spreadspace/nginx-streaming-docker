FROM spreadspace/ffmpeg:latest
MAINTAINER Christian Pointner <equinox@spreadspace.org>

ENV NGINX_VERSION 1.14.2-2spread1

USER root

RUN set -x \
    && echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list \
    && apt-get update -q \
    && apt-get install -y -q nginx=${NGINX_VERSION} libnginx-mod-stream=${NGINX_VERSION} libnginx-mod-rtmp=${NGINX_VERSION} libnginx-mod-http-lua=${NGINX_VERSION} rtmpdump \
    && apt-get upgrade -y -q \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER app
