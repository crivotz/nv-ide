if vim.fn.has('unix') == 1 then
  local uname = vim.fn.system('uname')
  if uname == "Darwin\n" then
    vim.opt.guifont = 'JetBrains Mono:h12'
  elseif vim.g.neovide then
    vim.opt.guifont = 'JetBrains Mono:h12'
  else
    vim.opt.guifont = 'JetBrains Mono 12'
  end
end
