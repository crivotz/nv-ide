require("onedarkpro").setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  styles = { -- Choose from "bold,italic,underline"
    comments = "italic",
    functions = "NONE",
    keywords = "bold,italic",
    strings = "NONE",
    variables = "NONE",
    virtual_text = "NONE"
  },
})
vim.cmd [[colorscheme onedarkpro]]
-- Telescope
vim.cmd([[
hi TelescopePromptBorder guifg=#e06c75 guibg=#282c34
hi TelescopePromptNormal  guifg=#e06c75 guibg=#282c34
hi TelescopePromptTitle  guifg=#e06c75 guibg=#282c34
hi TelescopePromptPrefix  guifg=#e06c75 guibg=#282c34
hi TelescopePromptCounter  guifg=#e06c75 guibg=#282c34

hi TelescopePreviewTitle  guifg=#98c379 guibg=#282c34
hi TelescopePreviewBorder guifg=#98c379 guibg=#282c34

hi TelescopeResultsTitle  guifg=#98c379 guibg=#282c34
hi TelescopeResultsBorder guifg=#98c379 guibg=#282c34

hi TelescopeMatching guifg=#e5c07b guibg=#282c34
hi TelescopeSelection guifg=#abb2bf guibg=#181825
]])
-- Term
vim.cmd([[
hi FloatBorder guifg=#e06c75 guibg=#282c34
hi NormalFloat guibg=#282c34
]])
