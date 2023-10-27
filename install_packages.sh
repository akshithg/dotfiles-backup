#!/usr/bin/env zsh

set -e

source ./utils.sh

update_git_submodules

pTitle "Installing packages and dependencies"

pStep "Determining OS"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    OS="Linux"
else
    pError "Unsupported OS: $OSTYPE"
    exit 1
fi
pStepDone "OS: $OS"

if [[ "$OS" == "macOS" ]]; then
    pStep "Installing Homebrew packages"
    ./_install/brew_install.sh
    pStepDone "Homebrew packages installed"
fi

if [[ "$OS" == "Linux" ]]; then
    pStep "Installing apt packages"
    ./_install/apt_install.sh
    pStepDone "Apt packages installed"
fi

pStep "Installing Rustup and Binary Crates"
./_install/cargo_install.sh
pStepDone "Rustup and Binary Crates installed"
