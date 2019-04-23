#!/bin/bash

function get_latest_release {
    url=$(curl -s -L https://api.github.com/repos/$1/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("'$2'")) | .browser_download_url')
    base="$3/$(basename $url)"
    wget -q -nv -O $base $url
    if [ ! -f $base ]; then
      echo "Failed to download latest release of $1 for platform $2 to $base"
      exit 1
    fi
    chmod +x $base
}

mkdir -p deps
rm  deps/*

get_latest_release cloudfoundry/bosh-cli linux-amd64 deps
mv deps/bosh-cli-*-linux-amd64 deps/bosh && chmod +x deps/bosh
get_latest_release pivotal-cf/om linux deps
mv deps/om-linux deps/om && chmod +x deps/om
get_latest_release cloudfoundry-incubator/credhub-cli linux deps
tar -xzf deps/credhub-linux-*.tgz -C deps && chmod +x deps/credhub
rm deps/credhub-linux-*.tgz
