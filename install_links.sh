#!/usr/bin/env sh

set -e

source utils.sh

pTitle "Installing symlinks"

pStep "Check `stow` is installed"
if command_exists stow ; then
  pStepDone "stow is installed"
else
  pBad "stow is not installed"
  exit 1
fi

pStep "Stowing dotfiles"
for dir in */; do
  cmd=$(basename $dir)
  if command_exists $cmd ; then
    stow $cmd
    pGood "Stowed $cmd"
  else
    pBad "Not stowing $cmd"
  fi
done
pStepDone "Stowed dotfiles"
