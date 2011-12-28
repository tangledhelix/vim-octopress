
[Vim][] syntax highlighting for [Octopress][] post and page files. Both
Markdown and Textile modes are supported.

[vim]: http://www.vim.org/
[octopress]: http://octopress.org/

If you use [Pathogen][] (and you really should):

[pathogen]: https://github.com/tpope/vim-pathogen

    cd ~/.vim/bundle
    git clone https://github.com/tangledhelix/vim-octopress.git octopress

To install the old-fashioned way:

    git clone https://github.com/tangledhelix/vim-octopress.git
    cd vim-octopress
    for i in ftplugin syntax ; do
        mkdir -p ~/.vim/$i
        cp $i/octopress.vim ~/.vim/$i
    done

For more information, see `:help octopress`

