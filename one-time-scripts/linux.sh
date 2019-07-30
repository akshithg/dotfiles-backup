#!/usr/bin/env sh

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Sorry, this is not a linux environment"
fi

USER=$(whoami)
if [[ "$USER" != "root" ]]; then
    echo "Please use sudo"
    exit 1
fi

apt-get -q update && apt-get install --no-install-recommends -y \
    build-essential \
    gawk \
    g++ gcc \
    git \
    iproute2 \
    locales \
    python3 \
    python3-pip \
    python3-dev \
    ssh \
    sudo \
    tmux \
    vim \
    unzip \
    wget \
    zsh && \
rm -rf /var/lib/apt/lists/* && \
locale-gen en_US.UTF-8
