local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]


packer.startup(function(use)

  -- Color schemes
  use { "ellisonleao/gruvbox.nvim" } -- Theme

  -- Utility
  use 'nvim-lua/plenary.nvim' -- Lua functions
  use 'nvim-telescope/telescope.nvim' -- Fuzzy file-finder
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    "lazytanuki/nvim-mapper",
    before = "telescope.nvim"
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- tree-sitter interface

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind.nvim' -- Pictograms for autocompletion
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for in-built LSP
  use 'hrsh7th/cmp-buffer' -- source for buffer
  use 'hrsh7th/cmp-path' -- Form filepaths
  use 'L3MON4D3/LuaSnip' -- snippet engine

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'


  -- Formatters
  use 'jose-elias-alvarez/null-ls.nvim' -- Set nvim as LSP
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for nvim
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'

  -- Looks
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = false } }
  use { 'akinsho/bufferline.nvim' }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
