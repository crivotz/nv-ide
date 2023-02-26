return {
  "nvchad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('colorizer').setup {
      user_default_options = {
        RRGGBBAA = true;         -- #RRGGBBAA hex codes
        rgb_fn   = true;         -- CSS rgb() and rgba() functions
        hsl_fn   = true;         -- CSS hsl() and hsla() functions
        css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
    }
  end,
}
