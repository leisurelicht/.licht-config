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
    "lewis6991/gitsigns.nvim",
    optional = true,
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "󱈸" },
        topdelete = { text = "󱈸" },
        changedelete = { text = "┃" },
        untracked = { text = "┇" },
      },
      signcolumn = true,
      numhl = true,
    },
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
      opts.defaults["<leader>u"] = { name = "󰨙  UI" }
      opts.defaults["<leader>f"] = { name = "  File/Find" }
      opts.defaults["<leader>s"] = { name = "󰺮  Search" }
      opts.defaults["<leader>q"] = { name = "  Quit/Session" }
      opts.defaults["<leader>g"] = { name = "󰊢  Git" }
      opts.defaults["<leader>x"] = { name = "󰚢  Diagnostics/Quickfix" }
      opts.defaults["<leader>b"] = { name = "󰓩  Buffers" }
      opts.defaults["<leader>c"] = { name = "  Code" }
      opts.defaults["<leader>sn"] = { name = "  Noice" }
      opts.defaults["<leader>t"] = { name = "󰡾  Test" }
      opts.defaults["<leader>d"] = { name = "  Debug" }
      opts.defaults["<leader>a"] = { name = "󱜹  AIChat" }
      opts.defaults["<leader>l"] = { name = "  LSP" }
      opts.defaults["<leader>w"] = { name = "  Windows" }
      opts.defaults["<leader>;"] = { name = "󰏖  Settings" }
    end,
  },
  {
    "m4xshen/smartcolumn.nvim",
    event = { "BufNewFile", "BufRead" },
    opts = {
      colorcolumn = "0",
      disabled_filetypes = {
        "lazy",
        "mason",
        "notify",
        "markdown",
        "dashboard",
        "checkhealth",
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
}
