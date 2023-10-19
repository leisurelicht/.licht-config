local function win_num()
  return "[" .. vim.api.nvim_eval("winnr()") .. "]"
end

local diagnostic_check = {
  function()
    return "󰸞 "
  end,
  cond = function()
    return #vim.diagnostic.get(0) == 0
  end,
  color = require("lazyvim.util").ui.fg("DiagnosticInfo"),
}

return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.options.component_separators = { left = "|", right = "|" }
      opts.options.disabled_filetypes.winbar = { "alpha", "dashboard", "neo-tree" }

      local winbar = {
        winbar = {
          lualine_a = { { win_num } },
          lualine_c = { { "filename", path = 1, newfile_status = true, symbols = { readonly = "[Read Only]" } } },
          lualine_x = { diagnostic_check },
        },
        inactive_winbar = {
          lualine_a = { { win_num, separator = { right = "" }, color = { fg = "white", bg = "grey" } } },
          lualine_c = { { "filename", path = 4, newfile_status = false } },
          lualine_x = { diagnostic_check },
        },
      }
      opts = vim.tbl_deep_extend("force", opts, winbar)

      table.remove(opts.sections.lualine_c)
      vim.list_extend(opts.sections.lualine_c, { { "filename", path = 1 } })

      vim.list_extend(opts.sections.lualine_x, { "filetype", "encoding", "fileformat" })

      vim.list_extend(opts.extensions, {
        "man",
        "trouble",
        "quickfix",
        "mason",
        {
          filetypes = { "TelescopePrompt" },
          sections = {
            lualine_a = {
              function()
                return "Telescope"
              end,
            },
          },
        },
      })
      return opts
    end,
  },
}
