---@type LazySpec
local M = {
  'danielfalk/smart-open.nvim',
  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-fzy-native.nvim',
  },
  keys = {
    { '<leader>k', '<cmd>Telescope smart_open<cr>', desc = 'Smart Open' },
  },
}

M.config = function()
  require('telescope').load_extension('smart_open')
end

return M
