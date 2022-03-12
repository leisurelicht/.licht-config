-- =================
-- packer.lua --- packer file
-- Author: MuCheng
-- =================
--
-- packer 未安装时自动安装
local ok, packer = pcall(require, "packer")
if not ok then
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  else
    print("Packer Is Broken. Please Remove File In:"..install_path)
  end
  return
end

vim.cmd [[packadd packer.nvim]]
local startup = packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 主题皮肤
  use {
    'ellisonleao/gruvbox.nvim',
    requires = {
      'rktjmp/lush.nvim'
    },
  }

  use 'ful1e5/onedark.nvim'
  -- use 'shaunsingh/nord.nvim'
  -- use 'glepnir/zephyr-nvim'
  
  -- which-key 快捷键提示
  use {
  "folke/which-key.nvim",
  -- config = function()
  --   require("which-key").setup {}
  -- end
  }

  -- nvim-tree 文件树
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  -- 智能注释
  use {
    'numToStr/Comment.nvim',
    -- config = function()
    --     require('Comment').setup()
    -- end
  }
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- nvim-autopairs 自动配对括号
  use 'windwp/nvim-autopairs'

  -- bufferline buffer美化
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- lualine 状态栏美化
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 
      'kyazdani42/nvim-web-devicons', 
      opt = true,
    }
  }

  -- tabline
  use {
    'kdheepak/tabline.nvim',
    requires = { 
      { 'hoob3rt/lualine.nvim', opt=true }, 
      {'kyazdani42/nvim-web-devicons', opt = true},
    }
  }

  use 'simrat39/symbols-outline.nvim'

  -- nvim-treesitter 代码高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- dashboard
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = require("plugins.alpha-nvim").setup
  -- }

  --
  -- -- startify
  -- use {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --       require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end
  -- }
  --
  --
  -- -- lsp
  -- use {
  --   'neovim/nvim-lspconfig', 
  --   'williamboman/nvim-lsp-installer',
  -- }
  -- 
  -- -- nvim-cmp
  -- use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  -- use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  -- use 'hrsh7th/cmp-path'     -- { name = 'path' }
  -- use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  -- -- vsnip
  -- use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  -- use 'hrsh7th/vim-vsnip'
  -- use 'rafamadriz/friendly-snippets'
  -- -- lspkind
  -- use 'onsails/lspkind-nvim'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- 文件保存时自动更新插件
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua echom "Sync Plugins..." | source <afile> | PackerCompile
  augroup end
]])

nmap = {
  P = {
    name = "+Packer",
    i = {"<CMD>PakcerInstall<CR>", "Install Plugins"},
    u = {"<CMD>PakcerUpdate<CR>", "Update Plugins"},
    c = {"<CMD>PakcerClean<CR>", "Clean Plugins"},
    s = {"<CMD>PakcerStatus<CR>", "Show Plugins Status"},
    y = {"<CMD>PakcerSync<CR>", "Sync Plugins"},
  }
}

tableMerge(WhichKeyMap.maps.normal, nmap)

return startup
