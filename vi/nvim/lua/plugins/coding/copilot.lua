return {
  {
    "zbirenbaum/copilot.lua",
    -- build = ":Copilot auth",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<M-CR>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-e>",
        },
      },
      filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    dependencies = {
      { "leisurelicht/lualine-copilot.nvim" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.sections.lualine_x, { "copilot" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      local suggestion = require("copilot.suggestion")
      for k, v in pairs(opts.mapping["<Tab>"]) do
        opts.mapping["<Tab>"][k] = function(...)
          if suggestion.is_visible() then
            suggestion.accept()
          else
            v(...)
          end
        end
      end

      -- hide suggestion window when cmp menu is open
      local cmp = require("cmp")
      cmp.event:on("menu_opened", function()
        suggestion.dismiss()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)

      cmp.event:on("confirm_done", function()
        vim.b.copilot_suggestion_hidden = false
      end)

      cmp.event:on("complete_done", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end,
  },
}
