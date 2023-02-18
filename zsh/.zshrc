_ANTIGEN_INSTALL_DIR=~/.antigen_install
source ${_ANTIGEN_INSTALL_DIR}/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle git
antigen bundle httpie
antigen bundle jocelynmallon/zshmarks

# Include host-specific zshrc lines if they exist
if [ -f "$HOME/.zshrc_host" ]; then source "$HOME/.zshrc_host"; fi

antigen theme ~/Workspace/dotfiles@main zsh/.zsh_custom/themes/kedo_1.zsh-theme
antigen bundle ~/Workspace/dotfiles@main zsh/.zsh_custom --no-local-clone

antigen apply
