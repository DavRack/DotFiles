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
" motor de snipets
Plug 'SirVer/ultisnips'
"proveedor de snippets
Plug 'honza/vim-snippets' 
" __________________________________
Plug 'KabbAmine/vCoolor.vim' " color picker

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'ryanoasis/vim-devicons'

Plug 'ap/vim-css-color'

Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 

Plug 'junegunn/fzf',{'do':'make sync'}
Plug 'junegunn/fzf.vim'

" GOLANG
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" syntax python
Plug 'sheerun/vim-polyglot'
" guias de identación
Plug 'nathanaelkane/vim-indent-guides'
"---------- LSP ----------
"
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
