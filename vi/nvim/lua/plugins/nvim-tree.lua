-- =================
-- nvim-tree.lua --- nvim-tree config file
-- Author: MuCheng
-- =================
--
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("Load nvim-tree Failed", "warn")
  return
end

local config_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_ok then
  vim.notify("Load nvim-tree Config Failed", "warn")
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local function print_node_path(node) print(node.absolute_path) end

nvim_tree.setup {
  open_on_setup = true,
  ignore_ft_on_setup = {},
  open_on_tab = true,
  system_open = {cmd = nil, args = {}},
  view = {
    mappings = {
      list = {
        {key = "p", action = "print_path", action_cb = print_node_path},
        {key = "s", cb = tree_cb("vsplit")}, {key = "o", cb = tree_cb("split")},
        {key = "<C-o>", cb = tree_cb("system_open")}
      }
    },
    number = true
  }
}

local keys_ok, keys = pcall(require, "utils.keys")
if not keys_ok then return end

keys.mapCmd("<F4>", "NvimTreeToggle")
local nmap = {
  F = {
    name = "+FileTree",
    t = {"<CMD>NvimTreeToggle<CR>", "Toggle"},
    r = {
      name = "+Resize",
      ["3"] = {"<CMD>NvimTreeResize 10<CR>", "Resize To 30"},
      ["4"] = {"<CMD>NvimTreeResize 10<CR>", "Resize To 40"},
      ["5"] = {"<CMD>NvimTreeResize 10<CR>", "Resize To 50"},
      ["6"] = {"<CMD>NvimTreeResize 10<CR>", "Resize To 60"}
    },
    f = {"<CMD>NvimTreeFocus<CR>", "Focus"},
    o = {"<CMD>NvimTreeOpen<CR>", "Open"},
    c = {"<CMD>NvimTreeClose<CR>", "Close"}
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)

-- automatically close the tab/vim when nvim-tree is the last window in the tab.
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

-- nvim 启动时指定文件时自动开启 NvimTreeOpen
-- vim.cmd([[
--   augroup vim_enter
--     autocmd StdinReadPre * let s:std_in=1
--     autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NvimTreeOpen' argv()[0] | wincmd p | ene | wincmd p | endif
--   augroup end
-- ]])

-- nvim 启动时不指定文件时自动开启 NvimTreeOpen
-- vim.cmd([[
--   augroup vim_enter
--     autocmd VimEnter * if !argc() | NvimTreeOpen | wincmd w | endif
--   augroup end
-- ]])
