if vim.fn.has('unix') == 1 then
  local uname = vim.fn.system('uname')
  if uname == "Darwin\n" then
    vim.opt.guifont = 'JetBrains Mono:h11'
  else
    vim.opt.guifont = 'JetBrains Mono 8'
  end
end
