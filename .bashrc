# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# Env variables
export PS1="\n\[\033[38;5;39m\]>\[\]\[\033[38;5;15m\]\u\[\]\[\033[38;5;39m\]>\[\]\[\033[38;5;15m\]\W\[\]\[\033[38;5;39m\]>\[\]\[\033[38;5;15m\]\j jobs\[\]\[\033[38;5;39m\]>\[\]\[\033[38;5;15m\]\A\[\]\[\033[38;5;39m\]>\[\]\[\033[38;5;15m\]\n-->\[\]"
export TERMINAL="/usr/local/bin/st"
export DEV_C="${HOME}/dev/C"

# Aliases
alias shtd="shutdown -h now"

alias ll="ls -la"
alias llr="ls -laRh"

alias emn="emacs -nw"

alias i3c="emn ${HOME}/.config/i3/config"
alias bsc="emn ${HOME}/.bashrc"
alias emc="emn ${HOME}/.emacs"

alias cddc="cd ${DEV_C}"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
