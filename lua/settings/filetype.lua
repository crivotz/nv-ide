vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.html.eex",
  command = "set filetype=html_eex"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "/tmp/mutt-*",
  command = "set filetype=mail"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "/*.rasi",
  command = "set filetype=css"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.pdf.erb",
  command = "let b:eruby_subtype='html'"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.pdf.erb",
  command = "set filetype=eruby"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.y*",
  command = "set filetype=yaml"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "jquery.*.js",
  command = "set filetype=javascript syntax=jquery"
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ejs",
  command = "set filetype=html"
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "TelescopePrompt",
  command = "setlocal nocursorline"
})
