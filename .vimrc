"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"make sure colorscheme shows up correctly
set background=light

"start up pathogen
call pathogen#infect()
Helptags

"enable mouse
set mouse=a

"show commands in the bottom row (useful for checking normal mode commands as
"they are typed)
set showcmd

"make sure terminal is in 256-color mode
set t_Co=256

"configure statusline using airline
call statusline#configurestatusline()

"set up airline's tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#tab_min_count=2

"load trailing whitespace stuff
runtime trailingwhitespace.vim

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
