local map = require("utils.map")

return {
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
}
