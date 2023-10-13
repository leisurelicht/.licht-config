return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      icons = {
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
        ["<leader>b"] = { name = "󰓩 Buffers" },
        ["<leader>c"] = { name = " Code", mode = { "n", "v" } },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.default_key)
    end,
  },
}
