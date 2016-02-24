" Test turning on the rules with AutoAdapt.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(2)

0read text.txt
call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'buffer is not adapted yet')
AutoAdapt
write
call vimtap#Is(b:AutoAdapt, 1, 'buffer is adapted after :AutoAdapt')

call vimtest#Quit()
