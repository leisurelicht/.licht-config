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
  require("config.dev")
elseif status == "mini" then
  require("config.mini")
else
  require("config.lazy")
end
