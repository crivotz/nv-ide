local M = {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  enabled = true,
    keys = {
      { "<leader>r", ":lua require'telescope'.extensions.egrepify.egrepify {}<CR>", noremap = true, silent = true, desc = "RG" },
      { "<leader>#", ":lua require('telescope.builtin').grep_string()<CR>", noremap = true, silent = true, desc = "Grep string" },
      { "<leader>ts", ":lua require('telescope.builtin').treesitter()<CR>", noremap = true, silent = true, desc = "Treesitter" },
      { "<leader>m", ":lua require('telescope.builtin').marks()<CR>", noremap = true, silent = true, desc = "Marks" },
      { "<leader>b", ":lua require('config.plugins.telescope').my_buffers()<CR>", noremap = true, silent = true, desc = "Buffers" },
      { "<leader>l", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", noremap = true, silent = true, desc = "Search line buffer" },
      { "<leader>f", ":lua require('telescope.builtin').find_files({hidden=true})<CR>", noremap = true, silent = true, desc = "Find files" },
      { "<leader>fp", ":lua require('config.plugins.telescope').project_files()<CR>", noremap = true, silent = true, desc = "Project files" },
      { "<leader>p", ":lua require'telescope'.extensions.repo.list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%.asdf/', '/%.zinit/', '/%.tmux/'}}<CR>", noremap = true, silent = true, desc = "Projects" },
      { "<leader>g", ":lua require('config.plugins.telescope').my_git_status()<CR>", noremap = true, silent = true, desc = "Git status" },
      { "<leader>ns", ":lua require('config.plugins.telescope').my_note()<CR>", noremap = true, silent = true, desc = "Note" },
      { "<leader>y", ":Telescope neoclip<CR>", noremap = true, silent = true, desc = "Neoclip" },
      { "<leader>ll", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('GREP -> ') })<CR>", noremap = true, silent = true, desc = "Grep string" },
      { "<leader>z", ":Telescope zoxide list<CR>", noremap = true, silent = true, desc = "Zoxide" },
    },
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "fdschmidt93/telescope-egrepify.nvim" },
    { "jvgrootveld/telescope-zoxide" },
  },
}

function M.config()
  local actions = require('telescope.actions')
  local trouble = require("trouble.providers.telescope")
  local telescope = require("telescope")
  telescope.setup{
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.95,
        preview_cutoff = 120,
      },
      -- prompt_prefix = "λ -> ",
      prompt_prefix = "   ",
      selection_caret = "|> ",
      winblend = 0,
      border = {},
      borderchars = {
        prompt = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
        -- preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
        -- results = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"},
        -- prompt = {" ", " ", " ", " ", " ", " ", " ", " "},
        preview = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        results = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
      },
      path_display = {
        filename_first = {
          reverse_directories = false
        }
      },
      set_env = { ["COLORTERM"] = "truecolor" },
      mappings = {
        i = {
          ["<c-t>"] = trouble.open_with_trouble,
        },
        n = {
          --[[ ["<c-t>"] = trouble.open_with_trouble ]]
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }

  -- Extensions

  telescope.load_extension('repo')
  telescope.load_extension('neoclip')
  telescope.load_extension('notify')
  telescope.load_extension('dap')
  telescope.load_extension('fzf')
  telescope.load_extension('zoxide')
  telescope.load_extension("egrepify")

  previewers = require('telescope.previewers')
  builtin = require('telescope.builtin')
  local conf = require('telescope.config')
  local delta = previewers.new_termopen_previewer {
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == ' D' then
        return
      end

      if entry.status == '??' then
        return { 'bat', '--style=plain', '--pager', 'less -R', entry.value }
      end

      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value }
    end
  }
end

function M.my_git_commits(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

function M.my_git_bcommits(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

function M.my_git_status(opts)
  opts = opts or {}
  opts.git_icons = {
    added = "",
    changed = "",
    copied = "C",
    renamed = "",
    unmerged = "",
    untracked = "",
    deleted = "✖",
  }
  opts.previewer = delta

  builtin.git_status(opts)
end

function M.my_note(opts)
  builtin.live_grep { prompt_title = ' Note ', cwd = '~/Notes' }
end

function M.project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

function M.my_buffers(opts)
   builtin.buffers {
    layout_strategy = "vertical",
    ignore_current_buffer = true,
    sort_mru = true
  }
end

return M
