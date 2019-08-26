" Vim indent file
" Language: Elm
" Maintainer: Daniel Taskoff <daniel.taskoff@gmail.com>
" Last Change: 2019 Aug 26

" quit when an indent file has been already loaded
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
setlocal indentexpr=GetElmIndent()
setlocal nolisp
setlocal nosmartindent

if exists("*GetElmIndent")
  finish
endif

function! GetElmIndent()
  let lnum = v:lnum - 1

	if lnum == 0
    return 0
  endif
  
  let ind = indent(lnum)
  let lline = getline(lnum)
  let line = getline(v:lnum)
  
  " indent bodies of functions
  if lline =~# '=$'
    return ind + shiftwidth()
  endif
  
  return ind
endfunction
