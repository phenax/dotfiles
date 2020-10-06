set nocompatible
set encoding=UTF-8

let mapleader = "\\"
let maplocalleader = " "

let base16colorspace=256  " Access colors present in 256 colorspace

set background=dark
set t_Co=256

let g:pluginpath = '~/.config/nvim/plugged'
call plug#begin(g:pluginpath)
  "Plug 'Olical/aniseed', { 'tag': 'v3.7.0' }
  "Plug 'bakpakin/fennel.vim'

  runtime plugins_/coc.vim
  runtime plugins_/lang.vim
  runtime plugins_/fs.vim
  runtime plugins_/theme.vim
  runtime plugins_/git.vim
  runtime plugins_/linter.vim
  runtime plugins_/editor.vim
  runtime plugins_/utilities.vim
call plug#end()

runtime config_/coc.vim
runtime config_/lang.vim
runtime config_/fs.vim
runtime config_/theme.vim
runtime config_/git.vim
runtime config_/linter.vim
runtime config_/editor.vim
runtime config_/utilities.vim

" Accidental key bindings
map q: <Nop>
nnoremap Q <nop>
command! W :w
command! Q :q

" Global helpers
nnoremap S <nop>
nnoremap SS :w<CR>

" Copy/paste
vmap <C-c> "+y
vmap <C-p> "+p

