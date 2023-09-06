#!/usr/bin/env zsh

set -e

source ./utils.sh

pTitle "Create base directories"
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.local/share


pTitle "Installing symlinks"

pStep "Check `stow` is installed"
if command_exists stow ; then
  pStepDone "stow is installed"
  STOW_EXEC=stow
elif command_exists $HOME/stow/bin/stow ; then
  pStepDone "stow is installed"
  STOW_EXEC=$HOME/stow/bin/stow
else
  pBad "stow is not installed. Try ./install_stow.sh first"
  exit 1
fi

pStep "Stowing dotfiles"
for dir in */; do
  cmd=$(basename $dir)
  if command_exists $cmd ; then
    $STOW_EXEC $cmd
    pGood "Stowed $cmd"
  else
    pBad "Not stowing $cmd"
  fi
done
pStepDone "Stowed dotfiles"
