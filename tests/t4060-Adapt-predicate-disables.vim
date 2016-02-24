" Test manual trigger when the predicate disallows it.

source helpers/modelinerules.vim
function! Predicate( filespec )
    return 0
endfunction
let g:AutoAdapt_Predicate = function('Predicate')
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#err#Errors('Adaptation disabled; (add ! to override)', 'Adapt', 'exception thrown')
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on nomodifiable buffer')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on write')

call vimtest#Quit()
