"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"source statusline and trailing whitespace stuff
if has('unix')
    source $HOME/.vim/statusline.vim
    source $HOME/.vim/trailingwhitespace.vim
elseif has('win32')
    source $HOME\vimfiles\statusline.vim
    source $HOME\vimfiles\trailingwhitespace.vim
endif

"set confirm to make better dialog on :q and others
set confirm

"make backspace work more normally
"(backspace over indents, eols, and insertion start point)
set backspace=indent,eol,start

"indentation options
set autoindent
filetype plugin indent on

"turn on syntax highlighting
syntax on

"set a buffer of five lines around the cursor when scrolling
set scrolloff=5

"set left and right movement to move across eols
set whichwrap+=<,>,h,l,[,]

"keep long lines from wrapping
set nowrap

"make sideways scrolling not jump so much
set sidescroll=20

"map <leader><Tab> and <leader><S-Tab> to switch tabs
nnoremap <silent> <leader><Tab> :tabn<cr>
nnoremap <silent> <leader><S-Tab> :tabp<cr>
