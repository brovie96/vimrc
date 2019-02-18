"configure lightline {{{
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left':  [ [ 'mode', 'paste' ],
    \              [ 'readonly', 'filepath', 'modified', 'humansize' ] ],
    \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \              [ 'lineinfoextended' ],
    \              [ 'rulerpercent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'inactive': {
    \   'left':  [ [ 'inactivefirst' ] ],
    \   'right': [ [ 'lineinfoextended' ],
    \              [ 'rulerpercent' ] ]
    \ },
    \ 'component_function': {
    \   'mode': 'LL_Mode',
    \   'readonly': 'LL_Readonly',
    \   'filepath': 'LL_Filepath',
    \   'modified': 'LL_Modified',
    \   'humansize': 'LL_HumanSize',
    \   'lineinfoextended': 'LL_LineinfoExtended',
    \   'fileformat': 'LL_FileFormat',
    \   'fileencoding': 'LL_FileEncoding',
    \   'filetype': 'LL_Filetype',
    \   'inactivefirst': 'LL_InactiveFirst'
    \ },
    \ 'component': {
    \   'rulerpercent': '%P'
    \ },
    \ 'component_expand': {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok'
    \ },
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left'
    \ }
\ }
"}}}

"set up lightline's tabline {{{
let g:lightline.tabline = { 'left': [ [ 'tabs' ] ], 'right': [ ] }
let g:lightline.tab = { 'active': [ 'filename', 'modified' ], 'inactive': [ 'filename', 'modified' ] }
"}}}

"functions for lightline configuration {{{

"adds a size in bytes, with the applicable decimal prefixes, to the statusline
"(updates with typing as well)
function! s:HumanSize(bytes) abort "{{{
    if a:bytes < 0
        return '0 B'
    endif

    let l:bytes = a:bytes
    let l:sizes = ['KB', 'MB', 'GB']
    let l:i = -1

    while l:bytes >= 1000
        let l:bytes = l:bytes / 1000.0
        let l:i += 1
    endwhile

    if l:i >= 0
        return printf('%.2f %s', l:bytes, l:sizes[l:i])
    else
        return printf('%.0f B', l:bytes)
    endif
endfunction "}}}

"prints ruler-style line information
function! LL_LineinfoExtended() abort "{{{
    "if empty line, print '0-1' that ruler uses
    if getline('.') ==? ''
        let l:col = '0-1'
    else
        "get byte index
        let l:col = printf('%d', col('.'))

        "append screen column if different
        if col('.') != virtcol('.')
            let l:col = l:col . printf('-%d', virtcol('.'))
        endif

    endif

    "return assembled line information as a string
    return printf('%d:%s', line('.'), l:col)
endfunction "}}}

"hides read-only marker in help files and when using dirvish
function! LL_Readonly() abort "{{{
    return &readonly && &filetype !=# 'help' && &filetype !=# 'dirvish' ? 'RO' : ''
endfunction "}}}

"display plugin name at mode, when applicable
function! LL_Mode() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
          \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
          \ &filetype ==# 'unite' ? 'Unite' :
          \ &filetype ==# 'vimfiler' ? 'VimFiler' :
          \ &filetype ==# 'vimshell' ? 'VimShell' :
          \ &filetype ==# 'dirvish' ? 'Dirvish' :
          \ &filetype ==# 'undotree' ? 'Undotree' :
          \ expand('%') =~# '^diffpanel_.*'  ? 'Diff' :
          \ expand('%') ==# '[Plugins]' ? 'Plugins' :
          \ &filetype ==# 'help' ? 'Help' :
          \ lightline#mode()
endfunction "}}}

"display filepath when not using a plugin
function! LL_Filepath() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ expand('%:p') !=# '' ?
          \ winwidth(0) <= 70 ? expand('%:t') :
          \ fnamemodify(expand('%:p'), ':~') ==# '~/' ? '~' : fnamemodify(expand('%:p'), ':~') :
          \ '[No Name]'
endfunction "}}}

"display modified when not using a plugin
function! LL_Modified() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ &filetype ==# 'help' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ &modified ? ',+' :
          \ !&modifiable ? ',-' :
          \ ''
endfunction "}}}

"display humansize when not using a plugin
function! LL_HumanSize() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ s:HumanSize(line2byte(line('$')+1)-1)
endfunction "}}}

"display fileformat when not using a plugin
function! LL_FileFormat() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ winwidth(0) <= 70 ? '' :
          \ &fileformat
endfunction "}}}

"display fileencoding when not using a plugin
function! LL_FileEncoding() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ &fileencoding !=# '' ? &fileencoding : &encoding
endfunction "}}}

"display filetype when not using a plugin
function! LL_Filetype() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ winwidth(0) <= 70 ? '' :
          \ &filetype !=# '' ? &filetype : 'no ft'
endfunction "}}}

"display either filename or plugin name, depending on whether a plugin is
"being used (for inactive statusline)
function! LL_InactiveFirst() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
          \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
          \ &filetype ==# 'unite' ? 'Unite' :
          \ &filetype ==# 'vimfiler' ? 'VimFiler' :
          \ &filetype ==# 'vimshell' ? 'VimShell' :
          \ &filetype ==# 'dirvish' ? 'Dirvish' :
          \ &filetype ==# 'undotree' ? 'Undotree' :
          \ expand('%') =~# '^diffpanel_.*' ? 'Diff' :
          \ expand('%') ==# '[Plugins]' ? 'Plugins' :
          \ &filetype ==# 'help' ? 'Help' :
          \ expand('%:t')
endfunction "}}}

"}}}

"modeline to turn folds on {{{
" vi: set fdm=marker: }}}
