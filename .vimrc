filetype on
filetype plugin on
syntax on
set cindent
set ts=4
set sw=4
set expandtab
set hlsearch
set showmatch
set title
set ruler
set showmode
set clipboard=unnamed,autoselect
let lisp_rainbow=1
set number

set encoding=utf-8

augroup vimrc
autocmd! FileType html setlocal sw=2  ts=2
augroup END

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'gabrielelana/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'syui/cscroll.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundleLazy 'rhysd/vim-clang-format', {
    \ 'autoload' : {'filetypes' : ['c', 'cpp', 'objc']}
    \ }
NeoBundleLazy 'kana/vim-altr'
call neobundle#end()

""""""""""""""""""""""""""""""
" previm property
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'chrome'

""""""""""""""""""""""""""""""
" vim-markdown property
""""""""""""""""""""""""""""""
let g:markdown_enable_spell_checking = 0

""""""""""""""""""""""""""""""
" Unit.vim property
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""
" clang_format property
""""""""""""""""""""""""""""""
let g:clang_format#code_style = 'WebKit'

let g:clang_format#detect_style_file = 0

let g:clang_format#command = 'Q:/umezawa/bin/clang-format.exe'

let g:clang_format#style_options = {
            \ 'IndentWidth' : '4',
            \ 'ColumnLimit' : '80',
            \ 'AlignAfterOpenBracket' : 'false',
            \ 'AllowAllParametersOfDeclarationOnNextLine' : 'false',
            \ 'AllowShortFunctionsOnASingleLine' : 'None',
            \ 'BreakConstructorInitializersBeforeComma' : 'false',
            \ 'ConstructorInitializerAllOnOneLineOrOnePerLine' : 'false',
            \ 'ConstructorInitializerIndentWidth' : 0,
            \ 'KeepEmptyLinesAtTheStartOfBlocks' : 'false',
            \ 'NamespaceIndentation' : 'All',
            \ 'TabWidth' : 4,
            \ 'Standard' : 'C++11',
            \ }
autocmd FileType c,cpp,objc vnoremap <C-K><C-F> :ClangFormat<CR>

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck
