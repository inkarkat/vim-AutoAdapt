" Test that the variable is reset after an additional write.

source helpers/modelinerules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(4)
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist')
call vimtest#SaveOut()
call vimtap#Ok(exists('b:AutoAdapt'), 'variable exists after adapting')
call vimtap#Is(b:AutoAdapt, 1, 'variable is 1 after adapting')
write
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist after next write')

call vimtest#Quit()
