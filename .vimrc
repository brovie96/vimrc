"turn on ruler
set ruler

"use soft tabs of 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

"set confirm to make better dialog on :q and others
set confirm

"make backspace work more normally
"(backspace over indents, eols, and insertion start point)
set backspace=indent,eol,start

"indentation options
set autoindent
filetype plugin indent on

"turn on syntax highlighting
syntax on

"set trailing whitespace to highlight in the error color
highlight link TrailingWhitespace Error

"autocmd to enable highlighting on window enter
augroup MatchTrailingWhitespace
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('TrailingWhitespace', '\s\+$')
augroup END

"set a buffer of five lines around the cursor when scrolling
set scrolloff=5

"set left and right movement to move across eols
set whichwrap+=<,>,h,l,[,]

"keep long lines from wrapping
set nowrap

"make sideways scrolling not jump so much
set sidescroll=20

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

"map <leader><Tab> and <leader><S-Tab> to switch tabs
nnoremap <silent> <leader><Tab> :tabn<cr>
nnoremap <silent> <leader><S-Tab> :tabp<cr>
