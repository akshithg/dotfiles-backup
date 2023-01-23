#!/usr/bin/env sh

set -e

source utils.sh

pTitle "Installing packages and dependencies"

pStep "Updating submodules"
git submodule update --init --recursive
pStepDone "Submodules updated"

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
  if ! command -v brew &> /dev/null; then
    pStep "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    pStepDone "Homebrew installed"
  fi

  pStep "Installing Homebrew packages"
  brew bundle install --file=_install/Brewfile
fi
