---@type LazySpec
local M = {
  'folke/zen-mode.nvim',
  dependencies = { 'andrewferrier/wrapping.nvim' },
  opts = {
    window = {
      width = 80,
    },
    on_open = function()
      require('wrapping').soft_wrap_mode()
    end,
  },
  cmd = { 'ZenMode' },
}

return M
