" Enable syntax highlighting
syntax on

" Line numbering
set number
" Showing commands
set showcmd

" Matching brackets automatically
set showmatch

" Keep a few lines between cursor and top and bottom of screen during scroll
set scrolloff=15

" Donot wrap text
set nowrap

" Case sensitive search only if search term explicitly containes uppercase
set smartcase

" Donot create swap files everywhere
set noswapfile

" Highlight searches
set incsearch

" Make vim use system clipboard, Requires xclip
set clipboard+=unnamedplus

" Setting space as leader key
let mapleader=" "
set ttimeoutlen=500


" Call all the plugins
call plug#begin('~/.vim/plugged')

    Plug 'norcalli/nvim-colorizer.lua'                      " Show colors on color codes
    Plug 'mhinz/vim-startify'                               " Startup screen for vim
    Plug 'itchyny/lightline.vim'                            " Status line plugin
    Plug 'yggdroot/indentline'                              " Show
    Plug 'raimondi/delimitmate'                             " Autoclose brackets,quotes etc.
    Plug 'bronson/vim-trailing-whitespace'                  " Highlight and delete trailing whitespace
    Plug 'preservim/nerdcommenter'                          " Adds better commenting
    Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Autocompletion for code
    Plug 'adithyan-kv/gruvbox-darkest'                      " Custom gruvbox colorscheme
    Plug 'tpope/vim-fugitive'                               " Git integration
    Plug 'kyazdani42/nvim-web-devicons'                     " Icons for Filetree and stuff
    Plug 'kyazdani42/nvim-tree.lua'                         " File explorer tree

call plug#end()

" Setting color scheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox-darkest
set background=dark

" Disable quote concealing in JSON files. To compensate for a setting that
" Indentline plugin changes
let g:vim_json_conceal=0

" For color code highlighting plugin
set termguicolors
lua require'colorizer'.setup()

" Draw ruler
set colorcolumn=80
highlight ColorColumn ctermbg=234 guibg=#1c1c1c

" Highlighting the line on which the cursor is on
set cursorline
highlight Cursorline ctermbg=235 guibg=#262626

" Enable mouse in all modes
set mouse=a

" Disable automatic commenting of the next line after a comment
au FileType * set fo-=c fo-=r fo-=o

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

" Opening terminal in vertical split, Shift+t to toggle terminal
autocmd TermOpen * startinsert              " Always open terminal in insert mode
" Open terminal in bottom split
nnoremap <S-t> :10sp \| bel terminal<CR>
" Close terminal if already open
tnoremap <S-t> <C-\><C-n>:q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File browser plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NvimTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing indents
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoindent
set smartindent
set autoindent

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" display indentation levels with lines plugin. Setting colors
let g:indentLine_color_term=235
let g:indentLine_color_gui='#262626'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Managing the statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting colorscheme and adding git branch name
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Disabling the modename at the bottom as statusline extension already shows
" it
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigating tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <S-h> gT
nnoremap <S-l> gt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Setting other custom keybindings
"  (Mostly to VSCode bindings)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save with Ctrl+s
" Automatically deletes trailing whitespace while saving
nmap <C-s> :FixWhitespace<CR> :w<CR>
imap <C-s> <Esc>:FixWhitespace<CR> :w<CR>

" Comment line with Ctrl+/.For some reason _ represents /.
filetype plugin on                      " Needed for nerdcommenter
nmap <C-_> <Plug>NERDCommenterToggle

" Alt+j/k or Alt+up/down to move a line up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .-2<CR>==gi
inoremap <A-up> <Esc>:m .+1<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
