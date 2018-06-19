"set encoding since multibyte chars are used
scriptencoding utf-8

"statusline functions {{{

"adds a size in bytes, with the applicable decimal prefixes, to the statusline
"(updates with typing as well)
function! statusline#HumanSize(bytes) abort "{{{
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
function! statusline#LineinfoExtended() abort "{{{
    "get byte index
    let l:col = printf('%d', (getline('.') ==? '' ? 0 : col('.')))

    "append screen column if different
    if col('.') != virtcol('.') || getline('.') ==? ''
        let l:col = l:col . printf('-%d', virtcol('.'))
    endif

    "return assembled line information as a string
    return printf('%d:%s', line('.'), l:col)
endfunction "}}}

"hides read-only marker in help files and when using dirvish
function! statusline#LightlineReadonly() abort "{{{
    return &readonly && &filetype !=# 'help' && &filetype !=# 'dirvish' ? 'RO' : ''
endfunction "}}}

"display plugin name at mode, when applicable
function! statusline#LightlineMode() abort "{{{
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
function! statusline#LightlineFilepath() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ expand('%:p') !=# '' ?
          \ fnamemodify(expand('%:p'), ':~') ==# '~/' ? '~' : fnamemodify(expand('%:p'), ':~') :
          \ '[No Name]'
endfunction "}}}

"display modified when not using a plugin
function! statusline#LightlineModified() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ &modified ? ',+' :
          \ !&modifiable ? ',-' :
          \ ''
endfunction "}}}

"display humansize when not using a plugin
function! statusline#LightlineHumanSize() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ statusline#HumanSize(line2byte(line('$')+1)-1)
endfunction "}}}

"display fileformat when not using a plugin
function! statusline#LightlineFileformat() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ &fileformat
endfunction "}}}

"display fileencoding when not using a plugin
function! statusline#LightlineFileencoding() abort "{{{
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
function! statusline#LightlineFiletype() abort "{{{
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'dirvish' ? '' :
          \ &filetype ==# 'undotree' ? '' :
          \ expand('%') =~# '^diffpanel_.*' ? '' :
          \ expand('%') ==# '[Plugins]' ? '' :
          \ &filetype !=# '' ? &filetype : 'no ft'
endfunction "}}}

"display either filename or plugin name, depending on whether a plugin is
"being used (for inactive statusline)
function! statusline#LightlineInactiveFirst() abort "{{{
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

"function to configure statusline {{{
function! statusline#configurestatusline() abort
    "configure lightline
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
        \   'mode': 'statusline#LightlineMode',
        \   'readonly': 'statusline#LightlineReadonly',
        \   'filepath': 'statusline#LightlineFilepath',
        \   'modified': 'statusline#LightlineModified',
        \   'humansize': 'statusline#LightlineHumanSize',
        \   'lineinfoextended': 'statusline#LineinfoExtended',
        \   'fileformat': 'statusline#LightlineFileformat',
        \   'fileencoding': 'statusline#LightlineFileencoding',
        \   'filetype': 'statusline#LightlineFiletype',
        \   'inactivefirst': 'statusline#LightlineInactiveFirst'
        \ },
        \ 'component': {
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
        \ },
        \ 'separator': {
        \   'left': '▓▒░',
        \   'right': '░▒▓'
        \ },
        \ 'subseparator': {
        \   'left': '░',
        \   'right': '░'
        \ }
        \ }
endfunction "}}}

"modeline to turn folds on
" vi:fdm=marker
