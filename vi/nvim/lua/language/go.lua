-- =================
-- go.lua --- golang lsp config file
-- Author: MuCheng
-- =================
--

M = {}
-- vim.cmd([[
--   autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
-- ]])

-- local path = require 'nvim-lsp-installer.path'
-- local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

-- require('go').setup({
--   gopls_cmd = {install_root_dir .. '/go/gopls'},
--   filstruct = 'gopls',
--   dap_debug = true,
--   dap_debug_gui = true,
--   lsp_cfg = {capabilities = require('lsp.nvim-cmp').capabilities}
-- })

M.lsp = {
  flags = {debounce_text_changes = 150},
  on_attach = function(client, bufnr)
    -- 关闭lsp 的自动格式化
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    require("lsp.keybindings").register(client, bufnr)

    -- 保存时使用lsp的自动格式化
    -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
}

M.dap = {
  adapters = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      opts,
      function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
          print("dlv exited with code", code)
        end
      end
    )
    assert(handle, "Error running dlv: " .. tostring(pid_or_err))
    stdout:read_start(
      function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(
            function()
              require("dap.repl").append(chunk)
            end
          )
        end
      end
    )
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100
    )
  end,
  configurations = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
  }
}

return M
