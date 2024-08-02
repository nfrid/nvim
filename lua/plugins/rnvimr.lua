---@type LazySpec
local M = {
  'kevinhwang91/rnvimr',
  cmd = { 'RnvimrToggle' },
  enabled = false,
  keys = {
    {
      '<leader>fd',
      '<cmd>RnvimrToggle<cr>',
      'ranger',
    },
  },
}

M.init = function()
  vim.g.rnvimr_enable_ex = 1
  vim.g.rnvimr_enable_picker = 1
end

return M
