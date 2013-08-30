"let g:syntastic_enable_signs = 0
let g:syntastic_mode_map = {
	\ 'mode': 'active'
	\ }

let g:syntastic_javascript_jshint_conf = '~/sync/dotfiles/.jshintrc'

" Configure flake8 syntax checker
"
" I'm using tabs for indentation and spaces for alignment in Python code, and
" I'd like flake8 to not warn me about that (even though it "violates" PEP-8).
"
" W191: Tabs for indentation
" E501: Too long line
let g:syntastic_python_flake8_args = '--ignore=W191,E501,E121,E122,E123,E126,E128'
