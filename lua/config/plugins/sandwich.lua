return {
  "machakann/vim-sandwich",
  event = "VeryLazy",
  config = function()
    vim.cmd([[
      runtime macros/sandwich/keymap/surround.vim

      " Text objects to select
      " the nearest surrounded text automatically
      xmap iss <Plug>(textobj-sandwich-auto-i)
      xmap ass <Plug>(textobj-sandwich-auto-a)
      omap iss <Plug>(textobj-sandwich-auto-i)
      omap ass <Plug>(textobj-sandwich-auto-a)

      " remap to override again
      " xmap S <Plug>Lightspeed_S
      let g:sandwich#recipes += [
      \   {
      \     'buns':     ['<%= ', ' %>'],
      \     'filetype': ['eruby'],
      \     'input':    ['='],
      \     'nesting':  1
      \   },
      \   {
      \     'buns':     ['<% ', ' %>'],
      \     'filetype': ['eruby'],
      \     'input':    ['-'],
      \     'nesting':  1
      \   },
      \   {
      \     'buns':     ['<%# ', ' %>'],
      \     'filetype': ['eruby'],
      \     'input':    ['#'],
      \     'nesting':  1
      \   }
      \ ]
    ]])
  end,
}
