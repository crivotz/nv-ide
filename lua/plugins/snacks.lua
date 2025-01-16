return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { },
    bigfile = { },
    bufdelete = { },
    debug = { enabled = false },
    dim = { },
    git = { },
    gitbrowse = { },
    indent = { },
    input = { },
    lazygit = { },
    notify = { },
    notifier = {
      timeout = 3000,
    },
    picker = {
      layout = {
        reverse = true,
        layout = {
          box = "horizontal",
          backdrop = false,
          width = 0.8,
          height = 0.9,
          border = "none",
          {
            box = "vertical",
            { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            { win = "input", height = 1, border = "rounded", title = "{source} {live}", title_pos = "center" },
          },
          {
            win = "preview",
            width = 0.45,
            border = "rounded",
            title = " Preview ",
            title_pos = "center",
          },
        },
      },
    },
    quickfile = { },
    rename = { enabled = false },
    scope = { },
    scroll = { },
    statuscolumn = { },
    terminal = { },
    toggle = { },
    win = { },
    words = { },
    zen = { },
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
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "p",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
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
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    { "<F8>",  function() Snacks.zen() end, desc = "ZEN" },
    -- PICKER
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>r", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fp", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>g", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>l", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>rb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>#", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>y", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>m", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>p", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>z", function() Snacks.picker.zoxide() end, desc = "Zoxide" },
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
