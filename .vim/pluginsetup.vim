"start configuring vim-plug
if has('unix')
    call plug#begin($HOME . '/.vim/plugged')
elseif has('win32')
    call plug#begin($HOME . '\vimfiles\plugged')
endif

"load vim-surround
Plug 'tpope/vim-surround'

"load undotree
Plug 'mbbill/undotree', { 'on': ['UndotreeFocus', 'UndotreeHide', 'UndotreeShow', 'UndotreeToggle'] }

"load startuptime.vim
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

"load gist-vim (depends on vebapi-vim)
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim', { 'on': 'Gist' }

"load vim-plug (for help file)
Plug 'junegunn/vim-plug'

"load vim-easy-align
Plug 'junegunn/vim-easy-align'

"load vim-speeddating
Plug 'tpope/vim-speeddating'

"load vim-repeat
Plug 'tpope/vim-repeat'

"load vim-blade
Plug 'jwalton512/vim-blade'

"load nginx.vim
Plug 'chr4/nginx.vim'

"load vim-eunuch
Plug 'tpope/vim-eunuch', { 'on': [ 'Delete', 'Remove', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Find', 'Locate', 'SudoEdit', 'SudoWrite', 'Wall', 'W' ] }

"load VimCompletesMe
Plug 'ajh17/VimCompletesMe'

"load ale
Plug 'w0rp/ale'

"load lightline.vim
Plug 'itchyny/lightline.vim'

"load lightline-ale
Plug 'maximbaz/lightline-ale'

"load hexmode
Plug 'fidian/hexmode'

"update runtime path and init vim-plug
call plug#end()

"configure statusline using lightline
call statusline#configurestatusline()

"set up lightline's tabline

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ ]
    \ }

let g:lightline.tab = {
    \ 'active': [ 'filename', 'modified' ],
    \ 'inactive': [ 'filename', 'modified' ]
    \ }

"set up vim-easy-align commands
xmap gl <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)

"set up shortcut for undotree
nnoremap <silent> <leader>ut :UndotreeToggle<cr>
