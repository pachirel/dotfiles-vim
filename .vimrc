set nocompatible
filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \   },
      \ }
NeoBundle 'ciaranm/detectindent'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'vim-scripts/L9'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/renamer.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rking/ag.vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'neowit/vim-force.com'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'negipo/unite-rails'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'eafgarland/typescript-vim'
NeoBundle 'mtscout6/vim-cjsx'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'vim-syntastic/syntastic'

call neobundle#end()

source ~/.vim/myPlugin/myplugin.vim

filetype plugin indent on

NeoBundleCheck

syntax enable

scriptencoding utf-8

set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set textwidth=0   " Don't wrap words by default
set nobackup    " Don't keep a backup file
" set viminfo='50,<1000,s100,\"50 " read/write a .viminfo file, don't store more than
set viminfo='500,<10000,s1000,\"500 " read/write a .viminfo file, don't store more than
"set viminfo='50,<1000,s100,:0,n~/.vim/viminfo
set history=100 " keep 50 lines of command line history
set ruler   " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set t_Co=256

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*    set ft=mail
  au BufRead reportbug-*    set ft=mail
augroup END

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=0

set smartindent
set ignorecase
set smartcase
set wrapscan
set hlsearch
set noincsearch
set list
set listchars=tab:\ \ ,trail:\

set formatoptions+=r
set showcmd
set showmatch
set laststatus=2
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{']'}%y%{fugitive#statusline()}\ %F%=%l,%c%V%8P
set wildmode=list:longest
set hidden
set autoread
set swapfile
set dir=~/tmp/vim_swap

" Appearance
set background=dark
highlight Normal ctermfg=grey ctermbg=darkblue
colorscheme vividchalk

autocmd FileType svn :set fileencoding=utf-8
autocmd FileType git :set fileencoding=utf-8

set ambiwidth=double

set complete+=k

nnoremap <C-]> g<C-]>

set cedit=<C-O>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Functions
function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction

highlight SpecialKey ctermbg=2 guibg=#ffcccc
highlight MatchParen cterm=none ctermbg=15 ctermfg=0
highlight Search ctermbg=5 ctermfg=0

autocmd VimEnter,WinEnter * highlight SpecialKey ctermbg=0
autocmd VimEnter,WinEnter * highlight PmenuSel ctermbg=12

"" encoding
"nnoremap <silent> eu :set fenc=utf-8<CR>
"nnoremap <silent> ee :set fenc=euc-jp<CR>
"nnoremap <silent> es :set fenc=cp932<CR>
"" encode reopen encoding
"nnoremap <silent> eru :e ++enc=utf-8 %<CR>
"nnoremap <silent> ere :e ++enc=euc-jp %<CR>
"nnoremap <silent> ers :e ++enc=cp932 %<CR>

" paste/nopaste
nnoremap ep :set paste<CR>
nnoremap enp :set nopaste<CR>

" rails.vim
let g:rails_level=4
let g:rails_statusline=1
" ruby omin complete
"let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" cofs's fsync
autocmd BufNewFile,BufRead /mnt/c/* set nofsync

" YankRing.vim
nnoremap ,y :YRShow<CR>

" delete input line
cnoremap <C-U> <C-E><C-U>

set nofoldenable

" surround.vim
let g:surround_103 = "_('\r')"  " 103 = g
let g:surround_71 = "_(\"\r\")" " 71 = G
" Ruby
" http://d.hatena.ne.jp/ursm/20080402/1207150539
let g:surround_{char2nr('%')} = "%(\r)"
let g:surround_{char2nr('w')} = "%w(\r)"
let g:surround_{char2nr('#')} = "#{\r}"
let g:surround_{char2nr('e')} = "begin \r end"
let g:surround_{char2nr('i')} = "if \1if\1 \r end"
let g:surround_{char2nr('u')} = "unless \1unless\1 \r end"
let g:surround_{char2nr('c')} = "class \1class\1 \r end"
let g:surround_{char2nr('m')} = "module \1module\1 \r end"
let g:surround_{char2nr('d')} = "def \1def\1\2args\r..*\r(&)\2 \r end"
let g:surround_{char2nr('p')} = "\1method\1 do \2args\r..*\r|&| \2\r end"
let g:surround_{char2nr('P')} = "\1method\1 {\2args\r..*\r|&|\2 \r }"

nnoremap g' cs'g
nnoremap g" cs"G

"" General key mapping

let mapleader = "\<Space>"

" Short cut previous buffer
nnoremap <Leader>k <C-^>

" Use ; instead of : to save my pinky
nnoremap ; :
nnoremap : ;

" Disable not used keys
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

nnoremap s *
nnoremap [s :Ag! -f <cword> <CR>
let g:ag_prg="ag --column --smart-case"

nnoremap n nzz
nnoremap N Nzz

nmap nb ;OpenNgBuddyFile<CR>
nmap nj ;OpenNgFile<CR>
nmap ng ;OpenNgCurrentPath<CR>

" Clear highlight search
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" nomatchparent
if !has('gui')
  let g:loaded_matchparen = 1
end

inoremap <BS>  <C-G>u<BS>
inoremap <C-H> <C-G>u<C-H>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>

set grepprg=internal

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

function! Bgrep(word)
  cexpr '' " clear quickfix
  silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
  silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)
command! -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>

" changelog
let g:changelog_username = "Yuta Shimizu"
let g:changelog_dateformat = '== %Y-%m-%d'
let g:changelog_new_entry_format= '  * %c'

vnoremap p "_c<C-r>"<ESC>

" autocmd CmdwinEnter * AutoComplPopDisable
" autocmd CmdwinLeave * AutoComplPopEnable

" nopaste after exit Insert mode
autocmd InsertLeave * set nopaste

vnoremap <silent> _ <Esc>`<zt:execute (line("'>") - line("'<") + 1) 'wincmd' '_'<Return>

" :Source execute selected area as vimscript
" http://subtech.g.hatena.ne.jp/motemen/20080313/1205336864
command! -range=% Source split `=tempname()` | call append(0, getbufline('#', <line1>, <line2>)) | write | source % | bdelete

" close quickfix
nnoremap ec :cclose<CR>

"noremap! <C-b> <Left>
"noremap! <C-f> <Right>
"noremap! <C-k> <Up>
"noremap! <C-j> <Down>
"noremap! <C-a> <Home>
"noremap! <C-e> <End>
inoremap <silent> <expr> <C-e> (pumvisible() ? "\<C-e>" : "\<End>")
noremap! <C-d> <Del>

autocmd BufNewFile,BufRead */chromekeyconfig/* setlocal noexpandtab

" debuglet
autocmd BufWritePost */debuglet.js silent! execute '!debuglet.rb %'
autocmd BufNewFile */debuglet.js silent! execute 'r!debuglet.rb'

" NeoComplete.vim
let g:neocomplete_enable_at_startup = 1
" Use smartcase.
let g:neocomplete_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_syntax_length = 3

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType ruby
  \ if expand("%") =~# '_spec\.rb$' |
  \   compiler rspec | setl makeprg=bundle\ exec\ spring\ rspec\ $*|
  \ else |
  \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
  \ endif

let g:rspec_command = "compiler rspec | Make rspec {spec}"
nnoremap [c :call RunCurrentSpecFile()<CR>
nnoremap [n :call RunNearestSpec()<CR>
nnoremap [l :call RunLastSpec()<CR>

" load ~/.vimrc.local
if filereadable(expand('$HOME/.vimrc.local'))
  source ~/.vimrc.local
endif

set number

" Switch window easily
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

highlight JpSpace cterm=none ctermbg=15 ctermfg=0

function! StripTrailingWhitespaces()
  let pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", pos)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Open vimrc instantly
nnoremap <Leader>. :sp $MYVIMRC<CR>
nnoremap <Leader>rc :source $MYVIMRC<CR>
vnoremap <silent> <C-h> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>

" Edit file in same directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew ;e %%
map <leader>es ;sp %%
map <leader>ev ;vsp %%
map <leader>et ;tabe %%

" Tab explorer

nmap tn ;tabn<CR>
nmap tp ;tabp<CR>
nmap tb ;tabp<CR>
map <leader>c ;setlocal cursorline! cursorcolumn!<CR>

"" Unite.vim {{{
let g:unite_enable_start_insert=1

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.sass-cache/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap <silent> [unite]b :<C-u>Unit bookmark<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

nnoremap <C-O> :<C-u>Unite -buffer-name=file -start-insert buffer file<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}

"" NERDTree

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"" Filetype
au BufRead,BufNewFile,BufReadPre *.md set filetype=markdown
au BufRead,BufNewFile,BufReadPre *.jade set filetype=pug
au BufRead,BufNewFile,BufReadPre *.coffee,*.csx,*cjsx set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.slim set filetype=slim
au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript

autocmd FileType coffee setl sw=2 sts=2 ts=2 et

"" vim-airline
let g:airline_powerline_fonts = 0
set t_Co=256

"" Clipboard settings
set clipboard=unnamed

"" fugitive
let g:fugitive_github_domains = ['github.com']

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType jade,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory = [ "~/.vim/snippets", "~/.vim/vim-snippets/snippets", "~/src/github.com/matthewsimo/angular-vim-snippets/snippets" ]

" setting for vim-json
autocmd InsertEnter *.json setlocal conceallevel=2 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers=['']
