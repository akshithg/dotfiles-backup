#!/usr/bin/env bash

SCRIPTDIR="${0%/*}"
source $SCRIPTDIR/../pretty-print

pHeader "Setting up Linux"
# Linux-only stuff. Abort if not Linux.
if [[ $(uname -s) != "Linux" ]]; then
    pBad "Not Linux. Exiting."
fi

# install packages
pStep "Installing packages..."
sudo apt-get -q update && sudo apt-get install --no-install-recommends -y \
    build-essential \
    gawk \
    g++ \
    gcc \
    gdb \
    git \
    git-extras \
    git-flow \
    git-lfs \
    golang \
    htop \
    iproute2 \
    locales \
    pkg-config \
    python3 \
    python3-pip \
    python3-dev \
    ssh \
    sudo \
    tmux \
    tree \
    vim \
    unzip \
    wget \
    zsh && \
rm -rf /var/lib/apt/lists/* && \
locale-gen en_US.UTF-8
pFinishStep "Done!"
