function NewNote()
  vim.ui.input({ prompt = "Name: " }, function(name)
    vim.api.nvim_command(":e ~/Notes/"..name..".md")
  end)
end
