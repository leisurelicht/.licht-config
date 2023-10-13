return {
  { import = "plugins.ui.which-key" },
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.fold" },
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
    "m4xshen/smartcolumn.nvim",
    event = { "BufNewFile", "BufRead" },
    opts = {
      colorcolumn = "0",
      disabled_filetypes = {
        "help",
        "text",
        "markdown",
        "lazy",
        "mason",
        "notify",
        "alpha",
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
