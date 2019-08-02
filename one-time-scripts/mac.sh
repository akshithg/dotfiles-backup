#!/usr/bin/env sh

if [[ $(uname -s) != "Darwin" ]]
then
    echo "Not MacOS. Exiting."
fi

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install all packages from Brewfile
brew bundle

# add zsh to /etc/shells
echo `which zsh` | sudo tee -a /etc/shells
