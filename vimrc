set nocompatible              " be iMproved, required
filetype off                  " required

imap jj <Esc>
" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" disable sound for vim on windows terminal
set visualbell
set t_vb=

" set the runtime path to include Vundle and initialize
set rtp+=/home/bruno/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  
  " scheme
  Plugin 'amdt/vim-niji'
  Plugin 'vim-scripts/paredit.vim'
  Plugin 'jgdavey/tslime.vim'
  Plugin 'morhetz/gruvbox'
  
  " js/ts
  Plugin 'pangloss/vim-javascript'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'maxmellon/vim-jsx-pretty' 
  
  Plugin 'christoomey/vim-tmux-navigator'
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
" let g:tslime_ensure_trailing_newlines = 1
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

