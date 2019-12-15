#!/usr/bin/env sh
echo -e "Which machine?"
read -p "> " machine
echo -e "Press <enter> to provision '${machine}'?\n  (Control-C to cancel)"
read -p "> "

set -e

sudo cp ./machines/${machine}/configuration.nix /etc/nixos/

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
