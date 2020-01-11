set nocompatible
set encoding=UTF-8

let mapleader = "\\"
let maplocalleader = ","

let base16colorspace=256  " Access colors present in 256 colorspace

set background=dark
set t_Co=256

let g:pluginpath = '~/.config/nvim/plugged'
call plug#begin(g:pluginpath)
  " Plug 'janko-m/vim-test'

  " Typescript
  " Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
  " Plug 'Quramy/tsuquyomi'
  " Plug 'Quramy/vim-js-pretty-template'

  " Plug 'tpope/vim-eunuch'
  " Plug 'wesQ3/vim-windowswap'
  " Plug 'thaerkh/vim-workspace'
  " Plug 'xolox/vim-session'
  " Plug 'xolox/vim-misc'

  " Org mode
  Plug 'jceb/vim-orgmode'
  " Plug 'mattn/calendar-vim'

  runtime plugins_/coc.vim
  runtime plugins_/lang.vim
  runtime plugins_/fs.vim
  runtime plugins_/theme.vim
  runtime plugins_/git.vim
  runtime plugins_/linter.vim
  runtime plugins_/editor.vim
call plug#end()

runtime config_/coc.vim
runtime config_/lang.vim
runtime config_/fs.vim
runtime config_/theme.vim
runtime config_/git.vim
runtime config_/linter.vim
runtime config_/editor.vim

" Accidental key bindings
map q: <Nop>
nnoremap Q <nop>

" nmap <C-u> <Plug>(PromptJsFileImport)
" nmap <C-u> <Plug>(JsFileImport)
" nmap <C-i> <Plug>(JsGotoDefinition)

