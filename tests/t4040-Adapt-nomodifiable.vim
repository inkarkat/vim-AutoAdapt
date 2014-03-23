" Test manual trigger on a nomodifiable buffer.

source helpers/modelinerules.vim
0read text.txt
setlocal nomodifiable

call vimtest#StartTap()
call vimtap#Plan(3)
try
    Adapt
    call vimtap#Fail('expected exception')
catch
    call vimtap#err#Thrown("Cannot make changes, 'modifiable' is off", 'exception thrown')
endtry
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on nomodifiable buffer')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on write')

call vimtest#Quit()
