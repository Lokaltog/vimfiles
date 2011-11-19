" EasyMotion settings {{{
	let g:EasyMotion_keys = ";,.pyfgcrl/aoeuidhtns-'qjkxbmwvz"
	let g:EasyMotion_leader_key = '<Leader>'
" }}}
" Gundo settings {{{
	let g:gundo_right = 1
	let g:gundo_width = 50
" }}}
" NERD tree settings {{{
	let g:NERDTreeChristmasTree = 1
	let g:NERDTreeCaseSensitiveSort = 1
	let g:NERDTreeQuitOnOpen = 1
	let g:NERDTreeWinPos = 'right'
	let g:NERDTreeWinSize = 50
	let g:NERDTreeShowBookmarks = 1
	let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '\.sock$']
" }}}
" PHP highlighting settings {{{
	let g:php_folding = 0
	let g:php_html_in_strings = 1
	let g:php_parent_error_close = 1
	let g:php_parent_error_open = 1
	let g:php_no_shorttags = 1
" }}}
" Python settings {{{
	let g:python_highlight_all = 1
	let g:python_show_sync = 1
	let g:python_print_as_function = 1

	let g:pyindent_open_paren = '&sw'
	let g:pyindent_continue = '&sw'
" }}}
" Sparkup settings {{{
	let g:sparkupExecuteMapping = '<C-E>'
	let g:sparkupNextMapping = '<C-U>'
" }}}
" Syntastic settings {{{
	let g:syntastic_enable_signs = 1
	let g:syntastic_auto_loc_list = 0

	" Disable some syntax checkers
	let loaded_c_syntax_checker = 1
	let loaded_javascript_syntax_checker = 1
" }}}
" Tagbar settings {{{
	let g:tagbar_width = 50
	let g:tagbar_autoclose = 1
	let g:tagbar_autofocus = 1
	let g:tagbar_compact = 1
" }}}
" UltiSnips settings {{{
	let g:UltiSnipsExpandTrigger = '<Tab>'
	let g:UltiSnipsListSnippets = '<S-Tab>'
	let g:UltiSnipsJumpForwardTrigger = '<C-l>'
	let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
" }}}
" Powerline settings {{{
	" Set g:has_cfi - this is necessary for Powerline to recognize that cfi is available
	let g:has_cfi = 1
	let g:Powerline_dividers = 'default'
" }}}
