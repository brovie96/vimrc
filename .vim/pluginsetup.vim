"make sure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"start configuring vim-plug
call plug#begin($HOME . '/.vim/plugged')

"load vim-surround
Plug 'tpope/vim-surround'

"load undotree
Plug 'mbbill/undotree', { 'on': ['UndotreeFocus', 'UndotreeHide', 'UndotreeShow', 'UndotreeToggle'] }

"load startuptime.vim
Plug 'tweekmonster/startuptime.vim'

"load gist-vim (depends on webapi-vim)
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

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

"load vim-checklist
Plug 'esalter-va/vim-checklist'

"load vim-commentary
Plug 'tpope/vim-commentary'

"load vim-characterize
Plug 'tpope/vim-characterize'

"load gitignore.vim
Plug 'rdolgushin/gitignore.vim'

"load vim-vinegar
Plug 'tpope/vim-vinegar'

"update runtime path and init vim-plug
call plug#end()

"configure statusline using lightline
call statusline#configurestatusline()

"set up lightline's tabline
let g:lightline.tabline = { 'left': [ [ 'tabs' ] ], 'right': [ ] }
let g:lightline.tab = { 'active': [ 'filename', 'modified' ], 'inactive': [ 'filename', 'modified' ] }

"set up vim-easy-align commands
xmap gl <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)

"set up mapping for undotree
nnoremap <silent> <leader>ut :UndotreeToggle<cr>

"set up mapping for vim-checklist
nnoremap <silent> <leader><cr> :ChecklistToggleCheckbox<cr>
