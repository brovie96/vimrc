"enable statusline
set laststatus=2

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
    let l:bytes = a:bytes
    let l:sizes = ['B', 'KiB', 'MiB', 'GiB']
    let l:i = 0

    while l:bytes >= 1024
        let l:bytes = l:bytes / 1024.0
        let l:i += 1
    endwhile

    if l:i > 0
        return printf('%.2f%s', l:bytes, l:sizes[l:i])
    else
        return printf('%.0f%s', l:bytes, l:sizes[l:i])
endfunction

"build statusline
let &statusline=''
let &statusline.='%F'
let &statusline.=' %y'
let &statusline.=' %{HumanSize(line2byte("$")+len(getline("$")))}'
let &statusline.=' %{ReadOnlyAndModified()}'
let &statusline.='%='
let &statusline.='    (%l,%c%V)'
let &statusline.='                %P'
