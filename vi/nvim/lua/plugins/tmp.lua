-- bufferline buffer美化
use({
	"akinsho/bufferline.nvim",
	config = function()
		require("plugins.bufferline")
	end,
	event = { "BufEnter" },
})
use({
	"famiu/bufdelete.nvim",
	cmd = { "Bdelete" },
})
-- Git
use({
	"",
	requires = { "f-person/git-blame.nvim" },
	config = function()
		require("plugins.git")
	end,
	after = { "nvim-treesitter" },
})
-- lualine 状态栏美化
use({
	"",
	config = function()
		require("plugins.lualine")
	end,
	after = { "gitsigns.nvim" },
})
-- nvim-autopairs 自动配对括号
use({
	"windwp/nvim-autopairs",
	config = function()
		require("plugins.nvim-autopairs")
	end,
})
--[[
        =====================================
         ----------- Fuzzy lookup ----------
        =====================================
        --]]
-- 搜索插件
use({
	"nvim-telescope/telescope.nvim",
	requires = {
		{ "nvim-telescope/telescope-packer.nvim" },
	},
	config = function()
		require("plugins.telescope")
	end,
	after = { "plenary.nvim" },
})
-- 粘贴板
use({
	"AckslD/nvim-neoclip.lua",
	requires = {
		{ "tami5/sqlite.lua", module = "sqlite" },
	},
	config = function()
		require("plugins.nvim-neoclip")
	end,
})
--[[
        ====================================
         ---- Language Server Protocol ----
        ====================================
        --]]
-- lsp
use({
	"neovim/nvim-lspconfig", -- lsp
})
-- null_ls
use({
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		require("plugins.lsp.null-ls")
	end,
	after = { "plenary.nvim" },
})
use({
	"williamboman/nvim-lsp-installer", -- lsp server install
	config = function()
		require("plugins.lsp.nvim-lsp")
	end,
	after = { "nvim-lspconfig" },
})
-- lsp 进度可视化
use({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			window = { blend = 0 },
		})
	end,
	after = { "nvim-lspconfig" },
})
-- 参数提示
use({
	"ray-x/lsp_signature.nvim",
	config = function()
		require("plugins.lsp.signature")
	end,
	after = { "nvim-lspconfig" },
})
use({
	"tami5/lspsaga.nvim",
	config = function()
		require("plugins.lsp.lspsaga")
	end,
	after = { "nvim-lspconfig" },
})
-- 小灯泡
use({
	"kosayoda/nvim-lightbulb",
	config = function()
		require("plugins.lsp.lightbulb")
	end,
	after = { "nvim-lspconfig" },
})
--[[
        =====================================
         --------- Code Completion ---------
        =====================================
        --]]
-- nvim-cmp 代码补全
use({
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.lsp.nvim-cmp")
	end,
	after = { "nvim-autopairs" },
})
use({
	"onsails/lspkind-nvim", -- lspkind 补全界面美化
})
use({
	"lukas-reineke/cmp-under-comparator", -- 优化补全列表排序
})
use({
	"hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
	"hrsh7th/cmp-buffer", -- { name = 'buffer' },
	"hrsh7th/cmp-path", -- { name = 'path' }
	"hrsh7th/cmp-cmdline", -- { name = 'cmdline' }
	"octaltree/cmp-look", -- { name = 'look' }
	"hrsh7th/cmp-nvim-lua", -- { name = 'nvim-lua' }
	"andersevenrud/cmp-tmux", -- { name = 'tmux'}
	"f3fora/cmp-spell", -- { name = 'spell' }
	{ "tzachar/cmp-tabnine", run = "./install.sh" }, -- { name = "tabline" }
	-- vsnip 代码片段补全
	"hrsh7th/cmp-vsnip", -- { name = 'vsnip' }
	"hrsh7th/vim-vsnip", -- VSCode(LSP)'s snippet feature in vim
	"rafamadriz/friendly-snippets", -- 代码片段
	after = { "nvim-cmp" },
})
--[[
        =====================================
         ----- Debug Adapter Protocol ------
        =====================================
        --]]
-- dap
use({
	"mfussenegger/nvim-dap",
	config = function()
		require("plugins.dap.nvim-dap")
	end,
	after = { "impatient.nvim" },
})
-- 为代码调试提供内联文本
use({
	"theHamsta/nvim-dap-virtual-text",
	requires = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("plugins.dap.nvim-dap-virtual-text")
	end,
	after = { "nvim-dap" },
})
-- 为代码调试提供 UI 界面
use({
	"rcarriga/nvim-dap-ui",
	requires = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("plugins.dap.nvim-dap-ui")
	end,
	after = { "nvim-dap" },
})
--[[
        =====================================
         ------------ code 增强 ------------
        =====================================
        --]]
-- 智能注释
use({
	"numToStr/Comment.nvim",
	requires = "JoosepAlviste/nvim-ts-context-commentstring",
	config = function()
		require("plugins.comment")
	end,
	event = { "BufRead", "BufNewFile" },
})
-- 代码结构树
use({
	"simrat39/symbols-outline.nvim",
	config = function()
		require("plugins.symbols-outline")
	end,
	after = { "nvim-lspconfig" },
})
-- markdown 预览
use({
	"ellisonleao/glow.nvim",
	ft = { "markdown" },
	config = function()
		require("plugins.glow")
	end,
})
-- python indent
use({ "vim-scripts/indentpython.vim", ft = { "python", "djangohtml" } })
-- modern go neovim plugin
-- use({
-- 	"ray-x/go.nvim",
-- 	config = function()
-- 		require("plugins.go")
-- 	end,
--           ft = {"go"},
-- 	after = { "nvim-cmp" },
-- })
--[[
        =====================================
         ---------- Other function ---------
        =====================================
        --]]
-- dashboard
use({
	"goolord/alpha-nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("plugins.alpha-nvim")
	end,
})
-- 浮窗终端
use({
	"akinsho/toggleterm.nvim",
	config = function()
		require("plugins.toggleterm")
	end,
})
-- indent
use({
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("plugins.indent")
	end,
	event = { "BufRead", "BufNewFile" },
})
-- surround 快速修改
-- cs : 修改包裹
-- ds : 删除包裹
-- ys : 增加包裹
use({
	"tpope/vim-surround",
	event = { "BufRead", "BufNewFile" },
})
-- 搜索时显示条目
use({
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("plugins.hlslens")
	end,
})
-- 多光标
-- use {
--   "mg979/vim-visual-multi",
--   config = function()
--     require("plugins.multi")
--   end
-- }
-- 快速跳转
use({
	"phaazon/hop.nvim",
	config = function()
		require("plugins.hop")
	end,
})
-- 拼写检查
use({
	"lewis6991/spellsitter.nvim",
	config = function()
		require("plugins.spellsitter")
	end,
})
-- 最后编辑位置保存
use({
	"ethanholz/nvim-lastplace",
	config = function()
		require("plugins.lastplace")
	end,
})
-- 16进制颜色展示
use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
})
-- todo
use({
	"folke/todo-comments.nvim",
	config = function()
		require("plugins.todo")
	end,
	event = { "BufRead, BufNewFile" },
})
-- 启动时间统计
use({
	"dstein64/vim-startuptime",
	cmd = { "StartupTime" },
	after = { "impatient.nvim" },
})
-- 输入法自动切换
use({
	"brglng/vim-im-select",
	config = function()
		require("plugins.vim-im-select")
	end,
})
-- 平滑翻页
use({
	"karb94/neoscroll.nvim",
	event = "VimEnter",
	config = function()
		require("plugins.neoscroll")
	end,
})
-- 中文文档
use({
	"yianwillis/vimcdoc",
	event = { "BufRead", "BufNewFile" },
	after = { "impatient.nvim" },
})
-- 分屏
use({
	"beauwilliams/focus.nvim",
	config = function()
		require("plugins.focus")
	end,
})
-- ui
use({
	"stevearc/dressing.nvim",
	config = function()
		require("plugins.dressing")
	end,
})
-- smart split
use({
	"mrjones2014/smart-splits.nvim",
	config = function()
		require("plugins.smart-splits")
	end,
}
