hot_reload(debug.getinfo(1).source:sub(2))

local dap = require('dap')

local mx = require('mapx')
local p = '<M-d>'
mx.nname(p, 'dap')

local function nm(key, func, desc)
  mx.nnoremap(p .. key, function() func() end, desc)
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
  dap.set_breakpoint(vim.fn.input('Condition: '),
                     vim.fn.input('Hit condition: '),
                     vim.fn.input('Log message: '))
end, 'Advanced breakpoint')
nm('d', dap.repl.toggle, 'REPL')
nm('.', dap.run_last, 'Rerun')
nm('q', dap.terminate, 'Terminate')

local dapui = require('dapui')
dapui.setup()

nm('e', dapui.eval, 'Eval')
nm(p, dapui.toggle, 'Toggle UI')

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
      if value ~= '' then return value end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, 'Please provide a port number')
      return val
    end
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end

require('dap-vscode-js').setup({
  adapters = {
    'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'
  }
})

for _, lang in ipairs({ 'typescript', 'javascript' }) do
  dap.configurations[lang] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch file',
      program = '${file}',
      cwd = '${workspaceFolder}',
      skipFiles = { '<node_internals>/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
      sourceMaps = true,
      resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
      runtimeExecutable = 'ts-node'
    }, {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach',
      processId = require'dap.utils'.pick_process,
      cwd = '${workspaceFolder}',
      skipFiles = { '<node_internals>/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
      sourceMaps = true,
      resolveSourceMapLocations = { '${workspaceFolder}/dist/**/*.js' },
      runtimeExecutable = 'ts-node'
    }
  }
end

-- for _, lang in ipairs({ 'typescriptreact', 'javascriptreact' }) do
--   dap.configurations[lang] = {
--     {
--       type = 'pwa-chrome',
--       request = 'launch',
--       name = 'Launch file',
--       program = '${file}',
--       cwd = '${workspaceFolder}',
--     }, {
--       type = 'pwa-chrome',
--       request = 'attach',
--       name = 'Attach',
--       processId = require'dap.utils'.pick_process,
--       cwd = '${workspaceFolder}',
--     }
--   }
-- end
