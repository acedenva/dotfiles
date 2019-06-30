set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'JiangMiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'valloric/youcompleteme'  
" #apt-get update; apt-get -y install python-dev python3-dev build-essential cmake nodejs npm;
" #cd ~/.vim/bundle/youcompleteme; git submodule update --init --recursive; ./install.py --js-completer;
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-fakeclip'
Plugin 'posva/vim-vue'
call vundle#end()
so ${HOME}/.vimfunctions.vim

imap jk <ESC>
let mapleader="\<CR>"

let tmux_navigator_no_mappings = 1
nmap <silent> <C-s>h :TmuxNavigateLeft<cr>
nmap <silent> <C-s>j :TmuxNavigateDown<cr>
nmap <silent> <C-s>k :TmuxNavigateUp<cr>
nmap <silent> <C-s>l :TmuxNavigateRight<cr>

nmap <silent> <Leader>c "*y<CR>
vmap <silent> <Leader>c "*y<CR>
nmap <silent> <Leader>v "*p<CR>
nmap <silent> <Leader>z :tabnew $MYVIMRC<CR>
nmap <silent> <Leader>Z :tabnew ${HOME}/.vimfunctions.vim<CR>
nmap <silent> <Leader>s :so %<CR>
nmap <silent> <Leader>q :set relativenumber!<CR>:set number!<CR>
nmap <silent> <Leader>a :set wrap!<CR> 
nmap <silent> <Leader>d :YcmCompleter GetDoc<CR>
nmap <silent> <Leader>f :call Start('node')<CR>
vmap <silent> <Leader>f "cy<ESC>:call Start('node',expand(@c))<CR>
nmap <silent> <Leader>b :call Start('bash')<CR>
vmap <silent> <Leader>b "by<ESC>:call Start('bash',expand(@b))<CR> 
nmap <silent> <Leader>t :call Start('crdebug')<CR>
nmap <silent> <Leader><ESC> :silent! !bash -c 'pkill node; pkill chrome'<CR>:redraw!<CR>

set nowrap
set splitbelow
set splitright

filetype plugin indent on
set smartindent
set shiftwidth=2
set tabstop=2

set foldmethod=syntax
set foldlevelstart=20
set list
set lcs=tab:\|\ 

" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor"
nmap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
syntax on
colorscheme gruvbox
set background=dark

" for vim-vue
autocmd BufRead,BufNewFile *.vue set filetype=vue

" myColor Classes for Gruvbox
hi! link myComment GruvboxBg4
hi! link myString GruvboxRed
hi! link myNumber GruvboxAqua
hi! link myVariable GruvboxBlue
hi! link myFunction GruvboxPurple
hi! link myVimHighlight Cursor
hi! link myFunctionCall GruvboxYellow
hi! link myObject GruvboxOrangeBold
hi! link jsGlobalNodeObjects GruvboxYellow

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
