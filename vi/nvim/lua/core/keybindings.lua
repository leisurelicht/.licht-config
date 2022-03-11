-- =================
-- keybindings.lua --- 快捷键绑定设置文件
-- Author: MuCheng 
-- =================
--
local keys = require('utils.keys')

-- 强制保存
keys.mapKey('c', 'w!!', 'w !sudo tee > /dev/null %')

-- 一键大写
keys.mapKey('i', '<C-U>', '<ESC>viwUea')
-- 一键小写
keys.mapKey('i', '<C-O>', '<ESC>viwuea')

-- 窗口切换组合快捷键
keys.mapKey('n', '<C-J>', '<C-W><C-J>')
keys.mapKey('n', '<C-K>', '<C-W><C-K>')
keys.mapKey('n', '<C-L>', '<C-W><C-L>')
keys.mapKey('n', '<C-H>', '<C-W><C-H>')

-- 连续缩进
keys.mapKey('v', '<', '<gv')
keys.mapKey('v', '>', '>gv')

-- 分屏
-- 水平分屏
keys.mapCmdWait('<leader>sv', ':vsp')
-- 垂直分屏
keys.mapCmdWait('<leader>sh', ':sp')
-- 关闭当前分屏
keys.mapKey('n', '<leader>sc', '<C-w>c')
-- 关闭其他分屏
keys.mapKey('n', '<leader>so', '<C-w>o')

-- 开启关闭代码
keys.mapKey('n', '<localleader>za', 'za')

-- tab页
keys.mapCmd('<leader>tt', 'tab')
keys.mapCmd('<leader>td', 'tabdo')
keys.mapCmd('<leader>ta', 'tabnew')
keys.mapCmdWait('<leader>te', 'tabedit')
keys.mapCmd('<leader>tc', 'tabclose')
keys.mapCmd('<leader>tb', 'tabs')
keys.mapCmd('<leader>tf', 'tabfirst')
keys.mapCmd('<leader>tl', 'tablast')
keys.mapCmd('<leader>tp', 'tabp')
keys.mapCmd('<leader>tn', 'tabn')
keys.mapCmdWait('<leader>ts', 'tab split')
-- 关闭tab页
keys.mapCmdWait('<leader>too', 'tabonly')
keys.mapCmd('<leader>toa', 'tabonly')
keys.mapCmd('<leader>to1', 'tabonly 1')
keys.mapCmd('<leader>to2', 'tabonly 2')
keys.mapCmd('<leader>to3', 'tabonly 3')
keys.mapCmd('<leader>to4', 'tabonly 4')
keys.mapCmd('<leader>to5', 'tabonly 5')
keys.mapCmd('<leader>to6', 'tabonly 6')
keys.mapCmd('<leader>to7', 'tabonly 7')
keys.mapCmd('<leader>to8', 'tabonly 8')
keys.mapCmd('<leader>to9', 'tabonly 9')
keys.mapCmd('<leader>to$', 'tabonly $')
-- tab页快速切换
keys.mapKey('n', '<leader>t1', '1gt')
keys.mapKey('n', '<leader>t2', '2gt')
keys.mapKey('n', '<leader>t3', '3gt')
keys.mapKey('n', '<leader>t4', '4gt')
keys.mapKey('n', '<leader>t5', '5gt')
keys.mapKey('n', '<leader>t6', '6gt')
keys.mapKey('n', '<leader>t7', '7gt')
keys.mapKey('n', '<leader>t8', '8gt')
keys.mapKey('n', '<leader>t9', '9gt')

-- 窗口快速跳转
keys.mapCmd('<leader>1', '1wincmd w')
keys.mapCmd('<leader>2', '2wincmd w')
keys.mapCmd('<leader>3', '3wincmd w')
keys.mapCmd('<leader>4', '4wincmd w')
keys.mapCmd('<leader>5', '5wincmd w')
keys.mapCmd('<leader>6', '6wincmd w')
keys.mapCmd('<leader>7', '7wincmd w')
keys.mapCmd('<leader>8', '8wincmd w')
keys.mapCmd('<leader>9', '9wincmd w')


-- local pluginKeys = {}

-- pluginKeys.maplsp = function(mapbuf)
--   -- rename
--   mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keys.opt)
--   -- code action
--   mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', keys.opt)
--   -- go
--   mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keys.opt)
--   mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', keys.opt)
--   mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', keys.opt)
--   mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keys.opt)
--   mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keys.opt)
--   -- diagnostic
--   mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', keys.opt)
--   mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', keys.opt)
--   mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', keys.opt)
--   -- formatting
--   mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', keys.opt)
-- end

-- -- nvim-cmp 自动补全
-- pluginKeys.cmp = function(cmp)
--   return {
--     -- 上一个
--     ['<C-k>'] = cmp.mapping.select_prev_item(),
--     -- 下一个
--     ['<C-j>'] = cmp.mapping.select_next_item(),
--     ['<TAB>'] = cmp.mapping.select_next_item(),
--     -- 出现补全
--     ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--     -- 取消
--     ['<A-,>'] = cmp.mapping({
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     }),
--     -- 确认
--     -- Accept currently selected item. If none selected, `select` first item.
--     -- Set `select` to `false` to only confirm explicitly selected items.
--     ['<CR>'] = cmp.mapping.confirm({
--       select = true ,
--       behavior = cmp.ConfirmBehavior.Replace
--     }),
--     -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--     ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--     ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--   }
-- end

-- return pluginKeys
