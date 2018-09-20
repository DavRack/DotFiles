"configuracion personal de vim por David Londoño 
"Esta configuracion usa vim-plug como plugin mananger por lo que es necesario instalarlo primero
"en la consola correr los siguientes comandos:
"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
"-----Todos los plugins de vim-plug-----
call plug#begin()

"----------Plugins----------
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'Yggdroot/indentLine'

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'chiel92/vim-autoformat'

Plug 'Valloric/YouCompleteMe'

Plug 'tell-k/vim-autopep8'

Plug 'tpope/vim-surround'

Plug 'w0rp/ale'

Plug 'joonty/vdebug'

Plug 'jamshedvesuna/vim-markdown-preview'
"----------Temas----------
Plug 'hzchirs/vim-material'

Plug 'joshdick/onedark.vim'

call plug#end()


"----------Temas en uso----------
colorscheme onedark

let g:airline_theme='onedark'

let g:airline#extensions#tabline#enabled = 1

"-----Configuraciones varias-----
set number

set relativenumber

syntax enable

set spelllang=es

"-----Configuraciones de python-----

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

"---------Activar deoplete-------
let g:deoplete#enable_at_startup = 1

"-----Autoformatear mapeado a f3 y f8-----
noremap <F3> :Autoformat<CR>

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"-----Configuraciones de syntastic----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"------------ Remapeos personales -------------
"leader key
let mapleader = " "

"--------------- snipets con leader key---------
"(minisculas)

" matematica latex en markdown
nnoremap <leader>m i$$<Left>

" nueva clase
nnoremap <leader>l i---<CR>author: David Londoño Montoya<CR>title: Clase x+1 siendo x la Última clase<CR>date: "`r Sys.Date()`"<CR>output: pdf_document<CR>number_sections: true<CR>---<CR>\tableofcontents<CR><CR>

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
"(mayusculas)

" buscar place holder
nnoremap <leader><Space> /+@@+<CR>

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

" editar init.vim
nnoremap <leader>V :edit ~/.config/nvim/init.vim

" compilar R markdown
nnoremap <leader>r :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter><CR>

nnoremap <leader>q :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" -------- funciones personales --------

" compilar c

function! Comp()
    exe "normal :w<CR>"
    exe "normal :!gcc %"
endfunction 
