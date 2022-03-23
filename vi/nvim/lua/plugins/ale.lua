-- =================
-- ale.lua --- packer file
-- Author: MuCheng
-- =================
--
vim.g.ale_lint_on_enter = 1
vim.g.ale_lint_on_text_changed = 'nerver'
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = '☠'
vim.g.ale_sign_warning = '★'
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_statusline_format = {'⨉ %d', '⚠ %d', '⬥ OK'}
vim.g.ale_completion_enabled = 1

-- vim.g.ale_set_loclist = 0
-- let g:ale_set_quickfix = 1
-- let g:ale_open_list = 1
-- -- Set this if you want to.
-- -- This can be useful if you are combining ALE with
-- -- some other plugin which sets quickfix errors, etc.
-- let g:ale_keep_list_window_open = 1

vim.g.ale_fix_on_save = true

local fixers = {
  ["*"] = {'remove_trailing_lines', 'trim_whitespace'},
  ["go"] = {"goimports", "gofmt"},
  ["python"] = {
    'add_blank_lines_for_python_control_statements', 'isort', 'yapf', 'autopep8'
  },
  ["html"] = {"prettier"},
  ["shell"] = {"shtmt"},
  ["sql"] = {"sqllint", "sqlfmt"},
  ["lua"] = {"lua-format"}
}
tableMerge(ALEFixers, fixers)

vim.g.ale_fixers = ALEFixers

vim.g.ale_lua_lua_format_options = "--indent-width=2 --tab-width=2"

vim.cmd [[ highlight ALEWarning ctermfg=236 ctermbg=182 guifg=#303030 guibg=#d7afd7 ]]
vim.cmd [[ highlight ALEError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7 ]]
vim.cmd [[ highlight ALEStyleError ctermfg=238 ctermbg=110 guifg=#444444 guibg=#87afd7 ]]

local keys = require('utils.keys')
keys.mapKey('n', 'C-P', '<Plug>(ale_previous_wrap)')
keys.mapKey('n', 'C-n', '<Plug>(ale_next_wrap)')

local nmap = {
  a = {
    name = "+ALE",
    e = {"<CMD>ALEEnable<CR>", "Enable"},
    d = {"<CMD>ALEDisable<CR>", "Disable"},
    -- a = {"<CMD>ALE<CR>", "Toggle"},
    f = {"<CMD>ALEFix<CR>", "Fix"},
    F = {"<CMD>ALEFixSuggest<CR>", "Fix Suggest"},
    n = {"<CMD>ALENext<CR>", "Next"},
    p = {"<CMD>ALEPrevious<CR>", "Previous"}
  }
}

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)
