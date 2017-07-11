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

bindkey -v
#
#reduce the lag when changing from insert mode to normal mode
export KEYTIMEOUT=1

bindkey '^r' history-incremental-search-backward

# add an indicator when vi is in normal mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[magenta]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# The following lines configure zsh in emacs edit mode 
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
PATH=/opt/toolchain/x86_64-allegro-mingw32/bin/:~/bin/vooya:~/bin:~/dev/rex/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/sbin:
#
#	library path
LD_LIBRARY_PATH=/usr/local/lib:/lib:/usr/lib

export MANPATH
export PATH
export EDITOR

## Vim stuff
stty -ixon
# set vim as the man page viewer with expected behavior
export MANPAGER="/bin/sh -c \"unset MANPAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

export SYSTEMD_PAGER=""

export STREAM_ROOT=~/streams

alias bdiff='bzr diff --using=colordiff --diff-options="-u"'
alias m='make -j8'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

export DEVDIR="/home/dorian/dev"
alias g="gvim --servername GVIM"
alias vim="gvim --servername GVIM"
alias gtab="gvim --servername GVIM --remote-tab"
alias last10="bzr log -r -10.. --line --forward"
alias vpg="bin/gsg.exe av1/av1.rex -c"
alias vpp="bin/gsp.exe av1/av1.rex -b"

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

REPORTTIME=30
TIMEFMT=$'%J %E\t'

background=dark

alias mmt='evince ~/doc/w13293\ ISO-IEC_23008-1_\(E\)_2ndCD.pdf'
alias ccat="pygmentize -g"
alias 'eav=scripts/explore_av1'

# to compile AOM 
export ASFLAGS=-DPIC
