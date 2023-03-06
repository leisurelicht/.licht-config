-- =================
-- keybindings.lua --- 快捷键绑定设置文件
-- Author: MuCheng
-- =================
--
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = require("utils.mapping")

-- 强制保存
map.set("c", "w!!", "w !sudo tee > /dev/null %", "Saved")

-- 一键大写
--[[ map.set("i", "<C-U>", "<ESC>viwUea", "Upper Word") ]]
map.set("n", "<leader>su", "viwUe", "Upper Word")

-- 一键小写
--[[ map.set("i", "<C-L>", "<ESC>viwuea", "Lower Word") ]]
map.set("n", "<leader>sl", "viwue", "Lower Word")

-- 首字母大写
-- map.set('i', '<C-O>', "<ESC>bvi'Uea")
-- map.set('n', '<localleader>so', "bvi'Uea")

-- 正常模式下按 ESC 取消高亮显示
map.set("n", "<ESC>", "<CMD>nohlsearch<CR>", "No Highlight")

-- 窗口切换组合快捷键
map.set("n", "<C-J>", "<C-W><C-J>", "Down Window")
map.set("n", "<C-K>", "<C-W><C-K>", "Up Window")
map.set("n", "<C-L>", "<C-W><C-L>", "Left Window")
map.set("n", "<C-H>", "<C-W><C-H>", "Right Window")

-- 连续缩进
map.set("v", "<", "<gv", "Move Left Continuously")
map.set("v", ">", ">gv", "Move Right Continuously")

-- 水平分屏
map.set("n", "<leader>wv", "<CMD>vsp<CR>", "Split Window Horizontally")
-- 垂直分屏
map.set("n", "<leader>wo", "<CMD>sp<CR>", "Split Window Vertically")
-- 关闭当前分屏
map.set("n", "<leader>wd", "<C-w>c", "Close Current Window")
-- 关闭其他分屏
map.set("n", "<leader>wc", "<C-w>o", "Close Other Window")

-- 窗口快速跳转
map.set("n", "<leader>1", "<CMD>1wincmd w<CR>", "Win 1")
map.set("n", "<leader>2", "<CMD>2wincmd w<CR>", "Win 2")
map.set("n", "<leader>3", "<CMD>3wincmd w<CR>", "Win 3")
map.set("n", "<leader>4", "<CMD>4wincmd w<CR>", "Win 4")
map.set("n", "<leader>5", "<CMD>5wincmd w<CR>", "Win 5")
map.set("n", "<leader>6", "<CMD>6wincmd w<CR>", "Win 6")
map.set("n", "<leader>7", "<CMD>7wincmd w<CR>", "Win 7")
map.set("n", "<leader>8", "<CMD>8wincmd w<CR>", "Win 8")
map.set("n", "<leader>9", "<CMD>9wincmd w<CR>", "Win 9")

-- tab页
map.set("n", "<leader>tt", "<CMD>tab<CR>", "Tab")
map.set("n", "<leader>td", "<CMD>tabdo<CR>", "Tabdo")
map.set("n", "<leader>ta", "<CMD>tabnew<CR>", "New Tab")
map.set("n", "<leader>te", "<CMD>tabedit<CR>", "Edit Tab")
map.set("n", "<leader>tc", "<CMD>tabclose<CR>", "Close Tab")
map.set("n", "<leader>tw", "<CMD>tabs<CR>", "Show Tabs")
map.set("n", "<leader>tf", "<CMD>tabfirst<CR>", "First Tab")
map.set("n", "<leader>tl", "<CMD>tablast<CR>", "Last Tab")
map.set("n", "<leader>tp", "<CMD>tabp<CR>", "Previous Tab")
map.set("n", "[t", "<CMD>tabp<CR>", "Previous Tab")
map.set("n", "]t", "<CMD>tabn<CR>", "Next Tab")
map.set("n", "<leader>tn", "<CMD>tabn<CR>", "Next Tab")
map.set("n", "<leader>ts", ":tab split ", "Split Tab")
-- 关闭tab页
map.set("n", "<leader>too", "<CMD>tabonly<CR>", "Close All")
map.set("n", "<leader>to1", "<CMD>tabonly 1<CR>", "Close All Except 1")
map.set("n", "<leader>to2", "<CMD>tabonly 2<CR>", "Close All Except 2")
map.set("n", "<leader>to3", "<CMD>tabonly 3<CR>", "Close All Except 3")
map.set("n", "<leader>to4", "<CMD>tabonly 4<CR>", "Close All Except 4")
map.set("n", "<leader>to5", "<CMD>tabonly 5<CR>", "Close All Except 5")
map.set("n", "<leader>to6", "<CMD>tabonly 6<CR>", "Close All Except 6")
map.set("n", "<leader>to7", "<CMD>tabonly 7<CR>", "Close All Except 7")
map.set("n", "<leader>to8", "<CMD>tabonly 8<CR>", "Close All Except 8")
map.set("n", "<leader>to9", "<CMD>tabonly 9<CR>", "Close All Except 9")
map.set("n", "<leader>to$", "<CMD>tabonly $<CR>", "Close All Except Last")
-- tab页快速切换
map.set("n", "<leader>t1", "1gt", "Tab 1")
map.set("n", "<leader>t2", "2gt", "Tab 2")
map.set("n", "<leader>t3", "3gt", "Tab 3")
map.set("n", "<leader>t4", "4gt", "Tab 4")
map.set("n", "<leader>t5", "5gt", "Tab 5")
map.set("n", "<leader>t6", "6gt", "Tab 6")
map.set("n", "<leader>t7", "7gt", "Tab 7")
map.set("n", "<leader>t8", "8gt", "Tab 8")
map.set("n", "<leader>t9", "9gt", "Tab 9")

-- buffer
map.set("n", "<leader>bs", "<CMD>buffers<CR>", "All Buffers")
map.set("n", "<leader>ba", "<CMD>ball<CR>", "List All Buffers Horizontally")
map.set("n", "<leader>bv", "<CMD>vertical ball<CR>", "List All Buffers Vertically")
map.set("n", "<leader>bf", "<CMD>bfirst<CR>", "First Buffer")
map.set("n", "<leader>bl", "<CMD>blast<CR>", "Last Buffer")
map.set("n", "<leader>bp", "<CMD>bprev<CR>", "Previous Buffer")
map.set("n", "<leader>bn", "<CMD>bnext<CR>", "Next Buffer")
map.set("n", "[b", "<CMD>bprev<CR>", "Previous Buffer")
map.set("n", "]b", "<CMD>bnext<CR>", "Next Buffer")

