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
        "get the top line of the screen without using a jump
        let topline = line('w0')

        "set the proper line to call zt from if scrolloff is greater than 0
        if topline > 1
            "make sure scrolloff being maxed out doesn't screw up anything (tests
            "are inconclusive, but just making sure)
            if &scrolloff >= ceil(winheight(0) / 2.0)
                let topline = line('.')
            else
                let topline += &scrolloff
            endif
        endif

        "remove the trailing whitespace, silencing errors if none is found
        %substitute/\s\+$//e
        "return cursor to topline
        execute topline
        "move topline to the top of the screen (or as close as scrolloff will let
        "it get)
        normal! zt
        "return cursor to starting position
        call setpos('.', startpos)
    else
        echo "File is nonmodifiable."
    endif
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearTrailingWhitespace()<cr>
