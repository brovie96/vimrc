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
        "set loop variables
        let l:lines = 0
        let l:linenum = 1

        "loop through each line
        for l:line in getline(1, '$')
            "only operate on a line if it has trailing whitespace
            if match(l:line, '\s\+$') > -1
                "add 1 to count of lines that have been changed
                let l:lines += 1

                "remove trailing whitespace
                call setline(l:linenum, substitute(l:line, '\s\+$', '', ''))
            endif

            "add one to line number so the correct line is swapped
            let l:linenum += 1
        endfor

        "mirror the message printed by :substitute
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
