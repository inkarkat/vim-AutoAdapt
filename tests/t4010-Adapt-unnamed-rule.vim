" Test manual trigger of a single anonymous rule.

source helpers/modelinerules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(2)
echomsg 'Manual :Adapt'
Adapt
call vimtap#Is(b:AutoAdapt, 1, 'adapted by one rule')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no further adaptation on write')

call vimtest#Quit()
