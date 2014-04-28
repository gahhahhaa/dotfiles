"-----------------------------------------------------
"------------ NeoBundle ------------------------------
"-----------------------------------------------------
if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/vimshell.vim'
 NeoBundle 'jonathanfilip/vim-lucius'
 NeoBundle 'elzr/vim-json'
 NeoBundle 'Shougo/vimproc', {
   \ 'build' : {
     \ 'windows' : 'make -f make_mingw32.mak',
     \ 'cygwin' : 'make -f make_cygwin.mak',
     \ 'mac' : 'make -f make_mac.mak',
     \ 'unix' : 'make -f make_unix.mak',
   \ },
 \ }

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"-----------------------------------------------------
"------------ End NeoBundle --------------------------
"-----------------------------------------------------
"
"VIM互換にしない
set nocompatible
"-------Format--------
"自動インデントを有効化する
set smartindent
set autoindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4

let mapleader=","
set backspace=indent,eol,start
" .vimrcの編集をできるようにする
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

set t_Co=256

set list
set listchars=eol:↲,tab:▸▸,extends:❯,precedes:❮

set cursorline

"-------エンコード------
"エンコード設定
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

"ファイルタイプに応じて挙動,色を変える
syntax on
filetype plugin on
filetype indent on

"---------キーマップ-----------
"クリップボードの貼り付け設定
imap <F11> <nop>
set pastetoggle=<F11>

imap <C-B> <LEFT>
imap <C-F> <RIGHT>
imap <C-N> <DOWN>
imap <C-P> <UP>
imap <C-E> <esc>A
imap <C-A> <esc>I

"---------マウス操作----------
set mouse=a
set ttymouse=xterm2
set clipboard+=unnamed,autoselect

set noswapfile
set laststatus=2

colorscheme lucius 
LuciusDarkHighContrast
