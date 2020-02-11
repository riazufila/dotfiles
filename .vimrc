if has("vms")
	set nobackup
else
	set backup
	if has('persistent_undo')
		set undofile
	endif
endif

autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
    \ | endif

set incsearch
set hlsearch
set showcmd
set wildmenu
set ttimeout
set ttimeoutlen=100
set mouse=a
set number relativenumber
set cursorline
set cursorlineopt=both
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4

syntax on
filetype plugin indent on

highlight LineNr ctermfg=DarkGrey
highlight CursorLine cterm=bold ctermbg=black
highlight CursorLineNr cterm=bold ctermfg=yellow

let g:ale_linters = {
\	'python' : ['pylint', 'flake8'],
\}

let g:ale_fixers = {
\	'python' : ['autopep8'],
\}

let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:netrw_liststyle = 3

packloadall
silent! helptags ALL
