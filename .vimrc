filetype on
filetype plugin on
syntax on
set autoread
set cindent
set ts=4
set sw=4
set expandtab
set hlsearch
set noswapfile
set hidden
set showmatch
set title
set ruler
set showmode
set smartindent
let lisp_rainbow=1
set number
set backspace=indent,eol,start
set background=dark

set encoding=utf-8
let mapleader = ','

augroup vimrc
autocmd! FileType html setlocal sw=2  ts=2
augroup END

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'


" dein.vim がなければ github からclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

let s:toml_dir = s:dein_path . '/config'

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" インストールされていないプラグインがあればインストールする
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
