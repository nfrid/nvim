---@type LazySpec
local M = {
  'smjonas/live-command.nvim',
  lazy = false,
}

M.config = function()
  require('live-command').setup({
    commands = {
      R = { cmd = 'norm' },
      Norm = { cmd = 'norm' },
    },
  })

  vim.cmd('cabbrev N Norm')
end

return M
