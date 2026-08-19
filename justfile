set-cardinal-version version:
  jq --arg ver "{{ version }}" '.cardinal.version=$ver | (.final[].labels."org.opencontainers.image.version")=$ver' spec.json

