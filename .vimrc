"set nocompatible explicitly to make sure tweekmonster/startuptime.vim doesn't
"have weird issues
set nocompatible

"show statusline
set laststatus=2

"don't show mode, since lightline will show it already
set noshowmode

"set ttimeout and ttimeoutlen to make mode display in lightline update faster
set ttimeout
set ttimeoutlen=50

"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"make sure colorscheme shows up correctly
set background=light

"turn on advanced command-line completion
set wildmenu

"turn on ignorecase and smartcase (mostly for wildmenu)
set ignorecase
set smartcase

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

"enable autoindent
set autoindent

"turn on line numbers
set number

"change highlighting for line numbers
highlight LineNr term=bold cterm=bold ctermfg=darkcyan

"set default sql type to mysql
let g:sql_type_default='mysql'

"set a buffer of five lines around the cursor when scrolling vertically
set scrolloff=5

"make horizontal scrolling not jump so much
set sidescroll=20

"set left and right movement to move across eols
set whichwrap+=<,>,h,l,[,]

"keep long lines from wrapping
set nowrap

"map <leader><Tab> and <leader><S-Tab> to switch tabs
nnoremap <silent> <leader><Tab> :tabnext<cr>
nnoremap <silent> <leader><S-Tab> :tabprevious<cr>

"enable hidden buffers
set hidden

"setup speedy buffer switch with <leader>l
nnoremap <leader>l :ls<CR>:b<space>

"load trailing whitespace stuff
runtime trailingwhitespace.vim

"load plugins
runtime pluginsetup.vim
