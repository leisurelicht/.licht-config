return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = function(_, opts)
      opts.endwise = { enable = true }
    end,
  },
}
