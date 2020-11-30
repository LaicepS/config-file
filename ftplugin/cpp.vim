nnoremap <buffer> <leader>g :YcmCompleter GoTo<CR>
nnoremap <buffer> <leader>v :vsplit \| YcmCompleter GoTo<CR>
nnoremap <buffer> <leader>s :split \| YcmCompleter GoTo<CR>
nnoremap <buffer> <leader>r :YcmCompleter RefactorRename
nnoremap <buffer> <leader>b :make --no-print-directory -j$(nproc) -C /opt/home/users/dorian.haglund/build-backend/trunk/wambackend <CR>

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format-7/clang-format.py
endfunction
" autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

