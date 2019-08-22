" Vim syntax file
" Language: Elm
" Maintainer: Daniel Taskoff <daniel.taskoff@gmail.com>
" Last Change: 2019 Aug 22

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Comments
syn match elmSingleLineComment "--.*$" contains=elmTodo
syn region elmMultiLineComment start="{-|\@!" end="-}" contains=elmTodo,elmDocComment,elmMultiLineComment
syn region elmDocComment start="{-|" end="-}" contains=elmDocTitle,elmDocList,elmDocLink,elmTodo,elmMultiLineComment,elmDocComment
syn match elmDocTitle "^# .*$" contained
syn region elmDocList start="^@docs" end="^$" contained
syn match elmDocLink "<.\+>" contained
syn keyword elmTodo TODO FIXME XXX contained


" Literals
" Lists

" Conditionals
syn keyword elmConditional if then else case of

" Records

" Functions
syn match elmTopLevelFunction "^\(\l\w*\)\s*:\(.*\n\)*\1" contains=elmFunctionName
syn match elmTopLevelFunction "^\l\w*" contains=elmFunctionName
syn match elmFunctionName "\<\l\w*\>" contained

" Operators
" Let Expressions

" Modules
syn keyword elmModule module import as exposing

" Type Annotations
" Type Aliases
" Custom Types


" Highlighting
hi def link elmSingleLineComment Comment
hi def link elmMultiLineComment Comment
hi def link elmDocComment Comment
hi def link elmDocTitle SpecialComment
hi def link elmDocList SpecialComment
hi def link elmDocLink SpecialComment
hi def link elmTodo Todo
hi def link elmConditional Conditional
hi def link elmFunctionName Function
hi def link elmModule Include


let b:current_syntax = "elm"
