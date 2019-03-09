"make sure vim-plug is installed {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    "make sure curl is installed
    let b:curl = system('which curl')

    if b:curl !=# ''
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !echo 'CURL IS NOT INSTALLED ON YOUR SYSTEM. PLEASE INSTALL CURL AND RELAUNCH VIM.'
        qall!
    endif

    unlet b:curl
endif "}}}
"start configuring vim-plug {{{
call plug#begin($HOME . '/.vim/plugged') "}}}
"load plugins {{{
"load vim-surround {{{
Plug 'tpope/vim-surround' "}}}
"load undotree {{{
Plug 'mbbill/undotree' "}}}
"load startuptime.vim {{{
Plug 'tweekmonster/startuptime.vim' "}}}
"load gist-vim (depends on webapi-vim) {{{
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim' "}}}
"load vim-plug (for help file) {{{
Plug 'junegunn/vim-plug' "}}}
"load vim-easy-align {{{
Plug 'junegunn/vim-easy-align' "}}}
"load vim-speeddating {{{
Plug 'tpope/vim-speeddating' "}}}
"load vim-repeat {{{
Plug 'tpope/vim-repeat' "}}}
"load vim-blade {{{
Plug 'jwalton512/vim-blade' "}}}
"load nginx.vim {{{
Plug 'chr4/nginx.vim' "}}}
"load vim-eunuch {{{
Plug 'tpope/vim-eunuch' "}}}
"load VimCompletesMe {{{
Plug 'ajh17/VimCompletesMe' "}}}
"load ale {{{
Plug 'w0rp/ale' "}}}
"load lightline.vim {{{
Plug 'itchyny/lightline.vim' "}}}
"load lightline-ale (depends on ale and lightline.vim) {{{
Plug 'maximbaz/lightline-ale' "}}}
"load hexmode {{{
Plug 'fidian/hexmode' "}}}
"load vim-checklist {{{
Plug 'esalter-va/vim-checklist' "}}}
"load vim-commentary {{{
Plug 'tpope/vim-commentary' "}}}
"load vim-characterize {{{
Plug 'tpope/vim-characterize' "}}}
"load gitignore.vim {{{
Plug 'rdolgushin/gitignore.vim' "}}}
"load vim-dirvish {{{
Plug 'justinmk/vim-dirvish' "}}}
"load vim-scriptease {{{
Plug 'tpope/vim-scriptease' "}}}
"load vim-unimpaired {{{
Plug 'tpope/vim-unimpaired' "}}}
"}}}
"update runtime path and init vim-plug {{{ "(plugins are loaded after this function call)
call plug#end() "}}}
"set up mappings/commands {{{
"set up vim-easy-align commands {{{
vmap <Enter> <Plug>(EasyAlign)
xmap gl <Plug>(EasyAlign)
nmap gl <Plug>(EasyAlign)
"}}}
"set up mapping for undotree {{{
nnoremap <silent> <leader>ut :UndotreeToggle<cr>
"}}}
"set up mapping for vim-checklist {{{
nnoremap <silent> <leader><cr> :ChecklistToggleCheckbox<cr>
"}}}
"override netrw commands with vim-dirvish {{{
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
"}}}
"}}}
"configure lightline {{{
runtime lightlinesetup.vim "}}}
"modeline to turn folds on {{{
" vi: se fdm=marker: }}}
