"configuracion personal de vim por David Londoño 
"Esta configuracion usa vim-plug como plugin mananger por lo que es necesario instalarlo primero

"Instalacion de vim-plug
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
    
"-----Todos los plugins de vim-plug-----
call plug#begin() 

"----------Plugins----------

Plug 'bling/vim-airline' " barra de estatus y de tabs
" ________ coc.nvim ___________
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" __________________________________

"_________ snipets ____________
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets' "proveedor de snippets
" __________________________________
Plug 'KabbAmine/vCoolor.vim' " color picker

Plug 'scrooloose/nerdtree' " arbol de archivos

Plug 'chiel92/vim-autoformat' " auto formatea codigo

Plug 'tell-k/vim-autopep8' " auto formato para python

Plug 'tpope/vim-surround' " permite cambiar lo que rodea un objeto de texto: 'test' -> (test)

Plug 'w0rp/ale' " resaltador de sintaxis

"---------- LSP ----------
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"----------Temas----------
Plug 'hzchirs/vim-material'

Plug 'joshdick/onedark.vim'

call plug#end()
" auto instalar extenciones COC
let g:coc_global_extensions = ['coc-tsserver', 'coc-python', 'coc-json', 'coc-html','coc-css','coc-go','coc-tabnine','coc-rls','coc-xml','coc-texlab','coc-sh','coc-markdownlint']
" ubicaciones de los ejecutables de python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
"----------Temas en uso----------
colorscheme onedark " tema de neovim

let g:airline_theme='onedark' " tema de la barra inferior y superior

let g:airline#extensions#tabline#enabled = 1 " Activar airline

"-----Configuraciones varias-----

" Establecer numeros de linea
set number

" Establecer numeracion relativa
set relativenumber

" Establecer resaltador de sintaxis
syntax enable

" Establece el idioma a castellano
set spelllang=es

" mostrar los simbolos de markdown
let g:indentLine_setConceal = 0
set conceallevel=0


" barra izquierda expandida
set signcolumn=yes
"-----Configuraciones de python-----

" Establecer resaltador de sintaxis
let python_highlight_all = 1

" set tabs to have 4 spaces
set tabstop=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spacese
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

"---------Activar folding---------
set foldmethod=indent 

"---------Activar mouse----------
set mouse=a

"-----Autoformatear mapeado a f3 y f8-----
noremap <F3> :Autoformat<CR>

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"------------ Remapeos personales -------------
"leader key = espacio
let mapleader = " "

"--------------- snipets con leader key---------

" matematica latex en markdown
nnoremap <leader>m i$$<Left>

" nueva clase
nnoremap <leader>l i---<CR>author: David Londoño Montoya<CR>title: +@@+<CR>date: "`r Sys.Date()`"<CR>lang: es-ES<CR>output: <CR>    pdf_document:<CR>    number_sections: false<CR>toc: true<CR><Esc>0i---<CR>\tableofcontents<CR><CR>+@@+<Esc>gg

" bloque de texto
nnoremap <leader>c i```{}<CR>```<Esc>k$i

" Definicion en notas
nnoremap <leader>d i### Definicion: **<Left>

" Ejemplo en notas
nnoremap <leader>e i**Ejemplo:** 

" Solucion en notas
nnoremap <leader>s i**Solucion:** 

" Propiedades en notas
nnoremap <leader>p i**Propiedades:**<Return><Return> 1. 

" --------- comandos con leder key.------

" buscar place holder
nnoremap <leader><Space> /+@@+<CR>v3lc

" tachar punto de lista
nnoremap <leader>t la~~<Esc>$a~~<Esc>

" incertar place holder
nnoremap <leader>h a+@@+<Esc>

" desresaltar palabras buscadas
nnoremap <leader>H :noh<CR>

" guardar 
nnoremap <leader>S :w<CR>

" nueva linea arriba sin insertmode
nnoremap <leader>O O<Esc>

" nueva linea abajo sin insetmode
nnoremap <leader><Return> o<Esc>

" abrir zathura pdf 
nnoremap <leader>z :!zathura "%:r".pdf &<CR><CR>

" editar init.vim
nnoremap <leader>V :edit ~/.config/nvim/init.vim

" compilar R markdown
autocmd FileType rmd nnoremap <leader>r :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<enter><CR>

" compilar R markdown ('debug')
autocmd FileType rmd nnoremap <leader>q :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>-q<space>--vanilla<space><enter>
" -------- funciones personales --------

" compilar c

function! Comp()
    exe "normal :w<CR>"
    exe "normal :!gcc %"
endfunction 
