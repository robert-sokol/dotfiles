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
"# Python options
"###############################################################################

"Auto-indent code blocks for *.py files."
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Trim trailing whitespaces when saving."
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
