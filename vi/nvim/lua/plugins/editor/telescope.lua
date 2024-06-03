local Util = require("lazyvim.util")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local trouble = require("trouble.sources.telescope")

return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      -- disable the keymap
      { "<leader><space>", false },
      { "<leader>/", false },
      { "<leader>,", false },
      { "<leader>:", false },
      { "<leader>fn", false },

      -- set new keymap
      { "<leader>fr", false },
     { "<leader>fR", false },
      { "<leader>fo", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fO", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      -- { "<leader>sC", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>bs", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      {
        "<leader>fw",
        function()
          require("telescope").extensions.file_browser.file_browser({ path = vim.fn.expand("~") })
        end,
        desc = "File Browser",
      },
    },
    opts = function(_, opts)
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { horizontal = { prompt_position = "top" } },
        mappings = {
          i = {
            ["<ESC>"] = actions.close,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-h>"] = actions.cycle_history_prev,
            ["<C-l>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-t>"] = trouble.open,
          },
          n = {
            ["<ESC>"] = actions.close,
            ["<C-t>"] = trouble.open,
          },
        },
      })

      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
        find_files = { theme = "dropdown" },
        git_files = { theme = "dropdown" },
        oldfiles = themes.get_dropdown({ previewer = false }),
        buffers = themes.get_dropdown({ previewer = false }),
        command_history = { theme = "dropdown" },
        search_history = { theme = "dropdown" },
        live_grep = {
          prompt_title = "Text Search",
          preview_title = "Text Preview",
          disable_coordinates = true,
          path_display = { "tail" },
        },
        grep_string = {
          preview_title = "Word Preview",
          disable_coordinates = true,
          word_match = "-w",
          path_display = { "tail" },
          only_sort_text = true,
        },
        treesitter = { theme = "ivy" },
        marks = { theme = "ivy" },
        git_commits = { theme = "ivy" },
        git_bcommits = { theme = "ivy" },
        git_branches = { theme = "ivy" },
        git_status = { theme = "ivy" },
        git_stash = { theme = "ivy" },
      })

      local fb_actions = require("telescope").extensions.file_browser.actions
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        file_browser = themes.get_dropdown({
          previewer = false,
          hijack_netrw = true,
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top", width = 0.4, height = 0.5 },
          mappings = {
            ["i"] = {
              ["<A-y>"] = false,
              ["<A-m>"] = false,
              ["<A-c>"] = false,
              ["<A-r>"] = false,
              ["<A-d>"] = false,
              ["<A-q>"] = false,
              ["<C-Q>"] = false,
              ["<C-G>"] = false,
              ["<C-f>"] = fb_actions.goto_parent_dir,
              ["<C-r>"] = fb_actions.rename,
              ["<C-a>"] = fb_actions.create,
              ["<C-y>"] = fb_actions.copy,
              ["<C-d>"] = fb_actions.remove,
            },
            ["n"] = {},
          },
        }),
      })
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      telescope.load_extension("file_browser")
    end,
  },
}
