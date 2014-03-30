"VIM互換にしない
set nocompatible
"-------Format--------
"自動インデントを有効化する
set smartindent
set autoindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

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
