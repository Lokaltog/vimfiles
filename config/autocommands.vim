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
			normal mZ

			%s/\s\+$//e

			normal `Z
		endfunction

		au FileType html,css,sass,stylus,javascript,coffee,php,python,ruby,psql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()
	" }}}
augroup END " }}}
