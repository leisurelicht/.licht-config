local map = require("utils.map")

return {
  { import = "plugins.editor.treesitter" },
  { import = "plugins.editor.im-select" },
  { import = "plugins.editor.neo-tree" },
  { import = "plugins.editor.smart-splits" },
  { import = "plugins.editor.telescope" },
  { "nacro90/numb.nvim", event = { "BufRead", "BufNewFile" }, config = true },
  {
    "folke/flash.nvim",
    optional = true,
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump To" },
      { "<leader>J", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Quick Select" },
    },
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    optional = true,
    event = { "BufRead", "BufNewFile" },
    keys = {
      { "<leader>bd", false },
      { "<leader>bD", false },
    },
    config = function()
      map.lazy("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Delete buffer" })

      map.lazy("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
      end, { desc = "Delete Buffer (Force)" })
    end,
  },
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
