#!/bin/sh

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
        git-lfs \
        tree \
        vim \
        wget
}

install_dev(){
    echo "installing dev ..."
    brew install \
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
    brew_update
    install_basic
    install_dev
    install_writing
    install_extras
}
