if &t_Co == 256
	colo distinguished
endif

if ! has('gui_running')
	" Instantly leave insert mode when pressing <Esc> {{{
		set ttimeoutlen=10
		augroup FastEscape
			autocmd!

			au InsertEnter * set timeoutlen=0
			au InsertLeave * set timeoutlen=1000
		augroup END
	" }}}
	" Change cursor color in insert mode {{{
		if $TMUX != ''
			" tmux
			let &t_SI = 'Ptmux;]12;#89b6e2\'
			let &t_EI = 'Ptmux;]12;#dd4010\'
		elseif &term == 'rxvt-256color'
			" urxvt
			let &t_SI = ']12;#89b6e2'
			let &t_EI = ']12;#dd4010'
		endif
	" }}}
	" Use custom fillchars/listchars/showbreak icons {{{
		set list
		set fillchars=vert:│,fold:┄,diff:╱
		set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
		set showbreak=↪
	" }}}
endif
