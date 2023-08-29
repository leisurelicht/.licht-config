return {
  {
    "folke/flash.nvim",
    config = function(_, opts)
      require("flash").setup(opts)

      local Config = require("flash.config")
      local Char = require("flash.plugins.char")
      for _, motion in ipairs({ "f", "t", "F", "T" }) do
        vim.keymap.set({ "n", "x", "o" }, motion, function()
          require("flash").jump(Config.get({
            mode = "char",
            search = {
              mode = Char.mode(motion),
              max_length = 1,
            },
          }, Char.motions[motion]))
        end)
      end
    end,
  },
}
