function! pluginsetup#downloadplug() abort
    "make sure curl is installed
    let l:curl = system('which curl')

    if l:curl !=# ''
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        "try wget (need to create folder separately)
        let l:wget = system('which wget')

        if l:wget !=# ''
            if empty(glob('~/.vim/autoload/'))
                silent !mkdir -p ~/.vim/autoload/
            endif

            silent !wget -O ~/.vim/autoload/plug.vim
                        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        else
            "neither one is installed (somehow)
            silent !echo 'NEITHER CURL NOR WGET IS INSTALLED ON YOUR SYSTEM.'
            silent !echo 'PLEASE INSTALL CURL OR WGET AND RELAUNCH VIM.'
            qall!
        endif
    endif
endfunction
