" AutoAdapt/Info.vim: Information about the automatic adaptation for use in statusline etc.
"
" DEPENDENCIES:
"
" Copyright: (C) 2013-2019 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

function! AutoAdapt#Info#Status()
    if exists('b:AutoAdapt')
	if b:AutoAdapt
	    return 'adapted'
	else
	    return (empty(g:AutoAdapt_FilePattern) ? '' : 'noadapt')
	endif
    else
	return (exists('#AutoAdapt#BufWritePre#<buffer>') ? 'adapt' : '')
    endif
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
