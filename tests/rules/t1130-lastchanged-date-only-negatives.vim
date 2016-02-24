" Test non-matching Last Changed with date-only formats.

call setline(1, 'Last Changed: ' . strftime('%Y-%b-%d'))
call setline(2, 'Last Changed: ' . strftime('%Y %B %d'))
call setline(3, 'Last Changed: ' . strftime('%Y/%m/%d'))
call setline(4, 'Last Changed: ' . strftime('%d %b %Y'))
call setline(5, 'Last Changed: ' . strftime('%b %d, %Y'))
let s:orig1 = getline(1)
let s:orig2 = getline(2)
let s:orig3 = getline(3)
let s:orig4 = getline(4)
let s:orig5 = getline(5)

setlocal nomodified
doautocmd BufWritePre
call vimtest#StartTap()
call vimtap#Plan(6)

call vimtap#Is(&l:modified, 0, 'buffer not modified')
call vimtap#Is(getline(1), s:orig1, 'line 1')
call vimtap#Is(getline(2), s:orig2, 'line 2')
call vimtap#Is(getline(3), s:orig3, 'line 3')
call vimtap#Is(getline(4), s:orig4, 'line 4')
call vimtap#Is(getline(5), s:orig5, 'line 5')

call vimtest#Quit()
