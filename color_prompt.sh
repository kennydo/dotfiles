#!/bin/sh

hname_colors=(
#    "0;30" # black, looks boring
    "0;31" # red
    "0;32" # green
    "0;33" # yellow
    "0;34" # blue
    "0;35" # purple
    "0;36" # cyan
    "0;37" # white
)

hname=`hostname`
middle_index=$((`echo -n $hname | wc --chars` / 2))
hname_one=${hname:0:$middle_index}
hname_two=${hname:$middle_index}

hname_one_color=${hname_colors[$((`python -c "print sum([ord(x) for x in list(\"$hname_one\")])"` % ${#hname_colors[@]}))]}
hname_two_color=${hname_colors[$((`python -c "print sum([ord(x) for x in list(\"$hname_two\")])"` % ${#hname_colors[@]}))]}

prompt_time="\[\e[0;92m\][\\t]"
prompt_path="\[\e[0;33m\]\w\[\e[0m\]"
prompt_user="\[\e[0;90m\]\u@\[\e[0m\]"
prompt_host="\[\e[${hname_one_color}m\]${hname_one}\[\e[${hname_two_color}m\]${hname_two}\[\e[0m\]"
prompt_character="\$"

PS1="\n${prompt_time} ${prompt_path}\n${prompt_user}${prompt_host}${prompt_character} "
