let mapleader = ','

" F key mappings {{{
	nnoremap <silent> <F2>  :set paste!<CR>
	nnoremap <silent> <F6>  :set number!<CR>
	nnoremap <silent> <F7>  :TagbarToggle<CR>
	nnoremap <silent> <F8>  :GundoToggle<CR>
	nnoremap <silent> <F9>  :CtrlPBuffer<CR>
	nnoremap <silent> <F10> :CtrlP<CR>
	nnoremap <silent> <F11> :CtrlPCurFile<CR>
	nnoremap <silent> <F12> :NERDTreeToggle<CR>
" }}}
" Tabularize mappings {{{
	vnoremap <silent> <Leader>a=  :Tabularize /=/l0l1<CR>
	vnoremap <silent> <Leader>a,  :Tabularize /,/l0l1<CR>
	vnoremap <silent> <Leader>a:  :Tabularize /:/l0l1<CR>
" }}}
" Buffer mappings {{{
	nnoremap <silent> <Leader>d :bd<CR>
" }}}
" Quick edit .vimrc {{{
	nnoremap <silent> <Leader>ev :edit   $MYVIMRC<CR>
	nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
" }}}
" Enter command mode quickly {{{
	nnoremap ; :
" }}}
" Clear search highlighting {{{
	nnoremap <silent> <Leader>/ :nohlsearch<CR>
" }}}
" Sudo write {{{
	command! -bar -nargs=0 W silent! exec "write !sudo tee % >/dev/null" | silent! edit!
" }}}
" Fix broken vim regexes when searching {{{
	" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
	function! VerymagicSearchCommand()
		" Checks if we already specified that we're using very magic regexps
		" in the search command
		if match(getcmdline(), '\\v') == -1
			return 's/\v'
		endif

		return 's/'
	endfunction
	nnoremap / /\v
	vnoremap / /\v
	cnoremap s/ <C-R>=VerymagicSearchCommand()<CR>
" }}}
" Split window mappings {{{
	nnoremap K <C-w>k
	nnoremap J <C-w>j
	nnoremap H <C-w>h
	nnoremap L <C-w>l

	nnoremap <C-k> <C-w>s
	nnoremap <C-j> <C-w>sJ
	nnoremap <C-h> <C-w>v
	nnoremap <C-l> <C-w>vL
" }}}
" Re-indent pasted text {{{
	nnoremap <Leader>p p'[v']=
	nnoremap <Leader>P P'[v']=
" }}}
" Repurpose arrow keys to move lines {{{
	" Inspired by http://jeetworks.com/node/89
	function! s:MoveLineUp()
		call <SID>MoveLineOrVisualUp(".", "")
	endfunction

	function! s:MoveLineDown()
		call <SID>MoveLineOrVisualDown(".", "")
	endfunction

	function! s:MoveVisualUp()
		call <SID>MoveLineOrVisualUp("'<", "'<,'>")
		normal gv
	endfunction

	function! s:MoveVisualDown()
		call <SID>MoveLineOrVisualDown("'>", "'<,'>")
		normal gv
	endfunction

	function! s:MoveLineOrVisualUp(line_getter, range)
		let l_num = line(a:line_getter)
		if l_num - v:count1 - 1 < 0
			let move_arg = "0"
		else
			let move_arg = a:line_getter." -".(v:count1 + 1)
		endif
		call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
	endfunction

	function! s:MoveLineOrVisualDown(line_getter, range)
		let l_num = line(a:line_getter)
		if l_num + v:count1 > line("$")
			let move_arg = "$"
		else
			let move_arg = a:line_getter." +".v:count1
		endif
		call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
	endfunction

	function! s:MoveLineOrVisualUpOrDown(move_arg)
		let col_num = virtcol(".")
		execute "silent! ".a:move_arg
		execute "normal! ".col_num."|"
	endfunction

	" Arrow key remapping:
	" Up/Dn = move line up/dn
	" Left/Right = indent/unindent

	" Normal mode
	nnoremap <silent> <Left>   <<
	nnoremap <silent> <Right>  >>
	nnoremap <silent> <Up>     <Esc>:call <SID>MoveLineUp()<CR>
	nnoremap <silent> <Down>   <Esc>:call <SID>MoveLineDown()<CR>

	" Visual mode
	vnoremap <silent> <Left>   <gv
	vnoremap <silent> <Right>  >gv
	vnoremap <silent> <Up>     <Esc>:call <SID>MoveVisualUp()<CR>
	vnoremap <silent> <Down>   <Esc>:call <SID>MoveVisualDown()<CR>

	" Insert mode
	inoremap <silent> <Left>   <C-D>
	inoremap <silent> <Right>  <C-T>
	inoremap <silent> <Up>     <C-O>:call <SID>MoveLineUp()<CR>
	inoremap <silent> <Down>   <C-O>:call <SID>MoveLineDown()<CR>
" }}}
