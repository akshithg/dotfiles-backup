#!/usr/bin/env sh

if [[ $(uname -s) != "Darwin" ]]
then
    echo "Not MacOS. Exiting."
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

defaults write NSGlobalDomain InitialKeyRepeat -int 0
