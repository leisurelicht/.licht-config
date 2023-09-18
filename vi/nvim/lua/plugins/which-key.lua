return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = " ",
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
      },
      layout = {
        align = "center", -- align columns left, center or right
      },
      default_key = {
        ["g"] = { name = "Goto" },
        ["gz"] = { name = "Surround" },
        ["]"] = { name = "Next" },
        ["["] = { name = "Prev" },
        ["<leader>t"] = { name = "󱏈 Tab" },
        ["<leader>to"] = { name = "Close Only" },
        ["<leader>u"] = { name = "󰨙 UI" },
        ["<leader>p"] = { name = "󰏖 Packages" },
        ["<leader>f"] = { name = " File/Find" },
        ["<leader>s"] = { name = "󰺮 Search", mode = { "n", "v" } },
        ["<leader>q"] = { name = " Quit/Session" },
        ["<leader>g"] = { name = "󰊢 Git", mode = { "n", "v" } },
        ["<leader>x"] = { name = "󰚢 Diagnostics/Quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.default_key)

      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("filetype_which_key", { clear = false }),
        pattern = { "*" },
        callback = function(event)
          if require("utils").unbind_key_buf(vim.bo[event.buf].filetype) then
            return
          end

          wk.register({
            c = { name = " Code" },
            l = { name = "󰿘 Lsp" },
            g = { name = "󰊢 Git" },
            b = { name = "󰓩 Buffers" },
            w = { name = " Window Split" },
          }, { mode = "n", prefix = "<leader>", buffer = event.buf })

          wk.register({
            c = { name = " Code" },
          }, { mode = "v", prefix = "<leader>", buffer = event.buf })
        end,
      })
    end,
  },
}
