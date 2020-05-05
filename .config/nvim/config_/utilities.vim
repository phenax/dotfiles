" Vim WIKI config
let g:vimwiki_list = [{'path': '~/.config/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki

:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote

function! ToggleCalendar()
  execute ":Calendar -split=vertical"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:autocmd FileType vimwiki map <leader>cal :call ToggleCalendar()<CR>

command! Cal :Calendar -split=vertical
command! Clock :Calendar -split=vertical -view=clock

