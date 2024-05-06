return {
  "ibhagwan/fzf-lua",
  lazy = false,
  enabled = true,
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
    { "<leader>g", ":FzfLua git_status<CR>", noremap = true, silent = true, desc = "Git status" },
    { "<leader>ll", ":FzfLua grep { search = vim.fn.input('GREP -> ') }<CR>", noremap = true, silent = true, desc = "Grep a word" },
    { "<leader>y", ":lua require('neoclip.fzf')()<CR>", noremap = true, silent = true, desc = "Neoclip" },
    { "<leader>ns", ":FzfLua live_grep({ prompt='Note', cwd = '~/Notes'})<CR>", noremap = true, silent = true, desc = "Note" },
  },
  config = function()
    require("fzf-lua").setup({
      "telescope",
      defaults = {
        formatter = 'path.filename_first',
      },
      winopts = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
      }
    })
  end,
}
