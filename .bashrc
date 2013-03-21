# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PS1="\n\[\e[0;92m\][\t] \[\e[0;33m\]\w\[\e[0m\] \n\[\e[0;90m\]\u@\[\e[0;95m\]\h\[\e[0m\]$ "
if [ -f ~/Programs/scripts/color_prompt/color_prompt.py ]; then
    PS1=`python ~/Programs/scripts/color_prompt/color_prompt.py`
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs

alias p='ps aux|grep ^`whoami`'
export EDITOR="vim"
export VISUAL="vim"

unset command_not_found_handle

# Exports
# Don't export xterm if we already exported screen (probably remote ssh)
[ "$TERM" != "screen-256color" ] && export TERM='xterm-256color'
# Only export screen if we're in tmux.
[ -n "$TMUX" ] && export TERM=screen-256color
export TERM=xterm-256color
