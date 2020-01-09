#!/usr/bin/env sh
sys_machine=$(cat /sys/class/dmi/id/product_version)
guess_machine=''

if [[ $sys_machine =~ "ThinkPad X1 Carbon" ]]
then
  guess_machine='x1-carbon'
fi

echo -e "Which machine? Press enter if it's ${guess_machine} ... "
read -p "> " machine
actual_machine=${machine:-${guess_machine}}

# Different machine, ask for confirmation
if [[ $actual_machine != $guess_machine ]]
then
  echo -e "Press <enter> to confirm provision '${actual_machine}'?\n  (Control-C to cancel)"
  read -p "> "
fi

set -e

sudo cp ./machines/${actual_machine}/configuration.nix /etc/nixos/

sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
