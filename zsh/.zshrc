# # profiling, check bottom of the file
# zmodload zsh/zprof # add this to the top of the file
# zprof # add this to the bottom of the file

# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Extentions path
export MY_EXTENSIONS="$HOME/.dotfiles/_extensions"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#
# zinit
#
autoload -U is-at-least
if is-at-least 5.1 && [ -d $MY_EXTENSIONS/zinit ]; then

  source $MY_EXTENSIONS/zinit/zinit.zsh
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  zplugin ice depth=1
  zplugin light romkatv/powerlevel10k

  # Auto suggestions
  if is-at-least 5.0.8; then
    typeset -g ZSH_AUTOSUGGEST_USE_ASYNC=1
  fi
  if is-at-least 5.3; then
    zinit ice silent wait'1' atload '_zsh_autosuggest_start'
  fi
  zinit light zsh-users/zsh-autosuggestions

  # Expand all aliases
  ZSH_EXPAND_ALL_DISABLE=""
  zinit light simnalamburt/zsh-expand-all

  # History substring search
  zinit light zsh-users/zsh-history-substring-search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # Ctrlf
  zinit light simnalamburt/ctrlf

  # Theme
  zinit light dracula/zsh

  zinit light zdharma/fast-syntax-highlighting

  # Other
  zinit light zsh-users/zsh-completions

  autoload -Uz compinit && compinit
  zinit cdreplay
else
  # Default terminal
  case "$TERM" in
    xterm-color|*-256color)
      PS1=$'\e[1;32m%n@%m\e[0m:\e[1;34m%~\e[0m%(!.#.$) ';;
    *)
      PS1='%n@%m:%~%(!.#.$) ';;
  esac
  autoload -Uz compinit && compinit
fi

#
# powerlevel10k. To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
#
[ ! -f ~/.p10k.zsh ] || source ~/.p10k.zsh
# Show me exit codes
typeset -g POWERLEVEL9K_STATUS_ERROR=true
# Less distractive colorscheme
typeset -g POWERLEVEL9K_TIME_FOREGROUND=242
# Magenta prompt symbol if the last command succeeded.
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND='#FF6AC1'
# Red prompt symbol if the last command failed.
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND='#FF5C57'

#
# zsh options http://zsh.sourceforge.net/Doc/Release/Options.html
#

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # allow multiple sessions to append to one history
setopt bang_hist                # treat ! special during command expansion
setopt extended_history         # Write history in :start:elasped;command format
setopt hist_expire_dups_first   # expire duplicates first when trimming history
setopt hist_find_no_dups        # When searching history, don't repeat
setopt hist_ignore_dups         # ignore duplicate entries of previous events
setopt hist_ignore_space        # prefix command with a space to skip it's recording
setopt hist_reduce_blanks       # Remove extra blanks from each command added to history
setopt hist_verify              # Don't execute immediately upon history expansion
setopt inc_append_history       # Write to history file immediately, not when shell quits
setopt share_history            # Share history among all sessions

# Tab completion
zstyle ':completion:*' menu select
# '' - complete the current word exactly
# 'm:{a-zA-Z}={A-Za-z}' - handle upper and lower case interchangeable
# 'l:|=* r:|=*' - complete on the left side of the written text, e.g. bar -> foobar
# 'r:|[._-]=* r:|=*' -  partial completion before . or _ or -
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt complete_in_word         # cd /ho/sco/tm<TAB> expands to /home/scott/tmp
setopt auto_menu                # show completion menu on succesive tab presses
# setopt autocd                   # cd to a folder just by typing it's name
setopt complete_aliases         # complete aliases
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&' # These "eat" the auto prior space after a tab complete

# Misc
setopt interactive_comments     # allow # comments in shell; good for copy/paste

# Path
typeset -U path                 # keep duplicates out of the path

# paths
for file in ~/.path/*; do
  source $file
done

# source
for file in ~/.source/*; do
  source $file
done

# alias
for file in ~/.alias/*; do
  source $file
done

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
