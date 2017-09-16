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
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'jonathanfilip/vim-lucius'
 NeoBundle 'raphamorim/lucario'
 NeoBundle 'mattn/emmet-vim'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'vim-jp/vim-go-extra'
 NeoBundle 'fatih/vim-go'
 NeoBundle 'rking/ag.vim'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'slim-template/vim-slim'
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'mrk21/yaml-vim'
 NeoBundle 'gabrielelana/vim-markdown'
 NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'tpope/vim-endwise'
 NeoBundle 'rust-lang/rust.vim'
 NeoBundle 'racer-rust/vim-racer'
 NeoBundle 'HerringtonDarkholme/yats.vim'
 NeoBundle 'leafgarland/typescript-vim'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'elixir-lang/vim-elixir'
 NeoBundle 'vim-erlang/erlang-motions.vim'
 NeoBundle 'vim-erlang/vim-erlang-runtime'
 NeoBundle 'ElmCast/elm-vim'
 NeoBundle 'nikvdp/ejs-syntax'
 NeoBundle 'jakwings/vim-pony'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'mxw/vim-jsx'
 NeoBundle 'posva/vim-vue'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'cakebaker/scss-syntax.vim'
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

"set cursorline

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
"imap <C-N> <DOWN>
"imap <C-P> <UP>
imap <C-E> <esc>A
imap <C-A> <esc>I

vmap <silent> ;h :s?^\(\s*\)+'\([^']\+\)',*\s*$?\1\2?g<CR>
vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$?\1+'\2'?<CR>
cnoremap ub Unite buffer

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
autocmd FileType go autocmd BufWritePre <buffer> Fmt

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
au BufNewFile,BufRead *.pony set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.ts set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.jsx set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.vue set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rake set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead Gemfile set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss set expandtab tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufNewFile,BufRead *.less set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.coffee set expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"Elm
let g:elm_format_autosave = 1

"ruby
source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

"------------------------------------
" Unit.vim
"------------------------------------
let g:unite_source_history_yank_enable = 1
try
    let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :<C-u>Unite -start-insert file_rec/async<CR>
" reset not it is <C-l> normally
nnoremap <space>r <Plug>(unite_restart)

"insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,a  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------
" ag.vim
"------------------------------------
" --- type * to search the word in all files in the current dif
nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag 

"------------------------------------
" rust.vim
"------------------------------------
let g:rustfmt_autosave = 1
set hidden

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

"" NERDTree
" Close vim if only NERDTree is left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree if in a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Toggle NERDTree, Highlighting our current file
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! TamNERDTreeToggle()
  if IsNERDTreeOpen()
    exe "NERDTreeClose"
  else
    exe "NERDTreeFind"
  endif
endfunction

noremap <C-\> :call TamNERDTreeToggle()<CR>

" Turn Off Old FileManager
let loaded_netrwPlugin=1

"----------

" Use RootIgnore to ignore dirs in NERDTree
let NERDTreeRespectWildIgnore=1
