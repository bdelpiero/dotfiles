set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" disable sound for vim on windows terminal
set visualbell
set t_vb=

set number                     " show current line number
set relativenumber             " show relative line numbers

set tabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smartindent

" Remaps
imap jj <Esc>
"use leader y/p to copy/paste to clipboard
"see https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>


" Plugins
call plug#begin()
  
  " scheme
  Plug 'amdt/vim-niji'
  Plug 'vim-scripts/paredit.vim'
  Plug 'jgdavey/tslime.vim'
  Plug 'morhetz/gruvbox'
  
  " js/ts
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'prettier/vim-prettier'

  " solidity
  Plug 'tomlion/vim-solidity'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'fxn/vim-monochrome'
  Plug 'AhmedAbdulrahman/vim-aylin'
call plug#end()

" tslime 
vmap <leader>t <Plug>SendSelectionToTmux
nmap <leader>t <Plug>NormalModeSendToTmux
nmap <leader>T <Plug>SetTmuxVars
" let g:tslime_ensure_trailing_newlines = 1
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1

" fzf
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-p> :GFiles<Cr>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" prettier
let g:prettier#config#config_precedence = 'file-override'

" improved lisp formatter: https://github.com/ds26gte/scmindent
autocmd bufread,bufnewfile *.lisp,*.scm setlocal equalprg=scmindent.js

" colorscheme
colo aylin

if (has("termguicolors"))
      set termguicolors
endif

" TODO: move everything from vimrc to seperate files
" netrw config. 
source ~/dotfiles/vim/better-netrw.vim
