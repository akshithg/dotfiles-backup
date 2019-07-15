FROM ubuntu:18.04

RUN apt-get -q update && \
    apt-get install --no-install-recommends -y \
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
