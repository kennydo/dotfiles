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
case $DOMAIN in
ocf.berkeley.edu)
    MAIL=/var/mail/${LOGNAME:?}
    if [ -r /opt/ocf/share/environment/.bashrc ]; then
        source /opt/ocf/share/environment/.bash_profile
    fi
    if [ `/usr/bin/whoami` != "root" ]; then
        if [ -r /opt/ocf/share/environment/.bashrc ]; then
            source /opt/ocf/share/environment/.bashrc
        fi
    fi
    ;;
CS.Berkeley.EDU | EECS.Berkeley.EDU)
    [[ -z ${MASTER} ]] && export MASTER=${LOGNAME%-*}
    [[ -z ${MASTERDIR} ]] && export MASTERDIR=$(eval echo ~${MASTER})
    [[ -e ${MASTERDIR}/adm/class.bash_profile ]] && . ${MASTERDIR}/adm/class.bash_profile
    ;;
esac

###############################################################################
#
# Source global definitions
#
###############################################################################
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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

case $OSTYPE in
    solaris*)   hname=`hostname` ;;
    *)          hname=`hostname -s` ;;
esac
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

# Git niceness to put current git branch into PS1
function parse_git_branch {
    [[ -e `which git` && "/" != `git rev-parse --show-toplevel 2>/dev/null` ]] && git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
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
# Only export screen if we're in tmux.
[ -n "$TMUX" ] && export TERM=screen-256color
export TERM=xterm-256color

###############################################################################
#
# User specific aliases
#
###############################################################################
alias p='ps aux|grep ^`whoami`'
case $OSTYPE in
    solaris*)   alias ls='ls -G' ;;
    freebsd*)   alias ls='ls -G' ;;
    linux-gnu)  alias ls='ls --color=auto' ;;
    *)          alias ls='ls';;
esac

alias grep='grep --color=auto'
alias mutt='mutt -y'

###############################################################################
#
# Application-specific sourcing
#
###############################################################################

# for python virtual environment
if [ -r /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs
