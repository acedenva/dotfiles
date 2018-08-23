set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/youcompleteme'  
" #apt-get update; sudo apt-get -y install python-dev python3-dev build-essential cmake nodejs npm;
" #cd ~/.vim/bundle/youcompleteme; git submodule update --init --recursive; ./install.py --js-completer;
call vundle#end()

let mapleader="\<CR>"
imap jk <ESC>

nmap <Leader>c :tabnew $MYVIMRC<CR>
nmap <Leader>r :so %<CR>
nmap <Leader>q :set relativenumber!<CR>
so ${HOME}/.vimfunctions.vim

set nowrap
set tabstop=2
set splitbelow
set splitright
set smartindent
set shiftwidth=2

set foldmethod=syntax
set foldlevelstart=20

syntax on
colorscheme gruvbox
set background=dark

" myColor Classes for Gruvbox
hi! link myComment GruvboxBg4
hi! link myString GruvboxRed
hi! link myNumber GruvboxAqua
hi! link myVariable GruvboxBlue
hi! link myFunction GruvboxPurple
hi! link myVimHighlight Cursor
hi! link myFunctionCall GruvboxYellow
hi! link myObject GruvboxOrangeBold

" myColor Adjustemnts - Code
hi! default link Comment myComment
hi! default link String myString
hi! default link Number myNumber
hi! default link Identifier myVariable
hi! default link StorageClass myFunction

" myColor Adjustments - Javascript
hi! default link jsFunction myFunction 
hi! default link jsFuncCall myFunctionCall
hi! default link jsFuncName myFunctionCall
hi! default link jsFuncArgs myVariable
hi! default link jsVariableDef myVariable
hi! default link jsGlobalObjects myObject
hi! default link jsObject myObject
hi! default link jsObjectValue myVariable

" myColor Adjustments - LUA
hi! default link luaFunc myNumber 
hi! default link luaFuncCall myFunctionCall
hi! default link luaFuncId myFunctionCall 
hi! default link luaFuncName myFunctionCall
hi! default link luaStatement myNumber
hi! default link luaNumber myString
hi! default link luaLocal myVariable
" myColor Adjustemnts - Vim 
hi! default link Search myVimHighlight
