# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileCopyrightText: ShotplayMeow (https://github.com/Shotplay)

# =========================================================
# THIS FILE IS GENERATED VIA "just update-dockerfile-target slim-trixie".
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

# =========================================================
# Stage 1: Install repository
# =========================================================
FROM docker.io/alpine/git:2.54.0 AS install

RUN git clone \
  --depth 1 \
  --revision 90c911411b0939025d6eade4821d8de7fa96c009 \
  https://github.com/sidor0912/FunPayCardinal \
  /cardinal \
  && rm -rf \
  .git \
  .github \
  .gitignore \
  README.md \
  Cardinal.ico \
  install-fpc.sh \
  Dockerfile* \
  docker-compose*.yml \
  FunPayCardinal@.service \
  *.bat

# =========================================================
# Stage 2: Build
# =========================================================
FROM docker.io/python:3.11-trixie AS build

WORKDIR /cardinal

ENV \
  PATH="/venv/bin:${PATH}" \
  PIP_NO_CACHE_DIR="1" \
  PYTHONDONTWRITEBYTECODE="1"

RUN python -m venv --copies /venv

COPY --from=install /cardinal/requirements.txt requirements.txt

RUN pip install -r requirements.txt

# =========================================================
# Stage 3: Finalize
# =========================================================
FROM docker.io/python:3.11-slim-trixie

LABEL \
  image.generated="2026-08-21T10:13:18.900444965Z"

WORKDIR /cardinal

ENV \
  PATH="/venv/bin:${PATH}" \
  PIP_NO_CACHE_DIR="1" \
  PYTHONDONTWRITEBYTECODE="1" \
  PYTHONUNBUFFERED="1"

COPY --from=build /venv /venv
COPY --from=install \
  --chown=nonroot:nonroot \
  /cardinal /cardinal

ENTRYPOINT ["python3"]
CMD ["main.py"]
