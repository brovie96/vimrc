"set nocompatible explicitly {{{
"(to make sure tweekmonster/startuptime.vim doesn't have weird issues)
set nocompatible "}}}
"statusline stuff {{{
"show statusline {{{
set laststatus=2 "}}}
"don't show mode, since lightline will show it already {{{
set noshowmode "}}}
"set ttimeout and ttimeoutlen to make mode display in lightline update faster {{{
set ttimeout | set ttimeoutlen=50 "}}}
"}}}
"formatting stuff {{{
"use soft tabs of 4 spaces {{{
set expandtab | set shiftwidth=4 | set softtabstop=4 "}}}
"make joined lines have single-spaced sentences {{{
set nojoinspaces "}}}
"}}}
"display stuff {{{
"make sure colorscheme shows up correctly {{{
set background=light "}}}
"make sure terminal is in 256-color mode {{{
set t_Co=256 "}}}
"turn on line numbers {{{
set number "}}}
"change highlighting for line numbers {{{
highlight LineNr term=bold cterm=bold ctermfg=darkcyan
"}}}
"show commands in the bottom row {{{
"(useful for checking normal mode commands as they are typed)
set showcmd "}}}
"keep long lines from wrapping {{{
set nowrap "}}}
"change completeopt (for vim-mucomplete) {{{
set completeopt+=menuone
set completeopt+=noselect "}}}
"hide completion messages (for vim-mucomplete) {{{
set shortmess+=c " }}}
"}}}
"behavior stuff (contains movement stuff) {{{
"turn on advanced command-line completion (wildmenu) {{{
set wildmenu "}}}
"turn on ignorecase and smartcase (mostly for wildmenu) {{{
set ignorecase | set smartcase "}}}
"add a confirmation dialog on :q and others {{{
set confirm "}}}
"make backspace work more normally {{{
"(backspace over indents, eols, and insertion start point)
set backspace=indent,eol,start "}}}
"enable autoindent {{{
set autoindent "}}}
"movement stuff {{{
"set a buffer of five lines around the cursor when scrolling vertically {{{
set scrolloff=5 "}}}
"make horizontal scrolling not jump so much {{{
set sidescroll=20 "}}}
"set left and right movement to move across eols {{{
set whichwrap+=<,>,h,l,[,] "}}}
"}}}
"map <leader><Tab> and <leader><S-Tab> to switch tabs {{{
nnoremap <silent> <leader><Tab> :tabnext<cr>
nnoremap <silent> <leader><S-Tab> :tabprevious<cr>
"}}}
"}}}
"other stuff {{{
"set default sql type to mysql {{{
let g:sql_type_default='mysql' "}}}
"}}}
"hidden buffer stuff {{{
"enable hidden buffers {{{
set hidden "}}}
"setup speedy buffer switch with <leader>l {{{
nnoremap <leader>l :ls<CR>:b<space>
"}}}
"}}}
"load external stuff {{{
"load plugins {{{
runtime pluginsetup.vim "}}}
"configure lightline {{{
runtime lightlinesetup.vim "}}}
"}}}
"modeline to turn folds on {{{
" vi: se fdm=marker: }}}
