"set trailing whitespace to highlight in the error color
highlight link TrailingWhitespace Error

"make sure highlighting happens on color change
augroup HighlightTrailingWhitespace
    autocmd!
    autocmd ColorScheme * highlight link TrailingWhitespace Error
augroup END

"autocmd to enable highlighting on window enter
augroup MatchTrailingWhitespace
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$')
augroup END

"create function to remove trailing whitespace
function! s:ClearWhitespace() abort
    let startpos = getcurpos()
    normal! H
    let topline = line('.')
    %substitute/\s\+$//e
    execute 'normal! ' . topline . 'G'
    normal! zt
    call setpos('.', startpos)
endfunction

"map <leader>w to call function
nnoremap <silent> <leader>w :call <SID>ClearWhitespace()<cr>
