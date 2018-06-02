"start configuring vim-plug
if has('unix')
    call plug#begin($HOME . '/.vim/plugged')
elseif has('win32')
    call plug#begin($HOME . '\vimfiles\plugged')
endif

"load vim-fugitive
Plug 'tpope/vim-fugitive'

"load vim-surround
Plug 'tpope/vim-surround'

"load undotree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

"load startuptime.vim
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

"load webapi-vim
Plug 'mattn/webapi-vim'

"load gist-vim
Plug 'mattn/gist-vim', { 'on': 'Gist' }

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
Plug 'tpope/vim-eunuch'

"load VimCompletesMe
Plug 'ajh17/VimCompletesMe'

"load ale
Plug 'w0rp/ale'

"load lightline
Plug 'itchyny/lightline.vim'

"update runtime path and init vim-plug
call plug#end()

"configure statusline using airline
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
