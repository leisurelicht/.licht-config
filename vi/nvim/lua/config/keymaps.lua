-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
local map = require("utils.map")

map.del("n", "<leader>`")

map.lazy("n", "<leader>cu", "viwUe", "Upper Word")
map.lazy("n", "<leader>cl", "viwue", "Lower Word")
map.lazy("n", "<leader>co", "wb~ea<esc>", "Upper First Word")
map.lazy("i", "<C-u>", "<esc>viwUea", "Upper Word") -- 一键大写
map.lazy("i", "<C-l>", "<esc>viwuea", "Lower Word") -- 一键小写
map.lazy("i", "<C-o>", "<esc>wb~ea", "Upper First Word") -- 首字母大写
-- Lazy
map.del("n", "<leader>l")
map.del("n", "<leader>L")
map.set("n", "<leader>pl", "<cmd>Lazy<cr>", "Lazy") -- lazy
map.set("n", "<leader>pc", Util.changelog, "LazyVim Changelog") -- LazyVim Changelog

-- Tabs
map.del("n", "<leader><tab>l")
map.del("n", "<leader><tab>f")
map.del("n", "<leader><tab><tab>")
map.del("n", "<leader><tab>]")
map.del("n", "<leader><tab>d")
map.del("n", "<leader><tab>[")
map.set("n", "<leader>tl", "<cmd>tablast<cr>", "Last Tab")
map.set("n", "<leader>tf", "<cmd>tabfirst<cr>", "First Tab")
map.set("n", "<leader>ta", "<cmd>tabnew<cr>", "New Tab")
map.set("n", "<leader>tn", "<cmd>tabnext<cr>", "Next Tab")
map.set("n", "<leader>td", "<cmd>tabclose<cr>", "Close Tab")
map.set("n", "<leader>tp", "<cmd>tabprevious<cr>", "Previous Tab")
map.set("n", "<leader>te", "<cmd>tab sb<cr>", "Copy Current Tab")
map.set("n", "[t", "<cmd>tabp<cr>", "Previous Tab")
map.set("n", "]t", "<cmd>tabn<cr>", "Next Tab")
map.set("n", "<leader>tP", "<cmd>-tabmove<cr>", "Move Forward")
map.set("n", "<leader>tN", "<cmd>+tabmove<cr>", "Move Backward")
-- Tab页快速切换
map.set("n", "<leader>t1", "1gt", "Tab 1")
map.set("n", "<leader>t2", "2gt", "Tab 2")
map.set("n", "<leader>t3", "3gt", "Tab 3")
map.set("n", "<leader>t4", "4gt", "Tab 4")
map.set("n", "<leader>t5", "5gt", "Tab 5")
map.set("n", "<leader>t6", "6gt", "Tab 6")
map.set("n", "<leader>t7", "7gt", "Tab 7")
map.set("n", "<leader>t8", "8gt", "Tab 8")

-- Windows
map.del("n", "<leader>w|")
map.del("n", "<leader>w-")
map.del("n", "<leader>wd")
map.del("n", "<leader>ww")
map.del("n", "<leader>-")
map.del("n", "<leader>|")
map.lazy("n", "<leader>wh", "<cmd>vertical leftabove sbuffer<cr>", "Split To Left")
map.lazy("n", "<leader>wl", "<cmd>vertical rightbelow sbuffer<cr>", "Split To Right")
map.lazy("n", "<leader>wk", "<cmd>horizontal aboveleft sbuffer<cr>", "Split To Above")
map.lazy("n", "<leader>wj", "<cmd>horizontal belowright sbuffer<cr>", "Split To Below")
map.lazy("n", "<leader>wy", "<cmd>vertical topleft sbuffer<cr>", "Split To Far Left")
map.lazy("n", "<leader>wo", "<cmd>vertical botright sbuffer<cr>", "Split To Far Right")
map.lazy("n", "<leader>wi", "<cmd>horizontal topleft sbuffer<cr>", "Split To Top")
map.lazy("n", "<leader>wu", "<cmd>horizontal botright sbuffer<cr>", "Split To Bottom")
map.lazy("n", "<leader>wd", "<C-w>c", "Close Current Window") -- 关闭当前分屏
map.lazy("n", "<leader>wc", "<C-w>o", "Close Other Window") -- 关闭其他分屏

-- Buffer
map.del("n", "<leader>bb")
map.lazy("n", "<leader>bb", "<cmd>e #<cr>", "Switch To Other Buffer")
