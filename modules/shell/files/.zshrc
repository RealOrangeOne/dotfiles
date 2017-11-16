# Path to oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

# Plugins
plugins=(
    django
    jsontools
    nyan
    pip
    pyenv
    python
    common-aliases
    gitfast
    zsh-completions
    extract
)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit


autoload -Uz colors && colors
local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"
export PROMPT="${ret_status} %{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$ "
COMPLETION_WAITING_DOTS="true"

alias src="source $HOME/.zshrc"

