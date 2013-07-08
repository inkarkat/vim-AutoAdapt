" Test that the variable is set after adapting.

source helpers/modelinerules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#Is(exists('b:AutoAdapt'), 0, 'variable does not exist')
call vimtest#SaveOut()
call vimtap#Is(exists('b:AutoAdapt'), 1, 'variable exists after adapting')
call vimtap#Is(b:AutoAdapt, 1, 'variable is 1 after adapting')

call vimtest#Quit()
