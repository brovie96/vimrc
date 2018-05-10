"turn on ruler
set ruler

"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"make backspace work more normally
"(backspace over indents, eols, and insertion start point)
set backspace=indent,eol,start

"highlight trailing whitespace
highlight link TrailingWhitespace Error
match TrailingWhitespace /\s\+$/

"set a buffer of five lines around the cursor
set scrolloff=5

"turn on syntax highlighting
syntax on

"indentation options
set autoindent
filetype plugin indent on

"set left and right movement to move between end of
"upper line and beginning of lower line
set whichwrap+=<,>,h,l,[,]

"keep long lines from wrapping
set nowrap

"map <leader>w to remove trailing whitespace
nnoremap <silent> <leader>w :%s/\s\+$//e<cr>
