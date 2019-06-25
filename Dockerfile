# base image
FROM ubuntu:18.04

RUN apt-get -q update && \
    # upgrade - not good practice, but this isn't production ¯\_(ツ)_/¯
    apt-get upgrade -y && \
    apt-get install -y \
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
    locale-gen en_US.UTF-8

RUN useradd --create-home --shell /usr/bin/zsh g
RUN echo "g ALL=NOPASSWD: ALL" > /etc/sudoers.d/g

COPY .git /home/g/dotfiles/.git
RUN chown -R g.g /home/g/dotfiles

USER g
WORKDIR /home/g/dotfiles
RUN git checkout . && \
    ./install

WORKDIR /home/g
CMD ["zsh"]
