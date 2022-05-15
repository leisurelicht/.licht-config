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
    -- /opt/homebrew/bin/python3 -m pip install pylint
    -- python = {"pylint"},
    -- brew install golangci-lint
    -- go = {"golangcilint"},
    -- luacheck install luacheck
    -- lua = {"luacheck"},
    -- brew install shellcheck
    -- sh = {"shellcheck"},
    -- brew install yamllint
    yaml = {"yamllint"}
    -- /opt/homebrew/bin/python3 -m pip install vim-vint
    -- vim = {"vint"}
}

local api = require("utils.api")
api.autocmd(
    {"BufEnter", "TextChanged", "BufWritePost"},
    {
        pattern = {"*"},
        command = "lua require('lint').try_lint()"
    }
)
