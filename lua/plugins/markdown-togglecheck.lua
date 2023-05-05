---@type LazySpec
local M = {
  'nfrid/markdown-togglecheck',
  dev = true,
  ft = { 'markdown' },
}

M.config = function()
  local p = require('markdown-togglecheck')
  local mx = require('mapx')

  mx.nnoremap('<leader>nn', p.toggle, 'Toggle Checkmark')
  mx.nnoremap('<leader>nN', p.toggle_box, 'Toggle Checkmark')
end

return M
