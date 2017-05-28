if g:runVimTest !~# 'conf-'
    if g:runVimTest =~# 'opt-in-'
	let g:AutoAdapt_FilePattern = ''
    endif
    runtime plugin/AutoAdapt.vim
endif

function! OffPredicate( filespec )
    return 0
endfunction
