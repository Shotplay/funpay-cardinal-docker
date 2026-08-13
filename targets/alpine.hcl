# =========================================================
# THIS FILE IS GENERATED VIA "just update-target alpine".
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

group "default" {
  targets = ["cardinal-alpine"]
}

target "cardinal-alpine" {
  context = "./context"
  dockerfile = "Dockerfile"
  args = {
    CARDINAL_VERSION = "0.1.17.4"
    CARDINAL_REPOSITORY = "https://github.com/sidor0912/FunPayCardinal.git"
    CARDINAL_CLEANUP = ".git .github .gitignore README.md Cardinal.ico install-fpc.sh FunPayCardinal@.service Start.bat Setup.bat"
    GIT_IMAGE = "docker.io/alpine/git:2.54.0"
    BUILDER_IMAGE = "docker.io/python:3.11-alpine"
    FINAL_IMAGE = "docker.io/python:3.11-alpine"
  }
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17.4-alpine",
    "docker.io/shotplay/fp-cardinal:0.1.17-alpine",
    "docker.io/shotplay/fp-cardinal:0.1-alpine",
    "docker.io/shotplay/fp-cardinal:0-alpine",
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