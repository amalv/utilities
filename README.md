utilities
=========
My Vim configuration file.

filetype plugin indent on
syntax enable
syntax on
set background=light
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp'
Bundle 'joonty/vdebug.git'

colorscheme solarized

" PHP validation
map <F5> :!php -l %<CR>

filetype plugin on
au BufNewFile,BufRead *.endfile set filetype=endfile
filetype plugin indent on

" Map leader to comma
:let mapleader = ","
