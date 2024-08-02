---@type LazySpec
local M = {
  'junegunn/vim-easy-align',
  keys = {
    {
      'gA',
      '<Plug>(EasyAlign)',
      'align',
      mode = 'x',
    },
    {
      'A',
      '<Plug>(EasyAlign)',
      'align',
      mode = 'x',
    },
  },
}

return M
