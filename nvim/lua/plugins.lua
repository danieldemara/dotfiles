-- Autoconfigure packer as a package manager
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
  -- Package manager
  use({"wbthomason/packer.nvim"})

  -- Fuzzy Finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} },
    config = require("config.telescope")
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })

  -- Better Syntax Highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require("config.treesitter"),
  }

  -- Language Server
  use({"neovim/nvim-lspconfig"})

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = require("config.cmp"),
  })

  -- Snippets
  use({"L3MON4D3/LuaSnip"})
  use({"saadparwaiz1/cmp_luasnip"})

  -- Colorscheme
  use({"arcticicestudio/nord-vim"})

  -- Highlight Current Word
  use({"RRethy/vim-illuminate"})

  -- Status Bar
  use ({
    "nvim-lualine/lualine.nvim",
    config = require("config.lualine"),
  })
  use({"kyazdani42/nvim-web-devicons"})

  -- File Tree
  use({"kyazdani42/nvim-tree.lua"})

  -- Linter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = require("config.null-ls"),
  })

  use ({"lewis6991/gitsigns.nvim"})

  if packer_bootstrap then
    require('packer').sync()
  end
end)

