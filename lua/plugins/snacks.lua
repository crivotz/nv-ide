return {
  "folke/snacks.nvim",
  opts = {
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
      "<leader>gC",
      function()
        Snacks.input({
          prompt = "Issue title: ",
          icon = " ",
        }, function(title)
          if not title or title == "" then
            return
          end

          Snacks.input({
            prompt = "Labels (comma separated, optional): ",
            icon = "🏷️  ",
          }, function(labels)
            Snacks.input({
              prompt = "Assignees (comma separated, optional): ",
              icon = " ",
            }, function(assignees)
              local scratch = Snacks.scratch({
                ft = "markdown",
                name = "New GitHub Issue",
                icon = " ",
              })

              -- Template
              vim.api.nvim_buf_set_lines(scratch.buf, 0, -1, false, {
                "<!-- :w to submit, q to cancel -->",
                "",
                "## Description",
                "",
                "",
                "## Steps to reproduce",
                "",
                "1. ",
                "2. ",
                "3. ",
                "",
                "## Expected behavior",
                "",
                "",
                "## Actual behavior",
                "",
                "",
                "## Additional context",
                "",
                "",
              })

              -- Funzione per creare l'issue
              local function create_issue()
                local body_lines = vim.api.nvim_buf_get_lines(scratch.buf, 0, -1, false)
                scratch:close()

                local tmpfile = vim.fn.tempname()
                vim.fn.writefile(body_lines, tmpfile)

                local cmd_parts = {
                  "gh issue create",
                  "--title " .. vim.fn.shellescape(title),
                  "--body-file " .. vim.fn.shellescape(tmpfile),
                }

                if labels and labels ~= "" then
                  local label_list = vim.split(labels, ",", { trimempty = true })
                  for i, label in ipairs(label_list) do
                    label_list[i] = vim.trim(label)
                  end
                  cmd_parts[#cmd_parts + 1] = "--label " .. table.concat(label_list, ",")
                end

                if assignees and assignees ~= "" then
                  local assignee_list = vim.split(assignees, ",", { trimempty = true })
                  for i, assignee in ipairs(assignee_list) do
                    assignee_list[i] = vim.trim(assignee)
                  end
                  cmd_parts[#cmd_parts + 1] = "--assignee " .. table.concat(assignee_list, ",")
                end

                local final_cmd = table.concat(cmd_parts, " ")

                Snacks.notify.info("Creating issue...", { title = "GitHub" })

                vim.fn.jobstart(final_cmd, {
                  on_stdout = function(_, data)
                    if data and #data > 0 then
                      for _, line in ipairs(data) do
                        if line ~= "" and line:match("^https://") then
                          Snacks.notify.info(line, { title = "Issue Created" })
                        end
                      end
                    end
                  end,
                  on_exit = function(_, code)
                    vim.fn.delete(tmpfile)
                    if code == 0 then
                      Snacks.notify.info("Issue created successfully", { title = "GitHub" })
                    else
                      Snacks.notify.error("Failed to create issue", { title = "GitHub" })
                    end
                  end,
                })
              end

              -- Intercetta :w con autocmd
              vim.api.nvim_create_autocmd("BufWriteCmd", {
                buffer = scratch.buf,
                callback = create_issue,
                once = true,
              })

              -- Keymap per cancellare con q
              vim.api.nvim_buf_set_keymap(scratch.buf, "n", "q", "", {
                noremap = true,
                silent = true,
                callback = function()
                  scratch:close()
                  Snacks.notify.warn("Issue creation cancelled", { title = "GitHub" })
                end,
                desc = "Cancel",
              })

              -- Posiziona cursore
              vim.api.nvim_win_set_cursor(0, { 4, 0 })
              vim.cmd("startinsert")
            end)
          end)
        end)
      end,
      desc = "Create GitHub issue",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers({ layout = "vscode" })
      end,
      desc = "Buffers",
    },
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
