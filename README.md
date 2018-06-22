# vimrc
This is my personal configuration for [Vim][Vim]. It includes several changes
to the Vim defaults that provide a lot of additional functionality and make the
UI a bit prettier.

### Installing
Most online sources (including [the Vim subreddit][Vim sub]) strongly
discourage using someone else's Vim configuration, but if you really want to
use mine, here's how to set it up.
******************************************************************************
Make sure you are on a Unix-equivalent OS (including any version of Linux, even
when run in [WSL][WSL]) and have a version of Vim that is compatible with
[vim-plug][vim-plug] (7.0 or newer, 8.0 recommended), since it is used in order
to load [various plugins][pluginsetup.vim]. After cloning the repository, make
symlinks to the `.vim` folder, `.vimrc`, and optionally `.gvimrc` so that Vim
will load them. Next, start Vim (which will download vim-plug to the
`.vim/autoload` folder) and run `:PlugInstall` so that vim-plug will download
the plugins to the `.vim/plugged` folder. Remember to periodically run
`:PlugUpdate` in Vim to make sure the plugins are up to date and to download
new plugins if available. Also periodically run `:PlugClean` to remove
downloaded plugins that are no longer being loaded.

[Vim]: http://www.vim.org/
[Vim sub]: http://reddit.com/r/vim/
[WSL]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[vim-plug]: https://github.com/junegunn/vim-plug/
[pluginsetup.vim]: https://github.com/brovie96/vimrc/blob/master/.vim/pluginsetup.vim/
