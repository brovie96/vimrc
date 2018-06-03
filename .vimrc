"set nocompatible explicitly to make sure tweekmonster/startuptime.vim doesn't
"have weird issues
set nocompatible

"show statusline
set laststatus=2

"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"make sure colorscheme shows up correctly
set background=light

"turn on advanced command-line completion
set wildmenu

"make joined lines have single-spaced sentences
set nojoinspaces

"show commands in the bottom row (useful for checking normal mode commands as
"they are typed)
set showcmd

"make sure terminal is in 256-color mode
set t_Co=256

"add a confirmation dialog on :q and others
set confirm

"make backspace work more normally (backspace over indents, eols, and
"insertion start point)
set backspace=indent,eol,start

"indentation/filetype options
set autoindent
filetype plugin indent on

"turn on syntax highlighting
syntax on

"turn on line numbers
set number

"change highlighting for line numbers
highlight LineNr term=bold cterm=bold ctermfg=darkcyan

"set a buffer of five lines around the cursor when scrolling vertically
set scrolloff=5

"set left and right movement to move across eols
set whichwrap+=<,>,h,l,[,]

"keep long lines from wrapping
set nowrap

"make horizontal scrolling not jump so much
set sidescroll=20

"map <leader><Tab> and <leader><S-Tab> to switch tabs
nnoremap <silent> <leader><Tab> :tabnext<cr>
nnoremap <silent> <leader><S-Tab> :tabprevious<cr>

"load trailing whitespace stuff
runtime trailingwhitespace.vim

"load plugins
runtime pluginsetup.vim
