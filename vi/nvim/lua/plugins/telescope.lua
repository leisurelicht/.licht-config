-- =================
-- telescope.lua --- telescope init file
-- Author: MuCheng
-- =================
--
local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("Require symbols-outline Failed", "warn")
  return
end

telescope.setup {
  pickers = {
    find_files = { theme = "dropdown" },
    oldfiles = { theme = "dropdown" },
    buffers = { theme = "dropdown" },
    marks = { theme = "dropdown" },
    commands = { theme = "ivy" },
    command_history = { theme = "ivy" },
    search_history = { theme = "ivy" },
    git_commits = { theme = "ivy" },
    git_bcommits = { theme = "ivy" },
    git_branches = { theme = "ivy" },
    git_status = { theme = "ivy" },
    git_stash = { theme = "ivy" },
  },
}

telescope.load_extension("fzf")
telescope.load_extension("notify")

nmap = {
  f = {
    name = "+Find",
    t = {"<CMD>Telescope<CR>", "Telescope List"},
    f = {"<CMD>Telescope find_files<CR>", "File"},
    o = {"<CMD>Telescope oldfiles<CR>", "Recently Opened File"},
    w = {"<CMD>Telescope grep_string<CR>", "Word"},
    s = {"<CMD>Telescope live_grep<CR>", "String"},
    b = {"<CMD>Telescope buffers<CR>", "Buffer"},
    m = {"<CMD>Telescope marks<CR>", "Marks"},
    h = {"<CMD>Telescope help_tags<CR>", "Help Tags"},
    O = {"<CMD>Telescope vim_options<CR>", "Vim Option"},
    c = {"<CMD>Telescope commands<CR>", "Command"},
    C = {"<CMD>Telescope autocommand<CR>", "AutoCommand"},
    h = {
      name = "+History",
      c = {"<CMD>Telescope command_history<CR>", "Command"},
      s = {"<CMD>Telescope search_history<CR>", "Search"},
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

tableMerge(WhichKeyMap.leaderMaps.normal, nmap)


