return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    keys = {
      { "<leader>pT", "<cmd>TSModuleInfo<cr>", desc = "Treesitter Info" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      })
      opts.matchup = { enable = true }
      opts.endwise = { enable = true }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("nvim-treesitter.install").prefer_git = true
    end,
  },
}
