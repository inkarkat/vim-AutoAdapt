" Test that AutoAdapt does not define double triggers.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(2)

0read text.txt
AutoAdapt
call vimtest#SaveOut()
call vimtap#Ok(exists('b:AutoAdapt'), 'variable defined')
call vimtap#Is(b:AutoAdapt, 1, 'one rule was applied')

call vimtest#Quit()
