# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git niceness to put current git branch into PS1
function parse_git_branch {
    [[ -e `which git` && "/" != `git rev-parse --show-toplevel 2>/dev/null` ]] && git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# Color and format the prompt
# Below is an example of a safe default, in case this script fails
# PS1="\n\[\e[0;92m\][\t] \[\e[0;33m\]\w\[\e[0m\] \n\[\e[0;90m\]\u@\[\e[0;95m\]\h\[\e[0m\]$ "

hname_colors=(
#    "0;30" # black, looks boring
    "0;31" # red
    "0;32" # green
    "0;33" # yellow
    "0;34" # blue
    "0;35" # purple
    "0;36" # cyan
    "0;37" # white
)

hname=`hostname -s`
middle_index=$((`echo -n $hname | wc -m` / 2))
hname_one=${hname:0:$middle_index}
hname_two=${hname:$middle_index}
hname_one_color=${hname_colors[$((`python -c "print sum([ord(x) for x in list(\"$hname_one\")])"` % ${#hname_colors[@]}))]}
hname_two_color=${hname_colors[$((`python -c "print sum([ord(x) for x in list(\"$hname_two\")])"` % ${#hname_colors[@]}))]}

prompt_time="\[\e[0;92m\][\\t]"
prompt_path="\[\e[0;33m\]\w\[\e[0m\]"
prompt_user="\[\e[0;90m\]\u@\[\e[0m\]"
prompt_host="\[\e[${hname_one_color}m\]${hname_one}\[\e[${hname_two_color}m\]${hname_two}\[\e[0m\]"
prompt_character="\$"
PS1="\n${prompt_time} ${prompt_path}\n"'$(parse_git_branch)'"${prompt_user}${prompt_host}${prompt_character} "

# Environment variable exports
export EDITOR="vim"
export VISUAL="vim"

# User specific aliases and functions
alias p='ps aux|grep ^`whoami`'
if [ `uname` == 'FreeBSD' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias mutt='mutt -y'

unset command_not_found_handle

# Exports
# Don't export xterm if we already exported screen (probably remote ssh)
[ "$TERM" != "screen-256color" ] && export TERM='xterm-256color'
# Only export screen if we're in tmux.
[ -n "$TMUX" ] && export TERM=screen-256color
export TERM=xterm-256color

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs
