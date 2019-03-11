# vimrc
This is my personal configuration for [Vim][Vim]. It includes several changes
to the Vim defaults that provide a lot of additional functionality and make the
UI a bit prettier.

### Installing
Most online sources (including [the Vim subreddit][Vim sub]) strongly
discourage using someone else's Vim configuration, but if you really want to
use mine, here's how to set it up. If you just want to use my trailing
whitespace stuff, that has been spun off into [its own
plugin][trailingwhitespace.vim].

Make sure you are on a Unix-equivalent OS (including any version of Linux, even
when run in [WSL][WSL]) and have a version of Vim that is compatible with
[vim-plug][vim-plug] (7.0 or newer, 8.0+ recommended), since it is used in
order to load [various plugins][plugins.txt]. (Personally, I use the newest
version of Vim from [the official GitHub repository][Vim GitHub].) After
cloning the repository, make symlinks to the `.vim` folder, `.vimrc`, and
optionally `.gvimrc` so that Vim will load them. (You can even make a symlink
to my .vintrc.yaml if you have [Vint][Vint] installed and you really want to be
a copycat.) Next, start Vim (which will download vim-plug to the
`.vim/autoload` folder, assuming you have cURL or Wget installed [if you don't,
it will just exit and tell you to install one of those programs]) and run
`:PlugInstall` so that vim-plug will download the plugins to the `.vim/plugged`
folder. Remember to periodically run `:PlugUpdate` in Vim to make sure the
plugins are up to date and to download new plugins if available. Also
periodically run `:PlugClean` to remove downloaded plugins that are no longer
being loaded.

[Vim]: http://www.vim.org/
[Vim sub]: http://reddit.com/r/vim/
[WSL]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[trailingwhitespace.vim]: https://github.com/brovie96/trailingwhitespace.vim/
[vim-plug]: https://github.com/junegunn/vim-plug/
[plugins.txt]: https://github.com/brovie96/vimrc/blob/master/plugins.txt/
[Vim Github]: https://github.com/vim/vim/
[Vint]: https://github.com/Kuniwak/vint/
