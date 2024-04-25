<!-- DO NOT EDIT THIS FILE MANUALLY -->
<!-- Please read https://github.com/linuxserver/docker-socket-proxy/blob/main/.github/CONTRIBUTING.md -->
[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=discourse)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub&logo=github)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Supporters&logo=open%20collective)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release.

Find us at:

* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/socket-proxy](https://github.com/linuxserver/docker-socket-proxy)

[![Scarf.io pulls](https://scarf.sh/installs-badge/linuxserver-ci/linuxserver%2Fsocket-proxy?color=94398d&label-color=555555&logo-color=ffffff&style=for-the-badge&package-type=docker)](https://scarf.sh/gateway/linuxserver-ci/docker/linuxserver%2Fsocket-proxy)
[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-socket-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-socket-proxy)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-socket-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-socket-proxy/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub%20Package&logo=github)](https://github.com/linuxserver/docker-socket-proxy/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab)](https://gitlab.com/linuxserver.io/docker-socket-proxy/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/socket-proxy)
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/socket-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/linuxserver/socket-proxy)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/socket-proxy.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/linuxserver/socket-proxy)
[![Jenkins Build](https://img.shields.io/jenkins/build?labelColor=555555&logoColor=ffffff&style=for-the-badge&jobUrl=https%3A%2F%2Fci.linuxserver.io%2Fjob%2FDocker-Pipeline-Builders%2Fjob%2Fdocker-socket-proxy%2Fjob%2Fmain%2F&logo=jenkins)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-socket-proxy/job/main/)

The Socket Proxy is a security-enhanced proxy which allows you to apply access rules to the Docker socket, limiting the attack surface for containers such as watchtower or Traefik that need to use it.

![socket-proxy](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/docker-logo.png)

## Supported Architectures

We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://distribution.github.io/distribution/spec/manifest-v2-2/#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `lscr.io/linuxserver/socket-proxy:latest` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64v8-\<version tag\> |
| armhf | ❌ | |

## Application Setup

This container is based on [https://github.com/Tecnativa/docker-socket-proxy](https://github.com/Tecnativa/docker-socket-proxy) and as such does not follow our usual container conventions. It *does not* support mods or custom scripts/services, or running as a user other than root (or the docker user in a rootless environment). It is designed to act as a drop-in replacement for the Tecnativa container.

The container should be run on the same docker network as the service(s) using it. Most containers that would normally connect to a mounted docker.sock can have their endpoint overridden using the `DOCKER_HOST` environment variable if they do not offer the option in their configuration; it should typically be pointed to `tcp://socket-proxy:2375`.

* Never expose this container's port to a public network. It should be treated the same way you would treat the docker socket or TCP endpoint.
* Revoke access to any API section that you consider your service should not need.
* To see the versions of the API your Docker daemon and client support, use `docker version` and check the `API version`.
* [Read the docs](https://docs.docker.com/engine/api/) for the API version you are using for an explanation of all the available endpoints.

## Usage

To help you get started creating a container from this image you can either use docker compose or the docker cli.

### docker compose (recommended, [click here for more info](https://docs.linuxserver.io/general/docker-compose))

```yaml
---
services:
  socket-proxy:
    image: lscr.io/linuxserver/socket-proxy:latest
    container_name: socket-proxy
    environment:
      - ALLOW_START=0 #optional
      - ALLOW_STOP=0 #optional
      - ALLOW_RESTARTS=0 #optional
      - AUTH=0 #optional
      - BUILD=0 #optional
      - COMMIT=0 #optional
      - CONFIGS=0 #optional
      - CONTAINERS=0 #optional
      - DISABLE_IPV6=0 #optional
      - DISTRIBUTION=0 #optional
      - EVENTS=1 #optional
      - EXEC=0 #optional
      - IMAGES=0 #optional
      - INFO=0 #optional
      - NETWORKS=0 #optional
      - NODES=0 #optional
      - PING=1 #optional
      - POST=0 #optional
      - PLUGINS=0 #optional
      - SECRETS=0 #optional
      - SERVICES=0 #optional
      - SESSION=0 #optional
      - SWARM=0 #optional
      - SYSTEM=0 #optional
      - TASKS=0 #optional
      - VERSION=1 #optional
      - VOLUMES=0 #optional
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
    restart: unless-stopped
    read_only: true
    tmpfs:
      - /run
```

### docker cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```bash
docker run -d \
  --name=socket-proxy \
  -e ALLOW_START=0 `#optional` \
  -e ALLOW_STOP=0 `#optional` \
  -e ALLOW_RESTARTS=0 `#optional` \
  -e AUTH=0 `#optional` \
  -e BUILD=0 `#optional` \
  -e COMMIT=0 `#optional` \
  -e CONFIGS=0 `#optional` \
  -e CONTAINERS=0 `#optional` \
  -e DISTRIBUTION=0 `#optional` \
  -e DISABLE_IPV6=0 `#optional` \
  -e EVENTS=1 `#optional` \
  -e EXEC=0 `#optional` \
  -e IMAGES=0 `#optional` \
  -e INFO=0 `#optional` \
  -e NETWORKS=0 `#optional` \
  -e NODES=0 `#optional` \
  -e PING=1 `#optional` \
  -e POST=0 `#optional` \
  -e PLUGINS=0 `#optional` \
  -e SECRETS=0 `#optional` \
  -e SERVICES=0 `#optional` \
  -e SESSION=0 `#optional` \
  -e SWARM=0 `#optional` \
  -e SYSTEM=0 `#optional` \
  -e TASKS=0 `#optional` \
  -e VERSION=1 `#optional` \
  -e VOLUMES=0 `#optional` \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --restart unless-stopped \
  --read-only \
  --tmpfs /run \
  lscr.io/linuxserver/socket-proxy:latest
```

## Parameters

Containers are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-e ALLOW_START=0` | `/containers/{id}/start` |
| `-e ALLOW_STOP=0` | `/containers/{id}/stop` |
| `-e ALLOW_RESTARTS=0` | `/containers/{id}/stop`, `/containers/{id}/restart`, and `/containers/{id}/kill` |
| `-e AUTH=0` | `/auth` |
| `-e BUILD=0` | `/build` |
| `-e COMMIT=0` | `/commit` |
| `-e CONFIGS=0` | `/configs` |
| `-e CONTAINERS=0` | `/containers` |
| `-e DISTRIBUTION=0` | `/distribution` |
| `-e DISABLE_IPV6=0` | Set to `1` to prevent nginx binding to the IPv6 interface for legacy system that cannot support IPv6. |
| `-e EVENTS=1` | `/events` |
| `-e EXEC=0` | `/exec` & `/containers/{id}/exec` |
| `-e IMAGES=0` | `/images` |
| `-e INFO=0` | `/info` |
| `-e NETWORKS=0` | `/networks` |
| `-e NODES=0` | `/nodes` |
| `-e PING=1` | `/_ping` |
| `-e PLUGINS=0` | `/plugins` |
| `-e POST=0` | When set to `0`, only `GET` and `HEAD` operations are allowed, making API access read-only. |
| `-e SECRETS=0` | `/secrets` |
| `-e SERVICES=0` | `/services` |
| `-e SESSION=0` | `/session` |
| `-e SWARM=0` | `/swarm` |
| `-e SYSTEM=0` | `/system` |
| `-e TASKS=0` | `/tasks` |
| `-e VERSION=1` | `/version` |
| `-e VOLUMES=0` | `/volumes` |
| `-v /var/run/docker.sock:ro` | Mount the host docker socket into the container. |
| `--read-only` | Make the container filesystem read-only. |
| `--tmpfs /run` | Mount /run to tmpfs (RAM) to make it writeable. |

## Support Info

* Shell access whilst the container is running:

    ```bash
    docker exec -it socket-proxy /bin/sh
    ```

* To monitor the logs of the container in realtime:

    ```bash
    docker logs -f socket-proxy
    ```

* Container version number:

    ```bash
    docker inspect -f '{{ index .Config.Labels "build_version" }}' socket-proxy
    ```

* Image version number:

    ```bash
    docker inspect -f '{{ index .Config.Labels "build_version" }}' lscr.io/linuxserver/socket-proxy:latest
    ```

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (noted in the relevant readme.md), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Compose

* Update images:
    * All images:

        ```bash
        docker compose pull
        ```

    * Single image:

        ```bash
        docker compose pull socket-proxy
        ```

* Update containers:
    * All containers:

        ```bash
        docker compose up -d
        ```

    * Single container:

        ```bash
        docker compose up -d socket-proxy
        ```

* You can also remove the old dangling images:

    ```bash
    docker image prune
    ```

### Via Docker Run

* Update the image:

    ```bash
    docker pull lscr.io/linuxserver/socket-proxy:latest
    ```

* Stop the running container:

    ```bash
    docker stop socket-proxy
    ```

* Delete the container:

    ```bash
    docker rm socket-proxy
    ```

* You can also remove the old dangling images:

    ```bash
    docker image prune
    ```

### Image Update Notifications - Diun (Docker Image Update Notifier)

**tip**: We recommend [Diun](https://crazymax.dev/diun/) for update notifications. Other tools that automatically update containers unattended are not recommended or supported.

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:

```bash
git clone https://github.com/linuxserver/docker-socket-proxy.git
cd docker-socket-proxy
docker build \
  --no-cache \
  --pull \
  -t lscr.io/linuxserver/socket-proxy:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`

```bash
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **15.04.24:** - Allow disabling IPv6 support for legacy devices.
* **08.04.24:** - Use nginx due to haproxy's wonky websockets handling.
* **07.04.24:** - Initial Release.
