
"configuracion personal de vim por David Londoño
"
"Esta configuracion usa vim-plug como plugin mananger
"
"por lo que es necesario instalarlo primero
"
"en la consola correr los siguientes comandos:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"

"-----Todos los plugins de vim-plug-----
call plug#begin()

"----------Plugins----------

Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree'

Plug 'chiel92/vim-autoformat'

Plug 'Valloric/YouCompleteMe'

Plug 'neomake/neomake'

Plug 'tell-k/vim-autopep8'

Plug 'scrooloose/syntastic'

Plug 'joonty/vdebug'
"----------Temas----------
Plug 'hzchirs/vim-material'

Plug 'joshdick/onedark.vim'

call plug#end()


"----------Temas en uso----------
colorscheme onedark

let g:airline_theme='onedark'


"-----Configuraciones varias-----
set number

set relativenumber

syntax enable

"-----Configuraciones de python-----

let python_highlight_all = 1

" set tabs to have 4 spaces
set tabstop=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
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

"-----Auto iniciar NERDTree-----
autocmd VimEnter * NERDTree

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
