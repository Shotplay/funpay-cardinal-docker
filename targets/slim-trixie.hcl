# =========================================================
# THIS FILE IS GENERATED VIA "just update-target slim-trixie".
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

group "default" {
  targets = ["cardinal-slim-trixie"]
}

target "cardinal-slim-trixie" {
  context = "./context"
  dockerfile = "Dockerfile"
  args = {
    CARDINAL_VERSION = "0.1.17.7"
    CARDINAL_REPOSITORY = "https://github.com/sidor0912/FunPayCardinal.git"
    CARDINAL_CLEANUP = ".git .github .gitignore README.md Cardinal.ico install-fpc.sh FunPayCardinal@.service Start.bat Setup.bat"
    GIT_IMAGE = "docker.io/alpine/git:2.54.0"
    BUILDER_IMAGE = "docker.io/python:3.11-slim-trixie"
    FINAL_IMAGE = "docker.io/python:3.11-slim-trixie"
  }
  tags = [
    "docker.io/shotplay/fp-cardinal:latest","docker.io/shotplay/fp-cardinal:latest-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17.7-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1.17-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0.1-slim-trixie",
    "docker.io/shotplay/fp-cardinal:0-slim-trixie",
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