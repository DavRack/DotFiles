"configuracion personal de (neo)vim por David Londoño 
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"__________ lang suport for Dart (flutter)
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'tiagofumo/dart-vim-flutter-layout'
"_________ snipets ____________
"dependencias para vim-snipmate
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'

" motor de snipets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "proveedor de snippets
" __________________________________
Plug 'KabbAmine/vCoolor.vim' " color picker

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'scrooloose/nerdtree' " arbol de archivos
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'

Plug 'tpope/vim-surround' " permite cambiar lo que rodea un objeto de texto: 'test' -> (test)
Plug 'tpope/vim-commentary' 

Plug 'w0rp/ale' " resaltador de sintaxis

Plug 'junegunn/fzf' "buscador de archivos
Plug 'junegunn/fzf.vim' "buscador de archivos

" guias de identación
Plug 'yggdroot/indentLine'
"---------- LSP ----------
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"----------Temas----------
Plug 'joshdick/onedark.vim'

call plug#end()
""auto instalar extenciones COC
let g:coc_global_extensions = ['coc-tsserver', 'coc-python', 'coc-json', 'coc-html', 'coc-css','coc-go','coc-rls','coc-texlab','coc-sh','coc-markdownlint','coc-flutter']
"" ubicaciones de los ejecutables de python
let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python2'
"----------Temas de color----------
"activar fonts para que airline funcione
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1 " Activar airline

colorscheme onedark " tema de neovim

"usar onedark en modo de 256 colores
let g:onedark_termcolors=256

let g:airline_theme='onedark' " tema de la barra inferior y superior


"-----Configuraciones varias-----
"activar guias de identacíon
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_char_list = ['|','┊']
" flutter snippets
autocmd BufRead,BufNewFile,BufEnter *.dart UltiSnipsAddFiletypes dart-flutter
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set clipboard+=unnamedplus

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
"let g:indentLine_setConceal = 0

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

"-----Configuraciones de python-----

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
set foldmethod=indent 

"---------Activar mouse----------
set mouse=a

"---------fzf------------------
"formas de abrir archivo con fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
"---------Splits-------------
"
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
nnoremap <leader>f :NERDTreeToggle<CR>
" buscar archivo con fzf en el dirctorio actual
nnoremap <leader><Space> :FZF<CR>

" buscar archivo con fzf en home
nnoremap <leader>s :FZF ~<CR>

" buscar archivo con fzf en home
nnoremap <leader>w :w<CR>

" buscar place holder
nnoremap <leader>n /+@@+<CR>v3lc

" incertar place holder
nnoremap <leader>h a+@@+<Esc>

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
