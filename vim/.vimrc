"=================================
" Edit by PengHuang
" version 1: 2019.12.10
"=================================

"" For Vundle
"set nocompatible
"filetype off
"
"" Set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" Let Vundle manage Vundle 
"Plugin 'VundleVim/Vundle.vim'
"
""Make the couples of brackets colorful
"Plugin 'frazrepo/vim-rainbow'
"let g:rainbow_active=1
"
""Show the information of the current edit file
"Plugin 'itchyny/lightline.vim'
"
"call vundle#end()

filetype plugin indent on

"Show the line number
set number

"The height of the bottom information line
set laststatus=2

" Set the tab
set tabstop=4 " A tab = 4 space
set softtabstop=4 " The length in insert mode when use Backspace
set shiftwidth=4 " The length of each level of tab
set expandtab " use space to replace tab

" Something about auto completion
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

inoremap ' <c-r>=Skip_pair("\'")<CR>
inoremap " <c-r>=Skip_pair("\"")<CR>
inoremap ) <c-r>=Skip_pair(")")<CR>
inoremap ] <c-r>=Skip_pair("]")<CR>
inoremap } <c-r>=Skip_pair("}")<CR>

"""""""""""""""""""""""""""""""""
" if the var is ' or ", 
"   if there is a ' or \" areadly, the skip out the \"" or ''
"   if there is not a ' or \", then return \"" or ''
"if the var is )]}
"   if there is a )}], then skip out
"   if there is not a )]}, the return )]}
"""""""""""""""""""""""""""""""""
func Skip_pair(var1)
    if a:var1 == "\""
        if getline('.')[col('.')-1] == a:var1
            return "\<ESC>la"
        else
            return "\"\"\<ESC>i"
        endif
    elseif a:var1 == "\'"
        if getline('.')[col('.')-1] == a:var1
            return "\<ESC>la"
        else
            return "\'\'\<ESC>i"
        endif
    elseif getline('.')[col('.')-1] == a:var1
        return  "\<ESC>la"
    else
        return a:var1
    endif
endfunc

" Higlight the current line
set cursorline
" don't beep
set visualbell
set noerrorbells

" At least 8 lines behind the cursor
set scrolloff=8

" Hightlight the search result
set hlsearch
