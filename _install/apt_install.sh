#!/usr/bin/env sh

set -eu

install_apt_packages() {
    sudo apt update
    sudo apt install -y \
        build-essential \
        fzf \
        git \
        git-extras \
        jq \
        llvm \
        n \
        neovim \
        ninja-build \
        python3 \
        shellcheck \
        stow \
        tmux \
        zsh
}

install_apt_packages
