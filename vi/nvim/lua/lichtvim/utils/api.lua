M = {}

M.autocmd = vim.api.nvim_create_autocmd

function M.augroup(name)
  return vim.api.nvim_create_augroup("lichtvim_" .. name, {clear = true})
end

return M
