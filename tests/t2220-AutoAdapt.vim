" Test turning the rules back on with AutoAdapt.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(2)

0read text.txt
NoAutoAdapt
call vimtest#SaveOut()
call vimtap#Is(b:AutoAdapt, 0, 'buffer is disabled for automatic adapt after :NoAutoAdapt')
AutoAdapt
write
call vimtap#Is(b:AutoAdapt, 1, 'buffer is adapted after :AutoAdapt')

call vimtest#Quit()
