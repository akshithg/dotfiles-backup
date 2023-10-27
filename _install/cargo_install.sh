#!/usr/bin/env sh

set -eu

install_rustup() {
    if command -v rustup &> /dev/null; then
        echo "Rustup is already installed"
        return
    fi
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup completions zsh > ~/.zfunc/_rustup
}

install_cargo() {
    if command -v cargo &> /dev/null; then
        echo "Cargo is already installed"
        return
    fi
    rustup update
}

install_rust_binaries() {
    cargo install \
        bat \
        du-dust \
        eza \
        fd-find \
        git-delta \
        procs \
        ripgrep \
        tokei \
        vivid
}

install_rustup
install_cargo
install_rust_binaries
