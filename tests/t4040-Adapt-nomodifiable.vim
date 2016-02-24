" Test manual trigger on a nomodifiable buffer.

source helpers/modelinerules.vim
0read text.txt
setlocal nomodifiable

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#err#Errors("Cannot make changes, 'modifiable' is off", 'Adapt', 'exception thrown')
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on nomodifiable buffer')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on write')

call vimtest#Quit()
