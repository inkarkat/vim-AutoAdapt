" Test skipping rule with pattern Funcref throwing.

function! MyFunc( rule )
    throw 'AutoAdaptSkip'
endfunction
let g:AutoAdapt_Rules = [
\   {
\       'patternexpr': function('MyFunc'),
\       'replacement': '9999',
\       'range': '%'
\   }
\]
0read text.txt
call vimtest#StartTap()
call vimtap#Plan(3)

let v:errmsg = ''
call vimtest#SaveOut()
call vimtap#Ok(! has_key(g:AutoAdapt_Rules[0], 'pattern'), 'application did not create pattern attribute in rule')
call vimtap#Ok(! exists('b:AutoAdapt'), 'variable does not exist after write')
call vimtap#Is(v:errmsg, '', 'no error raised')

call vimtest#Quit()
