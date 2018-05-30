"set trailing whitespace to highlight in the error color
highlight link TrailingWhitespace Error

"autocmd to enable highlighting on window enter
augroup MatchTrailingWhitespace
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$')
augroup END

"create function to remove trailing whitespace
function! s:ClearTrailingWhitespace() abort
    "make sure trying this in a nonmodifiable file just does nothing instead
    "of throwing an error
    if &modifiable
        "hold on to cursor position (also gets preferred column, so nothing
        "changes)
        let startpos = getcurpos()
        "get the top line of the window
        let topline = line('w0')

        "remove the trailing whitespace, silencing errors if none is found
        %substitute/\s\+$//e
        "return cursor to topline (same as typing ':<topline>' into the
        "command line)
        execute topline
        "move topline to top of window with repeated scrolling (using ^E)
        while line('w0') != topline
            normal! 
        endwhile
        "return cursor to starting position
        call setpos('.', startpos)
    else
        echo "File is nonmodifiable."
    endif
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearTrailingWhitespace()<cr>
