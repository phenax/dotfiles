" NerdTree config
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" Open NERDTree in new tabs and windows if no command line args set
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * NERDTreeMirror

autocmd FileType nerdtree setlocal nolist

" Nerdtree Keys
nmap <localleader>n :NERDTreeFind<CR>

" FZF (Fuzzy search)
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
" let g:fzf_layout = { 'down': '~25%' }

" Search by filename
if isdirectory(".git")
  nmap <silent> <leader>f :GFiles --cached --others --exclude-standard<cr>
else
  nmap <silent> <leader>f :FZF<cr>
endif

" Search in files
nmap <c-f> :Ag<cr>

