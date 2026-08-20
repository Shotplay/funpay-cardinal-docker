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

target "alpine" {
  inherits = ["_attest", "_cross"]
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
    "org.opencontainers.image.version"="0.1.17.13"
    "org.opencontainers.image.revision"="4e62af063fab4e9164b6a8bfdb2ac387f2b0a83f"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-alpine3.24"
  }
}

target "distroless" {
  inherits = ["_attest", "_cross"]
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
    "org.opencontainers.image.version"="0.1.17.13"
    "org.opencontainers.image.revision"="4e62af063fab4e9164b6a8bfdb2ac387f2b0a83f"
    "org.opencontainers.image.base.name"="gcr.io/distroless/cc-debian13:latest"
  }
}

target "slim-bookworm" {
  inherits = ["_attest", "_cross"]
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
    "org.opencontainers.image.version"="0.1.17.13"
    "org.opencontainers.image.revision"="4e62af063fab4e9164b6a8bfdb2ac387f2b0a83f"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-slim-bookworm"
  }
}

target "slim-trixie" {
  inherits = ["_attest", "_cross"]
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
    "org.opencontainers.image.version"="0.1.17.13"
    "org.opencontainers.image.revision"="4e62af063fab4e9164b6a8bfdb2ac387f2b0a83f"
    "org.opencontainers.image.base.name"="docker.io/python:3.11-slim-trixie"
  }
}

target "_cross" {
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64/v8",
    "linux/ppc64le",
    "linux/riscv64"
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