" Highlight bottle.py SimpleTemplate markup in html and markdown
" Disable current syntax temporarily.
let s:saved_syntax = b:current_syntax
unlet! b:current_syntax

" Load Python syntax.
syntax include @PYTHON syntax/python.vim

" Restore original syntax.
let b:current_syntax = s:saved_syntax
unlet! s:saved_syntax

" Set Python inside double braces
syntax region STPython start="{{"ms=s+2 end="}}"me=s-1 contains=@PYTHON containedin=ALL
" Inside template blocks
syntax region STPython start="<%"ms=s+2 end="%>"me=s-1 contains=@PYTHON containedin=ALL contained keepend
" On lines beginning with %
syntax region STPython start="^\s*%[^>]" end="$" contains=@PYTHON containedin=ALL
" Add the end keyword
syntax keyword pythonConditional contained end
