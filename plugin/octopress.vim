" octopress.vim - Wrapper for Octopress Rake commands
" Language:         Octopress (Markdown/Textile with Liquid)
" Maintainer:       Dan Lowe (dan@tangledhelix.com)
" URL:              https://github.com/tangledhelix/vim-octopress
"
" TODO: store state of swapfile, then restore it.
" only change state if it was set previously.

if exists('g:loaded_octopress') || &cp
	finish
endif
let g:loaded_octopress = 1

if exists('g:octopress_rake_executable')
	let b:octopress_rake_executable = g:octopress_rake_executable
else
	let b:octopress_rake_executable = 'rake'
endif

function! s:Octopress(task, ...)
	redraw!
	if a:task ==# 'new_post'
		if a:0 == 0
			echoerr 'Missing post_title'
			return
		endif
		let rakefile_path = substitute(system(b:octopress_rake_executable . " -e 'puts (Rake.application.find_rakefile_location())[1]'"), "\n", '', '')
		let rake_output = system(b:octopress_rake_executable . ' ' . a:task . '[' . shellescape(join(a:000)) . ']')
		let post_path = ''
		for line in split(rake_output, "\n")
			if line =~? 'Creating new post:'
				let post_path = substitute(line, '^Creating new post: ', '', '')
				break
			endif
		endfor
		if post_path == ''
			echoerr 'Unable to find path to new post file'
		else
			execute ':edit ' . rakefile_path . '/' . post_path
		endif
	" TODO add task new_page
	elseif a:task ==# 'watch' || a:task ==# 'preview'
		echo 'Sorry, background tasks are not supported.'
		return
	elseif a:task ==# 'generate' || a:task ==# 'deploy' || a:task ==# 'gen_deploy' || a:task ==# 'push' || a:task ==# 'rsync' || a:task ==# 'clean'
		if a:task ==# 'deploy' || a:task ==# 'gen_deploy' || a:task ==# 'rsync'
			execute 'set noswapfile'
		endif
		execute '!' . b:octopress_rake_executable . ' ' . a:task
	else
		echo "I don't know about that Octopress task."
	endif
	redraw!
endfunction

function! s:Complete(ArgLead, CmdLine, CursorPos)
	return "new_post\nclean\ndeploy\ngen_deploy\ngenerate\npush\nrsync\n"
endfunction

command! -bang -nargs=* -complete=custom,s:Complete Octopress call s:Octopress(<f-args>)

