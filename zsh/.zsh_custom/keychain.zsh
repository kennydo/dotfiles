if [[ -x /usr/bin/keychain ]] then
    find ~/.ssh -type f -name '*_key' -exec echo /usr/bin/keychain {} \;
    source ~/.keychain/`hostname`-sh
fi
