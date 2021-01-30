" Plugins

call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" Configurations

" Default indentation
set tabstop=4 softtabstop=4 shiftwidth=4

" Two spaces indentation for filetypes
autocmd FileType vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2

set expandtab smarttab
set autoindent
set number relativenumber
set mouse=a
set incsearch ignorecase hlsearch
set nocursorline
set nocursorcolumn
highlight clear LineNr
highlight clear SignColumn

" Open new split panes to right and below
set splitright splitbelow

" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Open terminal on CTRL+n
function! OpenTerminal()
  split term://zsh
  resize 10
  set nonumber norelativenumber
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

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
    \'coc-snippets',
    \'coc-vetur'
    \]

" For scss files
autocmd FileType scss setl iskeyword+=@-@

" ervandew/supertab

let g:SuperTabDefaultCompletionType = "<c-n>"

" vim-airline/vim-airline

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
