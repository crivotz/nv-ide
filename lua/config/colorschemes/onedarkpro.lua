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
grpid = vim.api.nvim_create_augroup('custom_highlights_onedarkpro', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grpid,
  pattern = 'onedarkpro',
  command =
  'hi NvimTreeNormal                     guibg=#0F131B |' ..
  'hi NvimTreeEndOfBuffer                guibg=#0F131B |' ..
  'hi NoiceCmdlinePopupBorderCmdline     guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePromptBorder              guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePromptNormal              guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePromptTitle               guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePromptPrefix              guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePromptCounter             guifg=#e06c75 guibg=#282c34 |' ..
  'hi TelescopePreviewTitle              guifg=#98c379 guibg=#282c34 |' ..
  'hi TelescopePreviewBorder             guifg=#98c379 guibg=#282c34 |' ..
  'hi TelescopeResultsTitle              guifg=#98c379 guibg=#282c34 |' ..
  'hi TelescopeResultsBorder             guifg=#98c379 guibg=#282c34 |' ..
  'hi TelescopeMatching                  guifg=#e5c07b guibg=#282c34 |' ..
  'hi TelescopeSelection                 guifg=#abb2bf guibg=#32302f |' ..
  'hi FloatBorder                        guifg=#e06c75 guibg=#282c34 |' ..
  'hi BqfPreviewBorder                   guifg=#e06c75 guibg=#282c34 |' ..
  'hi NormalFloat                        guibg=#282c34 |' ..
  'hi IndentBlanklineContextChar         guifg=#d3869b |' ..
  'hi markid1                            guifg=#ff8f88 |' ..
  'hi markid2                            guifg=#ffb074 |' ..
  'hi markid3                            guifg=#cfdc8b |' ..
  'hi markid4                            guifg=#a3d4c9 |' ..
  'hi markid5                            guifg=#f9acc1 |' ..
  'hi markid6                            guifg=#afdaa8 |' ..
  'hi markid7                            guifg=#fecc7d |' ..
  'hi markid8                            guifg=#eed8b2 |' ..
  'hi markid9                            guifg=#ffedc7 |' ..
  'hi markid10                           guifg=#cebfaa |'
})
vim.cmd'colorscheme onedarkpro'
