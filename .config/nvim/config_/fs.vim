
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


" Explorer
nmap <localleader>nn :CocCommand explorer<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exec 'bd' | endif

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
autocmd FileType coc-explorer setlocal nolist

