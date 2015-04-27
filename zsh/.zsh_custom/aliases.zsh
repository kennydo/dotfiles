alias grep='grep --color=auto'
alias sl="ls"

# cal on Mac doesn't highlight by default
alias cal='cal | GREP_COLOR="1;31" grep --before-context 6 --after-context 6 --color -e " $(date +%e)" -e "^$(date +%e)"'
