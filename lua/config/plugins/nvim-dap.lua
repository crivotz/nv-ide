local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
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
