-- =================
-- keybindings.lua --- 快捷键绑定设置文件
-- Author: MuCheng 
-- =================
--
local keys = require('utils.keys')

-- 强制保存
-- cmap w!! w !sudo tee > /dev/null %
keys.map('c', 'w!!', 'w !sudo tee > /dev/null %', keys.opt)

-- 一键大写
-- inoremap <C-U> <ESC>viwUea
keys.map('i', '<C-U>', '<ESC>viwUea', keys.opt)

-- 窗口切换组合快捷键
-- nnor.map <C-J> <C-W><C-J>
keys.map('n', '<C-J>', '<C-W><C-J>', keys.opt)
-- nnor.map <C-K> <C-W><C-K>
keys.map('n', '<C-K>', '<C-W><C-K>', keys.opt)
-- nnor.map <C-L> <C-W><C-L>
keys.map('n', '<C-L>', '<C-W><C-L>', keys.opt)
-- nnor.map <C-H> <C-W><C-H>
keys.map('n', '<C-H>', '<C-W><C-H>', keys.opt)

-- 连续缩进
keys.map('v', '<', '<gv', keys.opt)
keys.map('v', '>', '>gv', keys.opt)

-- 分屏
-- 水平分屏
keys.map('n', '<leader>sv', ':vsp ', keys.opt)
-- 垂直分屏
keys.map('n', '<leader>sh', ':sp ', keys.opt)
-- 关闭当前分屏
keys.map('n', '<leader>sc', '<C-w>c', keys.opt)
-- 关闭其他分屏
keys.map('n', '<leader>so', '<C-w>o', keys.opt)

-- nor.map <silent> <localleader>za za<CR>
keys.map('n', '<localleader>za', 'za<CR>', keys.opt)

-- 创建新的标签页
-- nnor.map <leader>tp gT
-- nnor.map <leader>tn gt
-- nnor.map <leader>tt :tab
-- nnor.map <leader>ta :tabnew<CR>
-- nnor.map <leader>tc :tabclose<CR>
-- nnor.map <leader>tl :tabs<CR>
-- nnor.map <leader>td :tabdo
-- nnor.map <leader>tf :tabfirst<CR>
-- nnor.map <leader>tl :tablast<CR>
-- nnor.map <leader>ts :tab split<CR>
--
-- keys.map('n', '<leader>tt', ':tab', keys.opt)
keys.map('n', '<leader>ta', ':tabnew<CR>', keys.opt)
keys.map('n', '<leader>tc', ':tabclose<CR>', keys.opt)
keys.map('n', '<leader>tl', ':tabs<CR>', keys.opt)
-- keys.map('n', '<leader>td', ':tabdo', keys.opt)
keys.map('n', '<leader>tf', ':tabfirst<CR>', keys.opt)
keys.map('n', '<leader>tl', ':tablast<CR>', keys.opt)
keys.map('n', '<leader>tn', ':tabn<CR>', keys.opt)
keys.map('n', '<leader>ts', ':tab split<CR>', keys.opt)

-- 
-- nnoremap <leader>too :tabonly
-- nnoremap <leader>toa :tabonly<CR>
-- nnoremap <leader>to1 :tabonly 1<CR>
-- nnoremap <leader>to2 :tabonly 2<CR>
-- nnoremap <leader>to3 :tabonly 3<CR>
-- nnoremap <leader>to4 :tabonly 4<CR>
-- nnoremap <leader>to5 :tabonly 5<CR>
-- nnoremap <leader>to6 :tabonly 6<CR>
-- nnoremap <leader>to7 :tabonly 7<CR>
-- nnoremap <leader>to8 :tabonly 8<CR>
-- nnoremap <leader>to9 :tabonly 9<CR>
-- nnoremap <leader>to$ :tabonly $<CR>
-- 
-- noremap <silent> <leader>t1 1gt
-- noremap <silent> <leader>t2 2gt
-- noremap <silent> <leader>t3 3gt
-- noremap <silent> <leader>t4 4gt
-- noremap <silent> <leader>t5 5gt
-- noremap <silent> <leader>t6 6gt
-- noremap <silent> <leader>t7 7gt
-- noremap <silent> <leader>t8 8gt
-- noremap <silent> <leader>t9 9gt
--
-- windows 快速跳转
-- noremap <silent> <leader>1 :1wincmd w<CR>
-- noremap <silent> <leader>2 :2wincmd w<CR>
-- noremap <silent> <leader>3 :3wincmd w<CR>
-- noremap <silent> <leader>4 :4wincmd w<CR>
-- noremap <silent> <leader>5 :5wincmd w<CR>
-- noremap <silent> <leader>6 :6wincmd w<CR>
-- noremap <silent> <leader>7 :7wincmd w<CR>
-- noremap <silent> <leader>8 :8wincmd w<CR>
-- noremap <silent> <leader>9 :9wincmd w<CR>
keys.map('n', '<leader>1', ':1wincmd w<CR>', keys.opt)
keys.map('n', '<leader>2', ':2wincmd w<CR>', keys.opt)
keys.map('n', '<leader>3', ':3wincmd w<CR>', keys.opt)
keys.map('n', '<leader>4', ':4wincmd w<CR>', keys.opt)
keys.map('n', '<leader>5', ':5wincmd w<CR>', keys.opt)
keys.map('n', '<leader>6', ':6wincmd w<CR>', keys.opt)
keys.map('n', '<leader>7', ':7wincmd w<CR>', keys.opt)
keys.map('n', '<leader>8', ':8wincmd w<CR>', keys.opt)
keys.map('n', '<leader>9', ':9wincmd w<CR>', keys.opt)


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
