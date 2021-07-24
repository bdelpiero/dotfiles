set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'amdt/vim-niji'
Plugin 'vim-scripts/paredit.vim'
Plugin 'jgdavey/tslime.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" tslime 
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c> <Plug>SetTmuxVars
vmap <C-c> <Plug>SendSelectionToTmux
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" let g:tslime_normal_mapping = '<localleader>t'
" let g:tslime_visual_mapping = '<localleader>t'
" let g:tslime_vars_mapping = '<localleader>T'
" 

set number

