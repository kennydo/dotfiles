alias grep='grep --color=auto'
alias sl="ls"

# cal on Mac doesn't highlight by default, but it works fine on Linux
case $OSTYPE in
    darwin*)
        alias cal='/usr/bin/cal | GREP_COLOR="1;31" grep --before-context 6 --after-context 6 --color -e "\b$(date +%e)\b"'
        ;;
esac
