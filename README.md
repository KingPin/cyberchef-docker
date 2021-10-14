# cyberchef-docker

[![Docker](https://github.com/KingPin/cyberchef-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/KingPin/cyberchef-docker/actions/workflows/docker-publish.yml) ![Docker Pulls](https://img.shields.io/docker/pulls/kingpin/cyberchef-docker)

dockerized version of cyberchef, including arm64 / aarch64

exposes port 8000, you will need a reverse proxy on the same network to interact with it. otherwise change 
expose:
  - 8000

to

ports:
  - 8000

expose vs ports:
Expose: expose ports without publishing them to the host machine - they’ll only be accessible to other services on the network. Only the internal port can be specified.
ports: Expose ports to the local machine outside docker container. Either specify both ports (HOST:CONTAINER), or just the container port (a random host port will be chosen).

has a built in health check

no volume needed.
