"set up handling for nginx syntax
augroup NginxSyntax
    "clear already-defined autocmds to make sure
    "they only exist once
    autocmd!

    "set /etc/nginx/nginx.conf, all files in
    "/etc/nginx/sites-available, and all
    "files in /etc/nginx/sites-enabled to
    "use nginx syntax
    autocmd BufRead,BufNewFile /etc/nginx/nginx.conf,/etc/nginx/sites-available/*,/etc/nginx/sites-enabled/* setfiletype nginx
augroup END
