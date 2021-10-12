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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'tpope/vim-fugitive'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" __________________________________
Plug 'KabbAmine/vCoolor.vim' " color picker

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

Plug 'ryanoasis/vim-devicons'

Plug 'ap/vim-css-color'

Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary' 


" GOLANG
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" " syntax python
" Plug 'sheerun/vim-polyglot'
" guias de identación
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
