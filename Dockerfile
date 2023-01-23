FROM ubuntu:latest

# packages
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y stow zsh && \
    rm -rf /var/lib/apt/lists/*

# non root passwordless user with sudo privileges
RUN adduser \
        --disabled-password \
        --gecos '' \
        --shell /usr/bin/zsh \
        g && \
    adduser g sudo && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER g
WORKDIR /home/g
CMD ["/usr/bin/zsh"]
