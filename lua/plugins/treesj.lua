---@type LazySpec
local M = {
  'Wansmer/treesj',
  keys = {
    {
      '<leader>j',
      function()
        require('treesj').toggle()
      end,
      desc = 'Toggle (TreeSJ)',
    },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}

return M
