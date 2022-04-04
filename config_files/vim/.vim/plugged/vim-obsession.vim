Plug 'tpope/vim-obsession'

let g:session_dir = '~/.vim/plugged/vim-sessions'

exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'
nnoremap <Leader>sp :Obsession<CR>
