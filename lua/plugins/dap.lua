---@type LazySpec
local M = {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      'rcarriga/nvim-dap-ui',
      dependencies = { 'nvim-neotest/nvim-nio' },
    }, -- 'Pocco81/dap-buddy.nvim'
    { 'Pocco81/dap-buddy.nvim', branch = 'dev' },
    'jbyuki/one-small-step-for-vimkind',
    {
      'mxsdev/nvim-dap-vscode-js',
      dependencies = {
        {
          'microsoft/vscode-js-debug',
          lazy = true,
          build = 'pnpm i && pnpx gulp vsDebugServerBundle && rm -rf out && mv -f dist out',
        },
      },
    },
    -- {
    --   'theHamsta/nvim-dap-virtual-text',
    --   config = function()
    --     require('nvim-dap-virtual-text').setup()
    --   end,
    -- },
  },
}

M.config = function()
  local dap = require('dap')

  local p = '<M-d>'

  local function nm(key, func, desc)
    vim.keymap.set('n', p .. key, function()
      func()
    end, { desc = desc })
  end

  nm('b', dap.toggle_breakpoint, 'Breakpoint')
  nm('c', dap.clear_breakpoints, 'Clear all')
  nm('s', dap.continue, 'Continue')
  nm('j', dap.step_over, 'Step over')
  nm('k', dap.step_back, 'Step back')
  nm('i', dap.step_into, 'Step into')
  nm('o', dap.step_out, 'Step out')
  nm('p', dap.up, 'Up in stack')
  nm('n', dap.down, 'Down in stack')
  nm('g', dap.goto_, 'Goto current line')
  nm('t', dap.run_to_cursor, 'Continue to cursor')
  nm('B', function()
    dap.set_breakpoint(
      vim.fn.input('Condition: '),
      vim.fn.input('Hit condition: '),
      vim.fn.input('Log message: ')
    )
  end, 'Advanced breakpoint')
  -- nm('d', dap.repl.toggle, 'REPL')
  nm('.', dap.run_last, 'Rerun')
  nm('q', dap.terminate, 'Terminate')

  local dapui = require('dapui')
  dapui.setup()

  nm('e', dapui.eval, 'Eval')
  nm(p, function()
    dapui.toggle({ layout = 1 })
  end, 'Toggle UI')
  nm('d', function()
    dapui.toggle({ layout = 2 })
  end, 'Toggle Bottom UI')

  dap.listeners.after.event_initialized['dapui_config'] = function()
    ---@diagnostic disable-next-line: missing-parameter
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    ---@diagnostic disable-next-line: missing-parameter
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    ---@diagnostic disable-next-line: missing-parameter
    dapui.close()
  end

  --- Configs

  local di = require('dap-install')
  di.setup()
  di.config('python', {})
  -- di.config('jsnode', {})
  di.config('chrome', {})
  di.config('ccppr_vsc', {})

  dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = 'Attach to running Neovim instance',
      host = function()
        local value = vim.fn.input('Host [127.0.0.1]: ')
        if value ~= '' then
          return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input('Port: '))
        assert(val, 'Please provide a port number')
        return val
      end,
    },
  }

  dap.adapters.nlua = function(callback, config)
    ---@diagnostic disable-next-line: undefined-field
    callback({ type = 'server', host = config.host, port = config.port })
  end

  ---@diagnostic disable-next-line: missing-fields
  require('dap-vscode-js').setup({
    debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
    adapters = {
      'pwa-node',
      'pwa-chrome',
      'pwa-msedge',
      'node-terminal',
      'pwa-extensionHost',
    },
  })

  for _, lang in ipairs({
    'typescript',
    'javascript',
    'typescriptreact',
    'javascriptreact',
  }) do
    dap.configurations[lang] = {
      {
        type = 'pwa-chrome',
        request = 'launch',
        name = 'Launch & Debug Chrome',
        url = function()
          local co = coroutine.running()
          return coroutine.create(function()
            vim.ui.input({
              prompt = 'Enter URL: ',
              default = 'http://localhost:',
            }, function(url)
              if url == nil or url == '' then
                return
              else
                coroutine.resume(co, url)
              end
            end)
          end)
        end,
        webRoot = vim.fn.getcwd(),
        protocol = 'inspector',
        sourceMaps = true,
        userDataDir = false,
      },
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file (Node)',
        program = '${file}',
        cwd = '${workspaceFolder}',
        skipFiles = { '<node_internals>/**' },
        protocol = 'inspector',
        console = 'integratedTerminal',
        sourceMaps = true,
        resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
        runtimeExecutable = 'ts-node',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach (Node)',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
        skipFiles = { '<node_internals>/**' },
        protocol = 'inspector',
        console = 'integratedTerminal',
        sourceMaps = true,
        resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
        runtimeExecutable = 'ts-node',
      },
    }
  end
end

return M
