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
 NeoBundle 'raphamorim/lucario'
 NeoBundle 'elzr/vim-json'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'fatih/vim-go'
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'mrk21/yaml-vim'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'tpope/vim-endwise'
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
syntax enable
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

vmap <silent> ;h :s?^\(\s*\)+'\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$?\1+'\2'?<CR>

"---------マウス操作----------
set mouse=a
set ttymouse=xterm2
set clipboard+=unnamed

set noswapfile
set laststatus=2
set number

"colorscheme lucario
colorscheme lucius 
LuciusDarkHighContrast

"set clipboard=unnamedplus
"set clipboard=unnamed,autoselect

"--------vim-go-------------
let  g:go_disable_autoinstall=1

"--------vim-json-------------
let g:vim_json_syntax_conceal = 0

"-------Format--------
"自動インデントを有効化する
set smartindent
set autoindent
set list lcs=tab:\|\ 
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
au BufNewFile,BufRead *.rb set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead Gemfile set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss set expandtab tabstop=2 shiftwidth=2

"ruby
source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
