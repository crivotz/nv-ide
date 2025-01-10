local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc="DAP continue" },
    { "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", desc="DAP step over" },
    { "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", desc=" DAP step into" },
    { "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", desc="DAP step out" },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc="DAP toggle breakpoint" },
    { "<leader>dui", ":lua require('dapui').toggle()<cr>", desc="DAP toggle" },
    { "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", desc="DAP replace" },
    { "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", desc="DAP commands" },
    { "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", desc="DAP list breakpoint" },
    { "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", desc="DAP variables" },
    { "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", desc="DAP frames" },
  },
}
function M.config()
  local dap, dapui = require("dap")

  vim.fn.sign_define('DapBreakpoint', {text='', texthl='error', linehl='', numhl=''})
  -- ADAPTERS
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node-debug2-adapter',
    -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
    -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
    args = {},
  }
  dap.configurations.javascript = {
    {
      name = 'Launch',
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      restart = true,
      -- port = 9229
      processId = require'dap.utils'.pick_process,
    },
  }
  dap.adapters.ruby = {
    type = 'executable';
    command = 'bundle';
    args = {'exec', 'readapt', 'stdio'};
  }

  dap.configurations.ruby = {
    {
      type = 'ruby';
      request = 'launch';
      name = 'Rails';
      program = 'bundle';
      programArgs = {'exec', 'rails', 's'};
      useBundler = true;
    },
  }
end
return M
