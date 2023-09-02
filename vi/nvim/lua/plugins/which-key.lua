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
      defaults = {
        ["<leader>t"] = { name = "󱏈 Tab" },
        ["<leader>to"] = { name = "Close Only" },
        ["<leader>u"] = { name = "󰨙 UI" },
        ["<leader>p"] = { name = "󰏖 Packages" },
        ["<leader>f"] = { name = " File/Find" },
        ["<leader>b"] = { name = "󰓩 Buffers" },
        ["<leader>c"] = { name = " Code" },
        ["<leader>s"] = { name = "󰺮 Search" },
        ["<leader>w"] = { name = " Window Split" },
        ["<leader>q"] = { name = " Quit/Session" },
        ["<leader>g"] = { name = "󰊢 Git" },
        ["<leader>x"] = { name = "󰚢 Diagnostics/Quickfix" },
      },
    },
  },
}
