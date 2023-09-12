return {
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
