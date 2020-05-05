set hidden
set autoread
set mouse=a

set splitbelow splitright

set foldenable
" set foldnestmax=10
" set foldlevel=2
" set foldmethod=manual   
set foldmethod=marker
set foldcolumn=2
set foldopen+=mark

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

" Better display for messages
set cmdheight=1

" Updat  time default 4000
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Disable highlight
nmap <c-\> :noh<CR>

" Tab navigations
nmap <C-PageUp> :bp<CR>
nmap <C-PageDown> :bn<CR>
nmap <C-k> :BD<CR>

" Copy/paste
vmap <C-c> "+y
vmap <C-p> "+p

" Code folding
nmap <S-Tab> zR
nmap zx zo
nmap zc zc

" Window navigation
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

" Accidental typos
command! W :w
command! Q :q

