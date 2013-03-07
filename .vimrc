set nocompatible

" pathogen
execute pathogen#infect()

filetype plugin indent on
set number
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set wildmode=longest,list,full
set wildmenu
set mouse=a
set laststatus=2
set encoding=utf-8
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
let g:Powerline_symbols = 'unicode'
