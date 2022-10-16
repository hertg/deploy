" split navigation
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" split create/close
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>wq <C-w>q

" split rotate
nnoremap <leader>wr <C-w>r

" split move and fill
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L

" split resize
nnoremap <leader>Wh <C-w>5<
nnoremap <leader>Wj <C-w>5-
nnoremap <leader>Wk <C-w>5+
nnoremap <leader>Wl <C-w>5>

" split terminal
nnoremap <leader>wt :terminal<CR>:resize 12<CR>:set winfixheight<CR>

" ranger
nnoremap <leader>f :NvimTreeFocus<CR>

" search
nnoremap <leader>s /

" shortcuts
nnoremap <leader>qq :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qwa :qwa<CR>
nnoremap <leader>qw :wq<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wa :wa<CR>

" paste without losing the register
xnoremap("<leader>p", "\"_dP")

" terminal
tnoremap <Esc> <C-\><C-n> " close terminal with Esc
