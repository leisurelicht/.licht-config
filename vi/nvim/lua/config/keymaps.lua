-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local map = require("utils.map")

map.set("n", "<localleader>", "<cmd>WhichKey<cr>", { desc = "Which key" })

map.lazy("n", "<leader>cu", "viwUe", { desc = "Upper Word" })
map.lazy("n", "<leader>cl", "viwue", { desc = "Lower Word" })
map.lazy("n", "<leader>co", "wb~ea<esc>", { desc = "Upper First Word" })
map.lazy("i", "<C-u>", "<esc>viwUea", { desc = "Upper Word" }) -- 一键大写
map.lazy("i", "<C-l>", "<esc>viwuea", { desc = "Lower Word" }) -- 一键小写
map.lazy("i", "<C-o>", "<esc>wb~ea", { desc = "Upper First Word" }) -- 首字母大写
--
map.del("n", "<leader>`")
-- Format

-- Lazy
map.del("n", "<leader>l")
map.del("n", "<leader>L")
map.set("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
map.set("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
map.set("n", "<leader>pL", Util.news.changelog, { desc = "Changelog [LazyVim]" })
map.set("n", "<leader>pe", "<cmd>LazyExtras<CR>", { desc = "Extras Manager - [LazyVim]" })
map.set("n", "<leader>pi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
map.set("n", "<leader>pr", Util.root.info, { desc = "Root Info [LazyVim]" })
map.set("n", "<leader>pe", vim.cmd.messages, { desc = "Display messages" })
-- Term
map.del("n", "<leader>ft")
map.del("n", "<leader>fT")
map.del("n", "<C-/>")
map.del("n", "<c-_>")
-- Tabs
map.set("n", "<leader><tab>p", "<leader><tab>[", { desc = "Previous Tab ", remap = true })
map.set("n", "<leader><tab>n", "<leader><tab>]", { desc = "Next Tab", remap = true })
-- Tab页快速切换
map.set("n", "<leader><tab>1", "1gt", { desc = "Tab 1" })
map.set("n", "<leader><tab>2", "2gt", { desc = "Tab 2" })
map.set("n", "<leader><tab>3", "3gt", { desc = "Tab 3" })
map.set("n", "<leader><tab>4", "4gt", { desc = "Tab 4" })
-- Windows
map.del("n", "<leader>w|")
map.del("n", "<leader>w-")
map.del("n", "<leader>wd")
map.del("n", "<leader>ww")
map.del("n", "<leader>-")
map.del("n", "<leader>|")
map.lazy("n", "<leader>_", "<C-W>s", { desc = "Split Window Below", remap = true })
map.lazy("n", "<leader>|", "<C-W>v", { desc = "Split Window Below", remap = true })
map.lazy("n", "<leader>wh", "<cmd>vertical leftabove sbuffer<cr>", { desc = "Split To Left" })
map.lazy("n", "<leader>wl", "<cmd>vertical rightbelow sbuffer<cr>", { desc = "Split To Right" })
map.lazy("n", "<leader>wk", "<cmd>horizontal aboveleft sbuffer<cr>", { desc = "Split To Above" })
map.lazy("n", "<leader>wj", "<cmd>horizontal belowright sbuffer<cr>", { desc = "Split To Below" })
map.lazy("n", "<leader>wy", "<cmd>vertical topleft sbuffer<cr>", { desc = "Split To Far Left" })
map.lazy("n", "<leader>wo", "<cmd>vertical botright sbuffer<cr>", { desc = "Split To Far Right" })
map.lazy("n", "<leader>wi", "<cmd>horizontal topleft sbuffer<cr>", { desc = "Split To Top" })
map.lazy("n", "<leader>wu", "<cmd>horizontal botright sbuffer<cr>", { desc = "Split To Bottom" })
map.lazy("n", "<leader>wd", "<C-w>c", { desc = "Close Current Window" }) -- 关闭当前分屏
map.lazy("n", "<leader>wc", "<C-w>o", { desc = "Close Other Window" }) -- 关闭其他分屏
-- Buffer
map.del("n", "<leader>bb")
-- windows
map.lazy2("n", "<leader>1", "<cmd>1wincmd w<cr>", { desc = "Win 1" })
map.lazy2("n", "<leader>2", "<cmd>2wincmd w<cr>", { desc = "Win 2" })
map.lazy2("n", "<leader>3", "<cmd>3wincmd w<cr>", { desc = "Win 3" })
map.lazy2("n", "<leader>4", "<cmd>4wincmd w<cr>", { desc = "Win 4" })
map.lazy2("n", "<leader>5", "<cmd>5wincmd w<cr>", { desc = "Win 5" })
map.lazy2("n", "<leader>6", "<cmd>6wincmd w<cr>", { desc = "Win 6" })
map.lazy2("n", "<leader>7", "<cmd>7wincmd w<cr>", { desc = "Win 7" })
map.lazy2("n", "<leader>8", "<cmd>8wincmd w<cr>", { desc = "Win 8" })
