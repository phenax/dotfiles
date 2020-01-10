set nocompatible

let mapleader = "\\"
let maplocalleader = ","

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'lilydjwg/colorizer'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 500
nmap ghp <Plug>(GitGutterPreviewHunk)

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
" Plug 'LanguageTool'

" Generic Programming Support
" Plug 'jakedouglas/exuberant-ctags'
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'w0rp/ale'


" Typescript
Plug 'heavenshell/vim-tslint'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Plug 'Quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'djoshea/vim-autoread'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-eunuch'
Plug 'wesQ3/vim-windowswap'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'benmills/vimux'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'Shougo/neocomplete.vim'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'thaerkh/vim-workspace'
" Plug 'xolox/vim-session'
" Plug 'xolox/vim-misc'

" Org mode
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'


" Elm Support
" Plug 'lambdatoast/elm.vim'

" Theme / Interface
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'sjl/badwolf'
" Plug 'morhetz/gruvbox'
" Plug 'junegunn/limelight.vim'
Plug 'mkarmona/colorsbox'
" Plug 'romainl/Apprentice'
" Plug 'Lokaltog/vim-distinguished'
" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'daylerees/colour-schemes'
" Plug 'atelierbram/Base2Tone-vim'
" Plug 'joshdick/onedark.vim'
" Plug 'mhartington/oceanic-next'
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'jordwalke/vim-taste'

call plug#end()

set hidden
set encoding=UTF-8
set autoread
set mouse=a

" Linter config
let g:ale_enabled = 1
let b:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint']}
let g:ale_completion_tsserver_autoimport = 1
" let b:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:syntastic_enable_racket_racket_checker = 1
nmap <localleader>f :! echo "Fixing issues..." && npx eslint --fix %<CR>
"set omnifunc=ale#completion#OmniFunc
"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '⚠'


" FZF (Fuzzy search)
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let g:fzf_layout = { 'down': '~25%' }
if isdirectory(".git")
  " if in a git project, use :GFiles
  nmap <silent> <leader>f :GFiles --cached --others --exclude-standard<cr>
  " nmap <c-p> :GFiles --cached --others --exclude-standard<cr>
else
  " otherwise, use :FZF
  nmap <silent> <leader>f :FZF<cr>
  " nmap <c-p> :FZF<cr>
endif
nmap <c-f> :Ag<cr>


set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

set history=800
set undolevels=1000
set title
set visualbell
set noerrorbells
set backspace=indent,eol,start
set nobackup
set noswapfile

" Show linenumbers
set number
set relativenumber
set ruler

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

set laststatus=2

set cursorline

" generally use marker folds
set foldmethod=marker
set foldcolumn=2
" open folds when jumping to marks
set foldopen+=mark


" Theme and Styling
set t_Co=256
set background=dark

" Accidental key bindings
map q: <Nop>
nnoremap Q <nop>

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace

" let g:airline_theme='luna'
let g:airline_theme = "palenight"
" let g:airline_theme = "taste"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline_powerline_fonts = 1

set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
colorscheme palenight
" colorscheme taste

let g:gutentags_enabled = 1

" nmap <C-u> <Plug>(PromptJsFileImport)
nmap <C-u> <Plug>(JsFileImport)
nmap <C-i> <Plug>(JsGotoDefinition)

let g:NERDSpaceDelims = 1
let NERDTreeShowHidden = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" Open NERDTree in new tabs and windows if no command line args set
" autocmd VimEnter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * NERDTreeMirror

autocmd FileType nerdtree setlocal nolist

nmap ,n :NERDTreeFind<CR>
nmap <C-PageUp> :bp<CR>
nmap <C-PageDown> :bn<CR>
nmap <C-k> :BD<CR>

" Write automatically
" autocmd InsertLeave * write

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg . ' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#fd79a8')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#fd79a8')
call NERDTreeHighlightFile('ts', 'blue', 'none', '#29a4ff')
call NERDTreeHighlightFile('tsx', 'blue', 'none', '#29a4ff')
call NERDTreeHighlightFile('js', 'blue', 'none', '#29a4ff')
call NERDTreeHighlightFile('jsx', 'blue', 'none', '#29a4ff')
call NERDTreeHighlightFile('json', 'yellow', 'none', '#ffeaa7')
call NERDTreeHighlightFile('sh', 'green', 'none', '#55efc4')
call NERDTreeHighlightFile('zsh', 'green', 'none', '#55efc4')
" call NERDTreeHighlightFile('json', 'blue', 'none', '#81ecec')


" Kitty terminal color leak fix
if $TERM == "xterm-kitty"
  let &t_ut=''
  set termguicolors
            let &t_8f = "\e[38;2;%lu;%lu;%lum"
            let &t_8b = "\e[48;2;%lu;%lu;%lum"
    hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    let &t_ti = &t_ti . "\033]10;#f6f3e8\007\033]11;#242424\007"
    let &t_te = &t_te . "\033]110\007\033]111\007"
endif

