" Test Last Changed with date-only formats.

insert
" Last Change  : 2009 Mar 25
" Last Changed : 2006-04-19
/* Last changed: 6 Feb 2004 */
# Modified:	 Mar 25, 2009 #
Modified: April 25, 2001
(LastChange: 2002 November 17)
(LastChange: 17 November 2002)
Last modified: 2006/04/19
.

let s:orig1 = getline(1)
let s:orig2 = getline(2)
let s:orig3 = getline(3)
let s:orig4 = getline(4)
let s:orig5 = getline(5)
let s:orig6 = getline(6)
let s:orig7 = getline(7)
let s:orig8 = getline(8)
call vimtest#SaveOut()
call vimtest#StartTap()
call vimtap#Plan(16)

call vimtap#Isnt(getline(1), s:orig1, 'line 1 changed')
call vimtap#Like(getline(1), '\v^" Last Change  : \d{4} \a{3} \d{2}$', 'line 1')
call vimtap#Isnt(getline(2), s:orig2, 'line 2 changed')
call vimtap#Like(getline(2), '\v^" Last Changed : \d{4}-\d{2}-\d{2}$', 'line 2')
call vimtap#Isnt(getline(3), s:orig3, 'line 3 changed')
call vimtap#Like(getline(3), '\v^/\* Last changed: \d{2} \a{3} \d{4} \*/$', 'line 2')
call vimtap#Isnt(getline(4), s:orig4, 'line 4 changed')
call vimtap#Like(getline(4), '\v^# Modified:\t \a{3} \d{2}, \d{4} #$', 'line 4')
call vimtap#Isnt(getline(5), s:orig5, 'line 5 changed')
call vimtap#Like(getline(5), '\v^Modified: (May|\a{4,9}) \d{2}, \d{4}$', 'line 5')
call vimtap#Isnt(getline(6), s:orig6, 'line 6 changed')
call vimtap#Like(getline(6), '\v^\(LastChange: \d{4} (May|\a{4,9}) \d{2}\)$', 'line 6')
call vimtap#Isnt(getline(7), s:orig7, 'line 7 changed')
call vimtap#Like(getline(7), '\v^\(LastChange: \d{2} (May|\a{4,9}) \d{4}\)$', 'line 7')
call vimtap#Isnt(getline(8), s:orig8, 'line 8 changed')
call vimtap#Like(getline(8), '\v^Last modified: \d{4}/\d{2}/\d{2}$', 'line 8')

call vimtest#Quit()
