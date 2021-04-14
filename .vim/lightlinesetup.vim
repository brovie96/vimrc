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
    \   'mode': 'statusline#Mode',
    \   'readonly': 'statusline#Readonly',
    \   'filepath': 'statusline#Filepath',
    \   'modified': 'statusline#Modified',
    \   'humansize': 'statusline#HumanSize',
    \   'lineinfoextended': 'statusline#LineinfoExtended',
    \   'fileformat': 'statusline#FileFormat',
    \   'fileencoding': 'statusline#FileEncoding',
    \   'filetype': 'statusline#Filetype',
    \   'inactivefirst': 'statusline#InactiveFirst'
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
\ } "}}}
"set up lightline's tabline
let g:lightline.tabline = { 'left': [ [ 'tabs' ] ], 'right': [ ] }
let g:lightline.tab = { 'active': [ 'filename', 'modified' ], 'inactive': [ 'filename', 'modified' ] }
"modeline to turn folds on
" vi:fdm=marker
