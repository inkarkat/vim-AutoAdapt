" Test that the variable counts the number of rules.

source helpers/foorules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist')
call vimtest#SaveOut()
call vimtap#Ok(exists('b:AutoAdapt'), 'variable exists after adapting')
call vimtap#Is(b:AutoAdapt, 3, 'variable counts 3 applied rules after adapting')

call vimtest#Quit()
