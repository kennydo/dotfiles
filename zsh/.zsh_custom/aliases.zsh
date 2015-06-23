alias grep='grep --color=auto'
alias sl="ls"
alias sa="source activate"

# cal on Mac doesn't highlight by default, but it works fine on Linux
case $OSTYPE in
    darwin*)
        alias cal='/usr/local/bin/gcal'
        ;;
esac
