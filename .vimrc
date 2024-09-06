source ~/.vundlerc
syntax on
set paste
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" see filename in footer
set statusline+=%F
" ignore case in searches
set ignorecase
set smartcase
" highlight searched text
set hlsearch

"cscope 
 " Use the C-Space word as the search criterion
 map <silent> <F5>   :cs add cscope.out<CR><CR>
 map os :cs find s <C-R><C-W><CR>
 map oc :cs find c <C-R><C-W><CR>
 map og :cs find g <C-R><C-W><CR>
 map od :cs find d <C-R><C-W><CR>
 map oe :cs find e <C-R><C-W><CR>
 map of :cs find f <C-R><C-W><CR>
 map oi :cs find i <C-R><C-W><CR>
 map ot :cs find t <C-R><C-W><CR>

"toggle prev and cur tab
"au TabLeave * let g:lasttab = tabpagenr()
"nnoremap <silent> <``> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <``> :exe "tabn ".g:lasttab<cr>
