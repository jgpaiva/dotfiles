# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

#PS1='\A \u@\h \W> '

#git stuff
if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
#from curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.bash
  fi
source ~/.git-prompt.sh
#from curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

PS1='\[\033[01;34m\]\A\[\033[00m\]:\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")> '

# some more ls aliases
#alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ps="ps auxww"
alias s="ls"
alias grep="grep --color=auto"
alias p="python -c 'import os,sys;print os.path.realpath(sys.argv[1])' "

PATH=/Applications/vim:~/.bin:~/Documents/workspace/peersim_jgpaiva/scripts:$PATH
PATH=/opt/local/bin:$PATH
export PATH
VIM_APP_DIR=/Applications/vim
export VIM_APP_DIR
PYTHONPATH=~/Dropbox/python/libs/
export PYTHONPATH

grid="u01000@grid.inesc-id.pt"
cloud="cloudtm.ist.utl.pt"
uranium="jgpaiva.dyndns.org"

CLICOLOR=true
export CLICOLOR
