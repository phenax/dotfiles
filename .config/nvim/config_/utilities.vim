" Vim WIKI config
let g:vimwiki_list = [{'path': '~/.config/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Folding
let g:vimwiki_folding='' " expr|list|syntax

" Color highlight
lua require'colorizer'.setup()

au BufRead,BufNewFile *.wiki set filetype=vimwiki

function! OnNewLine(text)
  call append(".", a:text)
  normal! j$
  startinsert!
endfunction

function! MyVimwikiBindings()
  " Diary
  nmap <localleader>da  :VimwikiMakeDiaryNote<CR>
  nmap <localleader>dx  :VimwikiDiaryGenerateLinks<CR>
  nmap <localleader>di  <leader>wi

  " Checklist
  nmap <localleader>cc  :VimwikiToggleListItem<CR>
  nmap <localleader>li  :call OnNewLine("  * ")<CR>
  nmap <localleader>cn  :call OnNewLine("  - [ ] ")<CR>
endfunction

:autocmd FileType vimwiki call MyVimwikiBindings()

" Calendar stuff
command! Cal :Calendar -split=vertical
command! Clock :Calendar -split=horizontal -view=clock
nmap <localleader>cal :Cal<CR>


" URL shortcuts (for qutebrowser url editing)
nmap <localleader>hts :s/http/https/g<CR>

