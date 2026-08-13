set-cardinal-version version:
    sed -i 's/^version: .*/version: {{ version }}/' configs/cardinal.yaml

update-target target:
    gomplate \
      -d target="configs/{{ target }}.yaml" \
      -f docker-bake.hcl.tmpl \
      -o "targets/{{ target }}.hcl"

update-all-targets:
  just update-target "alpine"
  just update-target "slim-bookworm"
  just update-target "slim-trixie"

update-to version:
  just set-cardinal-version "{{ version }}"
  just update-all-targets