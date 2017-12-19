" ------------------------------------------------------------
" dyle vim config
"
set nocompatible

" ------------------------------------------------------------
" plugin management
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'The-NERD-tree'
Plugin 'ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on


" ------------------------------------------------------------
" turn off cursor keys
"
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" nnoremap <Left>  <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Up>    <NOP>
" nnoremap <Down>  <NOP>
" vnoremap <Left>  <NOP>
" vnoremap <Right> <NOP>
" vnoremap <Up>    <NOP>
" vnoremap <Down>  <NOP>

" Home key
map <esc>OH <esc>0i
" cmap <esc>OH <home>
" nmap <esc>OH 0

" End key
map <esc>OF $
" imap <esc>OF <esc>$a
" cmap <esc>OF <end>

" ------------------------------------------------------------
" basic stuff
"
set number
set incsearch
set shiftwidth=4
set paste
set nowrap
set autoindent
set autochdir
set textwidth=0
set novisualbell
set noerrorbells
set cursorline
set hlsearch
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set scroll=1
" set notimeout
" set ttimeoutlen=10
" set ignorecase
set wildmenu
set showcmd
set backspace=indent,eol,start
set nostartofline
set mouse=a
set encoding=utf-8
set autoread
set nolazyredraw
set colorcolumn=120

set t_Co=256
color apprentice
syntax on


" ------------------------------------------------------------
" airline config
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_inactive_collapse = 0
let g:virtualenv_auto_activate = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set laststatus=2

cd %:p:h

