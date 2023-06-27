-- =================
-- init.lua -
-- Note: neovim init file
-- Author: MuCheng
-- =================
--
-- vim.g.HOME_PATH = vim.fn.expand("$HOME")
-- vim.g.CONFIG = vim.g.HOME_PATH .. "/.config_file/vi/nvim"
-- vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.g.CONFIG

-- require("config.mini")
local status = os.getenv("LichtVim")
if status == "dev" then
  require("develop.dev")
elseif status == "mini" then
  require("develop.mini")
elseif status == "lazy" then
  require("develop.lazy")
else
  require("config.plugs")
end
