"adds a size in bytes, with the applicable decimal prefixes, to the statusline {{{
"(updates with typing as well)
function! s:HumanSize(bytes) abort
    if a:bytes < 0 | return '0 B' | endif

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
"prints ruler-style line information {{{
function! statusline#LineinfoExtended() abort
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
"hides read-only marker in help files and when using dirvish {{{
function! statusline#Readonly() abort
    return &readonly && &filetype !=# 'help' && &filetype !=# 'dirvish' ? 'RO' : ''
endfunction "}}}
"display plugin name at mode, when applicable {{{
function! statusline#Mode() abort
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
"display filepath when not using a plugin {{{
function! statusline#Filepath() abort
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
"display modified when not using a plugin {{{
function! statusline#Modified() abort
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
"display humansize when not using a plugin {{{
function! statusline#HumanSize() abort
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
"display fileformat when not using a plugin {{{
function! statusline#FileFormat() abort
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
"display fileencoding when not using a plugin {{{
function! statusline#FileEncoding() abort
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
"display filetype when not using a plugin {{{
function! statusline#Filetype() abort
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
"display either filename or plugin name, depending on whether a plugin is being used {{{
"(for inactive statusline)
function! statusline#InactiveFirst() abort
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
"modeline to turn folds on {{{
" vi: se fdm=marker: }}}
