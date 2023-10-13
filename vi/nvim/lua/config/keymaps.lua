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

map.del("n", "<leader>`")

map.del({ "n", "v" }, "<leader>cf")
map.lazy({ "n", "v" }, "<leader>cf", function()
  require("lazyvim.util").format({ force = true })
end, { desc = "Format" })

-- Lazy
map.del("n", "<leader>l")
map.del("n", "<leader>L")
map.set("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" }) -- lazy
map.set("n", "<leader>pL", Util.news.changelog, { desc = "LazyVim Changelog" }) -- LazyVim Changelog

-- Tabs
map.del("n", "<leader><tab>l")
map.del("n", "<leader><tab>f")
map.del("n", "<leader><tab><tab>")
map.del("n", "<leader><tab>]")
map.del("n", "<leader><tab>d")
map.del("n", "<leader><tab>[")
map.set("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader>ta", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map.set("n", "<leader>te", "<cmd>tab sb<cr>", { desc = "Copy Current Tab" })
map.set("n", "[t", "<cmd>tabp<cr>", { desc = "Previous Tab" })
map.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next Tab" })
map.set("n", "<leader>tP", "<cmd>-tabmove<cr>", { desc = "Move Forward" })
map.set("n", "<leader>tN", "<cmd>+tabmove<cr>", { desc = "Move Backward" })
-- Tab页快速切换
map.set("n", "<leader>t1", "1gt", { desc = "Tab 1" })
map.set("n", "<leader>t2", "2gt", { desc = "Tab 2" })
map.set("n", "<leader>t3", "3gt", { desc = "Tab 3" })
map.set("n", "<leader>t4", "4gt", { desc = "Tab 4" })
map.set("n", "<leader>t5", "5gt", { desc = "Tab 5" })
map.set("n", "<leader>t6", "6gt", { desc = "Tab 6" })
map.set("n", "<leader>t7", "7gt", { desc = "Tab 7" })
map.set("n", "<leader>t8", "8gt", { desc = "Tab 8" })

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
map.lazy("n", "<leader>1", "<cmd>1wincmd w<cr>", { desc = "Win 1" })
map.lazy("n", "<leader>2", "<cmd>2wincmd w<cr>", { desc = "Win 2" })
map.lazy("n", "<leader>3", "<cmd>3wincmd w<cr>", { desc = "Win 3" })
map.lazy("n", "<leader>4", "<cmd>4wincmd w<cr>", { desc = "Win 4" })
map.lazy("n", "<leader>5", "<cmd>5wincmd w<cr>", { desc = "Win 5" })
map.lazy("n", "<leader>6", "<cmd>6wincmd w<cr>", { desc = "Win 6" })
map.lazy("n", "<leader>7", "<cmd>7wincmd w<cr>", { desc = "Win 7" })
map.lazy("n", "<leader>8", "<cmd>8wincmd w<cr>", { desc = "Win 8" })
