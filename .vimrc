
" Source users vimrc
so ~/.vimrc

map <C-h> :w<CR>:!mkdir -p %:p:h/html/ && pandoc %:p --mathml -o %:p:h/html/%:t:r.html && open %:p:h/html/%:t:r.html<CR>
map <C-p> :w<CR>:!mkdir -p %:p:h/pdf/ && pandoc %:p -o %:p:h/pdf/%:t:r.pdf && open %:p:h/pdf/%:t:r.pdf<CR>


