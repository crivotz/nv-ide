require("indent_blankline").setup {
  buftype_exclude = {'terminal'},
  filetype_exclude = {'help', 'startify', 'alpha', 'dashboard', 'packer', 'neogitstatus', 'NvimTree'},
  char = '▏',
  show_current_context = true,
  show_current_context_start = true,  -- underline first line
  use_treesitter = true,
  show_trailing_blankline_indent = false,
}
