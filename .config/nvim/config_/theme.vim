set guifont=Source\ Code\ Pro\ for\ Powerline\ 10

" colorscheme dracula
colorscheme palenight

" let g:airline_theme = "dracula"
let g:airline_theme = "palenight"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1


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

