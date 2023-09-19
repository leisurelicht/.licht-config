return {
  { import = "plugins.ui.which-key" },
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")
      opts.section.buttons.val = {
        dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("o", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
    end,
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
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
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
