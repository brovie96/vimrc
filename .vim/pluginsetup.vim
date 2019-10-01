"make sure vim-plug is installed {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    call pluginsetup#downloadplug()
endif "}}}
"start configuring vim-plug {{{
call plug#begin($HOME . '/.vim/plugged') "}}}
"load plugins {{{
let s:plugins = readfile(expand('$HOME/.vim/pluginlist.txt'))
for s:plugin in s:plugins
    if s:plugin !~? '^//'
        execute 'Plug' "'" . s:plugin . "'"
    endif
endfor
unlet s:plugin
unlet s:plugins "}}}
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
