#!/usr/bin/env bash

set -euox pipefail

DIRNAME="$( dirname "${BASH_SOURCE[0]}" | realpath)"

cd "${DIRNAME}"

fswatch -r -e ".*/_site/.*" -e ".*/docs/.*" -e ".*/.idea/.*" . ../jekyll-design-tag-framework | xargs -n1 -I{} touch docs/pages/index.md
