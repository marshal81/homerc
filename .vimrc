":colo default
colo darkblue
":set autoindent
":set smartindent
":set shiftwidth=4
set number

let g:clang_complete_auto = 1
let g:clang_use_library = 1
"let g:clang_library_path = "/opt/local/lib"
let g:clang_library_path = '/usr/local/lib'

set tabstop=4
set shiftwidth=3
set smarttab
"set expandtab "
set softtabstop=3 "4
"set autoindent
set smartindent
set nowrap

"set cursorline
set shellcmdflag=-ic
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

augroup filetype
au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END


"imap <tab> <c-x><c-u>
set hlsearch

augroup filetype
au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END
