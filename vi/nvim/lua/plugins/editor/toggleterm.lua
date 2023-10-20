local Util = require("lazyvim.util")
local map = require("utils.map")

--- Add a terminal window
local function smart_add_terminal()
  ---@diagnostic disable-next-line: undefined-field
  if vim.b.toggle_number == nil then
    Util.warn("Need to create a terminal and move in it first", { title = " ToggleTerm" })
    return
  end

  local direction = require("toggleterm.ui").guess_direction()

  if direction == nil then
    if vim.g._term_direction == 1 then
      direction = "vertical"
    elseif vim.g._term_direction == 2 then
      direction = "horizontal"
    elseif vim.g._term_direction == 0 then
      Util.warn("Can not add a terminal window", { title = " ToggleTerm" })
      return
    end
  end

  Util.info("direction: " .. direction)

  -- Util.info("direction: " .. vim.g._term_direction)

  if direction == "vertical" then
    vim.g._term_direction = 1
    vim.cmd("exe b:toggle_number+1.'ToggleTerm direction=vertical'")
  elseif direction == "horizontal" then
    vim.g._term_direction = 2
    vim.cmd("exe b:toggle_number+1.'ToggleTerm direction=horizontal'")
  elseif direction == "float" then
    Util.info("Float terminal can not be copy")
  end
end

return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.defaults["<leader>o"] = { name = " Terminal" }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<C-\\>", "<CMD>exe v:count1 . 'ToggleTerm'<CR>", desc = "Toggle terminal" },
      { "<leader>of", "<CMD>ToggleTerm direction=float<CR>", desc = "Toggle in float" },
      { "<leader>ot", "<CMD>ToggleTerm direction=tab<CR>", desc = "Toggle in tab" },
      { "<leader>oh", "<CMD>ToggleTerm direction=horizontal<CR>", desc = "Toggle in horizontal" },
      { "<leader>ov", "<CMD>ToggleTerm direction=vertical<CR>", desc = "Toggle in vertical" },
      { "<leader>or", "<CMD>ToggleTermSendCurrentLine<CR>", desc = "Send current line" },
      { "<leader>or", "<CMD>ToggleTermSendVisualLines<CR>", desc = "Send visual lines" },
      { "<leader>os", "<CMD>ToggleTermSendVisualSelection<CR>", desc = "Send visual selection" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        winblend = 0,
        border = "rounded",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
    init = function()
      vim.g._term_direction = 0
    end,
    config = function(_, opts)
      require("toggleterm").setup(opts)

      vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = vim.api.nvim_create_augroup("toggleterm_keymap", { clear = true }),
        pattern = { "term://*" },
        callback = function()
          map.set("t", "<C-=>", smart_add_terminal, { desc = "Add new terminal", buffer = 0 })
          map.set("t", "<space><esc>", [[<C-\><C-n>]], { desc = "Esc", buffer = 0 })
          map.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Up", buffer = 0 })
          map.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Down", buffer = 0 })
          map.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Left", buffer = 0 })
          map.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Right", buffer = 0 })
        end,
      })
    end,
  },
}
