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
\                [ 'percent' ],
\                [ 'filetype' ],
\     ],
\   },
\   'component': {
\     'lineinfo': 'L %3l:%-2v',
\     'dir': '%F',
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

" NERDTree Filename highlighting
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

" Terminal true color hack fix
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if has("termguicolors")     " set true colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif

" hi Normal guibg=NONE ctermbg=NONE

