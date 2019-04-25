#!/bin/bash

function get_latest_release {
    mkdir -p $3
    url=$(curl -s -L https://api.github.com/repos/$1/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("'$2'")) | .browser_download_url')
    base="$3/$(basename $url)"
    wget -O $base $url
    if [ ! -f $base ]; then
      echo "Failed to download latest release of $1 for platform $2 to $base"
      exit 1
    fi
    chmod +x $base
}

get_latest_release cloudfoundry/bosh-cli linux-amd64 bosh-cli
mv bosh-cli/bosh-cli-*-linux-amd64 bosh-cli/bosh && chmod +x bosh-cli/bosh
get_latest_release pivotal-cf/om linux om
mv om/om-linux om/om && chmod +x om/om
get_latest_release cloudfoundry-incubator/credhub-cli linux credhub-cli
tar -xzf credhub-cli/credhub-linux-*.tgz -C credhub-cli && chmod +x credhub-cli/credhub
rm credhub-cli/credhub-linux-*.tgz
