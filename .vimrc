"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"draw statusline
call statusline#buildstatusline()

"load trailing whitespace stuff
runtime trailingwhitespace.vim

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

"turn on line numbers
set number

"change highlighting for line numbers
highlight! link LineNr Identifier

"make autocmd to recolor on colorscheme change
augroup LineNumberHighlight
    autocmd!
    autocmd ColorScheme * highlight! link LineNr Identifier
augroup END

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
