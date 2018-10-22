alias grep='grep --color=auto'
alias sl="ls"

# macOS and Debian have gcal, but Ubuntu has it as just cal
if command -v gcal &> /dev/null; then
    command -v cal &> /dev/null
    if [ $? -ne 0 ]; then
        alias cal=$(command -v gcal)
    fi
fi

# used for https://github.com/jocelynmallon/zshmarks
alias j="jump"

