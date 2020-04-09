" functions for switching between tabs and spaces
function ToggleIndent()
    if s:indent_type == "TABS"
        call SpaceIndent()
    else
        call TabIndent()
    endif
endfunction

function SpaceIndent()
    set tabstop=4
    set shiftwidth=4
    set expandtab
    let s:indent_type = "SPACES"
endfunction

function TabIndent()
    set noexpandtab
    set copyindent
    set preserveindent
    set softtabstop=0
    set shiftwidth=4
    set tabstop=4
    let s:indent_type = "TABS"
endfunction

call SpaceIndent()

" statusline customization
hi User1 ctermbg=green ctermfg=black
hi User2 ctermbg=202 ctermfg=black

function StatusIndent()
    return s:indent_type
endfunction

function UpdateStatusLine()
    if mode() == "n"
        let l:line="%#User1#"
    else
        let l:line="%#User2#"
    endif
    let l:line.="\ %F\ " . s:indent_type
    let l:line.="\ [%L lines]\ %m%=value=%b\ [0x%B]\ %p%%\ %l,%c\ type:%Y\ %r"
    return l:line
endfunction

function RedrawStatusLine()
    redrawstatus
    return ""
endfunction

set statusline=%!UpdateStatusLine()
" end statusline customization

set nocompatible

" Vundle init
filetype off " Will be turned on later again, but required by Vundle it seems
set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Insert Vundle plugins here
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'taglist.vim'
call vundle#end()

" indentation specific settings
filetype plugin indent on
" set smartindent

set number
syntax on
set wildmode=longest,list,full
set wildmenu
" set mouse=a
set laststatus=2
set encoding=utf-8
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
let g:Powerline_symbols = 'unicode'
set mouse-=a

set completeopt=menuone

set nospell

map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
inoremap <Nul> <C-n>
set tags=./tags,./TAGS,tags,TAGS,/usr/include/**/tags

" navigate easily between splits
nmap <silent> <S-UP> :wincmd k<CR>
nmap <silent> <S-DOWN> :wincmd j<CR>
nmap <silent> <S-LEFT> :wincmd h<CR>
nmap <silent> <S-RIGHT> :wincmd l<CR>
nmap <silent> <C-F12> :TlistToggle<CR>

noremap <C-g> <C-]>

nmap <silent> <C-i> :call ToggleIndent()<CR>

" Disable markdown plugin folding by default
let g:vim_markdown_folding_disabled = 1
