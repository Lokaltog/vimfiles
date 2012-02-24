" PHP tags highlighting
syn region phpRegion matchgroup=phpDelimiter start="<?\(php\)\=" end="?>" contains=@phpClTop keepend

" Dim semicolons
syn match phpEOL ";\+$" contained containedin=phpRegion

" Dim string delimiters
syn region phpStringDouble matchgroup=phpStringDelim start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex contained keepend
syn region phpBacktick matchgroup=phpStringDelim start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex contained keepend
syn region phpStringSingle matchgroup=phpStringDelim start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@phpAddStrings contained keepend

if !exists("php_ignore_phpdoc")
	syn case ignore

	syn match phpCommentStar contained "^\s*\*[^/]"me=e-1
	syn match phpCommentStar contained "^\s*\*$"

	syn region phpDocComment   start="/\*\*" end="\*/" keepend contains=phpCommentTitle,phpDocTags,phpTodo
	syn region phpCommentTitle contained matchgroup=phpDocComment start="/\*\*" matchgroup=phpCommmentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=phpCommentStar,phpTodo,phpDocTags containedin=phpComment

	syn region phpDocTags  start="{@\(example\|id\|internal\|inheritdoc\|link\|source\|toc\|tutorial\)" end="}" containedin=phpComment
	syn match  phpDocTags  "@\(abstract\|access\|author\|category\|copyright\|deprecated\|example\|final\|global\|ignore\|internal\|license\|link\|method\|name\|package\|param\|property\|return\|see\|since\|static\|staticvar\|subpackage\|todo\|tutorial\|uses\|var\|version\)\s\+\S\+" contains=phpDocParam containedin=phpComment
	syn match  phpDocParam contained "\(\s\S\+\)\+"
	syn match  phpDocTags  "@\(filesource\|static\)" containedin=phpComment

	syn case match

	hi def link phpCommentTitle SpecialComment
	hi def link phpDocComment   Comment
	hi def link phpDocTags      Special
	hi def link phpDocParam     Function
	hi def link phpCommentStar  Comment
endif

" PHP FoldText function {{{
	function! FoldText_PHP()
		" This function uses code from phpfolding.vim
		let l:curline = v:foldstart
		let l:line = getline(l:curline)
		" Did we fold a DocBlock? {{{
			if strridx(l:line, '#@+') != -1
				if (matchstr(l:line, '^.*#@+..*$') == l:line)
					let l:line = substitute(l:line, '^.*#@+', '', 'g') . ' ' . g:phpDocBlockIncludedPostfix
				else
					let l:line = getline(l:curline + 1) . ' ' . g:phpDocBlockIncludedPostfix
				endif
		" }}}
		" Did we fold an API comment block? {{{
			elseif strridx(l:line, "\/\*\*") != -1
				let s:state = 0

				while l:curline < v:foldend
					let l:loopline = getline(l:curline)

					if s:state == 0 && strridx(l:loopline, "\*\/") != -1
						let s:state = 1
					elseif s:state == 1 && (matchstr(l:loopline, '^\s*$') != l:loopline)
						break
					endif

					let l:curline = l:curline + 1
				endwhile

				let l:line = getline(l:curline)
			endif
		" }}}
		" Cleanup {{{
			let l:line = substitute(l:line, '/\*\|\*/\d\=', '', 'g')
			let l:line = substitute(l:line, '^\s*\*\?\s*', '', 'g')
			let l:line = substitute(l:line, '{$', '', 'g')
			let l:line = substitute(l:line, '($', '(...)', 'g')
		" }}}
		" Append postfix if there is PhpDoc in the fold {{{
			if l:curline != v:foldstart
				let l:line = l:line . " " . g:phpDocIncludedPostfix . " "
			endif
		" }}}
		return FoldText(l:line)
	endfunction
" }}}
" Enable PHP FoldText function {{{
	let g:DisableAutoPHPFolding = 1

	au FileType php EnableFastPHPFolds
	au FileType php set foldtext=FoldText() | setl foldtext=FoldText_PHP()
" }}}
