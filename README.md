# vimrc
This is my personal configuration for [Vim](http://www.vim.org/). It includes
some changes to the Vim defaults that make it easier for me to use and a bit
prettier.

### Installing
Most online sources (including [the Vim subreddit](http://reddit.com/r/vim/))
strongly discourage using someone else's Vim configuration, but if you really
want to use mine, here's how to set it up.

Make sure you have a version of Vim that is compatible with
[vim-plug](https://github.com/junegunn/vim-plug) (7.0 or newer, 8.0
recommended), since is is used in order to load the plugins. After cloning the
repository, make symlinks to the `.vim` folder, `.vimrc`, and optionally
`.gvimrc` so that Vim will load them. Next, start Vim and run `:PlugInstall`
so that vim-plug will download
[Airline](https://github.com/vim-airline/vim-airline/) and
[Fugitive](https://github.com/tpope/vim-fugitive/) to the `.vim/plugged`
folder to be run. Remember to periodically run `:PlugUpdate` in Vim to make
sure the plugins are up to date.
