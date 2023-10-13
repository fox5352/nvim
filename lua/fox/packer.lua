-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --[[
  -- telescope a highly extendable fuzzy finder over lists. 
  -- Built on the latest awesome features from neovim core. 
  -- Telescope is centered around modularity, allowing for easy customization.
  --]]--
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --[[
  -- rose pine theme
  --]]--

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine-main')
	  end
  })

  --[[
  -- treesitter
  --]]--
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  --[[
  -- harppon
  --]]--
  use('nvim-lua/plenary.nvim')
  use('ThePrimeagen/harpoon')

  -- undo tree
  use("mbbill/undotree")

  -- vim-fugitive"
  use("tpope/vim-fugitive")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

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

end)
