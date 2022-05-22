-- currently using packer as a package manager for nvim
-- install packer if not installed
packerPath = os.getenv("HOME").."/.local/share/nvim/site/pack/packer/start/packer.nvim"
installCommand = string.format([[ test -d '%s' || git clone --depth 1 https://github.com/wbthomason/packer.nvim %s ]], packerPath, packerPath)
os.execute(installCommand)

-- packer config
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- color scheme
  use 'joshdick/onedark.vim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- fuzzy finder
  use {
  'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
			{'tpope/vim-fugitive'},
		}
	}

	-- change surround things
	use {'tpope/vim-surround'}

	-- help commenting things
	use {'tpope/vim-commentary'}

	-- show hex colors
	use {'ap/vim-css-color'}

	-- enable better languaje features treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use {'nvim-treesitter/nvim-treesitter-textobjects'}

	use {'ryanoasis/vim-devicons'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'kdheepak/tabline.nvim',
		requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}

end)
