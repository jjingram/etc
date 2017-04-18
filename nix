#!/usr/bin/env bash

if [ ! -d "$HOME/.nix-profile" ]; then
        curl https://nixos.org/nix/install | sh
fi

source ~/.nix-profile/etc/profile.d/nix.sh
