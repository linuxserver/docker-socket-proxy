# syntax=docker/dockerfile:1

FROM docker.io/alpine:3.20

# set version label
ARG BUILD_DATE
ARG VERSION
ARG NGINX_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thespad"

# install packages
RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache \
    alpine-release \
    bash \
    curl \
    envsubst && \
  if [ -z ${NGINX_VERSION+x} ]; then \
  NGINX_VERSION=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/v3.20/main/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp \
    && awk '/^P:nginx$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
  fi && \
  apk add --no-cache \
    nginx==${NGINX_VERSION} && \
  printf "Linuxserver.io version: ${VERSION}\nBuild-date: ${BUILD_DATE}" > /build_version && \
  rm -f /etc/nginx/conf.d/stream.conf && \
  rm -f /etc/nginx/http.d/default.conf

ENV ALLOW_RESTARTS=0 \
  ALLOW_STOP=0 \
  ALLOW_START=0 \
  AUTH=0 \
  BUILD=0 \
  COMMIT=0 \
  CONFIGS=0 \
  CONTAINERS=0 \
  DISTRIBUTION=0 \
  EVENTS=1 \
  EXEC=0 \
  IMAGES=0 \
  INFO=0 \
  NETWORKS=0 \
  NODES=0 \
  PING=1 \
  PLUGINS=0 \
  POST=0 \
  SECRETS=0 \
  SERVICES=0 \
  SESSION=0 \
  SOCKET_PATH=/var/run/docker.sock \
  SWARM=0 \
  SYSTEM=0 \
  TASKS=0 \
  VERSION=1 \
  VOLUMES=0

# add local files
COPY root/ /

EXPOSE 2375

ENTRYPOINT ["/docker-entrypoint.sh"]
