-- =================
after = {"nvim-lspconfig"}
-- packer.lua --- packer file
-- Author: MuCheng
-- =================
-- packer 未安装时自动安装
local ok, packer = pcall(require, "packer")
if not ok then
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap =
      fn.system(
      {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
      }
    )
  else
    vim.notify("Packer Is Broken. Please Remove File :" .. install_path)
  end
  return
end

vim.cmd [[packadd packer.nvim]]
local startup =
  packer.startup(
  {
    function(use)
      -- Packer can manage itself
      use "wbthomason/packer.nvim"

      -- 优化插件加载
      use {
        "lewis6991/impatient.nvim",
        config = function()
          require("impatient")
        end
      }

      -- 优化filetype
      use {
        "nathom/filetype.nvim",
        config = function()
          require("filetype").setup {}
        end,
        after = {"impatient.nvim"}
      }

      -- 图标
      use {
        "kyazdani42/nvim-web-devicons",
        after = {"impatient.nvim"}
      }

      -- 通知
      use {
        "rcarriga/nvim-notify",
        config = function()
          require("plugins.notify")
        end
      }

      -- 中文文档
      use {
        "yianwillis/vimcdoc",
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
      }

      -- 主题皮肤
      -- use {
      --   "navarasu/onedark.nvim",
      --   requires = {"rktjmp/lush.nvim", opt = true},
      --   config = function()
      --     require("plugins.theme")
      --   end
      -- }

      -- 主题皮肤2
      use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("plugins.theme")
        end
      }

      -- nvim-treesitter 代码高亮
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {"p00f/nvim-ts-rainbow"},
        config = function()
          require("plugins.nvim-treesitter")
        end
      }

      -- Git
      use {
        "lewis6991/gitsigns.nvim",
        requires = {"f-person/git-blame.nvim"},
        config = function()
          require("plugins.git")
        end,
        after = {"nvim-treesitter", "plenary.nvim"}
      }

      -- lualine 状态栏美化
      use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
          require("plugins.lualine")
        end,
        after = {"gitsigns.nvim"}
      }

      -- which-key 快捷键提示
      use {
        "folke/which-key.nvim",
        config = function()
          require("plugins.which-key")
        end
      }

      -- nvim-tree 文件树
      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
          "kyazdani42/nvim-web-devicons" -- optional, for file icon
        },
        config = function()
          require("plugins.nvim-tree")
        end
      }

      -- 智能注释
      use {
        "numToStr/Comment.nvim",
        requires = "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("plugins.comment")
        end,
        event = {"BufRead", "BufNewFile"}
      }

      -- nvim-autopairs 自动配对括号
      use {
        "windwp/nvim-autopairs",
        config = function()
          require("plugins.nvim-autopairs")
        end
      }

      -- bufferline buffer美化
      use {
        "akinsho/bufferline.nvim",
        requires = {"famiu/bufdelete.nvim"},
        config = function()
          require("plugins.bufferline")
        end,
        event = {"BufRead", "BufNewFile"}
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

      -- 代码结构树
      use {
        "simrat39/symbols-outline.nvim",
        config = function()
          require("plugins.symbols-outline")
        end
      }

      -- 搜索插件
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          {"nvim-lua/plenary.nvim"},
          {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
          {"nvim-telescope/telescope-packer.nvim"}
        },
        config = function()
          require("plugins.telescope")
        end
      }

      -- dashboard
      use {
        "goolord/alpha-nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("plugins.alpha-nvim")
        end
      }

      -- marks
      -- use 'chentau/marks.nvim'

      -- markdown 预览
      use {
        "ellisonleao/glow.nvim",
        ft = {"markdown"},
        config = function()
          require("plugins.glow")
        end
      }

      -- 浮窗终端
      use {
        "akinsho/toggleterm.nvim",
        config = function()
          require("plugins.toggleterm")
        end
      }

      -- indent
      use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
          require("plugins.indent")
        end,
        event = {"BufRead", "BufNewFile"}
      }

      -- surround 快速修改
      -- cs : 修改包裹
      -- ds : 删除包裹
      -- ys : 增加包裹
      use {
        "tpope/vim-surround",
        event = {"BufRead", "BufNewFile"}
      }

      -- 搜索时显示条目
      use {
        "kevinhwang91/nvim-hlslens",
        config = function()
          require("plugins.hlslens")
        end
      }

      -- 多光标
      use {
        "mg979/vim-visual-multi",
        config = function()
          require("plugins.multi")
        end
      }

      -- 快速跳转
      use {
        "phaazon/hop.nvim",
        config = function()
          require("plugins.hop")
        end
      }

      -- 拼写检查
      use {
        "lewis6991/spellsitter.nvim",
        config = function()
          require("plugins.spellsitter")
        end
      }

      -- 最后编辑位置保存
      use {
        "ethanholz/nvim-lastplace",
        config = function()
          require("plugins.lastplace")
        end
      }

      -- 16进制颜色展示
      use {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup()
        end
      }

      -- undo tree
      -- use {"mbbill/undotree", config = function() require("plugins.undotree") end}

      -- todo
      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("plugins.todo")
        end,
        event = {"BufRead, BufNewFile"}
      }

      -- 启动时间统计
      use {
        "dstein64/vim-startuptime",
        cmd = {"StartupTime"},
        after = {"impatient.nvim"}
      }

      -- 输入法自动切换
      use {
        "brglng/vim-im-select",
        config = function()
          require("plugins.vim-im-select")
        end
      }

      -- lsp
      use {
        "neovim/nvim-lspconfig", -- lsp
        config = function()
          require("plugins.lsp.lsp-config")
        end
      }

      use {
        "williamboman/nvim-lsp-installer", -- lsp server install
        config = function()
          require("plugins.lsp.nvim-lsp-install")
        end,
        after = {"nvim-lspconfig"}
      }

      use {
        "tami5/lspsaga.nvim",
        config = function()
          require("plugins.lsp.lspsaga")
        end,
        after = {"nvim-lspconfig"}
      }

      -- lsp 进度可视化
      use {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup(
            {
              window = {blend = 0}
            }
          )
        end,
        after = {"nvim-lspconfig"}
      }

      -- 参数提示
      use {
        "ray-x/lsp_signature.nvim",
        config = function()
          require("plugins.lsp.signature")
        end,
        after = {"nvim-lspconfig"}
      }

      -- 小灯泡
      use {
        "kosayoda/nvim-lightbulb",
        config = function()
          require("plugins.lsp.lightbulb")
        end,
        after = {"nvim-lspconfig"}
      }

      -- nvim-cmp 代码补全
      use {
        "hrsh7th/nvim-cmp",
        requires = {
          -- 代码补全插件
          "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
          "hrsh7th/cmp-buffer", -- { name = 'buffer' },
          "hrsh7th/cmp-path", -- { name = 'path' }
          "hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
          "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }
          "octaltree/cmp-look", -- { name = 'look' }
          "hrsh7th/cmp-nvim-lua", -- { name = 'nvim-lua' }
          "andersevenrud/cmp-tmux", -- { name = 'tmux'}
          "f3fora/cmp-spell", -- { name = 'spell' }
          {"tzachar/cmp-tabnine", run = "./install.sh"}, -- { name = "tabline" }
          "lukas-reineke/cmp-under-comparator", -- 优化补全列表排序
          -- vsnip 代码片段补全
          "hrsh7th/cmp-vsnip", -- { name = 'vsnip' }
          "hrsh7th/vim-vsnip", -- VSCode(LSP)'s snippet feature in vim
          "rafamadriz/friendly-snippets", -- 代码片段
          "onsails/lspkind-nvim" -- lspkind 补全界面美化
        },
        config = function()
          require("plugins.lsp.nvim-cmp")
        end
      }

      -- nvim-lint
      use {
        "mfussenegger/nvim-lint",
        config = function()
          require("plugins.nvim-lint")
        end
      }

      -- neoformat
      use {
        "sbdchd/neoformat",
        config = function()
          require("plugins.neoformat")
        end
      }

      -- 代码调试插件
      --
      -- dap
      use {
        "mfussenegger/nvim-dap",
        config = function()
          require("plugins.dap.nvim-dap")
        end,
        after = {"impatient.nvim"}
      }

      -- 为代码调试提供内联文本
      use {
        "theHamsta/nvim-dap-virtual-text",
        requires = {
          "mfussenegger/nvim-dap"
        },
        config = function()
          require("plugins.dap.nvim-dap-virtual-text")
        end,
        after = {"nvim-dap"}
      }

      -- 为代码调试提供 UI 界面
      use {
        "rcarriga/nvim-dap-ui",
        requires = {
          "mfussenegger/nvim-dap"
        },
        config = function()
          require("plugins.dap.nvim-dap-ui")
        end,
        after = {"nvim-dap"}
      }

      -- code 增强 --
      --
      -- python indent
      use {"vim-scripts/indentpython.vim", ft = {"python", "djangohtml"}}

      -- modern go neovim plugin
      -- use 'ray-x/go.nvim'

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if Packer_bootstrap then
        require("packer").sync()
      end
    end,
    config = {display = {open_fn = require("packer.util").float}}
  }
)

-- 文件保存时自动更新插件信息
local api = require("utils.api")
local puc = api.augroup("packer_user_config", {clear = true})
api.autocmd(
  {"BufWritePost"},
  {
    pattern = {"packer.lua"},
    command = "source <afile> | PackerCompile",
    group = puc
  }
)

local wk = require("which-key")
wk.register(
  {
    P = {
      name = "+插件管理",
      i = {"<CMD>PackerInstall<CR>", "Install Plugins"},
      u = {"<CMD>PackerUpdate<CR>", "Update Plugins"},
      c = {"<CMD>PackerClean<CR>", "Clean Plugins"},
      s = {"<CMD>PackerStatus<CR>", "Show Plugins Status"},
      y = {"<CMD>PackerSync<CR>", "Sync Plugins"}
    }
  },
  {prefix = "<leader>"}
)

return startup
