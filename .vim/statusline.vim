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
    \   'linter_ok': 'lightline#ale#ok'
    \ },
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left'
    \ }
    \ }
