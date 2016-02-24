" Test that AutoAdapt only enabled for the current buffer.

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(1)

0read text.txt
AutoAdapt

new
0read text.txt
call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'buffer is not adapted')

call vimtest#Quit()
