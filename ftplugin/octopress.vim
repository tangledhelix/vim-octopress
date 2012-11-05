" Vim filetype plugin
" Language:     Octopress (Markdown/Textile with Liquid)
" Maintainer:   Dan Lowe (dan@tangledhelix.com)
" URL:          https://github.com/tangledhelix/vim-octopress

if exists('b:did_ftplugin')
	finish
endif

" This mostly loads HTML-related code, so it should not interfere
" with Textile.
runtime! ftplugin/markdown.vim
unlet! b:did_ftplugin

