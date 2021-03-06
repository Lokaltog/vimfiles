" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source: http://git.io/LS

" Load Unbundle {{{
	runtime bundle/unbundle/unbundle.vim
" }}}
" Source viminit files {{{
	runtime! config/**/*.vim
	set rtp+=~/powerline/powerline/bindings/vim
" }}}
" Basic configuration {{{
	filetype plugin indent on
	syntax on

	set backspace=indent,eol,start
	set nobackup
	set clipboard=unnamed,unnamedplus,autoselect
	set colorcolumn+=76
	set nocompatible
	set completeopt=menu,menuone
	set conceallevel=2
	set confirm
	set diffopt+=context:3
	set encoding=utf-8
	set noerrorbells visualbell t_vb= " Disable all bells
	set formatoptions=tcrqwnl1
	set hidden
	set history=1000
	set hlsearch
	set ignorecase
	set incsearch
	set laststatus=2
	set linebreak
	set nomodeline
	set mouse=nvr
	set nonumber
	set numberwidth=4
	set pumheight=10
	set report=0
	set scrolljump=10
	set scrolloff=10
	set shell=/bin/sh " syntastic fix
	set shortmess=atToOI
	set noshowmode
	set smartcase
	set smartindent
	set nostartofline
	set noswapfile
	set switchbuf=useopen,usetab
	set termencoding=utf-8
	set undodir=~/.vim/tmp
	set undofile
	set undolevels=1000
	set updatetime=1500
	set virtualedit=block
	set nowrap
	set nowritebackup
	" Set tab width {{{
		let g:tabwidth = 4

		exec 'set shiftwidth='  . g:tabwidth
		exec 'set softtabstop=' . g:tabwidth
		exec 'set tabstop='     . g:tabwidth
	" }}}
	" Folding settings {{{
		set foldcolumn=0
		set foldenable
		set foldlevel=0
		set foldmethod=marker
		set foldtext=FoldText()
	" }}}
	" Wild menu {{{
		set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/.tox/*,*.egg-info/*,*/node_modules/*
		set wildmenu
		set wildmode=list:longest,full
	" }}}
" }}}
