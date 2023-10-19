return {
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.fold" },
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufNewFile", "BufRead" },
    opts = {
      colorcolumn = "0",
      disabled_filetypes = {
        "lazy",
        "mason",
        "notify",
        "checkhealth",
        "dashboard",
      },
      custom_colorcolumn = {
        go = "120",
        lua = "120",
        python = "80",
      },
      scope = "file",
    },
    config = true,
  },

  {
    "folke/noice.nvim",
    optional = true,
    keys = {
      { "<leader>snl", false },
      { "<leader>snh", false },
      { "<leader>sna", false },
      { "<leader>snd", false },
    },
    opts = { presets = { lsp_doc_border = true } },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.icons = { separator = "", group = " " }
      opts.window = { border = "rounded" }
      opts.layout = { align = "center" }
      opts.defaults["g"] = { name = "Goto" }
      opts.defaults["gz"] = { name = "Surround" }
      opts.defaults["]"] = { name = "Next" }
      opts.defaults["["] = { name = "Prev" }
      opts.defaults["<leader>t"] = { name = "󱏈 Tab" }
      opts.defaults["<leader>to"] = { name = "Close Only" }
      opts.defaults["<leader>u"] = { name = "󰨙 UI" }
      opts.defaults["<leader>p"] = { name = "󰏖 Packages" }
      opts.defaults["<leader>f"] = { name = " File/Find" }
      opts.defaults["<leader>s"] = { name = "󰺮 Search", mode = { "n", "v" } }
      opts.defaults["<leader>q"] = { name = " Quit/Session" }
      opts.defaults["<leader>g"] = { name = "󰊢 Git", mode = { "n", "v" } }
      opts.defaults["<leader>x"] = { name = "󰚢 Diagnostics/Quickfix" }
      opts.defaults["<leader>b"] = { name = "󰓩 Buffers" }
      opts.defaults["<leader>c"] = { name = " Code", mode = { "n", "v" } }
    end,
  },
}
