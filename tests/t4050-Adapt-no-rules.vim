" Test manual trigger on no rules.

let g:AutoAdapt_Rules = []
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
try
    Adapt
    call vimtap#Fail('expected exception')
catch
    call vimtap#err#Thrown("No rules defined", 'exception thrown')
endtry
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on nomodifiable buffer')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no adaptation on write')

call vimtest#Quit()
