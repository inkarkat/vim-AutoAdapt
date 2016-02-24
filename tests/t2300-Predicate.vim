" Test influencing adaptation with predicate.

source helpers/modelinerules.vim

let s:flag = 0
function! Predicate( filespec )
    return s:flag
endfunction
let g:AutoAdapt_Predicate = function('Predicate')

call vimtest#StartTap()
call vimtap#Plan(2)

0read text.txt
call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'buffer is not adapted when predicate is false')
let s:flag = 1
write
call vimtap#Is(b:AutoAdapt, 1, 'buffer is adapted after predicate is true')

call vimtest#Quit()
