#!/usr/bin/env sh
mkdir -p ${HOME}/.config/nixpkgs

if ! [ -x "$(command -v home-manager)" ]; then
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
    nix-channel --update

    nix-shell '<home-manager>' -A install
fi

if [ ! -d "${HOME}/.zinit/bin" ];
then
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin;
fi

rm -rf ${HOME}/.config/nixpkgs/home.nix ${HOME}/.config/nixpkgs/includes

cp ./user.nix ${HOME}/.config/nixpkgs/home.nix
cp -R includes ${HOME}/.config/nixpkgs/

nix-channel --update

home-manager switch
