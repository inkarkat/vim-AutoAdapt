" Test Status function with turning on the rules with AutoAdapt.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(3)

0read text.txt
call vimtest#SaveOut()
call vimtap#Is(AutoAdapt#Info#Status(), '', 'global off, local off')
AutoAdapt
call vimtap#Is(AutoAdapt#Info#Status(), 'adapt', 'global off, local on')
write
call vimtap#Is(AutoAdapt#Info#Status(), 'adapted', 'after :AutoAdapt')

call vimtest#Quit()
