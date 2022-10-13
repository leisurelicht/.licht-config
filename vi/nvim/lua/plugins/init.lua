-- =================
-- init.lua --- plugins init file
-- Author: MuCheng
-- =================
--
local install_plugins = {
	--[[
	=====================================
	 -------------- basic --------------
	=====================================
	--]]
	-- https://github.com/octaltree/cmp-look
	["wbthomason/packer.nvim"] = {}, -- package manager
	["lewis6991/impatient.nvim"] = { -- speed up startup
		config = function()
			require("impatient")
		end,
	},
	["nathom/filetype.nvim"] = { -- speed up startup
		config = function()
			require("filetype").setup({})
		end,
	},
	--[[
    =====================================
    ------------- Depend --------------
    =====================================
    --]]
	["nvim-lua/plenary.nvim"] = { after = { "impatient.nvim" } }, --
	["kyazdani42/nvim-web-devicons"] = { after = { "impatient.nvim" } }, -- icons
	--[[
    =====================================
    ---------- Core function ----------
    =====================================
    --]]
	["rcarriga/nvim-notify"] = { file = "notify" }, -- fancy notification message
	["folke/which-key.nvim"] = { file = "which-key" }, -- 快捷键提示
	["windwp/nvim-autopairs"] = { file = "autopairs" }, -- 自动配对括号
	["brglng/vim-im-select"] = { file = "vim-im-select" }, -- 输入法切换
	["kyazdani42/nvim-tree.lua"] = { file = "nvim-tree" }, -- 文件树
	["karb94/neoscroll.nvim"] = { -- 流畅滚动
		file = "neoscroll",
		event = { "VimEnter" },
	},
	--[[
    =====================================
     -------------- 美化 ---------------
    =====================================
    --]]
	-- ["catppuccin/nvim"] = { -- 主题
	-- 	as = "catppuccin",
	-- 	file = "theme",
	-- },
    -- ["shaunsingh/nord.nvim"] = {
    --     file = "theme",
    -- },
    ["EdenEast/nightfox.nvim"] = {
        file = "theme",
    },
	["nvim-lualine/lualine.nvim"] = { -- statusline 美化
		file = "lualine",
		after = { "gitsigns.nvim" },
	}, -- 状态栏
    ["nanozuki/tabby.nvim"] = { -- tabline
        file = "tabby",
		event = { "BufEnter" },
    },
	-- ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete" } }, -- buffer 删除
	-- ["akinsho/bufferline.nvim"] = { -- buffer 美化
	-- 	file = "bufferline",
	-- 	after = "bufdelete.nvim",
	-- 	event = { "BufEnter" },
	-- },
	["goolord/alpha-nvim"] = { -- dashboard
		file = "alpha-nvim",
		after = { "nvim-web-devicons" },
	},
	--[[
    ====================================
    ---- Language Server Protocol ----
    ====================================
    --]]
	["neovim/nvim-lspconfig"] = {
		after = { "impatient.nvim" },
	},
	["williamboman/nvim-lsp-installer"] = {
		file = "lsp",
		after = { "nvim-lspconfig" },
	},
	["ray-x/lsp_signature.nvim"] = {
		file = "lsp_signature",
		after = { "nvim-lspconfig" },
	},
	["tami5/lspsaga.nvim"] = {
		file = "lsp_lspsaga",
		after = { "nvim-lspconfig" },
	},
	["kosayoda/nvim-lightbulb"] = {
		file = "lsp_lightbulb",
		after = { "nvim-lspconfig" },
	},
	["j-hui/fidget.nvim"] = {
		config = function()
			require("fidget").setup({
				window = { blend = 0 },
			})
		end,
		after = { "nvim-lspconfig" },
	},
	["jose-elias-alvarez/null-ls.nvim"] = { -- 语法检查及格式化
		file = "lsp_null-ls",
		after = { "plenary.nvim", "nvim-lspconfig" },
	},
	["simrat39/symbols-outline.nvim"] = { -- 代码结构树
		file = "lsp_symbols-outline",
		after = { "nvim-lspconfig" },
	},
	--[[
	=====================================
	--------- Code Completion ---------
	=====================================
	--]]
	["github/copilot.vim"] = {},

	["onsails/lspkind-nvim"] = {}, -- lspkind 补全界面美化
	["lukas-reineke/cmp-under-comparator"] = {}, -- 优化补全列表排序
	["hrsh7th/cmp-nvim-lsp"] = {},
	["hrsh7th/cmp-buffer"] = {},
	["hrsh7th/cmp-path"] = {},
	["hrsh7th/cmp-cmdline"] = {},
	["f3fora/cmp-spell"] = {},
	["andersevenrud/cmp-tmux"] = {},
	["octaltree/cmp-look"] = {},
	["hrsh7th/cmp-nvim-lua"] = {},
	["tzachar/cmp-tabnine"] = { run = "./install.sh" },
	["hrsh7th/cmp-copilot"] = {},
	["hrsh7th/nvim-cmp"] = {
		file = "lsp_cmp",
		after = { "nvim-autopairs" },
	},
	["rafamadriz/friendly-snippets"] = {},
	["hrsh7th/cmp-vsnip"] = { after = "nvim-cmp" },
	["hrsh7th/vim-vsnip"] = { after = "friendly-snippets" },
	--[[
	=====================================
	----------- Fuzzy lookup ----------
	=====================================
	]]
	["tami5/sqlite.lua"] = {},
	["AckslD/nvim-neoclip.lua"] = { -- 粘贴板
		file = "neoclip",
		after = { "sqlite.lua" },
	},
	["ahmedkhalf/project.nvim"] = { file = "project" },
	["nvim-telescope/telescope.nvim"] = { -- 搜索
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-frecency.nvim" },
			-- { "nvim-telescope/telescope-project.nvim" },
			-- { "axieax/urlview.nvim" },
		},
		file = "telescope",
		after = { "plenary.nvim", "sqlite.lua", "nvim-neoclip.lua", "project.nvim" },
	},
	--[[
	--=====================================
	------- Debug Adapter Protocol ------
	--=====================================
	----]]
	["mfussenegger/nvim-dap"] = { -- 代码调试
		file = "dap",
		after = { "impatient.nvim" },
		event = { "BufRead", "BufNewFile" },
	},
	["theHamsta/nvim-dap-virtual-text"] = { -- 为代码调试提供内联文本
		file = "dap-virtual-text",
		after = { "nvim-dap" },
	},
	["rcarriga/nvim-dap-ui"] = { -- 为代码调试提供 UI 界面
		file = "dap-ui",
		after = { "nvim-dap" },
	},
	----[[
	--=====================================
	-------------- code 增强 ------------
	--=====================================
	----]]
	["JoosepAlviste/nvim-ts-context-commentstring"] = { -- Provides context-based commenting behavior for Comment
		event = { "BufRead", "BufNewFile" },
	},
	["p00f/nvim-ts-rainbow"] = { -- 彩虹括号
		event = { "BufRead", "BufNewFile" },
	},
	["andymass/vim-matchup"] = {
		file = "matchup",
	},
	["RRethy/nvim-treesitter-endwise"] = {},
	["nvim-treesitter/nvim-treesitter"] = { -- nvim-treesitter 代码高亮
		file = "treesitter",
        run = ':TSUpdate',
        --[[ run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, ]]
		--[[ after = { "nvim-ts-rainbow", "nvim-ts-context-commentstring", "vim-matchup", "nvim-treesitter-endwise" }, ]]
	},
	["lewis6991/gitsigns.nvim"] = { -- git 显示
		requires = { "f-person/git-blame.nvim" },
		file = "git",
	},
	["numToStr/Comment.nvim"] = { -- 智能注释
		file = "comment",
		event = { "BufRead", "BufNewFile" },
		after = { "nvim-ts-context-commentstring" },
	},
	["lukas-reineke/indent-blankline.nvim"] = { -- 高亮缩进
		file = "indent",
		event = { "BufRead", "BufNewFile" },
	},
	["tpope/vim-surround"] = { -- 快速修改
		event = { "BufRead", "BufNewFile" },
	},
	["vim-scripts/indentpython.vim"] = { -- python indent
		ft = { "python", "djangohtml" },
	},
	["ellisonleao/glow.nvim"] = { -- markdown 预览
		file = "glow",
		ft = { "markdown" },
	},
	--[[
	=====================================
	 ----------- Vim Enhance -----------
	=====================================
	--]]
	["phaazon/hop.nvim"] = { -- 快速跳转
		file = "hop",
		event = { "BufRead", "BufNewFile" },
	},
	["kevinhwang91/nvim-hlslens"] = { -- 搜索时显示条目
		file = "hlslens",
		event = { "CmdlineEnter" },
	},
	["ethanholz/nvim-lastplace"] = { -- 最后修改位置
		file = "lastplace",
	},
	["nacro90/numb.nvim"] = { -- 数字跳转增强
		file = "numb",
		event = { "CmdlineEnter" },
	},
	["itchyny/vim-cursorword"] = {
		event = { "BufRead", "BufNewFile" },
		-- ft = {"lua", "python", "go"},
	},
    ["akinsho/toggleterm.nvim"] = { -- 浮窗终端
		file = "toggleterm",
		-- cmd = { "ToggleTerm" },
	},
	--[[
	=====================================
	 -------------- Others -------------
	=====================================
	--]]
	["mbbill/undotree"] = { -- undotree
		file = "undotree",
	},
	["folke/todo-comments.nvim"] = { -- todo 标记
		file = "todo",
		event = { "BufRead", "BufNewFile" },
	},
	["lewis6991/spellsitter.nvim"] = { -- 拼写检查
		file = "spellsitter",
		after = "nvim-treesitter",
	},
	["beauwilliams/focus.nvim"] = { -- 动态分屏调整
		file = "focus",
	},
	["mrjones2014/smart-splits.nvim"] = { -- 智能分屏调整
		file = "smart-splits",
		cmd = { "FocusDisable" },
		after = { "focus.nvim" },
	},
	["norcalli/nvim-colorizer.lua"] = { -- 颜色显示
		config = function()
			require("colorizer").setup()
		end,
	},
	["uga-rosa/translate.nvim"] = { -- 翻译
		file = "translate",
		cmd = { "CmdlineEnter" },
	},
	--[[
	=====================================
	 ------------ Sometimes ------------
	=====================================
	--]]
	["dstein64/vim-startuptime"] = { -- 启动时间统计
		cmd = { "StartupTime" },
	},
	["yianwillis/vimcdoc"] = { -- 中文vim
		event = { "BufRead", "BufNewFile" },
	},
	["windwp/nvim-spectre"] = { -- 搜索替换 TODO
	    file = "spectre",
	    after = { "plenary.nvim" },
	},
}

require("plugins.packer").register_plugins(install_plugins)
