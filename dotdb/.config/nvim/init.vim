"configuracion personal de (neo)vim por David Londoño 
"Esta configuracion usa vim-plug como plugin mananger por lo que es necesario instalarlo primero

source ~/.config/nvim/config/plugInstall.vim

"-----Configuraciones varias-----
set clipboard+=unnamedplus

set nowrap

" Establecer numeros de linea
set number

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

set hidden

set incsearch

set scrolloff=10

" indent when moving to the next line while writing code
set autoindent

set foldmethod=expr
set foldexpr=nvim_tresitter#foldexpr()

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
nnoremap <leader>x :bd<CR>

nnoremap <leader>u :bp<CR>
nnoremap <leader>i :bn<CR>

" --------- comandos con leder key.------

" guardar archivo
nnoremap <leader>w :w<CR>

" nueva linea arriba sin insertmode
nnoremap <leader>o O<Esc>

" abrir zathura pdf 
nnoremap <leader>z :!zathura "%:r".pdf &<CR><CR>

" editar init.vim
nnoremap <leader>V :edit ~/.config/nvim/init.vim

nnoremap <leader>b <C-^>

vnoremap <leader>p "_dP

set completeopt=menu,menuone,noselect

" compilar R markdown
autocmd FileType rmd nnoremap <leader>r :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<enter><CR>

" compilar R markdown ('debug')
autocmd FileType rmd nnoremap <leader>q :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<space><enter>

lua require("config.init")
" source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/indent.vim
source ~/.config/nvim/config/snippets.vim
source ~/.config/nvim/config/cocConfig.vim
source ~/.config/nvim/config/colorScheme.vim
source ~/.config/nvim/config/langs.vim

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

nnoremap <leader>a <cmd>Telescope find_files<cr>
nnoremap <leader>p :lua require('config.telescope').search_project()<cr>
nnoremap <leader>d :lua require('config.telescope').grep_reference()<cr>
nnoremap <leader><Space> :lua require('config.telescope').grep_project()<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>s <cmd>Telescope current_buffer_fuzzy_find<cr>
