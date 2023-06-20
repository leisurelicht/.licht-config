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
local dev = os.getenv("LichtVim")
if dev then
  require("config.dev")
else
  require("config.lazy")
end
