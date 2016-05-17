if [ $UID -eq 0 ]; then NCOLOR="$fg[red]"; else NCOLOR="$FG[008]"; fi

# git theming, modified from pmcgee
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_no_bold[magenta]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

# LS colors, made with http://geoff.greer.fm/lscolors/, copied from pmcgee
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

hname_colors=(
  "red"
  "green"
  "yellow"
  "blue"
  "magenta"
  "cyan"
  "white"
)
function hash_ascii {
  local s=0
  local i=0
  for char in `echo "$1" | fold -w1`
  do
    i=`echo "$char" | od -t d1 | head -n 1 | awk '{print $2}'`
    s=$(($s+$i))
  done
  echo "$s"
}
hname=`hostname -s`
middle_index=$((`echo -n $hname | wc -m` / 2))
hname_one=$hname[1,$middle_index]
hname_two=$hname[(($middle_index + 1)),${#hname}]
# bash arrays are 0-indexed, while zsh arrays are 1-indexed, so add 1
hname_one_color=${hname_colors[`hash_ascii "$hname_one"` % (${#hname_colors[@]}) + 1]}
hname_two_color=${hname_colors[`hash_ascii "$hname_two"` % (${#hname_colors[@]}) + 1]}

lineup=$'\e[1A'
linedown=$'\e[1B'

RPROMPT='%{${lineup}%}%{$FG[118]%}[%*]%{$reset_color%}%{${linedown}%}'

PROMPT='
%{$FG[220]%}%~%{$reset_color%} $(git_prompt_info)
%{$NCOLOR%}%n@%{$reset_color%}%{$fg[$hname_one_color]%}$hname_one%{$fg[$hname_two_color]%}$hname_two%{$reset_color%}%(?,%{%F{green}%}✅,%{%F{red}%}🚫) %(!.#.$)%{$reset_color%} '
