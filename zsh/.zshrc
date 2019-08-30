_ANTIGEN_INSTALL_DIR=~/.antigen_install
source ${_ANTIGEN_INSTALL_DIR}/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle httpie
antigen bundle git
antigen bundle jocelynmallon/zshmarks

zstyle :omz:plugins:ssh-agent agent-forwarding on
antigen bundle ssh-agent

antigen bundle ~/Workspace/dotfiles zsh/.zsh_custom --no-local-clone
antigen theme ~/Workspace/dotfiles zsh/.zsh_custom/themes/kedo_1.zsh-theme

antigen apply
