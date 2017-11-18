_ANTIGEN_INSTALL_DIR=~/.antigen_install
source ${_ANTIGEN_INSTALL_DIR}/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle httpie
antigen bundle git
antigen bundle jocelynmallon/zshmarks

antigen bundle ~/.zsh_custom
antigen theme ~/.zsh_custom/themes/kedo_1.zsh-theme

antigen apply
