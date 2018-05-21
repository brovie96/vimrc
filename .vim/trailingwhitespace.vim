"set trailing whitespace to highlight in the error color
highlight link TrailingWhitespace Error

"autocmd to enable highlighting on window enter
augroup MatchTrailingWhitespace
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$')
augroup END

"create function to remove trailing whitespace
function! s:ClearWhitespace() abort
    let startpos = getcurpos()
    let topline = line('w0')

    if topline > 1
        let topline += 5
    endif

    %substitute/\s\+$//e
    execute topline
    normal! zt
    call setpos('.', startpos)
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearWhitespace()<cr>
