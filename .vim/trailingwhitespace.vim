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
        "hold on to cursor position (also gets preferred column, so nothing
        "changes)
        let startpos = getcurpos()

        "get the top line of the window
        let topline = line('w0')

        "remove the trailing whitespace, silencing errors if none is found
        %substitute/\s\+$//e

        "use <C-E> or <C-Y> with number of lines to scroll in order to move
        "topline to the top of the window
        let topdist = topline - line('w0')
        if topdist > 0
            "scroll window down
            execute "normal! " . topdist . "\<C-E>"
        elseif topdist < 0
            "scroll window up
            execute "normal! " . topdist . "\<C-Y>"
        endif

        "return cursor to starting position
        call setpos('.', startpos)
    else
        "print message
        echo "File is nonmodifiable."
    endif
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearTrailingWhitespace()<cr>
