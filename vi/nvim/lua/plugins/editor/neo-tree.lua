return {
  {
    "s1n7ax/nvim-window-picker",
    version = "v2.*",
    event = "VeryLazy",
    opts = {
      hint = "floating-big-letter",
      selection_chars = "ABFJDKSL;CMRUEIWOQP",
      show_prompt = false,
      filter_rules = {
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify", "noice" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        content_layout = "center",
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["S"] = "none",
          -- ["m"] = "none",
          ["o"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
          ["<tab>"] = { "toggle_preview", config = { use_float = true } },
          ["<esc>"] = "close_window",
        },
      },
    },
  },
}
