"set trailing whitespace to highlight in the error color
highlight link TrailingWhitespace Error

"autocmd to enable highlighting on window enter
augroup MatchTrailingWhitespace
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$')
augroup END

"create function to remove trailing whitespace
function! s:ClearTrailingWhitespace() abort
    "make sure trying this in a nonmodifiable file just prints a message
    "instead of throwing an error
    if &modifiable
        let l:lines = 0
        let l:linenum = 1
        for l:line in getline(1, '$')
            if match(l:line, '\s\+$') > -1
                let l:lines += 1
                call setline(l:linenum, substitute(l:line, '\s\+$', '', ''))
            endif
            let l:linenum += 1
        endfor

        if l:lines > 0
            echom printf('%d substitutions on %d lines', l:lines, l:lines)
        endif
    else
        "print message
        echo 'File is nonmodifiable.'
    endif
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearTrailingWhitespace()<cr>
