"configuracion personal de (neo)vim por David Londoño 
"Esta configuracion usa vim-plug como plugin mananger por lo que es necesario instalarlo primero

source ~/.config/nvim/config/plugInstall.vim

" "" ubicaciones de los ejecutables de python
" let g:python3_host_prog = '/usr/bin/env python3'

"-----Configuraciones varias-----
let g:ale_python_pylint_options = '--load-plugins pylint_django'
set clipboard+=unnamedplus

" Establecer numeros de linea
set number

set nowrap

" Establecer numeracion relativa
set relativenumber

" Establecer resaltador de sintaxis
syntax enable

" Establece el idioma a castellano
set spelllang=es

" resaltar el complemento de [] {} y ()
set showmatch

" mostrar los simbolos de markdown
set conceallevel=0

" barra izquierda expandida
set signcolumn=yes

" set tabs to have 4 spaces
set tabstop=4
"
" when using the >> or << commands, shift lines by 4 spacese
set shiftwidth=4

"-----Configuraciones de dart/flutter------
autocmd Filetype dart set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" show a visual line under the cursor's current line
set cursorline

" background transparente
hi Normal guibg=NONE ctermbg=NONE

" quitar linea del cursor
hi clear cursorLine

" Establecer resaltador de sintaxis
let python_highlight_all = 1

"---------Activar folding---------
"set foldmethod=indent 

"---------Activar mouse----------
set mouse=a

"nuevo split aparece debajo o a la derecha de la ventana anterio
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"------------ Remapeos -------------
"leader key = espacio
let mapleader = " "

"---------Terminal-----------
" abrir terminal a la derecha
nnoremap <leader>t :vs<CR> :terminal<CR>

"--------------- cerrar buffer------------
nnoremap <leader>e :bd <CR>

" --------- comandos con leder key.------

" guardar archivo
nnoremap <leader>w :w<CR>

" buscar place holder
nnoremap <leader>n /+@@+<CR>v3lc

" incertar place holder
nnoremap <leader>h a+@@+<Esc>

" nueva linea arriba sin insertmode
nnoremap <leader>o O<Esc>

" abrir zathura pdf 
nnoremap <leader>z :!zathura "%:r".pdf &<CR><CR>

" editar init.vim
nnoremap <leader>V :edit ~/.config/nvim/init.vim

nnoremap <leader>b <C-^>

" compilar R markdown
autocmd FileType rmd nnoremap <leader>r :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<enter><CR>

" compilar R markdown ('debug')
autocmd FileType rmd nnoremap <leader>q :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<space><enter>

source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/indent.vim
source ~/.config/nvim/config/snippets.vim
source ~/.config/nvim/config/cocConfig.vim
source ~/.config/nvim/config/colorScheme.vim
