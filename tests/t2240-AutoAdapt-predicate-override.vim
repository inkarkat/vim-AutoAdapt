" Test overriding a predicate with AutoAdapt.

source helpers/modelinerules.vim
let g:AutoAdapt_Predicate = function('OffPredicate')

call vimtest#StartTap()
call vimtap#Plan(3)

0read text.txt
call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'adaptation disabled by predicate')

AutoAdapt
write
call vimtap#Ok(! exists('b:AutoAdapt'), 'adaptation still disabled after :AutoAdapt')

AutoAdapt!
write
call vimtap#Is(b:AutoAdapt, 1, 'buffer is adapted after :AutoAdapt')

call vimtest#Quit()
