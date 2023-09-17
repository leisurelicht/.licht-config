return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Show LSP Info" }
      keys[#keys + 1] = {
        "<leader>ld",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = true })
        end,
        desc = "Goto Definition",
        has = "definition",
      }
      keys[#keys + 1] = {
        "<leader>li",
        function()
          require("telescope.builtin").lsp_implementations({ reuse_win = true })
        end,
        desc = "Goto Implementation",
      }
      keys[#keys + 1] = {
        "<leader>lt",
        function()
          require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
        end,
        desc = "Goto T[y]pe Definition",
      }
      keys[#keys + 1] = { "<leader>lD", vim.lsp.buf.declaration, desc = "Goto declaration", has = "declaration" }
      keys[#keys + 1] = { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "Show References" }
      keys[#keys + 1] = {
        "<leader>ll",
        function()
          vim.diagnostic.open_float({ scope = "line", border = "rounded" })
        end,
        desc = "Diagnostics (line)",
      }
      keys[#keys + 1] = {
        "<leader>lc",
        function()
          vim.diagnostic.open_float({ scope = "cursor", border = "rounded" })
        end,
        desc = "Diagnostics (cursor)",
      }
      keys[#keys + 1] = {
        "<leader>lp",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "Diagnostics (project)",
      }
      keys[#keys + 1] = { "<leader>lh", vim.lsp.buf.hover, desc = "Show Hover", has = "hover" }
      keys[#keys + 1] =
        { "<leader>lk", vim.lsp.buf.signature_help, desc = "Show Singature Help", has = "signatureHelp" }

      -- disable a keymap
      keys[#keys + 1] = { "<leader>cd", false }
      keys[#keys + 1] = { "<leader>cl", false }

      -- add a keymap
    end,
  },
}
