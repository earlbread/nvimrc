"No compatibility to traditional vi
set nocompatible

"True colors
set termguicolors

"vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------

"For color scheme
Plug 'junegunn/seoul256.vim'

"For syntax
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
Plug 'keith/swift.vim'
Plug 'spoqa/nirum.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Trailing Whitespace
Plug 'ntpeters/vim-better-whitespace'

"Quantify my vim usage
Plug 'wakatime/vim-wakatime'

"Alignment Plugin
Plug 'junegunn/vim-easy-align'

"FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Git commit message
Plug 'rhysd/committia.vim'

"Switch English IME whenever vim switchs to normal mode.
Plug 'simnalamburt/vim-tiny-ime', { 'do' : './build' }

"Surround
Plug 'tpope/vim-surround'

"EditorConfig
Plug 'editorconfig/editorconfig-vim'

"End plugin list --------------------------------------------------------------
call plug#end()

"Syntax highlighting.
syntax on

"Use mouse
set mouse=a

"Set line number
set nu

"Use system clipboard
set clipboard^=unnamed,unnamedplus

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

"Ignore modeline hints.
set nomodeline

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
au! BufRead,BufNewFile *.html,*.htm,*.shtml,*.stm set ft=jinja

"These languages have their own tab/indent settings.
au FileType go           setl ts=8 sw=8 sts=0
au FileType cpp          setl ts=2 sw=2 sts=2
au FileType ruby         setl ts=2 sw=2 sts=2
au FileType yaml         setl ts=2 sw=2 sts=2
au FileType html         setl ts=2 sw=2 sts=2
au FileType jinja        setl ts=2 sw=2 sts=2
au FileType lua          setl ts=2 sw=2 sts=2
au FileType haml         setl ts=2 sw=2 sts=2
au FileType sass         setl ts=2 sw=2 sts=2
au FileType scss         setl ts=2 sw=2 sts=2
au FileType javascript   setl ts=2 sw=2 sts=2
au FileType json         setl ts=2 sw=2 sts=2
au FileType make         setl ts=4 sw=4 sts=4 noet
au FileType gitcommit    setl spell textwidth=72

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

"Use seoul256 color scheme
colo seoul256

"Use vim-easy-align
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

"Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"JSX in .js
let g:jsx_ext_required = 0

"Elm format
let g:elm_format_autosave = 1

"Press backspace in visual mode to delete without copy
vnoremap <backspace> "_d
