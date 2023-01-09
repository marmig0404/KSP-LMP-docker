# KSP-LMP-docker

[![Docker Pulls](https://badgen.net/docker/pulls/marmig/ksp-lunamultiplayer)](https://hub.docker.com/r/marmig/ksp-lunamultiplayer)

This docker image is based on the [Lunamultiplayer](https://github.com/LunaMultiplayer/LunaMultiplayer) mod and creates a server for Kerbal Space Program.

## Instructions

To start the docker image run:

```bash
docker run \
 --name "LMP Server" \
 -p 8800:8800 \
marmig/ksp-lunamultiplayer:latest
```

For docker-compose:

```docker-compose
version: "3"

services:
  ksplunamultiplayer:
    image: marmig/ksp-lunamultiplayer:latest
    ports:
      - 8800:8800
      - 8801:8801
      - 8900:8900
    tty: true
    stdin_open: true
    restart: unless-stopped
    volumes:
      # attach a directory relative to the directory containing this compose file
      - /LMP-Server/LMPServer
```

## Usage

- `-p 8800:8800` LMP game server port (default 8800)
- _(optional)_ `-v <insert/path/here>:/LMP-Server/LMPServer:rw` The location to store all your permanent files (logs, config and more)

### Additional parameters

_none yet - but you can create a [issue](https://github.com/marmig0404/KSP-LMP-docker/issues) on GitHub if you have an idea_ or a problem ;)

### Public Servers

The public server list can be found [here](http://lunamultiplayer.com/pages/releaseservers.html).

## Extra bits

[Docker Hub page](https://hub.docker.com/r/marmig/ksp-lunamultiplayer)
[GitHub page](https://github.com/marmig0404/KSP-LMP-docker)

[LMP GitHub repo](https://github.com/LunaMultiplayer/LunaMultiplayer)
[LMP site](http://lunamultiplayer.com/)
