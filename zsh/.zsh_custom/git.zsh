export PATH=~/.git_commands:$PATH

alias groot='cd $(git rev-parse --show-toplevel)'

print-git-remote-branch-pruning-command() {
    echo 'git push origin' $(git branch --remote --list '*/kedo/*' | sed 's/^\s*origin\//:/' | tr '\n' ' ')
}
