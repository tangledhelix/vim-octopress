" Vim syntax file
" Language:     Markdown (Octopress variant with Liquid)
" Maintainer:   Dan Lowe <dan@tangledhelix.com>
" Last Change:  4 Dec 2012
" URL:          https://github.com/tangledhelix/vim-octopress

if exists('b:current_syntax')
	finish
endif

runtime! syntax/markdown.vim
unlet! b:current_syntax

" YAML front matter
syn region octopressYamlFrontMatter start=/\m^---\s*$/ end=/\m^---\s*$/ contains=octopressYamlFrontMatterParam,octopressYamlFrontMatterValue
syn match octopressYamlFrontMatterParam /\m^[^:]\+:/ contained nextgroup=octopressYamlFrontMatterValue
syn match octopressYamlFrontMatterValue /\m\s.*$/ contained

" Liquid tags
syn match octopressLiquidTag /\m{%\s\+\(video\|include_code\|gist\|jsfiddle\|img\|render_partial\|include\)\s.*\s*%}/ oneline

" Liquid blocks
syn region octopressLiquidBlock matchgroup=octopressLiquidBlockDelimiter start=/\m{%\s\+\(codeblock\|blockquote\|pullquote\)\s.*\s*%}/ end=/\m{%\s\+end\(codeblock\|blockquote\|pullquote\)\s\+%}/ contains=octopressPullquote
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

