" Plugins

call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'sansyrox/vim-python-virtualenv'
call plug#end()

" Configurations

" Default indentation
set tabstop=4 softtabstop=4 shiftwidth=4

" Two spaces indentation for filetypes
autocmd FileType vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType xml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2

set expandtab smarttab
set autoindent
set number relativenumber
set mouse=a
set incsearch ignorecase hlsearch
set nocursorline
set nocursorcolumn
set encoding=utf-8
syntax on
filetype plugin indent on
highlight clear LineNr
highlight clear SignColumn
highlight clear StatusLineNC
highlight clear VertSplit

" Open new split panes to right and below
set splitright splitbelow

" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal on CTRL+x
function! OpenTerminal()
  split term://zsh
  resize 8
  set nonumber norelativenumber
  highlight clear LineNr
  highlight clear SignColumn
endfunction

nnoremap <c-x> :call OpenTerminal()<CR>

" Move between panels with Alt in any modes
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Plugins' Options

" preservim/nerdtree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeHighlightCursorline = 0

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on new tabs
autocmd BufWinEnter * silent NERDTreeMirror

" Toggle NERDTree with CTRL+t
nnoremap <C-t> :NERDTreeToggle<CR>

" junegunn/fzf.vim

" Find files with CTRL+p
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:fzf_layout = { 'down' : '30%' }

" neoclide/coc.nvim

" Compulsory settings for CoC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Install coc extensions
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-html',
  \'coc-json',
  \'coc-tsserver',
  \'coc-prettier',
  \'coc-pyright',
  \'coc-clangd',
  \'coc-vetur',
  \'coc-pairs',
  \'coc-flow',
  \'coc-eslint'
  \]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" For scss files
autocmd FileType scss setl iskeyword+=@-@

" vim-airline/vim-airline

" Square status and tabs (no arrow-like design)
let g:airline_left_sep=''
let g:airline_right=''
let g:airline#extensions#tabline#left_sep = ''

" Enable airline tab
let g:airline#extensions#tabline#enabled = 1

" Tab format
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Uses ascii instead of unicode for symbols
let g:airline_symbols_ascii = 1

" preservim/nerdcommenter

let g:NERDSpaceDelims = 1
let NERDDefaultAlign = "left"
let g:NERDCustomDelimiters = { 'python': { 'left': '#' }, 'pyrex': { 'left': '#' } }

" Use `,c` to toggle comment
vnoremap ,c :call NERDComment(0,"toggle")<CR>
nnoremap ,c :call NERDComment(0,"toggle")<CR>

" airblade/vim-gitgutter

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" sansyrox/vim-python-virtualenv

let g:python3_host_prog='/usr/bin/python'
