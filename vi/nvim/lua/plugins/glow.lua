-- =================
-- glow.lua --- markdown 文件预览
-- Author: MuCheng
-- =================
--
vim.g.glow_binary_path = vim.env.HOME .. "/bin"
vim.g.glow_border = "rounded"
vim.g.glow_use_pager = true
vim.g.glow_style = "dark"

nmap = {
  r = {
    name = "+Runner",
    m = {"<CMD>Glow<CR>", "markdown"},
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
