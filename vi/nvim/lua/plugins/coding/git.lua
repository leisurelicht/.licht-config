local utils = require("utils")
local map = require("utils.map")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    optional = true,
    opts = {
      current_line_blame_opts = { virt_text_pos = "right_align", delay = 0 },
      preview_config = { border = "rounded", style = "minimal", relative = "cursor", row = 0, col = 1 },
      on_attach = function(bufnr)
        if utils.unbind_key_buf(vim.bo[bufnr].filetype) then
          return
        end

        local gs = package.loaded.gitsigns
        map.set("n", "<leader>ga", gs.stage_hunk, { desc = "Add hunk", buffer = bufnr })
        map.set("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk", buffer = bufnr })
        -- stylua: ignore
        map.set("v", "<leader>ga", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, {desc = "Add hunk",  buffer = bufnr })
        -- stylua: ignore
        map.set("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, {desc = "Reset hunk",  buffer = bufnr })
        map.set("n", "<leader>gA", gs.stage_buffer, { desc = "Add buffer", buffer = bufnr })
        map.set("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer", buffer = bufnr })
        map.set("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk", buffer = bufnr })
        map.set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle line blame", buffer = bufnr })
        -- stylua: ignore
        map.set("n", "]g", function() if vim.wo.diff then return "]g" end vim.schedule(function() gs.next_hunk() end) return "<Ignore>" end, {desc = "Next git hunk",  buffer = bufnr, expr = true })
        -- stylua: ignore
        map.set("n", "[g", function() if vim.wo.diff then return "[g" end vim.schedule(function() gs.prev_hunk() end) return "<Ignore>" end, {desc = "Previous git hunk",  buffer = bufnr, expr = true })

        -- Text object
        map.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>", { desc = "Select git hunk", buffer = bufnr })
      end,
    },
  },
}
