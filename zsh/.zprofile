# Set PATH, MANPATH, etc., for Homebrew.

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ -f ~/.linuxbrew/bin/brew ]]; then
    eval "$(~/.linuxbrew/bin/brew shellenv)"
fi
