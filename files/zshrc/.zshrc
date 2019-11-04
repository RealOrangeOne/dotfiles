# Path to oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

# Plugins
plugins=(
  django
  pip
  python
  common-aliases
  extract
  heroku
)

export COMPLETION_WAITING_DOTS="true"

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export fpath=(/usr/share/zsh/site-functions $fpath)

autoload -U compinit && rm -f ~/.zcompdump && compinit
autoload -Uz colors && colors

local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}λ )"
export PROMPT="${ret_status} %{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%}$ "

alias src="source {{ home }}/.zshrc && tmux source {{ home }}/.tmux.conf"

{% include "base.sh" %}
{% include "environment.sh" %}
{% include "applications.sh" %}
{% include "catfish.sh" %}
{% include "javascript.sh" %}
