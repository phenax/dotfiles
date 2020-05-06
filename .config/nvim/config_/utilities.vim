" Vim WIKI config
let g:vimwiki_list = [{'path': '~/.config/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki

:autocmd FileType vimwiki map <leader>da :VimwikiMakeDiaryNote<CR>
:autocmd FileType vimwiki map <leader>dx :VimwikiDiaryGenerateLinks<CR>
:autocmd FileType vimwiki map <leader>di <leader>wi

command! Cal :Calendar -split=vertical
command! Clock :Calendar -split=horizontal -view=clock

nmap <leader>cal :Cal<CR>

