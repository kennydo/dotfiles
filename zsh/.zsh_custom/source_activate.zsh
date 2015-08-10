upsearch () {
  # Searches for a given filename in this directory, this parent's directory, and so on, until we reach the root of the FS.
  # Echoes the path of the found file, or nothing if it could not be found.

  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    if [[ -e "$directory/$1" ]]
    then
      echo "$directory/$1"
      return
    else
      directory="$directory/.."
    fi
  done
}

sourcea () {
  # Searches for a 'activate' file, and then sources the 'activate' file.

  # If we're in a foo-bar_trunk dir, try to source the 'activate' from foo-bar_trunk/foo-bar
  if [[ $(basename $(pwd)) =~ '([^\/]+)_trunk' ]]
  then
    # We current inside foo-bar_trunk, so look for the existence of foo-bar_trunk/foo-bar/activate
    env_name=$match[1]
    activate_path="$env_name/activate"

    echo "Based on '*_trunk' directory name, looking inside '$env_name' for 'activate'"

    if [[ -e $activate_path ]]
    then
        echo "Sourcing '$activate_path'"
        source $activate_path
        return
    else
        echo "$activate_path not found"
    fi
  fi

  echo "Looking in parent directories for 'activate'"
  # Go through parent dirs, looking for an 'activate' file to source
  activate_path=$(upsearch activate)
  if [[ -e $activate_path ]]
  then
    echo "Sourcing '$activate_path'"
    source $activate_path
    return
  else
    echo "No 'activate' file found"
  fi
}
