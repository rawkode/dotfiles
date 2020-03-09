#!/usr/bin/env sh
sys_machine=$(cat /sys/class/dmi/id/product_version)
guess_machine=''

if [[ $sys_machine =~ "ThinkPad X1 Carbon" ]]
then
  guess_machine='x1c7'
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

sudo rm -rf /etc/nixos/{overlays,packages}

sudo cp ./machines/${actual_machine}/configuration.nix /etc/nixos/
sudo cp -r ./machines/${actual_machine}/{overlays,packages} /etc/nixos/

sudo -i nix-channel --add https://nixos.org/channels/nixos-20.03 nixos
sudo -i nix-channel --update

sudo -i nixos-rebuild switch --upgrade
