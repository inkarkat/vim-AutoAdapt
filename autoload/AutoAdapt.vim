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
"	002	02-Jul-2013	Add rule.range configuration and default to
"				'modelines' line offset from start and end.
"	001	01-Jul-2013	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:StartAndEndRange( offset )
    let l:lastStartLnum = min([line('$'), a:offset])
    let l:firstEndLnum = max([1, line('$') - a:offset + 1])
    let l:firstEndLnum = max([l:lastStartLnum + 1, l:firstEndLnum])

    let l:ranges = ['1,' . l:lastStartLnum]
    if l:firstEndLnum <= line('$')
	call add(l:ranges, l:firstEndLnum . ',$')
    endif
    return l:ranges
endfunction
function! s:GetRanges( rule )
    if get(a:rule, 'range', 'modelines') ==# 'modelines'
	return s:StartAndEndRange(&modelines)
    else
	return [a:rule.range]
    endif
endfunction
function! AutoAdapt#Trigger( rules )
    if empty(a:rules) || ! &l:modifiable
	return
    endif

    let l:errors = []
    let l:save_view = winsaveview()
    for l:rule in a:rules
	try
	    let l:sep = get(l:rule, 'substitutionSeparator', '/')
	    for l:range in s:GetRanges(l:rule)
		silent execute printf('keepjumps %ssubstitute%s%s%s%s%sge',
		\   l:range,
		\   l:sep,
		\   l:rule.pattern,
		\   l:sep,
		\   l:rule.replacement,
		\   l:sep
		\)
	    endfor
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
