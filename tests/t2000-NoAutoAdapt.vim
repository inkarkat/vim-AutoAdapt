" Test turning off the rules with NoAutoAdapt.

source helpers/modelinerules.vim
0read text.txt
NoAutoAdapt

call vimtest#SaveOut()
call vimtest#Quit()
