" Test manual trigger of a multiple rules.

source helpers/foorules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(2)
echomsg 'Manual :Adapt'
Adapt
call vimtap#Is(b:AutoAdapt, 3, 'adapted by three rules')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no further adaptation on write')

call vimtest#Quit()
