local function win_num()
  local num = vim.api.nvim_eval("winnr()")
  return "[" .. num .. "]"
end

local function title(t)
  return string.format("[[%s]]", t)
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
      local _opts = {
        options = {
          component_separators = { left = "|", right = "|" },
          disabled_filetypes = { winbar = { "alpha", "dashboard", "neo-tree" } },
        },
        winbar = {
          lualine_a = { { win_num } },
          lualine_c = {
            {
              "filename",
              path = 0,
              newfile_status = true,
              symbols = { modified = "[Modified]", readonly = "[Read Only]", unnamed = "[No Name]", newfile = "[New]" },
            },
          },
          lualine_x = { diagnostic_check },
        },
        inactive_winbar = {
          lualine_a = { { win_num, separator = { right = "" }, color = { fg = "white", bg = "grey" } } },
          lualine_c = { { "filename", path = 4, newfile_status = false } },
          lualine_x = { diagnostic_check },
        },
      }
      opts = vim.tbl_deep_extend("force", opts, _opts)

      vim.list_extend(opts.sections.lualine_x, { "filetype", "encoding", "fileformat" })

      local mason_registry = require("mason-registry")
      vim.list_extend(opts.extensions, {
        "man",
        "trouble",
        "toggleterm",
        "quickfix",
        {
          filetypes = { "mason" },
          sections = {
            lualine_a = {
              function()
                return "Mason"
              end,
            },
            lualine_b = {
              {
                function()
                  return "Installed: "
                    .. #mason_registry.get_installed_packages()
                    .. "/"
                    .. #mason_registry.get_all_package_specs()
                end,
              },
            },
          },
        },
        {
          filetypes = { "TelescopePrompt" },
          sections = {
            lualine_a = { { title("Telescope"), separator = { right = "" } } },
          },
        },
      })
      return opts
    end,
  },
}
