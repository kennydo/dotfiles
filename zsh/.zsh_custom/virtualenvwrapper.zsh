wrapper_paths=(
    /usr/share/virtualenvwrapper/virtualenvwrapper.sh # ubuntu/debian puts it here
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