command! -nargs=0 -bar OpenNgBuddyFile
      \ call myplugin#open_ng_buddy_file()

function! myplugin#open_ng_buddy_file() abort "{{{
  let l:file_ext = expand('%:e')
  if l:file_ext ==# 'js'
    let l:target = expand('%')
    let l:target = myplugin#get_view_file_name(l:target)
  elseif file_ext ==# 'jade'
    let l:target = expand('%')
    let l:target = myplugin#get_js_file_name(l:target)
  else
    echomsg 'Current file is not accepted file: ' . expand('%')
    return 0
  endif

  call myplugin#open_file(l:target)
endfunction"}}}

function! myplugin#get_view_file_name(target) abort "{{{
  let testfile = a:target
  let testfile = substitute(testfile, '\.controller.js$', '\.jade', '')
  let testfile = substitute(testfile, '\.directive.js$', '\.directive.jade', '')
  let testfile = substitute(testfile, '\.modal.js$', '\.modal.jade', '')
  return testfile
endfunction "}}}

function! myplugin#get_js_file_name(target) abort "{{{
  let testfile = a:target
  let testfile = substitute(testfile, '\.directive.jade$', '\.directive.js', '')
  let testfile = substitute(testfile, '\.modal.jade$', '\.modal.controller.js', '')
  let testfile = substitute(testfile, '\.jade$', '\.controller.js', '')
  return testfile
endfunction "}}}

function! myplugin#open_file(filepath) abort "{{{
  execute 'edit ' . a:filepath
endfunction "}}}
