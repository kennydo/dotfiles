alias grep='grep --color=auto'
alias sl="ls"

# cal on Mac doesn't highlight by default, but it works fine on Linux
case $OSTYPE in
    darwin*)
        alias cal='/usr/local/bin/gcal'
        ;;
esac

# used for https://github.com/jocelynmallon/zshmarks
alias j="jump"

