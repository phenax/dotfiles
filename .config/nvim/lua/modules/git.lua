local utils = require 'utils'
local nmap = utils.nmap

local git = {}

function git.plugins(use)
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'rhysd/git-messenger.vim'
  use 'rbong/vim-flog'
end

function git.configure()
  g.gitgutter_max_signs = 500

  -- Preview hunk inline
  nmap('<localleader>hh', '<Plug>(GitGutterPreviewHunk)')

  -- Git next/prev hunk
  nmap('<localleader>hn', '<Plug>(GitGutterNextHunk)')
  nmap('<localleader>hp', '<Plug>(GitGutterPrevHunk)')

  -- Stage/undo hunk
  nmap('<localleader>hs', '<Plug>(GitGutterStageHunk)')
  nmap('<localleader>hu', '<Plug>(GitGutterUndoHunk)')

  -- Diffresult merge in left/right
  nmap('<localleader>gl', ':diffget //2<cr>')
  nmap('<localleader>gr', ':diffget //3<cr>')

  -- Git status/log
  nmap('<localleader>gs', ':G<cr>')
  nmap('<localleader>gll', ':Commits<cr>')
  nmap('<localleader>glf', ':BCommits<cr>')
  nmap('<localleader>gm', ':GitMessenger<cr>')

  -- Add
  nmap('<localleader>ga.', ':G add .<cr>')
  nmap('<localleader>gaf', ':G add %<cr>')

  -- Add/Commit/Push/Pull
  nmap('<localleader>gc', ':Gcommit<cr>')
  nmap('<localleader>gpp', ':Gpush<cr>')
  nmap('<localleader>gpu', ':Gpull<cr>')
end

function git.init(use)
  git.plugins(use)
  git.configure()
end

return git
