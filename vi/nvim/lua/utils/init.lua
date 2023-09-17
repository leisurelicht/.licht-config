local M = {}

M.unbind_key_filetypes = {
  "alpha",
  "neo-tree",
  "neo-tree-popup",
  "lazy",
  "mason",
  "lspinfo",
  "toggleterm",
  "null-ls-info",
  "TelescopePrompt",
  "TelescopeResults",
  "WhichKey",
  "noice",
  "notify",
}

function M.unbind_key_buf(ft)
  return vim.fn.index(M.unbind_key_filetypes, ft) ~= -1
end

M.sys = {}

--- Check if the system is macos
---@return boolean # True if the system is macos, false if not
function M.sys.is_macos()
  return vim.fn.has("mac") == 1
end

--- Check if the system is linux
---@return boolean # True if the system is linux, false if not
function M.sys.is_linux()
  -- return vim.fn.has("unix") and not fn.has("macunix") and not fn.has("win32unix")
  return vim.loop.os_uname().sysname() == "Linux"
end

--- Check if the system is windows
---@return boolean # True if the system is windows, false if not
function M.sys.is_windows()
  -- return vim.fn.has("win16") or fn.has("win32") or fn.has("win64")
  return vim.loop.os_uname().sysname == "Windows_NT"
end

--- Check if the system is gui
---@return boolean # True if the system is gui, false if not
function M.sys.is_gui()
  return vim.fn.has("gui_running") == 1
end

--- Check if the system is neovide
---@return boolean # True if the system is neovide, false if not
function M.sys.is_neovide()
  return vim.g.neovide
end

--- Check if the system is terminal
---@return boolean # True if the system is terminal, false if not
function M.sys.is_term()
  return vim.fn.exists("g:termguicolors") == 1
end

M.git = {}

--- returns is git repo
---@return boolean
function M.git.is_repo()
  local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  if handle == nil then
    return false
  end
  local result = handle:read("*a")
  handle:close()

  if result:match("true") then
    return true
  else
    return false
  end
end

return M
