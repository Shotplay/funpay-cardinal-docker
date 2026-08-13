# =========================================================
# THIS FILE IS GENERATED VIA "just update-target slim-bookworm".
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

group "default" {
  targets = ["cardinal-slim-bookworm"]
}

target "cardinal-slim-bookworm" {
  context = "./context"
  dockerfile = "Dockerfile"
  args = {
    CARDINAL_VERSION = "0.1.17.8"
    CARDINAL_REPOSITORY = "https://github.com/sidor0912/FunPayCardinal.git"
    CARDINAL_CLEANUP = ".git .github .gitignore README.md Cardinal.ico install-fpc.sh FunPayCardinal@.service Start.bat Setup.bat"
    GIT_IMAGE = "docker.io/alpine/git:2.54.0"
    BUILDER_IMAGE = "docker.io/python:3.11-slim-bookworm"
    FINAL_IMAGE = "docker.io/python:3.11-slim-bookworm"
  }
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17.8-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0.1-slim-bookworm",
    "docker.io/shotplay/fp-cardinal:0-slim-bookworm",
  ]
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