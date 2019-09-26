"make sure vim-plug is installed {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    "call the autoload function
    call pluginsetup#downloadplug()
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
"load gist-vim and webapi-vim (gist-vim depends on webapi-vim) {{{
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
"load trailingwhitespace.vim (mine) {{{
Plug 'brovie96/trailingwhitespace.vim' "}}}
"load vim-mucomplete {{{
Plug 'lifepillar/vim-mucomplete' "}}}
"}}}
"update runtime path and init vim-plug {{{
"(plugins are loaded after this function call)
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
"set up mapping for trailingwhitespace.vim (mine) {{{
nnoremap <silent> <leader>w :call trailingwhitespace#ClearTrailingWhitespace()<cr>
"}}}
"set up custom mappings for vim-mucomplete {{{
imap <leader><tab> <plug>(MUcompleteFwd)
imap <leader><s-tab> <plug>(MUcompleteBwd)
"}}}
"override netrw commands with vim-dirvish {{{
let g:loaded_netrw = 1 | let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1 | let g:loaded_netrwFileHandlers = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args> "}}}
"}}}
"modeline to turn folds on {{{
" vi: se fdm=marker: }}}
