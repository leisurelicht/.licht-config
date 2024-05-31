local Util = require("lazyvim.util")

return {
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.fold" },
  {
    "folke/noice.nvim",
    optional = true,
    opts = { presets = { lsp_doc_border = true } },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.icons = { separator = "", group = "" }
      opts.window = { border = "rounded" }
      opts.layout = { align = "center" }
      opts.defaults["g"] = { name = "Goto" }
      opts.defaults["gz"] = { name = "Surround" }
      opts.defaults["]"] = { name = "Next" }
      opts.defaults["["] = { name = "Prev" }
      opts.defaults["<leader><tab>"] = { name = "󱏈  Tab" }
      opts.defaults["<leader>to"] = { name = "Close Only" }
      opts.defaults["<leader>u"] = { name = "󰨙  UI" }
      opts.defaults["<leader>p"] = { name = "󰏖  Packages" }
      opts.defaults["<leader>f"] = { name = "  File/Find" }
      opts.defaults["<leader>s"] = { name = "󰺮  Search", mode = { "n", "v" } }
      opts.defaults["<leader>q"] = { name = "  Quit/Session" }
      opts.defaults["<leader>g"] = { name = "󰊢  Git", mode = { "n", "v" } }
      opts.defaults["<leader>x"] = { name = "󰚢  Diagnostics/Quickfix" }
      opts.defaults["<leader>b"] = { name = "󰓩  Buffers" }
      opts.defaults["<leader>c"] = { name = "  Code", mode = { "n", "v" } }
      opts.defaults["<leader>sn"] = { name = "  Noice" }
      opts.defaults["<leader>t"] = { name = "󰡾  Test" }
      opts.defaults["<leader>d"] = { name = "  Debug" }
    end,
  },
}
