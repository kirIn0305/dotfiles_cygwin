"neobundle setting
if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

"neobundle.vim自身をneobundle.vimで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ここにインストールしたいプラグインを設定する
" : help neobundle-examples
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet'
" NeoBundle 'junegunn/seoul256.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'lervag/vim-latex'
" NeoBundle 'vim-latex/vim-latex'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tomasr/molokai'
NeoBundle 'aklt/plantuml-syntax'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'yuratomo/w3m.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call neobundle#end()

filetype plugin indent on

"プラグインがインストールされているかチェック
NeoBundleCheck

if !has('vim_starting')
	" .vimrcを読み直した時のための設定
	call neobundle#call_hook('on_source')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scratch window 非表示
set completeopt=menuone
"プラグインの設定
"vimdoc-ja
set helplang=ja,en
"colorscheme
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set background=dark

"unite.vim
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PMenuSbar ctermbg=4

"neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
snoremap <CR> <BS>i
"SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
  
"For snippet_complete marker.
if has('conceal')
set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/mysnippet' 

"vim indent guide on
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

"vim-quickrun
" let g:quickrun_config={'_': {'split': 'vertical'}}
" let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\     "hook/neco/enable" : 1,
\     "hook/neco/wait" : 20,
\     "outputter/buffer/split" : ":botright 5sp",
\     "runner": "vimproc",
\     "runner/vimproc/updatetime" : 40,
\     "hook/close_quickfix/enable_hook_loaded" : 1,
\     "hook/close_quickfix/enable_success" : 1,
\     "hook/close_buffer/enable_failure" : 1,
\     "hook/close_buffer/enable_empty_data" : 1,
\     "outputter" : "multi:buffer:quickfix",
\     'hook/time/enable' : 1
\ }

let g:quickrun_config['opencv'] = {
\   'command' : 'g++',
\   'cmdopt': '`pkg-config opencv --libs --cflags`',
\   'exec': ['%c %s %o']
\ }

let g:quickrun_config['tex'] = {
\   'command' : 'latexmk',
\   'cmdopt': '-pdfdvi -pv',
\   'exec': ['%c %o %s']
\ }

let g:quickrun_config['python'] = {
\   "command" : "python3",
\   "exec" : '%c %s'
\   }


"vim-markdown 
au BufRead,BufNewFile *.md set filetype=markdown

"previm
let g:previm_open_cmd='open -a "Google Chrome"'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"my setting
set encoding=utf-8

set number
set cursorline
set wrap
set wrapscan
set showmatch
set hlsearch
set laststatus=2
set tabstop=4
set shiftwidth=4
set nobackup
set noswapfile
set backspace=indent,eol,start
"for cron
set backupskip=/tmp/*,/private/tmp/*
set smarttab
set expandtab

set clipboard+=autoselect
set clipboard+=unnamed
"hi CursorLine term=reverse cterm=none ctermbg=233
syntax on

"INSERTMODE
let g:hi_insert  = 'highlight StatusLine guifg=darkblue guibg=darkblue gui=none ctermfg=blue ctermbg=darkblue cterm=none'
if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction
function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

"markdown
vnoremap <leader>mdu ygvs[](<c-r>")<esc>?[]<cr>a
