# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory autocd notify
setopt inc_append_history share_history
# ignore duplicates in history
setopt hist_ignore_all_dups

unsetopt beep
bindkey -e

bindkey \^U backward-kill-line

autoload -U select-word-style
select-word-style bash

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dorian/.zshrc'

LS_COLORS="$LS_COLOR"":ex=32"
export LS_COLORS
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

autoload -Uz compinit
compinit

autoload -U colors && colors
compinit

# End of lines added by compinstall

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


PS1="%M@%B %{$fg[magenta]%}%d%{$reset_color%} %? %% %b"

# some more ls aliases
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias sl=ls

#	man path
MANPATH=/usr/share/man:/usr/local/man

#	bin path
PATH=~/bin/vooya:~/bin:~/dev/rex/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/sbin:
#
#	library path
LD_LIBRARY_PATH=/usr/local/lib:/lib:/usr/lib

export LD_LIBRARY_PATH
export MANPATH
export PATH
export EDITOR

## Vim stuff
stty -ixon
# set vim as the man page viewer with expected behavior
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export STREAM_ROOT=~/streams

alias bdiff='bzr diff --using=colordiff --diff-options="-u"'
alias m='make -j8'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

export DEVDIR="/home/dorian/dev"
alias g="gvim --servername GVIM"
alias gtab="gvim --servername GVIM --remote-tab"
alias last10="bzr log -r -10.. --line --forward"
alias avsg="bin/gsg.exe avs2/avs2.rex"
alias avsp="bin/gsp.exe avs2/avs2.rex"

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

REPORTTIME=30
TIMEFMT=$'%J %E\t'

