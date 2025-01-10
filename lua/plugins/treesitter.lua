return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      highlight = {
        enable = true,
        --[[ disable = { "embedded_template" } ]]
      },
      indent = {
        enable = true
      },
      matchup = {
        enable = true
      }
    }
  end,
}
