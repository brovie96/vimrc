"statusline functions

"adds a '[+]' to the statusline if the buffer is modified, and a '[RO]' if the
"buffer is set to readonly or nonmodifiable
function! ReadOnlyAndModified() abort
    let ret=''

    if &modified
        let ret.='[+] '
    endif

    if &readonly || !&modifiable
        let ret.='[RO]'
    endif

    return ret
endfunction

"adds a size in bytes, with the applicable decimal prefixes, to the statusline
"(updates with typing as well)
function! HumanSize(bytes) abort
    if a:bytes < 0
        return ''
    endif

    let l:bytes = a:bytes
    let l:sizes = ['B', 'KB', 'MB', 'GB']
    let l:i = 0

    while l:bytes >= 1000
        let l:bytes = l:bytes / 1000.0
        let l:i += 1
    endwhile

    if l:i > 0
        return printf('%.2f%s', l:bytes, l:sizes[l:i])
    else
        return printf('%.0f%s', l:bytes, l:sizes[l:i])
    endif
endfunction

"adds the newline format (usually 'unix' or 'dos') to the statusline
function! FileFormat() abort
    return printf('%4s', &fileformat)
endfunction

"function to build statusline
function! statusline#buildstatusline() abort
    "enable statusline
    set laststatus=2

    "build statusline
    let &statusline=''
    "full path
    let &statusline.='%F'
    "filetype
    let &statusline.=' %y'
    "size in bytes, with applicable decimal prefix
    let &statusline.=' %{HumanSize(line2byte(line("$")+1)-1)}'
    "[+] and/or [RO], if modified and/or readonly/nonmodifiable respectively
    let &statusline.=' %{ReadOnlyAndModified()}'
    "switch to right side
    let &statusline.='%='
    "line number and real/virtual column number
    let &statusline.='(%l,%c%V)'
    "file format (usually 'unix' or 'dos')
    let &statusline.='  %{FileFormat()}'
    "percentage scrolled (as in ruler)
    let &statusline.='  %P'
endfunction
