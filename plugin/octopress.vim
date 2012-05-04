" octopress.vim - Wrapper for Octopress Rake commands
" Language:         Octopress (Markdown/Textile with Liquid)
" Maintainer:       Dan Lowe <dan@tangledhelix.com>
" URL:              https://github.com/tangledhelix/vim-octopress

if exists("g:loaded_octopress") || &cp
    finish
endif
let g:loaded_octopress = 1

if !exists("g:octopress_rake_executable")
    let g:octopress_rake_executable = "rake"
endif

function! s:Octopress(task)
    redraw!
    if a:task == "watch" || a:task == "preview"
        echo "Sorry, background tasks are not supported."
        return
    elseif a:task == "generate" || a:task == "deploy" || a:task == "gen_deploy" || a:task == "push" || a:task == "rsync" || a:task == "clean"
        if a:task == "deploy" || a:task == "gen_deploy" || a:task == "rsync"
            execute "set noswapfile"
        endif
        execute "!rake " . a:task
    else
        echo "I don't know about that Octopress task."
    endif
    redraw!
endfunction

function! s:Complete(ArgLead, CmdLine, CursorPos)
    return "clean\ndeploy\ngen_deploy\ngenerate\npush\nrsync\n"
endfunction

command! -bang -nargs=* -complete=custom,s:Complete Octopress call s:Octopress(<q-args>)

