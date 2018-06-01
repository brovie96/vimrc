"start configuring vim-plug
call plug#begin('~/.vim/plugged')

"load vim-airline
Plug 'vim-airline/vim-airline'

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

"update runtime path and init vim-plug
call plug#end()
