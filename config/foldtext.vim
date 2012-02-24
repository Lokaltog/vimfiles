" Universal FoldText function {{{
	function! FoldText(...)
		" This function uses code from doy's vim-foldtext: https://github.com/doy/vim-foldtext
		" Prepare fold variables {{{
			" Use function argument as line text if provided
			let l:line = a:0 > 0 ? a:1 : getline(v:foldstart)

			let l:line_count = v:foldend - v:foldstart + 1
			let l:indent = repeat(' ', indent(v:foldstart))

			let l:w_win = winwidth(0)
			let l:w_num = getwinvar(0, '&number') * getwinvar(0, '&numberwidth')
			let l:w_fold = getwinvar(0, '&foldcolumn')
		" }}}
		" Handle diff foldmethod {{{
			if &fdm == 'diff'
				let l:text = printf('┤ %s matching lines ├', l:line_count)

				" Center-align the foldtext
				return repeat('┄', (l:w_win - strchars(l:text) - l:w_num - l:w_fold) / 2) . l:text
			endif
		" }}}
		" Handle other foldmethods {{{
			let l:text = l:line
			" Remove foldmarkers {{{
				let l:foldmarkers = split(&foldmarker, ',')
				let l:text = substitute(l:text, '\V' . l:foldmarkers[0] . '\%(\d\+\)\?\s\*', '', '')
			" }}}
			" Remove comments {{{
				let l:comment = split(&commentstring, '%s')

				if l:comment[0] != ''
					let l:comment_begin = l:comment[0]
					let l:comment_end = ''

					if len(l:comment) > 1
						let l:comment_end = l:comment[1]
					endif

					let l:pattern = '\V' . l:comment_begin . '\s\*' . l:comment_end . '\s\*\$'

					if l:text =~ l:pattern
						let l:text = substitute(l:text, l:pattern, ' ', '')
					else
						let l:text = substitute(l:text, '.*\V' . l:comment_begin, ' ', '')

						if l:comment_end != ''
							let l:text = substitute(l:text, '\V' . l:comment_end, ' ', '')
						endif
					endif
				endif
			" }}}
			" Remove preceding non-word characters {{{
				let l:text = substitute(l:text, '^\W*', '', '')
			" }}}
			" Remove surrounding whitespace {{{
				let l:text = substitute(l:text, '^\s*\(.\{-}\)\s*$', '\1', '')
			" }}}
			" Make unmatched block delimiters prettier {{{
				let l:text = substitute(l:text, '([^)]*$',   '⟯ ⋯ ⟮', '')
				let l:text = substitute(l:text, '{[^}]*$',   '⟯ ⋯ ⟮', '')
				let l:text = substitute(l:text, '\[[^\]]*$', '⟯ ⋯ ⟮', '')
			" }}}
			" Add arrows when indent level > 2 spaces {{{
				if indent(v:foldstart) > 2
					let l:cline = substitute(l:line, '^\s*\(.\{-}\)\s*$', '\1', '')
					let l:clen = strlen(matchstr(l:cline, '^\W*'))

					let l:indent = repeat(' ', indent(v:foldstart) - 2)
					let l:text = '▸ ' . l:text
				endif
			" }}}
			" Prepare fold text {{{
				let l:fnum = printf('┤ %s ⭡ ', printf('%4s', l:line_count))
				let l:ftext = printf('%s%s ', l:indent, l:text)
			" }}}
			return l:ftext . repeat('┄', l:w_win - strchars(l:fnum) - strchars(l:ftext) - l:w_num - l:w_fold) . l:fnum
		" }}}
	endfunction
" }}}
