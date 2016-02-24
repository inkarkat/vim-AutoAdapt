" Test forced manual trigger when the predicate disallows it.

source helpers/modelinerules.vim
let g:AutoAdapt_Predicate = function('OffPredicate')
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(2)
echomsg 'Manual :Adapt!'
Adapt!
call vimtap#Is(b:AutoAdapt, 1, 'adapted by one rule')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no further adaptation on write')

call vimtest#Quit()
