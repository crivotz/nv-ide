local dashboard = require"alpha.themes.dashboard"
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local date = os.date("%d-%m-%Y")
  local time = os.date("%H:%M:%S")
  return "[ " .. total_plugins .. " plugins] [ " .. date .. "] [ " .. time .. "]"
end

dashboard.section.header.val = {
  [[    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗ ]],
  [[    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝ ]],
  [[    ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗   ]],
  [[    ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝   ]],
  [[    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗ ]],
  [[    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝ ]]
}

dashboard.section.buttons.val = {
  button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  button("o", "ﭯ  Recently opened files", ":Telescope oldfiles<CR>"),
  button("f", "  Find file", ":lua require('plugins.telescope').project_files()<CR>"),
  button("p", "  Find project", ":lua require('telescope').extensions.project.project{}<CR>"),
  button("r", "  Find word", ":lua require('telescope.builtin').live_grep()<CR>"),
  button("g", "  Find modified file", ":lua require('plugins.telescope').my_git_status()<CR>"),
  button("t", "  Show todo", ":TodoTelescope<CR>"),
  button("s", "  NV-IDE plugins", ":e ~/.config/nvim/lua/plugins.lua<CR>"),
  button("u", "  Sync plugins", ":PackerSync<CR>"),
  button("q", "  Quit", "<Cmd>qa<CR>")
}
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

require"alpha".setup(dashboard.opts)

-- hide tabline on startup screen
vim.cmd [[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
augroup END
]]
