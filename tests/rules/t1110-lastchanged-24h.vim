" Test Last Changed with date in 24h format.

insert
" Last Change  : Wed 25 Mar 2009 13:28:34 PDT
/* Last changed: Fri 6 Feb 2004 02:46:27 CST */
# Modified:	 Wed 25 Mar 2009 15:28:34 PDT #
" LastChange:	Tue Apr 27 13:05:59 CEST 2004
" Last Change:	Sam, 07 Sep 2002 17:20:46 CEST
.

let s:orig1 = getline(1)
let s:orig2 = getline(2)
let s:orig3 = getline(3)
let s:orig4 = getline(4)
let s:orig5 = getline(5)
call vimtest#SaveOut()
call vimtest#StartTap()
call vimtap#Plan(10)

call vimtap#Isnt(getline(1), s:orig1, 'line 1 changed')
call vimtap#Like(getline(1), '\v^" Last Change  : \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} \a+$', 'line 1')
call vimtap#Isnt(getline(2), s:orig2, 'line 2 changed')
call vimtap#Like(getline(2), '\v^/\* Last changed: \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} \a+ \*/$', 'line 2')
call vimtap#Isnt(getline(3), s:orig3, 'line 3 changed')
call vimtap#Like(getline(3), '\v^# Modified:\t \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} \a+ #$', 'line 3')
call vimtap#Isnt(getline(4), s:orig4, 'line 4 changed')
call vimtap#Like(getline(4), '\v^" LastChange:\t\a{3} \a{3} \d{2} \d{2}:\d{2}:\d{2} \a+ \d{4}$', 'line 4')
call vimtap#Isnt(getline(5), s:orig5, 'line 5 changed')
call vimtap#Like(getline(5), '\v^" Last Change:\t\a{3}, \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} \a+$', 'line 5')

call vimtest#Quit()
