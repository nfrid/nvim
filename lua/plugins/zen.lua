---@type LazySpec
local M = {
  'folke/zen-mode.nvim',
  dependencies = { 'andrewferrier/wrapping.nvim', 'folke/twilight.nvim' },
  opts = {
    on_open = function()
      require('wrapping').soft_wrap_mode()
    end,
    plugins = {
      options = {
        laststatus = 0,
      },
      kitty = {
        enabled = true,
        font = '+4', -- font size increment
      },
    },
  },
  cmd = { 'ZenMode', 'Twilight' },
  keys = {
    { '<leader>zz', '<Cmd>ZenMode<CR>',  mode = { 'n' }, desc = 'Zen Mode' },
    { '<leader>zt', '<Cmd>Twilight<CR>', mode = { 'n' }, desc = 'Twilight' },
  },
}

return M
