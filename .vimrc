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
set softtabstop=0
set shiftwidth=4
set smarttab
set expandtab

syntax on
filetype plugin indent on

highlight LineNr ctermfg=DarkGrey
highlight CursorLine cterm=bold ctermbg=black
highlight CursorLineNr cterm=bold ctermfg=yellow

" Close Preview when leaving Insert mode
autocmd InsertLeave * if bufname('%') != "[Command Line]" | pclose | endif

" NERDTree
" Show hidden files/folders
let NERDTreeShowHidden = 1
" open NERDTree always
autocmd VimEnter * NERDTree
" even in other tabs
autocmd BufWinEnter * NERDTreeMirror
"Make the 'editor' as the default window
autocmd VimEnter * wincmd p
" Close vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ALE
let g:ale_linters = {
\   'python': ['pylint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoimport', 'autopep8'],
\}

let g:ale_fix_on_save = 1

" vim-airline
let g:airline_powerline_fonts = 1

" VimCompletesMe
autocmd FileType vim let b:vcm_tab_complete = 'vim'
