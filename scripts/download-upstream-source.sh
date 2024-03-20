#!/bin/bash

# ./scripts/download-upstream-source.sh v6.5

set -e

GIT_REF=$1

mkdir -p "src/${GIT_REF}"

download_urls=$(curl -s -H 'Accept: application/vnd.github.v3.raw' \
    "https://api.github.com/repos/torvalds/linux/contents/drivers/net/vxlan?ref=${GIT_REF}" \
    | jq -r '.[].download_url')

for url in $download_urls; do
    wget --quiet --no-clobber -P "src/${GIT_REF}" $url
done
