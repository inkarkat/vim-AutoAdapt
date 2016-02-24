" Test manual trigger on no rules.

let g:AutoAdapt_Rules = []
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#err#Errors("No rules defined", 'Adapt', 'exception thrown')
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on nomodifiable buffer')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on write')

call vimtest#Quit()
