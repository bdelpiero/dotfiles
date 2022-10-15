set nocompatible              " be iMproved, required
filetype off                  " required


""" Appearance

" use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" disable sound for vim on windows terminal
set visualbell
set t_vb=

set number                     " show current line number
set relativenumber             " show relative line numbers

set tabstop=2
set shiftwidth=2
set expandtab


""" Remaps

imap jj <Esc>

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


""" Plugins

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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " solidity
  Plug 'tomlion/vim-solidity'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'christoomey/vim-tmux-navigator'

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

" coc
let g:coc_global_extensions = ['coc-tsserver']
hi CocFloating ctermbg=8
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" improved lisp formatter: https://github.com/ds26gte/scmindent
autocmd bufread,bufnewfile *.lisp,*.scm setlocal equalprg=scmindent.js
