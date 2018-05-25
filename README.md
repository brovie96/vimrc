# vimrc
This is my personal .vimrc setup for [Vim](http://www.vim.org/). It includes
some changes to the Vim defaults that make it easier for me to use and a bit
prettier.

### Installing
Make sure you have a version of Vim that is compatible with
[pathogen.vim](https://github.com/tpope/vim-pathogen/) (v7.0 or newer), since
it is used in order to load
[Airline](https://github.com/vim-airline/vim-airline/) and
[Fugitive](https://github.com/tpope/vim-fugitive/). After cloning the
repository, be sure to run `git submodule update --init` to initialize and
download Airline and Fugitive into the `.vim/bundle` folder for pathogen.vim
to load. After that, you should be able to make symlinks to the `.vim` folder,
`.vimrc`, and optionally `.gvimrc` in your home directory and it should work
without any further configuration. When pulling this repository, remember to
run `git submodule update --init` again to make sure any new submodules and
submodule commits are added.
