" Test adapting with multiple rules.

source helpers/foorules.vim
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
