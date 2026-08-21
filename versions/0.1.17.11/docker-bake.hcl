# SPDX-License-Identifier: BSD-3-Clause
# SPDX-FileCopyrightText: ShotplayMeow (https://github.com/Shotplay)

# =========================================================
# THIS FILE IS GENERATED VIA "just update-bake.
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

group "default" {
  targets = [
    "alpine",
    "distroless",
    "slim-bookworm",
    "slim-trixie",
  ]
}

group "cross" {
  targets = [
    "alpine-cross",
    "distroless-cross",
    "slim-bookworm-cross",
    "slim-trixie-cross",
  ]
}

variable "CARDINAL_VERSION" {
  default = "0.1.17.11"
}

variable "CARDINAL_REVISION" {
  default = "cdd872d9a781b0a27417b58f8e86f3378b9d99b6"
}

variable "OCI_AUTHORS" {
  default = "shotplaymeow"
}

variable "OCI_URL" {
  default = "https://github.com/Shotplay/funpay-cardinal-docker"
}

variable "OCI_SOURCE" {
  default = "https://github.com/sidor0912/FunPayCardinal"
}

variable "OCI_TITLE" {
  default = "Funpay-Cardinal-Docker"
}

variable "OCI_DESCRIPTION" {
  default = "Auto-generated Docker image for containerizing the FunPayCardinal bot"
}

target "alpine" {
  inherits = ["_attest"]
  context = "./alpine"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17.11-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17-alpine",
    "docker.io/shotplay/fp-cardinal:0.1-alpine",
    "docker.io/shotplay/fp-cardinal:0-alpine",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
    "org.opencontainers.image.authors"="${OCI_AUTHORS}"
    "org.opencontainers.image.url"="${OCI_URL}"
    "org.opencontainers.image.source"="${OCI_SOURCE}"
    "org.opencontainers.image.title"="${OCI_TITLE}"
    "org.opencontainers.image.description"="${OCI_DESCRIPTION}"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-alpine3.24"
  }
  annotations = [
    "org.opencontainers.image.version=${CARDINAL_VERSION}",
    "org.opencontainers.image.revision=${CARDINAL_REVISION}",
    "org.opencontainers.image.authors=${OCI_AUTHORS}",
    "org.opencontainers.image.url=${OCI_URL}",
    "org.opencontainers.image.source=${OCI_SOURCE}",
    "org.opencontainers.image.title=${OCI_TITLE}",
    "org.opencontainers.image.description=${OCI_DESCRIPTION}",
    "org.opencontainers.image.base.name=docker.io/python:3.11-alpine3.24",
  ]
}

target "distroless" {
  inherits = ["_attest"]
  context = "./distroless"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-distroless",
    "docker.io/shotplay/fp-cardinal:0.1.17.11-distroless",
    "docker.io/shotplay/fp-cardinal:0.1.17-distroless",
    "docker.io/shotplay/fp-cardinal:0.1-distroless",
    "docker.io/shotplay/fp-cardinal:0-distroless",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
    "org.opencontainers.image.authors"="${OCI_AUTHORS}"
    "org.opencontainers.image.url"="${OCI_URL}"
    "org.opencontainers.image.source"="${OCI_SOURCE}"
    "org.opencontainers.image.title"="${OCI_TITLE}"
    "org.opencontainers.image.description"="${OCI_DESCRIPTION}"
    "org.opencontainers.image.base.name"="gcr.io/distroless/cc-debian13:latest"
  }
  annotations = [
    "org.opencontainers.image.version=${CARDINAL_VERSION}",
    "org.opencontainers.image.revision=${CARDINAL_REVISION}",
    "org.opencontainers.image.authors=${OCI_AUTHORS}",
    "org.opencontainers.image.url=${OCI_URL}",
    "org.opencontainers.image.source=${OCI_SOURCE}",
    "org.opencontainers.image.title=${OCI_TITLE}",
    "org.opencontainers.image.description=${OCI_DESCRIPTION}",
    "org.opencontainers.image.base.name=gcr.io/distroless/cc-debian13:latest",
  ]
}

target "slim-bookworm" {
  inherits = ["_attest"]
  context = "./slim-bookworm"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17.11-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0-slim-bookworm",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
    "org.opencontainers.image.authors"="${OCI_AUTHORS}"
    "org.opencontainers.image.url"="${OCI_URL}"
    "org.opencontainers.image.source"="${OCI_SOURCE}"
    "org.opencontainers.image.title"="${OCI_TITLE}"
    "org.opencontainers.image.description"="${OCI_DESCRIPTION}"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-slim-bookworm"
  }
  annotations = [
    "org.opencontainers.image.version=${CARDINAL_VERSION}",
    "org.opencontainers.image.revision=${CARDINAL_REVISION}",
    "org.opencontainers.image.authors=${OCI_AUTHORS}",
    "org.opencontainers.image.url=${OCI_URL}",
    "org.opencontainers.image.source=${OCI_SOURCE}",
    "org.opencontainers.image.title=${OCI_TITLE}",
    "org.opencontainers.image.description=${OCI_DESCRIPTION}",
    "org.opencontainers.image.base.name=docker.io/python:3.11-slim-bookworm",
  ]
}

target "slim-trixie" {
  inherits = ["_attest"]
  context = "./slim-trixie"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest",
    "docker.io/shotplay/fp-cardinal:latest-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17.11-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0-slim-trixie",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
    "org.opencontainers.image.authors"="${OCI_AUTHORS}"
    "org.opencontainers.image.url"="${OCI_URL}"
    "org.opencontainers.image.source"="${OCI_SOURCE}"
    "org.opencontainers.image.title"="${OCI_TITLE}"
    "org.opencontainers.image.description"="${OCI_DESCRIPTION}"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-slim-trixie"
  }
  annotations = [
    "org.opencontainers.image.version=${CARDINAL_VERSION}",
    "org.opencontainers.image.revision=${CARDINAL_REVISION}",
    "org.opencontainers.image.authors=${OCI_AUTHORS}",
    "org.opencontainers.image.url=${OCI_URL}",
    "org.opencontainers.image.source=${OCI_SOURCE}",
    "org.opencontainers.image.title=${OCI_TITLE}",
    "org.opencontainers.image.description=${OCI_DESCRIPTION}",
    "org.opencontainers.image.base.name=docker.io/python:3.11-slim-trixie",
  ]
}

target "alpine-cross" {
  inherits = ["alpine"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm64/v8",
  ]
}

target "distroless-cross" {
  inherits = ["distroless"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

target "slim-bookworm-cross" {
  inherits = ["slim-bookworm"]
  platforms = [
    "linux/amd64",
    "linux/arm64/v8",
  ]
}

target "slim-trixie-cross" {
  inherits = ["slim-trixie"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

target "_attest" {
  attest = [
    {
      type = "provenance"
      mode = "max"
    },
    {
      type = "sbom"
    }
  ]
}