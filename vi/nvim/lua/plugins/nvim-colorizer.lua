return {
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    keys = {
      { "<leader>uo", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    },
    config = true,
  },
}
