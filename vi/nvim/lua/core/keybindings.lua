-- =================
-- keybindings.lua --- 快捷键绑定设置文件
-- Author: MuCheng
-- =================
--
local keys = require("utils.keys")

-- 强制保存
keys.mapKey("c", "w!!", "w !sudo tee > /dev/null %")

-- 一键大写
keys.mapKey("i", "<C-U>", "<ESC>viwUea")
keys.mapKey("n", "<localleader>su", "viwUe")

-- 一键小写
keys.mapKey("i", "<C-L>", "<ESC>viwuea")
keys.mapKey("n", "<localleader>sl", "viwue")

-- 首字母大写
-- keys.mapKey('i', '<C-O>', "<ESC>bvi'Uea")
-- keys.mapKey('n', '<localleader>so', "bvi'Uea")

-- 正常模式下按 ESC 取消高亮显示
keys.mapKey("n", "<ESC>", ":nohlsearch<CR>")

-- 窗口切换组合快捷键
-- keys.mapKey("n", "<C-J>", "<C-W><C-J>")
-- keys.mapKey("n", "<C-K>", "<C-W><C-K>")
-- keys.mapKey("n", "<C-L>", "<C-W><C-L>")
-- keys.mapKey("n", "<C-H>", "<C-W><C-H>")

-- 连续缩进
keys.mapKey("v", "<", "<gv")
keys.mapKey("v", ">", ">gv")

-- 分屏
-- 水平分屏
keys.mapCmdWait("<leader>sv", ":vsp<CR>")
-- 垂直分屏
keys.mapCmdWait("<leader>so", ":sp<CR>")
-- 关闭当前分屏
keys.mapKey("n", "<leader>sd", "<C-w>c")
-- 关闭其他分屏
keys.mapKey("n", "<leader>sc", "<C-w>o")

-- 开启关闭代码
-- keys.mapKey('n', '<localleader>za', 'za')

-- tab页
keys.mapCmd("<leader>tt", "tab")
keys.mapCmd("<leader>td", "tabdo")
keys.mapCmd("<leader>ta", "tabnew")
keys.mapCmdWait("<leader>te", "tabedit")
keys.mapCmd("<leader>tc", "tabclose")
keys.mapCmd("<leader>tb", "tabs")
keys.mapCmd("<leader>tf", "tabfirst")
keys.mapCmd("<leader>tl", "tablast")
keys.mapCmd("<leader>tp", "tabp")
keys.mapCmd("<leader>tn", "tabn")
keys.mapCmdWait("<leader>ts", "tab split")
-- 关闭tab页
keys.mapCmdWait("<leader>too", "tabonly")
keys.mapCmd("<leader>toa", "tabonly")
keys.mapCmd("<leader>to1", "tabonly 1")
keys.mapCmd("<leader>to2", "tabonly 2")
keys.mapCmd("<leader>to3", "tabonly 3")
keys.mapCmd("<leader>to4", "tabonly 4")
keys.mapCmd("<leader>to5", "tabonly 5")
keys.mapCmd("<leader>to6", "tabonly 6")
keys.mapCmd("<leader>to7", "tabonly 7")
keys.mapCmd("<leader>to8", "tabonly 8")
keys.mapCmd("<leader>to9", "tabonly 9")
keys.mapCmd("<leader>to$", "tabonly $")
-- tab页快速切换
keys.mapKey("n", "<leader>t1", "1gt")
keys.mapKey("n", "<leader>t2", "2gt")
keys.mapKey("n", "<leader>t3", "3gt")
keys.mapKey("n", "<leader>t4", "4gt")
keys.mapKey("n", "<leader>t5", "5gt")
keys.mapKey("n", "<leader>t6", "6gt")
keys.mapKey("n", "<leader>t7", "7gt")
keys.mapKey("n", "<leader>t8", "8gt")
keys.mapKey("n", "<leader>t9", "9gt")

-- 窗口快速跳转
keys.mapCmd("<leader>1", "1wincmd w")
keys.mapCmd("<leader>2", "2wincmd w")
keys.mapCmd("<leader>3", "3wincmd w")
keys.mapCmd("<leader>4", "4wincmd w")
keys.mapCmd("<leader>5", "5wincmd w")
keys.mapCmd("<leader>6", "6wincmd w")
keys.mapCmd("<leader>7", "7wincmd w")
keys.mapCmd("<leader>8", "8wincmd w")
keys.mapCmd("<leader>9", "9wincmd w")
