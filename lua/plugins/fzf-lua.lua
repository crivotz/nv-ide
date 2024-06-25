return {
  "ibhagwan/fzf-lua",
  lazy = false,
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>r", ":FzfLua live_grep<CR>", noremap = true, silent = true, desc = "Live grep" },
    { "<leader>#", ":FzfLua grep_cword<CR>", noremap = true, silent = true, desc = "Grep current word" },
    { "<leader>m", ":FzfLua marks<CR>", noremap = true, silent = true, desc = "Marks" },
    { "<leader>b", ":FzfLua buffers<CR>", noremap = true, silent = true, desc = "Buffers" },
    { "<leader>l", ":FzfLua blines<CR>", noremap = true, silent = true, desc = "Buffer lines" },
    { "<leader>f", ":FzfLua files<CR>", noremap = true, silent = true, desc = "Files" },
    { "<leader>ts", ":FzfLua lsp_document_symbols<CR>", noremap = true, silent = true, desc = "Files" },
    { "<leader>fp", ":FzfLua git_files<CR>", noremap = true, silent = true, desc = "Git files" },
    { "<leader>p", ":GitProjects<CR>", noremap = true, silent = true, desc = "Git files" },
    { "<leader>g", ":FzfLua git_status<CR>", noremap = true, silent = true, desc = "Git status" },
    { "<leader>ll", ":FzfLua grep { search = vim.fn.input('GREP -> ') }<CR>", noremap = true, silent = true, desc = "Grep a word" },
    { "<leader>y", ":lua require('neoclip.fzf')()<CR>", noremap = true, silent = true, desc = "Neoclip" },
    { "<leader>ns", ":FzfLua live_grep({ prompt='Note', cwd = '~/Notes'})<CR>", noremap = true, silent = true, desc = "Note" },
  },
  config = function()
    require("fzf-lua").setup({
      -- "telescope",
      fzf_opts = {
        ['--layout'] = 'reverse-list',
        -- ['--with-nth'] = '2..,-1',
      },
      defaults = {
        -- formatter = 'path.filename_first',
      },
      winopts = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
      }
    })
    _G.fzf_dirs = function(opts)
      local fzf_lua = require'fzf-lua'
      opts = opts or {}
      opts.prompt = "Git projects❯ "
      opts.fn_transform = function(x)
        return fzf_lua.utils.ansi_codes.magenta(x)
      end
      opts.actions = {
        ['default'] = function(selected)
          fzf_lua.files({ cwd = selected[1] })
        end
      }
      if (vim.fn.executable 'plocate' == 1) then
        fzf_lua.fzf_exec("plocate '.git' | sed 's/\\/.git//'", opts)
      end
    end

    vim.cmd([[command! -nargs=* GitProjects lua _G.fzf_dirs()]])

  end,
}
