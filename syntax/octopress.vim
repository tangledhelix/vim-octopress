" Vim syntax file
" Language:     Octopress (Markdown/Textile with Liquid)
" Maintainer:   Dan Lowe (dan@tangledhelix.com)
" URL:          https://github.com/tangledhelix/vim-octopress

if exists('b:current_syntax')
	finish
endif

if !exists('g:octopress_default_format')
	let g:octopress_default_format = 'markdown'
endif

let b:filename = expand('%:t')
if empty(b:filename)
	let b:octopress_filetype = g:octopress_default_format
else
	let b:octopress_fname_result = matchlist(b:filename, '\m\.\([^.]\+\)$')
	let b:octopress_fname_exten = b:octopress_fname_result[1]
	if b:octopress_fname_exten == 'textile'
		let b:octopress_filetype = 'textile'
	else
		let b:octopress_filetype = 'markdown'
	endif
endif

if b:octopress_filetype == 'textile'
	runtime! syntax/textile.vim
else
	runtime! syntax/markdown.vim
endif
unlet! b:current_syntax

" YAML front matter
syn region octopressYamlFrontMatter start=/\m^---\s*$/ end=/\m^---\s*$/ contains=octopressYamlFrontMatterParam,octopressYamlFrontMatterValue
syn match octopressYamlFrontMatterParam /\m^[^:]\+:/ contained nextgroup=octopressYamlFrontMatterValue
syn match octopressYamlFrontMatterValue /\m\s.*$/ contained

" Liquid tags
syn match octopressLiquidTag /\m{%\s\+\(video\|include_code\|gist\|jsfiddle\|img\|flickr_image\|render_partial\|include\)\s.*\s*%}/ oneline

" Liquid blocks
syn region octopressLiquidBlock matchgroup=octopressLiquidBlockDelimiter start=/\m{%\s\+\(codeblock\|blockquote\|pullquote\|raw\)\s.*\s*%}/ end=/\m{%\s\+end\(codeblock\|blockquote\|pullquote\|raw\)\s\+%}/ contains=octopressPullquote
syn match octopressPullquote /\m{"\s[^{]\+\s"}/ contained oneline

" Backtick block
syn region octopressBacktickBlock matchgroup=octopressBacktickBlockDelimiter start=/\m^```\(\s*\|\s\+.*\)$/ end=/\m^```\s*$/

command -nargs=+ HiLink hi def link <args>

HiLink  octopressYamlFrontMatter        PreProc
HiLink  octopressYamlFrontMatterParam   Identifier
HiLink  octopressYamlFrontMatterValue   String

HiLink  octopressLiquidTag              PreProc

HiLink  octopressLiquidBlockDelimiter   PreProc
HiLink  octopressLiquidBlock            Underlined
HiLink  octopressPullquote              PreProc

HiLink  octopressBacktickBlockDelimiter PreProc
HiLink  octopressBacktickBlock          Underlined

delcommand HiLink

let b:current_syntax = 'octopress'

