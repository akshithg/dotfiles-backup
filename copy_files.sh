#!/usr/bin/env zsh

set -e

source ./utils.sh


pTitle "SSH"
pStep "Unlink and copy ~/.ssh/authorized_keys"

unlink ~/.ssh/authorized_keys
cp ssh/.ssh/authorized_keys ~/.ssh/authorized_keys
