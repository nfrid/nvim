---@type LazySpec
local M = {
  'junegunn/vim-easy-align',
}

M.init = function()
  local mx = require('mapx')
  mx.xnoremap('gA', '<Plug>(EasyAlign)', 'align')
  mx.xnoremap('A', '<Plug>(EasyAlign)', 'align')
end

return M
