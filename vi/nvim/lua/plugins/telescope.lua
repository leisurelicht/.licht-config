-- =================
-- telescope.lua --- telescope init file
-- Author: MuCheng
-- =================
--
local ok, telescope = pcall(require, "telescope")
if not ok then
  print("require symbols-outline failed")
  return
end

telescope.setup {
  pickers = {
    find_files = {
      -- theme = "dropdown",
    }
  },
}

telescope.load_extension("fzf")

nmap = {
  f = {
    name = "+Find",
    t = {"<CMD>Telescope<CR>", "Telescope List"},
    f = {"<CMD>Telescope find_files<CR>", "File"},
    l = {"<CMD>Telescope live_grep<CR>", "String"},
    b = {"<CMD>Telescope buffers<CR>", "Buffer"},
    h = {"<CMD>Telescope help_tags<CR>", "Help Tags"},
    O = {"<CMD>Telescope vim_options<CR>", "Vim Option"},
    c = {"<CMD>Telescope commands<CR>", "Command"},
    C = {"<CMD>Telescope autocommand<CR>", "Help Tags"},
    h = {
      name = "+History",
      c = {"<CMD>Telescope command_history<CR>", "Help Tags"},
      s = {"<CMD>Telescope search_history<CR>", "Help Tags"},
    },
    g = {
      name = "+Git",
      c = {"<CMD>Telescope git_commits<CR>", "Git Commits"},
      b = {"<CMD>Telescope git_bcommits<CR>", "Git Buffer's Commits"},
      r = {"<CMD>Telescope git_branches<CR>", "Git Branches"},
      s = {"<CMD>Telescope git_status<CR>", "Git Status"},
      h = {"<CMD>Telescope git_stash<CR>", "Git Stash"},
    }
  }
}

tableMerge(WhichKeyMap.maps.normal, nmap)


