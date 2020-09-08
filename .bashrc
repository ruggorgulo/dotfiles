# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [[ $TERM == *:* ]] ; then
    export COLORFGBG=${TERM%:*}
    export TERM=${TERM##*:}
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
    # Shell is non-interactive.  Be done now
    return
fi

# Shell is interactive.  It is okay to produce output at this point,

[ -z "$HOSTNAME" ] && HOSTNAME=$(hostname -s)

shopt -s autocd  # autocd was added in bash 4.0
shopt -s cdspell # directory spellcheck
shopt -s checkwinsize # check the window size after each command, update LINES and COLUMNS
shopt -s cmdhist
shopt -s histappend # append to the history file, don't overwrite it
shopt -s histreedit
shopt -s histverify
shopt -s interactive_comments

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL='ignorespace:ignoredups:erasedups'
HISTIGNORE='cd *:ls:ls *:ll:ll *:la:la *:less *:eless *:cat *:history:ec *:python:em:em *'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# keep history separately for each host
#HISTFILE=$HOME/.history/$HOSTNAME

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#setup editor
if [[ -x ~/bin/EDITOR ]] ; then
    EDITOR=~/bin/EDITOR
elif which zile 2&>/dev/null ; then
    EDITOR=zile
else
    EDITOR=nano
fi
VISUAL=$EDITOR
alias e=$EDITOR
export EDITOR VISUAL

# User specific aliases and functions
if [ -x /usr/bin/geany ] ; then
    ge() { /usr/bin/geany "$@" & }
fi

findgrep() {
    gargs=()
    while [[ $# -gt 2 ]] ; do
        gargs+=("$1")
        shift
    done
    case "$1" in
        */*)
            name_param='-iwholename'
            ;;
        *)
            name_param='-iname'
            ;;
    esac
    echo -n -e '\e[3m'
    echo -n find . $name_param "'$1'" -print0 '|' xargs -0 -n 30 grep --color=auto -E -Hn "${gargs[@]}" -e "'$2'" 
    echo -e '\e[0m'
    find . $name_param "$1" -print0 | xargs -0 -n 30 grep --color=auto -E -Hn "${gargs[@]}" -e "$2"
}

if [ -x /usr/bin/emacs ] ; then
    ediff() { 
        if [[ $# -lt 2 ]] ; then
            echo 'error: ediff <file1> <file2>'
            return 1
        fi
        emacs -Q -l ~/.emacs-ediff -nw --eval "(ediff-files \"$1\" \"$2\")"
    }

    eless() {
        if [[ "$1" == "-" ]] || [[ -z "$1" ]] ; then
            TMP=$(mktemp /tmp/elessXXXXXXX)
            elisp="(let ((b (create-file-buffer \"*stdin*\"))) (switch-to-buffer b) (insert-file-contents \"${TMP}\") (setq buffer-read-only t) (delete-file \"${TMP}\"))"
            cat > $TMP
            emacs-nox --eval "$elisp" < /dev/tty
        else
            emacs-nox "$@" --eval '(setq buffer-read-only t)'
        fi
    }
fi

if [[ $TERM == linux ]] ; then
    alias em='emacs -Q -l ~/.emacs-console -nw'
else
    alias em='emacs -Q -l ~/.emacs-nox -nw'
fi

alias ec='emacsclient -n -a emacs'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias nano='nano -DSWkw'
alias top='top -c'

PS1='\[\033[1;35m\]\u\[\033[0m\]@\[\033[7;33m\]\h\[\033[0m\] \[\033[01;34m\]\w \$\[\033[0m\] '

powerline()
{
    PS1='\[\033[1;35m\]\u\[\033[0m\]@\[\033[7;33m\]\h\[\033[0m\] \[\033[38;5;159m\]\[\033[7m\]▶\[\033[38;5;159m\]\[\033[48;5;20m\]\w\[\033[0m\]\[\033[38;5;159m\]▶\[\033[0m\]'
}

if [[ -f /usr/lib/git-core/git-sh-prompt ]] ; then
	GIT_PS1_SHOWDIRTYSTATE=1
	source /usr/lib/git-core/git-sh-prompt
	PS1='\[\e[38;5;105m\]\t \[\e[1;35m\]\u\[\e[0m\]@\[\e[7;33m\]\h\[\e[0m\] \[\e[1;34m\]\w \[\e[0;33m\]$(__git_ps1 "(%s)")\[\e[1;34m\]\n\$\[\e[0m\] '
fi

case $TERM in
  xterm*|putty*)
    [[ -f /lib/terminfo/x/xterm-256color ]] && TERM=xterm-256color
    ;;
#  rxvt*)
#    [[ -f /lib/terminfo/r/rxvt-unicode-256color ]] && TERM=rxvt-unicode-256color
#    ;;
#   problem with emacs key bindings and unicode font
  dumb)
    PS1='\w \$ '
    ;;
esac
export TERM

if [ -n "$IS_INSIDE_IDEA" ] ; then
    HISTFILE=/dev/null
fi

have_histfile()
{
    if [[ "$HISTFILE" = '/dev/null' ]] ; then echo '🍀' ; else echo '💾' ; fi
	# 🖈📎
}
PS1='$(have_histfile)'" $PS1"
