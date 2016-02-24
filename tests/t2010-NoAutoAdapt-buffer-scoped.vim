" Test that NoAutoAdapt only disables for the current buffer.

source helpers/modelinerules.vim
0read text.txt
NoAutoAdapt

new
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
