"make sure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
    call pluginsetup#downloadplug()
endif
"start configuring vim-plug
call plug#begin($HOME . '/.vim/plugged')
"load plugins {{{
let s:plugins = readfile($HOME . '/.vim/pluginlist.txt')
for s:plugin in s:plugins
    if s:plugin !~? '^//'
        execute 'Plug' "'" . s:plugin . "'"
    endif
endfor
unlet s:plugin
unlet s:plugins "}}}
"update runtime path and init vim-plug
"(plugins are loaded after this function call)
call plug#end()
"set up mappings/commands {{{
"set up mapping for trailingwhitespace.vim (mine)
nnoremap <silent> <leader>w :call trailingwhitespace#ClearTrailingWhitespace()<cr>
"override netrw commands with vim-dirvish
let g:loaded_netrw = 1 | let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1 | let g:loaded_netrwFileHandlers = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
"set colors for vim-gitgutter
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
"}}}
"modeline to turn folds on
" vi:fdm=marker
