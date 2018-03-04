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
set clipboard=unnamed,autoselect
let lisp_rainbow=1
set number
set backspace=indent,eol,start
set background=dark

set encoding=utf-8
let mapleader = ','


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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim', {
    \ 'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],
    \ }
NeoBundleLazy 'rhysd/vim-clang-format', {
    \ 'autoload' : {'filetypes' : ['c', 'cpp', 'objc']}
    \ }
NeoBundleLazy 'NigoroJr/rsense', {
    \ 'autoload': {
    \ 'filetypes': 'ruby',
    \ },
    \ }
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'jremmen/vim-ripgrep'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'davidhalter/jedi-vim'
call neobundle#end()

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
autocmd FileType c,cpp,objc nnoremap <C-K><C-F> :ClangFormat<CR>

""""""""""""""""""""""""""""""
" neocomplcache property
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

""""""""""""""""""""""""""""""
" rsence property
""""""""""""""""""""""""""""""
let g:rsenseUseOmniFunc = 1

""""""""""""""""""""""""""""""
" rust setting
""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1 

filetype plugin indent on     " required!
filetype indent on
syntax on
NeoBundleCheck

" autopep 
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    "--ignote=E501: 一行の長さの補正を無視"
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction

" Shift + F でautopep自動修正
nnoremap <S-f> :call Autopep8()<CR>

" 自動保存
autocmd BufWrite *.{py} :call Autopep8()
