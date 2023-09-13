return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    init = function()
      require("which-key").register({ ["<leader>l"] = { name = "󰖳 Lsp" }, mode = { "n", "v" } })

      local format = function()
        require("lazyvim.plugins.lsp.format").format({ force = true })
      end

      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>pi", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
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
      keys[#keys + 1] = { "<leader>le", "<cmd>Telescope lsp_references<cr>", desc = "References" }
      keys[#keys + 1] =
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
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

      keys[#keys + 1] = { "<leader>lh", vim.lsp.buf.hover, desc = "Hover", has = "hover" }
      keys[#keys + 1] = { "<leader>lk", vim.lsp.buf.signature_help, desc = "Hover", has = "signatureHelp" }
      keys[#keys + 1] = { "<leader>lf", format, desc = "Format Document", has = "formatting" }
      keys[#keys + 1] = { "<leader>lf", format, desc = "Format Range", mode = "v", has = "rangeFormatting" }

      -- disable a keymap
      keys[#keys + 1] = { "<leader>ca", false, mode = { "n", "v" } }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cd", false }
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>cf", false }

      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
      --
    end,
  },
}
