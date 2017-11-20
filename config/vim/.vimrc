filetype plugin indent on
syntax enable
set mouse=a
set hidden
set laststatus=2
set backspace=indent,eol,start
set number
set wildmenu
set noundofile
set noshowmode
set hlsearch

let mapleader = ","

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Theme
colorscheme nord
let g:lightline = {'colorscheme': 'nord'}

" Buffer
nnoremap gb :ls<CR>:b<Space>

" Finder
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" CtrlP
let g:ctrlp_show_hidden = 1

" Wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*
set wildignore+=tags
set wildignore+=*.tar.*
