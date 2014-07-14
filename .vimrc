" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

set number
set wildmenu
set formatoptions+=mM
set wrap
set cmdheight=2



" neobundle.vimの初期化 
 call neobundle#rc(expand('~/.vim/bundle'))
"
" NeoBundleを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle "vim-perl/vim-perl"
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'rhysd/accelerated-jk'
let g:accelerated_jk_acceleration_table = [10,5,3]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle "y-uuki/perl-local-lib-path.vim"
autocmd FileType perl PerlLocalLibPath

NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'

 "
" "
" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
" filetype plugin indent on

filetype on
filetype plugin on
filetype indent on


"
" インストールのチェック
NeoBundleCheck
"

nnoremap ,pt <Esc>:%! perltidy -se<CR>
vnoremap ,pt <Esc>:'<,'>! perltidy -se<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
