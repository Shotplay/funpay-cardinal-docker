# Funpay Cardinal Docker

[English][readme] | [Русский][readme-ru]

Образы Docker для [FunPayCardinal][cardinal] бота.

## Описание

Авто-генерируемые образы Docker для контейнеризации [FunPayCardinal][cardinal] бота. Образы публикуются на Docker Hub: https://hub.docker.com/shotplay/fp-cardinal.

## Начало

### Условия

* Docker Engine >= 20.10, (рекомендуется 23.0.0+)
* Docker Compose >= 1.27.0, (рекомендуется 2.20.0+; v2 предпочтителен), опционально
* Docker Desktop (опкционально) - включает Engine и Compose

### Быстрый старт с Docker

> **Важно**: Первый запуск должен быть интерактивным (`-it`) - бот спросит ваш FunPay `golden_key` и остальные настройки и создаст первоначальную конфигурацию. После этого вы можете удалить временный контейнер и запустить постоянный в фоне.

**1. Интерактивный запуск (создание конфигов)**:
```bash
$ docker run --rm -it --name funpay-cardinal-init \
    -v /some/configs:/opt/cardinal/configs \
    shotplay/fp-cardinal 
```

**2. Запуск в detach режиме (постоянный)**:
```bash
$ docker run -d --name funpay-cardinal \
    -v ./configs:/opt/cardinal/configs \
    -v ./plugins:/opt/cardinal/plugins \
    -v ./storage:/opt/cardinal/storage \
    shotplay/fp-cardinal
```
> **Примечание**: Чтобы сохранять логи на хосте, добавьте `-v ./logs:/opt/cardinal/logs` в команду.

### Быстрый старт с Docker Compose

**1. Скачайте [docker-compose.yml][compose] файл**:
```bash
$ curl -L -O https://raw.githubusercontent.com/Shotplay/funpay-cardinal-docker/main/docker-compose.yml
```

**2. Запустите интерактивную установку**:
```bash
$ docker compose run --rm funpay-cardinal
```

**3. Запустите в фоне**:
```bash
$ docker compose up -d
```
> **Примечание**: Чтобы сохранять логи на хосте, добавьте `-v ./logs:/opt/cardinal/logs` в секцию `volumes` в файле `docker-compose.yml`.

## Проверка Логов и Статуса
```bash
docker ps
docker logs funpay-cardinal
```

## Авторы

[ShotplayMeow][shotplaymeow]

## Лицензия

Данный проект лицензирован под BSD-3-Clause лицензией - смотрите [LICENSE][license] файл для подробностей.

## Благодарности

Отдельное спасибо [sidor0912][sidor0912] за оригинального бота.

[readme]: ./README.md
[readme-ru]: ./README.ru.md
[license]: ./LICENSE
[cardinal]: https://github.com/sidor0912/FunPayCardinal
[sidor0912]: https://github.com/sidor0912
[shotplaymeow]: https://github.com/Shotplay
[compose]: ./docker-compose.yml