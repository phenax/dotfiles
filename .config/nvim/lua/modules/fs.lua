local utils = require 'utils'
local nmap = utils.nmap
local nmap_silent = utils.nmap_silent

local fs = {}

function fs.plugins(use)
  use 'junegunn/fzf.vim'
  use 'djoshea/vim-autoread'
end

function fs.configure()
  -- File tree
  nmap_silent('<localleader>nn', ':CocCommand explorer<cr>')

  -- Fuzzy file finder
  if utils.fexists('.git') then
    nmap_silent('<leader>f', ':GFiles --cached --others --exclude-standard<cr>')
  else
    nmap_silent('<leader>f', ':FZF<cr>')
  end
  -- Close fzf buffer on double escape
  exec [[autocmd! FileType fzf nmap <esc> :q<cr> | autocmd BufLeave <buffer> nunmap <esc>]]

  -- Global content search
  nmap_silent('<c-f>', ':Ag<cr>')

  -- Local search
  nmap_silent('<c-c>', ':BTags<cr>')

  -- Set buffer file type
  nmap_silent('<leader>cf', ':Filetypes<cr>')

  exec [[autocmd StdinReadPre * let s:std_in=1autocmd StdinReadPre * let s:std_in=1]]
  exec [[autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exec 'bd' | endif]]
  
  exec [[autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif]]
  exec [[autocmd FileType coc-explorer setlocal nolist]]
end

function fs.init(use)
  fs.plugins(use)
  fs.configure()
end

return fs
