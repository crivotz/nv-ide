vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
vim.g.gruvbox_material_palette = "material" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = 'none'
vim.cmd 'color gruvbox-material'
-- Telescope
vim.cmd([[
hi TelescopePromptBorder guifg=#f2594b guibg=#282828
hi TelescopePromptNormal  guifg=#f2594b guibg=#282828
hi TelescopePromptTitle  guifg=#f2594b guibg=#282828
hi TelescopePromptPrefix  guifg=#f2594b guibg=#282828
hi TelescopePromptCounter  guifg=#f2594b guibg=#282828

hi TelescopePreviewTitle  guifg=#8bba7f guibg=#282828
hi TelescopePreviewBorder guifg=#8bba7f guibg=#282828

hi TelescopeResultsTitle  guifg=#8bba7f guibg=#282828
hi TelescopeResultsBorder guifg=#8bba7f guibg=#282828

hi TelescopeMatching guifg=#e9b143 guibg=#282828
hi TelescopeSelection guifg=#ffffff guibg=#32302f
]])
-- Term
vim.cmd([[
hi FloatBorder guifg=#f2594b guibg=#282828
hi NormalFloat guibg=#282828
]])
vim.cmd([[
highlight NvimTreeNormal guibg=#141414
]])
