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

"function to configure statusline
function! statusline#configurestatusline() abort
    "update symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    "change c section of airline
    let g:airline_section_c = "%<%<%F%m %{HumanSize(line2byte(line(\"$\")+1)-1)} %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
    "change z section of airline
    let g:airline_section_z = "%-4P% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3c%V"
endfunction
