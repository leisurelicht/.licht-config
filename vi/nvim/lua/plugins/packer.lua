-- =================
-- packer.lua --- packer file
-- Author: MuCheng
-- =================
--

local function initialize_packer()
	-- packer 未安装时自动安装
	local packer_bootstrap = false
	local ok, packer = pcall(require, "packer")
	if not ok then
		local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
			packer_bootstrap = vim.fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
		end
		ok, packer = pcall(require, "packer")
		if not ok then
			error("Failed To Load Packer At: [" .. install_path .. "]\n\n" .. packer)
		end
	end
	return packer, packer_bootstrap
end

local function auto_compile()
	-- 文件保存时自动更新插件信息
	local api = require("utils.api")
	local puc = api.augroup("packer_user_config", { clear = true })
	api.autocmd({ "BufWritePost" }, {
		pattern = { "init.lua" },
		callback = function()
			-- command = "source <afile> | PackerCompile",
			vim.cmd("source <afile>")
			vim.cmd("PackerCompile")
			vim.notify("Recompile Plugins Successfully...", "info")
		end,
		group = puc,
	})
end

local function register_keybindings()
	local map = require("utils.mapping")
	map.set("n", "<leader>Pi", "<CMD>PackerInstall<CR>", "Plugins Install")
	map.set("n", "<leader>Pu", "<CMD>PackerUpdate<CR>", "Plugins Update")
	map.set("n", "<leader>Pc", "<CMD>PackerClean<CR>", "Plugins Clean")
	map.set("n", "<leader>Ps", "<CMD>PackerStatus<CR>", "Plugins Status")
	map.set("n", "<leader>Py", "<CMD>PackerSync<CR>", "Plugins Sync")
	-- map.set("n", "<leader>Pl", "<CMD>Telescope packer<CR>", "Find Installed Plugins")
end

local M = {}

function M.register_plugins(install_plugins)
	local packer, packer_bootstrap = initialize_packer()

	-- packer.init({
	-- 	git = {
	-- 		-- default_url_format = "https://mirror.ghproxy.com/%s",
	-- 		-- default_url_format = "https://hub.fastgit.xyz/%s",
	-- 		-- default_url_format = "https://github.com/%s",
	--      -- default_url_format = "https://ghproxy.com/%s",
	--      -- default_url_format = "https://hub.fastgit.org/%s",
	--      -- default_url_format = "https://gitclone.com/%s",
	-- 	},
	-- })

	packer.startup({
		function(use)
			for plugin_name, plugin_config in pairs(install_plugins) do
				local plugin_options = vim.tbl_extend("force", { plugin_name }, plugin_config)
				if plugin_config.file ~= nil then
					plugin_options.config = string.format([[require("plugins.%s")]], plugin_config.file)
					plugin_options.file = nil
				end
				-- dump(plugin_options)
				use(plugin_options)
			end

			if packer_bootstrap then
				packer.sync()
			end
		end,
		config = { display = { open_fn = require("packer.util").float } },
	})

	auto_compile()
	register_keybindings()
end

return M
