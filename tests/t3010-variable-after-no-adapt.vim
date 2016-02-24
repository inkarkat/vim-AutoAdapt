" Test that the variable is not set when no adapting took place.

source helpers/modelinerules.vim
0read text.txt
%s/Copy/Nope/gi

call vimtest#StartTap()
call vimtap#Plan(2)
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist')
call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist after write')

call vimtest#Quit()
