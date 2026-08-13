# =========================================================
# THIS FILE IS GENERATED VIA "just update-target alpine".
# 
# PLEASE DO NOT EDIT IT MANUALLY.
# =========================================================

group "default" {
  targets = ["cardinal-alpine"]
}

target "cardinal-alpine" {
  context = "contexts/alpine"
  dockerfile = "Dockerfile"
  args = {
    CARDINAL_VERSION = "v0.1.17.12"
    CARDINAL_REPOSITORY = "https://github.com/sidor0912/FunPayCardinal.git"
    CARDINAL_CLEANUP = ".git .github .gitignore README.md Cardinal.ico install-fpc.sh FunPayCardinal@.service Start.bat Setup.bat"
  }
  tags = [
    "docker.io/shotplay/fp-cardinal:latest-alpine",
    "docker.io/shotplay/fp-cardinal:v0.1.17.12-alpine",
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