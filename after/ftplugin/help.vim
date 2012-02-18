nnoremap <buffer> q :bd<CR>

function! s:SetupHelpWindow()
	wincmd L
	vertical resize 80

	nnoremap <buffer> <Space> <C-]> " Space selects subject
	nnoremap <buffer> <BS>    <C-T> " Backspace to go back
endfunction

setl nonumber
setl winfixwidth
setl colorcolumn=
setl textwidth=78
setl tabstop=4
setl expandtab
setl formatoptions=tcroqwanl1

au BufEnter,BufWinEnter <buffer> call <SID>SetupHelpWindow()
