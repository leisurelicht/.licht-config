local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use {
    "neovim/nvim-lspconfig", -- lsp
    config = function()
      require("plugins_dev.lsp-config")
    end
  }

  use {
    "williamboman/nvim-lsp-installer", -- lsp server install
    config = function()
      require("plugins_dev.lsp-install")
    end,
  }

  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require("plugins_dev.lspsaga")
    end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
