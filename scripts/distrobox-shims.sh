#!/bin/sh

[ ! -e /usr/bin/sh ] && ln -fs /bin/sh /usr/bin/sh

for cmd in docker flatpak podman rpm-ostree gsettings transactional-update dconf distrobox; do
  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/"$cmd"
done
