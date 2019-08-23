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

" Operators
syn match elmOperator "\\\|->\|++\|::\|<<\|>>\|<|\||>\|&&\|||\||.\||=\|==\|/=\|<=\|>=\|<\|>\|+\|-\|*\|//\|/\|\^\|(\|)\|=\|\." contained

" Literals
syn match elmUnit "()" contained
syn keyword elmBoolean True False contained
syn match elmNumber "-\?\<\d\+\>" contained
syn match elmFloat "-\?\<\d\+\.\d\+\>" contained
syn match elmEscapeChar "\\[nrt\"'\\]" contained
syn match elmUnicodeChar "\\u{\(\(10\)\?\x\{4}\|\x\{5}\)}" contained
syn match elmChar "'\(\p\|\\[nrt\"'\\]\|\\u{\(\(10\)\?\x\{4}\|\x\{5}\)}\)'" contains=elmEscapeChar,elmUnicodeChar contained
syn region elmString start=+"+ end=+"+ skip=+\\"+ contains=elmEscapeChar,elmUnicodeChar contained
syn region elmMultiLineString start=+"""+ end=+"""+ contains=elmEscapeChar,elmUnicodeChar,elmString contained

" Lists

" Conditionals
syn keyword elmConditional if then else case of contained

" Records

" Functions
syn match elmTopLevelFunction "^\(\l\w*\)\s*:\(.*\n\)*\1" contains=elmFunctionName nextgroup=elmTopLevelFunctionBody
syn match elmTopLevelFunction "^\l\w*" contains=elmFunctionName nextgroup=elmTopLevelFunctionBody
syn region elmTopLevelFunctionBody start="=" end="^\S"me=s-1 contains=elmOperator,elmUnit,elmBoolean,elmNumber,elmFloat,elmEscapeChar,elmUnicodeChar,elmChar,elmString,elmMultiLineString,elmConditional,elmDelimiter,elmLetIn,elmType,elmModuleName
syn match elmDelimiter "[,[\]{}]" contained

syn match elmFunctionName "\<\l\w*\>" contained

" Let Expressions
syn keyword elmLetIn let in contained

" Modules
syn region elmModule start="module" end="^\S"me=s-1 contains=elmModuleName,elmExposing,elmPort,elmSingleLineComment,elmMultiLineComment
syn region elmImport start="^import" end="^\S"me=s-1 contains=elmModuleName,elmExposing,elmSingleLineComment,elmMultiLineComment

syn match elmModuleName "\<\(\u\w*.\)*\>" contained
syn region elmExposing start="(" end=")" contains=elmFunctionName,elmExposing,elmType contained

" Type Annotations
syn region elmTypeSignature start=":" end="^\S"me=s-1 contains=elmSingleLineComment,elmMultiLineComment,elmType,elmTypeVariable,elmTypeOperator,elmTypeArrow
syn match elmType "\<\(\u\w*.\)*\u\w*\.\@!\>" contained
syn match elmTypeVariable "\<\l\w*\>" contained
syn match elmTypeOperator ":" contained
syn match elmTypeArrow "->" contained

" Type Aliases
" Custom Types

" Ports
syn keyword elmPort port contained
syn region elmPortDefinition start="port" end="^\S"me=s-1 contains=elmPort,elmFunctionName,elmModule,elmTypeSignature


" Highlighting
hi def link elmSingleLineComment Comment
hi def link elmMultiLineComment Comment
hi def link elmDocComment Comment
hi def link elmDocTitle SpecialComment
hi def link elmDocList SpecialComment
hi def link elmDocLink SpecialComment
hi def link elmTodo Todo

hi def link elmOperator Operator

hi def link elmUnit Constant
hi def link elmBoolean Boolean
hi def link elmNumber Number
hi def link elmFloat Float
hi def link elmUnicodeChar SpecialChar
hi def link elmEscapeChar SpecialChar
hi def link elmChar Character
hi def link elmString String
hi def link elmMultiLineString String

hi def link elmConditional Conditional

hi def link elmDelimiter Delimiter
hi def link elmFunctionName Function

hi def link elmLetIn Keyword

hi def link elmModule Define
hi def link elmImport Include
hi def link elmModuleName Identifier

hi def link elmType Type
hi def link elmTypeVariable Type
hi def link elmTypeOperator Operator
hi def link elmTypeArrow Operator

hi def link elmPort Define

let b:current_syntax = "elm"
