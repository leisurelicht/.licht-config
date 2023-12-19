return {
  { import = "plugins.coding.git" },
  {
    "andymass/vim-matchup",
    event = { "BufNewFile", "BufRead" },
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "poopup" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = { autoformat = false, diagnostics = { float = { border = "rounded" } } },
    keys = function()
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
          vim.diagnostic.open_float({ scope = "line" })
        end,
        desc = "Diagnostics (line)",
      }
      keys[#keys + 1] = {
        "<leader>lc",
        function()
          vim.diagnostic.open_float({ scope = "cursor" })
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
        { "<leader>lk", vim.lsp.buf.signature_help, desc = "Show Signature Help", has = "signatureHelp" }

      -- disable a keymap
      keys[#keys + 1] = { "<leader>cd", false }
      keys[#keys + 1] = { "<leader>cl", false }

      -- add a keymap
    end,
  },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.window = vim.tbl_extend("force", opts.window or {}, {
        completion = cmp.config.window.bordered({ col_offset = -1 }),
        documentation = cmp.config.window.bordered(),
      })
    end,
  },
  { import = "plugins.coding.copilot" },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
    config = true,
  },
}
