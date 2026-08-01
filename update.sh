#!/bin/bash

CONFIG_PATH="config.json"
TARGETS=$(jq -c '.targets | keys' $CONFIG_PATH)
CARDINAL_VERSION="$(jq -r '.cardinal_version' $CONFIG_PATH)"
CARDINAL_VERSION_CLEAN="${CARDINAL_VERSION#v}"

sed \
    -e "s/{{TARGETS}}/${TARGETS}/" \
    -e "s/{{CARDINAL_VERSION}}/${CARDINAL_VERSION_CLEAN}/" \
    docker-bake.hcl.template > docker-bake.hcl

for target in $(jq -r '.targets | keys[]' $CONFIG_PATH); do
    BASE_IMAGE="$(jq --arg target "$target" -r '.targets[$target].image' $CONFIG_PATH)"
    DOCKERFILE="$(sed \
        -e "s#{{BASE_IMAGE}}#${BASE_IMAGE}#" \
        -e "s/{{CARDINAL_VERSION}}/${CARDINAL_VERSION}/" \
        Dockerfile.tmpl
    )"

    mkdir -p "$target"
    cat > "$target/Dockerfile" <<__EOF__
# =========================================================
# This dockerfile is generated via "update.sh".
# 
# Please do not edit it directly.
# =========================================================

${DOCKERFILE}
__EOF__

done
