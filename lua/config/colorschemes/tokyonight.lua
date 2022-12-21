require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "nvimtree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

grpid = vim.api.nvim_create_augroup('custom_highlights_tokyonight', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grpid,
  pattern = 'tokyonight',
  command =
  'hi NvimTreeNormal                     guibg=#16161e |' ..
  'hi NvimTreeEndOfBuffer                guibg=#16161e |' ..
  'hi NoiceCmdlinePopupBorderCmdline     guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePromptBorder              guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePromptNormal              guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePromptTitle               guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePromptPrefix              guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePromptCounter             guifg=#f7768e guibg=#1a1b26 |' ..
  'hi TelescopePreviewTitle              guifg=#9ece6a guibg=#1a1b26 |' ..
  'hi TelescopePreviewBorder             guifg=#9ece6a guibg=#1a1b26 |' ..
  'hi TelescopeResultsTitle              guifg=#9ece6a guibg=#1a1b26 |' ..
  'hi TelescopeResultsBorder             guifg=#9ece6a guibg=#1a1b26 |' ..
  'hi TelescopeMatching                  guifg=#e0af68 guibg=#1a1b26 |' ..
  'hi TelescopeSelection                 guifg=#c0caf5 guibg=#1a1b26 |' ..
  'hi FloatBorder                        guifg=#f7768e guibg=#1a1b26 |' ..
  'hi BqfPreviewBorder                   guifg=#f7768e guibg=#1a1b26 |' ..
  'hi NormalFloat                        guibg=#1a1b26 |' ..
  'hi markid1                            guifg=#ff90a8 |' ..
  'hi markid2                            guifg=#ffb87e |' ..
  'hi markid3                            guifg=#b8e884 |' ..
  'hi markid4                            guifg=#94bcff |' ..
  'hi markid5                            guifg=#f56565 |' ..
  'hi markid6                            guifg=#97e9ff |' ..
  'hi markid7                            guifg=#fac982 |' ..
  'hi markid8                            guifg=#d5b4ff |' ..
  'hi markid9                            guifg=#44ddf8 |' ..
  'hi markid10                           guifg=#34d6b6 |'
})
vim.cmd [[colorscheme tokyonight]]
