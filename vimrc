" support the synax
syn on

"common conf {{
" automatic indent
set ai
set showmatch
set bs=2
" always show status bar
set laststatus=2
" insert space characters when the tab key is pressed
" use ctrl+v+tab to enter a real tab
set expandtab
" control the number of space characters that will be inserted when the tab key
" is pressed
set tabstop=4
" control the number of space characters inserted for indentation
set shiftwidth=4
"set cursorline

" ignorecase when searching
set ignorecase
" highlight match when searching
set hls
" code folding
set foldmethod=syntax
" use mouse
"set mouse=a
"}}

" set encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8

"key_map conf {{
" use ctrl+t to start NERDTree
map <C-t> :NERDTreeToggle<CR>
"}}

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

execute pathogen#infect()
call pathogen#helptags()
