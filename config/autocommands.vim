augroup Formatting " {{{
	autocmd!
	" Format plain text and e-mails correctly {{{
		au FileType mail,text,tex setl formatoptions+=t formatoptions-=l textwidth=72 colorcolumn=72
	" }}}
	" Use foldmarkers for specific filetypes {{{
		au FileType sass,javascript,psql,vim setl foldmethod=marker foldlevel=0
	" }}}
augroup END" }}}
augroup Whitespace " {{{
	autocmd!
	" Remove trailing whitespace from selected filetypes {{{
		function! s:StripTrailingWhitespace()
			normal! mZgg0
			while search('\v\s+$', 'W') > 0
				if synIDattr(synID(line('.'), col('.') - 1, 1), 'name') !~? '\v(comment|doc)'
					silent s/\v\s+$//e
					undojoin
				endif
			endwhile
			normal! `Z
		endfunction

		au FileType html,mako,stylus,javascript,python,psql,vim au BufWritePre <buffer> :silent! call s:StripTrailingWhitespace()
	" }}}
augroup END " }}}
