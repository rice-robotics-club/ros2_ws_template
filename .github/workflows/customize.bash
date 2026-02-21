#!/bin/bash
set -e

sdm --customize \
    --plugin user:"deluser=pi|adduser=${WS_NAME}|password=${WS_NAME}" \
    # --plugin apt-addrepo:"repo=deb http://packages.ros.org/ros2/ubuntu/ noble|gpgkey=https://github.com/ros-infrastructure/ros-apt-source/raw/refs/heads/main/ros-apt-source/keys/ros2-archive-keyring.gpg" \
    --plugin network:"ifname=wlan0|wifissid=PBS4|wifipassword=DPS2home01|wificountry=US|ifname=eth0" \
    --plugin L10n:"keymap=us|locale=en_US.UTF-8|timezone=America/Chicago|wificountry=us" \
    --plugin disables:"piwiz|cloudinit" \
    # --plugin apps:"ros-jazzy-desktop" \
    --plugin sshkey:"sshuser=${WS_NAME}|import-key=./id_ed25519|passphrase=" \
    --plugin git-clone:"repo=git@github.com:${REPO}.git|gitdir=/home/${WS_NAME}/${REPO_NAME}|user=${WS_NAME}" \
    --extend --xmb 2048 --restart --logwidth 256 ubuntu.img.xz
