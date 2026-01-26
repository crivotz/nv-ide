return {
  '2kabhishek/seeker.nvim',
  dependencies = { 'folke/snacks.nvim' },
  cmd = { 'Seeker' },
  keys = {
    { '<leader>f', ':Seeker files<CR>', desc = 'Seek Files' },
    { '<leader>r', ':Seeker grep<CR>', desc = 'Seek Grep' },
  },
  opts = { },
}
