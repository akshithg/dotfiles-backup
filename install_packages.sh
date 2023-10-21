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
  if ! command -v brew &> /dev/null; then
    pStep "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    pStepDone "Homebrew installed"
  fi

  pStep "Installing Homebrew packages"
  brew bundle install --file=_macOS/Brewfile
fi
