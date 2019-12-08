set nocompatible

let mapleader = "\\"
let maplocalleader = ","

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

" Git Support
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

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
" Plug 'josudoey/vim-eslint-fix'


" Typescript
Plug 'heavenshell/vim-tslint'
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



" Linter config
" let b:ale_fixers = ['eslint']
let g:ale_enabled = 1
let b:ale_linters = {'javascript': ['eslint', 'prettier'], 'typescript': ['tslint', 'prettier']}
let g:ale_fixers = {'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'], 'typescript': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_completion_tsserver_autoimport = 1
" let b:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:syntastic_enable_racket_racket_checker = 1
set omnifunc=ale#completion#OmniFunc

" FZF (Fuzzy search)
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

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

" Theme and Styling
set t_Co=256
set background=dark

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

" set guifont=Fira\ Code\ 12
colorscheme palenight
" colorscheme taste

" Sessions
" au VimLeave * if this_session != "" | exe "mksession! ".this_session
" let g:workspace_autosave_always = 1
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'

let g:gutentags_enabled = 1

" nmap <C-u> <Plug>(PromptJsFileImport)
nmap <C-u> <Plug>(JsFileImport)
nmap <C-i> <Plug>(JsGotoDefinition)

" Open NERDTree in new tabs and windows if no command line args set
" autocmd VimEnter * NERDTree
" let NERDTreeMapOpenInTab='<ENTER>'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
nmap ,n :NERDTreeFind<CR>

" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg . ' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('json', 'yellow', 'none', '#ffeaa7')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow')
" call NERDTreeHighlightFile('css', 'cyan', 'none', '#fd79a8')
" call NERDTreeHighlightFile('scss', 'cyan', 'none', '#fd79a8')
" call NERDTreeHighlightFile('js', 'blue', 'none', '#00cec9')
" call NERDTreeHighlightFile('ts', 'blue', 'none', '#0984e3')
" call NERDTreeHighlightFile('tsx', 'blue', 'none', '#0984e3')
" call NERDTreeHighlightFile('jsx', 'blue', 'none', '#0984e3')

