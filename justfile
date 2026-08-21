set lazy

cardinal_version := `jq '.cardinal.version' spec.json`
cardinal_version_jq_filter := '
.cardinal.version = $ver
| .cardinal.source.github.rev = $rev
| (.final[].labels."org.opencontainers.image.version") = $ver
'

update:
  just update-bake
  just update-dockerfile-target "alpine"
  just update-dockerfile-target "distroless"
  just update-dockerfile-target "slim-trixie"
  just update-dockerfile-target "slim-bookworm"

update-version version revision:
  just set-cardinal-version {{ version }} {{ revision }}
  just update

set-cardinal-version version revision:
  jq \
    --arg ver "{{ version }}" \
    --arg rev "{{ revision }}" \
    '{{ cardinal_version_jq_filter }}' \
    spec.json > spec.json.tmp
  mv spec.json.tmp spec.json

update-dockerfile-target target:
  TARGET="{{ target }}" \
  gomplate -c spec=spec.json \
  -f templates/Dockerfile.tmpl \
  -o versions/{{ cardinal_version }}/{{ target }}/Dockerfile \
  -t templates/macros/build.tmpl \
  -t templates/macros/env.tmpl \
  -t templates/macros/final.tmpl \
  -t templates/macros/license.tmpl

update-bake:
  gomplate -c spec=spec.json \
  -f templates/docker-bake.hcl.tmpl \
  -o docker-bake.hcl \
  -t templates/macros/license.tmpl
