-- =================
-- nvim-lint.lua --- 代码检查 config file
-- Author: MuCheng
-- =================
--
local ok, lint = pcall(require, "lint")
if not ok then
  vim.notify("Load nvim-lint Failed", "warn")
  return
end

lint.linters_by_ft = {
  -- pip install pylint
  python = {"pylint"},
  -- brew install golangci-lint
  go = {"golangcilint"}
}

local api = require("utils.api")
api.autocmd(
  {"BufEnter", "BufNewFile", "BufWrite"},
  {
    pattern = {"*"},
    command = "lua require('lint').try_lint()"
  }
)
