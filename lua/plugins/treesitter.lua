return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ignore_install = { "ipkg" },
      highlight = {
        enable = true,
        --[[ disable = { "embedded_template" } ]]
        disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
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
