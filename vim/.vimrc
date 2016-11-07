" -----------------------------------------------------------------------------
"
" General
"
" -----------------------------------------------------------------------------
" Use VIM settings, not VI settings
" Make sure this is first, since it affects other settings
set nocompatible

" enable mouse for all modes
set mouse=a
set ttymouse=xterm2

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" read/write a .viminfo file -- limit to only 50
set viminfo='20,\"50

" keep 50 lines of command history
set history=50

" Make a backup before overwriting a file.  The backup is removed
" after the file was successfully written
set writebackup

" hide abandoned buffers
set hidden

" Don't update the display while executing macros
set lazyredraw

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

set visualbell

" Search for tags files all the way up to root
set tags=./tags;

" -----------------------------------------------------------------------------
"
" Vundle stuff
"
" -----------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
silent! call vundle#begin()

" let Vundle manage Vundle, required
silent! Plugin 'gmarik/Vundle.vim'

" the plugins I like
silent! Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
silent! call vundle#end()

" -----------------------------------------------------------------------------
"
" Content editing appearance
"
" -----------------------------------------------------------------------------

" for terminals with dark backgrounds
set background=dark

" show line numbers - make use of the extra screen real-estate with
" textwidth set to 72.  Up to 4 digits are okay for line numbers
set number
set numberwidth=4

" highlight the current line
set cursorline
hi cursorline cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white

syntax enable

" Show the cursor position all the time
set ruler

" Show trailing space characters
set list listchars=trail:·

" Highlight unicode in a file
autocmd BufRead * syntax match nonascii "[^\u0000-\u007F]"
highlight nonascii guibg=Red ctermbg=1 term=standout

" -----------------------------------------------------------------------------
"
" Status bar appearance
"
" -----------------------------------------------------------------------------

" show the mode you're in
set showmode

" always show the tab bar
set showtabline=2

" -----------------------------------------------------------------------------
"
" Formatting
"
" -----------------------------------------------------------------------------

" always enable autoindenting
set autoindent

" tabs in file are 4 space characters
set tabstop=4

" each indent is 4 spaces
set shiftwidth=4

set expandtab
set smarttab

" round indent to multiple of shiftwidth
set shiftround

" -----------------------------------------------------------------------------
"
" Searching
"
" -----------------------------------------------------------------------------
" incremental search
set incsearch

" ignore case when searching
set ignorecase

" highlight the search
set hlsearch

" show matching bracket
set showmatch

" -----------------------------------------------------------------------------
"
" Mappings
"
" -----------------------------------------------------------------------------
" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

let mapleader = ","
nnoremap <Leader>n :tabprev <CR>
nnoremap <Leader>m :tabnext <CR>

" Block indent
vmap > >gv
vmap < <gv

" -----------------------------------------------------------------------------
"
" Plugin-specific settings
"
" -----------------------------------------------------------------------------

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" -----------------------------------------------------------------------------
"
" Local settings
"
" -----------------------------------------------------------------------------
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif
