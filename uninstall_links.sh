#!/usr/bin/env zsh

set -e

source ./utils.sh

pTitle "Uninstalling symlinks"

pStep "Check `stow` is installed"
if command_exists stow ; then
  pStepDone "stow is installed"
else
  pBad "stow is not installed"
  exit 1
fi

pStep "Unstowing dotfiles"
for dir in */; do
  cmd=$(basename $dir)
  if command_exists $cmd ; then
    stow -D $cmd
    pGood "Unstowed $cmd"
  else
    pBad "Not unstowing $cmd"
  fi
done
pStepDone "Unstowed dotfiles"
