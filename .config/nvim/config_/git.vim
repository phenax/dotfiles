let g:gitgutter_max_signs = 500

" Preview hunk inline
nmap <localleader>hh <Plug>(GitGutterPreviewHunk)

" Git next/prev hunk
nmap <localleader>hn <Plug>(GitGutterNextHunk)
nmap <localleader>hp <Plug>(GitGutterPrevHunk)

" Stage/undo hunk
nmap <localleader>hs <Plug>(GitGutterStageHunk)
nmap <localleader>hu <Plug>(GitGutterUndoHunk)

" Diffresult merge in left/right
nmap <localleader>gl :diffget //2<CR>
nmap <localleader>gr :diffget //3<CR>

" Git status/log
nmap <localleader>gs :G<CR>
nmap <localleader>gll :Glog<CR>

" Add
nmap <localleader>ga. :G add .<CR>
nmap <localleader>gaf :G add %<CR>

" Add/Commit/Push/Pull
nmap <localleader>gc :Gcommit<CR>
nmap <localleader>gpp :Gpush<CR>
nmap <localleader>gpu :Gpull<CR>

