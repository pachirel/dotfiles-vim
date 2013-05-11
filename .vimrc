set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'ciaranm/detectindent'
Bundle 'tpope/vim-endwise'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-haml'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'Shougo/vimshell'
Bundle 'tpope/vim-fugitive'
Bundle 'pachirel/vim-rails'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on

scriptencoding utf-8

set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set textwidth=0   " Don't wrap words by default
set nobackup    " Don't keep a backup file
" set viminfo='50,<1000,s100,\"50 " read/write a .viminfo file, don't store more than
set viminfo='500,<10000,s1000,\"500 " read/write a .viminfo file, don't store more than
"set viminfo='50,<1000,s100,:0,n~/.vim/viminfo
set history=1000 " keep 50 lines of command line history
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

syntax on

if has("autocmd")
  filetype plugin on
  filetype indent on
  " ‚±‚ê‚ç‚Ìft‚Å‚ÍƒCƒ“ƒfƒ“ƒg‚ğ–³Œø‚É
  " autocmd FileType php filetype indent off
  " autocmd FileType xhtml :set indentexpr=
endif

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*    set ft=mail
  au BufRead reportbug-*    set ft=mail
augroup END
"
" ƒ^ƒu•‚Ìİ’è
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=0

set smartindent
"ŒŸõ•¶š—ñ‚ª¬•¶š‚Ìê‡‚Í‘å•¶š¬•¶š‚ğ‹æ•Ê‚È‚­ŒŸõ‚·‚é
set ignorecase
"ŒŸõ•¶š—ñ‚É‘å•¶š‚ªŠÜ‚Ü‚ê‚Ä‚¢‚éê‡‚Í‹æ•Ê‚µ‚ÄŒŸõ‚·‚é
set smartcase
"ŒŸõ‚ÉÅŒã‚Ü‚Ås‚Á‚½‚çÅ‰‚É–ß‚é
set wrapscan
" ŒŸõ‚ÅF‚ğ‚Â‚¯‚é
set hlsearch
"ŒŸõ•¶š—ñ“ü—Í‚É‡Ÿ‘ÎÛ•¶š—ñ‚Éƒqƒbƒg‚³‚¹‚È‚¢
set noincsearch
"ƒ^ƒu•¶š‚Ì•\¦
set list
set listchars=tab:\ \ ,trail:\
"set listchars=tab:\ \ ,trail:\
"
" ƒRƒƒ“ƒgs‚ª˜A‘±‚·‚é‚Æ‚«‚ÍƒRƒƒ“ƒg‚É
set formatoptions+=r
"“ü—Í’†‚ÌƒRƒ}ƒ“ƒh‚ğƒXƒe[ƒ^ƒX‚É•\¦‚·‚é
set showcmd
"Š‡ŒÊ“ü—Í‚Ì‘Î‰‚·‚éŠ‡ŒÊ‚ğ•\¦
set showmatch
"ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ğí‚É•\¦
set laststatus=2
" ƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚Ì•\¦
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff}%{']'}%y%{fugitive#statusline()}\ %F%=%l,%c%V%8P
" ƒRƒ}ƒ“ƒhƒ‰ƒCƒ“•âŠÔ‚ğƒVƒFƒ‹‚Á‚Û‚­
set wildmode=list:longest
" ƒoƒbƒtƒ@‚ª•ÒW’†‚Å‚à‚»‚Ì‘¼‚Ìƒtƒ@ƒCƒ‹‚ğŠJ‚¯‚é‚æ‚¤‚É
set hidden
" ŠO•”‚ÌƒGƒfƒBƒ^‚Å•ÒW’†‚Ìƒtƒ@ƒCƒ‹‚ª•ÏX‚³‚ê‚½‚ç©“®‚Å“Ç‚İ’¼‚·
set autoread

" svn/git ‚Å‚Ì•¶šƒGƒ“ƒR[ƒfƒBƒ“ƒOİ’è
autocmd FileType svn :set fileencoding=utf-8
autocmd FileType git :set fileencoding=utf-8

set ambiwidth=double

" ƒ^ƒOƒtƒ@ƒCƒ‹‚Ì©“®ƒZƒbƒg
if has("autochdir")
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

" tags ‚ÌƒL[ƒ}ƒbƒsƒ“ƒO‚ª C-t ‚¾‚Æ screen ‚Æ‚©‚Ô‚é‚Ì‚Å C-z ‚É
nnoremap <C-z> <C-t>

" «‘ƒtƒ@ƒCƒ‹‚©‚ç‚Ì’PŒê•âŠÔ
set complete+=k

" include ƒtƒ@ƒCƒ‹‚Í–³‹
" set complete-=i

" C-]‚Åtjump‚Æ“¯“™‚ÌŒø‰Ê
nnoremap <C-]> g<C-]>

" CD.vim example:// ‚Í“K—p‚µ‚È‚¢
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | execute ":try | lcd " . escape(expand("%:p:h"), ' ') . ' | catch | endtry '  | endif

if &term =~ "screen"
  " screen Buffer Ø‚è‘Ö‚¦‚Å screen ‚Éƒtƒ@ƒCƒ‹–¼‚ğ•\¦
  autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe '!echo -n "kv:%\\"' | endif
endif

" command line ‚Å command window ŠJ‚­
set cedit=<C-O>

"•\¦s’PˆÊ‚ÅsˆÚ“®‚·‚é
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" + - ‚Åƒoƒbƒtƒ@ƒEƒBƒ“ƒhƒEƒTƒCƒY•ÏX
" nnoremap + <C-W>+
" nnoremap - <C-W>-

" å‰å›çµ‚äº†ã—ãŸã‚«ãƒ¼ã‚½ãƒ«è¡Œã«ç§»å‹•
" autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Functions
",e ‚Å‚»‚Ìƒtƒ@ƒCƒ‹‚ğÀs
function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction

if has('win32')
  nnoremap ,e :execute '!' &ft ' %'<CR>
else
  nnoremap ,e :call ShebangExecute()<CR>
end

:function! HtmlEscape()
silent s/&/\&amp;/eg
silent s/</\&lt;/eg
silent s/>/\&gt;/eg
:endfunction

:function! HtmlUnEscape()
silent s/&lt;/</eg
silent s/&gt;/>/eg
silent s/&amp;/\&/eg
:endfunction

set t_Co=16
set t_Sf=[3%dm
set t_Sb=[4%dm

if !has('win32')
  " •âŠ®Œó•âF
  hi Pmenu ctermbg=8
  hi PmenuSel ctermbg=12
  hi PmenuSbar ctermbg=0
endif

if !has('macunix')
  highlight Visual ctermbg=0
else
  highlight Visual ctermbg=8
end

highlight SpecialKey ctermbg=2 guibg=#ffcccc
highlight MatchParen cterm=none ctermbg=15 ctermfg=0
highlight Search ctermbg=5 ctermfg=0

" highlight ã‘‚«
autocmd VimEnter,WinEnter * highlight SpecialKey ctermbg=0
autocmd VimEnter,WinEnter * highlight PmenuSel ctermbg=12

" encoding
nnoremap <silent> eu :set fenc=utf-8<CR>
nnoremap <silent> ee :set fenc=euc-jp<CR>
nnoremap <silent> es :set fenc=cp932<CR>
" encode reopen encoding
nnoremap <silent> eru :e ++enc=utf-8 %<CR>
nnoremap <silent> ere :e ++enc=euc-jp %<CR>
nnoremap <silent> ers :e ++enc=cp932 %<CR>

" paste/nopaste
nnoremap ep :set paste<CR>
nnoremap enp :set nopaste<CR>

" yanktmp.vim
noremap <silent> sy :call YanktmpYank()<CR>
noremap <silent> sp :call YanktmpPaste_p()<CR>
noremap <silent> sP :call YanktmpPaste_P()<CR>

" for rails
autocmd BufNewFile,BufRead app/**/*.erb set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.haml set fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb set fenc=utf-8

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

" fold g‚í‚È‚¢
set nofoldenable

" folding keymap
nnoremap zz za
nnoremap zZ zA

" htmlomni
" autocmd FileType html set filetype=xhtml

" str2numchar.vim
" ”ÍˆÍ‘I‘ğ‚µ‚Ä‚é•¶š—ñ‚ğ•ÏŠ·
vnoremap <silent> sn :Stn2NumChar<CR> " ‚  => &#12354;
vnoremap <silent> sh :Str2HexLiteral<CR> " ‚  => \\xE3\\x81\\x82

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

" ‘O‚Ìƒoƒbƒtƒ@‚ÉˆÚ“®‚ğ Space ‚É
nnoremap <Space> <C-^>

" nomatchparent
if !has('gui')
  let g:loaded_matchparen = 1
end

" insert ‚Ìíœ“™‚Ìƒ}ƒbƒsƒ“ƒO
inoremap <BS>  <C-G>u<BS>
inoremap <C-H> <C-G>u<C-H>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>

" gh ‚Å hilight ‚ğÁ‚·
nnoremap <silent> gh :let @/=''<CR>

set grepprg=internal

" ŒŸõƒŒƒWƒXƒgƒŠ‚É“ü‚Á‚Ä‚é•¶š‚ÅŒ»İ‚Ìƒtƒ@ƒCƒ‹‚ğŒŸõ‚µAquickfix ‚ÅŠJ‚­
nnoremap <unique> g/ :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>
" G/ ‚Å‚Í‚·‚×‚Ä‚Ìƒoƒbƒtƒ@
" nnoremap <unique> G/ :silent exec ':cexpr "" \| :bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>

" ‚È‚ñ‚¾‚ê‚±‚êc
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" ƒoƒbƒtƒ@‚©‚çŒŸõ
function! Bgrep(word)
  cexpr '' " quickfix ‚ğ‹ó‚É
  silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
  silent cwin
endfunction
command! -nargs=1 Bgrep :call Bgrep(<f-args>)

" ˆø”‚Ì•¶š—ñ‚ğAƒfƒBƒŒƒNƒgƒŠ”z‰º‚©‚çÄ‹A“I‚ÉŒŸõ
function! Findgrep(arg)
  let findgrep_cmd = 'find . -type f ! -regex ".*\.svn.*" ! -regex ".*\.git.*" ! -regex ".*\.sw.*" ! -regex ".*tags" -print0 |xargs -0 grep -n '
  cgetexpr system(findgrep_cmd . a:arg)
  silent cwin
endfunction
command! -nargs=1 Findgrep :call Findgrep(<f-args>)

" changelog
let g:changelog_username = "Yuta Shimizu"
let g:changelog_dateformat = '== %Y-%m-%d'
let g:changelog_new_entry_format= '  * %c'

" fuf.vim
nnoremap <unique> <silent> <C-S> :FufBuffer!<CR>
nnoremap <unique> <silent> eff :FufFile!<CR>
nnoremap <silent> es :FufBuffer!<CR>
nnoremap <silent> ee :FufFileWithCurrentBuffer!<CR>
nnoremap <silent> efm :FufMruFile!<CR>
nnoremap <silent> efj :FufMruFileInCwd!<CR>
nnoremap <silent> eft :FufTag!<CR>
nnoremap <silent> efT :FufTagWithCursorWord!<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_splitPathMatching = ' '
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$'
let g:fuf_mrufile_maxItem = 10000
let g:fuf_enumeratingLimit = 20
let g:fuf_previewHeight = 20

" Visualƒ‚[ƒh‚Ìp‚Åã‘‚«‚³‚ê‚½ƒeƒLƒXƒg‚ğƒŒƒWƒXƒ^‚É“ü‚ê‚È‚¢
vnoremap p "_c<C-r>"<ESC>

" acp.vim
let g:acp_behaviorHtmlOmniLength = -1
let g:acp_behaviorRubyOmniMethodLength = -1
let g:acp_behaviorRubyOmniSymbolLength = -1

" autocmd CmdwinEnter * AutoComplPopDisable
" autocmd CmdwinLeave * AutoComplPopEnable

" Insert ƒ‚[ƒh”²‚¯‚½‚ç nopaste
autocmd InsertLeave * set nopaste

" ack.vim
let g:AckAllFiles=0

" ‚à‚Æ‚Ì ga ‚ğ gA ‚ÉŠ„‚è“–‚Ä
nnoremap gA ga
" ga ‚ğ / ƒŒƒWƒXƒ^‚Å :Ack ŒŸõA
nnoremap ga :silent exec ':Ack ' . substitute(getreg('/'), '\v\\\<(.*)\\\>', "\\1", '')<CR>

" ƒEƒBƒ“ƒhƒE‚Ì‚‚³‚ğ‘I‘ğ”ÍˆÍ‚Æ“¯‚¶‚É‚È‚é‚æ‚¤’²®
vnoremap <silent> _ <Esc>`<zt:execute (line("'>") - line("'<") + 1) 'wincmd' '_'<Return>

" :Source ‚Å‘I‘ğ•”•ª‚¾‚¯ vimscript ‚é
" http://subtech.g.hatena.ne.jp/motemen/20080313/1205336864
command! -range=% Source split `=tempname()` | call append(0, getbufline('#', <line1>, <line2>)) | write | source % | bdelete
" autoread ‚É source ‚µ‚È‚¨‚·
" autocmd BufWritePost,FileWritePost {*.vim,*vimrc} if &autoread | source <afile> | endif

" - ‚à fname ‚ÉŠÜ‚Ş
autocmd BufRead * setlocal isfname+=- " ‚Ç‚±‚©‚Ì plugin ‚Åã‘‚«‚³‚ê‚Ä‚éH
set isfname+=-

" QuickFix ‚ÌƒTƒCƒY’²®,©“®‚Å”²‚¯‚é
function! s:autoCloseQuickFix()
  let qllen = min([10, len(getqflist())])
  cclose
  if qllen
    execute 'cw' . qllen
    normal <C-W><C-W>
  endif
  redraw
endfunction

autocmd QuickFixCmdPost * :call s:autoCloseQuickFix()

" fugitive.vim
nnoremap <unique> gG :exec ':silent Ggrep ' . expand('<cword>')<CR>

" quickfix ‚ğ•Â‚¶‚é
nnoremap <unique> ec :cclose<CR>

" jptemplate.vim
let g:jpTemplateKey = '<Tab>'

" “K“–‚Èƒeƒ“ƒ|ƒ‰ƒŠƒtƒ@ƒCƒ‹‚Ìì¬
command! -nargs=0 NewTmp :new `=tempname().'.vim'`

" “K“–‚É CSS ‚ğ JS ‚Û‚­•ÏŠ·
function! CSSToJS(sLine, eLine)
  let prefix = ':'  . a:sLine . ',' . a:eLine  . 'substitute'
  let cmd = prefix . '/\v\-([a-z])/\u\1/g'
  silent execute cmd
  let cmd =  prefix . '/\v;?$/";'
  silent execute cmd
  let cmd = prefix . '/\v:\s*/ = "/'
  silent execute cmd
endfunction
command! -range CSSToJS :call CSSToJS(<line1>, <line2>)


noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
inoremap <silent> <expr> <C-e> (pumvisible() ? "\<C-e>" : "\<End>")
noremap! <C-d> <Del>

" {{{ QFixHowm.vim
let QFixHowm_Key = 'g'
if has('win32')
  let howm_dir             = 'c:/dropbox/My Dropbox/howm'
  let QFixHowm_MruFile     = 'c:/dropbox/My Dropbox/howm/.howm-mru'
else
  let howm_dir             = '~/Dropbox/howm'
  let QFixHowm_MruFile     = '~/Dropbox/howm/.howm-mru'
end
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_MruFileMax = 50
let QFixHowm_Title = '='
" let disable_MyQFix = 1

"ƒ^ƒCƒgƒ‹‚É‰½‚à‘‚©‚ê‚Ä‚¢‚È‚¢ê‡AƒGƒ“ƒgƒŠ“à‚©‚ç“K“–‚È•¶‚ğ’T‚µ‚Äİ’è‚·‚éB
""•¶š”‚Í”¼ŠpŠ·Z‚ÅÅ‘å QFixHowm_Replace_Title_len •¶š‚Ü‚Åg—p‚·‚éB0‚È‚ç‰½‚à‚µ‚È‚¢B
"let QFixHowm_Replace_Title_Len = 64

"‘ÎÛ‚É‚È‚é‚Ì‚Í QFixHowm_Replace_Title_Pattern
"‚Ì³‹K•\Œ»‚Éˆê’v‚·‚éƒ^ƒCƒgƒ‹ƒpƒ^[ƒ“B
""ƒfƒtƒHƒ‹ƒg‚Å‚ÍŸ‚Ì³‹K•\Œ»‚ªİ’è‚³‚ê‚Ä‚¢‚éB
"let QFixHowm_Replace_Title_Pattern = '^'.g:QFixHowm_Title.'\s*$'

"V‹KƒGƒ“ƒgƒŠ‚ÌÛA–{•¶‚©‚ç‘‚«n‚ß‚éB
"let QFixHowm_Cmd_New = "i".QFixHowm_Title." \<CR>\<C-r>=strftime(\"[%Y-%m-%d%H:%M]\")\<CR>\<CR>\<ESC>$"
"",C‚Å‘}“ü‚³‚ê‚éV‹KƒGƒ“ƒgƒŠ‚ÌƒRƒ}ƒ“ƒh
"let QFixHowm_Key_Cmd_C = "o<ESC>".QFixHowm_Cmd_New

" }}}

" omnifunc ‚ğ“K“–‚É—LŒø‰»
" if has("autocmd") && exists("+omnifunc")
"   autocmd Filetype *
"         \   if &omnifunc == "" |
"         \           setlocal omnifunc=syntaxcomplete#Complete |
"         \   endif
" endif

" noexpandtab ‚·‚éƒfƒBƒŒƒNƒgƒŠ‚ğw’è
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

" load ~/.vimrc.local
if filereadable(expand('$HOME/.vimrc.local'))
  source ~/.vimrc.local
endif

set number
nmap <ESC><ESC> :nohlsearch<CR><ESC>
autocmd InsertLeave,CmdwinLeave * set imdisable
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

highlight JpSpace cterm=none ctermbg=15 ctermfg=0
au BufRead,BufNew * match JpSpace /ã€€/

function StripTrailingWhitespaces()
  let pos = getpos(".")
  %s/\s\+$//e
  call setpos(".", pos)
endfunction
autocmd BufWritePre * :call StripTrailingWhitespaces()

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
