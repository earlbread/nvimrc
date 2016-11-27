"No compatibility to traditional vi
set nocompatible

"True colors
if $TERM_PROGRAM == "iTerm.app"
  set termguicolors
endif

"vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------

"For html5 syntax
Plug 'othree/html5.vim'

"End plugin list --------------------------------------------------------------
call plug#end()

"Syntax highlighting.
syntax on

"Set line number
set nu

"Set Incremental searching and command
set incsearch
set inccommand=split

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent nosmartindent

"set tab characters apart
set listchars=tab:↹\

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Detect modeline hints.
set modeline

"Disable bell
set visualbell t_vb=

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"More tabs
set tabpagemax=25

filetype plugin on

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less

"These languages have their own tab/indent settings.
au FileType cpp    setl ts=2 sw=2 sts=2
au FileType ruby   setl ts=2 sw=2 sts=2
au FileType yaml   setl ts=2 sw=2 sts=2
au FileType html   setl ts=2 sw=2 sts=2
au FileType jinja  setl ts=2 sw=2 sts=2
au FileType lua    setl ts=2 sw=2 sts=2
au FileType haml   setl ts=2 sw=2 sts=2
au FileType sass   setl ts=2 sw=2 sts=2
au FileType scss   setl ts=2 sw=2 sts=2
au FileType make   setl ts=4 sw=4 sts=4 noet
au FileType gitcommit setl spell

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"Keep 80 columns.
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd WinEnter * match OverLength /\%81v.\+/

"I dislike folding.
set nofoldenable

"I dislike visual bell as well.
set novisualbell

"Alias :W to :w
cnoreabbrev W w
