---@type LazySpec
local M = {
  'RRethy/vim-illuminate',
  lazy = false,
  keys = {
    {
      '<leader>vi',
      function()
        require('illuminate').toggle()
      end,
      'Illuminate',
    },
  },
}

return M
