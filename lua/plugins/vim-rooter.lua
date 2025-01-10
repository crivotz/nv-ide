return {
  "airblade/vim-rooter",
  lazy = false,
  config = function()
    vim.g.rooter_silent_chdir = 1
    vim.g.rooter_cd_cmd = 'lcd'
    vim.g.rooter_resolve_links = 1
    vim.g.rooter_patterns = { '.git', '.git/' }
  end,
}
