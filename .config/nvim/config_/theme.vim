set guifont=Fira\ Code\ 10

colorscheme palenight
set noshowmode

let g:lightline = {
\   'colorscheme': 'palenight',
\   'enable': {
\     'statusline': 1,
\     'tabline': 1,
\   },
\   'active': {
\     'left':  [ [ 'mode' ],
\                [ 'gitbranch', 'readonly' ],
\                [ 'filename', 'dir' ],
\     ],
\     'right': [ [ 'lineinfo' ],
\                [ 'total_lines' ],
\                [ 'filetype' ],
\     ],
\   },
\   'component': {
\     'lineinfo': 'L %3l:%-2v',
\     'dir': '%F',
\     'total_lines': '[%L]',
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   },
\ }


let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_separator = ': '
let g:lightline#bufferline#read_only = ' 🔒 '
let g:lightline#bufferline#modified = ' 🛑 '
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline.tabline = { 'left': [ ['buffers'] ], 'right': [ [] ] }
let g:lightline.component_expand = {
\   'buffers': 'lightline#bufferline#buffers'
\ }
let g:lightline.component_type = {
\   'buffers': 'tabsel'
\ }
let g:lightline.tab = {
\   'active': [ 'tabnum', 'filename', 'modified' ],
\   'inactive': [ 'tabnum', 'filename', 'modified' ],
\ }

set showtabline=2
set guioptions-=e

" Terminal true color hack fix
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if has("termguicolors")     " set true colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE

" NOTE: coc-explorer colors in theme
