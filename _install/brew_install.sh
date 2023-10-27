#!/usr/bin/env sh

set -eu

# Install Homebrew
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
}

# Install Homebrew packages
install_homebrew_packages() {
    brew bundle install --file=_install/Brewfile
}

install_homebrew
install_homebrew_packages
