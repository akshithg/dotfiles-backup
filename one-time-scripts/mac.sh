#!/bin/sh

# keyboard setup
keyboard_setup(){
defaults write NSGlobalDomain InitialKeyRepeat -int 0
defaults write NSGlobalDomain KeyRepeat -int 0
}

# install brew
brew_setup(){
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

brew_update(){
    echo "brew update ..."
    brew update && brew upgrade && brew cleanup
}

install_basic(){
    echo "installing basic ..."
    brew install \
        git \
        tree \
        vim \
        wget
}

install_dev(){
    echo "installing dev ..."
    brew install \
        git-lfs \
        go \
        hugo \
        python

    brew cask install \
        docker \
        visual-studio-code
}

install_writing(){
    echo "installing writing ..."
    brew cask install \
        mactex \
        mathpix-snipping-tool \
        trezor-bridge
}

install_extras(){
    echo "installing extras ..."
    brew cask install \
        lumen \
        trezor-bridge
}

install_all(){
    echo "installing all ..."
    keyboard_setup
    brew_update
    install_basic
    install_dev
    install_writing
    install_extras
}
