"enable statusline
set laststatus=2

"statusline functions
function! ReadOnly() abort
    if &readonly || !&modifiable
        return '[RO]'
    else
        return ''
endfunction

"build statusline
set statusline=
set statusline+=%F
set statusline+=\ %y
set statusline+=\ %{ReadOnly()}
set statusline+=%=
set statusline+=%{(&modified?'Modified':'')}
set statusline+=\ \ \ \ (%l,%c%V)
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %P
