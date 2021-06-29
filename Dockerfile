FROM ubuntu:latest

# packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        git \
        git-extras \
        htop \
        neovim \
        python3 \
        python3-pip \
        python3-dev \
        ssh \
        sudo \
        tmux \
        tree \
        unzip \
        wget \
        zsh && \
    rm -rf /var/lib/apt/lists/*

# non root passwordless user with sudo privileges
RUN adduser \
        --disabled-password \
        --gecos '' \
        --shell /usr/bin/zsh \
        g && \
    adduser g sudo && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# copy dotfiles
WORKDIR /home/g/.dotfiles
COPY . ./
RUN chown -R g:g ./

# swtich user
USER g
ENV USER g

# install dotfiles
RUN ./install

WORKDIR /home/g
CMD ["/usr/bin/zsh"]
