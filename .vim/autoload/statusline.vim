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
          \ &filetype ==# 'vim-plug' ? 'Plugins' :
          \ lightline#mode()
endfunction


"display filepath when not using a plugin
function! LightlineFilepath()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ expand('%:p') !=# '' ? fnamemodify(expand('%:p'), ':~') :
          \ '[No Name]'
endfunction

"display modified when not using a plugin
function! LightlineModified()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ &modified ? ',+' :
          \ !&modifiable ? ',-' :
          \ ''
endfunction

"display humansize when not using a plugin
function! LightlineHumansize()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ HumanSize(line2byte(line("$")+1)-1)
endfunction

"display lineinfoextended when not using a plugin
function! LightlineLineinfoextended()
    let col = printf('%d', (getline('.') == '' ? 0 : col('.')))
    if col('.') != virtcol('.') || getline('.') == ''
        let col = col . printf('-%d', virtcol('.'))
    endif
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ printf('%d:%s', line('.'), col)
endfunction

"display fileformat when not using a plugin
function! LightlineFileformat()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ &fileformat
endfunction

"display fileencoding when not using a plugin
function! LightlineFileencoding()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ &fileencoding !=# "" ? &fileencoding : &encoding
endfunction

"display filetype when not using a plugin
function! LightlineFiletype()
    return expand('%:t') ==# '__Tagbar__' ? '':
          \ expand('%:t') ==# 'ControlP' ? '' :
          \ &filetype ==# 'unite' ? '' :
          \ &filetype ==# 'vimfiler' ? '' :
          \ &filetype ==# 'vimshell' ? '' :
          \ &filetype ==# 'vim-plug' ? '' :
          \ &filetype !=# "" ? &filetype : "no ft"
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
        \   'mode': 'LightlineMode',
        \   'gitbranch': 'fugitive#head',
        \   'readonly': 'LightlineReadonly',
        \   'filepath': 'LightlineFilepath',
        \   'modified': 'LightlineModified',
        \   'humansize': 'LightlineHumansize',
        \   'lineinfoextended': 'LightlineLineinfoextended',
        \   'fileformat': 'LightlineFileformat',
        \   'fileencoding': 'LightlineFileencoding',
        \   'filetype': 'LightlineFiletype'
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
        \   'left': '',
        \   'right': ''
        \ },
        \ 'subseparator': {
        \   'left': '',
        \   'right': ''
        \ }
        \ }
endfunction
