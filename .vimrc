" setting of vim
set nocompatible
set backspace=2
set number
set showmatch
set autoindent
set tabstop=4
syntax on
set fileencodings=utf8,cp932,euc-jp
set laststatus=2
set statusline=%f\ [%{&fenc==''?&enc:&fenc}][%{&ff}]%=%9l:%c%8P
set expandtab
set smartindent
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:\\_,trail:_
set cursorline
set cursorcolumn
set hlsearch
" remap key bind
imap <c-j> <esc>
" imap {} {}<left>
" imap [] []<left>
" imap () ()<left>
" imap "" ""<left>
" imap <> <><left>
" imap '' ''<left>
" imap `` ``<left>

" use plugins by NeoBundle
filetype off
"set rtp+=~/dotfiles/neobundle.vim
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle'))
endif

"NeoBundle 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'dbext.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'errormarker.vim'
NeoBundle 'SrcExpl'
NeoBundle 'The-NERD-tree'
NeoBundle 'taglist.vim'
NeoBundle 'Trinity'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ack.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
" color scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'
" for Ruby on Rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'basyura/unite-rails'
NeoBundle 'romanvbabenko/rails'
" for Go language
NeoBundle 'fatih/vim-go'
NeoBundle 'editorconfig/editorconfig-vim'

filetype plugin indent on

if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
else
  call neobundle#end()
endif

" Setting of neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
      \ 'perl' : '-R -h ".pm"'
      \ }

let g:neosnipet#snippets_directory = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default'    : '',
      \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
      \ 'sql'        : $HOME . '/.vim/dict/sql.dict'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" setting for snippets
" imap <expr><C-k> neosnippet#expandable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <C-k> <Plug>(neosnippet_jump_or_expand)

" setting for quickrun
nmap <Leader>r <Plug>(quickrun)

" setting NERD-tree
nmap <Leader>t :NERDTreeToggle<CR>

" setting for NERDcommenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims =1
nmap <Leader>/ <Plug>NERDCommenterToggle
nmap <Leader>/a <Plug>NERDCommenterAppend
nmap <Leader>/s <Plug>NERDCommenterSexy

" setting for vim-easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="_"
let g:EasyMotion_grouping=1

" タブ、末尾空白のハイライト
autocmd VimEnter,Colorscheme * :hi SpecialKey ctermfg=darkcyan

" 選択行のハイライト(起動時、入力モード時、入力終了時
autocmd VimEnter,Colorscheme * :hi CursorLine cterm=underline
autocmd InsertEnter *          :hi CursorLine cterm=bold
autocmd InsertLeave *          :hi CursorLine cterm=underline

" 選択列のハイライト(起動時、入力モード時、入力終了時
autocmd VimEnter,Colorscheme * :hi CursorColumn ctermbg=darkgrey ctermfg=lightmagenta
autocmd InsertEnter *          :hi CursorColumn ctermbg=black cterm=bold
autocmd InsertLeave *          :hi CursorColumn ctermbg=darkgrey ctermfg=lightmagenta

" 選択列のハイライト(スペルミス時のハイライト)
autocmd VimEnter,ColorScheme * :hi SpellBad cterm=underline ctermbg=0

" インデントの奇数/偶数業のハイライト切り替え
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=darkcyan  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=lightcyan ctermbg=darkcyan

" errormarkerの設定
autocmd QuickFixCmdPost make redraw!
autocmd QuickFixCmdPost make if len(getqflist()) != 0 | copen | endif
" autocmd QuickFixCmdPost make if len(getqflist()) == 0 | cclose | endif

syntax enable
colorscheme jellybeans
set backupskip=/tmp/*,/private/tmp/*

let g:go_hightlight_functions = 1
let g:go_hightlight_methods = 1
let g:go_hightlight_structs = 1
let g:go_hightlight_interfaces = 1
let g:go_hightlight_operators = 1
let g:go_hightlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"

function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
