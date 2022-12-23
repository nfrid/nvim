---@type LazySpec
local M = {
  'mbbill/undotree',
  cmd = { 'UndotreeToggle' },
}

M.init = function()
  local mx = require('mapx')
  mx.nnoremap('<leader>u', '<cmd>UndotreeToggle<cr>')
end

return M
