"statusline functions
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

function! FileFormat() abort
    return printf('%4s', &fileformat)
endfunction

"function to build statusline
function! statusline#buildstatusline() abort
    "enable statusline
    set laststatus=2

    "build statusline
    let &statusline=''
    let &statusline.='%F'
    let &statusline.=' %y'
    let &statusline.=' %{HumanSize(line2byte(line("$")+1)-1)}'
    let &statusline.=' %{ReadOnlyAndModified()}'
    let &statusline.='%='
    let &statusline.='(%l,%c%V)'
    let &statusline.='  %{FileFormat()}'
    let &statusline.='  %P'
endfunction
