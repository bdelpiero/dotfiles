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
  Plugin 'prettier/vim-prettier'
  Plugin 'neoclide/coc.nvim', {'branch': 'release'}

  Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plugin 'junegunn/fzf.vim'

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

" improved lisp formatter: https://github.com/ds26gte/scmindent
autocmd bufread,bufnewfile *.lisp,*.scm setlocal equalprg=scmindent.js

" tslime 
vmap <leader>t <Plug>SendSelectionToTmux
nmap <leader>t <Plug>NormalModeSendToTmux
nmap <leader>T <Plug>SetTmuxVars
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

" Use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-p> :GFiles<Cr>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:prettier#config#config_precedence = 'file-override'

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

set tabstop=2
set shiftwidth=2
set expandtab

eval "$(starship init zsh)"


