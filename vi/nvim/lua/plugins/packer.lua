-- =================
-- packer.lua --- packer file
-- Author: MuCheng
-- =================
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
local startup = packer.startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- 通知
    use {
      'rcarriga/nvim-notify'
      -- config = function() require("plugins.notify") end
    }

    -- 中文文档
    use "yianwillis/vimcdoc"

    -- 主题皮肤
    use {
      "navarasu/onedark.nvim",
      requires = {'rktjmp/lush.nvim', opt = true},
      config = function() require("plugins.theme") end
    }

    -- nvim-treesitter 代码高亮
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {"p00f/nvim-ts-rainbow"},
      config = function() require("plugins.nvim-treesitter") end
    }

    -- which-key 快捷键提示
    use {
      'folke/which-key.nvim',
      config = function() require("plugins.which-key") end
    }

    -- nvim-tree 文件树
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icon
      },
      config = function() require("plugins.nvim-tree") end
    }

    -- 智能注释
    use {
      'numToStr/Comment.nvim',
      requires = "JoosepAlviste/nvim-ts-context-commentstring",
      config = function() require("plugins.comment") end
    }

    -- nvim-autopairs 自动配对括号
    use {
      "windwp/nvim-autopairs",
      config = function() require("plugins.nvim-autopairs") end
    }

    -- bufferline buffer美化
    use {
      'akinsho/bufferline.nvim',
      requires = {"famiu/bufdelete.nvim"},
      config = function() require("plugins.bufferline") end
    }

    -- tabline
    -- use {
    --   'kdheepak/tabline.nvim',
    --   requires = {
    --     {'hoob3rt/lualine.nvim', opt = true},
    --     {'kyazdani42/nvim-web-devicons', opt = true}
    --   },
    --   config = function() require("plugins.tabline") end
    -- }

    -- use 'moll/vim-bbye'

    -- lualine 状态栏美化
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = function() require("plugins.lualine") end
    }

    -- 代码结构树
    use {
      "simrat39/symbols-outline.nvim",
      config = function() require("plugins.symbols-outline") end
    }

    -- 搜索插件
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
        {"nvim-telescope/telescope-packer.nvim"}
      },
      config = function() require("plugins.telescope") end
    }

    -- dashboard
    use {
      'goolord/alpha-nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require("plugins.alpha-nvim") end
    }

    -- marks
    -- use 'chentau/marks.nvim'

    -- 优化filetype
    use {
      "nathom/filetype.nvim",
      config = function() require("filetype").setup {} end
    }

    -- 优化插件加载
    use {
      'lewis6991/impatient.nvim',
      config = function() require("impatient") end
    }

    -- markdown 预览
    use {
      "ellisonleao/glow.nvim",
      ft = {"markdown"},
      config = function() require("plugins.glow") end
    }

    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"f-person/git-blame.nvim"},
      config = function() require("plugins.git") end
    }

    -- 浮窗终端
    use {
      "akinsho/toggleterm.nvim",
      config = function() require("plugins.toggleterm") end
    }

    -- indent
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function() require("plugins.indent") end
    }

    -- surround 快速修改
    -- cs : 修改包裹
    -- ds : 删除包裹
    -- ys : 增加包裹
    use "tpope/vim-surround"

    -- 搜索时显示条目
    use {
      "kevinhwang91/nvim-hlslens",
      config = function() require("plugins.hlslens") end
    }

    -- 多光标
    use {
      'mg979/vim-visual-multi',
      config = function() require("plugins.multi") end
    }

    -- 快速跳转
    use {"phaazon/hop.nvim", config = function() require("plugins.hop") end}

    -- 拼写检查
    use {
      "lewis6991/spellsitter.nvim",
      config = function() require("plugins.spellsitter") end
    }

    -- 最后编辑位置保存
    use {
      "ethanholz/nvim-lastplace",
      config = function() require("plugins.lastplace") end
    }

    -- 16进制颜色展示
    use {
      "norcalli/nvim-colorizer.lua",
      config = function() require("colorizer").setup() end
    }

    -- undo tree
    use {"mbbill/undotree", config = function() require("plugins.undotree") end}

    -- todo
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("plugins.todo") end
    }

    use "dstein64/vim-startuptime"

    -- ale
    use {"dense-analysis/ale", config = function() require("plugins.ale") end}

    -- lsp
    use {
      "neovim/nvim-lspconfig", -- lsp
      "williamboman/nvim-lsp-installer" -- lsp server install
    }

    -- nvim-cmp 代码补全
    use {
      'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
      'hrsh7th/cmp-buffer', -- { name = 'buffer' },
      'hrsh7th/cmp-path', -- { name = 'path' }
      'hrsh7th/cmp-cmdline', -- { name = 'cmdline' }
      'hrsh7th/cmp-nvim-lsp-signature-help', -- { name = 'nvim_lsp_signature_help' }
      'octaltree/cmp-look', -- { name = 'look' }
      'hrsh7th/cmp-nvim-lua', -- { name = 'nvim-lua' }
      'andersevenrud/cmp-tmux', -- { name = 'tmux'}
      'hrsh7th/nvim-cmp'
    }

    -- vsnip 代码片段补全
    use {
      'hrsh7th/cmp-vsnip', -- { name = 'vsnip' }
      'hrsh7th/vim-vsnip', -- VSCode(LSP)'s snippet feature in vim
      'rafamadriz/friendly-snippets' -- 代码片段
    }

    -- lspkind 补全界面美化
    use 'onsails/lspkind-nvim'

    -- code 增强

    -- python indent
    use {"vim-scripts/indentpython.vim", ft = {"python", "djangohtml"}}

    -- modern go neovim plugin
    -- use 'ray-x/go.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then require('packer').sync() end
  end,
  config = {display = {open_fn = require("packer.util").float}}
})

-- 文件保存时自动更新插件信息
local puc = vim.api.nvim_create_augroup("packer_user_config", {clear = true})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"packer.lua"},
  command = "source <afile> | PackerCompile",
  group = puc
})

local wk = require("which-key")
wk.register({
  P = {
    name = "+插件管理",
    i = {"<CMD>PackerInstall<CR>", "Install Plugins"},
    u = {"<CMD>PackerUpdate<CR>", "Update Plugins"},
    c = {"<CMD>PackerClean<CR>", "Clean Plugins"},
    s = {"<CMD>PackerStatus<CR>", "Show Plugins Status"},
    y = {"<CMD>PackerSync<CR>", "Sync Plugins"}
  }
}, {prefix = "<leader>"})

return startup
