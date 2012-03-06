let g:syntastic_enable_signs = 0
let g:syntastic_mode_map = {
	\ 'mode': 'active',
	\ 'passive_filetypes': ['c', 'javascript'],
	\ }

" Configure flake8 syntax checker
"
" I'm using tabs for indentation and spaces for alignment in Python code, and
" I'd like flake8 to not warn me about that (even though it "violates" PEP-8).
let g:syntastic_python_checker_args = '--ignore=W191'
