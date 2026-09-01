set lazy

JUST := `which just`
JQ := `which jq`
MKDIR := `which mkdir`
CP := `which cp`
ECHO := `which echo`
GOMPLATE := `which gomplate`
MV := `which mv`
RM := `which rm`
MKTEMP := `which mktemp`

CARDINAL_VERSION_JQ_FILTER := '
.cardinal.version = $ver
| .cardinal.source.github.rev = $rev
'

version:
    @{{ ECHO }} $({{ JQ }} -r '.cardinal.version' spec.json)

prepare-version VERSION REVISION:
    {{ MKDIR }} -p versions/{{ VERSION }}
    @{{ ECHO }} \
      "`{{ JUST }} set-cardinal-spec-version "{{ VERSION }}" "{{ REVISION }}"`" \
      > spec.json
    {{ CP }} spec.json versions/{{ VERSION }}/

update-version VERSION REVISION:
    @{{ JUST }} prepare-version "{{ VERSION }}" "{{ REVISION }}"
    @{{ JUST }} update-bake {{ VERSION }}
    @{{ JUST }} update-dockerfiles {{ VERSION }}

update-dockerfiles VERSION:
    #!/usr/bin/env bash

    for TARGET in $({{ JQ }} -r -c '.final | keys[]' spec.json); do
      {{ JUST }} update-dockerfile-target "{{ VERSION }}" ${TARGET}
    done

update-bake VERSION:
    {{ GOMPLATE }} \
    -c spec=versions/{{ VERSION }}/spec.json \
    -f templates/docker-bake.hcl.tmpl \
    -o versions/{{ VERSION }}/docker-bake.hcl \
    -t templates/macros/license.tmpl

update-dockerfile-target VERSION TARGET:
    TARGET={{ TARGET }} \
    {{ GOMPLATE }} \
    -c spec=versions/{{ VERSION }}/spec.json \
    -f templates/Dockerfile.tmpl \
    -o versions/`{{ JUST }} version`/{{ TARGET }}/Dockerfile \
    -t templates/macros/build.tmpl \
    -t templates/macros/env.tmpl \
    -t templates/macros/final.tmpl \
    -t templates/macros/license.tmpl

[private]
set-cardinal-spec-version VERSION REVISION:
    {{ JQ }} -r \
        --arg ver "{{ VERSION }}" \
        --arg rev "{{ REVISION }}" \
        '{{ CARDINAL_VERSION_JQ_FILTER }}' \
        spec.json