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

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing split windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Making new split windows open to thr right and down
set splitbelow splitright

" Remapping split navigation to just Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>q 

" Opening terminal in vertical split, leader-T to toggle terminal
autocmd TermOpen * startinsert
nnoremap <C-t> :10sp \| bel terminal<CR>
tnoremap <C-t> <C-\><C-n>:q<CR> 
