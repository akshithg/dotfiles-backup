#!/usr/bin/env sh

set -eu

install_apt_packages() {
    sudo apt update
    sudo apt install -y \
        bat \
        git \
        git-extras \
        htop \
        jq \
        llvm \
        neovim \
        python3 \
        shellcheck \
        stow \
        tmux \
        vivid \
        wget \
        zsh
}

install_apt_packages
