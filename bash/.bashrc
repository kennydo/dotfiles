# .bashrc

case $OSTYPE in
    solaris*)  DOMAINNAME=domainname ;;
    linux-gnu)  DOMAINNAME=dnsdomainname ;;
esac
DOMAIN=$($DOMAINNAME)

###############################################################################
#
# Source configs based on DNS domain
#
###############################################################################

###############################################################################
#
# Source global definitions
#
###############################################################################
if [ -r /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -r ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


###############################################################################
#
# Color and format the prompt prettily
#
###############################################################################
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

function hash_ascii {
    local s=0
    local i=0
    for char in `echo "$1" | fold -w1`
    do
        i=`echo "$char" | od -t d1 | head -n 1 | awk '{print $2}'`
        s=$(($s+$i))
    done
    echo "$s"
}

case $OSTYPE in
    solaris*)   hname=`hostname` ;;
    *)          hname=`hostname -s` ;;
esac
middle_index=$((`echo -n $hname | wc -m` / 2))
hname_one=${hname:0:$middle_index}
hname_two=${hname:$middle_index}
hname_one_color=${hname_colors[`hash_ascii "$hname_one"` % ${#hname_colors[@]}]}
hname_two_color=${hname_colors[`hash_ascii "$hname_two"` % ${#hname_colors[@]}]}

prompt_time="\[\e[0;92m\][\\t]"
prompt_path="\[\e[0;33m\]\w\[\e[0m\]"
prompt_user="\[\e[0;90m\]\u@\[\e[0m\]"
prompt_host="\[\e[${hname_one_color}m\]${hname_one}\[\e[${hname_two_color}m\]${hname_two}\[\e[0m\]"
prompt_character="\$"

# Git niceness to put current git branch into PS1
function parse_git_branch {
    [[ -e `which git 2> /dev/null` && "/" != `git rev-parse --show-toplevel 2>/dev/null` ]] && git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

PS1="\n${prompt_time} ${prompt_path}\n"'$(parse_git_branch)'"${prompt_user}${prompt_host}${prompt_character} "

###############################################################################
#
# Environment variable exports
#
###############################################################################
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# Don't export xterm if we already exported screen (probably remote ssh)
[ "$TERM" != "screen-256color" ] && export TERM='xterm-256color'

export TERM=xterm-256color

# Only export screen if we're in tmux. irssi has issues scrolling if TERM=xterm
[ -n "$TMUX" ] && export TERM=screen-256color

###############################################################################
#
# User specific aliases
#
###############################################################################
alias p='ps aux|grep ^`whoami`'
case $OSTYPE in
    solaris*)   alias ls='ls' ;;
    freebsd*)   alias ls='ls -G' ;;
    linux-gnu)  alias ls='ls --color=auto' ;;
    darwin*)    alias ls='ls -G' ;;
    *)          alias ls='ls';;
esac
alias sl='ls';

alias grep='grep --color=auto'
alias mutt='mutt -y'
alias salt='salt --show-timeout'

###############################################################################
#
# Application-specific sourcing
#
###############################################################################

# for python virtual environment
if [ -r /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi
if [ -r /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs

# for android studio
if [ -d /opt/android/android-studio/bin ]; then
    export PATH="$PATH:/opt/android/android-studio/bin"
fi

# for pycharm
if [ -d /opt/pycharm/bin ]; then
    export PATH="$PATH:/opt/pycharm/bin"
fi

