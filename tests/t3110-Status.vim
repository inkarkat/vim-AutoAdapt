" Test Status function with turning off the rules with NoAutoAdapt.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(3)

0read text.txt
call vimtap#Is(AutoAdapt#Info#Status(), '', 'global on')
call vimtest#SaveOut()
call vimtap#Is(AutoAdapt#Info#Status(), 'adapted', 'after write')
NoAutoAdapt
call vimtap#Is(AutoAdapt#Info#Status(), 'noadapt', 'global on, local off')

call vimtest#Quit()
