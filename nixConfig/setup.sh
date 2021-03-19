#! /usr/bin/env bash

set +x

export PINNED_NIX_PKGS="https://github.com/NixOS/nixpkgs/archive/916ee862e87.tar.gz"
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

sudo cp system/configuration.nix /etc/nixos/
sudo cp -r system/wm/ /etc/nixos/
sudo nixos-rebuild -I nixpkgs=$PINNED_NIX_PKGS switch --upgrade

mkdir -p $HOME/.config/polybar/logs
touch $HOME/.config/polybar/logs/bottom.log
touch $HOME/.config/polybar/logs/top.log

mkdir -p $HOME/.config/nixpkgs/
cp -r home/* $HOME/.config/nixpkgs/
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
cp ./testPic.jpg $HOME/Pictures/
home-manager switch
