return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    debug = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    notify = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    rename = { enabled = false },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "e", desc = "New file", action = ":ene | startinsert" },
          { icon = "ﭯ ", key = "o", desc = "Recently opened files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Find word", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "g", desc = "Find modified file", action = ":lua Snacks.dashboard.pick('git_status')"  },
          { icon = " ", key = "p", desc = "Find project", action = ":Telescope repo list", enabled = package.loaded["telescope"] ~= nil },
          { icon = " ", key = "p", desc = "Find project", action = ":GitProjects", enabled = package.loaded["fzflua"] ~= nil },
          { icon = " ", key = "m", desc = "Show mark", action =":lua Snacks.dashboard.pick('marks')"  },
          { icon = " ", key = "t", desc = "Show todo", action = ":TodoTrouble" },
          { icon = " ", key = "s", desc = "NV-IDE plugins", action = ":e ~/.config/nvim/lua/plugins/init.lua" },
          { icon = " ", key = "z", desc = "ZSH", action = ":e ~/.zshrc" },
          { icon = "󰒲 ", key = "u", desc = "Lazy sync", action = ":Lazy sync", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗
    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝
   ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗
   ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝
    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗
    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝
    ]]
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup", padding = 1 },
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   cmd = "tty-clock -c -C 4 -r -D",
        --   height = 7,
        --   padding = 1,
        -- },
        {
          pane = 2,
          section = "terminal",
          cmd = "fastfetch --config ~/.config/fastfetch/config.jsonc",
          height = 6,
          padding = 1,
        },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = vim.fn.isdirectory(".git") == 1,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        {
          pane = 3,
          icon = " ",
          title = "GH Issues",
          section = "terminal",
          cmd = "gh issue list",
          padding = 1,
          height = 15
        },
        {
          pane = 3,
          icon = " ",
          title = "GH Pull Requests",
          section = "terminal",
          cmd = "gh pr list",
          padding = 1,
          height = 15
        },
      },
    },
  },
  keys = {
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    { "<leader>bda", function() Snacks.bufdelete.all() end, desc = "Delete all buffer" },
    { "<leader>bdh", function() Snacks.bufdelete.other() end, desc = "Delete other buffer" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>x",  function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<leader>ld", function() Snacks.terminal("lazydocker") end, desc = "Toggle Terminal" },
    { "<leader>ob", function() Snacks.terminal("overmind connect backend") end, desc = "Toggle Terminal" },
    { "<leader>gpr", function() Snacks.terminal("gh pr list && echo 'Press enter...'; read") end, desc = "PR list" },
    { "<leader>gprc", function() Snacks.terminal("gh pr create") end, desc = "PR Create" },
    { "<leader>gprm", function() Snacks.terminal("gh pr ready ; gh pr merge") end, desc = "PR merge" },
    { "<leader>gi", function() Snacks.terminal("gh issue list && echo 'Press enter...'; read") end, desc = "Issue list" },
    { "<leader>gio", function() Snacks.terminal("gh issue create") end, desc = "Issue create" },
    { "<leader>gic", function() local issue_number = vim.fn.input('Issue Number -> ') Snacks.terminal("gh issue close " .. issue_number) end, },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Create some toggle mappings
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
      end,
    })
  end,
}
