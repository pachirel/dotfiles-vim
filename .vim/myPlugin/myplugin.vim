command! -nargs=0 -bar OpenNgBuddyFile
      \ call myplugin#open_ng_buddy_file()
command! -nargs=0 -bar OpenNgFile
      \ call myplugin#open_file_from_class_name()
command! -nargs=0 -bar NgI18n
      \ call myplugin#open_i18n_files()
command! -nargs=0 -bar OpenNgCurrentPath
      \ call myplugin#open_file_on_cursor()

function! myplugin#open_ng_buddy_file() abort "{{{
  let file_ext = expand('%:e')
  if file_ext ==# 'js'
    let target = expand('%')
    let target = myplugin#get_view_file_name(target)
  elseif file_ext ==# 'jade'
    let target = expand('%')
    let target = myplugin#get_js_file_name(target)
  else
    echomsg 'Current file is not accepted file: ' . expand('%')
    return 0
  endif

  call myplugin#open_file(target)
endfunction"}}}

function! myplugin#open_file_from_class_name() abort "{{{
  let wordUnderCursor = expand("<cword>")
  let filename = myplugin#snakecase(wordUnderCursor)
  let filepath = myplugin#get_module_file_path(filename)
  let componentFilepath = myplugin#get_component_file_path(filename)
  if filereadable(filepath)
    execute 'sp ' . filepath
  elseif filereadable(componentFilepath)
    execute 'sp ' . componentFilepath
  else
    echomsg 'Current filename is not accepted file: ' . componentFilepath
    return 0
  endif
endfunction"}}}

function! myplugin#get_module_file_path(filename)
  let filename = substitute(a:filename, '\(.\+\)_service$', '\1/\1\.service\.js', '')
  let filename = substitute(filename, '\(.\+\)_controller$', '\1/\1\.controller\.js', '')
  let filepath = getcwd() . '/app/shared/' . filename
  return filepath
endfunction"}}}

function! myplugin#get_component_file_path(filename)
  let filename = substitute(a:filename, '_service$', '\.service\.js', '')
  let filename = substitute(filename, '_controller$', '\.controller\.js', '')
  let filename = substitute(filename, 'soracom_api$', 'soracom_api\.service\.js', '')
  let filename = substitute(filename, '_modal', '\.modal', '')
  let filepath = getcwd() . '/app/shared/components/' . filename
  return filepath
endfunction"}}}

function! myplugin#get_view_file_name(target) abort "{{{
  let filepath = a:target
  let filepath = substitute(filepath, '\.controller\.js$', '\.jade', '')
  let filepath = substitute(filepath, '\.directive\.js$', '\.directive\.jade', '')
  let filepath = substitute(filepath, '\.modal\.js$', '\.modal\.jade', '')
  return filepath
endfunction "}}}

function! myplugin#get_js_file_name(target) abort "{{{
  let filepath = a:target
  let filepath = substitute(filepath, '\.directive\.jade$', '\.directive\.js', '')
  let filepath = substitute(filepath, '\.modal\.jade$', '\.modal\.controller\.js', '')
  let filepath = substitute(filepath, '\.jade$', '\.controller\.js', '')
  return filepath
endfunction "}}}

function! myplugin#open_file(filepath) abort "{{{
  execute 'rightb vsp ' . a:filepath
endfunction "}}}

function! myplugin#open_file_in_newtab(filepath) abort "{{{
  execute 'tabnew ' . a:filepath
endfunction "}}}

function! myplugin#open_i18n_files() abort "{{{
  execute 'tabnew ' . getcwd() . '/app/shared/assets/i18n/locale-ja.json'
  execute '1'
  execute 'rightb vsp ' . getcwd() . '/app/shared/assets/i18n/locale-en.json'
  execute '1'
  execute 'set scrollbind'
endfunction "}}}

function! myplugin#open_file_on_cursor() abort "{{{
  let filepath = expand('<cfile>')
  let filepath = 'app/shared/' . filepath
  call myplugin#open_file_in_newtab(filepath)
endfunction "}}}
""""""""""""""""""""""""""""""
""" Functions from abolish.vim
"""""""""""""""""""""""""""""

function! myplugin#camelcase(word)
  let word = substitute(a:word, '-', '_', 'g')
  if word !~# '_' && word =~# '\l'
    return substitute(word,'^.','\l&','')
  else
    return substitute(word,'\C\(_\)\=\(.\)','\=submatch(1)==""?tolower(submatch(2)) : toupper(submatch(2))','g')
  endif
endfunction

function! myplugin#snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  return word
endfunction

""""""""""""""""""""""""""""""
""" ^ Functions from abolish.vim
"""""""""""""""""""""""""""""
