
[Vim][] syntax highlighting for [Octopress][]-flavored Markdown files.

[vim]: http://www.vim.org/
[octopress]: http://octopress.org/

To install the traditional way:

	git clone https://github.com/tangledhelix/vim-octopress.git
	cd vim-octopress
	for i in ftplugin syntax ; do
		mkdir -p ~/.vim/$i
		cp $i/octopress.vim ~/.vim/$i
	done

If you use [Pathogen][]:

[pathogen]: https://github.com/tpope/vim-pathogen

	cd ~/.vim/bundle
	git clone https://github.com/tangledhelix/vim-octopress.git octopress

To use this mode for your Octopress Markdown files, use an `autocmd`.

	autocmd BufNewFile,BufRead *.markdown setfiletype octopress

