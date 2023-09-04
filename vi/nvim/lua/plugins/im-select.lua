local utils = require("utils")

return {
  {
    "brglng/vim-im-select",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ui",
        function()
          vim.cmd([[ImSelectEnable]])
          log.info("Enabled im select", { title = "Option" })
        end,
        desc = "Enable imselect",
      },
      {
        "<leader>uI",
        function()
          vim.cmd([[ImSelectDisable]])
          log.warn("Disabled im select", { title = "Option" })
        end,
        desc = "Disable imselect",
      },
    },
    init = function()
      vim.g.im_select_enable_focus_events = 1
      if utils.sys.is_macos() or utils.sys.is_linux() then
        vim.api.nvim_create_autocmd({ "TermEnter" }, {
          group = vim.api.nvim_create_augroup("im_select", { clear = true }),
          pattern = { "*" },
          command = "call system('im-select com.apple.keylayout.ABC')",
        })
      end
    end,
  },
}
