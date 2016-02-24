" Test that the variable is set after adapting.

source helpers/modelinerules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist')
call vimtest#SaveOut()
call vimtap#Ok(exists('b:AutoAdapt'), 'variable exists after adapting')
call vimtap#Is(b:AutoAdapt, 1, 'variable is 1 after adapting')

call vimtest#Quit()
