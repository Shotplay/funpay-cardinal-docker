update-version version:
    jq --arg ver "{{ version }}" -r '.cardinal_version=$ver' config.json > /tmp/config.json; \
    mv /tmp/config.json config.json

build:
    chmod +x update.sh; \
    ./update.sh; \
    docker buldx bake -f docker-bake.hcl
