"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
let solarized_vim=expand('~/.vim/colors/solarized.vim')

let g:vim_bootstrap_langs = "javascript,ruby,python,html,go"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
endif

if !filereadable(solarized_vim)
  echo "Installing Solarized Theme..."
  echo ""

  silent !mkdir -p ~/.vim/colors
  silent !mkdir -p ~/.vim/tmp
  silent !git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/tmp/solarized
  !mv ~/.vim/tmp/solarized/colors/solarized.vim ~/.vim/colors/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
""" Functions
"*****************************************************************************
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

"*****************************************************************************
"" VimProc DLL Path
"*****************************************************************************
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
elseif has('win32')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
elseif has('win64')
  let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
endif

"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'

"" vimproc
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make -f make_mac.mak',
\     'unix' : 'gmake -f make_mac.mak',
\    },
\ }

"" 補完
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete'
	"" NeoBundle 'supermomonga/neocomplete-rsense.vim', {'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],}
else
	NeoBundle 'Shougo/neocomplcache'
	"" NeoBundle 'Shougo/neocomplcache-rsense.vim', {'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],}
endif

"" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

"" vim操作
NeoBundle 'simeji/winresizer'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'rking/ag.vim'

"" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'

NeoBundle 'tpope/vim-endwise'

"" 便利
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'

"" 構文チェック
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

"" markdownプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"" python構文・コーディング規約チェック
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'

"" indent可視化
NeoBundle 'Yggdroot/indentLine'

"" color theme
NeoBundle 'crusoexia/vim-monokai'

"" statusline

NeoBundle 'itchyny/lightline.vim'

"" HTML/CSS
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'tpope/vim-surround'

NeoBundle 'othree/yajs.vim'

"" JSON syntax
NeoBundle 'elzr/vim-json'

NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'jason0x43/vim-js-indent'

"" LiveScript syntax
NeoBundle 'gkz/vim-ls'

"" Stylus syntax
NeoBundle 'wavded/vim-stylus'

"" Jade syntax
NeoBundle 'digitaltoad/vim-pug'

"" mustache / handlebars
NeoBundle 'mustache/vim-mustache-handlebars'

"" nodejs補完
NeoBundle 'myhere/vim-nodejs-complete'

"" File System
NeoBundle 'rking/ag.vim'

"" 所要時間確認
<<<<<<< HEAD
NeoBundle 'mattn/benchvimrc-vim.git'

"" Vim Git
NeoBundle 'tpope/vim-fugitive'

"" どこが重いのかを調べる
NeoBundle 'mattn/benchvimrc-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
let mapleader="\<Space>"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

set whichwrap=h,l,b,s,<,>,[,]

"" Back Up
set undodir=./.vimundo,~/.vimundo

"" JSONのダブルクォーテーションを表示する
let g:vim_json_syntax_conceal = 0

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

let g:vim_json_syntax_conceal=0

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable
set background=dark
"colorscheme solarized
set number
set ruler

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'bower_components']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
noremap <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
""" Mappings
"*****************************************************************************
"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"******************
"" neosnippet
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)
xmap <c-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
"******************

"******************
if s:meet_neocomplete_requirements()
  "" neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
else
  "" neocomplcache
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif

" <TAB>: completion.                                         
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
"******************

"******************
" tagbar
if ! empty(neobundle#get("tagbar"))
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif
"******************

"******************
" ctags
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags
set tags+=.Gemfile.lock.tags

if has("path_extra")
  set tags+=tags;
endif

nnoremap <C-]> g<C-]> 
"******************

"******************
" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" ファイル名表示
set statusline=%F
" 変更チェック表示
"set statusline+=%m
" 読み込み専用かどうか表示
"set statusline+=%r
" ヘルプページなら[HELP]と表示
"set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
"set statusline+=%w
" これ以降は右寄せ表示
"set statusline+=%=
" file encoding
"set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
"set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
"set laststatus=2

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"******************

"******************
" typescript
au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
"******************

"******************
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
			\    'variables': {
			\      'lang': "ja"
			\    },
			\   'indentation': '  '
			\ }
"******************

"******************
" rsense
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
"******************

"******************
" PyFlake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
"******************

"******************
" jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"******************

"******************
" typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
let g:typescript_indent_disable = 1
"******************

"******************
" indentLine
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail']
"******************

"******************
" mustache / handlebars
let g:mustache_abbreviations = 1
"******************

"******************
" vim-nodejs-complete
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
"******************

"*****************************************************************************
" Indent Width
"*****************************************************************************"
set shiftwidth=2
set tabstop=2

augroup indent
  autocmd! FileType python setlocal shiftwidth=4 tabstop=4
augroup END

set autoindent
set expandtab

"****************************************************************************
" 画面分割 & タブページ
"****************************************************************************

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
