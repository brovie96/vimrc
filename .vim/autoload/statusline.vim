"statusline functions

"adds a size in bytes, with the applicable decimal prefixes, to the statusline
"(updates with typing as well)
function! HumanSize(bytes) abort
    if a:bytes < 0
        return '0 B'
    endif

    let l:bytes = a:bytes
    let l:sizes = ['B', 'KB', 'MB', 'GB']
    let l:i = 0

    while l:bytes >= 1000
        let l:bytes = l:bytes / 1000.0
        let l:i += 1
    endwhile

    if l:i > 0
        return printf('%.2f %s', l:bytes, l:sizes[l:i])
    else
        return printf('%.0f %s', l:bytes, l:sizes[l:i])
    endif
endfunction

"hides read-only marker in help files
function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

"display plugin name at mode, when applicable
function! LightlineMode()
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
          \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
          \ &filetype ==# 'unite' ? 'Unite' :
          \ &filetype ==# 'vimfiler' ? 'VimFiler' :
          \ &filetype ==# 'vimshell' ? 'VimShell' :
          \ &filetype ==# 'vim-plug' ? 'Plugin' :
          \ lightline#mode()
endfunction

"function to configure statusline
function! statusline#configurestatusline() abort
    "configure lightline
    let g:lightline = {
        \ 'colorscheme': 'powerline',
        \ 'active': {
        \   'left':  [ [ 'mode', 'paste' ],
        \              [ 'gitbranch', 'readonly', 'filepath', 'modified', 'humansize' ] ],
        \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
        \              [ 'lineinfoextended' ],
        \              [ 'rulerpercent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'readonly': 'LightlineReadonly',
        \   'mode': 'LightlineMode'
        \ },
        \ 'component': {
        \   'filepath': '%F',
        \   'humansize': '%{HumanSize(line2byte(line("$")+1)-1)}',
        \   'lineinfoextended': '%l:%c%V',
        \   'rulerpercent': '%P'
        \ },
        \ 'component_expand': {
        \   'linter_checking': 'lightline#ale#checking',
        \   'linter_warnings': 'lightline#ale#warnings',
        \   'linter_errors': 'lightline#ale#errors',
        \   'linter_ok': 'lightline#ale#ok',
        \ },
        \ 'component_type': {
        \   'linter_checking': 'left',
        \   'linter_warnings': 'warning',
        \   'linter_errors': 'error',
        \   'linter_ok': 'left',
        \ }
        \ }
endfunction
