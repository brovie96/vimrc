"statusline functions

"adds a size in bytes, with the applicable decimal prefixes, to the statusline
"(updates with typing as well)
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
        return printf('(%.2f %s)', l:bytes, l:sizes[l:i])
    else
        return printf('(%.0f %s)', l:bytes, l:sizes[l:i])
    endif
endfunction

"function to build statusline
function! statusline#buildstatusline() abort
    "change c section of airline
    let g:airline_section_c = "%<%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
    "change x section of airline
    let g:airline_section_x = "%{airline#util#prepend(\"\",0)}%{airline#util#wrap(airline#parts#filetype(),0)} %{HumanSize(line2byte(line(\"$\")+1)-1)}"
    "change z section of airline
    let g:airline_section_z = "%-4P% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3c%V"
endfunction
