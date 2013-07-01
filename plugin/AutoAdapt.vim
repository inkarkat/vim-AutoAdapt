" AutoAdapt.vim: Automatically adapt timestamps, copyright notices, etc.
"
" DEPENDENCIES:
"   - AutoAdapt.vim autoload script
"   - ingo/err.vim autoload script
"   - ingo/msg.vim autoload script
"   - ingo/plugin.vim autoload script
"
" Copyright: (C) 2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	01-Jul-2013	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_AutoAdapt') || (v:version < 700)
    finish
endif
let g:loaded_AutoAdapt = 1
let s:save_cpo = &cpo
set cpo&vim

"- configuration ---------------------------------------------------------------

let s:thisYear = strftime('%Y')
" Condense "Pacific Daylight Time" into "PDT".
let s:shortTimezone = substitute(strftime('%Z'), '\<\(\w\)\%(\w*\)\>\%(\W\+\|$\)', '\1', 'g')
if ! exists('g:AutoAdapt_Rules')
    let g:AutoAdapt_Rules = [
    \   {
    \       'pattern': '\c\<Copyright:\?\s\+\%((C)\|&copy\|\xa9\)\?\s\+\zs\(\%(' . s:thisYear . '\)\@!\d\{4}\)\%(\ze\k\@![^-]\|\(-\%(' . s:thisYear . '\)\@!\d\{4}\)\>\)',
    \       'replacement': '\1-' . s:thisYear
    \   },
    \   {
    \       'pattern': '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)\zs\a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} [AP]M \u+',
    \       'replacement': '\=strftime("%a %d %b %Y %I:%M:%S %p ") . ' . string(s:shortTimezone)
    \   },
    \   {
    \       'pattern': '\v\C%(<%(Last %([cC]hanged?|modified)|Modified)\s*:\s+)\zs\a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} %([AP]M)@!\u+',
    \       'replacement': '\=strftime("%a %d %b %Y %H:%M:%S ") . ' . string(s:shortTimezone)
    \   },
    \]
endif


"- autocmds --------------------------------------------------------------------

augroup AutoAdapt
    autocmd! BufWritePre,FileWritePre * if ! AutoAdapt#Trigger(ingo#plugin#setting#GetBufferLocal('AutoAdapt_Rules')) | call ingo#msg#ErrorMsg(ingo#err#Get()) | endif
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
