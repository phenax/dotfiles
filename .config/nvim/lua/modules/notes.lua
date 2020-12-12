local utils = require 'utils'
local nmap = utils.nmap

local notes = {
  path = '~/.config/vimwiki/',
}

function notes.plugins(use)
  use 'vimwiki/vimwiki'
  use 'itchyny/calendar.vim'
end


function onNewLine(text)
  -- TODO: Refactor to lua sometime maybe?
  exec('call append(".", "'..text..'")')
  exec [[normal! j$]]
  exec [[startinsert!]]
end

function vimwikiBindings()
  -- Diary
  nmap('<localleader>da',  ':VimwikiMakeDiaryNote<CR>')
  nmap('<localleader>dx',  ':VimwikiDiaryGenerateLinks<CR>')
  nmap('<localleader>di',  '<leader>wi')

  -- Checklist
  nmap('<localleader>cc',  ':VimwikiToggleListItem<CR>')
  nmap('<localleader>li',  ':lua onNewLine("  * ")<CR>')
  nmap('<localleader>cn',  ':lua onNewLine("  - [ ] ")<CR>')
end

function notes.configure()
  g.vimwiki_folding = ''
  g.vimwiki_list = {{
    path = notes.path,
    syntax = 'markdown',
    ext = '.md'
  }}

  nmap('<leader>==', ':setlocal spell! spelllang=en_us<CR>')

  exec [[au BufRead,BufNewFile *.md set filetype=vimwiki]]
  exec [[autocmd FileType vimwiki lua vimwikiBindings()]]

  -- URL editor commands
  nmap('<localleader>hts', ':s/http/https/g<CR>') -- http to https

  -- Calender/clock
  exec [[command! Cal :Calendar -split=vertical]]
  exec [[command! Clock :Calendar -split=horizontal -view=clock]]
  nmap('<localleader>cal', ':Cal<CR>')
end

function notes.init(use)
  notes.plugins(use)
  notes.configure()
end

return notes

