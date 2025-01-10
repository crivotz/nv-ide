return {
  'MagicDuck/grug-far.nvim',
  event = 'VeryLazy',
  keys = {
    {
      "<leader>sr",
      "<cmd>lua require('grug-far').toggle_instance({ instanceName='far', staticTitle='Search and Replace' })<CR>",
      mode = { "n", "o", "x" },
    },
    {
      "<leader>srw",
      "<cmd>lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
      mode = { "n", "o", "x" },
    },
  },
  config = function()
    require('grug-far').setup({
      -- startInInsertMode = false,
    });
  end
}
