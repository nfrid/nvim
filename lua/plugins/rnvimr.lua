---@type LazySpec
local M = {
  'kevinhwang91/rnvimr',
  cmd = { 'RnvimrToggle' },
}

M.init = function()
  local mx = require('mapx')
  mx.nnoremap('<leader>fd', '<cmd>RnvimrToggle<cr>', 'ranger')
  vim.g.rnvimr_enable_ex = 1
  vim.g.rnvimr_enable_picker = 1
end

return M
