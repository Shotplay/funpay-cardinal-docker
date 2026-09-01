set lazy

JUST := `which just`
JQ := `which jq`

CARDINAL_VERSION := `{{JQ}} '.cardinal.version' spec.json`
CARDINAL_VERSION_JQ_FILTER := '
.cardinal.version = $ver
| .cardinal.source.github.rev = $rev
'

update-version version revision:
  mkdir -p versions/{{ version }}
  just set-cardinal-version {{ version }} {{ revision }}
  cp spec.json versions/{{ version }}/spec.json
  just update-bake {{ version }}
  just update-dockerfiles {{ version }}

update-dockerfiles version:
  just update-dockerfile-target "{{ version }}" "alpine" 
  just update-dockerfile-target "{{ version }}" "distroless" 
  just update-dockerfile-target "{{ version }}" "slim-trixie" 
  just update-dockerfile-target "{{ version }}" "slim-bookworm" 

set-cardinal-version version revision:
  jq \
    --arg ver "{{ version }}" \
    --arg rev "{{ revision }}" \
    '{{ CARDINAL_VERSION_JQ_FILTER }}' \
    spec.json > spec.json.tmp
  mv spec.json.tmp spec.json

update-bake version:
  gomplate \
  -c spec=versions/{{ version }}/spec.json \
  -f templates/docker-bake.hcl.tmpl \
  -o versions/{{ version }}/docker-bake.hcl \
  -t templates/macros/license.tmpl

update-dockerfile-target version target:
  TARGET="{{ target }}" \
  gomplate \
  -c spec=versions/{{ version }}/spec.json \
  -f templates/Dockerfile.tmpl \
  -o versions/{{ CARDINAL_VERSION }}/{{ target }}/Dockerfile \
  -t templates/macros/build.tmpl \
  -t templates/macros/env.tmpl \
  -t templates/macros/final.tmpl \
  -t templates/macros/license.tmpl

