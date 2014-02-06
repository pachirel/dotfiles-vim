set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'ciaranm/detectindent'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
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

NeoBundleCheck

filetype plugin indent on
syntax on

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

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
 set t_Co=16
 set t_Sf=[3%dm
 set t_Sb=[4%dm
endif

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
set cursorline

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

if !has('macunix')
  highlight Visual ctermbg=0
else
  highlight Visual ctermbg=8
end

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
nnoremap [s :Ag <cword><CR>

nnoremap n nzz
nnoremap N Nzz

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

noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
inoremap <silent> <expr> <C-e> (pumvisible() ? "\<C-e>" : "\<End>")
noremap! <C-d> <Del>

autocmd BufNewFile,BufRead */chromekeyconfig/* setlocal noexpandtab

" debuglet
autocmd BufWritePost */debuglet.js silent! execute '!debuglet.rb %'
autocmd BufNewFile */debuglet.js silent! execute 'r!debuglet.rb'

" NeoCompleCache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . (&indentexpr != '' " ? "\<C-f>\<CR>X\<BS>":"\<CR>")
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" vim-rspec mappings
let g:rspec_command = "Dispatch bundle exec spring rspec {spec}"
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

nnoremap <C-E> :NERDTree<CR>

"" Filetype
au BufRead,BufNewFile *.md set filetype=markdown

"" vim-airline
let g:airline_powerline_fonts = 1
set t_Co=256
