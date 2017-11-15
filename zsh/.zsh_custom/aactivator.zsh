if $(type aactivator.py &> /dev/null); then
    eval "$(aactivator.py init)"
fi

install-aactivator-for-venv() {
    local venvDir=venv

    if [ "$1" != "" ]; then
        venvDir=$1
    fi

    if ! [[ -d $venvDir ]]; then
        echo "$venvDir is not a valid directory"
        return 1
    fi

    if ! [[ -f "$venvDir/bin/activate" ]]; then
        echo "$venvDir does not have an activate file to source"
        return 1
    fi

    ln -s "$venvDir/bin/activate" .activate.sh
    echo '#!/usr/bin/bash\n\ndeactivate' > .deactivate.sh
    chmod go-w .deactivate.sh

    echo "Successfully installed aactivator for $venvDir"
}
