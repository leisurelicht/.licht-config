return {
  {
    "p00f/nvim-ts-rainbow",
    event = {"BufRead", "BufNewFile"}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = {"BufRead", "BufNewFile"},
    dependencies = {"p00f/nvim-ts-rainbow"},
    opts = {
      ensure_installed = {
        "vim",
        "bash",
        "c",
        "lua",
        "go",
        "gomod",
        "gowork",
        "html",
        "python",
        "php",
        "sql",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "http",
        "dockerfile",
        "make",
        "cmake",
        "comment",
        "gitignore",
        "toml"
      },
      highlight = {enable = true, additional_vim_regex_highlighting = false},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<BS>",
          scope_incremental = "<nop>"
        }
      },
      indent = {
        enable = true,
        disable = {"python"}
      },
      -- 彩虹括号
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      -- comment
      context_commentstring = {enable = true},
      -- match % g% [% ]% z%
      matchup = {
        enable = true
      },
      endwise = {
        enable = true
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      map.set("n", "<leader>Pu", "<CMD>TSUpdate all<CR>", "Update All")
      map.set("n", "<leader>Ps", "<CMD>TSModuleInfo<CR>", "Module Info")

      local wk_ok, wk = pcall(require, "which-key")
      if wk_ok then
        wk.register(
          {
            mode = "n",
            prefix = "<leader>",
            T = "+Treesitter"
          }
        )
      end
    end
  }
}
