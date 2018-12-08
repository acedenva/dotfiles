set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/youcompleteme'  
" #apt-get update; sudo apt-get -y install python-dev python3-dev build-essential cmake nodejs npm;
" #cd ~/.vim/bundle/youcompleteme; git submodule update --init --recursive; ./install.py --js-completer;
call vundle#end()
so ${HOME}/.vimfunctions.vim

let mapleader="\<CR>"
imap jk <ESC>

nmap <Leader>c :tabnew $MYVIMRC<CR>
nmap <Leader>C :tabnew ${HOME}/.vimfunctions.vim<CR>
nmap <Leader>s :so %<CR>
nmap <Leader>q :set relativenumber!<CR>:set number!<CR>
nmap <Leader>v :call Start('node')<CR>
vmap <Leader>v "cy<ESC>:call Start('node',expand(@c))<CR>
nmap <Leader>b :call Start('bash')<CR>
vmap <Leader>b "by<ESC>:call Start('bash',expand(@b))<CR> 
nmap <Leader>g :call Start('crdebug')<CR>

set nowrap
set tabstop=2
set splitbelow
set splitright
set smartindent
set shiftwidth=2

set foldmethod=syntax
set foldlevelstart=20
filetype plugin indent on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
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
