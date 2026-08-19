# Funpay Cardinal Docker

[English][readme] | [Русский][readme-ru]

Docker images for [FunPayCardinal][cardinal] bot

## Description

Auto-generated Docker images for containerizing the [FunPayCardinal][cardinal] bot.
Images published on Docker Hub: https://hub.docker.com/r/shotplay/fp-cardinal.

## Getting started

### Prerequisites

* Docker Engine >= 20.10, (recommended 23.0.0+)
* Docker Compose >= 1.27.0, (recommended 2.20.0+; v2 preferred), optional
* Docker Desktop (optional) - includes both Engine and Compose

### Quick start with Docker

> **Important**: The first run must be interactive (`-it`) - the bot will ask for your FunPay `golden_key` and other settings and create the initial configuration. After that, you can remove the temporary container and start a persistent one in the background.


**1. Interactive setup (creates configs)**:
```bash
$ docker run --rm -it --name funpay-cardinal-init \
    -v ./configs:/opt/cardinal/configs \
    shotplay/fp-cardinal 
```

**2. Run in detached mode (persistent)**:
```bash
$ docker run -d --name funpay-cardinal \
    -v ./configs:/opt/cardinal/configs \
    -v ./plugins:/opt/cardinal/plugins \
    -v ./storage:/opt/cardinal/storage \
    shotplay/fp-cardinal
```
> **Tip**: To persist logs on the host, add `-v ./logs:/opt/cardinal/logs` to the command.

### Quick start with Docker compose

**1. Download the [docker-compose.yml][compose] file**:
```bash
$ curl -L -O https://raw.githubusercontent.com/Shotplay/funpay-cardinal-docker/main/docker-compose.yml
```

**2. Run interactive setup**:
```bash
$ docker compose run --rm funpay-cardinal
```

**3. Start the background**:
```bash
$ docker compose up -d
```
> **Tip**: To persist logs on the host, add `- ./logs:/opt/cardinal/logs` to the `volumes` section in `docker-compose.yml`.

## Checking Logs and Status
```bash
docker ps
docker logs funpay-cardinal
```

## Authors

[ShotplayMeow][shotplaymeow]

## License

This project is licensed under the BSD-3-Clause License - see the [LICENSE][license] file for details

## Acknowledgments

Special thanks to [sidor0912][sidor0912] for the original bot.

[readme]: ./README.md
[readme-ru]: ./README.ru.md
[license]: ./LICENSE
[cardinal]: https://github.com/sidor0912/FunPayCardinal
[sidor0912]: https://github.com/sidor0912
[shotplaymeow]: https://github.com/Shotplay
[compose]: ./docker-compose.yml
