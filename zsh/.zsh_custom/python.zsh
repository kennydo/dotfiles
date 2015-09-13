wrapper_paths=(
    /usr/share/virtualenvwrapper/virtualenvwrapper.sh # ubuntu/debian puts it here
    /etc/bash_completion.d/virtualenvwrapper # debian wheezy puts it here
    /usr/bin/virtualenvwrapper.sh
    /usr/local/bin/virtualenvwrapper.sh
)
for f in $wrapper_paths; do
    if [ -e $f ]; then
        source $f
        break
    fi
done
unset wrapper_paths, f

export WORKON_HOME=$HOME/.virtualenvs

export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
