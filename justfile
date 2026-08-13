set-cardinal-version version:
    sed -i 's/^version: .*/version: {{ version }}/' configs/cardinal.yaml

update-to version:
    just set-cardinal-version "{{ version }}"
    just update-all-targets

update-all-targets:
    just update-target "alpine"
    just update-target "slim-bookworm"
    just update-target "slim-trixie"

update-dockerfile-all-targets:
    just update-dockerfile-target "alpine"
    just update-dockerfile-target "slim-bookworm"
    just update-dockerfile-target "slim-trixie"

update-dockerfile-target target:
    gomplate \
      -c target="configs/{{ target }}.yaml" \
      -f templates/Dockerfile.tmpl \
      -o "targets/contexts/{{ target }}/Dockerfile"

update-target target:
    gomplate \
      -c target="configs/{{ target }}.yaml" \
      -f templates/docker-bake.hcl.tmpl \
      -o "targets/{{ target }}.hcl"
