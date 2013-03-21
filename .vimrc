" -------------------------------------------------------------------------------
"
" General
"
" -------------------------------------------------------------------------------
" Use VIM settings, not VI settings
" Make sure this is first, since it affects other settings
set nocompatible

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

" -------------------------------------------------------------------------------
"
" Content editing appearance
"
" -------------------------------------------------------------------------------

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


" -------------------------------------------------------------------------------
"
" Status bar appearance
"
" -------------------------------------------------------------------------------

" show the mode you're in
set showmode

" -------------------------------------------------------------------------------
"
" Formatting
"
" -------------------------------------------------------------------------------

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

" PEP8 wants to limit all lines to 79, and flowing blocks of text to 72
set textwidth=72

" -------------------------------------------------------------------------------
"
" Searching
"
" -------------------------------------------------------------------------------
" incremental search
set incsearch

" ignore case when searching
set ignorecase

" highlight the search
set hlsearch

" show matching bracket
set showmatch

" -------------------------------------------------------------------------------
"
" Mappings
"
" -------------------------------------------------------------------------------
" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
