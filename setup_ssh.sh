#!/usr/bin/env zsh

set -e

source ./utils.sh

pTitle "Setting up SSH"

pStep "Removing existing ~/.ssh/authorized_keys"
rm $HOME/.ssh/authorized_keys

pStep "Copying new authorized_keys"
cp ssh/.ssh/authorized_keys ~/.ssh/authorized_keys
