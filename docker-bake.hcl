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
  default = "0.1.17.13"
}

variable "CARDINAL_REVISION" {
  default = "4e62af063fab4e9164b6a8bfdb2ac387f2b0a83f"
}

target "alpine" {
  inherits = ["_attest"]
  context = "./versions/0.1.17.13/alpine"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17.13-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17-alpine",
    "docker.io/shotplay/fp-cardinal:0.1-alpine",
    "docker.io/shotplay/fp-cardinal:0-alpine",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
  }
}

target "distroless" {
  inherits = ["_attest"]
  context = "./versions/0.1.17.13/distroless"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-distroless",
    "docker.io/shotplay/fp-cardinal:0.1.17.13-distroless",
    "docker.io/shotplay/fp-cardinal:0.1.17-distroless",
    "docker.io/shotplay/fp-cardinal:0.1-distroless",
    "docker.io/shotplay/fp-cardinal:0-distroless",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
  }
}

target "slim-bookworm" {
  inherits = ["_attest"]
  context = "./versions/0.1.17.13/slim-bookworm"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17.13-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0-slim-bookworm",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
  }
}

target "slim-trixie" {
  inherits = ["_attest"]
  context = "./versions/0.1.17.13/slim-trixie"
  dockerfile = "Dockerfile"
  tags = [
    "docker.io/shotplay/fp-cardinal:latest",
    "docker.io/shotplay/fp-cardinal:latest-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17.13-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0-slim-trixie",
  ]
  labels = {
    "org.opencontainers.image.version"="${CARDINAL_VERSION}"
    "org.opencontainers.image.revision"="${CARDINAL_REVISION}"
  }
}

target "alpine-cross" {
  inherits = ["alpine"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
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