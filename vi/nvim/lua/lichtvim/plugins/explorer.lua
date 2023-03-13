local function print_node_path(node)
  print(node.absolute_path)
end

local function open_nvim_tree(data)
  local alpha = vim.bo[data.buf].ft == "alpha"

  if alpha then
    return
  end

  -- buffer is a directory
  local directory = require("utils.file").is_dir(data.file)

  --[[ if not real_file and not directory then ]]
  if not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  --[[ tree_api.toggle({ focus = false, find_file = true, }) ]]
  require("nvim-tree.api").open()
end

return {
  "nvim-tree/nvim-tree.lua",
  vertions = "nightly",
  dependencies = {"ahmedkhalf/project.nvim"},
  cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle"},
  keys = {
    {"<leader>e", "<CMD>NvimTreeFindFileToggle<CR>", desc = "Explorer"}
  },
  init = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
  end,
  config = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback
    require("nvim-tree").setup(
      {
        open_on_tab = false,
        system_open = {cmd = nil, args = {}},
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
        view = {
          width = 30,
          mappings = {
            list = {
              {key = "p", action = "print_path", action_cb = print_node_path},
              {key = "s", cb = tree_cb("vsplit")},
              {key = "o", cb = tree_cb("split")},
              {key = "<C-o>", cb = tree_cb("system_open")}
            }
          },
          number = true
        }
      }
    )
    api.autocmd({"VimEnter", "BufRead"}, {callback = open_nvim_tree})
  end
}
