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
  return 0
endfunction
