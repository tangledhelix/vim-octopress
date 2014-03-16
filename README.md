
[vim-octopress][] adds syntax highlighting and [Octopress][] commands to
[Vim][].  Both [Markdown][] and [Textile][] modes are supported.

[vim-octopress]: https://github.com/tangledhelix/vim-octopress
[octopress]: http://octopress.org/
[vim]: http://www.vim.org/
[markdown]: http://daringfireball.net/projects/markdown/syntax
[textile]: http://txstyle.org/

Using the `:Octopress` command, you can create new posts, regenerate your
output files, and even deploy to your server.

NOTE: At this time, live preview mode is not supported, due to limitations in
how Vim handles background processes.  It is not expected that this support
will be added unless Octopress significantly redesigns the preview mode.

If you use [Pathogen][] (and you really should):

[pathogen]: https://github.com/tpope/vim-pathogen

```
cd ~/.vim/bundle
git clone https://github.com/tangledhelix/vim-octopress.git octopress
```

Or, to install the old-fashioned way:

```
git clone https://github.com/tangledhelix/vim-octopress.git
cd vim-octopress
for i in doc ftplugin plugin syntax; do
	mkdir -p ~/.vim/$i
	cp $i/octopress.* ~/.vim/$i
done
```

For more information, see `:help octopress` or read
[octopress.txt][octopress-doc] online.

[octopress-doc]: https://github.com/tangledhelix/vim-octopress/blob/master/doc/octopress.txt

