return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      actions = {
        sidekick_send = function(...)
          return require("sidekick.cli.picker.snacks").send(...)
        end,
      },
      win = {
        input = {
          keys = {
            ["<a-a>"] = {
              "sidekick_send",
              mode = { "n", "i" },
            },
          },
        },
      },
      sources = {
        explorer = {
          focus = "input",
        },
      },
      formatters = {
        file = {
          truncate = 100, -- truncate the file path to (roughly) this length
        },
      },
    },
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "h", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          {
            icon = " ",
            key = "g",
            desc = "Find modified file",
            action = ":lua Snacks.dashboard.pick('git_status')",
          },
          { icon = " ", key = "m", desc = "Show mark", action = ":HauntList" },
          { icon = " ", key = "t", desc = "Show todo", action = ":TodoTrouble" },
          { icon = " ", key = "z", desc = "ZSH", action = ":e ~/.zshrc" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
        ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗
        ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝
       ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗
       ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝
        ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗
        ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝
                                  Powered by LazyVim
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
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
    {
      "<leader>ob",
      function()
        Snacks.terminal("overmind connect backend")
      end,
      desc = "Toggle Terminal",
    },
    -- PICKER
    {
      "<leader>ga",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>l",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>rb",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>#",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<leader>z",
      function()
        Snacks.picker.zoxide()
      end,
      desc = "Zoxide",
    },
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },
  },
}
