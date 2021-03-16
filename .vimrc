"###############################################################################
"# Robert Sokol's vim configuration
"###############################################################################

set expandtab 
set smarttab 
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4

"###############################################################################
"# Search/read options
"###############################################################################

set number
set showmatch
set smartcase
set hlsearch
set incsearch

syntax on

"###############################################################################
"# Autocomplete
"###############################################################################

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

"###############################################################################
"# Python options
"###############################################################################

"Auto-indent code blocks for *.py files."
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Trim trailing whitespaces when saving."
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

"###############################################################################
"# vim-plug configuration
"###############################################################################

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

call plug#end()


"###############################################################################
"# NerdTree configuration
"###############################################################################

"Start NerdTree automatically and shift focus to opened file"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"Automatically close Vim when NerdTree is the last window"

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Prevent other buffers from overwriting NerdTree window"

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"Open NerdTree on each new tab"

autocmd BufWinEnter * silent NERDTreeMirror

"###############################################################################
"# Syntastic configuration
"###############################################################################

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
