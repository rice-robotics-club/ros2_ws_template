#!/bin/bash
set -e

(cat <<'EOF'
user:deluser=pi
user:adduser=${WS_NAME}|password=${WS_NAME}
apt-addrepo:repo=deb http://packages.ros.org/ros2/ubuntu/ noble|gpgkey=https://github.com/ros-infrastructure/ros-apt-source/raw/refs/heads/main/ros-apt-source/keys/ros2-archive-keyring.gpg
apps:apps=ros-jazzy-desktop
network:ifname=wlan0|PBS4|wifipassword=DPS2home01|wificountry=US
network:ifname=eth0
L10n:keymap=us|locale=en_US.UTF-8|timezone=America/Chicago|wificountry=us
disables:piwiz|cloudinit
sshkey:sshuser=${WS_NAME}|import-key=./id_ed25519|passphrase=
git-clone:repo=git@github.com:${REPO}.git|gitdir=/home/${WS_NAME}/${REPO_NAME}|user=${WS_NAME}
EOF
    ) | bash -c "cat >> ./my.plugins"

sdm --customize --plugin @./my.plugins --extend --xmb 2048 --restart --logwidth 256 ubuntu.img.xz
