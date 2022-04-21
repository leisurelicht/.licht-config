-- =================
-- packer.lua --- packer file
-- Author: MuCheng
-- =================
--
-- packer 未安装时自动安装
local ok, packer = pcall(require, "packer")
if not ok then
  local fn = vim.fn
  local install_path = fn.stdpath('data') ..
                           '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
  else
    vim.notify("Packer Is Broken. Please Remove File :" .. install_path)
  end
  return
end

vim.cmd [[packadd packer.nvim]]
local startup = packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 通知
  use 'rcarriga/nvim-notify'

  -- 主题皮肤
  use {
    'navarasu/onedark.nvim',
    'shaunsingh/nord.nvim',
    requires = {'rktjmp/lush.nvim', opt = true},
  }

  -- nvim-treesitter 代码高亮
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}


  -- which-key 快捷键提示
  use 'folke/which-key.nvim'

  -- nvim-tree 文件树
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons' -- optional, for file icon
    }
  }

  -- 智能注释
  use 'numToStr/Comment.nvim'
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- nvim-autopairs 自动配对括号
  use 'windwp/nvim-autopairs'

  -- bufferline buffer美化
  -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- tabline
  use {
    'kdheepak/tabline.nvim',
    requires = {
      {'hoob3rt/lualine.nvim', opt = true},
      {'kyazdani42/nvim-web-devicons', opt = true}
    }
  }
  -- use 'moll/vim-bbye'

  -- lualine 状态栏美化
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- 代码结构树
  use 'simrat39/symbols-outline.nvim'


  -- 搜索插件
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    }
  }
  use "nvim-telescope/telescope-packer.nvim"

  -- dashboard
  use {'goolord/alpha-nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- marks
  -- use 'chentau/marks.nvim'

  -- 优化filetype
  use "nathom/filetype.nvim"

  -- 优化插件加载
  use {
    'lewis6991/impatient.nvim',
    config = function() require("impatient") end,
  }

  -- markdown 预览
  use "ellisonleao/glow.nvim"

  -- Git
  -- use 'tpope/vim-fugitive'
  use 'f-person/git-blame.nvim'
  use 'lewis6991/gitsigns.nvim'

  -- 浮窗终端
  use "akinsho/toggleterm.nvim"

  -- indent
  use "lukas-reineke/indent-blankline.nvim"

  -- surround 快速修改
  use "tpope/vim-surround"

  -- ale
  -- use "dense-analysis/ale"

  -- python indent
  use "vim-scripts/indentpython.vim"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- nvim-cmp 代码补全
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
  use 'hrsh7th/cmp-path' -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- { name = 'nvim_lsp_signature_help' }
  use 'octaltree/cmp-look' -- { name = 'look' }
  use 'hrsh7th/cmp-nvim-lua' -- { name = 'nvim-lua' }
  use 'andersevenrud/cmp-tmux' -- { name = 'tmux'}
  use 'hrsh7th/nvim-cmp'

  -- -- vsnip 代码片段补全
  use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- use 'saadparwaiz1/cmp_luasnip'

  -- lspkind 补全界面美化
  use 'onsails/lspkind-nvim'

  -- modern go neovim plugin
  -- use 'ray-x/go.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if Packer_bootstrap then require('packer').sync() end
end)

-- 文件保存时自动更新插件信息
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local nmap = {
  P = {
    name = "+插件管理",
    i = {"<CMD>PackerInstall<CR>", "Install Plugins"},
    u = {"<CMD>PackerUpdate<CR>", "Update Plugins"},
    c = {"<CMD>PackerClean<CR>", "Clean Plugins"},
    s = {"<CMD>PackerStatus<CR>", "Show Plugins Status"},
    y = {"<CMD>PackerSync<CR>", "Sync Plugins"}
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

return startup
