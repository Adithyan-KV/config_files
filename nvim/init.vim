" Enable syntax highlighting
syntax on

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Line numbering
set number

" Showing commands
set showcmd

" Matching brackets automatically
set showmatch

" Donot wrap text
set nowrap

" Case sensitive search only if search term explicitly containes uppercase
set smartcase

" Donot create swap files everywhere
set noswapfile

" Highlight searches
set incsearch

" Autoindent
set smartindent

" Make vim use system clipboard, Requires xclip
set clipboard+=unnamedplus

" Setting space as leader key
let mapleader=" "
set ttimeoutlen=500

" Call all the plugins
call plug#begin('~/.vim/plugged')

    Plug 'morhetz/gruvbox'  
    Plug 'itchyny/lightline.vim'

call plug#end()

" Setting color scheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

" Setting colorscheme of statusline
let g:lightline={'colorscheme':'wombat',}

" Disabling the modename at the bottom as statusline extension already shows it
set noshowmode

" Draw ruler
set colorcolumn=80
highlight ColorColumn ctermbg=234 guibg=lightgray

" Enable mouse in all modes
set mouse=a
