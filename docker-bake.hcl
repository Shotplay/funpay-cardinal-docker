group "default" {
    targets = ["cardinal"]
}

variable "VERSION" {
    default = "0.1.17.12"
}

variable "MAJOR" {
    default = split(".", VERSION)[0]
}

variable "MINOR" {
    default = split(".", VERSION)[1]
}

variable "PATCH" {
    default = split(".", VERSION)[2]
}

variable "BUILD" {
    default = split(".", VERSION)[3]
}

target "cardinal" {
    name = "cardinal-${base}"
    matrix = {
        base = ["alpine","slim-bookworm","slim-trixie"]
    }
    context = "./${base}"
    dockerfile = "Dockerfile"
    tags = compact([
        equal("slim-trixie", "${base}") ? "docker.io/shotplay/fp-cardinal:latest" : "",
        "docker.io/shotplay/fp-cardinal:latest-${base}",
        "docker.io/shotplay/fp-cardinal:${VERSION}-${base}",
        "docker.io/shotplay/fp-cardinal:${MAJOR}.${MINOR}.${PATCH}-${base}",
        "docker.io/shotplay/fp-cardinal:${MAJOR}.${MINOR}-${base}",
        "docker.io/shotplay/fp-cardinal:${MAJOR}-${base}",
    ])
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

