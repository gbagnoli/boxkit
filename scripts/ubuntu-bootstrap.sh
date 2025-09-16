#!/bin/bash

set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "$SCRIPT_DIR"/ &>/dev/null
# Symlink distrobox shims
./distrobox-shims.sh

apt_get () {
  DEBIAN_FRONTEND=noninteractive \
  apt-get \
  -o Dpkg::Options::=--force-confold \
  -o Dpkg::Options::=--force-confdef \
  -y --allow-downgrades --allow-remove-essential --allow-change-held-packages "$@"
}

apt_get update
apt_get full-upgrade
apt_get autoremove
apt_get autoclean

apt_get install lsb-release git exiftool gpsbabel python3-tz rename buildah curl build-essential
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file Brewfile
