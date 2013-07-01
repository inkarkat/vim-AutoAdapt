" AutoAdapt.vim: Automatically adapt timestamps, copyright notices, etc.
"
" DEPENDENCIES:
"   - ingo/err.vim autoload script
"
" Copyright: (C) 2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	01-Jul-2013	file creation
let s:save_cpo = &cpo
set cpo&vim

function! AutoAdapt#Trigger( rules )
    if empty(a:rules) || ! &l:modifiable
	return
    endif

    let l:errors = []
    let l:save_view = winsaveview()
    for l:rule in a:rules
	try
	    silent execute printf('keepjumps %%substitute/%s/%s/ge',
	    \	l:rule.pattern,
	    \	l:rule.replacement
	    \)
	catch /^Vim\%((\a\+)\)\=:E/
	    call add(l:errors, ingo#msg#MsgFromVimException())
	catch
	    call add(l:errors, v:exception)
	endtry
    endfor
    call winrestview(l:save_view)

    if len(l:errors) > 0
	call ingo#err#Set(join(l:errors, "\n"))
	return 0
    endif
    return 1
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
