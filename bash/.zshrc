# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
  git-extras
  catimg
  django
  npm
  pip
  pyenv
  python
  common-aliases
  dircycles
  gitfast
  jsontools
  systemd
  nyan
  lol
  web-search
)

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

autoload -Uz colors && colors
local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"
export PROMPT="${ret_status} %{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$ "

alias src="source $HOME/.zshrc"

export DOTFILES="$HOME/.dotfiles"

source $DOTFILES/bash/base.sh
