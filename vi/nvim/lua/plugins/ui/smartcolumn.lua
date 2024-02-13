return {
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
