"enable statusline
set laststatus=2

"statusline functions
function! ReadOnlyAndModified() abort
    let ret=''

    if &modified
        let ret.=' [+]'
    endif

    if &readonly || !&modifiable
        let ret.=' [RO]'
    endif

    return ret
endfunction

"build statusline
set statusline=
set statusline+=%F
set statusline+=\ %y
set statusline+=%{ReadOnlyAndModified()}
set statusline+=%=
set statusline+=\ \ \ \ (%l,%c%V)
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %P
